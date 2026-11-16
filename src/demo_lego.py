#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
最小演示：把 civil_graph 的规则层接到 LEGO（PFC-v3）上，单题对比。

  baseline  重放存档的 LEGO PFC-v3 提示（同一模型，经 DashScope；默认 qwen3.5-35b-a3b）
  +rules    1) 用 LEGO 检索到的法条号选出规则模块（规则的 srcs 与之相交）
            2) LLM 只按该模块的“事实谓词表”从案情中抽取事实（JSON）
            3) DDL 引擎（clingo）推理，得到结论 + 推理链
            4) 把引擎结论附在原 PFC-v3 提示末尾，再由同一模型作答

用法：python3 demo_lego.py 388 [--model M]            完整流程
      python3 demo_lego.py 388 --no-llm --facts "adult(yi);cannotDiscern(yi);actOf(k1,yi)"   仅符号部分
"""
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import formal_rules as FR  # noqa: E402
import run_cases as RC  # noqa: E402
from llm_client import chat, extract_json  # noqa: E402

from paths import ARCHIVE  # noqa: E402
MODEL = 'qwen3.5-35b-a3b'


def preds(lits):
    for l in lits:
        for a in (l[1] if isinstance(l, tuple) else [l]):
            for x in a.split(' '):
                m = re.match(r'[-~]?(\w+)\((.*)\)', x)
                yield m.group(1), len(m.group(2).split(','))


def select_modules(article_nos):
    out = []
    for m, (title, rules) in FR.MODULES.items():
        arts = {int(re.match(r'art(\d+)', s).group(1)) for r in rules for s in r['srcs']}
        if arts & set(article_nos):
            out.append(m)
    # 依赖闭包：所选模块规则体中用到、但由其他模块推出的谓词（如侵权规则用到的 noCapacity），补入定义它的模块
    def head_preds(m):
        return {re.match(r'-?(\w+)', h if isinstance(h, str) else h[3]).group(1) for r in FR.MODULES[m][1] for h in r['heads']}
    changed = True
    while changed:
        changed = False
        used = {p for m in out for r in FR.MODULES[m][1] for p, _ in preds(r['body'])}
        for m in FR.MODULES:
            if m not in out and head_preds(m) & used - set().union(*(head_preds(x) for x in out)):
                out.append(m)
                changed = True
    return out


ROLE = {'V': '受害人', 'S': '教育机构', 'X': '事件编号', 'A': '行为人', 'Q': '第三人', 'G': '监护人', 'W': '被监护人', 'E': '工作人员',
        'U': '用人单位/使用人', 'K': '饲养人或合同', 'An': '动物', 'Pr': '产品', 'M': '生产者/抵押人', 'Se': '销售者', 'P': '人',
        'C': '相对人/请求权/债权人', 'D': '义务人/被继承人', 'H': '继承人', 'T': '标的物', 'B': '买受人/抵押权人', 'Z': '债权',
        'O': '所有人', 'Bd': '建筑物', 'Pm': '物业', 'Dp': '劳务派遣单位', 'Y': '第三人/受让人', 'L': '土地或租赁', 'E2': '遗产'}


def vocab(mods):
    rules = [r for m in mods for r in FR.MODULES[m][1]]
    heads = {re.match(r'-?(\w+)', h if isinstance(h, str) else h[3]).group(1) for r in rules for h in r['heads']}
    facts = {}
    for r in rules:
        for item in r['body']:
            for a in (item[1] if isinstance(item, tuple) else [item]):
                for x in a.split(' '):
                    m = re.match(r'[-~]?(\w+)\((.*)\)', x)
                    if m.group(1) not in heads:
                        facts.setdefault(m.group(1), [s.strip() for s in m.group(2).split(',')])
    return facts


EXTRACT = """把下面的案情翻译成事实谓词。只使用谓词表中的谓词；个体用小写拼音或字母（如 jia、yi、k1 表示合同）。
只写案情明确给出或依法律常识必然对应的事实（例如“精神病人”通常指不能辨认自己行为的成年人），不要写法律结论，不要被题干中的修辞或选项诱导。
参数必须按方括号里的角色填写；同一次损害事件在所有谓词中用同一个编号（如 x1）；无关的谓词不要写，不要用 none 占位。
年龄类事实只写谓词表里的（如 minor、under8），由规则推出行为能力。

