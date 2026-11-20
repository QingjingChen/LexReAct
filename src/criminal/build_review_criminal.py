#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
《刑法》规则卡片审核表：每章一个页签，每条法条一行（刑法没有 LEGO 卡片，一条法条即一张规则卡片）。格式同民法典审核表。

  python src/criminal/build_criminal_rows.py
  python src/codebook/draft_llm.py --law criminal --all
  python src/criminal/build_review_criminal.py -o review/criminal_rule_cards.xlsx
"""
import argparse
import collections
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE), str(HERE.parent), str(HERE.parent / 'codebook')]
import build_codebook as B  # noqa: E402
import build_review_all as BR  # noqa: E402
import crim2lrml  # noqa: E402
import crim_rules as CR  # noqa: E402
import criminal_code as K  # noqa: E402
import expert_review as E  # noqa: E402
from build_criminal_rows import ROWS  # noqa: E402

from openpyxl import Workbook  # noqa: E402

DRAFTS = ROWS.parent / 'drafts'
FIELD = dict(issue='【争点】', conditions='【适用条件】', exceptions='【除外】', effects='【法律效果】', priority='【优先与例外】', distinguish='【区分】')


def art_key(s):
    m = re.match(r'art(\d+(?:-\d)?)', s)
    return m.group(1) if m else None


def sort_key(k):
    return tuple(int(x) for x in k.split('-'))


def label(k):
    return K.articles()[k]['label']


def relations(rules, overrides):
    defs = collections.defaultdict(list)
    for k, r in rules.items():
        for h in r['heads']:
            for _, p in B.preds(h):
                defs[p].append(k)
    arts = {k: sorted({art_key(s) for s in r['srcs'] if art_key(s)}, key=sort_key) for k, r in rules.items()}
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


XREF = re.compile(r'本法第([一二三四五六七八九十百零]+)条(之[一二三四五六七八九十])?|前款|前两款|前三款|前条|本条第([一二三四五六七八九十]+)款|依照前|分别依照')


def text_refs(k):
    out = []
    for m in XREF.finditer(''.join(K.articles()[k]['paras'])):
        out.append(f'{label(k)}含引致用语“{m.group(0)}”')
    return list(dict.fromkeys(out))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('-o', '--out', default=str(HERE.parent.parent / 'review' / 'criminal_rule_cards.xlsx'))
    a = ap.parse_args()
    E.configure('criminal')
    BR.E = E
    rows = json.load(open(ROWS, encoding='utf-8'))
    drafts = BR.load_drafts(DRAFTS)          # qwen 版优先，缺的行取 DeepSeek 版（key 加后缀 -ds）
    rules = {r['key']: r for _, rs in CR.MODULES.values() for r in rs}
    overrides = list(CR.OVERRIDES)
    for d in drafts.values():
        for r in d['rules']:
            rules[r['key']] = BR.draft_rule(r)
        overrides += [tuple(o) for o in d.get('overrides', [])]
        E.GLOSS.update(d.get('predicates', {}))
    rel = relations(rules, overrides)
    xc = BR.load_crosscheck(ROWS.parent, 'criminal')
    home = collections.defaultdict(list)
    for k, r in rules.items():
        if r.get('drafted'):
            continue
        home[art_key(r['srcs'][0]) if art_key(r['srcs'][0]) else '17'].append(k)
    for rid, d in drafts.items():
        home[rid.split(':')[1]] += [r['key'] for r in d['rules']]

    def fmt(keys):
        zh = '\n\n'.join(f'{k}（{"、".join(E.src_label(s) for s in rules[k]["srcs"])}；{E.AUTH.get(rules[k]["auth"], rules[k]["auth"])}）\n{E.rule_sentence(rules[k])}' for k in keys)
        logic = '\n'.join(f'{k}: {E.rule_formal(rules[k])}' for k in keys)
        lrml = '\n'.join(crim2lrml.rule_xml(rules[k], '') for k in keys)
        return zh or '未形式化', logic or '未形式化', BR.cap(lrml) if lrml else '未形式化'

    def nl(k, keys):
        d = drafts.get(f'art:{k}')
        if d:
            return f'〔{d["model"]} 起草，待专家审核〕\n' + '\n'.join(
                f'{FIELD[f]}\n' + '\n'.join(f'· {it["text"]}  [{"、".join(it.get("rules", [])) or "未形式化"}]' for it in d['nl'][f])
                for f in FIELD if d['nl'].get(f))
        if keys:
            return '【法律效果】\n' + '\n'.join(f'· {rules[x]["note"]}  [{x}]' for x in keys)
        return '待综合'

    def art_col(k, keys):
        a_ = K.articles()[k]
        out = [f'【{a_["label"]}】' + ''.join(a_['paras'])]
        grp = collections.OrderedDict()
        for x in keys:
            for other, s_, rk in rel.get(x, []):
                others = tuple(o for o in other if o != k)
                if others:
                    grp.setdefault((others, s_), []).append(rk)
        lines = [f'与{"、".join(label(o) for o in arts_)}：{s_}（{"、".join(dict.fromkeys(rks))}）' for (arts_, s_), rks in
                 sorted(grp.items(), key=lambda kv: ('优先' not in kv[0][1] and '排除' not in kv[0][1] and '例外' not in kv[0][1]))]
        lines += text_refs(k)
        out.append('—— 条间关系 ——\n' + ('\n'.join(dict.fromkeys(lines)) if lines else '（未形式化，暂无可导出的关系；条文中无引致用语）'))
        return BR.cap('\n\n'.join(out))

    BR.COLS = [('序号', 6), ('节', 12), ('规则卡片（法条）', 16), ('刑法导图节点（原文）', 52), ('导图中挂载的法条', 14)] + BR.COLS[5:]
    legend = ('层级：编 › 章 › 节 › 规则卡片。刑法没有 LEGO 卡片，一条法条即一张规则卡片；“刑法导图节点”为导图中引用该条的节点及其下两层内容。'
              '自然语言版本、形式化版本、LegalRuleML 由法条原文与导图综合而成（标“起草”的由 LLM 起草并通过程序检查，待专家核对）。'
              '读法：如果 A，且 B；除非有证据表明：C；则 D。')
    by_ch = collections.OrderedDict()
    for r in sorted(rows, key=lambda r: sort_key(r['articles'][0])):
        by_ch.setdefault(tuple(r['chapter']), []).append(r)
    wb = Workbook()
    wb.remove(wb.active)
    used, n_draft, n_formal = set(), 0, 0
    for ch, rs in by_ch.items():
        out_rows = []
        for i, r in enumerate(rs, 1):
            k = r['articles'][0]
            keys = home.get(k, [])
            zh, logic, lrml = fmt(keys)
            risk = BR.risk_of(keys, rules, overrides, [])
            if f'art:{k}' in drafts:
                n_draft += 1
                risk = BR.draft_risk(f'art:{k}', drafts[f'art:{k}'], [], ROWS.parent / 'agent_notes.json') + risk
            n_formal += bool(keys)
            out_rows.append([i, (r['section'].split('　')[-1] if r['section'] else '—'), label(k), BR.cap(r['markdown']),
                             label(k) if not r['markdown'].startswith('（') else '—', art_col(k, keys), nl(k, keys), zh, logic, lrml,
                             *((lambda t: [t[0], (t[1] + '\n' + risk).strip()])(BR.xcheck_text(xc.get(f'art:{k}')) if f'art:{k}' in drafts or f'art:{k}' in xc
                                                                               else ('（未起草）', '')))])
        xs = [r['articles'][0] for r in rs]
        title = f'刑法 {ch[0].replace("　", "")} {ch[1].replace("　", " ")}（{label(xs[0])}–{label(xs[-1])}，{len(xs)} 条）'
        BR.write_sheet(wb, BR.sheet_name(ch[0], ch[1], used), title, legend, out_rows)
    out = Path(a.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    wb.save(out)
    print(f'{len(by_ch)} 个页签；{len(rows)} 行；已形式化 {n_formal} 条（其中 LLM 起草 {n_draft} 条）→ {out}')


if __name__ == '__main__':
    main()
