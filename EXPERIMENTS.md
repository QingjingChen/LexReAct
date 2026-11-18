# Experiments

All LLM experiments use `qwen3.5-35b-a3b` through DashScope at temperature 0, with the LexGo questions and
LEGO's top-8 retrieved articles and PFC-v3 prompts (`data/private/pfc_v3_aligned.jsonl`).
"Rule-covered questions" are those for which at least 3 of LEGO's top-8 articles fall in one rule module.

| ID | What | Role in the paper | Script | Result file |
|---|---|---|---|---|
| E1 | Knowledge-base validation | §3, encoding check | `run_cases.py`, `graph2lrml.py` | stdout |
| E2 | Reasoning-error case studies (9 questions) | §7, case studies | `run_cases.py graph/civil/examples/*.json` | `graph/civil/examples/README.md` |
| E3 | Engine signals for fact extraction (Q214) | motivation / §4 | `extract_loop.py` | `results/q214_extract_loop.log` |
| E4 | Fact-triggered retrieval signals | exploratory | `retrieval_signal.py` | `results/retrieval_signal_results.json` |
| E5 | Verify-then-retrieve | §4.6 design choice | `verified_retrieval.py` | `results/verified_retrieval_results.json` |
| E6 | Pipeline development on 30 questions | development only, not evidence | `agents_pipeline.py` | `results/pipeline_dev30_*.jsonl` |
| E7 | **Large evaluation** | **§6 main result** | `eval_large.py` | `results/eval_large.jsonl` |
| E8 | Ablations, more seeds, second model | §6.2, planned | `eval_large.py` (to extend) | — |

## E1 Knowledge-base validation

```sh
python src/run_cases.py                      # 53 cases, 138 expected conclusions: all pass
python src/graph2lrml.py                     # needs the private graph: rebuilds, quote check, anchor check, XSD
python src/extract_rule_layer.py             # rule layer only; its ASP is identical to graph/civil/civil_rules.lp
```

- Rule layer: 10 modules, 179 rules (55 with negation-as-failure exceptions), 47 overrides, 91 articles,
  280 predicates; 201 automatically extracted is-a rules.
- The quote check found 8 places where the graph's notes misquote or mis-cite the Code
  (e.g. a note citing art. 736 for text of art. 737).

## E2 Reasoning-error case studies

From questions where the gold articles were all retrieved but at least one baseline (LEGO or an IRAC prompt on the
same retrieval) answered wrongly, 26 candidates were screened manually and 9 kept: Q526, Q558, Q662, Q504, Q530
(both baselines wrong) and Q702, Q306, Q583, Q565 (only IRAC wrong). The engine derives the correct judgement for
every option it covers. Details and the baselines' reasoning errors: `graph/civil/examples/README.md`.

## E3 Engine signals for fact extraction (Q214)

Three extraction arms, same model, seeds 7/11/23:
A = predicate vocabulary only; B = A + article text; C = B + reasoning-signal loop (questions about pending
exceptions and near-miss rules, answered with quotes that must occur in the case).
Correct conclusions on all three seeds: A 0/3, B 0/3, **C 3/3**.

## E4 Fact-triggered retrieval signals

18 questions where LEGO missed gold articles ("miss") and 18 controls. Rules triggered by extracted facts propose
articles outside LEGO's top-8. Adding all proposed articles directly: 5/18 miss questions fully recovered, 7/22
missing articles found, but 4.0 (miss) / 3.5 (control) extra articles per question; 5% of them are gold.

## E5 Verify-then-retrieve

Same questions and extracted facts as E4; an article is added only if its rule becomes applicable after the engine's
questions are answered with verified quotes. 4/18 recovered, 6/22 articles found, 2.1 / 0.9 extra articles per
question; **11%** of added articles are gold (vs. 5% in E4). This filter is the retrieval step of the final pipeline.

## E6 Pipeline development (30 questions, seed 7)

11 example questions + 19 random rule-covered controls; used to design and debug the pipeline.

