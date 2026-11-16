"""All file locations in one place. Override the data / cache folders with environment variables:
  LEXREACT_DATA       folder with civil_code_20200528.txt and private/ (default: <repo>/data)
  LEXREACT_LLM_CACHE  disk cache for LLM calls                         (default: <repo>/.cache/llm)"""
import glob
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DATA = Path(os.environ.get('LEXREACT_DATA', ROOT / 'data'))
PRIVATE = DATA / 'private'

CIVIL_CODE = DATA / 'civil_code_20200528.txt'            # official text of the Civil Code (public)
GRAPH_MD = PRIVATE / 'civil_graph.markdown'              # expert knowledge graph (not distributed)
ARCHIVE = PRIVATE / 'pfc_v3_aligned.jsonl'               # LexGo questions + LEGO retrieval/prompts (not distributed)
BENCH_XLSX_GLOB = str(PRIVATE / '整体benchmark700道*分配.xlsx')  # benchmark sheet, used only to draw control sets

KB = ROOT / 'kb'
SCHEMA = KB / 'schema' / 'lrml-compact.xsd'
LRML_FULL = KB / 'civil_graph.lrml'                      # both layers; built from GRAPH_MD (not distributed)
LRML_RULES = KB / 'civil_rules.lrml'                     # rule layer only (distributed)
RULES_LP = KB / 'civil_rules.lp'
CASES = KB / 'cases.json'
EXAMPLES = KB / 'examples'
ENGINE = ROOT / 'engine' / 'ddl_engine'                  # fetched by engine/fetch_ddl.sh
RESULTS = ROOT / 'results'
LLM_CACHE = Path(os.environ.get('LEXREACT_LLM_CACHE', ROOT / '.cache' / 'llm'))
ENV_FILE = ROOT / '.env'


def bench_xlsx():
    hits = glob.glob(BENCH_XLSX_GLOB)
    if not hits:
        raise FileNotFoundError(f'benchmark sheet not found: {BENCH_XLSX_GLOB} (see data/README.md)')
    return hits[0]
