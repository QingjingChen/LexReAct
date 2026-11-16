#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
LegalRuleML（civil_graph.lrml）→ Defeasible Deontic Logic 的 ASP 编码（Governatori 的 clingo 实现，见 fetch_ddl.sh）。
思路与 Governatori, Palmirani & Asif (NLL2FR 2025) “From LegalRuleML to DDL” 相同：直接读 LegalRuleML，而不是读 Python 简写。

映射
  ConstitutiveStatement           → constitutiveRule(L, h)            （结论为 h 或 non(h)）
  Obligation p / Prohibition p    → prescriptiveRule(L, p) / prescriptiveRule(L, non(p))
  Permission p                    → permissiveRule(L, p)
  Right p                         → constitutiveRule(L, p)            （权利作为可被例外否定的法律地位，而非许可）
  ruleml:Neg p                    → non(p)
  ruleml:Or                       → 每个析取支一条规则
  ruleml:Naf q（“除非 q”）         → 例外规则 L': 体 ∧ q ⇒ 对立结论，superior(L', L)；
                                     且其他推出同一结论的规则优先于 L'（Naf 只阻断宿主规则，不独立证立 ¬h）
                                     （构成性 h ↦ non(h)；义务 p ↦ 许可 non(p)；禁止 ↦ 许可 p；许可 p ↦ 义务 non(p)）
  Override(over, under)           → superior(over 的各实例, under 的各实例)
  Strict / Defeasible             → 均为可废止规则（DDL 的 ASP 实现目前只支持可废止规则）

变量：DDL 实现处理的是基项规则，这里不预先展开，而是生成带变量的 ASP 规则，由 clingo 在 cand/1（可能成立的原子）上实例化：
  inst(L) :- cand(体中正文字的原子…)      cand(h) :- inst(L)      cand(A) :- fact(A) / fact(non(A))
