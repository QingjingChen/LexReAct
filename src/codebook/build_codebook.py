#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
把 civil_graph.markdown 的一章形式化为“规则卡片”，并与民法典原文对齐。

  python src/codebook/build_codebook.py ch02_natural_person [--xlsx 审核表.xlsx]

步骤
  1. 对齐：该章 markdown 的每个条目与法条（条/款/项/句）比较。
       一致  → 在 civil_graph_mounted.markdown 中直接替换为挂载的法条（保留笔记的【】重点标记、考点标记和附注）
       近似  → 保留笔记原文，下方附官方原文，留给专家判断
       引用  → 笔记写了条号或改写了原文，行尾标注〔参见 第X条〕
     本章没有在笔记中出现的法条，列在该章末尾。
  2. 规则卡片：编 › 章 › 节 › 卡片；卡片有自然语言版本（LEGO concept card 字段）与形式化版本（规则），挂载多条法条。
  3. 条间关系：由规则之间的谓词依赖、“除非”条件、优先关系和条文中的引致用语自动导出。
  4. 输出 LegalRuleML（OASIS XSD 校验）→ ASP → 回归测试（案例由法条编写，不取自题库）；卡片版 markdown；审核表（可选，只审规则卡片）。
"""
import argparse
import collections
import difflib
import importlib
import json
import re
import subprocess
import sys
from pathlib import Path
from xml.sax.saxutils import escape

HERE = Path(__file__).resolve().parent
SRC = HERE.parent
sys.path[:0] = [str(HERE), str(SRC)]
import civil_code as CC  # noqa: E402
import formal_rules as FR  # noqa: E402
from paths import DATA, GRAPH, GRAPH_MD, GRAPH_NODES, SCHEMA  # noqa: E402

CHAPTERS = {'ch02_natural_person': 'civil_ch02_natural_person'}
AKN = '/akn/cn/act/2020-05-28/civil-code/zho@/!main#art_{}'
LEGO = DATA / 'civil' / 'lego_concept_cards'
CN = '一二三四五六七八九十'

# ───────────────────────── 文本工具
EXAM = re.compile(r'【[^】]*$')                       # 行尾未闭合的考点标记，如【T14/22；
CITE = re.compile(r'[（(]《[^》]{1,20}》第(\d+)条[^（）()]*[）)]|[（(]第(\d+)条[^（）()]*[）)]')
WRAP = re.compile(r'^(?:我国|根据)?《民法典?》第(\d+)条(?:第\d+款)?规定[：:，,]\s*|^第(\d+)条规定[：:，,]\s*')
WRAP_MID = re.compile(r'《民法典?》第(\d+)条(?:第\d+款)?规定[：:，,]?\s*(?=“)')   # 说明文字中间的引文
ENUM = re.compile(r'^(?:[①②③④⑤⑥⑦⑧⑨⑩]|[（(]\d+[）)]|\d+[.、．]|[一二三四五六七八九十]+、|（[一二三四五六七八九十]+）)\s*')
TAIL = re.compile(r'((?:\s*[（(][^（）()]*[）)])+)\s*$')
INLINE_CITE = re.compile(r'第(\d+)条')
LAW_REF = re.compile(r'《([^》]{1,20})》|第(\d+)条')


def civil_cites(text):
    """文字中引用的《民法典》条号：只认《民法》《民法典》或未写法律名称的“第X条”（同一句内最近的书名号决定法律）"""
    out, law = [], None
    for seg in re.split(r'[。；]', plain(text)):
        law = None
        for m in LAW_REF.finditer(seg):
            if m.group(1):
                law = m.group(1)
            elif law in (None, '民法', '民法典'):
                out.append(int(m.group(2)))
    return out


def plain(s):
    return re.sub(r'</?mark>|[【】]', '', s)


def norm(s):
    return re.sub(r'[^一-鿿0-9A-Za-z]', '', plain(s))


def label(n, k=None, j=None, part=False):
    s = f'第{n}条' + (f'第{k}款' if k else '') + (f'第{j}项' if j else '')
    return s + ('（节选）' if part else '')


def units(n):
    """第 n 条的可比对单元：全文、各款、各项、各款中连续的句子"""
    ps = CC.paragraphs(n)
    out = [(label(n), ''.join(ps))]
    for k, p in enumerate(ps, 1):
        kk = k if len(ps) > 1 else None
        out.append((label(n, kk), p))
        items = re.split(r'(?=（[一二三四五六七八九十]+）)', p)
        for j, it in enumerate(items[1:], 1):
            out.append((label(n, kk, j), re.sub(r'^（[一二三四五六七八九十]+）', '', it)))
        sents = [s for s in re.split(r'(?<=[。；：])', items[0] if len(items) > 1 else p) if s.strip()]
        for a in range(len(sents)):
            for b in range(a + 1, len(sents) + 1):
                if (a, b) != (0, len(sents)):
                    out.append((label(n, kk, part=True), ''.join(sents[a:b])))
    return out


def split_node(text):
    """条目文字 → (编号前缀, 正文, 尾注, 考点标记, 引用的条号)"""
    exam = ''
    m = EXAM.search(text)
    if m:
        exam, text = m.group(0), text[:m.start()].rstrip()
    cites = civil_cites(''.join(m.group(0) for m in CITE.finditer(text)))
    text = CITE.sub('', text).strip()
    prefix = ''
    m = ENUM.match(text)
    if m:
        prefix, text = m.group(0), text[m.end():]
    tail = ''
    cites += civil_cites(text)
    m = WRAP.match(text) or WRAP_MID.search(text)
    if m and m.start() > 0:                      # 引文前的说明文字并入编号前缀，保留不动
        prefix, text = prefix + text[:m.start()], text[m.start():]
        m = WRAP_MID.match(text)
    if m:
        cites.append(int(m.group(1) or m.group(2)))
        text = text[m.end():]
        if text.startswith('“'):
            end = text.find('”')
            if end > 0:
                text, tail = text[1:end], text[end + 1:]
            else:
                text = text[1:]
    elif text.startswith('“') and text.rstrip().endswith('”'):
        text = text.strip()[1:-1]
    text = text.rstrip('”"')
    if not tail:
        m = TAIL.search(text)
        if m and len(text) - len(m.group(1)) > 4:
            tail, text = m.group(1), text[:m.start()]
    cites += civil_cites(tail)
    return prefix, text, tail, exam, cites


# ───────────────────────── 对齐
def align(M, nodes_by_line, md_lines, lo, hi):
    scope = list(M.SCOPE)
    unit_cache = {}

    def us(n):
        if n not in unit_cache:
            try:
                unit_cache[n] = units(n)
            except Exception:  # noqa: BLE001
                unit_cache[n] = []
        return unit_cache[n]
    scope_units = [(n, lab, t, norm(t)) for n in scope for lab, t in us(n)]
    grams = collections.defaultdict(set)
    for n in scope:
        t = norm(''.join(CC.paragraphs(n)))
        for i in range(len(t) - 11):
            grams[t[i:i + 12]].add(n)
    res = []
    for ln in range(lo, hi + 1):
        raw = md_lines[ln - 1]
        m = re.match(r'^(\s*)\* (.*?)(\s*)$', raw)
        if not m:
            continue
        indent, body = m.group(1), m.group(2)
        prefix, core, tail, exam, cites = split_node(body)
        cn = norm(core)
        rec = dict(line=ln, node=nodes_by_line.get(ln), indent=indent, raw=body, prefix=prefix, core=core, tail=tail, exam=exam,
                   cites=sorted(set(cites)), status='无', label='', art=None, official='', ratio=0.0)
        if len(cn) >= 6:
            cand = scope_units + [(n, lab, t, norm(t)) for n in set(cites) - set(scope) for lab, t in us(n)]
            exact = [u for u in cand if u[3] == cn]
            if exact:
                exact.sort(key=lambda u: ('节选' in u[1], len(u[1])))
                n, lab, t, _ = exact[0]
                rec.update(status='一致', label=lab, art=n, official=t, ratio=1.0)
            else:
                rec['_cand'] = cand
                best, r = near(cn, cand, set())
                if r >= 0.8:
                    rec.update(status='近似', label=best[1], art=best[0], official=best[2], ratio=round(r, 3))
        if rec['status'] == '无':
            hit = sorted({n for i in range(len(cn) - 11) for n in grams.get(cn[i:i + 12], ())})
            refs = sorted(set(rec['cites']) | set(hit))
            if refs:
                rec.update(status='引用' if rec['cites'] else '改写', label='、'.join(f'第{n}条' for n in refs), art=refs[0])
                rec['refs'] = refs
        res.append(rec)
    # 第二遍：近似条目优先取上下文（前后 10 行）中已对上的法条，避免把内容相近的两张名单配错
    for rec in res:
        if rec['status'] != '近似':
            rec.pop('_cand', None)
            continue
        ctx = {x['art'] for x in res if x is not rec and abs(x['line'] - rec['line']) <= 10 and x['status'] in ('一致', '近似', '引用')}
        best, r = near(norm(rec['core']), rec.pop('_cand'), ctx)
        rec.update(label=best[1], art=best[0], official=best[2], ratio=round(r, 3))
    return res


def near(cn, cand, ctx):
    def score(u):
        if abs(len(u[3]) - len(cn)) >= 0.5 * len(cn) + 8:
            return 0, 0
        r = difflib.SequenceMatcher(None, cn, u[3], autojunk=False).ratio()
        return r + (0.1 if u[0] in ctx else 0), r
    best = max(cand, key=lambda u: score(u)[0])
    return best, score(best)[1]


def mounted_line(rec, card_ids):
    """一致条目 → 挂载法条后的新行"""
    core = rec['core'] if plain(rec['core']).strip() == rec['official'].strip() else rec['official']
    tag = f'〔{rec["label"]}' + (f'｜{"、".join(card_ids)}' if card_ids else '') + '〕'
    return f'{rec["indent"]}* {rec["prefix"]}{tag}{core}{rec["tail"]}{rec["exam"]}  '


# ───────────────────────── 代码结构、规则与卡片
def code_structure():
    t = CC.CODE.read_text(encoding='utf-8')
    cur = dict(book='', subbook='', chapter='', section='')
    out = {}
    body = t[t.rfind('第一编', 0, t.index('\n第一条　')):]          # 跳过目录
    for line in body.split('\n'):
        s = line.strip()
        m = re.match(r'^第([一二三四五六七八九十]+)(编|分编|章|节)[　 ]+(.+)$', s)
        if m:
            name = f'第{m.group(1)}{m.group(2)}　{re.sub(r"[　 ]+", "", m.group(3))}'
            lvl = {'编': 'book', '分编': 'subbook', '章': 'chapter', '节': 'section'}[m.group(2)]
            cur[lvl] = name
            for k in ['book', 'subbook', 'chapter', 'section'][['book', 'subbook', 'chapter', 'section'].index(lvl) + 1:]:
                cur[k] = ''
            continue
        m = re.match(r'^第([一二三四五六七八九十百千零]+)条　', s)
        if m:
            out[CC.cn2int(m.group(1))] = dict(cur)
    return out


def preds(x):
    if isinstance(x, str):
        for t in x.split():
            m = re.match(r'([-~]?)(\w+)\(', t)
            yield m.group(1), m.group(2)
    elif x[0] == 'or':
        for y in x[1]:
            yield from preds(y)
    else:
        yield '', re.match(r'(\w+)', x[3]).group(1)


def art_of(s):
    return int(re.match(r'art(\d+)', s).group(1))


def card_model(M):
    rules = {r['key']: r for r in M.RULES}
    owner, refs_of = {}, {}
    for c in M.CARDS:
        own = list(M.AUX.get(c['id'], []))
        for f in ('issue', 'conditions', 'effects', 'exceptions', 'priority'):
            for _, refs in c['nl'][f]:
                own += [k for k in refs if k not in own]
        refs_of[c['id']] = own
    # 归属：先由 issue/conditions/effects/AUX 认领，其余（exceptions/priority）引用的规则若已被认领则视为关联
    for c in M.CARDS:
        for k in M.AUX.get(c['id'], []):
            owner.setdefault(k, c['id'])
        for f in ('issue', 'conditions', 'effects'):
            for _, refs in c['nl'][f]:
                for k in refs:
                    owner.setdefault(k, c['id'])
    for c in M.CARDS:
        for k in refs_of[c['id']]:
            owner.setdefault(k, c['id'])
    for c in M.CARDS:
        c['rules'] = [k for k in refs_of[c['id']] if owner[k] == c['id']]
        c['related_rules'] = [k for k in refs_of[c['id']] if owner[k] != c['id']]
        srcs = []
        for k in [k for k in c['rules'] if k not in M.AUX.get(c['id'], [])]:  # 挂载法条只看主规则
            srcs += [s for s in rules[k]['srcs'] if s not in srcs]
        arts = sorted({art_of(s) for s in srcs} | {art_of(s) for s in c.get('extra_articles', [])})
        c['srcs'], c['articles'] = srcs, arts
    missing = [k for k in rules if k not in owner]
    assert not missing, f'未归属卡片的规则：{missing}'
    return rules, owner


def relations(M, rules, owner):
    defs = collections.defaultdict(list)
    for r in M.RULES:
        for h in r['heads']:
            for sign, p in preds(h):
                defs[p].append(r['key'])
    out = []
    seen = set()
    for r in M.RULES:
        for b in r['body']:
            for sign, p in preds(b):
                for d in defs.get(p, []):
                    if d == r['key']:
                        continue
                    a1, a2 = {art_of(s) for s in rules[d]['srcs']}, {art_of(s) for s in r['srcs']}
                    if a1 == a2:
                        continue
                    typ = {'~': '例外（除非）', '-': '依赖（须证得否定）', '': '依赖（前提）'}[sign]
                    k = (typ, d, r['key'])
                    if k not in seen:
                        seen.add(k)
                        out.append(dict(type=typ, src_rule=d, dst_rule=r['key'], src_card=owner[d], dst_card=owner[r['key']], pred=p,
                                        src_arts=sorted(a1), dst_arts=sorted(a2)))
    for o, u, why in M.OVERRIDES:
        out.append(dict(type='优先', src_rule=o, dst_rule=u, src_card=owner[o], dst_card=owner[u], pred=why,
                        src_arts=sorted({art_of(s) for s in rules[o]['srcs']}), dst_arts=sorted({art_of(s) for s in rules[u]['srcs']})))
    # 章外规则（formal_rules.py 中未沿用的）引用本章推出的谓词
    mine = set(rules)
    heads = {p for r in M.RULES for h in r['heads'] for _, p in preds(h)}
    for _, rs in FR.MODULES.values():
        for r in rs:
            if r['key'] in mine:
                continue
            used = {p for b in r['body'] for _, p in preds(b)} & heads
            for p in sorted(used):
                src = [k for k in defs[p]]
                out.append(dict(type='章外引用', src_rule='、'.join(src[:4]), dst_rule=r['key'], src_card='、'.join(sorted({owner[k] for k in src})),
                                dst_card='（章外）', pred=p, src_arts=sorted({art_of(s) for k in src for s in rules[k]['srcs']}),
                                dst_arts=sorted({art_of(s) for s in r['srcs']})))
    # 条文中的引致用语
    for n in M.SCOPE:
        t = ''.join(CC.paragraphs(n))
        for m in re.finditer(r'本法第[一二三四五六七八九十百千零]+[条编章]|适用前款规定|依据本条第[一二三四五六七八九十]+款|前款规定', t):
            out.append(dict(type='引致（条文用语）', src_rule='', dst_rule='', src_card='', dst_card='', pred=m.group(0),
                            src_arts=[n], dst_arts=[]))
    return out


def lego_node_map(by):
    """LEGO concept card → 它切自的 markdown 节点。LEGO 数据只存了卡片与法条的边，没有存节点，
    这里按内容重建：卡片全部字段与节点子树文字的字二元组 F1，加标题相似度的一半；第一名领先第二名不足 0.05 或得分低于 0.5 的标“待确认”。
    结果缓存在 data/civil/lego_concept_cards/node_map.json。"""
    cache = LEGO / 'node_map.json'
    if cache.exists():
        return json.load(open(cache, encoding='utf-8'))
    cards, seen = {}, collections.Counter()
    for l in open(LEGO / 'nodes.jsonl', encoding='utf-8'):
        x = json.loads(l)
        seen[x['id']] += 1
        cards[f'{x["id"]}#{seen[x["id"]]}'] = x['card']      # 一个概念可有多张卡片

    def bg(t):
        t = re.sub(r'[^\u4e00-\u9fff]', '', re.sub(r'[TF]+\d+/\d+', '', t or ''))
        return collections.Counter(t[k:k + 2] for k in range(len(t) - 1))

    def f1(a, b):
        x = sum((a & b).values())
        return 0 if not x else 2 * x / (sum(a.values()) + sum(b.values()))
    memo = {}

    def subtext(i):
        if i not in memo:
            memo[i] = (by[i]['text'] or '') + ''.join(subtext(c) for c in by[i]['children'])
        return memo[i]
    heads = [i for i in by if by[i]['children'] and by[i]['kind'] != 'root']
    hb = {i: bg(subtext(i)) for i in heads}
    tb = {i: bg(by[i]['text']) for i in heads}
    out = {}
    for cid, c in cards.items():
        cb = bg(c['title'] + ''.join(''.join(v) for k, v in c.items() if k != 'title'))
        tt = bg(c['title'])
        sc = sorted(((f1(cb, hb[i]) + 0.5 * f1(tt, tb[i]), i) for i in heads), reverse=True)[:2]
        (s1, n1), (s2, n2) = sc
        out[cid] = dict(title=c['title'], node=n1, score=round(s1, 3), runner_up=n2, runner_up_score=round(s2, 3),
                        confident=bool(s1 >= 0.5 and s1 - s2 >= 0.05))
    cache.write_text(json.dumps(out, ensure_ascii=False, indent=1), encoding='utf-8')
    return out


def lego_refs(cards, by, sub):
    """每个笔记来源节点下挂上切自它（或其下级）的 LEGO 卡片"""
    nm = {k: v for k, v in lego_node_map(by).items() if v['score'] >= 0.3}
    for c in cards:
        c['md_lego'] = {}
        for nid, _ in c['md_nodes']:
            inside = set(sub(nid))
            hit = sorted([(cid, m['title'], m['score'], m['confident'], '') for cid, m in nm.items() if m['node'] in inside], key=lambda x: -x[2])
            p = by[nid]['parent']
            while not hit and p and by[p]['kind'] not in ('root', 'book'):
                hit = [(cid, m['title'], m['score'], m['confident'], '上级') for cid, m in nm.items() if m['node'] == p and m['confident']]
                p = by[p]['parent']
            c['md_lego'][nid] = hit


def md_source_text(c):
    out = []
    for nid, path in c['md_nodes']:
        out.append(f'{nid}：{path}')
        for cid, t, s, ok, up in c['md_lego'].get(nid, []):
            out.append(f'  └ LEGO {cid} {t}（{up + "，" if up else ""}匹配度 {s}{"" if ok else "，待确认"}）')
    return '\n'.join(out)


# ───────────────────────── 中文译述（与 expert_review.py 相同）
def setup_gloss(M):
    import expert_review as E
    E.GLOSS = {**FR.ZH, **E.ZH_EXTRA, **M.ZH}
    E.CONST = {'court': '人民法院', 'civilAffairs': '民政部门'}
    return E


# ───────────────────────── LegalRuleML
def build_lrml(M, rules, cards, struct, out):
    import graph2lrml as G
    arts = sorted({a for c in cards for a in c['articles']})
    srcs = sorted({s for r in M.RULES for s in r['srcs']}, key=lambda s: [int(x) for x in re.findall(r'\d+', s)])
    L = ['<?xml version="1.0" encoding="UTF-8"?>',
         f'<!-- 由 src/codebook/build_codebook.py 生成，请勿手改。民法典 {M.BOOK} {M.CHAPTER}：规则卡片（编 › 章 › 节 › 卡片 › 规则）。',
         '     卡片 = lrml:Statements（自然语言版本在 lrml:Comment）；规则 = Constitutive/PrescriptiveStatement；卡片与法条的挂载 = lrml:Association。 -->',
         '<lrml:LegalRuleML xmlns:lrml="http://docs.oasis-open.org/legalruleml/ns/v1.0/" xmlns:ruleml="http://ruleml.org/spec"'
         ' xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'
         ' xmlns:lrmlv="http://docs.oasis-open.org/legalruleml/ns/v1.0/metamodel#">',
         '  <lrml:Prefix key="cnv" refID="http://example.org/lexgo/civil-vocab#"/>',
         '  <lrml:LegalSources key="legal-sources">']
    for a in arts:
        L.append(f'    <lrml:LegalSource key="cc-art{a}" sameAs="{AKN.format(a)}"><lrml:Comment>{escape("《民法典》第%d条：" % a + "".join(CC.paragraphs(a)))}</lrml:Comment></lrml:LegalSource>')
    for s in srcs:
        if '-' in s:
            a, p = s[3:].split('-')
            L.append(f'    <lrml:LegalSource key="cc-{s}" sameAs="{AKN.format(a)}__para_{p}"><lrml:Comment>{escape("《民法典》" + G.lbl(s) + "：" + CC.text_of(s))}</lrml:Comment></lrml:LegalSource>')
    L += ['  </lrml:LegalSources>',
          '  <lrml:Authorities key="authorities">',
          '    <lrml:Authority key="npc"><lrml:Comment>全国人民代表大会（《民法典》条文明文）</lrml:Comment></lrml:Authority>',
          '    <lrml:Authority key="spc"><lrml:Comment>最高人民法院（司法解释）</lrml:Comment></lrml:Authority>',
          '    <lrml:Authority key="doctrine"><lrml:Comment>学理通说 / 笔记归纳（非条文明文）</lrml:Comment></lrml:Authority>',
          '  </lrml:Authorities>',
          '  <lrml:Times key="times"><ruleml:Time key=":t-2021-01-01"><ruleml:Data xsi:type="xs:dateTime">2021-01-01T00:00:00Z</ruleml:Data></ruleml:Time></lrml:Times>',
          '  <lrml:TemporalCharacteristics key="tb-cc"><lrml:TemporalCharacteristic><lrml:forStatus iri="lrmlv:Efficacious"/>'
          '<lrml:hasStatusDevelopment iri="lrmlv:Starts"/><lrml:atTime keyref="#t-2021-01-01"/></lrml:TemporalCharacteristic></lrml:TemporalCharacteristics>',
          '  <lrml:Associations key="associations">']
    for c in cards:
        L.append('    <lrml:Association>' + ''.join(f'<lrml:appliesSource keyref="#cc-art{a}"/>' for a in c['articles'])
                 + f'<lrml:toTarget keyref="#card-{c["id"]}"/></lrml:Association>')
    for r in M.RULES:
        L.append('    <lrml:Association>' + ''.join(f'<lrml:appliesSource keyref="#cc-{s}"/>' for s in r['srcs'])
                 + f'<lrml:appliesAuthority keyref="#{r["auth"]}"/><lrml:appliesTemporalCharacteristics keyref="#tb-cc"/>'
                 f'<lrml:appliesStrength iri="lrmlv:{r["strength"]}"/><lrml:toTarget keyref="#{r["key"]}"/></lrml:Association>')
    L.append('  </lrml:Associations>')
    L.append(f'  <lrml:Statements key="book-1"><lrml:Comment>{escape(M.BOOK)}</lrml:Comment>')
    L.append(f'    <lrml:Statements key="chapter-2"><lrml:Comment>{escape(M.CHAPTER)}</lrml:Comment>')
    for sec, name in M.SECTIONS.items():
        L.append(f'      <lrml:Statements key="section-{sec}"><lrml:Comment>{escape(name)}</lrml:Comment>')
        for c in [c for c in cards if c['section'] == sec]:
            nl = c['nl']
            summary = (f'【规则卡片 {c["id"]}】{c["title"]}｜挂载：' + '、'.join(f'第{a}条' for a in c['articles'])
                       + '｜争点：' + '；'.join(t for t, _ in nl['issue'])
                       + '｜适用条件：' + '；'.join(t for t, _ in nl['conditions'])
                       + ('｜除外：' + '；'.join(t for t, _ in nl['exceptions']) if nl['exceptions'] else '')
                       + '｜法律效果：' + '；'.join(t for t, _ in nl['effects']))
            L.append(f'        <lrml:Statements key="card-{c["id"]}"><lrml:Comment>{escape(summary)}</lrml:Comment>')
            for k in c['rules']:
                L.append(G.rule_xml(rules[k], '          '))
            L.append('        </lrml:Statements>')
        L.append('      </lrml:Statements>')
    L += ['    </lrml:Statements>', '  </lrml:Statements>',
          '  <lrml:Statements key="priorities"><lrml:Comment>显式优先关系（“除非”条件由 lrml2ddl.py 自动转为优先关系）</lrml:Comment>']
    for o, u, why in M.OVERRIDES:
        L.append(f'    <lrml:OverrideStatement key="ov-{o}--{u}"><lrml:Comment>{escape(why)}</lrml:Comment><lrml:Override over="#{o}" under="#{u}"/></lrml:OverrideStatement>')
    L += ['  </lrml:Statements>', '</lrml:LegalRuleML>']
    out.write_text('\n'.join(L) + '\n', encoding='utf-8')
    from lxml import etree
    schema = etree.XMLSchema(etree.parse(str(SCHEMA)))
    ok = schema.validate(etree.parse(str(out)))
    return ok, [f'{e.line}: {e.message[:160]}' for e in list(schema.error_log)[:5]]


# ───────────────────────── 输出：卡片版 markdown
def write_codebook_md(M, E, rules, cards, rels, align_res, struct, out):
    by_art = collections.defaultdict(list)
    for a in align_res:
        if a['status'] in ('一致', '近似') and a['art']:
            by_art[a['art']].append(a)
    L = [f'# {M.BOOK}', '', f'## {M.CHAPTER}', '',
         '> 由 `src/codebook/build_codebook.py` 生成。每张规则卡片有自然语言版本（字段同 LEGO concept card，方括号内为形式化它的规则）和形式化版本（可废止规则，'
         '已编译为 LegalRuleML 与 ASP）；卡片挂载一条或多条法条，一条法条也可挂在多张卡片下。', '']
    for sec, name in M.SECTIONS.items():
        L += [f'### {name}', '']
        for c in [c for c in cards if c['section'] == sec]:
            L += [f'#### 规则卡片 {c["id"]}　{c["title"]}', '']
            uses = sorted({rel['src_card'] for rel in rels if rel['dst_card'] == c['id'] and rel['src_card'] not in (c['id'], '') and rel['type'] != '章外引用'})
            ext = sorted({a for rel in rels if rel['type'] == '章外引用' and c['id'] in rel['src_card'].split('、') for a in rel['dst_arts']})
            L.append('**挂载法条**：' + '、'.join(f'第{a}条' for a in c['articles'])
                     + (f'　**依赖 / 受其优先的卡片**：{"、".join(uses)}' if uses else '')
                     + (f'　**章外引用本卡片的法条**：{"、".join(f"第{a}条" for a in ext)}' if ext else ''))
            L.append('')
            for a in c['articles']:
                L.append(f'> **第{a}条**　' + '<br>'.join(CC.paragraphs(a)))
            L.append('')
            if c['md_nodes']:
                L.append('**笔记来源（及切自该处的 LEGO 卡片）**')
                L.append('')
                for nid, path in c['md_nodes']:
                    L.append(f'- `{nid}` {path}')
                    for cid, t, sc, ok, up in c['md_lego'].get(nid, []):
                        L.append(f'  - LEGO `{cid}` {t}（{up + "，" if up else ""}匹配度 {sc}{"" if ok else "，待确认"}）')
                L.append('')
            L.append('**自然语言版本**')
            L.append('')
            for f, name_ in [('issue', '争点'), ('conditions', '适用条件'), ('exceptions', '除外情形'), ('effects', '法律效果'),
                             ('priority', '优先与例外'), ('distinguish', '区分')]:
                items = c['nl'][f]
                if not items:
                    continue
                L.append(f'- {name_}')
                for t, refs in items:
                    L.append(f'  - {t}' + (f'　[{"、".join(refs)}]' if refs else '　[未形式化]'))
            L += ['', '**形式化版本**', '']
            for k in c['rules']:
                r = rules[k]
                src = '、'.join(E.src_label(s) for s in r['srcs'])
                L.append(f'- `{k}`（{src}；{E.AUTH.get(r["auth"], r["auth"])}{"；沿用" if r.get("reused") else ""}）'
                         + E.rule_sentence(r).replace('\n', ' '))
                L.append(f'  - `{E.rule_formal(r)}`')
            ovs = [(o, u, w) for o, u, w in M.OVERRIDES if o in c['rules'] or u in c['rules']]
            if ovs:
                L.append('- 优先关系：' + '；'.join(f'`{o}` ＞ `{u}`' for o, u, _ in ovs[:6]) + (f' 等 {len(ovs)} 条' if len(ovs) > 6 else ''))
            L.append('')
    out.write_text('\n'.join(L), encoding='utf-8')


# ───────────────────────── 输出：挂载后的原 markdown
def write_mounted(M, md_lines, align_res, cards, lo, hi, nodes_by_line, out):
    art_cards = collections.defaultdict(list)
    for c in cards:
        for a in c['articles']:
            art_cards[a].append(c['id'])
    new = list(md_lines)
    inserts = collections.defaultdict(list)
    for a in align_res:
        i = a['line'] - 1
        if a['status'] == '一致':
            new[i] = mounted_line(a, art_cards.get(a['art'], []))
        elif a['status'] == '近似':
            inserts[i].append(f'{a["indent"]}    > 〔对照 {a["label"]}｜与笔记表述有差异，待专家确认〕{a["official"]}  ')
        elif a['status'] in ('引用', '改写'):
            new[i] = new[i].rstrip() + f' 〔参见 {a["label"]}〕  '
    line_of = {v: k for k, v in nodes_by_line.items()}
    for c in cards:
        for nid, _ in c['md_nodes']:
            ln = line_of[nid]
            ind = re.match(r'^(\s*)', md_lines[ln - 1]).group(1)
            inserts[ln - 1].append(f'{ind}    > 〔规则卡片 {c["id"]}｜{c["title"]}｜挂载 '
                                   + '、'.join(f'第{x}条' for x in c['articles']) + f'｜规则 {len(c["rules"])} 条〕  ')
    seen = {a['art'] for a in align_res if a['status'] in ('一致', '近似')} | {n for a in align_res if a['status'] in ('引用', '改写') for n in a.get('refs', [])}
    missing = [n for n in M.SCOPE if n not in seen]
    block = ['', '* 〔本章笔记中未引用原文或条号的法条〕  ']
    for n in missing:
        block.append(f'    * 〔第{n}条｜{"、".join(art_cards.get(n, []))}〕' + ''.join(CC.paragraphs(n)) + '  ')
    inserts[hi - 1] += block
    out_lines = []
    for i, l in enumerate(new):
        out_lines.append(l)
        out_lines += inserts.get(i, [])
    out.write_text('\n'.join(out_lines), encoding='utf-8')
    return missing


# ───────────────────────── 审核表
def write_xlsx(M, E, rules, cards, rels, align_res, missing, check_note, path):
    """专家只审规则卡片：每张卡片一行，并排列出挂载法条、笔记来源及其与法条的差异、自然语言版本、形式化版本、与其他卡片的关系"""
    from openpyxl import Workbook
    from openpyxl.styles import Font
    E.DOM.update(name='civil', FR=FR, CODE=CC)
    wb = Workbook()
    wb.remove(wb.active)
    rows = []
    for i, c in enumerate(cards, 1):
        nl = c['nl']
        fmt = lambda f: '\n'.join(f'· {t}' + (f'  [{"、".join(r)}]' if r else '  [未形式化]') for t, r in nl[f])  # noqa: E731
        diffs = [a for a in align_res if a['status'] == '近似' and a['art'] in c['articles']]
        rel = []
        for kind, verb in [('优先', '被排除'), ('例外（除非）', '例外来自')]:
            src = sorted({(x['src_card'], tuple(x['src_arts'])) for x in rels if x['type'] == kind and x['dst_card'] == c['id'] and x['src_card'] != c['id']})
            rel += [f'{verb} {sc}（{"、".join(f"第{a}条" for a in arts)}）' for sc, arts in src]
            dst = sorted({(x['dst_card'], tuple(x['dst_arts'])) for x in rels if x['type'] == kind and x['src_card'] == c['id'] and x['dst_card'] != c['id']})
            rel += [f'{"优先于" if kind == "优先" else "构成例外："} {dc}（{"、".join(f"第{a}条" for a in arts)}）' for dc, arts in dst]
        dep = sorted({x['src_card'] for x in rels if x['type'].startswith('依赖') and x['dst_card'] == c['id'] and x['src_card'] != c['id']})
        if dep:
            rel.append('前提由以下卡片推出：' + '、'.join(dep))
        ext = sorted({a for x in rels if x['type'] == '章外引用' and c['id'] in x['src_card'].split('、') for a in x['dst_arts']})
        if ext:
            rel.append('本章以外引用本卡片结论的法条：' + '、'.join(f'第{a}条' for a in ext))
        rows.append([i, M.SECTIONS[c['section']].split('　')[1], c['id'], c['title'],
                     '\n'.join(f'【第{a}条】' + ''.join(CC.paragraphs(a)) for a in c['articles']),
                     md_source_text(c) or '（笔记未单列）',
                     '\n\n'.join(f'笔记：{plain(a["core"])}\n法条（{a["label"]}）：{a["official"]}' for a in diffs) or '无',
                     '\n'.join(f'{h}\n{fmt(f)}' for f, h in [('issue', '【争点】'), ('conditions', '【适用条件】'), ('exceptions', '【除外】'),
                                                              ('effects', '【法律效果】'), ('priority', '【优先与例外】'), ('distinguish', '【区分】')] if nl[f]),
                     '\n\n'.join(f'{k}（{"、".join(E.src_label(s) for s in rules[k]["srcs"])}；{E.AUTH.get(rules[k]["auth"])}）\n{E.rule_sentence(rules[k])}'
                                 for k in c['rules']),
                     '\n'.join(rel) or '无',
                     '\n'.join(f'{k}: {E.rule_formal(rules[k])}' for k in c['rules'])])
    cols = [('序号', 6), ('节', 10), ('卡片', 8), ('卡片标题', 16), ('挂载法条原文', 48), ('笔记来源（及切自该处的 LEGO 卡片）', 34), ('笔记与法条的差异', 40),
            ('自然语言版本', 52), ('形式化版本（中文命题）', 58), ('与其他卡片的关系', 30), ('形式化版本（逻辑式，供技术核对）', 40)]
    _, rng = E.review_sheet(wb, '规则卡片审核', f'规则卡片审核｜{M.CHAPTER}（第{M.SCOPE[0]}–{M.SCOPE[-1]}条）：{len(cards)} 张卡片、{len(M.RULES)} 条规则',
                            cols, rows, E.VERDICTS, centered=(3,))
    ws = wb.create_sheet('审核总览', 0)
    E.title(ws, f'规则卡片审核｜民法典 {M.BOOK} {M.CHAPTER}（第{M.SCOPE[0]}–{M.SCOPE[-1]}条）', 8)
    cols = [('审核表', 16), ('说明', 50), ('卡片数', 9), ('已确认/小改后确认', 14), ('需重大修改/删除', 14), ('有争议/无法判断', 14), ('待确认', 10), ('', 4)]
    E.header(ws, 2, cols)
    s = f"'规则卡片审核'!{rng}"
    vals = ['规则卡片审核', '每张卡片一行。请判断：①挂载的法条是否正确、完整；②自然语言版本是否忠实于法条；③形式化版本与自然语言版本是否一致；'
            '④“笔记与法条的差异”中，笔记的说法是否需要修改。', f'=ROWS({s})', f'=COUNTIF({s},"确认")+COUNTIF({s},"小改后确认")',
            f'=COUNTIF({s},"需重大修改")+COUNTIF({s},"删除")', f'=COUNTIF({s},"有争议")+COUNTIF({s},"无法判断")+COUNTIF({s},"移出主实验")',
            f'=COUNTIF({s},"待确认")']
    for j, v in enumerate(vals, 1):
        E.body_cell(ws, 3, j, v, center=j >= 3)
    ws.row_dimensions[3].height = 70
    notes = [('什么是规则卡片', '一张卡片对应笔记中的一个知识点，挂载一条或多条法条（一条法条也可挂在多张卡片下）。自然语言版本沿用 LEGO concept card 的字段，'
                                 '每一项后的方括号是形式化它的规则编号；形式化版本可由推理机直接运行。'),
             ('规则读法', '如果 A，且 B；除非有证据表明：C；则 D。“除非”：案件中没有出现 C 时规则照常适用。“下列之一〔①…；②…〕”：括号内任一项成立即可。'
                        '“并非 X〔须证得〕”：须有事实证明 X 不成立。【义务】【禁止】【许可】【权利】为规范性结论。大写字母为变量。'),
             ('来源类型', '条文明文：直接来自法条。司法解释：总则编解释。学理归纳：概念界定，如“有监护能力”“依法具有监护资格的人”。'),
             ('程序已完成的核对', check_note + '。案例只用于程序回归测试，由法条编写，不取自题库，不需要审核。')]
    r = 5
    for k, v in notes:
        ws.merge_cells(start_row=r, start_column=2, end_row=r, end_column=8)
        E.body_cell(ws, r, 1, k).font = Font(name=E.FONT, size=10, bold=True, color=E.INK)
        E.body_cell(ws, r, 2, v)
        ws.row_dimensions[r].height = 16 * (len(v) // 70 + 1) + 10
        r += 1
    path.parent.mkdir(parents=True, exist_ok=True)
    wb.save(path)


# ───────────────────────── 主流程
def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('chapter', choices=list(CHAPTERS))
    ap.add_argument('--xlsx')
    a = ap.parse_args()
    M = importlib.import_module(CHAPTERS[a.chapter])
    out = GRAPH / 'civil' / 'codebook' / a.chapter
    out.mkdir(parents=True, exist_ok=True)
    E = setup_gloss(M)

    nodes = json.load(open(GRAPH_NODES, encoding='utf-8'))
    by = {n['id']: n for n in nodes}
    E.NODES = by
    root = next(n for n in nodes if n['kind'] == 'chapter' and M.CHAPTER_MD in (n['clean'] or ''))

    def sub(i):
        o = [i]
        for c in by[i]['children']:
            o += sub(c)
        return o
    ids = sub(root['id'])
    lo, hi = by[ids[0]]['line'], max(by[i]['line'] for i in ids)
    md_lines = GRAPH_MD.read_text(encoding='utf-8').split('\n')
    # 该章的最后一行：下一个同级或更高标题之前
    while hi < len(md_lines) and not re.match(r'^#{1,3} ', md_lines[hi]) and not (md_lines[hi].startswith('* ') and hi > by[ids[-1]]['line'] + 50):
        if md_lines[hi].startswith('#'):
            break
        hi += 1
    nodes_by_line = {by[i]['line']: i for i in ids}

    rules, owner = card_model(M)
    # 卡片的笔记来源节点
    for c in M.CARDS:
        found = []
        for kw in c['md']:
            parent_kw, k = kw if isinstance(kw, tuple) else (None, kw)
            pool = ids
            if parent_kw:
                p = next(i for i in ids if parent_kw in plain(by[i]['text']))
                pool = sub(p)[1:]
            starts = [i for i in pool if re.sub(r'^[\s（(\d一二三四五六七八九十、.）)①-⑩—―-]*', '', plain(by[i]['text'])).startswith(k.lstrip('（(0123456789一二三四五六七八九十、.）)—―'))]
            nid = starts[0] if starts else next((i for i in pool if k in plain(by[i]['text'])), None)
            assert nid, f'{c["id"]}：笔记中找不到“{k}”'
            found.append((nid, E.node_path(nid) + ' › ' + plain(by[nid]['text'])[:24]))
        c['md_nodes'] = found
    cards = M.CARDS
    lego_refs(cards, by, sub)
    struct = code_structure()
    for c in cards:
        secs = {struct[x]['section'] for x in c['articles'] if x in M.SCOPE}
        assert M.SECTIONS[c['section']] in secs, f'{c["id"]} 的节与其挂载法条不符：{secs}'

    align_res = align(M, nodes_by_line, md_lines, lo, hi)
    rels = relations(M, rules, owner)
    ok, errs = build_lrml(M, rules, cards, struct, out / 'rules.lrml')

    import lrml2ddl
    rs, ovs = lrml2ddl.load(out / 'rules.lrml', taxonomy=False)
    (out / 'rules.lp').write_text(lrml2ddl.translate(rs, ovs), encoding='utf-8')
    p = subprocess.run([sys.executable, str(HERE / 'run_card_cases.py'), a.chapter, '-v'], capture_output=True, text=True)
    status, chains, cur = {}, collections.defaultdict(list), None
    for line in p.stdout.splitlines():
        m = re.match(r'(PASS|FAIL)\s+(\S+)', line)
        if m:
            cur = m.group(2)
            status[cur] = m.group(1)
        elif cur and line.startswith('    '):
            chains[cur].append(E.zh_line(line[4:]))
    summary = p.stdout.strip().splitlines()[-1] if p.stdout.strip() else p.stderr[-500:]

    write_codebook_md(M, E, rules, cards, rels, align_res, struct, out / 'codebook.md')
    missing = write_mounted(M, md_lines, align_res, cards, lo, hi, nodes_by_line, GRAPH / 'civil' / 'codebook' / 'civil_graph_mounted.markdown')
    (out / 'alignment.json').write_text(json.dumps(align_res, ensure_ascii=False, indent=1), encoding='utf-8')
    (out / 'relations.json').write_text(json.dumps(rels, ensure_ascii=False, indent=1), encoding='utf-8')
    (out / 'cards.json').write_text(json.dumps([{k: c[k] for k in ('id', 'title', 'section', 'articles', 'rules', 'related_rules', 'md_nodes', 'md_lego', 'nl')}
                                                for c in cards], ensure_ascii=False, indent=1), encoding='utf-8')

    cnt = collections.Counter(x['status'] for x in align_res)
    xsd_note = (f'LegalRuleML 通过 OASIS XSD 校验：{"是" if ok else "否 " + str(errs)}；回归测试：{summary}；'
                f'规则 {len(M.RULES)} 条（沿用 {sum(1 for r in M.RULES if r.get("reused"))} 条），优先关系 {len(M.OVERRIDES)} 条；'
                f'笔记条目 {len(align_res)} 个：一致 {cnt["一致"]}，近似 {cnt["近似"]}，引用 {cnt["引用"]}，改写 {cnt["改写"]}，无对应 {cnt["无"]}；'
                f'笔记中未引用原文或条号的法条 {len(missing)} 条：{"、".join(map(str, missing))}')
    print(xsd_note)
    if a.xlsx:
        write_xlsx(M, E, rules, cards, rels, align_res, missing, xsd_note, Path(a.xlsx))
        print('审核表 →', a.xlsx)
    return 0 if ok and 'FAIL' not in status.values() else 1


if __name__ == '__main__':
    sys.exit(main())
