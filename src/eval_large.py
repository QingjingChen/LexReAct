#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
大规模评测：规则覆盖范围内的题 × 3 个种子 × 版本 {LEGO 原提示, v1, v2noopt, v2}

题集：LEGO 存档检索结果（top-8）中至少 3 条法条落在同一规则模块的题（与先前统计口径一致），
      排除金标存疑的 517、575、577。
“开发集” = 调试流水线时用过的 30 题（11 道示例 + 19 道对照）；其余为“留出集”，是更可信的证据。

  python3 eval_large.py --run [--workers 8]     运行（可断点续跑，结果写入 results/eval_large.jsonl）
  python3 eval_large.py --report                汇总
"""
import argparse
import json
import math
import random
import re
import sys
from collections import defaultdict
from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from paths import RESULTS  # noqa: E402
OUT = RESULTS / 'eval_large.jsonl'
SEEDS = [7, 11, 23]
VARIANTS = ['v1', 'v2noopt', 'v2']
EXCLUDE = {517, 575, 577}
DEV = {526, 558, 662, 504, 530, 702, 306, 583, 565, 214, 388,
       336, 338, 341, 435, 440, 462, 491, 506, 516, 547, 568, 569, 574, 598, 631, 632, 648, 652, 685}


def question_set():
    import formal_rules as FR
    import agents_pipeline as AP
    mod_arts = {m: {int(re.match(r'art(\d+)', s).group(1)) for r in rs for s in r['srcs']} for m, (_, rs) in FR.MODULES.items()}
    qs = []
    for l in open(AP.ARCHIVE, encoding='utf-8'):
        r = json.loads(l)
        prov = set(r['provided_article_nos'])
        if max(len(prov & a) for a in mod_arts.values()) >= 3 and r['qid'] not in EXCLUDE:
            qs.append(r['qid'])
    return sorted(qs)


def task(args):
    """一个 (题, 种子) 下的所有版本在同一进程内依次运行：抽取、LEGO 基线作答等共用的调用只请求一次、其余命中缓存，
    各版本因此严格配对。（并发运行同一提示时，API 即使固定 seed 也可能返回不同结果，缓存只保留最后写入的一份。）"""
    qid, seed, variants = args
    import agents_pipeline as AP
    rec = next(json.loads(l) for l in open(AP.ARCHIVE, encoding='utf-8') if json.loads(l)['qid'] == qid)
    outs = []
    for variant in variants:
        AP.VARIANT = variant
        AP.USE_OPTIONS = variant == 'v2'
        try:
            r = AP.run_one(rec, 'qwen3.5-35b-a3b', seed, None)
        except Exception as e:  # noqa: BLE001
            outs.append(dict(qid=qid, seed=seed, variant=variant, error=f'{type(e).__name__}: {e}'[:300]))
            continue
        keep = ('qid', 'gold', 'base', 'pipe', 'base_em', 'pipe_em', 'base_f1', 'pipe_f1', 'facts0', 'facts',
                'extra_articles', 'option_articles', 'trace')
        out = {k: r.get(k) for k in keep}
        out.update(seed=seed, variant=variant)
        outs.append(json.loads(json.dumps(out, ensure_ascii=False)))
    return outs


def run(workers):
    done = set()
    if OUT.exists():
        for l in open(OUT, encoding='utf-8'):
            d = json.loads(l)
            if 'error' not in d:
                done.add((d['qid'], d['seed'], d['variant']))
    qs = question_set()
    todo = [(q, s, [v for v in VARIANTS if (q, s, v) not in done]) for s in SEEDS for q in qs]
    todo = [t for t in todo if t[2]]
    print(f'题集 {len(qs)} 题（开发集 {len(set(qs) & DEV)}，留出集 {len(set(qs) - DEV)}）；'
          f'待运行 {sum(len(t[2]) for t in todo)} 个任务（{len(todo)} 组）', flush=True)
    n = 0
    with ProcessPoolExecutor(max_workers=workers) as ex, open(OUT, 'a', encoding='utf-8') as fo:
        futs = [ex.submit(task, t) for t in todo]
        for f in as_completed(futs):
            for d in f.result():
                fo.write(json.dumps(d, ensure_ascii=False) + '\n')
                fo.flush()
                n += 1
                if n % 25 == 0 or 'error' in d:
                    print(f'  {n}' + (f'  错误 Q{d["qid"]} s{d["seed"]} {d["variant"]}: {d["error"][:100]}' if 'error' in d else ''), flush=True)


def report():
    rows = [json.loads(l) for l in open(OUT, encoding='utf-8')]
    ok = [r for r in rows if 'error' not in r]
    errs = [r for r in rows if 'error' in r]
    by = {(r['qid'], r['seed'], r['variant']): r for r in ok}
    qs = sorted({r['qid'] for r in ok})
    # 只统计四种设置在所有种子上都齐全的题
    full = [q for q in qs if all((q, s, v) in by for s in SEEDS for v in VARIANTS)]
    print(f'记录 {len(rows)} 条（错误 {len(errs)}）；四种设置 × 3 种子齐全的题 {len(full)}\n')

    def stats(Q, title):
        if not Q:
            return
        print(f'== {title}：{len(Q)} 题 × {len(SEEDS)} 种子')
        cfg = [('LEGO 原提示', 'v1', 'base')] + [(v, v, 'pipe') for v in VARIANTS]
        em = {}
        for name, v, k in cfg:
            per_seed = [sum(by[(q, s, v)][k + '_em'] for q in Q) / len(Q) for s in SEEDS]
            f1 = [sum(by[(q, s, v)][k + '_f1'] for q in Q) / len(Q) for s in SEEDS]
            mean = sum(per_seed) / len(per_seed)
            sd = (sum((x - mean) ** 2 for x in per_seed) / (len(per_seed) - 1)) ** .5
            em[name] = per_seed
            print(f'  {name:10s} EM {mean:.3f} ± {sd:.3f}（各种子 {", ".join(f"{x:.3f}" for x in per_seed)}）  F1 {sum(f1) / len(f1):.3f}')
        # 配对比较（相对 LEGO 原提示）：按题聚合 3 个种子的平均 EM，做配对 bootstrap
        for v in VARIANTS:
            d = [sum(by[(q, s, v)]['pipe_em'] - by[(q, s, 'v1')]['base_em'] for s in SEEDS) / len(SEEDS) for q in Q]
            random.seed(0)
            boots = sorted(sum(random.choice(d) for _ in d) / len(d) for _ in range(4000))
            lo, hi = boots[100], boots[3899]
            win = sum(by[(q, s, v)]['pipe_em'] > by[(q, s, 'v1')]['base_em'] for q in Q for s in SEEDS)
            lose = sum(by[(q, s, v)]['pipe_em'] < by[(q, s, 'v1')]['base_em'] for q in Q for s in SEEDS)
            # 符号检验（双侧，正态近似）
            n = win + lose
            z = (win - lose) / math.sqrt(n) if n else 0
            p = math.erfc(abs(z) / math.sqrt(2)) if n else 1
            print(f'  {v} − LEGO：EM 差 {sum(d) / len(d):+.3f}，95% CI [{lo:+.3f}, {hi:+.3f}]；题×种子 纠正 {win}、改错 {lose}，符号检验 p≈{p:.3f}')
        for a, b in (('v2noopt', 'v1'), ('v2', 'v2noopt')):
            d = [sum(by[(q, s, a)]['pipe_em'] - by[(q, s, b)]['pipe_em'] for s in SEEDS) / len(SEEDS) for q in Q]
            random.seed(0)
            boots = sorted(sum(random.choice(d) for _ in d) / len(d) for _ in range(4000))
            print(f'  {a} − {b}：EM 差 {sum(d) / len(d):+.3f}，95% CI [{boots[100]:+.3f}, {boots[3899]:+.3f}]')
        print()

    stats(full, '全集')
    stats([q for q in full if q not in DEV], '留出集（未参与调参）')
    stats([q for q in full if q in DEV], '开发集（调参用过的 30 题）')


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--run', action='store_true')
    ap.add_argument('--report', action='store_true')
    ap.add_argument('--workers', type=int, default=8)
    a = ap.parse_args()
    if a.run:
        run(a.workers)
    if a.report:
        report()
