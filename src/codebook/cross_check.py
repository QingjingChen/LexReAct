#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
两版规则卡片草稿（如 qwen4-max 与 DeepSeek）由第三个模型（如 kimi-k3.1-pro）对照法条原文逐行核对，找出分歧与不确定之处，交专家判断。

  python src/codebook/cross_check.py --law civil --b deepseek-v4.1-flash-mb --model kimi-k3.1-pro
  python src/codebook/cross_check.py --law criminal --b deepseek-v4.1-flash-mb --model kimi-k3.1-pro

A 版：drafts/*.json（默认 qwen4-max 版）；B 版：drafts/<b>/*.json。两版的谓词名通常不同，所以比较的是各自的中文命题与自然语言版本。
输出：<codebook>/crosscheck/<law>_<A>_vs_<B>.json，每行：
  agreement（一致 / 基本一致 / 有分歧）、differences（分歧点、两版各自的处理、法条依据、判断：A对/B对/都对（表述不同）/都不对/不确定）、
  missing（两版都遗漏的法条内容）、preferred、expert_check（是否需专家核对）、expert_notes。
"""
import argparse
import collections
import json
import sys
import threading
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE), str(HERE.parent)]
import build_review_all as BR  # noqa: E402
import draft_llm as D  # noqa: E402
import llm_client as LLM  # noqa: E402

LOCK = threading.Lock()
FAILS = [0]       # 连续调用出错的行数；达到 5 行即停（额度用完或网关异常）
FIELD = dict(issue='争点', conditions='适用条件', exceptions='除外', effects='法律效果', priority='优先与例外', distinguish='区分')

SYSTEM = '你是中国民法、刑法方面的资深审校专家。你的任务是对照法条原文，核对同一张规则卡片的两个版本，找出分歧并判断对错。只输出一个 JSON 对象。'

TASK = """## 任务
下面是同一组法条的两个版本的规则卡片（A 版、B 版），均由模型起草，已通过语法与编译检查，但内容可能有错。
请以“法条原文”为唯一权威，逐点比较两版：适用条件、但书与例外、法律效果、规范类型（应当/不得/可以/享有权利）、承担主体与相对人、优先关系、
是否遗漏某一款或某一项、是否加入了法条没有的内容（学理内容是否已标明为学理）。两版用词、谓词名、拆分方式不同但含义相同的，不算分歧。

## 输出（JSON）
{
 "agreement": "一致" | "基本一致" | "有分歧",
 "differences": [{"point": "分歧点", "A": "A 版怎么处理", "B": "B 版怎么处理", "law": "所依据的法条原文（直接引用）",
                  "judgement": "A对" | "B对" | "都对（表述不同）" | "都不对" | "不确定", "reason": "简要理由"}],
 "missing": [{"content": "两版都遗漏或都写错的法条内容", "law": "法条原文"}],
 "preferred": "A" | "B" | "相当",
 "expert_check": true | false,
 "expert_notes": ["需要专家判断的具体问题，写清楚涉及的规则 key"]
}
判断有任何“都不对”“不确定”、missing 不为空、或涉及学说争议时，expert_check 必须为 true。只有一个版本时，B 版写“（未通过程序检查）”，请只核对 A 版是否忠实于法条。

## 法条原文
{law}

## A 版（{a_name}）
{a}

## B 版（{b_name}）
{b}
"""


def render(d, gloss):
    """草稿 → 可读文本（自然语言版本 + 中文命题 + 逻辑式）"""
    import expert_review as ER
    old = ER.GLOSS
    ER.GLOSS = {**gloss, **(d.get('predicates') or {})}
    try:
        nl = '\n'.join(f'【{FIELD[f]}】' + '；'.join(f'{it["text"]}[{"、".join(it.get("rules", []))}]' for it in d['nl'][f])
                       for f in FIELD if d['nl'].get(f))
        rules = [BR.draft_rule(r) for r in d['rules']]
        rs = '\n'.join(f'{r["key"]}（{"、".join(r["srcs"])}；{ER.AUTH.get(r["auth"], r["auth"])}）{ER.rule_sentence(r).replace(chr(10), " ")}\n    逻辑式：{ER.rule_formal(r)}'
                       for r in rules)
        ov = '\n'.join(f'优先：{o} ＞ {u}（{w}）' for o, u, w in d.get('overrides') or [])
    finally:
        ER.GLOSS = old
    return f'自然语言版本：\n{nl}\n\n形式化版本：\n{rs}' + (f'\n{ov}' if ov else '')


def load(dirpath):
    out = {}
    for f in sorted(dirpath.glob('*.json')) if dirpath.exists() else []:
        out.update(json.load(open(f, encoding='utf-8')))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--law', choices=['civil', 'criminal'], default='civil')
    ap.add_argument('--a', default='', help='A 版子目录（空 = drafts 根目录，即 qwen4-max 版）')
    ap.add_argument('--a-name', default='qwen4-max')
    ap.add_argument('--b', required=True, help='B 版子目录，如 deepseek-v4.1-flash-mb')
    ap.add_argument('--model', default='kimi-k3.1-pro')
    ap.add_argument('--workers', type=int, default=4)
    a = ap.parse_args()
    D.DOM.update(D.civil_domain() if a.law == 'civil' else D.criminal_domain())
    if a.law == 'criminal':
        import expert_review as ER
        ER.CONST = dict(D.DOM['consts'])
    base = D.DOM['drafts']
    A, Bv = load(base / a.a if a.a else base), load(base / a.b)
    gA = dict(D.DOM['gloss'])
    for d in A.values():
        gA.update(d.get('predicates') or {})
    gB = dict(D.DOM['gloss'])
    for d in Bv.values():
        gB.update(d.get('predicates') or {})
    rows = {r['id']: r for r in json.load(open(D.DOM['rows'], encoding='utf-8')) if not r['rules']}
    out_path = base.parent / 'crosscheck' / f'{a.law}_{a.a_name}_vs_{a.b}.json'
    out_path.parent.mkdir(parents=True, exist_ok=True)
    done = json.load(open(out_path, encoding='utf-8')) if out_path.exists() else {}

    def work(rid):
        if rid in done and done[rid].get('status') == 'ok':
            return
        if FAILS[0] >= 5:
            return
        row = rows[rid]
        da, db = A.get(rid, {}), Bv.get(rid, {})
        oka, okb = da.get('status') == 'ok', db.get('status') == 'ok'
        if not oka and not okb:
            res = dict(status='ok', agreement='两版均未通过程序检查', differences=[], missing=[], preferred='无', expert_check=True,
                       expert_notes=['两个模型的草稿都没有通过程序检查，需人工形式化'])
        else:
            law = '\n'.join(D.DOM['art_text'](x) for x in row['articles'])
            ta = render(da, gA) if oka else '（未通过程序检查）'
            tb = render(db, gB) if okb else '（未通过程序检查）'
            if not oka:          # 只有 B 版：交换位置，统一核对 A 版
                ta, tb = tb, ta
            p = TASK.replace('{law}', law).replace('{a_name}', a.a_name if oka else a.b).replace('{b_name}', a.b if oka else a.a_name) \
                    .replace('{a}', ta).replace('{b}', tb)
            try:
                raw = LLM.chat(p, model=a.model, system=SYSTEM, max_tokens=12000, temperature=0.0, seed=None, tag=f'xcheck:{a.law}')
                res = dict(status='ok', **LLM.extract_json(raw))
                res['a_name'], res['b_name'] = (a.a_name, a.b) if oka else (a.b, a.a_name)
                res['only_one'] = not (oka and okb)
            except Exception as e:  # noqa: BLE001
                res = dict(status='error', error=str(e)[:300])
        with LOCK:
            FAILS[0] = FAILS[0] + 1 if res['status'] == 'error' else 0
            if FAILS[0] == 5:
                print('连续 5 行调用失败（可能是额度用完或网关异常），停止。已完成的结果已保存，重跑即可续上。', file=sys.stderr, flush=True)
            done[rid] = res
            out_path.write_text(json.dumps(done, ensure_ascii=False, indent=1), encoding='utf-8')
            print(f'  {rid:12s} {res.get("agreement", res.get("error", ""))[:20]}｜需专家：{res.get("expert_check")}', file=sys.stderr, flush=True)
    ids = [rid for rid in rows if A.get(rid) or Bv.get(rid)]
    print(f'{a.law}：核对 {len(ids)} 行（A={a.a_name}，B={a.b}，核对模型 {a.model}）', file=sys.stderr, flush=True)
    with ThreadPoolExecutor(a.workers) as ex:
        list(ex.map(work, ids))
    c = collections.Counter(d.get('agreement') for d in done.values() if d.get('status') == 'ok')
    print(f'完成：{dict(c)}；需专家核对 {sum(1 for d in done.values() if d.get("expert_check"))} 行 → {out_path}')
    print('token 用量：' + json.dumps({k: v for k, v in LLM.usage_summary().items() if k == a.model}, ensure_ascii=False))


if __name__ == '__main__':
    main()
