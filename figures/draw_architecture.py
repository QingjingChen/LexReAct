#!/usr/bin/env python3
"""Architecture figure for the LexReact pipeline (style: figstyle.py, after figures4papers).
   python3 draw_architecture.py  ->  figures/out/architecture_lexreact.{pdf,png,svg}
Colour semantics: blue = our symbolic components, green = our LLM agents, red = host system (LEGO),
grey = deterministic program, white = data. Drawn at print size (6.9 in wide, 7 pt text)."""
from pathlib import Path

import matplotlib.pyplot as plt
from matplotlib.patches import FancyArrowPatch, FancyBboxPatch, Rectangle
from matplotlib.path import Path as MPath

from figstyle import BLUE_FILL, PALETTE, apply_style, finalize

OUT = Path(__file__).resolve().parent / 'out'
apply_style(font_size=7)

INK = PALETTE['ink']
SUB = PALETTE['gray_mid']
LINE = PALETTE['gray_dark']
FILL = {'sym': BLUE_FILL, 'llm': PALETTE['green_1'], 'host': PALETTE['red_1'], 'prog': '#F2F2F2', 'data': '#FFFFFF'}

W, H = 119, 40
fig = plt.figure(figsize=(6.9, 6.9 * H / W))
ax = fig.add_axes([0, 0, 1, 1])
ax.set_xlim(0, W)
ax.set_ylim(0, H)
ax.axis('off')


def node(x, y, w, h, kind, name, sub=''):
    ax.add_patch(FancyBboxPatch((x, y), w, h, boxstyle='round,pad=0,rounding_size=0.6', fc=FILL[kind], ec=INK, lw=0.8))
    cy = y + h / 2
    if sub:
        ax.text(x + w / 2, cy + 0.9, name, ha='center', va='center', color=INK, fontsize=7)
        ax.text(x + w / 2, cy - 1.3, sub, ha='center', va='center', color=SUB, fontsize=6)
    else:
        ax.text(x + w / 2, cy, name, ha='center', va='center', color=INK, fontsize=7)
    return dict(l=x, r=x + w, b=y, t=y + h, cx=x + w / 2, cy=cy)


def edge(pts, label='', at=None, ha='center', va='bottom', dashed=False, color=LINE):
    codes = [MPath.MOVETO] + [MPath.LINETO] * (len(pts) - 1)
    ax.add_patch(FancyArrowPatch(path=MPath(pts, codes), arrowstyle='-|>,head_length=3.2,head_width=1.6',
                                 color=color, lw=0.7, ls=(0, (2.5, 1.5)) if dashed else '-', shrinkA=0, shrinkB=0.4,
                                 joinstyle='miter', capstyle='butt'))
    if label:
        ax.text(*at, label, ha=ha, va=va, fontsize=6, color=SUB)


def panel(x, y, w, h, title):
    ax.add_patch(Rectangle((x, y), w, h, fc='#f7f7f7', ec='#bdbdbd', lw=0.5))
    ax.text(x + 0.8, y + h - 0.7, title, ha='left', va='top', fontsize=6, color=SUB, style='italic')


# ── panels
panel(33, 30.5, 55, 9, 'Offline')
ax.add_patch(Rectangle((44, 3.5), 41.5, 25, fc='#f7f7f7', ec='#bdbdbd', lw=0.5))
ax.text(44.8, 4.1, 'Interrogation loop (at most 2 rounds)', ha='left', va='bottom', fontsize=6, color=SUB, style='italic')

# ── offline knowledge base
kg = node(35, 32, 14, 5, 'data', 'Knowledge graph', '8,355 nodes')
lr = node(52.5, 32, 17.5, 5, 'prog', 'LegalRuleML', '179 rules, 47 overrides')
dd = node(73.5, 32, 13, 5, 'sym', 'DDL program', 'ASP encoding')
edge([(kg['r'], kg['cy']), (lr['l'], lr['cy'])])
edge([(lr['r'], lr['cy']), (dd['l'], dd['cy'])])

