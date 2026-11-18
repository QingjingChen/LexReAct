# Data

| File | Included | Used by |
|---|---|---|
| `civil/civil_code_20200528.txt` | yes (official legal text) | `civil_code.py`: article texts given to the LLM and added to the evidence |
| `criminal/criminal_law_2023.txt` | yes (official legal text, Criminal Law as amended to Amendment XII) | `src/criminal/criminal_code.py`: article texts for the criminal LegalRuleML; built by three-way reconciliation, see `criminal/reconcile_report.md` |
| `criminal/criminal_law_pdf.txt`, `criminal/reconcile_report.md` | yes | cleaned PDF edition (one of the three sources) and the reconciliation report |
| `criminal/criminal_graph.itmz`, `criminal/criminal_graph.markdown` | yes (expert knowledge graph, Criminal Law) | `src/criminal/itmz_parse.py`, `crim2lrml.py`: source of `graph/criminal/` |
| `criminal/raw/` | no (cached third-party web pages) | `criminal_code.py --build`; recreated by `--fetch` |
| `civil/civil_graph.markdown` | yes (expert knowledge graph, Civil Law) | `graph_parse.py`, `graph2lrml.py`: source of the two-layer LegalRuleML in `graph/civil/` |
| `private/pfc_v3_aligned.jsonl` | no | all LLM experiments: LexGo questions, gold answers, LEGO's top-8 articles and PFC-v3 prompts |
| `private/整体benchmark700道*分配.xlsx` | no | `--set control` and `retrieval_signal.py`: drawing random control questions |

`private/` is ignored by git. Point `LEXREACT_DATA` to another folder if the files live elsewhere:

```sh
export LEXREACT_DATA=/path/to/data      # must contain civil/, criminal/ and private/
```

Without the private files you can still run the engine tests, recompile the rules, print the reports from
`results/`, and draw the figures.

Each line of `pfc_v3_aligned.jsonl` is a JSON object with at least
`qid`, `gold`, `system`, `user` (the PFC-v3 prompt, containing `【案情】` and `【问题/选项】` sections) and
`provided_article_nos` (LEGO's top-8 article numbers).
