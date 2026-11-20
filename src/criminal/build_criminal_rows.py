#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
刑法：为每一条法条准备起草材料（刑法没有 LEGO 卡片，一条法条即一张规则卡片）→ graph/criminal/codebook/rows.json

每行：编、章、节；法条原文；刑法导图中引用该条的节点及其下两层内容（按导图层级缩进）；已有规则（crim_rules.py）。
"""
import collections
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE), str(HERE.parent)]
import crim_rules as CR  # noqa: E402
import criminal_code as K  # noqa: E402
from paths import CRIM_KB, CRIM_NODES, CRIMINAL_CODE  # noqa: E402

ROWS = CRIM_KB / 'codebook' / 'rows.json'
CN = '一二三四五六七八九十'


def structure():
    """条文键 → {book, chapter, section}（正文部分，跳过开头的目录）"""
    lines = CRIMINAL_CODE.read_text(encoding='utf-8').split('\n')
    start = next(i for i, l in enumerate(lines) if re.match(r'^\s*第一条', l.strip()))
    start = max(i for i in range(start) if re.match(r'^第一编', lines[i].strip()))
    cur = dict(book='', chapter='', section='')
    out, keys = {}, list(K.articles())
    k = 0
    for l in lines[start:]:
        s = l.strip()
        m = re.match(r'^第([一二三四五六七八九十]+)(编|章|节)[　 ]+(.+)$', s)
        if m:
            name = f'第{m.group(1)}{m.group(2)}　{re.sub(r"[　 ]+", "", m.group(3))}'
            lvl = {'编': 'book', '章': 'chapter', '节': 'section'}[m.group(2)]
            cur[lvl] = name
            if lvl == 'book':
                cur['chapter'] = cur['section'] = ''
            elif lvl == 'chapter':
                cur['section'] = ''
            continue
        if re.match(r'^第[一二三四五六七八九十百零]+条(之[一二三四五六七八九十])?[　 ]', s) and k < len(keys):
            out[keys[k]] = dict(cur)
            k += 1
    assert k == len(keys), (k, len(keys))
    return out


def main():
    nodes = {n['id']: n for n in json.load(open(CRIM_NODES, encoding='utf-8'))}
    cites = collections.defaultdict(list)
    OTHER = re.compile(r'《(?!(?:中华人民共和国)?刑法》)[^》]{1,20}》|俄罗斯|德国|日本|法国|意大利|美国|瑞士|英国|苏俄|旧中国|台湾')
    for n in nodes.values():
        for c in n['cites']:
            if c['law'] != 'criminal-law':
                continue
            inferred = c.get('inferred', False)
            if inferred and OTHER.search(n['text'] or ''):       # 推断引用但节点在谈其他法律或外国法：不采用
                continue
            cites[str(c['art'])].append((inferred, n['id']))

    def path(nid):
        out, n = [], nodes[nid]
        while n['parent']:
            n = nodes[n['parent']]
            if n['kind'] != 'root':
                out.append((n['text'] or '')[:20])
        return ' › '.join(reversed(out))

    def render(nid, depth=0, maxd=2):
        n = nodes[nid]
        lines = [l for l in (n['text'] or '').splitlines() if l.strip()] or ['']
        out = ['    ' * depth + '* ' + lines[0]] + ['    ' * depth + '  ' + l for l in lines[1:]]
        out += ['    ' * depth + '  > ' + l.strip() for l in (n.get('note') or '').splitlines() if l.strip()]
        if depth < maxd:
            for c in n['children']:
                out += render(c, depth + 1, maxd)
        return out
    st = structure()
    has_rule = collections.defaultdict(list)
    for _, rs in CR.MODULES.values():
        for r in rs:
            for s in r['srcs']:
                m = re.match(r'art(\d+(?:-\d)?)', s)
                if m:
                    has_rule[m.group(1)].append(r['key'])
    rows = []
    for key, a in K.articles().items():
        occ = sorted(cites.get(key, []))[:3]                      # 明确引用优先
        md = '\n\n'.join(f'节点 {nid}{"（推断引用）" if inf else ""}：{path(nid)}\n' + '\n'.join(render(nid))[:1500] for inf, nid in occ)
        s = st[key]
        rows.append(dict(id=f'art:{key}', chapter=[s['book'], s['chapter']], section=s['section'], articles=[key],
                         markdown=md or '（刑法导图中未引用本条）', lego={}, rules=sorted(set(has_rule.get(key, [])))))
    ROWS.parent.mkdir(parents=True, exist_ok=True)
    ROWS.write_text(json.dumps(rows, ensure_ascii=False, indent=1), encoding='utf-8')
    print(f'{len(rows)} 行（已有规则 {sum(1 for r in rows if r["rules"])}，导图中有引用 {sum(1 for r in rows if not r["markdown"].startswith("（"))}）→ {ROWS}')


if __name__ == '__main__':
    main()
