# -*- coding: utf-8 -*-
"""
《中华人民共和国刑法》（2023年修正，含修正案（十二），2024-03-01 施行）条/款加载。

文本来源：两个独立转录本逐条比对（法律文本属公有领域）
  W = 维基文库「中华人民共和国刑法 (2023年)」（该页自标校对度 50%）
  S = 六法全书 6laws.net「中华人民共和国刑法」（含修正案（十二））
两者一致的条文直接采用；不一致的按 DECIDE 表逐条裁决（理由见表），出现表外的新差异时报错、要求人工裁决。
裁决结果写入 law/reconcile_report.md。
  python3 criminal_code.py --fetch   下载两个来源、比对并生成 law/criminal_law_2023.json
条文键：'17'、'17-1'（第17条之一）、'17-1-2'（第17条之一第2款）；第N条第k款写作 'art17#2'。
"""
import json
import re
import sys
from functools import lru_cache
from pathlib import Path

HERE = Path(__file__).resolve().parent
JSON = HERE / 'law' / 'criminal_law_2023.json'
URL = ('https://zh.wikisource.org/w/index.php?title=%E4%B8%AD%E5%8D%8E%E4%BA%BA%E6%B0%91%E5%85%B1%E5%92%8C%E5%9B%BD'
       '%E5%88%91%E6%B3%95_(2023%E5%B9%B4)&action=raw')
DIG = dict(zip('零一二三四五六七八九', range(10)))
URL6 = 'https://www.6laws.net/6law/lawcn/%E4%B8%AD%E5%8D%8E%E4%BA%BA%E6%B0%91%E5%85%B1%E5%92%8C%E5%9B%BD%E5%88%91%E6%B3%95.htm'
SUFFIX = {'a': 1, 'b': 2, 'c': 3, 'd': 4}
# 两源不一致条文的裁决（2026-11 人工核对）：S = 采用 6laws；W = 采用维基文库；SPLIT = 仅分款不同，内容一致
DECIDE = {
    '31': ('SPLIT', '仅分款不同'), '233': ('SPLIT', '仅分款不同'), '377': ('SPLIT', '仅分款不同'),
    '36': ('S', 'W 脱“判”字'), '120-4': ('S', 'W 将第120条之五、之六并入之四'), '177': ('S', '伪造变造金融票证罪基本刑为“五年以下”，W 作“三年”'),
    '198': ('S', 'W 脱“二”字'), '259': ('S', 'W 脱“的”字'), '261': ('S', '遗弃罪为“扶养义务”“五年以下有期徒刑、拘役或者管制”，W 有误'),
    '263': ('S', '抢劫罪为“抢劫公私财物”，W 脱“公私”'), '292': ('S', 'W “条二百三十二条”笔误'), '323': ('S', '“界碑”，W 误作“埤”'),
    '331': ('S', 'W 脱“部门”'), '348': ('S', 'W 脱“刑”'),
    '166': ('W', 'S 脱“其”（“其他公司、企业的工作人员”）'), '397': ('W', 'S 脱“三年以下有期徒刑或者拘役；情节特别严重的，处”'),
    '452': ('W', 'S 只录第1款'), '308-1': ('W+.', 'S 误作“道报”；W 末句缺句号'), '405': ('W', 'W 残留繁简转换标记，已清除'),
    '199': ('W', '已被删去，保留“（删去）”'),
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


def reconcile(W, S):
    norm = lambda s: re.sub(r'[\W_]', '', s)
    out, report, n_same = {}, [], 0
    for k, w in W.items():
        w['paras'] = [re.sub(r'-\{zh-hans:([^;]*);zh-hant:[^}]*\}-', r'\1', p) for p in w['paras']]
        s = S.get(k)
        if s is not None and [norm(x) for x in w['paras']] == [norm(x) for x in s] or (s is not None and norm(''.join(w['paras'])) == norm(''.join(s)) and DECIDE.get(k, ('',))[0] == 'SPLIT'):
            out[k] = w
            n_same += 1
            continue
        if k not in DECIDE:
            raise SystemExit(f'第{k}条两源不一致且不在 DECIDE 表中，需要人工裁决：\nW: {w["paras"]}\nS: {s}')
        how, why = DECIDE[k]
        if how == 'S':
            out[k] = dict(w, paras=s)
        else:
            out[k] = dict(w, paras=[p if p.endswith(('。', '：', '；')) else p + '。' for p in w['paras']] if how == 'W+.' else w['paras'])
        report.append(f'| 第{k}条 | {"6laws" if how == "S" else "维基文库"} | {why} |')
    for k in S:
        if k not in out:
            base = re.match(r'(\d+)', k).group(1)
            out[k] = {'label': f'第{base}条之{"一二三四五六"[int(k.split("-")[1]) - 1]}', 'chapter': W.get(k.rsplit('-', 1)[0] if '-' in k else k, {}).get('chapter', ''),
                      'paras': S[k]}
            report.append(f'| 第{k}条 | 6laws | 维基文库缺此条（并入了前一条） |')
    return out, n_same, report


@lru_cache(None)
def articles():
    return json.loads(JSON.read_text(encoding='utf-8'))


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
        W = parse_wikitext(get(URL))
        S = parse_6laws(get(URL6))
        arts, n_same, report = reconcile(W, S)
        JSON.parent.mkdir(exist_ok=True)
        JSON.write_text(json.dumps(arts, ensure_ascii=False, indent=0), encoding='utf-8')
        (JSON.parent / 'reconcile_report.md').write_text(
            f'# 《刑法》文本两源核对\n\n维基文库 {len(W)} 条、6laws {len(S)} 条；内容一致 {n_same} 条；不一致 {len(report)} 处，裁决如下：\n\n'
            '| 条文 | 采用 | 理由 |\n|---|---|---|\n' + '\n'.join(report) + '\n', encoding='utf-8')
        print(f'两源一致 {n_same} 条，人工裁决 {len(report)} 处（见 law/reconcile_report.md）')
    arts = articles()
    nums = sorted({int(k.split('-')[0]) for k in arts})
    print(f'条文 {len(arts)} 个（含“之一/之二”等 {sum("-" in k for k in arts)} 个），编号 {nums[0]}–{nums[-1]}，缺号 {[n for n in range(1, 453) if n not in nums]}')
    for k in ['20', '17-1', '269', '263']:
        print(k, articles()[k]['label'], articles()[k]['paras'][:2])
