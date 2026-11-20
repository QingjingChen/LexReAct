#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
从已生成的《刑法》规则卡片审核表（xlsx）反解析出 LLM 起草的草稿 JSON（用于草稿文件丢失后的恢复）。

  python src/criminal/recover_from_xlsx.py 刑法规则卡片审核.xlsx --model qwen4-max

能恢复：自然语言版本（含各项引用的规则）、规则（key、srcs、auth、note、body、heads）、新谓词的中文释义、
        跨法条的优先关系（“条间关系”列中“优先于其规则”且本行只有一条规则参与时）。
不能恢复：同一条法条内部的优先关系（审核表未输出）。恢复的行标 recovered=True，审核表会提示。
输出：graph/criminal/codebook/drafts/<编>_<章>.json（与 draft_llm.py 的格式相同）
"""
import argparse
import collections
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE), str(HERE.parent)]
import criminal_code as K  # noqa: E402
import expert_review as E  # noqa: E402
from build_criminal_rows import ROWS  # noqa: E402

from openpyxl import load_workbook  # noqa: E402

FIELD = {'争点': 'issue', '适用条件': 'conditions', '除外': 'exceptions', '法律效果': 'effects', '优先与例外': 'priority', '区分': 'distinguish'}
AUTH = {v: k for k, v in E.AUTH.items()}
HEAD = re.compile(r'^(OBL|FOR|PERM|RIGHT)\[([^\]→]*)(?:→([^\]]*))?\]\((.*)\)$')


def split_top(s, sep=', '):
    out, depth, cur, i = [], 0, '', 0
    while i < len(s):
        ch = s[i]
        if ch in '([':
            depth += 1
        elif ch in ')]':
            depth -= 1
        if depth == 0 and s.startswith(sep, i):
            out.append(cur)
            cur, i = '', i + len(sep)
            continue
        cur += ch
        i += 1
    return [x for x in out + [cur] if x.strip()]


def parse_lit(t):
    t = t.strip()
    if t.startswith('(') and ' ∨ ' in t:
        return {'or': [x.strip() for x in t[1:-1].split(' ∨ ')]}
    return t


def parse_head(t):
    m = HEAD.match(t.strip())
    if m:
        return {'type': m.group(1), 'bearer': m.group(2), 'counterparty': m.group(3) or None, 'content': m.group(4)}
    return t.strip()


def atoms_of(x):
    if isinstance(x, dict):
        return [a for c in x['or'] for a in c.split()] if 'or' in x else [x['content']]
    return [x]


def head_sig(h):
    """结论的冲突签名：(谓词或内容谓词, 极性/规范类型)"""
    if isinstance(h, dict):
        p = re.match(r'-?([a-z]\w*)', h['content']).group(1)
        return p, h['type']
    return h.lstrip('-').split('(')[0], ('-' if h.startswith('-') else '+')


CONFLICT = {('+', '-'), ('-', '+'), ('OBL', 'FOR'), ('FOR', 'OBL'), ('PERM', 'FOR'), ('FOR', 'PERM'), ('RIGHT', 'FOR'), ('FOR', 'RIGHT')}


def infer_overrides(rules, nl):
    """审核表不输出同条内的优先关系：按结论冲突推断。优先方：出现在“除外/优先与例外”中的规则；否则条件更多（更具体）的规则。"""
    exc = {k for f in ('exceptions', 'priority') for it in nl.get(f, []) for k in it['rules']}
    eff = {k for it in nl.get('effects', []) for k in it['rules']}
    out = []
    for i, r1 in enumerate(rules):
        for r2 in rules[i + 1:]:
            pairs = [(a, b) for a in map(head_sig, r1['heads']) for b in map(head_sig, r2['heads']) if a[0] == b[0] and (a[1], b[1]) in CONFLICT]
            if not pairs:
                continue
            s1 = (r1['key'] in exc and r1['key'] not in eff) - (r2['key'] in exc and r2['key'] not in eff)
            if s1 == 0:
                s1 = (len(r1['body']) > len(r2['body'])) - (len(r1['body']) < len(r2['body']))
            if s1 == 0:
                continue
            o, u = (r1, r2) if s1 > 0 else (r2, r1)
            out.append([o['key'], u['key'], f'推断：结论冲突（{pairs[0][0]}），{o["key"]} 为例外或更具体'])
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('xlsx')
    ap.add_argument('--model', default='qwen4-max')
    a = ap.parse_args()
    E.configure('criminal')
    label2key = {v['label']: k for k, v in K.articles().items()}
    srcmap = {}
    for k in K.articles():
        s = f'art{k}'
        srcmap[K.label_of(s)] = s
        for i in range(1, 12):
            try:
                srcmap[K.label_of(f'{s}#{i}')] = f'{s}#{i}'
            except Exception:  # noqa: BLE001
                break
    rows = {r['id']: r for r in json.load(open(ROWS, encoding='utf-8'))}
    out, gloss_all, stats = collections.defaultdict(dict), {}, collections.Counter()
    wb = load_workbook(a.xlsx, read_only=True)
    for ws in wb.worksheets:
        hdr = None
        for row in ws.iter_rows(values_only=True):
            if row and row[0] == '序号':
                hdr = {h: i for i, h in enumerate(row)}
                continue
            if not hdr or not isinstance(row[0], int):
                continue
            nl_cell = str(row[hdr['自然语言版本']] or '')
            if f'〔{a.model} 起草' not in nl_cell:
                continue
            key = label2key[row[hdr['规则卡片（法条）']]]
            rid = f'art:{key}'
            # 自然语言版本
            nl, field = {f: [] for f in FIELD.values()}, None
            for line in nl_cell.split('\n')[1:]:
                m = re.match(r'^【(.+)】$', line.strip())
                if m:
                    field = FIELD.get(m.group(1))
                    continue
                m = re.match(r'^· (.*)  \[(.*)\]$', line)
                if m and field:
                    keys = [] if m.group(2) == '未形式化' else m.group(2).split('、')
                    nl[field].append({'text': m.group(1), 'rules': keys})
                elif field and nl[field] and line.strip():
                    nl[field][-1]['text'] += '\n' + line
            # 规则：逻辑式 + 中文命题（srcs、auth）+ LegalRuleML 注释（note）
            logic = str(row[hdr['形式化版本（逻辑式）']] or '')
            zh = str(row[hdr['形式化版本（中文命题）']] or '')
            lrml = str(row[hdr['LegalRuleML']] or '')
            rules, preds = [], {}
            if logic != '未形式化':
                zh_text = {b.split('（', 1)[0]: b for b in zh.split('\n\n')}
                zh_blocks = {}
                for k_, b in zh_text.items():
                    m = re.match(r'^[\w-]+（(.*)；([^；（）]+)）$', b.split('\n', 1)[0])
                    if m:
                        zh_blocks[k_] = (m.group(1), m.group(2))
                notes = {m.group(1): m.group(2) for m in re.finditer(r'key="([\w-]+)"><lrml:Comment>(.*?)（[^（）]*；[a-z]+）</lrml:Comment>', lrml)}
                for line in logic.split('\n'):
                    m = re.match(r'^([\w-]+): (.*)  ⇒  (.*)$', line)
                    if not m:
                        stats['logic-unparsed'] += 1
                        continue
                    k, body, heads = m.group(1), m.group(2), m.group(3)
                    labels, auth = zh_blocks.get(k, ('', '条文明文'))
                    srcs = [srcmap.get(x, x) for x in labels.split('、') if x]
                    r = dict(key=k, srcs=srcs, body=[parse_lit(t) for t in split_top(body)] if body.strip() else [],
                             heads=[parse_head(t) for t in split_top(heads, '; ')], auth=AUTH.get(auth, 'npc'), note=notes.get(k, ''))
                    rules.append(r)
                    # 谓词释义：按渲染顺序在中文命题里找 “释义（参数）”
                    text = zh_text.get(k, '')
                    order = [x for x in r['body'] if not (isinstance(x, str) and x.startswith('~'))] + \
                            [x for x in r['body'] if isinstance(x, str) and x.startswith('~')] + r['heads']
                    cur = text.find('\n') + 1
                    for x in order:
                        for at in atoms_of(x):
                            mm = re.match(r'^[-~]?([a-z]\w*)\(([^()]*)\)$', at.strip())
                            if not mm:
                                continue
                            p, args = mm.group(1), [y.strip() for y in mm.group(2).split(',')]
                            pat = '（' + '，'.join(E.CONST.get(y, y) for y in args) + '）'
                            j = text.find(pat, cur)
                            if j < 0:
                                continue
                            seg = text[cur:j]
                            g = re.split(r'如果 |，且 | 且 |除非有证据表明：|则 |并非|〔|；|[①②③④⑤⑥⑦⑧⑨⑩] |，并且 | 或 |应当：|不得：|可以：|享有：|\n', seg)[-1].strip()
                            if g and g != p:
                                preds.setdefault(p, g)
                            cur = j + len(pat)
            gloss_all.update(preds)
            # 跨法条优先关系：“优先于其规则：why（u…）”，本行只有一条规则参与优先关系时可确定 o
            ov = []
            art_cell = str(row[hdr['挂载法条原文及条间关系']] or '')
            risk = str(row[hdr['风险提示']] or '')
            part = re.findall(r'参与优先关系（([^）]*)）', risk)
            mine = [k for k in (part[0].split('、') if part else []) if any(r['key'] == k for r in rules)]
            for m in re.finditer(r'优先于其规则：(.*?)（([^（）]*)）$', art_cell, re.M):
                if len(mine) == 1:
                    ov += [[mine[0], u, m.group(1)] for u in m.group(2).split('、')]
                else:
                    stats['override-ambiguous'] += 1
            ov += infer_overrides(rules, nl) if not ov else []
            stats['inferred'] += sum(1 for o in ov if o[2].startswith('推断'))
            stats['rows'] += 1
            stats['rules'] += len(rules)
            stats['overrides'] += len(ov)
            r_ = rows.get(rid)
            ch = r_['chapter'] if r_ else ['', '']
            f = f'{re.sub(r"[　 ]+", "", ch[0])}_{re.sub(r"[　 ]+", "", ch[1])}.json'
            out[f][rid] = dict(status='ok', model=a.model, attempts=1, errors=[], recovered=True, nl=nl, rules=rules, overrides=ov, predicates=preds)
    d = ROWS.parent / 'drafts'
    d.mkdir(parents=True, exist_ok=True)
    for f, x in out.items():
        (d / f).write_text(json.dumps(x, ensure_ascii=False, indent=1), encoding='utf-8')
    print(dict(stats), '谓词释义', len(gloss_all), '→', d)


if __name__ == '__main__':
    main()
