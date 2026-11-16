"""Chinese numeral parser used by graph_parse.py (kept verbatim from the original project for reproducibility:
it ignores 千, which only matters for the few graph citations above article 999)."""
CN = {c: i for i, c in enumerate('零一二三四五六七八九')}


def cn2int(s):  # 一百六十一 → 161
    n, cur = 0, 0
    for ch in s:
        if ch in CN:
            cur = CN[ch]
        elif ch == '十':
            n += (cur or 1) * 10
            cur = 0
        elif ch == '百':
            n += cur * 100
            cur = 0
    return n + cur
