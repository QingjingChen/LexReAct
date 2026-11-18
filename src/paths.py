"""All file locations in one place. Override the data / cache folders with environment variables:
  LEXREACT_DATA       folder with civil/, criminal/ and private/   (default: <repo>/data)
  LEXREACT_LLM_CACHE  disk cache for LLM calls                     (default: <repo>/.cache/llm)

Layout:  data/{civil,criminal}/   inputs (legal texts, expert knowledge graphs)
         graph/{civil,criminal}/  generated LegalRuleML, compiled ASP rules, unit cases
         graph/schema/            OASIS LegalRuleML / RuleML XSDs shared by both"""
import glob
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DATA = Path(os.environ.get('LEXREACT_DATA', ROOT / 'data'))
PRIVATE = DATA / 'private'
GRAPH = ROOT / 'graph'
SCHEMA = GRAPH / 'schema' / 'lrml-compact.xsd'

# ---- Civil Law ----
CIVIL_DATA = DATA / 'civil'
CIVIL_CODE = CIVIL_DATA / 'civil_code_20200528.txt'      # official text of the Civil Code (public)
GRAPH_MD = CIVIL_DATA / 'civil_graph.markdown'           # expert knowledge graph (source of both layers)
KB = GRAPH / 'civil'                                     # generated civil knowledge base
GRAPH_NODES = KB / 'graph_nodes.json'                    # node tree parsed from GRAPH_MD
LRML_FULL = KB / 'civil_graph.lrml'                      # both layers; built from GRAPH_MD
LRML_INDEX = KB / 'civil_graph_index.json'
LRML_RULES = KB / 'civil_rules.lrml'                     # rule layer only
RULES_LP = KB / 'civil_rules.lp'
CASES = KB / 'cases.json'
EXAMPLES = KB / 'examples'

# ---- Criminal Law ----
CRIM_DATA = DATA / 'criminal'
CRIMINAL_CODE = CRIM_DATA / 'criminal_law_2023.txt'      # Criminal Law text, three-way reconciled (public)
CRIM_PDF_TXT = CRIM_DATA / 'criminal_law_pdf.txt'        # cleaned text of the PDF edition (one of the three sources)
CRIM_RECONCILE = CRIM_DATA / 'reconcile_report.md'
CRIM_RAW = CRIM_DATA / 'raw'                             # cached web sources (not distributed; --fetch)
CRIM_ITMZ = CRIM_DATA / 'criminal_graph.itmz'            # expert knowledge graph (iThoughts mind map)
CRIM_GRAPH_MD = CRIM_DATA / 'criminal_graph.markdown'    # markdown export of CRIM_ITMZ
CRIM_KB = GRAPH / 'criminal'
CRIM_NODES = CRIM_KB / 'graph_nodes.json'
CRIM_LRML_FULL = CRIM_KB / 'criminal_graph.lrml'
CRIM_LRML_INDEX = CRIM_KB / 'criminal_graph_index.json'
CRIM_LRML_RULES = CRIM_KB / 'criminal_rules.lrml'
CRIM_RULES_LP = CRIM_KB / 'criminal_rules.lp'
CRIM_CASES = CRIM_KB / 'cases.json'

# ---- experiments ----
ARCHIVE = PRIVATE / 'pfc_v3_aligned.jsonl'               # LexGo questions + LEGO retrieval/prompts (not distributed)
BENCH_XLSX_GLOB = str(PRIVATE / '整体benchmark700道*分配.xlsx')  # benchmark sheet, used only to draw control sets
ENGINE = ROOT / 'engine' / 'ddl_engine'                  # fetched by engine/fetch_ddl.sh
RESULTS = ROOT / 'results'
LLM_CACHE = Path(os.environ.get('LEXREACT_LLM_CACHE', ROOT / '.cache' / 'llm'))
ENV_FILE = ROOT / '.env'


def bench_xlsx():
    hits = glob.glob(BENCH_XLSX_GLOB)
    if not hits:
        raise FileNotFoundError(f'benchmark sheet not found: {BENCH_XLSX_GLOB} (see data/README.md)')
    return hits[0]
