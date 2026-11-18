#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
《中华人民共和国刑法》PDF（北京市京师律师事务所整理，2024 版，含修正案（十二））→ data/criminal/criminal_law_pdf.txt

输出格式与 data/civil/civil_code_20200528.txt 相同：标题、修正说明、编/章/节标题（全角空格）、
每条以“第X条　”（或“第X条之一　”）开头，一款一行，项（（一）……）单独成行。
只清除 PDF 抽取带来的问题：页眉页脚、水印“中国刑事辩护网提供”、条文前编者所加的【罪名】标题、
多余空格与断行、缺字形（“苯丙胺”的“胺”抽成“*”）。PDF 本身的文字错误不在这里改，
由 criminal_code.py --build 与另外两个来源三方比对后裁决，结果写入 data/criminal/criminal_law_2023.txt。

  python3 pdf2txt.py path/to/xingfa.pdf [-o data/criminal/criminal_law_pdf.txt]
"""
import argparse
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent))
from paths import CRIM_PDF_TXT as OUT  # noqa: E402
CN = '一二三四五六七八九十百零'
ART = re.compile(rf'^第([{CN}]+)条(之[一二三四五六七八九十]+)?\s*')
ART_HEAD = re.compile(ART.pattern + '【')  # PDF 中真正的条首：缩进 + 条号 + 【罪名】
HEAD = re.compile(rf'^(第[{CN}]+[编章节])\s*(.+?)\s*$')
WATERMARK = '中国刑事辩护网提供'
FULL_LINE = 33  # 一行排满时约 35–38 个字；短于此且以句末标点结尾 → 段落结束


def extract(pdf):
    from pypdf import PdfReader
    return '\n'.join(p.extract_text() or '' for p in PdfReader(str(pdf)).pages)


def norm(s):
    """去掉 PDF 抽取在中文、标点、数字之间插入的空格。"""
    s = s.replace(WATERMARK, '')
    s = re.sub(r'(?<=[^\x00-\x7f])[ \t]+|[ \t]+(?=[^\x00-\x7f])', '', s)
    s = re.sub(r'(?<=\d)[ \t]+(?=\d)', '', s)
    s = s.replace('(', '（').replace(')', '）')
    s = s.replace('苯丙*', '苯丙胺')  # 缺字形
    return s.strip()


def lines_of(raw):
    out = []
    for l in raw.split('\n'):
        if l.strip().startswith('北京市京师律师事务所') or '赵荔律师团队' in l:
            continue
        if not l.strip() or l.strip() == WATERMARK:
            out.append(None)  # 空行：只作为“段落可能结束”的弱信号
            continue
        out.append(l.rstrip())
    return out


def width(s):
    return len(norm(s))


def build(raw):
    ls = lines_of(raw)
    start = next(i for i, l in enumerate(ls) if l and l.strip().startswith('第一编') and
                 any(x and ART_HEAD.match(norm(x)) for x in ls[i:i + 8]))
    pre = [norm(l) for l in ls[:start] if l]
    out_head = [pre[0].replace('（2024版）', '').replace('（2024 版）', '')]  # 标题
    intro = ''.join(pre[1:pre.index('目录')])
    toc = pre[pre.index("目录") + 1:]
    toc = [f"{m.group(1)}　{m.group(2)}" if (m := HEAD.match(x)) else x for x in toc]
    out_head += ["", intro, "", "目　　录"] + toc

    body, paras, prev = [], [], None

    def flush():
        if paras:
            body.append(paras[:])
            paras.clear()

    for l in ls[start:]:
        if l is None:
            prev = ('blank', prev[1] if prev else '')
            continue
        s, n = l.strip(), norm(l)
        indent = len(l) - len(l.lstrip(' '))
        if (HEAD.match(n) and '。' not in n and indent < 2 and len(n) < 30) or n in ('附则', '附件一', '附件二'):
            flush()
            body.append(('H', n))
            prev = None
            continue
        if indent >= 2 and ART_HEAD.match(n):
            flush()
            paras.append(n)
            prev = ('line', s)
            continue
        p_text = prev[1] if prev else ''
        p_end = bool(re.search(r'[。：；]$', norm(p_text))) and (width(p_text) < FULL_LINE or prev[0] == 'blank')
        open_title = paras and paras[-1].count('【') > paras[-1].count('】')  # 【罪名】跨行
        if not open_title and (indent >= 2 or re.match(r'^\d+．', n) or p_end or not paras):
            paras.append(n)
        else:
            paras[-1] += n
        prev = ('line', s)
    flush()
    return out_head, body


def render(head, body):
    out = head[:]
    for item in body:
        if isinstance(item, tuple):
            m = HEAD.match(item[1])
            out.append(f'{m.group(1)}　{m.group(2)}' if m else item[1])
            continue
        first = item[0]
        m = ART_HEAD.match(first)
        if m:
            m = ART.match(first)
            rest = first[m.end():]
            rest = re.sub(r'^【[^】]*】', '', rest)  # 编者所加的罪名/条旨
            item = [f'第{m.group(1)}条{m.group(2) or ""}　{rest}'] + item[1:]
        out += item
    return '\n'.join(out).replace('苯丙*', '苯丙胺') + '\n'  # 缺字形（也处理跨行的情形）


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('pdf')
    ap.add_argument('-o', '--out', default=str(OUT))
    a = ap.parse_args()
    head, body = build(extract(a.pdf))
    Path(a.out).write_text(render(head, body), encoding='utf-8')
    print(f'→ {a.out}')


if __name__ == '__main__':
    main()
