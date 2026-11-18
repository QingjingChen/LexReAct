#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
crim_nodes.json（由 itmz_parse.py 从 刑法v2.1.itmz 解析）→ source/刑法graph.markdown

输出格式与 ../data/civil_graph.markdown 一致：
  深度 0–2 用 #/##/### 标题，深度 ≥3 用缩进列表（每层 4 空格）；
  节点备注（note）写成紧跟其后的引用行；iThoughts 优先级写成〔优先级 n〕。
只是把导图换成可读的 markdown，供对照 LegalRuleML 结构层使用；crim2lrml.py 仍以 crim_nodes.json 为输入。

  python3 itmz2markdown.py
"""
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
SRC = HERE / 'crim_nodes.json'
OUT = HERE / 'source' / '刑法graph.markdown'


def main():
    nodes = {n['id']: n for n in json.load(open(SRC, encoding='utf-8'))}
    root = next(n for n in nodes.values() if n['parent'] is None)
    out = []

    def emit(nid):
        n = nodes[nid]
        d = n['depth']
        lines = [l.rstrip() for l in (n['text'] or '').splitlines() if l.strip()] or ['']
        if n.get('priority'):
            lines[0] += f'〔优先级 {n["priority"]}〕'
        if d <= 2:
            out.append('')
            out.append('#' * (d + 1) + ' ' + ' '.join(lines))
            out.append('')
            pad = ''
        else:
            pad = '    ' * (d - 3)
            out.append(f'{pad}* {lines[0]}')
            out.extend(f'{pad}  {l}' for l in lines[1:])
            pad += '  '
        for l in (n.get('note') or '').splitlines():
            if l.strip():
                out.append(f'{pad}> {l.strip()}')
        for c in n['children']:
            emit(c)

    emit(root['id'])
    OUT.parent.mkdir(exist_ok=True)
    OUT.write_text('\n'.join(out).lstrip() + '\n', encoding='utf-8')
    print(f'{len(nodes)} 个节点 → {OUT}')


if __name__ == '__main__':
    main()
