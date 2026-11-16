#!/usr/bin/env python3
"""Main-result figure from the large evaluation (style: figstyle.py, after figures4papers).
   python3 plot_results.py [path/to/eval_large.jsonl]  ->  figures/out/main_results.{pdf,png,svg}
(a) EM per configuration on the held-out split: bars = mean over seeds, error bars = s.d., dots = seeds.
(b) paired EM difference to the host baseline, per question averaged over seeds, with 95% bootstrap CI."""
import json
import random
import sys
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np

from figstyle import PALETTE, apply_style, finalize

HERE = Path(__file__).resolve().parent
DEFAULT = HERE.parent / 'results' / 'eval_large.jsonl'
SEEDS = [7, 11, 23]
DEV = {526, 558, 662, 504, 530, 702, 306, 583, 565, 214, 388,
       336, 338, 341, 435, 440, 462, 491, 506, 516, 547, 568, 569, 574, 598, 631, 632, 648, 652, 685}
CONFIGS = [  # (label, variant, key, colour)
    ('LEGO\n(host)', 'v1', 'base', PALETTE['red_2']),
    ('Ours\n(main)', 'v1', 'pipe', PALETTE['blue_main']),
    ('Ours + doubt\n& presumption', 'v2noopt', 'pipe', PALETTE['neutral']),
    ('… + option\nagent', 'v2', 'pipe', PALETTE['neutral']),
]


def load(path):
    rows = [json.loads(l) for l in open(path, encoding='utf-8')]
    by = {(r['qid'], r['seed'], r['variant']): r for r in rows if 'error' not in r}
    qs = sorted({q for q, _, _ in by})
    full = [q for q in qs if all((q, s, v) in by for s in SEEDS for v in ('v1', 'v2noopt', 'v2'))]
    return by, [q for q in full if q not in DEV]


def fmt(x):
    v = round(x * 100, 1)
    return '0.0' if v == 0 else f'{v:+.1f}'.replace('-', '\u2212')


def boot_ci(d, n=4000, seed=0):
    rng = random.Random(seed)
    b = sorted(sum(rng.choice(d) for _ in d) / len(d) for _ in range(n))
    return b[int(0.025 * n)], b[int(0.975 * n) - 1]


def main(path):
    by, Q = load(path)
    apply_style(font_size=7)
    fig, (a1, a2) = plt.subplots(1, 2, figsize=(6.9, 2.1), gridspec_kw=dict(width_ratios=[1.15, 1], wspace=0.55))

    # (a) EM per configuration
    for i, (lab, v, k, col) in enumerate(CONFIGS):
        per_seed = np.array([np.mean([by[(q, s, v)][k + '_em'] for q in Q]) for s in SEEDS])
        a1.bar(i, per_seed.mean(), width=0.62, color=col, edgecolor=PALETTE['ink'], linewidth=0.7, zorder=2)
        a1.errorbar(i, per_seed.mean(), yerr=per_seed.std(ddof=1), color=PALETTE['ink'], capsize=2.5, lw=0.7, zorder=3)
        a1.scatter(np.full(3, i) + np.array([-0.13, 0, 0.13]), per_seed, s=6, color='white', edgecolor=PALETTE['ink'],
                   linewidth=0.5, zorder=4)
        a1.text(i, per_seed.mean() + per_seed.std(ddof=1) + 0.012, f'{per_seed.mean():.3f}', ha='center', va='bottom', fontsize=6)
    a1.set_xticks(range(len(CONFIGS)), [c[0] for c in CONFIGS])
    a1.set_ylim(0.55, 0.72)
    a1.set_yticks([0.55, 0.60, 0.65, 0.70])
    a1.set_ylabel('Exact match')
    a1.set_title(f'(a) Held-out accuracy ({len(Q)} questions × {len(SEEDS)} seeds)', fontsize=7, loc='left')

    # (b) paired difference to the host baseline
    for i, (lab, v, k, col) in enumerate(CONFIGS[1:]):
        d = [np.mean([by[(q, s, v)]['pipe_em'] - by[(q, s, 'v1')]['base_em'] for s in SEEDS]) for q in Q]
        m = float(np.mean(d))
        lo, hi = boot_ci(d)
        y = len(CONFIGS) - 2 - i
        a2.plot([lo * 100, hi * 100], [y, y], color=PALETTE['ink'], lw=0.9, solid_capstyle='butt', zorder=2)
        a2.scatter([m * 100], [y], s=26, color=col, edgecolor=PALETTE['ink'], linewidth=0.7, zorder=3)
        a2.text(hi * 100 + 0.4, y, fmt(m) + '  [' + fmt(lo) + ', ' + fmt(hi) + ']', va='center', fontsize=6)
    a2.axvline(0, color=PALETTE['gray_mid'], lw=0.7, ls=(0, (3, 2)), zorder=1)
    a2.set_yticks(range(len(CONFIGS) - 1), ['Ours (main)', '+ doubt & pres.', '+ option agent'][::-1])
    a2.set_ylim(-0.6, len(CONFIGS) - 1.4)
    a2.set_xlim(-3, 17)
    a2.set_xlabel('Δ EM vs. LEGO (points, 95% CI)')
    a2.set_title('(b) Paired difference to the host', fontsize=7, loc='left')
    a2.spines['left'].set_visible(False)
    a2.tick_params(axis='y', length=0)

    print('saved', finalize(fig, HERE / 'out' / 'main_results')[0])


if __name__ == '__main__':
    main(sys.argv[1] if len(sys.argv) > 1 else DEFAULT)
