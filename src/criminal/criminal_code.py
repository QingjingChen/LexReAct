# -*- coding: utf-8 -*-
"""
《中华人民共和国刑法》（2023年修正，含修正案（十二），2024-03-01 施行）条/款加载。

原文文件：data/criminal/criminal_law_2023.txt，格式与 data/civil/civil_code_20200528.txt 相同
（编/章/节标题；每条以“第X条　”或“第X条之一　”开头；一款一行，项单独成行）。
该文件由三个独立文本逐条比对生成（法律文本属公有领域）：
  P = 《中华人民共和国刑法（2024 版）》PDF（北京市京师律师事务所整理）→ pdf2txt.py → data/criminal/criminal_law_pdf.txt
  W = 维基文库「中华人民共和国刑法 (2023年)」（该页自标校对度 50%）        → data/criminal/raw/wikisource.wikitext
  S = 六法全书 6laws.net「中华人民共和国刑法」（含修正案（十二））          → data/criminal/raw/6laws.html
每条的正文与分款分别按三方多数决定；三方互不相同时查 DECIDE 表（人工裁决），表外的新情况报错。
逐条结果写入 data/criminal/reconcile_report.md。编章节结构、标题、修正说明与附件取自 P。
  python3 criminal_code.py --build            用已缓存的三个来源重新生成 data/criminal/criminal_law_2023.txt
  python3 criminal_code.py --build --fetch    先重新下载 W、S
条文键：'17'、'17-1'（第17条之一）；第N条第k款写作 'art17#2'。
"""
import json
import re
import sys
from collections import Counter
from functools import lru_cache
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent))
from paths import CRIM_PDF_TXT as PDF_TXT, CRIM_RAW, CRIM_RECONCILE as REPORT, CRIMINAL_CODE as TXT  # noqa: E402
RAW_W = CRIM_RAW / 'wikisource.wikitext'
RAW_S = CRIM_RAW / '6laws.html'
URL = ('https://zh.wikisource.org/w/index.php?title=%E4%B8%AD%E5%8D%8E%E4%BA%BA%E6%B0%91%E5%85%B1%E5%92%8C%E5%9B%BD'
       '%E5%88%91%E6%B3%95_(2023%E5%B9%B4)&action=raw')
DIG = dict(zip('零一二三四五六七八九', range(10)))
URL6 = 'https://www.6laws.net/6law/lawcn/%E4%B8%AD%E5%8D%8E%E4%BA%BA%E6%B0%91%E5%85%B1%E5%92%8C%E5%9B%BD%E5%88%91%E6%B3%95.htm'
SUFFIX = {'a': 1, 'b': 2, 'c': 3, 'd': 4}
CN = '一二三四五六七八九十百零'
ART_LINE = re.compile(rf'^第([{CN}]+)条(?:之([{CN}]+))?　(.*)$')
HEAD_LINE = re.compile(rf'^第[{CN}]+[编章节]　|^附则$')
ZW = re.compile('[\u200b\u200c\u200d\ufeff]')
# 三方互不相同（无多数）时的人工裁决：来源字母 + 理由
DECIDE = {
    '199': ('W', '本条已被删去；PDF 与 6laws 不录，按维基文库保留“（删去）”占位'),
    '308-1': ('P', '维基文库第4款末尾缺句号；6laws 第3款“报道”误作“道报”'),
    '452': ('W', '6laws 只录第1款；PDF 第3款作“予以保留，其中”，按 1997 年公布文本作“予以保留。其中”（待核）'),
}
def cn2int(s):
    n, cur = 0, 0
    for ch in s:
        if ch in DIG:
            cur = DIG[ch]
        elif ch in '十百千':
            n += (cur or (1 if ch == '十' else 0)) * {'十': 10, '百': 100, '千': 1000}[ch]
            cur = 0
    return n + cur


def clean(s):
    s = re.sub(r'\{\{gap\}\}|<span[^>]*>|</span>|\'\'\'', '', s)
    s = re.sub(r'\[\[(?:[^]|]*\|)?([^]]*)\]\]', r'\1', s)
    s = re.sub(r'<ref[^>]*>.*?</ref>|<[^>]+>|\{\{[^}]*\}\}', '', s)
    return s.strip()


def parse_wikitext(t):
    arts, cur, chapter = {}, None, ''
    for line in t.split('\n'):
        h = re.match(r'^=+\s*(.*?)\s*=+$', line)
        if h:
            chapter = clean(h.group(1)).replace('　', '')
            cur = None
            continue
        m = re.search(r'id="Art-(\d+)([a-d]?)"', line)
        if m:
            key = m.group(1) + (f'-{SUFFIX[m.group(2)]}' if m.group(2) else '')
            body = clean(line)
            body = re.sub(r'^第[一二三四五六七八九十百零]+条(之[一二三四])?\s*　?', '', body)
            cur = arts[key] = {'label': f'第{m.group(1)}条' + (f'之{"一二三四"[SUFFIX[m.group(2)] - 1]}' if m.group(2) else ''),
                               'chapter': chapter, 'paras': [body]}
            continue
        if cur is not None:
            b = clean(line)
            if not b:
                continue
            if b.startswith('（') and cur['paras']:
                cur['paras'][-1] += b
            else:
                cur['paras'].append(b)
    return arts


