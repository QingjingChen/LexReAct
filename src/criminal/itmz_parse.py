#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
iThoughts 思维导图（.itmz = zip，内含 mapdata.xml）→ graph/criminal/graph_nodes.json（节点树，字段与 graph/civil/graph_nodes.json 一致）

  python3 itmz_parse.py [path/to/刑法v2.1.itmz]

节点字段：id(t0001…) kind(root/part/chapter/item) parent text clean priority(task-priority) icons note line(=先序序号)
          exams cites[{law,art,inferred}] exception concept classifier children uuid
"""
import json
import re
import sys
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent))
sys.path.insert(0, str(HERE))
from graph_parse import EXAM, clean_text, concept_of, classifier_of  # noqa: E402
from criminal_code import cn2int  # noqa: E402

from paths import CRIM_ITMZ as DEFAULT, CRIM_NODES  # noqa: E402  （原件：iCloud 思维导图【23分析更新】/刑法v2.1.itmz）
CRIM = {'《刑法》', '《中华人民共和国刑法》', '刑法'}
EXC = re.compile(r'但是|但书|除外|例外|不以犯罪论|不认为是犯罪|不负刑事责任|不构成犯罪|免除处罚|不予追诉|不适用|另有规定|阻却')
NUM = r'([0-9]+|[一二三四五六七八九十百零]+)'


def cites_of(text):
    out = []
    for m in re.finditer(r'(《[^》]{1,30}》)?\s*第' + NUM + r'条(之([一二三四]))?', text):
        law, num = m.group(1), m.group(2)
        n = int(num) if num.isdigit() else cn2int(num.replace('零', ''))
        art = f'{n}' + (f'-{"一二三四".index(m.group(4)) + 1}' if m.group(4) else '')
        if law in CRIM or (law and '刑法' in law and '解释' not in law and '修正案' not in law):
            out.append({'law': 'criminal-law', 'art': art, 'inferred': False})
        elif law:
            out.append({'law': law.strip('《》'), 'art': art, 'inferred': False})
        else:
            prev = re.findall(r'《([^》]{1,30})》', text[:m.start()])
            if prev and not ('刑法' in prev[-1] and '解释' not in prev[-1]):
                out.append({'law': prev[-1], 'art': art, 'inferred': True})
            elif 1 <= n <= 452:
                out.append({'law': 'criminal-law', 'art': art, 'inferred': True})
    return out


def parse(path=DEFAULT):
    with zipfile.ZipFile(path) as z:
        root = ET.fromstring(z.read('mapdata.xml'))
    nodes = []

    def walk(t, parent, depth):
        nid = f't{len(nodes) + 1:04d}'
        text = (t.get('text') or '').strip()
        kind = {0: 'root', 1: 'part', 2: 'part', 3: 'chapter'}.get(depth, 'item')
        clean = clean_text(text)
        n = {'id': nid, 'uuid': t.get('uuid'), 'kind': kind, 'parent': parent, 'line': len(nodes) + 1, 'depth': depth,
             'text': text, 'clean': clean, 'priority': int(t.get('task-priority')) if t.get('task-priority') else None,
             'icons': [t.get(f'icon{i}') for i in range(1, 5) if t.get(f'icon{i}')], 'note': (t.get('note') or '').strip(),
             'exams': sorted(set(EXAM.findall(''.join(re.findall(r'【([^】]*)', text))))),
             'cites': cites_of(clean + ' ' + (t.get('note') or '')), 'exception': bool(EXC.search(clean)),
             'concept': concept_of(text) if depth >= 3 else None, 'classifier': classifier_of(text) if depth >= 3 else None,
             'children': []}
        nodes.append(n)
        for c in t.findall('topic'):
            n['children'].append(walk(c, nid, depth + 1))
        return nid

    walk(root.find('topics/topic'), None, 0)
    return nodes


if __name__ == '__main__':
    src = Path(sys.argv[1]) if len(sys.argv) > 1 else DEFAULT
    ns = parse(src)
    CRIM_NODES.write_text(json.dumps(ns, ensure_ascii=False, indent=0), encoding='utf-8')
    print(f"节点 {len(ns)}；引用法条 {sum(len(n['cites']) for n in ns)} 处（刑法 {sum(c['law'] == 'criminal-law' for n in ns for c in n['cites'])}）；"
          f"例外信号 {sum(n['exception'] for n in ns)}；概念名 {sum(bool(n['concept']) for n in ns)}；有备注 {sum(bool(n['note']) for n in ns)}")
