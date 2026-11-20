#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
整部《民法典》的规则卡片审核表：每章一个页签，每张规则卡片一行。

  python src/codebook/build_review_all.py -o review/civil_code_rule_cards.xlsx

卡片来源
  第一编第二章（自然人）：src/codebook/civil_ch02_natural_person.py 中逐条形式化的规则卡片（试点）。
  其余各章：LEGO concept card（data/civil/lego_concept_cards）。挂载法条取该概念权重 ≥ 0.6 且置信度为 high 的边（至多 6 条）；
           自然语言版本为 LEGO 卡片字段；形式化版本为 formal_rules.py 中引用这些法条的规则（尚未形式化的标注“未形式化”）。
  本章没有任何卡片挂载的法条单独成行，保证每一条法条都出现。
列
  LEGO 参考卡片节点：LEGO 卡片切自的 markdown 节点（按内容重建，见 build_codebook.lego_node_map），并按 markdown 原文与层级截取该节点下的内容。
  与其他条文的关系：由规则之间的谓词依赖、“除非”条件、优先关系，以及法条中的引致用语自动标注。
  风险提示（审核人前一列）：含学理或司法解释规则、含“除非”或优先关系、笔记与法条有实质差异、LEGO 节点匹配待确认。
"""
import argparse
import collections
import difflib
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE), str(HERE.parent)]
import build_codebook as B  # noqa: E402
import civil_ch02_natural_person as M  # noqa: E402
import civil_code as CC  # noqa: E402
import formal_rules as FR  # noqa: E402
import graph2lrml as G  # noqa: E402
from paths import GRAPH, GRAPH_MD, GRAPH_NODES  # noqa: E402

DRAFTS = GRAPH / 'civil' / 'codebook' / 'drafts'      # draft_llm.py 的输出：每章一个 JSON
ROWS = GRAPH / 'civil' / 'codebook' / 'rows.json'      # 每行的材料，供 draft_llm.py 读取


FALLBACK = ['claude-agent', 'deepseek-v4.1-flash-mb']   # qwen 版（drafts 根目录）缺的行，按此顺序取其他版本


def _suffix(d, tag):
    """备用版本的规则 key 加后缀，避免与其他版本同名（同一条法条可能挂在不同行、由不同模型起草）"""
    ren = {r['key']: f"{r['key']}-{tag}" for r in d['rules']}
    d = json.loads(json.dumps(d))
    for r in d['rules']:
        r['key'] = ren[r['key']]
    for its in d['nl'].values():
        for it in its:
            it['rules'] = [ren.get(k, k) for k in it.get('rules', [])]
    d['overrides'] = [[ren.get(o, o), ren.get(u, u), w] for o, u, w in d.get('overrides') or []]
    return d


def load_drafts(base=None):
    """每行一个版本：qwen 版优先，其次 FALLBACK 中的版本；DeepSeek 版的 key 加后缀 -ds"""
    base = base or DRAFTS
    out = {}
    for sub in [''] + FALLBACK:
        d_ = base / sub if sub else base
        for f in sorted(d_.glob('*.json')) if d_.exists() else []:
            for rid, d in json.load(open(f, encoding='utf-8')).items():
                if d.get('status') == 'ok' and rid not in out:
                    out[rid] = _suffix(d, 'ds') if sub.startswith('deepseek') else d
    return out


AGENT_NOTES = ROWS.parent / 'agent_notes.json'      # Claude agent 起草时列出的专家注意点：{行id: [..]}
BUT = re.compile(r'但是|除外|不在此限|不适用')


def draft_risk(rid, d, arts, notes_path=None):
    """起草来源与需重点核对之处，写在风险提示列"""
    m = d['model']
    if m == 'claude-agent':
        out = '⚠ 由 Claude agent 起草（司法解释为联网查证，是否逐字核对见起草者提示），已通过程序检查，待专家逐条核对\n'
        p = notes_path or AGENT_NOTES
        notes = json.load(open(p, encoding='utf-8')).get(rid, []) if p.exists() else []
        out += ''.join(f'  · 起草者提示：{n}\n' for n in notes)
    else:
        out = f'⚠ 由 {m} 起草，已通过程序检查（法条、语法、编译、XSD），待专家逐条核对\n'
    if m.startswith('deepseek'):
        out += '⚠ 单版本（DeepSeek），未经双模型核对：重点看是否加入法条没有的内容、但书与例外是否遗漏、适用范围是否被改宽或改窄\n'
        if d.get('attempts', 1) > 1:
            out += f'⚠ 重点核对：第 {d["attempts"]} 次才通过程序检查\n'
        text = ''.join(CC.text_of(f'art{x}') for x in arts if isinstance(x, int)) if arts else ''
        if BUT.search(text) and not d.get('overrides') and not d['nl'].get('exceptions') and not d['nl'].get('priority'):
            out += '⚠ 重点核对：条文有“但是／除外”，草稿未写例外或优先关系\n'
    return out


def draft_rule(r):
    """草稿中的 JSON 规则 → formal_rules.R 的形式"""
    body = [b if isinstance(b, str) else ('or', b['or']) for b in r['body']]
    heads = [h if isinstance(h, str) else (h['type'], h['bearer'], h.get('counterparty'), h['content']) for h in r['heads']]
    return dict(B.FR.R(r['key'], r['srcs'], body, heads, None, r['note'], auth=r.get('auth', 'npc')), drafted=True)

from openpyxl import Workbook  # noqa: E402
from openpyxl.formatting.rule import CellIsRule  # noqa: E402
from openpyxl.styles import Alignment, Font, PatternFill  # noqa: E402
from openpyxl.utils import get_column_letter  # noqa: E402
from openpyxl.worksheet.datavalidation import DataValidation  # noqa: E402

CELL_MAX = 32000
PILOT = ('第一编　总则', '第二章　自然人')


def cap(s, n=CELL_MAX):
    return s if len(s) <= n else s[:n] + f'\n……（共 {len(s)} 字，已截断）'


def structure():
    st = B.code_structure()
    for a in (1259, 1260):                         # 附则没有编号，code_structure 会并入上一章
        st[a] = dict(book='附则', subbook='', chapter='附则', section='')
    return st


# ───────────────────────── markdown：节点原文按层级截取
def md_excerpt(nid, by, md_lines, sub, limit=2500):
    ids = sub(nid)
    lo = by[nid]['line']
    hi = max(by[i]['line'] for i in ids)
    while hi < len(md_lines) and md_lines[hi].strip() and not re.match(r'^\s*\* |^#', md_lines[hi]):
        hi += 1                                    # 末节点的续行
    lines = [l.rstrip() for l in md_lines[lo - 1:hi] if l.strip()]
    ind = min(len(l) - len(l.lstrip()) for l in lines)
    s = '\n'.join(l[ind:] for l in lines)
    return s if len(s) <= limit else s[:limit] + f'\n……（节点 {nid} 下共 {len(ids)} 个条目，已截断）'


# ───────────────────────── 整部 markdown 与法条对齐（n 元组索引筛候选，速度可接受）
def align_all(md_lines, nodes_by_line, arts):
    U, exact = {}, collections.defaultdict(list)
    grams = collections.defaultdict(set)
    for n in arts:
        U[n] = [(lab, t, B.norm(t)) for lab, t in B.units(n)]
        for lab, t, nt in U[n]:
            exact[nt].append((n, lab, t))
        t = B.norm(''.join(CC.paragraphs(n)))
        for i in range(len(t) - 7):
            grams[t[i:i + 8]].add(n)
    res = []
    for ln, raw in enumerate(md_lines, 1):
        m = re.match(r'^(\s*)\* (.*?)(\s*)$', raw)
        if not m:
            continue
        prefix, core, tail, exam, cites = B.split_node(m.group(2))
        cn = B.norm(core)
        rec = dict(line=ln, node=nodes_by_line.get(ln), raw=m.group(2), core=core, cites=sorted(set(cites)), status='无', art=None, label='',
                   official='', ratio=0.0, cand=[])
        if len(cn) >= 6:
            hits = exact.get(cn, [])
            cand = set(cites) | {n for i in range(len(cn) - 7) for n in grams.get(cn[i:i + 8], ())}
            rec['cand'] = sorted(cand)
            if hits:
                rec['_exact'] = hits
                rec.update(status='一致')
            elif cand:
                rec['_near'] = True
        res.append(rec)
    # 第二遍：用上下文（前后 10 行已确定的法条）消歧
    def ctx(rec):
        return {x['art'] for x in res if x is not rec and abs(x['line'] - rec['line']) <= 10 and x['art']} | set(rec['cites'])
    for rec in res:
        if rec.pop('_near', False):
            cn = B.norm(rec['core'])
            c = ctx(rec)
            best, bs, br = None, 0, 0
            for n in rec['cand']:
                for lab, t, nt in U.get(n, []):
                    if abs(len(nt) - len(cn)) >= 0.5 * len(cn) + 8:
                        continue
                    r = difflib.SequenceMatcher(None, cn, nt, autojunk=False).ratio()
                    s = r + (0.1 if n in c else 0)
                    if s > bs:
                        best, bs, br = (n, lab, t), s, r
            if best and br >= 0.8:
                rec.update(status='近似', art=best[0], label=best[1], official=best[2], ratio=round(br, 3))
    for rec in res:
        hits = rec.pop('_exact', None)
        if hits:
            c = ctx(rec)
            hits.sort(key=lambda h: (h[0] not in c, '节选' in h[1], len(h[1])))
            n, lab, t = hits[0]
            rec.update(art=n, label=lab, official=t, ratio=1.0)
        if rec['status'] == '无' and rec['cites']:
            rec.update(status='引用', art=rec['cites'][0], label='、'.join(f'第{n}条' for n in rec['cites']))
        rec.pop('cand', None)
    return res


# ───────────────────────── 规则、关系、风险
def all_rules():
    ch2 = {r['key']: r for r in M.RULES}
    rules = dict(ch2)
    for _, rs in FR.MODULES.values():
        for r in rs:
            rules.setdefault(r['key'], r)
    overrides = list(M.OVERRIDES) + [o for o in FR.OVERRIDES if o[0] not in ch2 or o[1] not in ch2]
    return rules, overrides


def rule_relations(rules, overrides):
    """规则 → [(对方法条, 说明)]"""
    defs = collections.defaultdict(list)
    for k, r in rules.items():
        for h in r['heads']:
            for _, p in B.preds(h):
                defs[p].append(k)
    arts = {k: sorted({B.art_of(s) for s in r['srcs'] if s.startswith('art')}) for k, r in rules.items()}
    rel = collections.defaultdict(list)
    for k, r in rules.items():
        for b in r['body']:
            for sign, p in B.preds(b):
                for d in defs.get(p, []):
                    if d == k or set(arts[d]) == set(arts[k]):
                        continue
                    kind = {'~': '例外来源（除非）', '-': '须证得其否定', '': '前提由其推出'}[sign]
                    rel[k].append((arts[d], f'{kind}：{E.GLOSS.get(p, p)}', d))
                    back = {'~': '构成其例外', '-': '其前提须证得本结论的否定', '': '本结论是其前提'}[sign]
                    rel[d].append((arts[k], f'{back}：{E.GLOSS.get(p, p)}', k))
    for o, u, why in overrides:
        if o in rules and u in rules:
            rel[o].append((arts[u], f'优先于其规则：{why}', u))
            rel[u].append((arts[o], f'被其规则排除：{why}', o))
    return rel


XREF = re.compile(r'本法第([一二三四五六七八九十百千零]+)条|本法第([一二三四五六七八九十]+)编|前款|前两款|前条|本条第([一二三四五六七八九十]+)款|参照适用|适用本编|依照其规定')


def text_refs(n):
    out = []
    t = ''.join(CC.paragraphs(n))
    for m in XREF.finditer(t):
        g = m.group(0)
        if m.group(1):
            out.append(f'第{n}条引致第{CC.cn2int(m.group(1))}条（“{g}”）')
        elif m.group(2):
            out.append(f'第{n}条引致第{m.group(2)}编（“{g}”）')
        else:
            out.append(f'第{n}条含引致用语“{g}”')
    return list(dict.fromkeys(out))


FILLER = set('者的了即并且而等之其也所将已')
DIGIT = dict(zip('0123456789', '零一二三四五六七八九'))


def substantive(d):
    """笔记与法条的差异是否实质：去掉虚词、统一数字写法后仍不同，相似度在 0.85–0.97 之间（更低的多为笔记的概括改写）"""
    f = lambda t: ''.join(DIGIT.get(ch, ch) for ch in B.norm(t) if ch not in FILLER)  # noqa: E731
    core = re.sub(r'^[^，。：:；]{1,8}[：:。，]\s*', '', B.plain(d['core']))     # 笔记的小标题前缀，如“责任：”“第三，”
    a, b = f(d['core']), f(d['official'])
    if a == b or f(core) == b:
        return False
    a = min(a, f(core), key=lambda x: -difflib.SequenceMatcher(None, x, b, autojunk=False).ratio())
    if a.replace('从', '自') == b.replace('从', '自'):
        return False
    return 0.85 <= difflib.SequenceMatcher(None, a, b, autojunk=False).ratio() < 0.97


def diff_kind(d):
    if substantive(d):
        return '【实质】'
    return '【改写】' if d['ratio'] < 0.85 else '【措辞】'


def risk_of(rule_keys, rules, overrides, diffs, lego_flags=()):
    why = []
    rk = [rules[k] for k in rule_keys]
    doc = [r['key'] for r in rk if r['auth'] != 'npc']
    if doc:
        why.append(f'含学理或司法解释规则 {"、".join(doc[:4])}，不要求逐字对应法条，请判断是否为通说、引用是否准确')
    naf = [r['key'] for r in rk if any(isinstance(b, str) and b.startswith('~') for b in r['body'])]
    if naf:
        why.append(f'含“除非”条件（{"、".join(naf[:4])}{"等" if len(naf) > 4 else ""}）：缺少该事实时照常适用，请核对推定方向')
    ov = sorted({x for o, u, _ in overrides for x in (o, u) if x in rule_keys})
    if ov:
        why.append(f'参与优先关系（{"、".join(ov[:4])}{"等" if len(ov) > 4 else ""}），请核对优先方向')
    sub_ = [d for d in diffs if substantive(d)]
    if sub_:
        why.append(f'笔记与法条有 {len(sub_)} 处实质性表述差异（见“笔记与法条的差异”）')
    return '\n'.join(f'⚠ {w}' for w in why)


# ───────────────────────── 工作表
INK = '1F2937'
COLS = [('序号', 6), ('节', 12), ('LEGO 概念卡片', 22), ('LEGO 参考卡片节点（markdown 原文）', 52), ('markdown 原文中挂载的法条', 16),
        ('挂载法条原文及条间关系', 56), ('自然语言版本', 50), ('形式化版本（中文命题）', 52), ('形式化版本（逻辑式）', 42), ('LegalRuleML', 60),
        ('双模型核对（Kimi）', 56),
        ('专家结论', 13), ('专家建议文本', 32), ('专家理由', 28), ('补充法源', 20), ('风险提示', 34), ('审核人', 10), ('审核日期', 12)]
NCONTENT = 11
VCOL = NCONTENT + 1
RISKCOL = NCONTENT + 5
RISK_FILL = PatternFill('solid', fgColor='FDE9D9')


def sheet_name(book, chapter, used):
    bk = re.match(r'第(.)编', book)
    ch = re.match(r'第([一二三四五六七八九十]+)章　?(.*)', chapter)
    name = '附则' if not bk else f'{bk.group(1)}编{CC.cn2int(ch.group(1)):02d}章 {ch.group(2)}'
    name = re.sub(r'[\\/?*\[\]:]', '', name)[:31]
    while name in used:
        name = name[:29] + '_2'
    used.add(name)
    return name


def write_sheet(wb, name, title, legend, rows):
    ws = wb.create_sheet(name)
    E.title(ws, title, len(COLS))
    ws.merge_cells(start_row=2, start_column=1, end_row=2, end_column=len(COLS))
    c = ws.cell(2, 1, legend)
    c.font = Font(name=E.FONT, size=9, color='595959')
    c.alignment = Alignment(wrap_text=True, vertical='top')
    ws.row_dimensions[2].height = 54
    E.header(ws, 3, COLS)
    for i, row in enumerate(rows):
        r = 4 + i
        vals = row[:NCONTENT] + ['待确认', None, None, None, row[NCONTENT], None, None]
        for j, v in enumerate(vals, 1):
            cell = E.body_cell(ws, r, j, v, center=j in (1, 2, 5))
            if j == VCOL:
                cell.fill = E.VERDICT_FILL
                cell.alignment = Alignment(horizontal='center', vertical='top', wrap_text=True)
            if j == RISKCOL and v:
                cell.fill = RISK_FILL
                cell.font = Font(name=E.FONT, size=10, color='9C0006')
            if j == 10:
                cell.font = Font(name='Menlo', size=8, color=INK)
        E.fit_height(ws, r, COLS[:NCONTENT], vals[:NCONTENT])
    last = max(3 + len(rows), 4)
    L = get_column_letter(VCOL)
    rng = f'{L}4:{L}{last}'
    dv = DataValidation(type='list', formula1='"' + ','.join(E.VERDICTS + ['待确认']) + '"', allow_blank=True)
    dv.add(rng)
    ws.add_data_validation(dv)
    for v, fill, color in [('确认', 'E2F0D9', '375623'), ('小改后确认', 'E2F0D9', '375623'), ('需重大修改', 'FCE4D6', '9C0006'),
                           ('删除', 'FCE4D6', '9C0006'), ('待确认', 'E7E6E6', '666666'), ('有争议', 'FFF2CC', '7F6000'), ('无法判断', 'FFF2CC', '7F6000')]:
        ws.conditional_formatting.add(rng, CellIsRule(operator='equal', formula=[f'"{v}"'], fill=PatternFill('solid', bgColor=fill), font=Font(color=color)))
    ws.freeze_panes = 'D4'
    ws.auto_filter.ref = f'A3:{get_column_letter(len(COLS))}{last}'


def load_crosscheck(base, law):
    out = {}
    for f in sorted((base / 'crosscheck').glob(f'{law}_*.json')) if (base / 'crosscheck').exists() else []:
        out.update({k: v for k, v in json.load(open(f, encoding='utf-8')).items() if v.get('status') == 'ok'})
    return out


def xcheck_text(x):
    """Kimi 核对结果 → (单元格文字, 风险提示行)"""
    if not x:
        return '（未核对）', ''
    a, b = x.get('a_name', 'A'), x.get('b_name', 'B')
    out = [f'A＝{a}，B＝{b}' + ('（只有 A 版通过程序检查）' if x.get('only_one') else ''),
           f'一致程度：{x.get("agreement", "")}；更可取：{x.get("preferred", "")}']
    for d in x.get('differences') or []:
        out.append(f'· 【{d.get("judgement", "")}】{d.get("point", "")}\n  A：{d.get("A", "")}\n  B：{d.get("B", "")}\n  依据：{d.get("law", "")}'
                   + (f'\n  理由：{d["reason"]}' if d.get('reason') else ''))
    for m in x.get('missing') or []:
        out.append(f'· 【两版都遗漏】{m.get("content", "")}（{m.get("law", "")}）')
    if x.get('expert_notes'):
        out.append('需专家判断：\n' + '\n'.join(f'  - {n}' for n in x['expert_notes']))
    risk = '⚠ 双模型核对：需专家判断（见“双模型核对”列）' if x.get('expert_check') else ''
    return cap('\n'.join(out), 12000), risk


def fmt_rules(keys, rules):
    zh = '\n\n'.join(f'{k}（{"、".join(E.src_label(s) for s in rules[k]["srcs"])}；{E.AUTH.get(rules[k]["auth"], rules[k]["auth"])}）\n{E.rule_sentence(rules[k])}'
                     for k in keys)
    logic = '\n'.join(f'{k}: {E.rule_formal(rules[k])}' for k in keys)
    lrml = '\n'.join(G.rule_xml(rules[k], '') for k in keys)
    return zh or '未形式化', logic or '未形式化', cap(lrml) if lrml else '未形式化'


def excerpt_partition(nid, owned, by, md_lines, sub, limit=3000):
    """节点下的 markdown 原文（保留层级）；属于下级 LEGO 卡片的子树只留一行占位"""
    skip = {}
    for i in sub(nid)[1:]:
        if i in owned:
            ids = sub(i)
            skip[by[i]['line']] = (max(by[x]['line'] for x in ids), owned[i])
    lo, hi = by[nid]['line'], max(by[i]['line'] for i in sub(nid))
    while hi < len(md_lines) and md_lines[hi].strip() and not re.match(r'^\s*\* |^#', md_lines[hi]):
        hi += 1
    out, ln = [], lo
    while ln <= hi:
        if ln in skip:
            end, cards = skip[ln]
            ind = re.match(r'^(\s*)', md_lines[ln - 1]).group(1)
            out.append(f'{ind}* 〔下级卡片 {"、".join(cards)}：{B.plain(md_lines[ln - 1].strip()[2:])[:30]}……〕')
            ln = end + 1
            continue
        if md_lines[ln - 1].strip():
            out.append(md_lines[ln - 1].rstrip())
        ln += 1
    ind = min(len(l) - len(l.lstrip()) for l in out)
    s = '\n'.join(l[ind:] for l in out)
    return s if len(s) <= limit else s[:limit] + '\n……（已截断）'


def main():
    global E
    ap = argparse.ArgumentParser()
    ap.add_argument('-o', '--out', default=str(HERE.parent.parent / 'review' / 'civil_code_rule_cards.xlsx'))
    a = ap.parse_args()
    E = B.setup_gloss(M)
    E.DOM.update(name='civil', FR=FR, CODE=CC)
    nodes = json.load(open(GRAPH_NODES, encoding='utf-8'))
    by = {n['id']: n for n in nodes}
    E.NODES = by
    memo = {}

    def sub(i):
        if i not in memo:
            o = [i]
            for c in by[i]['children']:
                o += sub(c)
            memo[i] = o
        return memo[i]
    md_lines = GRAPH_MD.read_text(encoding='utf-8').split('\n')
    nodes_by_line = {n['line']: n['id'] for n in nodes}
    st = structure()
    arts = sorted(st)
    al = align_all(md_lines, nodes_by_line, arts)
    al_by_node = collections.defaultdict(list)
    for x in al:
        if x['node']:
            al_by_node[x['node']].append(x)
    rules, overrides = all_rules()
    drafts = load_drafts()
    xc = load_crosscheck(DRAFTS.parent, 'civil')
    for rid, d in drafts.items():
        for r in d['rules']:
            rules[r['key']] = draft_rule(r)
        overrides += [tuple(o) for o in d.get('overrides', [])]
        E.GLOSS.update(d.get('predicates', {}))
    rel = rule_relations(rules, overrides)

    # ── LEGO 卡片 → markdown 节点；同一节点上的多张卡片合为一行；下级卡片的子树从上级中划出
    nm = B.lego_node_map(by)
    lego_cards = {}
    seen = collections.Counter()
    for l in open(B.LEGO / 'nodes.jsonl', encoding='utf-8'):
        x = json.loads(l)
        seen[x['id']] += 1
        lego_cards[f'{x["id"]}#{seen[x["id"]]}'] = x['card']
    owned = collections.defaultdict(list)          # 节点 → LEGO 卡片
    for k, m in nm.items():
        if m['score'] >= 0.3:
            owned[m['node']].append(k)
    owner_of = {}
    for nid in sorted(owned, key=lambda i: len(sub(i)), reverse=True):   # 先大后小，小的覆盖
        for i in sub(nid):
            owner_of[i] = nid
    part = collections.defaultdict(list)           # 卡片节点 → 其划分内的节点
    for i, o in owner_of.items():
        part[o].append(i)

    def arts_in(nids):
        cnt = collections.Counter()
        notes = collections.defaultdict(list)
        for i in nids:
            for x in al_by_node.get(i, []):
                found = set(x['cites']) | ({x['art']} if x['art'] else set())
                for n in found:
                    if n in st:
                        cnt[n] += 1
                        notes[n].append(x)
            if not al_by_node.get(i):          # 标题行等非列表项：只取条号
                for n in B.civil_cites(by[i]['text'] or ''):
                    if n in st:
                        cnt[n] += 1
        return cnt, notes

    lego_edges = collections.defaultdict(list)
    for l in open(B.LEGO / 'edges.jsonl', encoding='utf-8'):
        e = json.loads(l)
        lego_edges[e['node']].append((e['weight'], e['article'], e['confidence']))

    def lego_chapter(keys):
        sc = collections.Counter()
        for k in keys:
            for w, x, _ in sorted(lego_edges[k.split('#')[0]], reverse=True)[:5]:
                sc[(st[x]['book'], st[x]['chapter'])] += w
        return sc.most_common(1)[0][0] if sc else None

    rows_by_ch = collections.defaultdict(list)
    mounted_in_ch = collections.defaultdict(set)
    rule_home = {}
    cardrows = []
    for nid, keys in owned.items():
        cnt, notes = arts_in(part[nid])
        xs = sorted(cnt)
        if xs:
            ch = collections.Counter((st[x]['book'], st[x]['chapter']) for x in xs for _ in range(cnt[x])).most_common(1)[0][0]
        else:                                         # markdown 中没有引用法条：按 LEGO 边的权重归章，不挂载法条
            ch = lego_chapter(keys)
            if ch is None:
                continue
        sup = sorted({x for k in keys for w, x, cf in lego_edges[k.split('#')[0]]
                      if w >= 0.6 and cf == 'high' and x not in cnt and (st[x]['book'], st[x]['chapter']) == ch})
        xs = sorted(set(xs) | set(sup))
        cardrows.append(dict(node=nid, keys=keys, arts=xs, cnt=cnt, notes=notes, ch=ch, sup=set(sup)))
        for x in xs:
            mounted_in_ch[(st[x]['book'], st[x]['chapter'])].add(x)
    # 规则归属：挂载其首条法条、引用次数最多的那一行
    for k, r in rules.items():
        a0 = B.art_of(r['srcs'][0])
        cands = [(cr['cnt'][a0], cr['ch'] == (st[a0]['book'], st[a0]['chapter']), i) for i, cr in enumerate(cardrows) if a0 in cr['arts']]
        rule_home[k] = ('card', max(cands)[2]) if cands else ('art', a0)
    card_index = {f'card:{cr["node"]}': i for i, cr in enumerate(cardrows)}
    for rid, d in drafts.items():                     # 起草的规则留在起草它的那一行
        for r in d['rules']:
            rule_home[r['key']] = ('card', card_index[rid]) if rid in card_index else ('art', int(rid.split(':')[1]))
    dump = []
    pilot_nl = [(t, refs, f) for c in M.CARDS for f in ('issue', 'conditions', 'exceptions', 'effects', 'priority', 'distinguish') for t, refs in c['nl'][f]]
    FIELD = dict(issue='【争点】', conditions='【适用条件】', exceptions='【除外】', effects='【法律效果】', priority='【优先与例外】', distinguish='【区分】')

    def nl_text(rule_keys, lego_keys, rid=None):
        if rid in drafts:
            d = drafts[rid]
            return f'〔{d["model"]} 起草，待专家审核〕\n' + '\n'.join(
                f'{FIELD[f]}\n' + '\n'.join(f'· {it["text"]}  [{"、".join(it.get("rules", [])) or "未形式化"}]' for it in d['nl'][f])
                for f in FIELD if d['nl'].get(f))
        ks = set(rule_keys)
        if ks:
            parts = collections.defaultdict(list)
            for t, refs, f in pilot_nl:
                if refs and set(refs) <= ks and t not in parts[f]:
                    parts[f].append(f'· {t}  [{"、".join(refs)}]')
            covered = {k for t, refs, f in pilot_nl if refs and set(refs) <= ks for k in refs}
            extra = [f'· {rules[k]["note"]}  [{k}]' for k in rule_keys if k not in covered]
            if extra:
                parts['effects'] += extra
            return '\n'.join(f'{FIELD[f]}\n' + '\n'.join(v) for f, v in parts.items() if v)
        ref = []
        for k in lego_keys:
            cd = lego_cards[k]
            ref.append(f'〔待综合；以下为 LEGO 原卡片 {k}，供参考〕\n' + '\n'.join(
                f'{h}\n' + '\n'.join(f'· {t}' for t in cd.get(f, [])) for f, h in
                [('issue_frames', '【争点】'), ('positive_conditions', '【适用条件】'), ('negative_conditions', '【除外 / 消极条件】'),
                 ('legal_effects', '【法律效果】'), ('priority_or_exception', '【优先与例外】')] if cd.get(f)))
        return cap('\n\n'.join(ref), 6000)

    def art_col(xs, rule_keys):
        out = ['\n'.join(f'【第{x}条】' + ''.join(CC.paragraphs(x)) for x in xs)]
        grp = collections.OrderedDict()
        own = set(xs)
        for k in rule_keys:
            for other, s_, rk in rel.get(k, []):
                others = tuple(o for o in other if o not in own)
                inner = tuple(o for o in other if o in own)
                key = (others or inner, s_, bool(others))
                grp.setdefault(key, []).append(rk)
        lines = [f'{"与" if ext else "本卡片内 "}{"、".join(f"第{o}条" for o in arts_)}：{s_}（{"、".join(dict.fromkeys(rks))}）'
                 for (arts_, s_, ext), rks in sorted(grp.items(), key=lambda kv: ('优先' not in kv[0][1] and '排除' not in kv[0][1] and '例外' not in kv[0][1], not kv[0][2]))]
        for x in xs:
            lines += text_refs(x)
        lines = list(dict.fromkeys(lines))
        out.append('—— 条间关系 ——\n' + ('\n'.join(lines) if lines else '（未形式化，暂无可导出的关系；条文中无引致用语）'))
        return cap('\n\n'.join(out))

    def mounted_col(xs, notes, sup=()):
        out = []
        for x in xs:
            if x in sup:
                out.append(f'第{x}条（LEGO 关联，笔记未写条号）')
                continue
            ns = notes.get(x, [])
            tag = '原文' if any(n['status'] == '一致' and n['art'] == x for n in ns) else ('近似' if any(n['status'] == '近似' and n['art'] == x for n in ns) else '引用')
            sub_ = [n for n in ns if n['status'] == '近似' and n['art'] == x and substantive(n)]
            out.append(f'第{x}条（{tag}{"，有实质差异" if sub_ else ""}）')
        return '\n'.join(out)

    def xc_cells(rid, risk):
        text, flag = xcheck_text(xc.get(rid)) if rid in drafts or rid in xc else ('（未起草）', '')
        return [text, (flag + '\n' + risk).strip()]

    legend = ('层级：编 › 章 › 节 › LEGO 概念卡片。“markdown 原文中挂载的法条”取自该卡片对应的笔记节点（下级卡片的节点除外）中引用或抄录的条文；'
              '原文＝笔记抄录了条文，近似＝抄录但有出入，引用＝只写了条号；“LEGO 关联”＝笔记未写条号、由 LEGO 卡片与本章法条的强关联（权重≥0.6）补挂。自然语言版本、形式化版本、LegalRuleML 由卡片、笔记和法条原文综合而成；'
              '尚未形式化的卡片标“待综合”，并附 LEGO 原卡片供参考。读法：如果 A，且 B；除非有证据表明：C；则 D。')

    for i, cr in enumerate(cardrows):
        keys_r = [k for k, h in rule_home.items() if h == ('card', i)]
        cr['rules'] = keys_r
        titles = '\n'.join(f'{k} {lego_cards[k]["title"]}（匹配度 {nm[k]["score"]}{"" if nm[k]["confident"] else "，待确认"}）' for k in cr['keys'])
        src = f'节点 {cr["node"]}：{E.node_path(cr["node"])}\n' + excerpt_partition(cr['node'], owned, by, md_lines, sub)
        rid = f'card:{cr["node"]}'
        zh, logic, lrml = fmt_rules(keys_r, rules)
        diffs = [n for x in cr['arts'] for n in cr['notes'].get(x, []) if n['status'] == '近似' and n['art'] == x]
        risk = risk_of(keys_r, rules, overrides, diffs)
        if rid in drafts:
            risk = draft_risk(rid, drafts[rid], cr['arts']) + risk
        dump.append(dict(id=rid, chapter=list(cr['ch']), lego={k: lego_cards[k] for k in cr['keys']}, markdown=src,
                         articles=cr['arts'], mounted=mounted_col(cr['arts'], cr['notes'], cr['sup']),
                         rules=[k for k in keys_r if not rules[k].get('drafted')]))
        if diffs and any(substantive(d) for d in diffs):
            risk += '\n' + '\n'.join(f'  · 笔记（{d["node"]}）：{B.plain(d["core"])[:60]}\n    法条（{d["label"]}）：{d["official"][:60]}' for d in diffs if substantive(d))
        secs = [st[x]['section'] for x in cr['arts'] if (st[x]['book'], st[x]['chapter']) == cr['ch'] and st[x]['section']]
        sec = collections.Counter(secs).most_common(1)[0][0].split('　')[-1] if secs else '—'
        in_ch = [x for x in cr['arts'] if (st[x]['book'], st[x]['chapter']) == cr['ch']]
        if not cr['arts']:
            ref = sorted(lego_edges[cr['keys'][0].split('#')[0]], reverse=True)[:3]
            in_ch = [x for _, x, _ in ref if (st[x]['book'], st[x]['chapter']) == cr['ch']] or [0]
        rows_by_ch[cr['ch']].append((min(in_ch),
                                     [None, sec, titles, cap(src), mounted_col(cr['arts'], cr['notes'], cr['sup']) or '（markdown 中未引用法条）',
                                      art_col(cr['arts'], keys_r) if cr['arts'] else '（未挂载法条。LEGO 原卡片关联：'
                                      + '、'.join(f'第{x}条' for _, x, _ in sorted(lego_edges[cr['keys'][0].split('#')[0]], reverse=True)[:5]) + '）',
                                      nl_text(keys_r, cr['keys'], rid), zh, logic, lrml, *xc_cells(rid, risk)]))
    # 本章没有任何卡片挂载的法条
    nolego = 0
    for x in arts:
        ch = (st[x]['book'], st[x]['chapter'])
        if x in mounted_in_ch[ch]:
            continue
        nolego += 1
        keys_r = [k for k, h in rule_home.items() if h == ('art', x)]
        occ = [n for n in al if x in n['cites'] or n['art'] == x]
        src = '\n\n'.join(f'节点 {n["node"]}：{E.node_path(n["node"]) if n["node"] else ""}\n{n["raw"]}' for n in occ[:3]) or '笔记中未引用原文或条号'
        rid = f'art:{x}'
        zh, logic, lrml = fmt_rules(keys_r, rules)
        risk = risk_of(keys_r, rules, overrides, [n for n in occ if n['status'] == '近似' and n['art'] == x])
        if rid in drafts:
            risk = draft_risk(rid, drafts[rid], [x]) + risk
        dump.append(dict(id=rid, chapter=list(ch), lego={}, markdown=src, articles=[x], mounted=f'第{x}条' if occ else '—',
                         rules=[k for k in keys_r if not rules[k].get('drafted')]))
        rows_by_ch[ch].append((x, [None, (st[x]['section'].split('　')[-1] or '—'), '（无 LEGO 卡片）', src,
                                   f'第{x}条' if occ else '—', art_col([x], keys_r), nl_text(keys_r, [], rid) or '待综合', zh, logic, lrml, *xc_cells(rid, risk)]))
    ROWS.write_text(json.dumps(dump, ensure_ascii=False, indent=1), encoding='utf-8')
    wb = Workbook()
    wb.remove(wb.active)
    chapters = collections.OrderedDict()
    for n in arts:
        chapters.setdefault((st[n]['book'], st[n]['chapter']), []).append(n)
    used, nrows, nrisk = set(), 0, 0
    for ch, xs in chapters.items():
        rows = [r for _, r in sorted(rows_by_ch[ch], key=lambda t: t[0])]
        for i, r in enumerate(rows, 1):
            r[0] = i
        nrows += len(rows)
        nrisk += sum(1 for r in rows if r[NCONTENT])
        sub_ = st[xs[0]]['subbook']
        title = f'{ch[0].replace("　", "")}{" " + sub_.replace("　", "") if sub_ else ""} {ch[1].replace("　", " ")}（第{xs[0]}–{xs[-1]}条，{len(xs)} 条）'
        write_sheet(wb, sheet_name(*ch, used), title, legend, rows)
    out = Path(a.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    wb.save(out)
    formal = sum(1 for cr in cardrows if cr['rules'])
    print(f'起草草稿：{len(drafts)} 行，规则 {sum(len(d["rules"]) for d in drafts.values())} 条')
    print(f'{len(chapters)} 个页签；{nrows} 行：LEGO 卡片行 {len(cardrows)}（其中已形式化 {formal}），无 LEGO 卡片的法条 {nolego}；'
          f'有风险提示 {nrisk} 行；markdown 中有法条的 LEGO 卡片节点 {len(cardrows)}/{len(owned)} → {out}')


if __name__ == '__main__':
    main()