def parse_6laws(raw_html):
    import html as H
    t = re.sub(r'<br\s*/?>|</p>|</div>|</tr>', '\n', raw_html)
    t = H.unescape(re.sub(r'<[^>]+>', '', t))
    arts, cur, skip = {}, None, False
    for l in (x.strip().replace('\u3000', '').replace('\xa0', '') for x in t.split('\n')):
        m = re.fullmatch(r'第(\d+)条(?:之(\d))?', l)
        if m:
            key = m.group(1) + (f'-{m.group(2)}' if m.group(2) else '')
            cur = None if key in arts else arts.setdefault(key, [])
            skip = False
            continue
        if cur is None or not l:
            continue
        if '修正前条文' in l:
            cur = None
            continue
        if l.startswith(('【注】', '回索引', '回首页')) or '自动比对' in l:
            skip = True
            continue
        if skip:
            continue
        p = re.match(r'﹝(\d+)﹞(.*)', l)
        if p:
            cur.append(p.group(2).strip())
        elif l.startswith('（') and cur:
            cur[-1] += l
    return arts


def num_cn(n):
    """1–999 → 汉字（与法典条号写法一致：十七、一百一十、二百零五）"""
    d = '零一二三四五六七八九'
    h, t, u = n // 100, n // 10 % 10, n % 10
    s = (d[h] + '百') if h else ''
    if t:
        s += ('' if (t == 1 and not h) else d[t]) + '十'
    elif h and u:
        s += '零'
    return s + (d[u] if u else '')


def label(k):
    n, _, sub = k.partition('-')
    return f'第{n}条' + (f'之{num_cn(int(sub))}' if sub else '')


def sort_key(k):
    return tuple(int(x) for x in k.split('-'))


def split_items(para):
    """款 → 行：项（（一）……）单独成行，与民法典文本一致"""
    return re.split(r'(?<=[：；。])(?=（[一二三四五六七八九十]+）)', para)


def parse_txt(text):
    """法典文本（民法典同款格式）→ (head 行, [('H', 标题) | ('A', 键)], {键: {label, chapter, paras}}, tail 行)"""
    lines = text.split('\n')
    first = next(i for i, l in enumerate(lines) if ART_LINE.match(l))
    start = first
    while start > 0 and HEAD_LINE.match(lines[start - 1]):
        start -= 1
    end = next((i for i, l in enumerate(lines) if l == '附件一'), len(lines))
    layout, arts, cur, chapter = [], {}, None, ''
    for l in lines[start:end]:
        if not l:
            continue
        m = ART_LINE.match(l)
        if m:
            k = str(cn2int(m.group(1))) + (f'-{cn2int(m.group(2))}' if m.group(2) else '')
            cur = arts[k] = {'label': label(k), 'chapter': chapter, 'paras': [m.group(3)]}
            layout.append(('A', k))
        elif HEAD_LINE.match(l):
            chapter = l.replace('　', '')
            layout.append(('H', l))
            cur = None
        elif cur is None:
            raise ValueError(f'条文之外的正文行：{l[:40]}')
        elif l.startswith('（') and cur['paras']:
            cur['paras'][-1] += l
        else:
            cur['paras'].append(l)
    return lines[:start], layout, arts, lines[end:]


def load_sources():
    W = parse_wikitext(RAW_W.read_text(encoding='utf-8'))
    W = {k: [ZW.sub('', re.sub(r'-\{zh-hans:([^;]*);zh-hant:[^}]*\}-', r'\1', p)) for p in v['paras']] for k, v in W.items()}
    S = {k: [ZW.sub('', p) for p in v] for k, v in parse_6laws(RAW_S.read_text(encoding='utf-8')).items()}
    head, layout, P, tail = parse_txt(PDF_TXT.read_text(encoding='utf-8'))
    return {'P': {k: v['paras'] for k, v in P.items()}, 'W': W, 'S': S}, (head, layout, tail)


def diff(a, b):
    import difflib
    sm = difflib.SequenceMatcher(None, a, b, autojunk=False)
    out = []
    for op, i1, i2, j1, j2 in sm.get_opcodes():
        if op != 'equal':
            out.append(f'“{a[max(0, i1 - 4):i2 + 4]}”→“{b[max(0, j1 - 4):j2 + 4]}”' if (i2 - i1) + (j2 - j1) < 60 else
                       f'{"缺" if j2 - j1 < i2 - i1 else "多"} {abs((i2 - i1) - (j2 - j1))} 字')
    return '；'.join(out[:3])


NAME = {'P': 'PDF', 'W': '维基文库', 'S': '6laws'}


