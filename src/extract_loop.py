#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
事实抽取能否借助推理引擎改进？单题对比三种抽取方式（同一 LLM、同一组随机种子）：

  A  只给谓词表（现有做法，同 demo_lego.py）
  B  A + 法条原文：每个谓词注明被哪条规则、哪条法条使用，并附所选模块的法条全文
  C  B + 推理信号回路：引擎先推理一次，找出
       · 待定例外：规则体的正文字都已成立，但其“除非……”条件尚未核实 → 该条件若成立会推翻结论
       · 差一步的规则：只差一个事实谓词就能适用的规则 → 该事实若成立会推出新结论
     逐条向 LLM 提出是/否问题，要求引用案情原文；引文必须真实出现在案情中才采纳，然后再推理（最多两轮）

  python3 extract_loop.py 214 [--seeds 7 11 23] [--model qwen3.5-35b-a3b]
"""
import argparse
import itertools
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import demo_lego as DL  # noqa: E402
import formal_rules as FR  # noqa: E402
import run_cases as RC  # noqa: E402
from civil_code import text_of  # noqa: E402
from llm_client import chat  # noqa: E402
from llm_client import extract_json as _extract_json  # noqa: E402


def extract_json(text):
    """先用原解析器；失败时（模型在字符串里写了未转义的引号/换行）退而逐条抢救
    {"id": .., "answer": .., "who": .., "quote": ..} 形式的条目。原本能解析的回复结果不变。"""
    try:
        return _extract_json(text)
    except Exception:  # noqa: BLE001
        pass
    t = text.split('```json', 1)[-1]
    items = []
    for blk in re.split(r'\{\s*"id"\s*:', t)[1:]:
        m = re.match(r'\s*"?(\d+)"?', blk)
        if not m:
            continue
        d = {'id': int(m.group(1))}
        for k in ('answer', 'who', 'option', 'covered'):
            mm = re.search(rf'"{k}"\s*:\s*"([^"\n]*)"', blk)
            if mm:
                d[k] = mm.group(1)
        mm = re.search(r'"quote"\s*:\s*"(.*?)"\s*(?:,\s*"\w+"\s*:|\}|\n)', blk, re.S)
        if mm:
            d['quote'] = mm.group(1)
        items.append(d)
    if not items:
        raise ValueError(f'unparseable JSON: {text[:200]}')
    key = re.search(r'"(\w+)"\s*:\s*\[', t)
    return {key.group(1) if key else 'answers': items}

from paths import ARCHIVE  # noqa: E402
RULES = {r['key']: r for _, rs in FR.MODULES.values() for r in rs}


def lbl(s):
    m = re.fullmatch(r'art(\d+)(?:-(\d+))?', s)
    return f'第{m.group(1)}条' + (f'第{m.group(2)}款' if m.group(2) else '')


def norm(s):
    return re.sub(r'[\s*>＜<“”"「」]', '', s)


# ───────────── 事实校验
def validate(raw, voc):
    ok, bad = [], []
    for f in raw:
        f = f.replace(' ', '')
        m = re.fullmatch(r'-?(\w+)\((.*)\)', f)
        good = m and m.group(1) in voc and len(m.group(2).split(',')) == len(voc[m.group(1)]) \
            and not re.search(r'\b(none|null|unknown)\b', m.group(2))
        (ok if good else bad).append(f)
    return list(dict.fromkeys(ok)), bad


# ───────────── 提示
def vocab_text(voc, mods, with_law):
    uses = {}
    for m in mods:
        for r in FR.MODULES[m][1]:
            for p, _ in DL.preds(r['body']):
                uses.setdefault(p, []).append(r)
    lines = []
    for p, a in sorted(voc.items()):
        s = f'- {p}({",".join(a)})：{FR.ZH.get(p, "")}［' + '，'.join(f'{v}={DL.ROLE.get(v, v)}' for v in a) + '］'
        if with_law:
            rs = uses.get(p, [])[:2]
            s += '  ← ' + '；'.join(f'{r["key"]}（{"、".join(lbl(x) for x in r["srcs"])}：{r["note"][:30]}）' for r in rs)
        lines.append(s)
    return '\n'.join(lines)


def law_text(mods):
    srcs = sorted({s for m in mods for r in FR.MODULES[m][1] for s in r['srcs']},
                  key=lambda s: [int(x) for x in re.findall(r'\d+', s)])
    return '\n'.join(f'{lbl(s)}：{text_of(s)}' for s in srcs)


EXTRACT_LAW = DL.EXTRACT.replace('谓词表（名称/参数个数：含义）：\n{vocab}', '谓词表（← 后为使用该谓词的规则与法条）：\n{vocab}\n\n相关法条原文：\n{law}')

VERIFY = """下面是一个案情，以及推理引擎提出的若干核对问题。每个问题询问某个事实是否成立；说明中给出了它在法条中的作用。
请只依据案情原文回答，不要被题干中的修辞或选项诱导。回答 yes 时必须给出能直接支持该事实的案情原文片段（逐字摘录）；
案情没有写明的，回答 no。

