#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
data/criminal/criminal_graph.itmz → graph/criminal/criminal_graph.lrml（OASIS LegalRuleML 1.0 compact），两层结构同 ../graph2lrml.py：
  结构层：导图 9828 个节点 → 嵌套 lrml:Statements；导图引用的法条 → lrml:LegalSource（《刑法》原文逐字）；isA 分类规则
  规则层：crim_rules.py（人工形式化）挂在锚定节点下；OverrideStatement；Association（法源/权威/强度/施行时间）

  python3 itmz_parse.py && python3 crim2lrml.py      生成 + 原文核对 + 锚点校验 + XSD 校验
"""
import json
import re
import sys
from collections import defaultdict
from pathlib import Path
from xml.sax.saxutils import escape

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(HERE.parent))
from paths import CRIM_LRML_FULL as OUT, CRIM_LRML_INDEX, CRIM_NODES, SCHEMA  # noqa: E402
import crim_rules as CR  # noqa: E402
from criminal_code import articles, label_of, text_of  # noqa: E402
from graph2lrml import atom, conj_xml, lit_xml, node_comment, tax_xml, taxonomy  # noqa: E402

AKN = '/akn/cn/act/1997-03-14/criminal-law/zho@2023-12-29/!main#art_{}'
DEON = {'OBL': 'Obligation', 'FOR': 'Prohibition', 'PERM': 'Permission', 'RIGHT': 'Right'}


def is_var(a):
    return re.fullmatch(r'[A-Z][A-Za-z0-9]*', a) is not None


def src_key(s):
    return s if s.startswith('spc-') else 'cl-' + s.replace('#', '_p')


def src_label(s):
    return CR.OTHER_SOURCES[s][0] if s in CR.OTHER_SOURCES else label_of(s)


def head_xml(h, key, i, note):
    if isinstance(h, tuple):
        kind, bearer, aux, content = h
        b = f'<ruleml:Var>{bearer}</ruleml:Var>' if is_var(bearer) else f'<ruleml:Ind>{bearer}</ruleml:Ind>'
        slots = f'<ruleml:slot><lrml:Bearer/>{b}</ruleml:slot>'
        if aux:
            slots += f'<ruleml:slot><lrml:AuxiliaryParty/><ruleml:Var>{aux}</ruleml:Var></ruleml:slot>'
        tag = DEON[kind]
        para = f'<lrml:Paraphrase>{escape(note)}</lrml:Paraphrase>' if tag != 'Right' else ''
        return f'<lrml:{tag} key="{key}-h{i}">{para}{slots}{atom(content)}</lrml:{tag}>'
    return lit_xml(h)


def rule_xml(r, ind):
    deontic = [h for h in r['heads'] if isinstance(h, tuple)]
    assert not deontic or len(deontic) == len(r['heads']), f'{r["key"]}：规范性结论与构成性结论不能混在同一条规则'
    tag = 'PrescriptiveStatement' if deontic else 'ConstitutiveStatement'
    hs = [head_xml(h, r['key'], i, r['note']) for i, h in enumerate(r['heads'])]
    if deontic:
        h = '<lrml:SuborderList>' + ''.join(hs) + '</lrml:SuborderList>' if len(hs) == 1 else '<ruleml:And>' + ''.join(hs) + '</ruleml:And>'
    else:
        h = hs[0] if len(hs) == 1 else '<ruleml:And>' + ''.join(hs) + '</ruleml:And>'
    srcs = '、'.join(src_label(s) for s in r['srcs'])
    return (f'{ind}<lrml:{tag} key="{r["key"]}"><lrml:Comment>{escape(r["note"])}（{escape(srcs)}；{r["auth"]}）</lrml:Comment>'
            f'<ruleml:Rule closure="universal" key=":{r["key"]}"><ruleml:if>{conj_xml(r["body"])}</ruleml:if><ruleml:then>{h}</ruleml:then>'
            f'</ruleml:Rule></lrml:{tag}>')


def build():
    nodes = json.loads(CRIM_NODES.read_text(encoding='utf-8'))
    by = {n['id']: n for n in nodes}
    arts = articles()
    rules = [dict(r, module=m) for m, (_, rs) in CR.MODULES.items() for r in rs]
    keys = [r['key'] for r in rules]
    dup = {k for k in keys if keys.count(k) > 1}
    assert not dup, f'规则 key 重复：{dup}'
    for o, u, _ in CR.OVERRIDES:
        assert o in keys and u in keys, f'优先关系引用了不存在的规则：{o} > {u}'

    # 锚点（节点编号 + 关键词校验）
    anchored, bad_anchor = defaultdict(list), []
    for r in rules:
        nid, kw = r['anchor']
        if nid not in by or kw not in by[nid]['clean']:
            bad_anchor.append((r['key'], nid, kw, by.get(nid, {}).get('clean', '')[:30]))
        r['node'] = nid
        anchored[nid].append(r)
    tax = taxonomy(nodes, by)
    tax_by_parent = defaultdict(list)
    for e in tax:
        tax_by_parent[e[2]].append(e)

    # 法源
    srcs, node_src, other = {}, defaultdict(set), {}
    for n in nodes:
        for c in n['cites']:
            if c['law'] == 'criminal-law' and c['art'] in arts:
                k = f'cl-art{c["art"]}'
                srcs.setdefault(k, (AKN.format(c['art'].replace('-', '_')), f'《刑法》{arts[c["art"]]["label"]}：{"".join(arts[c["art"]]["paras"])}'))
            elif c['law'] != 'criminal-law':
                lk = (c['law'], c['art'])
                other.setdefault(lk, f'ol-{len(other) + 1:03d}')
                k = other[lk]
                srcs.setdefault(k, (f'urn:lexgo:law:{c["law"]}:art{c["art"]}', f'《{c["law"]}》第{c["art"]}条（原文未收录，仅标注出处）'))
            else:
                continue
            node_src[n['id']].add(k)
    for r in rules:
        for s in r['srcs']:
            k = src_key(s)
            if s in CR.OTHER_SOURCES:
                lab, nid = CR.OTHER_SOURCES[s]
                srcs.setdefault(k, (f'urn:lexgo:spc:{s}', f'{lab}：{by[nid]["clean"]}（原文取自导图节点 {nid}）'))
            else:
                m = re.fullmatch(r'art(\d+(?:-\d)?)(?:#(\d+))?', s)
                srcs.setdefault(k, (AKN.format(m.group(1).replace('-', '_')) + (f'__para_{m.group(2)}' if m.group(2) else ''),
                                    f'《刑法》{label_of(s)}：{text_of(s)}'))

    out = ['<?xml version="1.0" encoding="UTF-8"?>',
           '<!-- 由 crim2lrml.py 从 data/criminal/criminal_graph.itmz（思维导图）与 src/criminal/crim_rules.py 生成，请勿手改。《刑法》文本为 2023 年修正本（修正案（十二）），取自 data/criminal/criminal_law_2023.txt（PDF、维基文库、6laws 三方核对，见 data/criminal/reconcile_report.md）。',
           '     结构层：导图每个节点 = 嵌套的 lrml:Statements / lrml:FactualStatement（原文在 lrml:Comment）；isA 分类为自动抽取。',
           '     规则层：人工形式化，挂在锚定节点之下；可用 src/lrml2ddl.py 转为 Defeasible Deontic Logic（ASP）。 -->',
           '<lrml:LegalRuleML xmlns:lrml="http://docs.oasis-open.org/legalruleml/ns/v1.0/" xmlns:ruleml="http://ruleml.org/spec"'
           ' xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'
           ' xmlns:lrmlv="http://docs.oasis-open.org/legalruleml/ns/v1.0/metamodel#">',
           '  <lrml:Prefix key="cnv" refID="http://example.org/lexgo/criminal-vocab#"/>',
           '  <lrml:LegalSources key="legal-sources">']
    nat = lambda x: [int(t) if t.isdigit() else t for t in re.split(r'(\d+)', x)]
    for k in sorted(srcs, key=nat):
        same, com = srcs[k]
        out.append(f'    <lrml:LegalSource key="{k}" sameAs="{escape(same)}"><lrml:Comment>{escape(com)}</lrml:Comment></lrml:LegalSource>')
    out += ['  </lrml:LegalSources>',
            '  <lrml:Authorities key="authorities">',
            '    <lrml:Authority key="npc"><lrml:Comment>全国人民代表大会（《刑法》条文明文）</lrml:Comment></lrml:Authority>',
            '    <lrml:Authority key="spc"><lrml:Comment>最高人民法院（司法解释）</lrml:Comment></lrml:Authority>',
            '    <lrml:Authority key="doctrine"><lrml:Comment>学理通说 / 导图归纳（非条文明文）</lrml:Comment></lrml:Authority>',
            '    <lrml:Authority key="graph"><lrml:Comment>刑法v2.1 思维导图的层级结构（自动抽取）</lrml:Comment></lrml:Authority>',
            '  </lrml:Authorities>',
            '  <lrml:Times key="times"><ruleml:Time key=":t-2024-03-01"><ruleml:Data xsi:type="xs:dateTime">2024-03-01T00:00:00Z</ruleml:Data></ruleml:Time></lrml:Times>',
            '  <lrml:TemporalCharacteristics key="tb-cl2023"><lrml:TemporalCharacteristic><lrml:forStatus iri="lrmlv:Efficacious"/>'
            '<lrml:hasStatusDevelopment iri="lrmlv:Starts"/><lrml:atTime keyref="#t-2024-03-01"/></lrml:TemporalCharacteristic></lrml:TemporalCharacteristics>',
            '  <lrml:Associations key="associations">']
    for nid in sorted(node_src):
        for k in sorted(node_src[nid]):
            out.append(f'    <lrml:Association><lrml:appliesSource keyref="#{k}"/><lrml:toTarget keyref="#{nid}"/></lrml:Association>')
    for r in rules:
        out.append('    <lrml:Association>' + ''.join(f'<lrml:appliesSource keyref="#{src_key(s)}"/>' for s in r['srcs'])
                   + f'<lrml:appliesAuthority keyref="#{r["auth"]}"/><lrml:appliesTemporalCharacteristics keyref="#tb-cl2023"/>'
                   f'<lrml:appliesStrength iri="lrmlv:{r["strength"]}"/><lrml:toTarget keyref="#{r["key"]}"/></lrml:Association>')
    for e in tax:
        out.append(f'    <lrml:Association><lrml:appliesAuthority keyref="#graph"/><lrml:appliesStrength iri="lrmlv:Strict"/>'
                   f'<lrml:toTarget keyref="#tx-{e[0]}"/></lrml:Association>')
    out.append('  </lrml:Associations>')

    def emit(nid, ind):
        n = by[nid]
        if not (anchored.get(nid) or tax_by_parent.get(nid) or n['children']):
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

    emit(nodes[0]['id'], '  ')
    out.append('  <lrml:Statements key="priorities"><lrml:Comment>规则层的显式优先关系（Naf 例外由 lrml2ddl.py 自动转为优先关系）</lrml:Comment>')
    for o, u, note in CR.OVERRIDES:
        out.append(f'    <lrml:OverrideStatement key="ov-{o}--{u}"><lrml:Comment>{escape(note)}</lrml:Comment>'
                   f'<lrml:Override over="#{o}" under="#{u}"/></lrml:OverrideStatement>')
    out += ['  </lrml:Statements>', '</lrml:LegalRuleML>']
    OUT.write_text('\n'.join(out) + '\n', encoding='utf-8')

    index = {'rules': {r['key']: {'module': r['module'], 'node': r['node'], 'node_text': by[r['node']]['clean'][:80], 'srcs': r['srcs'],
                                  'note': r['note'], 'auth': r['auth']} for r in rules},
             'taxonomy': [{'child': c, 'parent': p, 'child_node': ci, 'parent_node': pi} for ci, c, pi, p in tax],
             'exception_candidates': [{'node': n['id'], 'text': n['clean'][:160], 'cites': [f"{c['law']}:{c['art']}" for c in n['cites']],
                                       'formalized_by': [r['key'] for r in rules if r['node'] == n['id']]} for n in nodes if n['exception']]}
    CRIM_LRML_INDEX.write_text(json.dumps(index, ensure_ascii=False, indent=1), encoding='utf-8')
    return nodes, rules, tax, srcs, bad_anchor


def check_quotes(nodes):
    """导图中“第N条规定：‘…’”或直接抄录的条文，与《刑法》2023 文本比对（去标点后的包含关系）"""
    arts = articles()
    norm = lambda s: re.sub(r'[\W_]', '', s)
    ok, bad = 0, []
    for n in nodes:
        for m in re.finditer(r'《(?:中华人民共和国)?刑法》第(\d+)条(?:第\S款)?(?:规定)?[：:，,]?\s*[“"]([^”"]{8,})[”"]', n['clean']):
            a, q = m.group(1), norm(m.group(2))
            if a in arts and q[:24] in norm(''.join(arts[a]['paras'])):
                ok += 1
            else:
                bad.append((n['id'], a, m.group(2)[:40]))
    return ok, bad


def validate_xsd():
    from lxml import etree
    schema = etree.XMLSchema(etree.parse(str(SCHEMA)))
    ok = schema.validate(etree.parse(str(OUT)))
    return ok, [f'{e.line}: {e.message[:200]}' for e in list(schema.error_log)[:10]]


if __name__ == '__main__':
    nodes, rules, tax, srcs, bad_anchor = build()
    ok_q, bad_q = check_quotes(nodes)
    xsd_ok, errs = validate_xsd()
    print(f'导图节点 {len(nodes)}；法源 {len(srcs)}（刑法条/款 {sum(k.startswith("cl-") for k in srcs)}，司法解释 {sum(k.startswith("spc-") for k in srcs)}，'
          f'其他 {sum(k.startswith("ol-") for k in srcs)}）')
    print(f'规则层 {len(rules)} 条（{len(CR.MODULES)} 个模块），显式优先关系 {len(CR.OVERRIDES)} 条；isA 分类规则 {len(tax)} 条')
    print(f'锚点校验：{"全部通过" if not bad_anchor else bad_anchor}')
    print(f'导图引文与《刑法》2023 文本核对：一致 {ok_q} 处，不一致 {len(bad_q)} 处' + (f' → {bad_q[:10]}' if bad_q else ''))
    print('XSD 校验：' + ('通过' if xsd_ok else f'失败 {errs}'))
    print(f'输出：{OUT.name}（{OUT.stat().st_size // 1024} KB），{CRIM_LRML_INDEX.name}')
    sys.exit(0 if xsd_ok and not bad_anchor else 1)