def reconcile(src):
    """逐条三方比对：正文多数决定，分款在正文相同的来源中多数决定"""
    keys = sorted(set().union(*src.values()), key=sort_key)
    out, report, n_same = {}, [], 0
    for k in keys:
        have = {n: X[k] for n, X in src.items() if k in X}
        text = {n: ''.join(v) for n, v in have.items()}
        votes = Counter(text.values())
        best, cnt = votes.most_common(1)[0]
        if cnt < 2:
            if k not in DECIDE:
                raise SystemExit(f'第{k}条三方互不相同且不在 DECIDE 表中，需要人工裁决：\n' +
                                 '\n'.join(f'{n}: {v}' for n, v in have.items()))
            how, why = DECIDE[k]
            out[k] = have[how]
            report.append(f'| {label(k)} | {NAME[how]}（人工裁决） | {why} |')
            continue
        agree = [n for n in have if text[n] == best]
        splits = Counter(tuple(have[n]) for n in agree).most_common()
        if len(splits) > 1 and splits[0][1] == splits[1][1]:
            raise SystemExit(f'第{k}条分款无多数：' + str({n: len(have[n]) for n in agree}))
        out[k] = list(splits[0][0])
        notes = []
        for n in 'PWS':
            if n not in have:
                notes.append(f'{NAME[n]}缺此条')
            elif text[n] != best:
                notes.append(f'{NAME[n]}：{diff(best, text[n])}')
            elif tuple(have[n]) != splits[0][0]:
                notes.append(f'{NAME[n]}分为 {len(have[n])} 款（应为 {len(out[k])} 款）')
        if notes:
            report.append(f'| {label(k)} | {"、".join(NAME[n] for n in agree if tuple(have[n]) == splits[0][0])} | {"；".join(notes)} |')
        else:
            n_same += 1
    return out, n_same, report


def render(head, layout, tail, arts):
    out, placed = list(head), set()
    keys = sorted(arts, key=sort_key)
    for kind, v in layout:
        if kind == 'H':
            out.append(v)
            continue
        for k in keys:  # P 中缺的条（如已删去的第199条）放在应在的位置
            if k not in placed and sort_key(k) < sort_key(v):
                out.append(f'第{num_cn(int(k.split("-")[0]))}条' + (f'之{num_cn(int(k.split("-")[1]))}' if '-' in k else '') + '　' + arts[k][0])
                placed.add(k)
        paras = arts[v]
        lines = [l for p in paras for l in split_items(p)]
        cn = f'第{num_cn(int(v.split("-")[0]))}条' + (f'之{num_cn(int(v.split("-")[1]))}' if '-' in v else '')
        out.append(f'{cn}　{lines[0]}')
        out += lines[1:]
        placed.add(v)
    assert placed == set(arts), set(arts) - placed
    return '\n'.join(out + [''] + tail).rstrip('\n') + '\n'


@lru_cache(None)
def articles():
    return parse_txt(TXT.read_text(encoding='utf-8'))[2]


def text_of(key):
    """'art17' / 'art17-1' / 'art17#2' / 'art17-1#2' → 原文"""
    m = re.fullmatch(r'art(\d+(?:-\d)?)(?:#(\d+))?', key)
    a = articles()[m.group(1)]
    return a['paras'][int(m.group(2)) - 1] if m.group(2) else ''.join(a['paras'])


def label_of(key):
    m = re.fullmatch(r'art(\d+(?:-\d)?)(?:#(\d+))?', key)
    return articles()[m.group(1)]['label'] + (f'第{m.group(2)}款' if m.group(2) else '')


if __name__ == '__main__':
    if '--fetch' in sys.argv:
        import urllib.request
        get = lambda u: urllib.request.urlopen(urllib.request.Request(u, headers={'User-Agent': 'Mozilla/5.0'}), timeout=180).read().decode('utf-8')
        RAW_W.parent.mkdir(parents=True, exist_ok=True)
        RAW_W.write_text(get(URL), encoding='utf-8')
        RAW_S.write_text(get(URL6), encoding='utf-8')
    if '--build' in sys.argv:
        src, (head, layout, tail) = load_sources()
        arts, n_same, report = reconcile(src)
        TXT.write_text(render(head, layout, tail, arts), encoding='utf-8')
        REPORT.write_text(
            '# 《刑法》文本三方核对\n\n'
            f'来源：PDF（京师律所整理 2024 版）{len(src["P"])} 条、维基文库 {len(src["W"])} 条、6laws {len(src["S"])} 条。'
            f'三方完全一致 {n_same} 条；其余 {len(report)} 条按多数（或人工裁决）采用，少数来源的差异如下。\n'
            f'输出：`data/criminal/criminal_law_2023.txt`，共 {len(arts)} 条。\n\n'
            '| 条文 | 采用（一致的来源） | 少数来源的差异 |\n|---|---|---|\n' + '\n'.join(report) + '\n', encoding='utf-8')
        print(f'三方一致 {n_same} 条，多数/裁决 {len(report)} 条 → {TXT.name}（见 data/criminal/reconcile_report.md）')
        articles.cache_clear()
    arts = articles()
    nums = sorted({int(k.split('-')[0]) for k in arts})
    print(f'条文 {len(arts)} 个（含“之一/之二”等 {sum("-" in k for k in arts)} 个），编号 {nums[0]}–{nums[-1]}，缺号 {[n for n in range(1, 453) if n not in nums]}')
    for k in ['20', '17-1', '269', '263']:
        print(k, articles()[k]['label'], articles()[k]['paras'][:2])