【案情】
{case}

【核对问题】
{qs}

输出 JSON：{{"answers": [{{"id": 1, "answer": "yes" 或 "no", "quote": "案情原文片段（answer 为 no 时留空）"}}, ...]}}"""


# ───────────── 推理信号
def parse_model(model):
    pos, neg = set(), set()
    for s in model:
        m = re.fullmatch(r'defeasible\((non\()?(\w+)\((.*?)\)\)?\)', s)
        if m:
            (neg if m.group(1) else pos).add((m.group(2), tuple(a.strip() for a in m.group(3).split(','))))
    return pos, neg


def lit(l):
    sign = l[0] if l[0] in '-~' else ''
    m = re.fullmatch(r'[-~]?(\w+)\((.*)\)', l)
    return sign, m.group(1), [a.strip() for a in m.group(2).split(',')]


def ground(args, b):
    return tuple(b.get(a, a) if re.fullmatch(r'[A-Z]\w*', a) else a for a in args)


def signals(model, facts, mods, voc):
    pos, neg = parse_model(model)
    people = sorted({x for f in facts for _, _, a in [lit(f.replace(' ', ''))] for x in a})  # 案情中已出现的个体，用来补全未绑定的变量
    known = {(p, tuple(a)) for f in facts for _, p, a in [lit(f.replace(' ', ''))]}
    qs = {}
    for m in mods:
        for r in FR.MODULES[m][1]:
            for conj in RC.disjuncts(r['body']):
                plits = [lit(l) for l in conj if not l.startswith('~')]
                nafs = [lit(l) for l in conj if l.startswith('~')]
                for skip in [None] + list(range(len(plits))):
                    order = [i for i in range(len(plits)) if i != skip]

                    def match(k, b):
                        if k == len(order):
                            yield b
                            return
                        sign, p, args = plits[order[k]]
                        pool = neg if sign == '-' else pos
                        for (q, vals) in pool:
                            if q != p or len(vals) != len(args):
                                continue
                            nb, ok = dict(b), True
                            for a, v in zip(args, vals):
                                if re.fullmatch(r'[A-Z]\w*', a):
                                    if nb.setdefault(a, v) != v:
                                        ok = False
                                        break
                                elif a != v:
                                    ok = False
                                    break
                            if ok:
                                yield from match(k + 1, nb)
                    for b in itertools.islice(match(0, {}), 50):
                        if skip is None:   # 规则可适用：未核实的例外条件
                            for _, p, args in nafs:
                                g = ground(args, b)
                                if p in voc and all(not re.fullmatch(r'[A-Z]\w*', x) for x in g) and (p, g) not in pos and (p, g) not in known:
                                    qs.setdefault((p, g), ('exception', r))
                        else:              # 差一步：缺的那个事实（未绑定的变量用案情中出现过的个体逐一代入）
                            sign, p, args = plits[skip]
                            if sign or p not in voc:
                                continue
                            free = sorted({x for x in ground(args, b) if re.fullmatch(r'[A-Z]\w*', x)})
                            # 只问“锚定”的缺口：缺失事实至少有一个参数与已成立的条件共享（如同一事件），否则不提问
                            if len(free) > 1 or len(free) == len({a for a in args if re.fullmatch(r'[A-Z]\w*', a)}):
                                continue
                            for cand in ([None] if not free else people):
                                g = ground(args, dict(b, **({free[0]: cand} if free else {})))
                                if (p, g) not in pos and (p, g) not in known:
                                    qs.setdefault((p, g), ('enabling', r))
    return qs


def head_text(r):
    h = r['heads'][0]
    h = h[3] if isinstance(h, tuple) else h
    return FR.ZH.get(re.match(r'-?(\w+)', h).group(1), h) + ('（否定）' if isinstance(r['heads'][0], str) and r['heads'][0].startswith('-') else '')


def ask(case, qs, model, seed):
    items = list(qs.items())
    lines = []
    for i, ((p, g), (kind, r)) in enumerate(items, 1):
        role = '例外条件：若成立，将排除' if kind == 'exception' else '前提条件：若成立，将推出'
        lines.append(f'{i}. 事实 {p}({",".join(g)})：{FR.ZH.get(p, p)}\n   {role}「{head_text(r)}」——规则 {r["key"]}，'
                     f'{"、".join(lbl(s) for s in r["srcs"])}：{text_of(r["srcs"][0])[:90]}')
    out = extract_json(chat(VERIFY.format(case=case, qs='\n'.join(lines)), model=model, seed=seed, max_tokens=1200))
    added, rejected = [], []
    for a in out.get('answers', []):
        i = int(a.get('id', 0)) - 1
        if not 0 <= i < len(items) or str(a.get('answer')).lower() != 'yes':
            continue
        (p, g), _ = items[i]
        q = norm(a.get('quote', ''))
        if len(q) >= 4 and q in norm(case):
            added.append(f'{p}({",".join(g)})')
        else:
            rejected.append((f'{p}({",".join(g)})', a.get('quote', '')))
    return lines, added, rejected


# ───────────── 主流程
def extract(case, voc, mods, model, seed, with_law):
    prompt = (EXTRACT_LAW.format(vocab=vocab_text(voc, mods, True), law=law_text(mods), case=case) if with_law
              else DL.EXTRACT.format(vocab=vocab_text(voc, mods, False), case=case))
    ext = extract_json(chat(prompt, model=model, seed=seed, max_tokens=700))
    facts, bad = validate(ext.get('facts', []), voc)
    return facts, bad


def conclusions(model, facts):
    fs = {RC.to_asp(f) for f in facts}
    return sorted(s for s in model if re.match(r'(defeasible|obligation|permission)\(', s) and s[s.index('(') + 1:-1] not in fs)


def _schools(pos):
    return {a[1] for p, a in pos if p == 'injuredAtSchool'}


GOLD = {  # 以结论结构判定（不依赖 LLM 起的个体名）；学校 = injuredAtSchool 的第 2 个参数
    214: [('校外第三人承担侵权责任', lambda pos, neg: any(p == 'liable' and a[0] not in _schools(pos) for p, a in pos)),
          ('教育机构承担补充责任', lambda pos, neg: any(p == 'supplementaryLiability' and a[0] in _schools(pos) for p, a in pos)),
          ('教育机构不承担直接责任', lambda pos, neg: bool(_schools(pos)) and not any(p == 'liable' and a[0] in _schools(pos) for p, a in pos))],
}


def score(qid, model):
    pos, neg = parse_model(model)
    return [(name, bool(f(pos, neg))) for name, f in GOLD[qid]]


def run(qid, seeds, model_name):
    rec = next(json.loads(l) for l in open(ARCHIVE, encoding='utf-8') if json.loads(l)['qid'] == qid)
    case = rec['user'].split('【案情】', 1)[1].split('【问题/选项】', 1)[0].strip()
    mods = DL.select_modules(rec['provided_article_nos'])
    voc = DL.vocab(mods)
    print(f'Q{qid}  规则模块 {mods}（事实谓词 {len(voc)} 个）  模型 {model_name}  种子 {seeds}\n')
    table = []
    for seed in seeds:
        for arm in 'ABC':
            facts, bad = extract(case, voc, mods, model_name, seed, with_law=(arm != 'A'))
            log = [f'  抽取 {facts}' + (f'  丢弃 {bad}' if bad else '')]
            model, _ = RC.solve(facts)
            if arm == 'C':
                for rnd in (1, 2):
                    qs = signals(model, facts, mods, voc)
                    if not qs:
                        break
                    lines, added, rejected = ask(case, qs, model_name, seed)
                    log.append(f'  第{rnd}轮核对 {len(qs)} 问：' + ' | '.join(l.split('\n')[0] for l in lines))
                    log.append(f'    采纳 {added}' + (f'；引文不符被拒 {rejected}' if rejected else ''))
                    if not added:
                        break
                    facts = facts + [a for a in added if a not in facts]
                    model, _ = RC.solve(facts)
            sc = score(qid, model)
            table.append((seed, arm, sc))
            print(f'[seed {seed}｜{arm}] ' + '  '.join(f'{"✓" if ok else "✗"}{n}' for n, ok in sc))
            print('\n'.join(log))
            print('  结论：' + '；'.join(c.replace('defeasible(', '').rstrip(')') for c in conclusions(model, facts)
                                      if re.search(r'liable|supplementary|noCapacity', c)))
            print()
    print('汇总（每格为满足的结论结构数 / 3）')
    for arm in 'ABC':
        row = [sum(ok for _, ok in sc) for s, a, sc in table if a == arm]
        print(f'  {arm}: {row}  全对 {sum(x == len(GOLD[qid]) for x in row)}/{len(row)}')


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('qid', type=int, nargs='?', default=214)
    ap.add_argument('--seeds', type=int, nargs='+', default=[7, 11, 23])
    ap.add_argument('--model', default='qwen3.5-35b-a3b')
    a = ap.parse_args()
    run(a.qid, a.seeds, a.model)
