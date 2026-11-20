# LEGO concept cards

Copied from the LEGO repository (https://github.com/BLK-WHT/LEGO, commit `e45bd93`, `data/graph/`), Apache-2.0.

- `nodes.jsonl`: 409 concept cards (`title`, `issue_frames`, `positive_conditions`, `negative_conditions`, `legal_effects`,
  `distinguish_from`, `priority_or_exception`).
- `edges.jsonl`: 4,152 support edges between a concept and a Civil Code article, with a learned weight.

`src/codebook/build_codebook.py` uses them only as references: each rule card lists the LEGO concepts that best support its
articles. The rule cards themselves follow the same fields but are written from the expert graph and the Code text.
