#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
用 Governatori 的 DDL 引擎（clingo）在 civil_rules.lp 上跑 cases.json，核对预期结论并给出推理链。

  python3 run_cases.py              # 全部
  python3 run_cases.py suc-2 -v     # 单个案例 + 推理链

预期写法：p(a)  须可废止地成立（+∂p）； -p(a)  须证得 ¬p； !p(a)  不得成立；
          O p(a) / O -p(a) 义务（-p 即禁止）； P p(a) 许可；前面加 ! 表示不得成立
需要：pip install clingo；./fetch_ddl.sh
"""
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from paths import CASES, ENGINE, RULES_LP  # noqa: E402
try:
    import clingo
except ImportError:
    sys.exit('需要 clingo：pip install clingo')
import formal_rules as FR  # noqa: E402

RULES = {r['key']: r for _, rs in FR.MODULES.values() for r in rs}


def to_asp(lit):
    lit = lit.strip()
    return f'non({lit[1:]})' if lit.startswith('-') else lit


def solve(facts, lp=None):
    ctl = clingo.Control(['--warn=none'])
    for f in ['language.asp', 'Deontic/defeasible-ab.asp', 'Deontic/deontic.asp']:
        ctl.load(str(ENGINE / f))
    ctl.load(str(lp or RULES_LP))
    ctl.add('base', [], '\n'.join(f'fact({to_asp(f)}).' for f in facts)
            + '\n#show defeasible/1. #show obligation/1. #show permission/1. #show applicable/2. #show superior/2.')
    ctl.ground([('base', [])])
    syms = []
    with ctl.solve(yield_=True) as h:
        for m in h:
            syms = list(m.symbols(shown=True))
    sup = {(str(s.arguments[0]), str(s.arguments[1])) for s in syms if s.name == 'superior'}
    apps = [s for s in syms if s.name == 'applicable']
    comp = lambda h: h[4:-1] if h.startswith('non(') else f'non({h})'
    by_head = {}
    for s in apps:
        by_head.setdefault(str(s.arguments[1]), []).append(str(s.arguments[0]))
    # 只保留未被“可适用且更强的对立规则”击败的实例（即实际胜出的规则）
    win = [s for s in apps if not any((o, str(s.arguments[0])) in sup for o in by_head.get(comp(str(s.arguments[1])), []))]
    return {str(s) for s in syms}, win


def holds(model, exp):
    neg = exp.startswith('!')
    e = exp[1:] if neg else exp
    if e.startswith('O '):
        q = f'obligation({to_asp(e[2:])})'
    elif e.startswith('P '):
        q = f'permission({to_asp(e[2:])})'
    else:
        q = f'defeasible({to_asp(e)})'
    q = q.replace(' ', '')
    return (q not in model) if neg else (q in model), q


# —— 推理链：由规则实例标签里的变量绑定把规则体精确实例化，再递归 ——
def _alts(item):
    if isinstance(item, tuple):
        return [a.split(' ') for a in item[1]]
    return [[item]]


def disjuncts(body):
    out = [[]]
    for item in body:
        out = [x + y for x in out for y in _alts(item)]
    return out


def _vars(lit):
    m = re.match(r'[-~]?\w+\((.*)\)$', lit)
    return [a.strip() for a in m.group(1).split(',')] if m else []


def ground(lit, b):
    sign = lit[0] if lit[0] in '-~' else ''
    m = re.match(r'[-~]?(\w+)\((.*)\)$', lit)
    args = [b.get(a.strip(), a.strip()) for a in m.group(2).split(',')]
    a = f'{m.group(1)}({",".join(args)})'
    return sign, a


def explain(model, apps, concl, facts, depth=0, seen=None):
    seen = set() if seen is None else seen
    kind, inner = re.match(r'(\w+)\((.*)\)$', concl).groups()
    fs = {to_asp(f).replace(' ', '') for f in facts}
    pad = '  ' * depth
    if inner in fs:
        return [f'{pad}· {inner}  〔案件事实〕']
    if concl in seen or depth > 8:
        return []
    seen.add(concl)
    rank = lambda ap: RULES.get(ap.arguments[0].arguments[0].string, {}).get('auth') != 'npc'  # 优先展示条文明文规则
    for ap in sorted(apps, key=rank):
        lab, head = ap.arguments
        if str(head) != inner:
            continue
        key = lab.arguments[0].string
        if key not in RULES:
            if key.startswith('tx-'):
                return [f'{pad}· {inner}  ⇐ 分类 {key}（图的层级）']
            continue
        r = RULES[key]
        j = lab.arguments[1].number
        conj = disjuncts(r['body'])[j]
        pos = [l for l in conj if not l.startswith('~')]
        vs = sorted({v for l in pos for v in _vars(l) if re.fullmatch(r'[A-Z]\w*', v)})
        vals = lab.arguments[-1].arguments if vs else []
        b = {v: str(x) for v, x in zip(vs, vals)}
        prem = [ground(l, b) for l in pos]
        if lab.name == 'x':
            k = lab.arguments[3].number
            nafs = [l for l in conj if l.startswith('~')]
            prem.append(ground(nafs[k][1:], b))
            tag = f'例外（“{ZH(nafs[k][1:])}”成立，排除 {key}）'
        else:
            tag = '规则'
        lines = [f'{pad}· {inner}  ⇐ {tag} {key}（{"、".join(r["srcs"])}）{r["note"][:36]}']
        for sign, a in prem:
            sub = f'defeasible(non({a}))' if sign == '-' else f'defeasible({a})'
            lines += explain(model, apps, sub, facts, depth + 1, seen)
        return lines
    return [f'{pad}· {inner}']


def ZH(lit):
    return FR.ZH.get(re.match(r'(\w+)', lit).group(1), lit)


def main(cases_path=None, lp=None):
    args = [a for a in sys.argv[1:] if not a.startswith('-') and not a.endswith('.json')]
    verbose = '-v' in sys.argv
    cases_path = cases_path or next((Path(a) for a in sys.argv[1:] if a.endswith('.json')), CASES)
    cases = json.loads(Path(cases_path).read_text(encoding='utf-8'))
    if args:
        cases = [c for c in cases if c['id'] in args]
    npass = nexp = 0
    fails = []
    for c in cases:
        model, apps = solve(c['facts'], lp)
        ok_all = True
        out = []
        for e in c['expect']:
            ok, q = holds(model, e)
            nexp += 1
            npass += ok
            ok_all &= ok
            out.append(f'    {"✓" if ok else "✗"} {e}')
            if verbose and ok and not e.startswith('!'):
                out += ['      ' + l for l in explain(model, apps, q, c['facts'])]
        print(f'{"PASS" if ok_all else "FAIL"}  {c["id"]:8s} {c["title"]}')
        if verbose or not ok_all:
            print('\n'.join(out))
        if not ok_all:
            fails.append(c['id'])
    print(f'\n案例 {len(cases)} 个，预期结论 {nexp} 条，通过 {npass} 条；失败案例：{fails or "无"}')
    return 0 if not fails else 1


if __name__ == '__main__':
    sys.exit(main())
