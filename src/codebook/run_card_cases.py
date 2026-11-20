#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""规则卡片（按章）的单元案例：复用 src/run_cases.py 的推理机驱动与推理链。

  python src/codebook/run_card_cases.py ch02_natural_person          # 全部
  python src/codebook/run_card_cases.py ch02_natural_person np-g-3 -v
"""
import importlib
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE), str(HERE.parent)]
import formal_rules as FR  # noqa: E402
import run_cases as RC  # noqa: E402
from paths import GRAPH  # noqa: E402

CHAPTERS = {'ch02_natural_person': 'civil_ch02_natural_person'}

if __name__ == '__main__':
    ch = sys.argv.pop(1)
    M = importlib.import_module(CHAPTERS[ch])
    RC.RULES = {r['key']: r for r in M.RULES}
    RC.FR = type('Gloss', (), {'ZH': {**FR.ZH, **M.ZH}})
    out = GRAPH / 'civil' / 'codebook' / ch
    sys.exit(RC.main(out / 'cases.json', out / 'rules.lp'))
