#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
“核实后再补”的检索：事实信号只提出候选法条，经推理引擎生成核对问题、LLM 依原文核实后，
只有引擎确实能完整适用（且未被例外推翻）的规则，其法条才加入检索结果。

与 retrieval_signal.py 用同一批题（漏检组 18 + 对照组 18）和同一份事实抽取结果（results/retrieval_signal_results.json），
因此差异只来自“核实”这一步。

  python3 verified_retrieval.py [--model qwen3.5-35b-a3b] [--rounds 2]
"""
import argparse
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from paths import ARCHIVE, RESULTS  # noqa: E402
import demo_lego as DL  # noqa: E402
import extract_loop as EL  # noqa: E402
import formal_rules as FR  # noqa: E402
import retrieval_signal as RS  # noqa: E402
import run_cases as RC  # noqa: E402

RULE = {r['key']: r for r in RS.RULES}
VAR = re.compile(r'[A-Z]\w*')


def fired_rules(facts, R):
    """与 retrieval_signal.fact_triggered 相同的触发规则，但返回规则（而非法条），只保留会带来新法条的规则"""
    have = {re.match(r'-?(\w+)', f).group(1) for f in facts}
    fired = {}
    for _ in range(3):
        for r in RS.RULES:
            ps = set(RS.bpreds(r)); hit = ps & have
            if not hit:
                continue
            strong = any(RS.USAGE[p] <= 3 for p in hit)
            if (len(hit) >= 2 and len(hit) / len(ps) >= 0.5) or strong:
                fired[r['key']] = max(fired.get(r['key'], 0), len(hit) / len(ps) + (0.5 if strong else 0))
                have |= RS.hpreds(r)
    return sorted(fired, key=lambda k: -fired[k])


def gaps(rule, model, facts, voc, max_missing=2):
    """规则还缺哪些事实：正条件尽量与当前已成立的结论匹配，允许缺至多 max_missing 个；
    缺口须与已匹配部分共享变量（锚定）。缺口若是可推出的谓词（非事实谓词），交给上游规则去问。"""
    pos, neg = EL.parse_model(model)
    people = sorted({x for f in facts for _, _, a in [EL.lit(f.replace(' ', ''))] for x in a})
    out = {}
    for conj in RC.disjuncts(rule['body']):
        pl = [EL.lit(l) for l in conj if not l.startswith('~')]
        for nmiss in range(0, max_missing + 1):
            from itertools import combinations
            for skip in combinations(range(len(pl)), nmiss):
                order = [i for i in range(len(pl)) if i not in skip]
                if not order:
                    continue

                def match(k, b):
                    if k == len(order):
                        yield b
                        return
                    sign, p, args = pl[order[k]]
                    for q, vals in (neg if sign == '-' else pos):
                        if q != p or len(vals) != len(args):
                            continue
                        nb, ok = dict(b), True
                        for a, v in zip(args, vals):
                            if VAR.fullmatch(a):
                                if nb.setdefault(a, v) != v:
                                    ok = False
                                    break
                            elif a != v:
                                ok = False
                                break
                        if ok:
                            yield from match(k + 1, nb)
                for b in list(match(0, {}))[:20]:
                    for i in skip:
                        sign, p, args = pl[i]
                        if sign or p not in voc:
                            continue
                        free = sorted({x for x in EL.ground(args, b) if VAR.fullmatch(x)})
                        if len(free) > 1 or (free and len(free) == len({a for a in args if VAR.fullmatch(a)})):
                            continue
                        for c in ([None] if not free else people):
                            g = EL.ground(args, dict(b, **({free[0]: c} if free else {})))
                            if (p, g) not in pos:
                                out.setdefault((p, g), ('enabling', rule))
            if out:
                return out
    return out


def applicable_keys(apps):
    return {ap.arguments[0].arguments[0].string for ap in apps if ap.arguments[0].name == 'r'}


CONST = re.compile(r'-?\w+\(([a-z][A-Za-z0-9_]*)(,[a-z][A-Za-z0-9_]*)*\)')


def verify_question(q, R, facts, case, voc, model_name, rounds):
    facts = [f for f in facts if CONST.fullmatch(f.replace(' ', ''))]   # 个体名须为合法 ASP 常量（小写字母开头）
    cands = [k for k in fired_rules(facts, R) if RS.RA[k] - R]
    facts = list(facts)
    model, apps = RC.solve(facts)
    log, asked = [], set()
    for rnd in range(1, rounds + 1):
        qs = {}
        for k in cands:
            if k in applicable_keys(apps):
                continue
            for key, val in gaps(RULE[k], model, facts, voc).items():
                if key not in asked:
                    qs.setdefault(key, val)
        if not qs:
            break
        qs = dict(list(qs.items())[:20])
        asked |= set(qs)
        _, added, rejected = EL.ask(case, qs, model_name, 7)
        log.append(dict(round=rnd, n_questions=len(qs), questions=[f'{p}({",".join(g)})' for p, g in qs], added=added,
                        rejected=[r[0] for r in rejected]))
        if not added:
            break
        facts += [a for a in added if a not in facts and CONST.fullmatch(a)]
        model, apps = RC.solve(facts)
    ok = applicable_keys(apps)
    accepted = set()
    for k in cands:
        if k in ok:
            accepted |= RS.RA[k] - R
    return sorted(accepted), [k for k in cands if k in ok], log


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--model', default='qwen3.5-35b-a3b')
    ap.add_argument('--rounds', type=int, default=2)
    a = ap.parse_args()
    prev = json.loads((RESULTS / 'retrieval_signal_results.json').read_text(encoding='utf-8'))
    lego = {json.loads(l)['qid']: json.loads(l) for l in open(ARCHIVE, encoding='utf-8')}
    voc = DL.vocab(list(FR.MODULES))
    out = {}
    for grp in ('miss', 'ctrl'):
        out[grp] = []
        for x in prev[grp]:
            q = x['q']
            R = set(lego[q]['provided_article_nos'])
            case = lego[q]['user'].split('【案情】', 1)[1].split('【问题/选项】', 1)[0].strip()
            unver = sorted(RS.fact_triggered(x['facts'], R))
            V, keys, log = verify_question(q, R, x['facts'], case, voc, a.model, a.rounds)
            miss = set(x['miss'])
            rec = dict(q=q, gold=x['gold'], miss=sorted(miss), unverified=unver, verified=V, rules=keys, log=log,
                       unver_fix=sorted(miss & set(unver)), ver_fix=sorted(miss & set(V)))
            out[grp].append(rec)
            print(f"[{grp}] Q{q} 漏{rec['miss']} | 直接补：{unver}（找回{rec['unver_fix']}） | 核实后补：{V}（找回{rec['ver_fix']}）"
                  + ''.join(f"\n      第{l['round']}轮问{l['n_questions']}题，采纳{l['added']}" for l in log))
    print()
    for key, name in (('unverified', '直接补（上一轮）'), ('verified', '核实后再补')):
        m, c = out['miss'], out['ctrl']
        fixed = sum(bool(x['miss']) and set(x['miss']) <= set(x[key]) for x in m)
        rec = sum(len(set(x['miss']) & set(x[key])) for x in m); tot = sum(len(x['miss']) for x in m)
        add_m = sum(len(x[key]) for x in m) / len(m); add_c = sum(len(x[key]) for x in c) / len(c)
        allx = m + c
        added = sum(len(x[key]) for x in allx); good = sum(len(set(x[key]) & set(x['gold'])) for x in allx)
        print(f'{name}：漏检题补全 {fixed}/{len(m)}，漏检条文找回 {rec}/{tot}；平均新增 漏检组 {add_m:.1f}、对照组 {add_c:.1f} 条；'
              f'新增法条中属于金标的比例 {good}/{added}')
    (RESULTS / 'verified_retrieval_results.json').write_text(json.dumps(out, ensure_ascii=False, indent=1), encoding='utf-8')


if __name__ == '__main__':
    main()
