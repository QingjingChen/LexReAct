# Data

| File | Included | Used by |
|---|---|---|
| `civil_code_20200528.txt` | yes (official legal text) | `civil_code.py`: article texts given to the LLM and added to the evidence |
| `civil_graph.markdown` | yes (expert knowledge graph, Civil Law) | `graph_parse.py`, `graph2lrml.py`: source of the two-layer LegalRuleML in `kb/` |
| `private/pfc_v3_aligned.jsonl` | no | all LLM experiments: LexGo questions, gold answers, LEGO's top-8 articles and PFC-v3 prompts |
| `private/整体benchmark700道*分配.xlsx` | no | `--set control` and `retrieval_signal.py`: drawing random control questions |

`private/` is ignored by git. Point `LEXREACT_DATA` to another folder if the files live elsewhere:

```sh
export LEXREACT_DATA=/path/to/data      # must contain civil_code_20200528.txt, civil_graph.markdown and private/
```

Without the private files you can still run the engine tests, recompile the rules, print the reports from
`results/`, and draw the figures.

Each line of `pfc_v3_aligned.jsonl` is a JSON object with at least
`qid`, `gold`, `system`, `user` (the PFC-v3 prompt, containing `【案情】` and `【问题/选项】` sections) and
`provided_article_nos` (LEGO's top-8 article numbers).