# ── inputs
cq = node(0.5, 21, 12, 5, 'data', 'Case $c$', 'question $q$')
rr = node(0.5, 11, 12, 5, 'host', 'Articles $R$', 'host retriever')

# ── main path
ms = node(15.5, 11, 15.5, 5, 'prog', 'Module selection', '$R \\rightarrow M$')
ex = node(27, 21, 13, 5, 'llm', 'Extraction', 'facts $F_0$')
rs = node(46.5, 18, 15, 5, 'sym', 'DDL reasoner', 'clingo')
au = node(67.5, 18, 17, 5, 'llm', 'Fact audit', 'quote-checked')
sg = node(67.5, 6.5, 17, 5, 'sym', 'Reasoning signals', 'exceptions, near-misses')
vf = node(46.5, 6.5, 15, 5, 'llm', 'Verifier', 'quote-checked')
fl = node(89, 6.5, 17, 5, 'sym', 'Retrieval filter', 'applicable rules only')
ev = node(89, 18, 17, 5, 'prog', 'Evidence', 'facts, articles, proofs')
rd = node(108.5, 18, 10, 5, 'host', 'Reader', 'host prompt')

edge([(cq['r'], cq['cy']), (ex['l'], ex['cy'])])
edge([(rr['r'], rr['cy']), (ms['l'], ms['cy'])])
edge([(ms['r'] - 2.5, ms['t']), (ms['r'] - 2.5, 18.5), (ex['l'] + 4, 18.5), (ex['l'] + 4, ex['b'])], '$M$',
     (ms['r'] - 1.9, 17.2), ha='left', va='center')
edge([(ex['r'], ex['cy']), (42.5, ex['cy']), (42.5, rs['cy']), (rs['l'], rs['cy'])], '$F_0$', (41.2, ex['cy'] + 0.3))
edge([(dd['l'] + 3, dd['b']), (dd['l'] + 3, 29.5), (rs['cx'], 29.5), (rs['cx'], rs['t'])])
edge([(rs['r'], rs['cy']), (au['l'], au['cy'])])
edge([(au['cx'], au['b']), (sg['cx'], sg['t'])])
edge([(sg['l'], sg['cy']), (vf['r'], vf['cy'])])
edge([(vf['cx'], vf['t']), (rs['cx'], rs['b'])], 'verified facts', (vf['cx'] + 0.8, (vf['t'] + rs['b']) / 2),
     ha='left', va='center')
edge([(85.5, fl['cy']), (fl['l'], fl['cy'])])
edge([(85.5, ev['cy']), (ev['l'], ev['cy'])])
edge([(fl['cx'], fl['t']), (ev['cx'], ev['b'])], 'added articles', (fl['cx'] + 0.8, (fl['t'] + ev['b']) / 2),
     ha='left', va='center')
edge([(ev['r'], ev['cy']), (rd['l'], rd['cy'])])
edge([(rr['cx'], rr['b']), (rr['cx'], 1.5), (rd['cx'], 1.5), (rd['cx'], rd['b'])], '$c,\\,q,\\,R$ (unchanged)',
     (rd['cx'] - 1, 1.9), ha='right', dashed=True, color='#8c8c8c')
edge([(rd['cx'], rd['t']), (rd['cx'], 27.5)], 'answer', (rd['cx'], 27.9))

# ── key
kx, ky = 98, 38
for i, (k, name) in enumerate((('sym', 'symbolic (ours)'), ('llm', 'LLM agent (ours)'), ('host', 'host system (LEGO)'),
                               ('prog', 'program'))):
    ax.add_patch(Rectangle((kx, ky - i * 2.3), 2, 1.4, fc=FILL[k], ec=INK, lw=0.6))
    ax.text(kx + 2.8, ky - i * 2.3 + 0.7, name, va='center', fontsize=6, color=SUB)

print('saved', finalize(fig, OUT / 'architecture_lexreact')[0])