谓词表（名称/参数个数：含义）：
{vocab}

【案情】
{case}

输出 JSON：{{"facts": ["pred(a,b)", ...], "note": "一句话说明映射理由"}}"""

BLOCK = """
【形式化规则推理结果（LegalRuleML → Defeasible Deontic Logic，clingo 执行）】
抽取的事实：{facts}
引擎结论（已处理原则—例外—优先关系，供 C 阶段校验使用；若与题干修辞冲突，以引擎结论的法条依据为准）：
{concl}
"""


def main(qid, facts=None, llm=True):
    rec = next(json.loads(l) for l in open(ARCHIVE, encoding='utf-8') if json.loads(l)['qid'] == qid)
    case = rec['user'].split('【案情】', 1)[1].split('【问题/选项】', 1)[0].strip()
    print(f'Q{qid}  gold={rec["gold"]}  存档LEGO pred={rec["pred"]}  LEGO检索法条={rec["provided_article_nos"]}')

    if llm:
        base = chat(rec['user'], model=MODEL, system=rec['system'], max_tokens=1800)
        print('\n[baseline 重跑] pred =', ''.join(sorted(RC_parse(base))))

    mods = select_modules(rec['provided_article_nos'])
    voc = vocab(mods)
    print('\n[1] 按 LEGO 检索法条选中的规则模块：', mods, f'（事实谓词 {len(voc)} 个）')
    vtxt = '\n'.join(f'- {p}({",".join(a)})：{FR.ZH.get(p, "")}［' + '，'.join(f'{v}={ROLE.get(v, v)}' for v in a) + '］'
                     for p, a in sorted(voc.items()))
    if facts is None:
        ext = extract_json(chat(EXTRACT.format(vocab=vtxt, case=case), model=MODEL, max_tokens=600))
        facts, bad = [], []
        for f in ext.get('facts', []):
            f = f.replace(' ', '')
            m = re.fullmatch(r'-?(\w+)\((.*)\)', f)
            ok = m and m.group(1) in voc and len(m.group(2).split(',')) == len(voc[m.group(1)]) \
                and not re.search(r'\b(none|null|unknown)\b', m.group(2))
            (facts if ok else bad).append(f)
        if bad:
            print('    丢弃不合法的事实：', bad)
        print('[2] 抽取事实：', facts, '｜', ext.get('note', ''))
    else:
        print('[2] 事实（手工给定，代替 LLM 抽取）：', facts)

    model, apps = RC.solve(facts)
    fs = {RC.to_asp(f) for f in facts}
    concl = sorted(s for s in model if re.match(r'(defeasible|obligation|permission)\(', s)
                   and s[s.index('(') + 1:-1] not in fs)
    lines = []
    for c in concl:
        lines += RC.explain(model, apps, c, facts)
    print('[3] 引擎结论与推理链：')
    print('\n'.join('    ' + l for l in lines))

    user2 = rec['user'] + BLOCK.format(facts='；'.join(facts), concl='\n'.join(lines))
    if not llm:
        print('\n[4] 附加到 LEGO PFC-v3 提示末尾的段落：', BLOCK.format(facts='；'.join(facts), concl='\n'.join(lines)))
        return
    aug = chat(user2, model=MODEL, system=rec['system'], max_tokens=1800)
    print('\n[4] +rules 作答 pred =', ''.join(sorted(RC_parse(aug))))
    print('    回答尾部：', aug[-500:].replace('\n', '\n    '))


def RC_parse(raw):
    m = re.findall(r'\[正确答案\]\s*([A-E]+)', raw or '')
    return set(m[-1]) if m else set()


if __name__ == '__main__':
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument('qid', type=int, nargs='?', default=388)
    ap.add_argument('--model', default='qwen3.5-35b-a3b')
    ap.add_argument('--facts', help='逗号分隔前用分号：手工给定事实，跳过 LLM 抽取，如 "adult(yi);actOf(k1,yi)"')
    ap.add_argument('--no-llm', action='store_true', help='只跑符号推理并打印附加段落')
    a = ap.parse_args()
    MODEL = a.model
    main(a.qid, a.facts.split(';') if a.facts else None, llm=not a.no_llm)