用法：python3 lrml2ddl.py [--no-taxonomy] > civil_rules.lp
"""
import argparse
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from paths import LRML_FULL, LRML_RULES, RULES_LP  # noqa: E402
L = '{http://docs.oasis-open.org/legalruleml/ns/v1.0/}'
R = '{http://ruleml.org/spec}'
DEON = {'Obligation': 'OBL', 'Prohibition': 'FOR', 'Permission': 'PERM', 'Right': 'RIGHT'}


def loc(e):
    return e.tag.split('}', 1)[1]


def const(s):
    return s if re.fullmatch(r'[a-z][A-Za-z0-9_]*', s) else '"' + s.replace('"', '\\"') + '"'


def atom(e):
    """ruleml:Atom → (asp 文本, 变量集合)"""
    pred = e.find(R + 'Rel').get('iri').split(':', 1)[1]
    args, vs = [], []
    for a in e:
        t = loc(a)
        if t == 'Var':
            args.append(a.text.strip())
            vs.append(a.text.strip())
        elif t in ('Ind', 'Data'):
            args.append(const(a.text.strip()))
    return (f'{pred}({",".join(args)})' if args else pred), vs


def dnf(e):
    """公式 → 析取范式：[[(kind, atom, vars)]]，kind ∈ pos / neg / naf"""
    t = loc(e)
    if t == 'Atom':
        a, v = atom(e)
        return [[('pos', a, v)]]
    if t == 'Neg':
        a, v = atom(e.find(R + 'Atom'))
        return [[('neg', a, v)]]
    if t == 'Naf':
        a, v = atom(e.find(R + 'Atom'))
        return [[('naf', a, v)]]
    if t == 'And':
        out = [[]]
        for c in e:
            if loc(c) == 'Comment':
                continue
            out = [x + y for x in out for y in dnf(c)]
        return out
    if t == 'Or':
        return [d for c in e for d in dnf(c)]
    raise ValueError(t)


def heads(then):
    out = []

    def walk(e):
        t = loc(e)
        if t in ('And', 'SuborderList'):
            for c in e:
                walk(c)
        elif t in DEON:
            a, v = atom(e.find(R + 'Atom'))
            out.append((DEON[t], a, v))
        elif t == 'Atom':
            a, v = atom(e)
            out.append(('C', a, v))
        elif t == 'Neg':
            a, v = atom(e.find(R + 'Atom'))
            out.append(('-C', a, v))
    for c in then:
        walk(c)
    return out


def main_head(kind, a):
    return {'C': ('constitutiveRule', a), '-C': ('constitutiveRule', f'non({a})'), 'RIGHT': ('constitutiveRule', a),
            'OBL': ('prescriptiveRule', a), 'FOR': ('prescriptiveRule', f'non({a})'), 'PERM': ('permissiveRule', a)}[kind]


def exception_head(kind, a):
    return {'C': ('constitutiveRule', f'non({a})'), '-C': ('constitutiveRule', a), 'RIGHT': ('constitutiveRule', f'non({a})'),
            'OBL': ('permissiveRule', f'non({a})'), 'FOR': ('permissiveRule', a), 'PERM': ('prescriptiveRule', f'non({a})')}[kind]


def load(path, taxonomy=True):
    root = ET.parse(path).getroot()
    rules, overrides = [], []
    for st in root.iter():
        t = loc(st)
        if t in ('ConstitutiveStatement', 'PrescriptiveStatement'):
            key = st.get('key')
            if key.startswith('tx-') and not taxonomy:
                continue
            rule = st.find(R + 'Rule')
            if rule is None:
                continue
            body = dnf([c for c in rule.find(R + 'if')][0])
            rules.append((key, body, heads(rule.find(R + 'then')), (st.find(L + 'Comment').text or '')))
        elif t == 'Override':
            overrides.append((st.get('over').lstrip('#'), st.get('under').lstrip('#')))
    return rules, overrides


def translate(rules, overrides):
    out = ['% 由 lrml2ddl.py 从 civil_graph.lrml 生成。配合 ddl_engine/language.asp + Deontic/defeasible-ab.asp + Deontic/deontic.asp 使用。',
           'isNon(non(A)) :- fact(non(A)).', 'cand(A) :- fact(A), not isNon(A).', 'cand(A) :- fact(non(A)).', 'atom(A) :- cand(A).', 'true.', '']
    labels = {}  # key → [label 模式]
    for key, body, hs, note in rules:
        q = '"' + key + '"'
        for j, conj in enumerate(body):
            pos = [x for x in conj if x[0] != 'naf']
            nafs = [x for x in conj if x[0] == 'naf']
            bound = {v for x in pos for v in x[2]}
            for i, (kind, a, hv) in enumerate(hs):
                if kind in ('-C',) and any(x[0] == 'pos' and x[1] == a for x in pos):
                    raise ValueError(f'{key}: 体中含有其所否定的结论 {a}（DDL 中构成循环，应改用底层事实）')
                free = (set(hv) | {v for x in nafs for v in x[2]}) - bound
                assert not free, f'{key}: 变量 {free} 未被正文字约束（不安全）'
                vs = sorted(bound)
                lab = f'r({q},{j},{i}' + (f',({",".join(vs)},)' if vs else '') + ')'
                labels.setdefault(key, []).append(lab)
                guard = ', '.join(f'cand({x[1]})' for x in pos) or 'true'
                out.append(f'% {key}[{j}.{i}] {note[:70]}')
                out.append(f'inst({lab}) :- {guard}.')
                typ, h = main_head(kind, a)
                out.append(f'{typ}({lab},{h}) :- inst({lab}).')
                out.append(f'mainHead({lab},{typ},{h}) :- inst({lab}).')
                out.append(f'cand({a}) :- inst({lab}).')
                for x in pos:
                    out.append(f'body({lab},{x[1] if x[0] == "pos" else "non(" + x[1] + ")"}) :- inst({lab}).')
                for k, (_, qa, _) in enumerate(nafs):
                    xl = f'x({q},{j},{i},{k}' + (f',({",".join(vs)},)' if vs else '') + ')'
                    labels.setdefault(key + '#exc', []).append(xl)
                    xt, xh = exception_head(kind, a)
                    out.append(f'inst({xl}) :- inst({lab}), cand({qa}).')
                    out.append(f'{xt}({xl},{xh}) :- inst({xl}).')
                    for x in pos:
                        out.append(f'body({xl},{x[1] if x[0] == "pos" else "non(" + x[1] + ")"}) :- inst({xl}).')
                    out.append(f'body({xl},{qa}) :- inst({xl}).')
                    out.append(f'superior({xl},{lab}) :- inst({xl}).')
                    out.append(f'exc({xl},{lab},{typ},{h}) :- inst({xl}).')
        out.append('')
    out.append('% —— Naf 的语义是“仅阻断宿主规则”：其他推出同一结论的规则实例优先于该例外 ——')
    out.append('superior(L2,XL) :- exc(XL,L,T,H), mainHead(L2,T,H), L2 != L.')
    out.append('% —— Override → superior ——')
    for o, u in overrides:
        for lo in labels.get(o, []):
            for lu in labels.get(u, []):
                out.append(f'superior({lo},{lu}) :- inst({lo}), inst({lu}).')
    return '\n'.join(out) + '\n'


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--lrml', default=str(LRML_FULL if LRML_FULL.exists() else LRML_RULES))
    ap.add_argument('--no-taxonomy', action='store_true')
    ap.add_argument('-o', '--out', default=str(RULES_LP))
    a = ap.parse_args()
    rules, ovs = load(a.lrml, taxonomy=not a.no_taxonomy)
    Path(a.out).write_text(translate(rules, ovs), encoding='utf-8')
    print(f'{len(rules)} 条 LegalRuleML 规则、{len(ovs)} 条 Override → {a.out}', file=sys.stderr)
