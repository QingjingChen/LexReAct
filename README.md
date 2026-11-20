# LexReAct

**LexReAct** (*Legal RuleML-guided Agents for Checking and reTrieval*) is a multi-agent pipeline for Chinese
civil-law QA. LLM agents extract, audit and verify facts and write the final answer; a **defeasible deontic reasoner
over LegalRuleML** coordinates them and filters retrieval. The reasoner does not answer the question. Instead, it

1. **audits** the LLM-extracted facts that its conclusions depend on;
2. **asks** questions that can be checked against the case text: unverified exceptions, rules that miss one fact,
   and rules outside the retrieved articles. Answers are accepted only with a verbatim quote from the case;
3. **adds** an article to the retrieved set only if its rule is applicable and undefeated on the verified facts.

The verified facts, the added articles and the reasoner's proofs are appended to the unchanged prompt of the host
system (LEGO). The host's input (case, question, retrieved articles) is not modified.

![architecture](figures/out/architecture_lexreact.png)

Main result (LexGo questions covered by the rules; 134 held-out questions × 3 seeds; `qwen3.5-35b-a3b`):

| | EM (mean ± s.d. over seeds) | F1 |
|---|---|---|
| LEGO (host prompt) | 0.609 ± 0.019 | 0.747 |
| + LexReAct | **0.654 ± 0.026** | **0.780** |

Paired difference: +4.5 EM points, 95% bootstrap CI [−0.0, +9.0]; sign test over question × seed, p ≈ 0.03.
See [EXPERIMENTS.md](EXPERIMENTS.md) for every experiment, its command and its caveats.

## Repository layout

Inputs live in `data/`, the generated LegalRuleML knowledge bases in `graph/`, code in `src/`; each is split into
Civil Law and Criminal Law.

```
data/                       inputs
  civil/
    civil_code_20200528.txt   official text of the Civil Code
    civil_graph.markdown      expert knowledge graph (Civil Law notes, 8355 nodes)
    lego_concept_cards/       LEGO concept cards and their article edges (Apache-2.0), used as references for rule cards
  criminal/
    criminal_law_2023.txt     Criminal Law text (as amended to Amendment XII), three-way reconciled, same format as the Civil Code text
    criminal_law_pdf.txt      cleaned text of the PDF edition, one of the three sources
    reconcile_report.md       article-by-article reconciliation of PDF / Wikisource / 6laws
    criminal_graph.itmz       expert knowledge graph (Criminal Law mind map, 9828 nodes)
    criminal_graph.markdown   markdown export of the mind map
  private/                  not distributed: LexGo questions, LEGO prompts, benchmark sheet (see data/README.md)
graph/                      generated knowledge bases (rebuild with the commands below)
  schema/                   OASIS LegalRuleML / RuleML XSDs used for validation
  civil/
    graph_nodes.json          node tree parsed from the knowledge graph
    civil_graph.lrml          both layers: every graph node + the rule layer, XSD-valid
    civil_graph_index.json    node / rule / source index
    civil_rules.lrml          rule layer only (XSD-valid)
    civil_rules.lp            the same rules compiled to ASP
    cases.json                53 unit cases (138 expected conclusions)
    examples/                 9 option-level cases taken from benchmark questions
    codebook/                 rule cards organised by the Code (book › chapter › section › card); pilot: chapter 2, arts 13–56
      civil_graph_mounted.markdown   the expert graph with matching notes replaced by the mounted article text
      ch02_natural_person/    codebook.md, cards.json, rules.lrml (XSD-valid), rules.lp, cases.json, alignment.json, relations.json
  criminal/                 same files for Criminal Law: graph_nodes.json, criminal_graph.lrml,
                            criminal_graph_index.json, criminal_rules.lrml, criminal_rules.lp,
                            cases.json (30 unit cases, 69 expected conclusions)
src/                        code (flat modules; run them as scripts)
  paths.py                  every file location; data and cache folders can be overridden by env vars
  civil_code.py             Civil Code loader (article / paragraph)
  graph_parse.py            civil knowledge-graph markdown -> node tree
  formal_rules.py           hand-formalised civil rule layer: 10 modules, 179 rules, 47 overrides
  graph2lrml.py             graph + rules -> two-layer LegalRuleML, XSD-checked
  extract_rule_layer.py     two-layer LegalRuleML -> rule layer only
  lrml2ddl.py               LegalRuleML -> Defeasible Deontic Logic in ASP
  run_cases.py              clingo + DDL engine; unit cases and explanations
  demo_lego.py              single-question demo; symbolic part runs without an LLM
  extract_loop.py           fact extraction, reasoning signals, quote-checked verification
  retrieval_signal.py       fact-triggered retrieval signals (exploratory experiment)
  verified_retrieval.py     verify-then-retrieve (exploratory experiment)
  agents_pipeline.py        the full pipeline (main configuration: --variant v1)
  eval_large.py             large evaluation runner and report
  llm_client.py             DashScope (OpenAI-compatible) client with a disk cache
  expert_review.py          expert review workbooks for the civil and criminal rule layers
  codebook/                 rule cards: civil_ch02_natural_person.py (cards + rules), build_codebook.py, run_card_cases.py,
                            build_review_all.py (review workbook for the whole Code, one sheet per chapter),
                            draft_llm.py (LLM drafts of natural-language + formal versions, checked: sources, syntax, arity,
                            XSD, ASP compilation; failing drafts are sent back with the error list)
  criminal/                 Criminal Law, same two-layer method (see src/criminal/README.md)
    pdf2txt.py                Criminal Law PDF -> data/criminal/criminal_law_pdf.txt
    criminal_code.py          three-way reconciliation -> data/criminal/criminal_law_2023.txt; article loader
    itmz_parse.py             mind map -> graph/criminal/graph_nodes.json
    itmz2markdown.py          node tree -> data/criminal/criminal_graph.markdown
    crim_rules.py             hand-formalised criminal rule layer: 6 modules, 93 rules, 52 overrides
    crim2lrml.py              graph + rules -> graph/criminal/criminal_graph.lrml, XSD-checked
    run_cases.py              criminal unit cases, reuses src/run_cases.py
    build_criminal_rows.py    one row per article (no LEGO cards for criminal law) with the mind-map nodes that cite it
    build_review_criminal.py  criminal rule-card review workbook, same layout as the Civil Code one
engine/fetch_ddl.sh         fetches the DDL engine at a pinned revision and applies a one-line patch
results/                    raw results of the experiments in EXPERIMENTS.md
figures/                    figure scripts (style after figures4papers) and rendered figures in figures/out/
```

