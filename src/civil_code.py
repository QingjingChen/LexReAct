# -*- coding: utf-8 -*-
"""《民法典》条文加载（支持第1000条以后：上一级 check_alignment.cn2int 不处理“千”）。"""
import re
from functools import lru_cache
from pathlib import Path

from paths import CIVIL_CODE as CODE
DIG = dict(zip('零一二三四五六七八九', range(10)))


def cn2int(s):
    n, cur = 0, 0
    for ch in s:
        if ch in DIG:
            cur = DIG[ch]
        elif ch in '十百千':
            n += (cur or (1 if ch == '十' else 0)) * {'十': 10, '百': 100, '千': 1000}[ch]
            cur = 0
    return n + cur


@lru_cache(None)
def articles():
    t = CODE.read_text(encoding='utf-8')
    heads = list(re.finditer(r'(?m)^第([一二三四五六七八九十百千零]+)条　', t))
    arts = {}
    for i, m in enumerate(heads):
        end = heads[i + 1].start() if i + 1 < len(heads) else len(t)
        body = t[m.start():end]
        body = re.split(r'(?m)^\s*第[一二三四五六七八九十]+[章节编]|^\s*附　+则', body)[0]
        arts[cn2int(m.group(1))] = body.strip()
    assert len(arts) == 1260 and all(k in arts for k in range(1, 1261)), len(arts)
    return arts


def paragraphs(n):
    """第 n 条 → 款列表（项并入所在款）"""
    lines = [l.strip() for l in articles()[n].split('\n') if l.strip()]
    lines[0] = re.sub(r'^第[一二三四五六七八九十百千零]+条　', '', lines[0])
    paras = []
    for l in lines:
        if l.startswith('（') and paras:
            paras[-1] += l
        else:
            paras.append(l)
    return paras


def text_of(key):
    """'art403' / 'art403-1' → 原文"""
    m = re.fullmatch(r'art(\d+)(?:-(\d+))?', key)
    n, k = int(m.group(1)), m.group(2)
    ps = paragraphs(n)
    if k is None:
        return ''.join(ps)
    return ps[int(k) - 1]
