#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
民法graph.markdown → civil_graph.lrml（OASIS LegalRuleML Core 1.0，compact 序列化）

两层：
  结构层（全图、自动）：
    · 图的层级 → 嵌套 <lrml:Statements>（编/章/节点），节点原文、Priority、考点标记写入 <lrml:Comment>
    · 笔记引用的法条 → <lrml:LegalSource>（《民法典》条文原文由程序逐字截取；其他法律只记名称和条号）
      并以 <lrml:Association appliesSource → toTarget 节点> 建立“节点—法条”关联
    · 分类树 → isA 构成性规则（仅保留父子概念中心词一致的边，如 用益物权 ⊑ 他物权）
  规则层（formal_rules.py，人工形式化）：
    · Constitutive / PrescriptiveStatement（Obligation / Prohibition / Permission / Right），挂在锚定的图节点之下
    · Naf（例外条件）、Neg（强否定）、Or；OverrideStatement（优先关系）
    · Association：规则 → 法条款项（appliesSource）、权威（appliesAuthority）、强度（appliesStrength）、施行时间

用法：python3 graph2lrml.py      （生成 + 原文核对 + 锚点检查 + XSD 校验）
"""
import json
import re
import sys
from collections import defaultdict
from pathlib import Path
from xml.sax.saxutils import escape

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import formal_rules as FR  # noqa: E402
from civil_code import articles, paragraphs, text_of  # noqa: E402
from graph_parse import parse  # noqa: E402

AKN = '/akn/cn/act/2020-05-28/civil-code/zho@/!main#art_{}'
from paths import KB, LRML_FULL as OUT, SCHEMA  # noqa: E402


# ───────────────────────── 图
def load_graph():
    nodes = parse()
    by = {n['id']: n for n in nodes}
    for n in nodes:
        n['depth'] = 0 if not n['parent'] else by[n['parent']]['depth'] + 1
    return nodes, by


def head_noun_ok(child, parent):
    return child != parent and child[-1] == parent[-1] and not parent.endswith(child)


def taxonomy(nodes, by):
    edges = []
    for n in nodes:
        pc = n['concept'] or n['classifier']
        if not pc or n['kind'] not in ('item', 'heading'):
            continue
        kids = [by[c] for c in n['children'] if by[c]['concept']]
        ok = [k for k in kids if head_noun_ok(k['concept'], pc)]
        if len(ok) >= 2 or (n['classifier'] and ok):
            edges += [(k['id'], k['concept'], n['id'], pc) for k in ok]
    seen, out = set(), []
    for e in edges:
        if (e[1], e[3]) not in seen:
            seen.add((e[1], e[3]))
            out.append(e)
    return out


def resolve_anchor(anchor, nodes, by):
    sec, kw = anchor
    roots = [n for n in nodes if n['kind'] in ('book', 'chapter') and sec in n['clean']]
    if not roots:
        return None
    best = None
    for root in roots:
        stack = [root['id']]
        while stack:
            nid = stack.pop()
            n = by[nid]
            if nid != root['id'] and kw in n['clean']:
                cand = (len(n['clean']) > 40, n['depth'], len(n['clean']), int(nid[1:]))  # 优先短的标题型节点
                if best is None or cand < best[0]:
                    best = (cand, nid)
            stack.extend(n['children'])
    return best[1] if best else root['id']


# ───────────────────────── XML 片段
def is_var(a):
    return re.fullmatch(r'[A-Z][A-Za-z0-9]*', a) is not None


def atom(lit):
    m = re.fullmatch(r'([A-Za-z][A-Za-z0-9]*)\((.*)\)', lit.strip())
    pred, args = m.group(1), [a.strip() for a in m.group(2).split(',') if a.strip()]
    inner = ''.join(f'<ruleml:Var>{a}</ruleml:Var>' if is_var(a) else f'<ruleml:Ind>{escape(a)}</ruleml:Ind>' for a in args)
    return f'<ruleml:Atom><ruleml:Rel iri="cnv:{pred}"/>{inner}</ruleml:Atom>'


def lit_xml(l):
    if isinstance(l, tuple):
        return '<ruleml:Or>' + ''.join(conj_xml(x.split(' ')) if ' ' in x else lit_xml(x) for x in l[1]) + '</ruleml:Or>'
    if l.startswith('~'):
        return f'<ruleml:Naf>{atom(l[1:])}</ruleml:Naf>'
    if l.startswith('-'):
        return f'<ruleml:Neg>{atom(l[1:])}</ruleml:Neg>'
    return atom(l)


def conj_xml(parts):
    return '<ruleml:And>' + ''.join(lit_xml(p) for p in parts) + '</ruleml:And>' if len(parts) > 1 else lit_xml(parts[0])


DEON = {'OBL': 'Obligation', 'FOR': 'Prohibition', 'PERM': 'Permission', 'RIGHT': 'Right'}


def head_xml(h, key, i, note):
    if isinstance(h, tuple):
        kind, bearer, aux, content = h
        slots = f'<ruleml:slot><lrml:Bearer/><ruleml:Var>{bearer}</ruleml:Var></ruleml:slot>'
        if aux:
            slots += f'<ruleml:slot><lrml:AuxiliaryParty/><ruleml:Var>{aux}</ruleml:Var></ruleml:slot>'
        tag = DEON[kind]
        para = f'<lrml:Paraphrase>{escape(note)}</lrml:Paraphrase>' if tag != 'Right' else ''
        return f'<lrml:{tag} key="{key}-h{i}">{para}{slots}{atom(content)}</lrml:{tag}>'
    return lit_xml(h)


def rule_xml(r, ind):
    deontic = any(isinstance(h, tuple) for h in r['heads'])
    tag = 'PrescriptiveStatement' if deontic else 'ConstitutiveStatement'
    b = conj_xml(r['body'])
    hs = [head_xml(h, r['key'], i, r['note']) for i, h in enumerate(r['heads'])]
    if deontic:
        h = '<lrml:SuborderList>' + ''.join(hs) + '</lrml:SuborderList>' if len(hs) == 1 else '<ruleml:And>' + ''.join(hs) + '</ruleml:And>'
    else:
        h = hs[0] if len(hs) == 1 else '<ruleml:And>' + ''.join(hs) + '</ruleml:And>'
    src = '、'.join(lbl(s) for s in r['srcs'])
    return (f'{ind}<lrml:{tag} key="{r["key"]}"><lrml:Comment>{escape(r["note"])}（{src}；{r["auth"]}）</lrml:Comment>'
            f'<ruleml:Rule closure="universal" key=":{r["key"]}"><ruleml:if>{b}</ruleml:if><ruleml:then>{h}</ruleml:then></ruleml:Rule></lrml:{tag}>')


def lbl(s):
    m = re.fullmatch(r'art(\d+)(?:-(\d+))?', s)
    return f'第{m.group(1)}条' + (f'第{m.group(2)}款' if m.group(2) else '')


def node_comment(n):
    meta = []
    if n['priority'] is not None:
        meta.append(f'P{n["priority"]}')
    if n['exams']:
        meta.append('考点 ' + ' '.join(n['exams']))
    if n['exception']:
        meta.append('例外信号')
    pre = f'[{"｜".join(meta)}] ' if meta else ''
    return f'<lrml:Comment>{escape(pre + n["text"])}</lrml:Comment>'


def tax_xml(edge, ind):
    cid, c, pid, p = edge
    k = f'tx-{cid}'
    return (f'{ind}<lrml:ConstitutiveStatement key="{k}"><lrml:Comment>分类（自动抽取自图的层级）：{escape(c)} ⊑ {escape(p)}</lrml:Comment>'
            f'<ruleml:Rule closure="universal" key=":{k}"><ruleml:if><ruleml:Atom><ruleml:Rel iri="cnv:isA"/><ruleml:Var>X</ruleml:Var>'
            f'<ruleml:Ind>{escape(c)}</ruleml:Ind></ruleml:Atom></ruleml:if><ruleml:then><ruleml:Atom><ruleml:Rel iri="cnv:isA"/>'
            f'<ruleml:Var>X</ruleml:Var><ruleml:Ind>{escape(p)}</ruleml:Ind></ruleml:Atom></ruleml:then></ruleml:Rule></lrml:ConstitutiveStatement>')


# ───────────────────────── 生成
def build():
    nodes, by = load_graph()
    arts = articles()
    rules = [dict(r, module=m) for m, (_, rs) in FR.MODULES.items() for r in rs]
    keys = [r['key'] for r in rules]
    dup = {k for k in keys if keys.count(k) > 1}
    assert not dup, f'规则 key 重复：{dup}'
    for o, u, _ in FR.OVERRIDES:
        assert o in keys and u in keys, f'优先关系引用了不存在的规则：{o} > {u}'

    # 锚点
    anchored, unresolved = defaultdict(list), []
    for r in rules:
        nid = resolve_anchor(r['anchor'], nodes, by)
        if nid is None:
            unresolved.append((r['key'], r['anchor']))
            nid = 'g0001'
        r['node'] = nid
        anchored[nid].append(r)
    tax = taxonomy(nodes, by)
    tax_by_parent = defaultdict(list)
    for e in tax:
        tax_by_parent[e[2]].append(e)

    # 法源
    src_keys = {}          # 'cc-art403' / 'cc-art403-1' / 'ol-003' → (sameAs, comment)
    node_src = defaultdict(set)
    other = {}
    for n in nodes:
        for c in n['cites']:
            if c['law'] == 'civil-code' and c['art'] in arts:
                k = f'cc-art{c["art"]}'
                src_keys.setdefault(k, (AKN.format(c['art']), f'《民法典》{arts[c["art"]]}'))
            elif c['law'] != 'civil-code':
                lk = (c['law'], c['art'])
                if lk not in other:
                    other[lk] = f'ol-{len(other) + 1:03d}'
                k = other[lk]
                src_keys.setdefault(k, (f'urn:lexgo:law:{c["law"]}:art{c["art"]}', f'《{c["law"]}》第{c["art"]}条（原文未收录，仅作出处标注）'))
            else:
                continue
            node_src[n['id']].add(k)
    for r in rules:
        for s in r['srcs']:
            m = re.fullmatch(r'art(\d+)(?:-(\d+))?', s)
            a, p = int(m.group(1)), m.group(2)
            k = f'cc-{s}'
            same = AKN.format(a) + (f'__para_{p}' if p else '')
            src_keys.setdefault(k, (same, f'《民法典》{lbl(s)}：{text_of(s)}'))

    out = ['<?xml version="1.0" encoding="UTF-8"?>',
           '<!-- 由 graph2lrml.py 从 民法graph.markdown 与 formal_rules.py 生成，请勿手改。',
           '     结构层：图的每个节点 = 嵌套的 lrml:Statements / lrml:FactualStatement（原文在 lrml:Comment）；isA 分类规则为自动抽取。',
           '     规则层：Constitutive/PrescriptiveStatement 为人工形式化，挂在锚定节点之下；可用 lrml2ddl.py 转为 Defeasible Deontic Logic（ASP）。 -->',
           '<lrml:LegalRuleML xmlns:lrml="http://docs.oasis-open.org/legalruleml/ns/v1.0/" xmlns:ruleml="http://ruleml.org/spec"'
           ' xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'
           ' xmlns:lrmlv="http://docs.oasis-open.org/legalruleml/ns/v1.0/metamodel#">',
           '  <lrml:Prefix key="cnv" refID="http://example.org/lexgo/civil-vocab#"/>',
           '  <lrml:LegalSources key="legal-sources">']
    for k in sorted(src_keys, key=lambda x: (x[:2], [int(t) if t.isdigit() else t for t in re.split(r'(\d+)', x)])):
        same, com = src_keys[k]
        out.append(f'    <lrml:LegalSource key="{k}" sameAs="{escape(same)}"><lrml:Comment>{escape(com)}</lrml:Comment></lrml:LegalSource>')
    out += ['  </lrml:LegalSources>',
            '  <lrml:Authorities key="authorities">',
            '    <lrml:Authority key="npc"><lrml:Comment>全国人民代表大会（《民法典》条文明文）</lrml:Comment></lrml:Authority>',
            '    <lrml:Authority key="spc"><lrml:Comment>最高人民法院（司法解释）</lrml:Comment></lrml:Authority>',
            '    <lrml:Authority key="doctrine"><lrml:Comment>学理通说 / 笔记归纳（非条文明文）</lrml:Comment></lrml:Authority>',
            '    <lrml:Authority key="graph"><lrml:Comment>民法graph.markdown 的层级结构（自动抽取）</lrml:Comment></lrml:Authority>',
            '  </lrml:Authorities>',
            '  <lrml:Times key="times"><ruleml:Time key=":t-2021-01-01"><ruleml:Data xsi:type="xs:dateTime">2021-01-01T00:00:00Z</ruleml:Data></ruleml:Time></lrml:Times>',
            '  <lrml:TemporalCharacteristics key="tb-cc"><lrml:TemporalCharacteristic><lrml:forStatus iri="lrmlv:Efficacious"/>'
            '<lrml:hasStatusDevelopment iri="lrmlv:Starts"/><lrml:atTime keyref="#t-2021-01-01"/></lrml:TemporalCharacteristic></lrml:TemporalCharacteristics>',
            '  <lrml:Associations key="associations">']
    for nid in sorted(node_src):
        for k in sorted(node_src[nid]):
            out.append(f'    <lrml:Association><lrml:appliesSource keyref="#{k}"/><lrml:toTarget keyref="#{nid}"/></lrml:Association>')
    for r in rules:
        out.append(f'    <lrml:Association>' + ''.join(f'<lrml:appliesSource keyref="#cc-{s}"/>' for s in r['srcs'])
                   + f'<lrml:appliesAuthority keyref="#{r["auth"]}"/><lrml:appliesTemporalCharacteristics keyref="#tb-cc"/>'
                   f'<lrml:appliesStrength iri="lrmlv:{r["strength"]}"/><lrml:toTarget keyref="#{r["key"]}"/></lrml:Association>')
    for e in tax:
        out.append(f'    <lrml:Association><lrml:appliesAuthority keyref="#graph"/><lrml:appliesStrength iri="lrmlv:Strict"/>'
                   f'<lrml:toTarget keyref="#tx-{e[0]}"/></lrml:Association>')
    out.append('  </lrml:Associations>')

    # 图 → Statements
    def emit(nid, ind):
        n = by[nid]
        inner = anchored.get(nid, []) or tax_by_parent.get(nid, []) or n['children']
        if not inner:
            out.append(f'{ind}<lrml:FactualStatement key="{nid}">{node_comment(n)}</lrml:FactualStatement>')
            return
        out.append(f'{ind}<lrml:Statements key="{nid}">{node_comment(n)}')
        for r in anchored.get(nid, []):
            out.append(rule_xml(r, ind + '  '))
        for e in tax_by_parent.get(nid, []):
            out.append(tax_xml(e, ind + '  '))
        for c in n['children']:
            emit(c, ind + '  ')
        out.append(f'{ind}</lrml:Statements>')

    root = nodes[0]['id']
    emit(root, '  ')
    out.append('  <lrml:Statements key="priorities"><lrml:Comment>规则层的显式优先关系（Naf 例外由 lrml2ddl.py 自动转为优先关系）</lrml:Comment>')
    for o, u, note in FR.OVERRIDES:  # XSD：每个 OverrideStatement 只含一个 Override
        out.append(f'    <lrml:OverrideStatement key="ov-{o}--{u}"><lrml:Comment>{escape(note)}</lrml:Comment>'
                   f'<lrml:Override over="#{o}" under="#{u}"/></lrml:OverrideStatement>')
    out += ['  </lrml:Statements>', '</lrml:LegalRuleML>']
    OUT.write_text('\n'.join(out) + '\n', encoding='utf-8')

    index = {'rules': {r['key']: {'module': r['module'], 'node': r['node'], 'node_text': by[r['node']]['clean'][:80], 'srcs': r['srcs'],
                                  'note': r['note'], 'auth': r['auth']} for r in rules},
             'taxonomy': [{'child': c, 'parent': p, 'child_node': ci, 'parent_node': pi} for ci, c, pi, p in tax],
             'exception_candidates': [{'node': n['id'], 'line': n['line'], 'text': n['clean'][:160],
                                       'cites': [f"{c['law']}:{c['art']}" for c in n['cites']],
                                       'formalized_by': [r['key'] for r in rules if r['node'] == n['id']]}
                                      for n in nodes if n['exception']]}
    (KB / 'civil_graph_index.json').write_text(json.dumps(index, ensure_ascii=False, indent=1), encoding='utf-8')
    return nodes, by, rules, tax, src_keys, unresolved


# ───────────────────────── 核对
def check_quotes(nodes):
    """笔记中“第N条规定：‘…’”的引文与法典原文比对（去标点后包含关系）"""
    arts = articles()
    norm = lambda s: re.sub(r'[\W_]', '', s)
    bad, ok = [], 0
    for n in nodes:
        for m in re.finditer(r'《(?:民法|民法典)》第(\d+)条(?:第\S款)?规定[：:]\s*[“"]([^”"]{8,})[”"]', n['clean']):
            a, q = int(m.group(1)), norm(m.group(2))
            if a in arts and q[:30] in norm(arts[a]):
                ok += 1
            else:
                bad.append((n['id'], n['line'], a, m.group(2)[:40]))
    return ok, bad


def validate_xsd():
    try:
        from lxml import etree
    except ImportError:
        return None, ['未安装 lxml，跳过 XSD 校验']
    schema = etree.XMLSchema(etree.parse(str(SCHEMA)))
    ok = schema.validate(etree.parse(str(OUT)))
    return ok, [f'{e.line}: {e.message[:200]}' for e in list(schema.error_log)[:10]]


if __name__ == '__main__':
    nodes, by, rules, tax, srcs, unresolved = build()
    ok_q, bad_q = check_quotes(nodes)
    xsd_ok, errs = validate_xsd()
    n_rules = len(rules)
    print(f'图节点 {len(nodes)}；法源 {len(srcs)}（民法典条/款 {sum(k.startswith("cc-") for k in srcs)}，其他法律 {sum(k.startswith("ol-") for k in srcs)}）')
    print(f'规则层 {n_rules} 条（{len(FR.MODULES)} 个模块），显式优先关系 {len(FR.OVERRIDES)} 条；isA 分类规则 {len(tax)} 条')
    print(f'锚点未解析：{unresolved or "无"}')
    print(f'笔记引文与法典原文核对：一致 {ok_q} 处，不一致 {len(bad_q)} 处' + (f' → {bad_q[:8]}' if bad_q else ''))
    print('XSD 校验（OASIS LegalRuleML 1.0 compact）：' + ('通过' if xsd_ok else f'失败 {errs}'))
    print(f'输出：{OUT.name}（{OUT.stat().st_size // 1024} KB），civil_graph_index.json')
    sys.exit(0 if xsd_ok is not False and not unresolved else 1)