### Rebuilding the knowledge bases

```sh
# Civil Law
python src/graph_parse.py && python src/graph2lrml.py && python src/extract_rule_layer.py
python src/lrml2ddl.py && python src/run_cases.py
# Criminal Law
python src/criminal/itmz_parse.py && python src/criminal/crim2lrml.py
python src/extract_rule_layer.py --src graph/criminal/criminal_graph.lrml --out graph/criminal/criminal_rules.lrml
python src/lrml2ddl.py --lrml graph/criminal/criminal_graph.lrml -o graph/criminal/criminal_rules.lp
python src/criminal/run_cases.py
# Rule cards (pilot: Civil Code chapter 2, natural persons)
python src/codebook/build_codebook.py ch02_natural_person --xlsx review/ch02_review.xlsx
python src/codebook/run_card_cases.py ch02_natural_person
python src/codebook/build_review_all.py -o review/civil_code_rule_cards.xlsx   # whole Code, one sheet per chapter
# LLM drafting of rule cards (OpenAI-compatible gateway configured in .env; every draft is checked before it is kept)
python src/codebook/draft_llm.py --law civil --all --model qwen4-max
python src/criminal/build_criminal_rows.py && python src/codebook/draft_llm.py --law criminal --all --model qwen4-max
python src/criminal/build_review_criminal.py -o review/criminal_rule_cards.xlsx
```

A **rule card** is one knowledge point of the expert graph. It has a natural-language version (the fields of a LEGO
concept card, each item naming the rules that formalise it) and a formal version (defeasible rules compiled to
LegalRuleML and ASP), and it mounts one or more articles; an article may be mounted on several cards. Relations between
articles are derived from the rules (predicate dependencies, exceptions, overrides) and from cross-references in the text.
Notes whose text equals an article (or a paragraph, item or sentence of it) are replaced by the mounted article in
`civil_graph_mounted.markdown`; near matches keep the note and show the official text for the expert.

## Setup

```sh
python -m pip install -r requirements.txt
sh engine/fetch_ddl.sh              # once; the DDL engine has no licence, so it is fetched, not vendored
cp .env.example .env                # only needed for steps that call an LLM; put your DashScope key there
```

Tested with Python 3.14 and clingo 5.8.3.

## Quick start (no LLM, no private data)

```sh
python src/run_cases.py                       # 53 unit cases, 138 expected conclusions
python src/run_cases.py graph/civil/examples/q526.json   # option-level cases from a benchmark question
python src/run_cases.py tort-9 -v             # one case with its explanation chain
python src/lrml2ddl.py --lrml graph/civil/civil_rules.lrml -o graph/civil/civil_rules.lp   # recompile the rules
python src/criminal/run_cases.py              # Criminal Law: 30 unit cases, 69 expected conclusions
```

## Running the pipeline and the experiments

These steps need the benchmark files in `data/private/` (see [data/README.md](data/README.md)) and an API key.

```sh
python src/agents_pipeline.py --qids 214 526 --variant v1   # pipeline on single questions
python src/eval_large.py --run --workers 8                  # large evaluation (resumable)
python src/eval_large.py --report                           # tables in EXPERIMENTS.md
python figures/plot_results.py                              # figures/out/main_results.pdf
python figures/draw_architecture.py                         # figures/out/architecture_lexreact.pdf
```

`--report` and the figure scripts only read `results/` and run without private data.

LLM calls are cached on disk (`LEXREACT_LLM_CACHE`, default `.cache/llm`). Note that the API is not deterministic even
with a fixed seed and temperature 0, so a fresh run reproduces the statistics but not every individual answer.

## Data availability

- `data/civil/civil_code_20200528.txt`: the official text of the Civil Code of the PRC (2020), an official legal
  document that is not subject to copyright protection.
- `data/criminal/criminal_law_2023.txt`: the Criminal Law of the PRC as amended to Amendment XII (2023), reconciled
  from three independent transcriptions (see `data/criminal/reconcile_report.md`); also an official legal text.
- The expert knowledge graphs are included: Civil Law as `data/civil/civil_graph.markdown`, Criminal Law as
  `data/criminal/criminal_graph.itmz` with a markdown export; their two-layer LegalRuleML is in `graph/`.
- The LexGo questions and LEGO's retrieval results and prompts are **not** included; see [data/README.md](data/README.md).

## Third-party components

- Defeasible Deontic Logic engine by Governatori et al. (https://github.com/gvdgdo/Defeasible-Deontic-Logic),
  fetched by `engine/fetch_ddl.sh` at revision `679c638`. It is not redistributed because the repository has no licence.
- OASIS LegalRuleML Core 1.0 and RuleML XSDs in `graph/schema/` (OASIS / RuleML licence terms apply).

## Licence

TODO: choose a licence for the code (e.g. MIT or Apache-2.0) before publishing.

## Citation

TODO
