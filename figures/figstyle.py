"""Shared figure style, following the conventions of figures4papers
(https://github.com/ChenLiu-1996/figures4papers, scientific-figure-making/references/design-theory.md):
Helvetica/Arial, top/right spines off, frameless legends, semantic blue-green-red-neutral palette,
300-dpi export to PDF/PNG plus SVG with editable text.

Figures here are drawn at print size (full text width ~6.9 in, 7 pt text), so no rescaling is needed in LaTeX."""
from pathlib import Path

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

PALETTE = {
    'blue_main': '#0F4D92', 'blue_secondary': '#3775BA',
    'green_1': '#DDF3DE', 'green_2': '#AADCA9', 'green_3': '#8BCF8B',
    'red_1': '#F6CFCB', 'red_2': '#E9A6A1', 'red_strong': '#B64342',
    'neutral': '#CFCECE', 'gray_mid': '#767676', 'gray_dark': '#4D4D4D', 'ink': '#272727',
}
BLUE_FILL = '#DCE6F3'   # blue_secondary at ~18% on white, for box fills


def apply_style(font_size=7, axes_linewidth=0.8):
    plt.rcParams.update({
        'font.family': ['Helvetica', 'Arial', 'DejaVu Sans', 'sans-serif'],
        'font.size': font_size,
        'mathtext.fontset': 'custom', 'mathtext.rm': 'Arial', 'mathtext.it': 'Arial:italic',
        'axes.spines.right': False, 'axes.spines.top': False,
        'axes.linewidth': axes_linewidth, 'axes.edgecolor': PALETTE['ink'],
        'xtick.major.width': axes_linewidth, 'ytick.major.width': axes_linewidth,
        'xtick.color': PALETTE['ink'], 'ytick.color': PALETTE['ink'],
        'legend.frameon': False,
        'pdf.fonttype': 42, 'ps.fonttype': 42, 'svg.fonttype': 'none',
    })


def finalize(fig, out_stem, formats=('pdf', 'png', 'svg'), dpi=300, pad=0.02):
    out_stem = Path(out_stem)
    out_stem.parent.mkdir(parents=True, exist_ok=True)
    paths = []
    for ext in formats:
        p = out_stem.with_suffix('.' + ext)
        fig.savefig(p, dpi=dpi, bbox_inches='tight', pad_inches=pad, facecolor='white')
        paths.append(p)
    plt.close(fig)
    return paths
