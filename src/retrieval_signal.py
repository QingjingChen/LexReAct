#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
推理引擎能否改进检索？离线比较两种“检索信号”，用 LEGO 存档的 top-8 检索结果作基线，用金标解析引用的民法典条文评估召回：
  S  结构信号：沿规则结构扩展已检索法条（上游概念定义、Override 例外关系、竞争规则），不调用 LLM
  F  事实信号：LLM 按全部规则模块的谓词表抽取事实 → 被事实触发的规则（见 fact_triggered：命中≥2 个且过半条件，
              或命中一个区分度高的条件；可多跳）→ 补入这些规则的法条（每题最多 4 条）
  python3 retrieval_signal.py [--n-ctrl 18]
"""
import argparse, json, random, re, sys, glob, collections
from pathlib import Path
import pandas as pd
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from paths import ARCHIVE, RESULTS, bench_xlsx  # noqa: E402
import formal_rules as FR, demo_lego as DL, extract_loop as EL
from graph_parse import cites_of
from llm_client import chat, extract_json

RULES = [r for _, rs in FR.MODULES.values() for r in rs]
art = lambda s: int(re.match(r'art(\d+)', s).group(1))
RA = {r['key']: {art(s) for s in r['srcs']} for r in RULES}
COVERED = set().union(*RA.values())
def bpreds(r): return [p for p, _ in DL.preds([b for b in r['body'] if not (isinstance(b, str) and b.startswith('~'))])]
def hpreds(r): return {re.match(r'-?(\w+)', h if isinstance(h, str) else h[3]).group(1) for h in r['heads']}
PROD = collections.defaultdict(set)
for r in RULES:
    for p in hpreds(r): PROD[p].add(r['key'])
OV = collections.defaultdict(set)
for o, u, _ in FR.OVERRIDES: OV[o].add(u); OV[u].add(o)

def structural(R):
    E = set()
    for r in RULES:
        if RA[r['key']] & R:
            for p in DL.preds(r['body']):
                for k in PROD[p[0]]: E |= RA[k]
            for k in OV[r['key']]: E |= RA[k]
    return E - R

USAGE = collections.Counter(p for r in RULES for p in set(bpreds(r)))


def fact_triggered(facts, R, cap=4, distinct=3):
    """事实 → 被触发的规则 → 法条。触发：命中至少 2 个条件且占一半以上，或命中一个区分度高的条件
    （全部规则中至多 distinct 条用到的谓词，如 under8）。被触发规则的结论视为“可能成立”，再触发下游规则（至多 3 跳）。"""
    have = {re.match(r'-?(\w+)', f).group(1) for f in facts}
    fired = {}
    for _ in range(3):
        for r in RULES:
            ps = set(bpreds(r)); hit = ps & have
            if not hit:
                continue
            strong = any(USAGE[p] <= distinct for p in hit)
            if (len(hit) >= 2 and len(hit) / len(ps) >= 0.5) or strong:
                fired[r['key']] = max(fired.get(r['key'], 0), len(hit) / len(ps) + (0.5 if strong else 0))
                have |= hpreds(r)
    E = []
    for k, _ in sorted(fired.items(), key=lambda x: -x[1]):
        for a in sorted(RA[k]):
            if a not in R and a not in E:
                E.append(a)
    return set(E[:cap])


def main():
    ap = argparse.ArgumentParser(); ap.add_argument('--n-ctrl', type=int, default=18); ap.add_argument('--model', default='qwen3.5-35b-a3b')
    a = ap.parse_args()
    lego = {json.loads(l)['qid']: json.loads(l) for l in open(ARCHIVE, encoding='utf-8')}
    df = pd.read_excel(bench_xlsx())
    rows = []
    for q, r in lego.items():
        gold = {c['art'] for c in cites_of(str(df.iloc[q]['解析'])) if c['law'] == 'civil-code'} & COVERED
        R = set(r['provided_article_nos'])
        if gold and R & COVERED: rows.append((q, gold, R, r))
    miss = [x for x in rows if not x[1] <= x[2]]
    full = [x for x in rows if x[1] <= x[2]]
    random.seed(0); ctrl = random.sample(full, min(a.n_ctrl, len(full)))
    voc = DL.vocab(list(FR.MODULES))
    vtxt = EL.vocab_text(voc, list(FR.MODULES), False)
    res = {'miss': [], 'ctrl': []}
    for grp, items in (('miss', miss), ('ctrl', ctrl)):
        for q, gold, R, r in items:
            case = r['user'].split('【案情】', 1)[1].split('【问题/选项】', 1)[0].strip()
            raw = chat(DL.EXTRACT.format(vocab=vtxt, case=case), model=a.model, seed=7, max_tokens=1500)
            try:
                ext = extract_json(raw)
            except ValueError:  # 截断：回收已完整写出的事实
                ext = {'facts': re.findall(r'"(-?\w+\([^"()]*\))"', raw)}
            facts, _ = EL.validate(ext.get('facts', []), voc)
            S, F = structural(R), fact_triggered(facts, R)
            res[grp].append(dict(q=q, gold=sorted(gold), miss=sorted(gold - R), S=sorted(S), F=sorted(F),
                                 S_fix=sorted((gold - R) & S), F_fix=sorted((gold - R) & F), facts=facts))
            x = res[grp][-1]
            print(f"[{grp}] Q{q} 漏{x['miss']} | 结构信号补回{x['S_fix']}（新增{len(S)}条） | 事实信号补回{x['F_fix']}（新增{len(F)}条：{x['F']}）")
    def summ(grp, key):
        xs = res[grp]; add = sum(len(x[key]) for x in xs)
        good = sum(len(set(x[key]) & set(x['gold'])) for x in xs)
        return add, good
    m = res['miss']
    for key, name in (('S', '结构信号'), ('F', '事实信号'), ('SF', '两者合并')):
        if key == 'SF':
            for x in m + res['ctrl']: x['SF'] = sorted(set(x['S']) | set(x['F'])); x['SF_fix'] = sorted(set(x['S_fix']) | set(x['F_fix']))
        fixed = sum(set(x['miss']) <= set(x[key + '_fix']) for x in m)
        recovered = sum(len(x[key + '_fix']) for x in m); total = sum(len(x['miss']) for x in m)
        add_m, _ = summ('miss', key); add_c, good_c = summ('ctrl', key)
        print(f'{name}：漏检题补全 {fixed}/{len(m)}，漏检条文找回 {recovered}/{total}；平均新增 漏检组 {add_m/len(m):.1f} 条、对照组 {add_c/len(res["ctrl"]):.1f} 条')
    (RESULTS / 'retrieval_signal_results.json').write_text(json.dumps(res, ensure_ascii=False, indent=1), encoding='utf-8')

if __name__ == '__main__':
    main()