| config | EM | F1 |
|---|---|---|
| LEGO (host prompt) | 17/30 | — |
| v1 (main configuration) | 21/30 | 0.848 |
| v2noopt (+ doubtful facts, presumption marks, quote splicing) | 20/30 | 0.780 |
| v2 (+ option agent) | 20/30 | 0.782 |

These 30 questions were looked at during development, so they are **not** used as evidence. E7 shows that the gain
on them does not hold under other seeds.

## E7 Large evaluation (main result)

```sh
python src/eval_large.py --run --workers 8   # 156 questions × seeds {7, 11, 23} × {v1, v2noopt, v2}
python src/eval_large.py --report
```

Question set: 156 rule-covered questions (excluding Q517, Q575, Q577, whose gold answers are doubtful),
21.6% of the 723 LexGo questions. 22 of them are in the E6 development set; 134 are held out.
Each task also re-runs the host prompt, so every pipeline answer is paired with a host answer from the same run.

Held-out set (134 questions × 3 seeds):

| config | EM mean ± s.d. (per seed) | F1 | Δ EM vs. host, 95% CI | fixed / broken | sign test |
|---|---|---|---|---|---|
| LEGO (host) | 0.609 ± 0.019 (0.627, 0.590, 0.612) | 0.747 | — | — | — |
| **v1** | **0.654 ± 0.026** (0.657, 0.627, 0.679) | **0.780** | **+4.5 [−0.0, +9.0]** | 44 / 26 | p ≈ 0.031 |
| v2noopt | 0.639 ± 0.009 | 0.761 | +3.0 [−1.2, +7.2] | 42 / 30 | p ≈ 0.16 |
| v2 | 0.649 ± 0.039 | 0.781 | +4.0 [−0.5, +8.5] | 46 / 30 | p ≈ 0.07 |

Full set (156): v1 − host +3.8 [−0.4, +8.1], p ≈ 0.05. Development subset (22): v1 = host (0.667 each).
v2noopt − v1 = −1.5 [−5.2, +2.5]; v2 − v2noopt = +1.0 [−3.7, +5.7] on the held-out set.

Behaviour of v1 (468 runs): 5.8 facts extracted per question; the audit removed at least one fact in 43.6% of runs
(0.83 on average); interrogation added facts in 57.1% (1.38 on average); verify-then-retrieve added at least one
article in 28.4% (0.47 on average).

Figures: `python figures/plot_results.py` → `figures/out/main_results.pdf`.

## E8 Planned

- Ablations of v1 (each 156 × 3 runs): no audit; no interrogation; no verify-then-retrieve; facts without proofs;
  no quote requirement.
- Two more seeds for host and v1, so that the CI of the main result is clear of zero or not.
- A second model.
- Error analysis of the 26 broken (question, seed) pairs.

## Caveats

1. **Rules written during development.** A few rules (`c226-delivery`, `c604-price`, `c-revoke-against`) were added
   while debugging E6 questions. They state general provisions, but a clean check is to drop them and re-run E7
   on the held-out set.
2. **API non-determinism and the cache.** The API is not deterministic even with a fixed seed. In the archived E7 run
   the three variants of the same (question, seed) ran concurrently, so each made its own extraction call and the
   cache kept only the last response: for 172 of 468 v1 runs the extraction differs from the cached one. Two
   consequences: (a) the archived E7 records cannot all be regenerated from the cache; (b) v1 and v2 were **not**
   paired on extraction, so v1-vs-v2 differences include extraction noise (pipeline-vs-host comparisons are
   paired, since both come from the same run). `eval_large.py` now runs all variants of a (question, seed) in one
   process, one after another, so future comparisons (E8) share every common LLM call.
3. **Failed runs.** Four E7 runs (Q657 × 3, Q573 × 1, all v2/v2noopt) first failed on malformed JSON from the
   model and were re-run after a tolerant JSON fallback was added to `extract_loop.extract_json`; the fallback is
   only used when the standard parser fails. The failed attempts remain in `eval_large.jsonl` as six `error`
   records and are ignored by `--report`.
4. **Coverage.** The rules cover 21.6% of LexGo; results say nothing about the remaining questions.
