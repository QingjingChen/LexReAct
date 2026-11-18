#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
刑法规则层的案例测试：复用 src/run_cases.py 的 DDL 引擎驱动与推理链解释，换上刑法的规则与案例。

  python3 src/criminal/crim2lrml.py
  python3 src/lrml2ddl.py --lrml graph/criminal/criminal_graph.lrml -o graph/criminal/criminal_rules.lp
  python3 run_cases.py              # 全部
  python3 run_cases.py age-3 -v     # 单个 + 推理链
"""
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(HERE.parent))
import crim_rules as CR  # noqa: E402
import run_cases as RC  # noqa: E402  （src/run_cases.py）
from paths import CRIM_CASES, CRIM_RULES_LP  # noqa: E402

RC.RULES = {r['key']: r for _, rs in CR.MODULES.values() for r in rs}
RC.FR = CR

if __name__ == '__main__':
    sys.exit(RC.main(CRIM_CASES, CRIM_RULES_LP))
