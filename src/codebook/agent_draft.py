#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
供 agent（如 Claude 子任务）逐行起草规则卡片：取材料 → 写 JSON → 提交检查（与 draft_llm.py 同一套检查）→ 通过即入库。

  python src/codebook/agent_draft.py todo [--chapter 第三编 第十三章]     # 列出 qwen 版缺失、agent 版也未完成的行
  python src/codebook/agent_draft.py show card:g5223                     # 打印该行的起草提示（任务说明、示例、相关谓词、法条、笔记、LEGO 卡片）
  python src/codebook/agent_draft.py submit card:g5223 /path/draft.json  # 检查并保存；不通过则打印问题清单，改后再交

草稿存入 graph/civil/codebook/drafts/<VERSION>/<编>_<章>.json；谓词词表与 key 占用取 qwen 版（drafts 根目录）与本版已通过的草稿，
保证与 qwen 版前半部分一致，审核表里可直接接在 qwen 版之后。
"""
import argparse
import collections
import fcntl
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE), str(HERE.parent)]
import build_review_all as BR  # noqa: E402
import draft_llm as D  # noqa: E402

VERSION = 'claude-agent'


def setup(law):
    D.DOM.update(D.civil_domain() if law == 'civil' else D.criminal_domain())
    root = D.DOM['drafts']
    mine = root / VERSION
    rows = [r for r in json.load(open(D.DOM['rows'], encoding='utf-8')) if not r['rules'] and r['articles']]
    prior = {**D.load_drafts(root / 'deepseek-v4.1-flash-mb'), **D.load_drafts(root), **D.load_drafts(mine)}
    return root, mine, rows, prior


def out_file(mine, row):
    ch = row['chapter']
    return mine / f'{re.sub(r"[　 ]+", "", ch[0])}_{re.sub(r"[　 ]+", "", ch[1])}.json'


def context(row, prior):
    gloss = dict(D.DOM['gloss'])
    for d in prior.values():
        gloss.update(d.get('predicates', {}))
    others = {k: v for k, v in prior.items() if k != row['id']}
    arity = D.vocabulary([BR.draft_rule(r) for d in others.values() for r in d['rules']])
    local = {p for k, d in others.items() if 'chapter' in d and d['chapter'] == row['chapter'] for p in d.get('predicates') or {}}
    taken = {r['key'] for r in D.DOM['base_rules']} | {r['key'] for d in others.values() for r in d['rules']}
    return gloss, arity, local, taken


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('cmd', choices=['todo', 'show', 'submit'])
    ap.add_argument('rid', nargs='?')
    ap.add_argument('file', nargs='?')
    ap.add_argument('--law', choices=['civil', 'criminal'], default='civil')
    ap.add_argument('--chapter', nargs='+')
    a = ap.parse_args()
    root, mine, rows, prior = setup(a.law)
    byid = {r['id']: r for r in rows}
    if a.cmd == 'todo':
        left = [r for r in rows if r['id'] not in prior and all(any(c in x for x in r['chapter']) for c in a.chapter or [])]
        g = collections.OrderedDict()
        for r in left:
            g.setdefault('／'.join(r['chapter']), []).append(r)
        for ch, rs in g.items():
            print(f'{ch}（{len(rs)} 行）')
            for r in rs:
                print(f'  {r["id"]}  第{"、".join(map(str, r["articles"][:12]))}条{"等" if len(r["articles"]) > 12 else ""}')
        print(f'共 {len(left)} 行')
        return
    row = byid.get(a.rid) or sys.exit(f'没有这一行：{a.rid}')
    gloss, arity, local, taken = context(row, prior)
    if a.cmd == 'show':
        vocab = D.row_vocab(row, arity, gloss, set(D.DOM['gloss']), local)
        print(D.SYSTEM + '\n' + D.prompt_for(row, vocab, *D.DOM['example']()))
        return
    d = json.load(open(a.file, encoding='utf-8'))
    errs = D.check(d, row, arity, gloss, taken)
    if errs:
        print(f'未通过（{len(errs)} 项），请全部修正后重新提交：')
        print('\n'.join(f'- {e}' for e in errs))
        sys.exit(1)
    mine.mkdir(parents=True, exist_ok=True)
    f = out_file(mine, row)
    with open(mine / '.lock', 'w') as lk:
        fcntl.flock(lk, fcntl.LOCK_EX)
        done = json.load(open(f, encoding='utf-8')) if f.exists() else {}
        done[row['id']] = dict(status='ok', model=VERSION, attempts=1, errors=[], chapter=row['chapter'],
                               **{k: d.get(k) or ({} if k in ('nl', 'predicates') else []) for k in ('nl', 'rules', 'overrides', 'predicates')})
        f.write_text(json.dumps(done, ensure_ascii=False, indent=1), encoding='utf-8')
    print(f'通过，已保存：{row["id"]} → {f}（规则 {len(d["rules"])} 条）')


if __name__ == '__main__':
    main()
