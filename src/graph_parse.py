#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
把 民法graph.markdown（考试笔记式的层级图）解析成节点树 → graph_nodes.json。

每个节点：
  id        g0001…（按出现顺序；同一份 markdown 重跑结果稳定）
  kind      book / chapter / heading / item / note（# 标题、* 列表项、顶层散文）
  parent    父节点 id
  text      原文（去掉 markdown 强调符号，保留【】以免丢信息）
  clean     纯文本（去掉【】、<mark> 等），供检索与概念抽取
  priority  笔记里的 “Priority: n”
  exams     考试标记，如 T13/26、F21/36、09/36（【…】里以年份/题号形式出现的）
  cites     引用的法条 [{law, art, inferred}]；law='civil-code' 指《民法典》（笔记里写作《民法》或《民法典》）
  exception 文本里有 但是/除外/例外/不得对抗/不适用 等例外信号
  concept   若节点是“概念名”（用于分类树），给出规范化的概念名
"""
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from cn_numerals import cn2int  # noqa: E402
from paths import GRAPH_MD as SRC, KB  # noqa: E402

CIVIL = {'《民法》', '《民法典》', '《民法典.总则编》'}
EXC = re.compile(r'但是|但书|除外|例外|不得对抗|不适用|不在此限|另有规定|另有约定')
EXAM = re.compile(r'(?<![0-9])((?:[TF])?\d{2}(?:/\d{1,3}(?:，\d{1,3})*)|\d{2}简答|\d{2}论述)')
# 不当作“概念”的结构性词
STOP = set('''概念 特征 概念和特征 概念与特征 概念及特征 性质 效力 主体 客体 内容 范围 分类 种类 类型 意义 区别 联系 区分
法律后果 法律效果 构成要件 要件 条件 适用 适用范围 适用条件 例外 原则 后果 情形 方式 形式 程序 方法 期限 期间 时间
特点 作用 功能 设立 变更 消灭 转让 终止 成立 生效 行使 限制 取得 丧失 发生 规则 规定 举例 例如 总结 注意 注意点
定义 含义 本质 理论 学说 通说 标准 依据 法律依据 责任 义务 权利 对内 对外 对内效力 对外效力 性质不同 效果不同 两者关系
二者关系 关系 vs 比较 表现 体现 意思 目的 对象 理由 原因 结果 特殊 一般 其他 共同点 不同点 相同点 实现 保护 救济'''.split())


def strip_md(s):
    s = re.sub(r'</?(mark|u|del)>', '', s)
    s = s.replace('**', '').replace('*', '') if not s.startswith('* ') else s
    return s.strip()


def clean_text(s):
    s = re.sub(r'</?(mark|u|del)>', '', s)
    s = s.replace('*', '').replace('【', '').replace('】', '')
    s = re.sub(r'\s+', ' ', s)
    return s.strip()


ENUM = re.compile(r'^(?:[（(][一二三四五六七八九十\d]+[)）]|[一二三四五六七八九十]+[、.．]|\d+[、.．]|[①-⑳]|第[一二三四五六七八九十]+[节章编])\s*')


def concept_of(text):
    """短的、无句读的名词短语 → 概念名；否则 None"""
    t = clean_text(text)
    t = ENUM.sub('', t)
    t = re.sub(r'[（(][^）)]*[）)]', '', t)          # 去括注
    t = re.sub(r'[【\[].*$', '', t)                   # 去尾部考试标注
    t = t.rstrip('；;。：:，, ')
    if not t or len(t) > 12 or len(t) < 2:
        return None
    if re.search(r'[，。；：:,;？?、“”"！!/\s]|[甲乙丙丁戊]|\d', t) or t.endswith('的') or t in STOP:
        return None
    if re.search(r'(不同|关系|区别|比较|vs|特征|概念|要件|效力|后果|情形|规则|理论|问题|举例)$', t):
        return None
    return t


def classifier_of(text):
    """“根据…，担保物权可以分为” → 担保物权"""
    t = clean_text(text)
    m = re.search(r'([^，,：:\s]{2,12}?)(?:可以|可|又可|主要)?(?:分为|包括|有以下几种|有下列几种)[：:]?$', t.rstrip('：:。 '))
    if m:
        c = re.sub(r'^(?:根据|按照|依|以)[^，,]*[，,]', '', m.group(1))
        return concept_of(c)
    return None


def cites_of(text):
    out = []
    for m in re.finditer(r'(《[^》]{1,30}》)?\s*第([0-9一二三四五六七八九十百零]+)条', text):
        law, num = m.group(1), m.group(2)
        n = int(num) if num.isdigit() else cn2int(num.replace('零', ''))
        if law in CIVIL:
            out.append({'law': 'civil-code', 'art': n, 'inferred': False})
        elif law:
            out.append({'law': law.strip('《》'), 'art': n, 'inferred': False})
        else:
            # 无书名号：同句前文最近的书名号决定；没有则视作民法典（标记为推断）
            prev = re.findall(r'《([^》]{1,30})》', text[:m.start()])
            if prev and ('《' + prev[-1] + '》') not in CIVIL:
                if re.search(r'本法|该法', text[max(0, m.start() - 4):m.start()]):
                    continue  # “本法第三条”指被引用法律自身，无法可靠定位
                out.append({'law': prev[-1], 'art': n, 'inferred': True})
            elif 1 <= n <= 1260 and not re.search(r'侵权责任法|合同法|物权法|本法', text[max(0, m.start() - 8):m.start()]):
                out.append({'law': 'civil-code', 'art': n, 'inferred': True})
    return out


def parse(path=SRC):
    lines = path.read_text(encoding='utf-8').split('\n')
    nodes, stack = [], []  # stack: (depth, id)；标题深度 = 级数，列表项深度 = 10 + 缩进/4

    def add(kind, depth, text, line):
        while stack and stack[-1][0] >= depth:
            stack.pop()
        nid = f'g{len(nodes) + 1:04d}'
        parent = stack[-1][1] if stack else None
        clean = clean_text(text)
        nodes.append({'id': nid, 'kind': kind, 'parent': parent, 'line': line, 'text': strip_md(text), 'clean': clean,
                      'priority': None, 'exams': sorted(set(EXAM.findall(''.join(re.findall(r'【([^】]*)', text))))),
                      'cites': cites_of(clean), 'exception': bool(EXC.search(clean)), 'concept': None, 'classifier': None})
        stack.append((depth, nid))
        return nodes[-1]

    for i, raw in enumerate(lines, 1):
        s = raw.rstrip()
        if not s.strip():
            continue
        if s.startswith('#'):
            lv = len(s) - len(s.lstrip('#'))
            kind = {1: 'root', 2: 'book', 3: 'chapter'}.get(lv, 'heading')
            add(kind, lv, s.lstrip('#').strip(), i)
            continue
        ind = len(s) - len(s.lstrip(' '))
        t = s.strip()
        if t.startswith('Priority:'):
            if nodes:
                # Priority 行缩进在所修饰的列表项之下
                for d, nid in reversed(stack):
                    if d < 10 + (ind + 2) // 4 + 1:
                        nodes[int(nid[1:]) - 1]['priority'] = int(re.sub(r'\D', '', t) or 0)
                        break
            continue
        if t.startswith('Progress:'):
            continue
        m = re.match(r'[*\-+] (.*)$', t)
        if m:
            add('item', 10 + ind // 4, m.group(1), i)
        else:  # 散文行：挂在当前最深节点下（缩进视同列表项）
            add('note', 10 + ind // 4, t, i)
    by = {n['id']: n for n in nodes}
    for n in nodes:
        n['concept'] = concept_of(n['text']) if n['kind'] in ('item', 'heading') else None
        n['classifier'] = classifier_of(n['text']) if n['kind'] == 'item' else None
    for n in nodes:
        n['children'] = []
    for n in nodes:
        if n['parent']:
            by[n['parent']]['children'].append(n['id'])
    return nodes


if __name__ == '__main__':
    ns = parse()
    (KB / 'graph_nodes.json').write_text(json.dumps(ns, ensure_ascii=False, indent=0), encoding='utf-8')
    print(f"节点 {len(ns)}，引用法条 {sum(len(n['cites']) for n in ns)} 处，例外信号 {sum(n['exception'] for n in ns)} 个，"
          f"概念名 {sum(bool(n['concept']) for n in ns)} 个")
