#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
多智能体流水线：抽取 × 检索 × 推理 × LegalRuleML 信号

  ① Retriever   （程序）LEGO top-8 法条 → 规则模块（含依赖闭包）
  ② Extractor   （LLM） 带参数角色与法条原文的谓词表 → 事实
  ③ Reasoner    （DDL 引擎，读 civil_graph.lrml 转出的 ASP）→ 结论 + 信号
                   核对信号：待定例外 / 差一步的规则（extract_loop.signals）
                   检索信号：被事实触发、法条不在检索结果中的候选规则的缺口（verified_retrieval.gaps）
  ④ Verifier    （LLM） 逐条是/否 + 原文引文；程序核验引文真实性 → Consistency（程序）按一致性约束剔除自相矛盾的事实
  ⑤ Expander    （引擎） 核实后确实可适用（且未被击败）的候选规则 → 其法条补入检索结果
  ⑥ Reader      （LLM） LEGO PFC-v3 原提示 + 核实事实（含引文）+ 补入法条原文 + 引擎推理链 → 答案
  ③–⑤ 最多循环 2 轮。每题完整轨迹写入 results/pipeline_runs.jsonl。

  python3 agents_pipeline.py --set examples          # 11 道示例题
  python3 agents_pipeline.py --set control --n 19    # 规则覆盖范围内随机对照题
  python3 agents_pipeline.py --qids 214 558
"""
import argparse
import glob
import json
import random
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import demo_lego as DL  # noqa: E402
import extract_loop as EL  # noqa: E402
import formal_rules as FR  # noqa: E402
import retrieval_signal as RS  # noqa: E402
import run_cases as RC  # noqa: E402
import verified_retrieval as VR  # noqa: E402
from civil_code import articles  # noqa: E402
from graph_parse import cites_of  # noqa: E402
from llm_client import chat  # noqa: E402

from paths import ARCHIVE, RESULTS, bench_xlsx  # noqa: E402
EXAMPLES = [526, 558, 662, 504, 530, 702, 306, 583, 565, 214, 388]
OUT = RESULTS / 'pipeline_runs.jsonl'
USE_OPTIONS = True   # --no-options：不启用选项智能体（消融）
# 版本：v1 = 主配置（复审答“否”或引文不符即删除；无存疑情形、无推定标注；不启用选项智能体）
#       v2noopt = 存疑事实做两种情形 + 推定标注 + 引文可拼接；v2 = v2noopt + 选项智能体
VARIANT = 'v1'
def is_v1():
    return VARIANT == 'v1'


# ───────────── ① Retriever
def retriever(rec):
    R = set(rec['provided_article_nos'])
    mods = DL.select_modules(rec['provided_article_nos'])
    return R, mods


# ───────────── ④' Consistency（一致性约束；违反者剔除后加入的那条事实）
EXCLUSIVE = [('minor', 'adult'), ('under8', 'age16plus'), ('under8', 'adult')]


def consistent(facts, new):
    F = {(p, tuple(a)) for _, p, a in (EL.lit(f.replace(' ', '')) for f in facts + [new])}
    for a, b in EXCLUSIVE:
        for p, args in F:
            if p == a and (b, args) in F:
                return False, f'{a} 与 {b} 互斥'
    schools = {args[1] for p, args in F if p == 'injuredAtSchool'}
    for p, args in F:
        if p == 'outsiderTortfeasor' and args[0] in schools:
            return False, '教育机构不能同时是“教育机构以外的第三人”'
        if p == 'counterpartyOf' and ('actOf', (args[1], args[0])) in F:
            return False, '行为人不能是自己行为的相对人'
        if p in ('actOf',) and args[0] == args[1]:
            return False, '行为与行为人不能是同一个体'
    return True, ''


# ───────────── ④'' Auditor：复审决定性事实（推理链中的叶子事实），原文不支持的删除
AUDIT = """下面是一个案情，以及从中抽取的若干事实。请逐条判断：该事实是否有案情原文作为依据？
允许常识性的换算与归类（例如“7岁”→不满八周岁；“精神病人”→不能辨认自己行为；“送货的刘某”→教育机构以外的人），
但不得采信题干问句或选项中的修辞、诱导性说法和假设（例如问句里的“鉴于……”）。
有依据的回答 yes 并摘录作为依据的原文片段；原文没有依据、或仅出自问句/选项的，回答 no。

【案情】
{case}

【待复审事实】
{items}

输出 JSON：{{"answers": [{{"id": 1, "answer": "yes" 或 "no", "quote": "原文片段"}}, ...]}}"""


def quote_ok(quote, case):
    """引文须出自案情；允许用“……/...”拼接多段，每段（≥4 字）都须原样出现"""
    segs = [EL.norm(s) for s in re.split(r'……|\.\.\.|…', str(quote))]
    segs = [s for s in segs if len(s) >= 4]
    return bool(segs) and all(s in EL.norm(case) for s in segs)


def decisive_facts(model, apps, facts):
    leaves = set()
    fs = {RC.to_asp(f) for f in facts}
    for s in model:
        if re.match(r'(defeasible|obligation|permission)\(', s) and s[s.index('(') + 1:-1] not in fs:
            for l in RC.explain(model, apps, s, facts):
                m = re.search(r'· (\S+)\s+〔案件事实〕', l)
                if m:
                    leaves.add(m.group(1))
    return [f for f in facts if RC.to_asp(f).replace(' ', '') in leaves]


def audit(case, facts, model, apps, model_name, seed, skip=()):
    dec = [f for f in decisive_facts(model, apps, facts) if f not in skip]
    if not dec:
        return facts, []
    items = '\n'.join(f'{i}. {f}：{FR.ZH.get(re.match(r"-?(\w+)", f).group(1), "")}' for i, f in enumerate(dec, 1))
    out = EL.extract_json(chat(AUDIT.format(case=case, items=items), model=model_name, seed=seed, max_tokens=900))
    removed = []
    for a in out.get('answers', []):
        i = int(a.get('id', 0)) - 1
        if 0 <= i < len(dec):
            if is_v1():   # v1：答“否”或引文不能原样核实即删除
                q = EL.norm(a.get('quote', ''))
                if str(a.get('answer')).lower() != 'yes' or len(q) < 4 or q not in EL.norm(case):
                    removed.append(dec[i])
            elif str(a.get('answer')).lower() != 'yes':   # v2：只有明确答“否”才列为存疑；引文不规范的保留
                removed.append(dec[i])
    return [f for f in facts if f not in removed], removed


# ───────────── 开放式填空：同一谓词只在一个位置上换人的一组问题 → “谁是……？”
FILL = """下面是一个案情，以及推理引擎提出的填空问题：法条要求存在某个角色，请从案情中找出是谁。
可以沿用已有标识（{known}），也可以为案情中出现的其他人/机构起一个小写拼音标识。案情中没有这样的人，回答 no。必须摘录原文。

【案情】
{case}

【填空】
{items}

输出 JSON：{{"answers": [{{"id": 1, "answer": "yes" 或 "no", "who": "标识", "quote": "原文片段"}}, ...]}}"""


def split_open(qs, people):
    groups, rest = {}, {}
    for (p, g), v in qs.items():
        placed = False
        for i, x in enumerate(g):
            if x in people:
                key = (p, tuple('?' if j == i else y for j, y in enumerate(g)), v[1]['key'])
                groups.setdefault(key, []).append(((p, g), v))
                placed = True
                break
        if not placed:
            rest[(p, g)] = v
    opens = {k: m[0][1] for k, m in groups.items() if len(m) >= 2}
    for k, m in groups.items():
        if len(m) < 2:
            rest[m[0][0]] = m[0][1]
    return opens, rest


def ask_open(case, opens, known, model_name, seed):
    if not opens:
        return [], []
    items, keys = [], list(opens)
    for i, (p, pat, rk) in enumerate(keys, 1):
        kind, r = opens[(p, pat, rk)]
        items.append(f'{i}. {p}({",".join(pat)})：谁“{FR.ZH.get(p, p)}”？——规则 {r["key"]}，'
                     f'{"、".join(EL.lbl(s) for s in r["srcs"])}：{EL.text_of(r["srcs"][0])[:80]}')
    out = EL.extract_json(chat(FILL.format(case=case, items='\n'.join(items), known='、'.join(sorted(known))),
                               model=model_name, seed=seed, max_tokens=800))
    added, rejected = [], []
    for a in out.get('answers', []):
        i = int(a.get('id', 0)) - 1
        if not 0 <= i < len(keys) or str(a.get('answer')).lower() != 'yes':
            continue
        p, pat, _ = keys[i]
        who = re.sub(r'[^a-z0-9_]', '', str(a.get('who', '')).lower())
        q = EL.norm(a.get('quote', ''))
        f = f'{p}({",".join(who if x == "?" else x for x in pat)})'
        if who and re.match(r'[a-z]', who) and ((len(q) >= 4 and q in EL.norm(case)) if is_v1() else quote_ok(a.get('quote', ''), case)):
            added.append(f)
        else:
            rejected.append((f, a.get('quote', '')))
    return added, rejected


# ───────────── ③–⑤ 推理 + 信号 + 核对 + 补检索
def reason_loop(case, facts, R, mods, voc, model_name, seed, rounds=2):
    facts = [f for f in facts if VR.CONST.fullmatch(f.replace(' ', ''))]
    cands = [k for k in VR.fired_rules(facts, R) if RS.RA[k] - R]
    model, apps = RC.solve(facts)
    trace, asked, quotes = [], set(), {}
    facts, removed = audit(case, facts, model, apps, model_name, seed)             # 复审决定性事实
    if removed:
        model, apps = RC.solve(facts)
    trace.append(dict(round=0, audited_removed=removed))
    doubtful = [] if is_v1() else list(removed)
    for rnd in range(1, rounds + 1):
        qs = dict(EL.signals(model, facts, mods, voc))                       # 核对信号
        for k in cands:                                                      # 检索信号
            if k not in VR.applicable_keys(apps):
                for key, val in VR.gaps(VR.RULE[k], model, facts, voc).items():
                    qs.setdefault(key, val)
        qs = {k: v for k, v in qs.items() if k not in asked}
        qs = dict(list(qs.items())[:20])
        if not qs:
            break
        asked |= set(qs)
        people = {x for f in facts for _, _, a in [EL.lit(f.replace(' ', ''))] for x in a}
        opens, qs = split_open(qs, people)
        o_added, o_rej = ask_open(case, opens, people, model_name, seed)
        lines, added, rejected = EL.ask(case, qs, model_name, seed) if qs else ([], [], [])
        added = o_added + added
        rejected = o_rej + rejected
        kept, dropped = [], []
        for a in added:
            ok, why = consistent(facts + kept, a)
            if ok and VR.CONST.fullmatch(a):
                kept.append(a)
            else:
                dropped.append((a, why or '个体名不合法'))
        trace.append(dict(round=rnd, open_questions=[f'{p}({",".join(pat)})·{rk}' for p, pat, rk in opens],
                          questions=[f'{p}({",".join(g)})·{kind}·{r["key"]}' for (p, g), (kind, r) in qs.items()],
                          verified=kept, quote_rejected=[r[0] for r in rejected], inconsistent=dropped))
        if not kept:
            break
        facts += [a for a in kept if a not in facts]
        model, apps = RC.solve(facts)
    ok = VR.applicable_keys(apps)
    extra = sorted({a for k in cands if k in ok for a in RS.RA[k]} - R)
    alt = None
    if doubtful:                      # 存疑事实若成立，结论有何不同
        am, aa = RC.solve(facts + [d for d in doubtful if d not in facts])
        alt = (doubtful, am, aa)
    return facts, model, apps, extra, trace, alt


PRESUMPTIVE = {'c-valid-default': '推定规则：仅表示未发现无效、效力待定等事由；若事实抽取不全，此推定不可靠',
               'c-oppose-default': '推定规则：仅表示未发现不得对抗的事由'}


def mark(lines):
    out = []
    for l in lines:
        for k, why in PRESUMPTIVE.items():
            if f'规则 {k}（' in l:
                l = l.replace(f'规则 {k}（', f'〖{why}〗规则 {k}（')
        out.append(l)
    return out


def concl_set(model, facts):
    fs = {RC.to_asp(f) for f in facts}
    return {s for s in model if re.match(r'(defeasible|obligation|permission)\(', s) and s[s.index('(') + 1:-1] not in fs}


def engine_block(facts, model, apps, extra, base_facts, alt=None):
    fs = {RC.to_asp(f) for f in facts}
    concl = sorted(s for s in model if re.match(r'(defeasible|obligation|permission)\(', s) and s[s.index('(') + 1:-1] not in fs)
    lines = []
    for c in concl[:14]:
        lines += RC.explain(model, apps, c, facts)
    lines = lines[:80] if is_v1() else mark(lines[:80])
    alt_txt = ''
    if alt:
        doubt, am, aa = alt
        allf = facts + [d for d in doubt if d not in facts]
        gained = sorted(concl_set(am, allf) - concl_set(model, facts))
        lost = sorted(concl_set(model, facts) - concl_set(am, allf))
        alt_lines = []
        for c in gained[:6]:
            alt_lines += mark(RC.explain(am, aa, c, allf))[:6]
        alt_txt = (f"\n四、存疑事实（复审认为案情原文依据不足，未计入上文）：{'；'.join(doubt)}\n"
                   f"   若这些事实实际成立，结论将变为——新增：\n" + ('\n'.join(alt_lines) or '   （无）')
                   + (f"\n   不再成立：{'；'.join(c.replace('defeasible(', '').rstrip(')') for c in lost[:6])}" if lost else '')
                   + "\n   请结合案情与常识判断这些存疑事实是否成立，再据以作答。")
    new = [f for f in facts if f not in base_facts]
    arts = articles()
    from civil_code import paragraphs
    extra_txt = '\n'.join(f'第{a}条：{"".join(paragraphs(a))}' for a in extra[:4]) if extra else '（无）'
    if is_v1():
        return f"""

【多智能体核对结果（事实抽取 → LegalRuleML 推理 → 信号核对 → 补充检索）】
一、抽取并核实的事实：{'；'.join(facts)}
   其中经推理信号追问、依案情原文核实补入的：{'；'.join(new) or '（无）'}
二、推理引擎据核实事实补充检索到的法条（规则可完整适用）：
{extra_txt}
三、引擎结论与推理链（Defeasible Deontic Logic；已处理原则—例外—优先关系）：
{chr(10).join(lines) or '（未推出结论）'}
使用说明：引擎结论只在上述事实成立时有效；C 阶段逐项判断时，若选项命题与引擎结论冲突，应说明所依据的法条与事实，
不要仅因题干或选项的修辞而改变结论；引擎未覆盖的问题，按给定法条自行判断。"""
    return f"""

【多智能体核对结果（事实抽取 → LegalRuleML 推理 → 信号核对 → 补充检索）】
一、抽取并核实的事实：{'；'.join(facts)}
   其中经推理信号追问、依案情原文核实补入的：{'；'.join(new) or '（无）'}
二、推理引擎据核实事实补充检索到的法条（规则可完整适用）：
{extra_txt}
三、引擎结论与推理链（Defeasible Deontic Logic；已处理原则—例外—优先关系）：
{chr(10).join(lines) or '（未推出结论）'}
{alt_txt}
使用说明：引擎结论只在上述事实成立时有效；标有〖推定规则〗的结论只是默认推定，不是确定结论；C 阶段逐项判断时，若选项命题与引擎结论冲突，应说明所依据的法条与事实，
不要仅因题干或选项的修辞而改变结论；引擎未覆盖的问题，按给定法条与法学通说自行判断（引擎未推出≠不成立）。"""


FORCE = """下面是一道选择题，以及一段对它的分析（分析可能因篇幅被截断）。请根据分析作出最终决定（多选题可选多个）。
只输出一行，格式：[正确答案]选项字母

【题目与选项】
{q}

【分析】
{raw}"""


# ───────────── ⑥' Option agent：逐选项判断引擎是否覆盖 + 生成检索关键词；⑥'' 选项级检索
OPTION = """下面是一道民法选择题的选项，以及推理引擎（依形式化规则、基于案情事实）推出的结论清单。
请逐项判断：
1. issue：该选项要判断的法律问题（一句话）；
2. covered：引擎结论是否**直接**决定该选项的法律问题（true/false）。只有引擎结论清单中有一条能直接用来判断该选项正误时才为 true；
3. engine_basis：covered 为 true 时，写出相关的那条引擎结论（原样抄写），否则留空；
4. keywords：用于在《民法典》中检索相关法条的 2–4 个法律术语（如“不当得利”“安全保障义务”“抵销”），不要写人名。

【选项】
{options}

【引擎结论清单】
{concl}

输出 JSON：{{"options": [{{"label": "A", "issue": "…", "covered": false, "engine_basis": "", "keywords": ["…"]}}, ...]}}"""

_IDX = {}


def article_search(keywords, exclude, k=2):
    import math
    from civil_code import paragraphs
    if not _IDX:
        _IDX['text'] = {n: ''.join(paragraphs(n)) for n in articles()}
    T = _IDX['text']
    scores = {}
    for kw in keywords:
        kw = kw.strip()
        if len(kw) < 2:
            continue
        hit = [n for n, s in T.items() if kw in s]
        if not hit or len(hit) > 60:          # 过于常见的词不参与
            continue
        idf = math.log(len(T) / len(hit))
        for n in hit:
            scores[n] = scores.get(n, 0) + idf * (1 + 0.5 * (T[n].count(kw) > 1))
    return [n for n, _ in sorted(scores.items(), key=lambda x: -x[1]) if n not in exclude][:k]


def parse_options(user):
    q = user.split('【问题/选项】', 1)[1].split('请按以下格式输出', 1)[0] if '【问题/选项】' in user else user
    return dict(re.findall(r'(?:^|\s)([A-E])[\.．、]\s*(.*?)(?=\s[A-E][\.．、]|$)', q, re.S))


def conclusion_list(model, apps, facts):
    fs = {RC.to_asp(f) for f in facts}
    out = []
    for s in sorted(model):
        if re.match(r'(defeasible|obligation|permission)\(', s) and s[s.index('(') + 1:-1] not in fs:
            ex = RC.explain(model, apps, s, facts)
            if ex:
                head = ex[0].strip('· ').split('（')[0]
                pred = re.match(r'(?:non\()?(\w+)', s[s.index('(') + 1:]).group(1)
                out.append(f'{mark([ex[0]])[0].strip("· ")[:120]}　〔{FR.ZH.get(pred, pred)}〕')
    return out[:30]


def option_agent(rec, model, apps, facts, R, extra, model_name, seed):
    opts = parse_options(rec['user'])
    if not opts:
        return [], [], ''
    concl = conclusion_list(model, apps, facts)
    raw = chat(OPTION.format(options='\n'.join(f'{k}. {v.strip()}' for k, v in sorted(opts.items())),
                             concl='\n'.join(concl) or '（引擎未推出结论）'), model=model_name, seed=seed, max_tokens=1200)
    try:
        items = EL.extract_json(raw).get('options', [])
    except ValueError:
        items = []
    got, lines, seen = [], [], set(R) | set(extra)
    from civil_code import paragraphs
    for it in items:
        lab = str(it.get('label', '')).strip()[:1]
        if lab not in opts:
            continue
        if it.get('covered') and str(it.get('engine_basis', '')).strip():
            lines.append(f'选项{lab}：引擎已覆盖。相关结论：{str(it.get("engine_basis"))[:120]}')
        else:
            found = article_search(it.get('keywords', []), seen) if len(got) < 6 else []
            seen |= set(found)
            got += found
            lines.append(f'选项{lab}：**超出形式化规则的覆盖范围**（{str(it.get("issue", ""))[:40]}）。引擎“未推出”不等于“不成立”，'
                         f'请依给定法条、下列补充检索的法条与法学通说独立判断。'
                         + (f'补充检索：{"、".join(f"第{n}条" for n in found)}' if found else ''))
    arts_txt = '\n'.join(f'第{n}条：{"".join(paragraphs(n))}' for n in got)
    block = '\n五、逐选项的覆盖情况（选项智能体）：\n' + '\n'.join(lines) + (f'\n选项级补充检索到的法条：\n{arts_txt}' if got else '')
    return items, got, block


def answer(rec, user, model_name, seed):
    """作答；若没有按格式给出【正确答案】（多为输出被截断），把题目与分析交给模型、只要求输出答案（兜底，两种设置同样适用）"""
    raw = chat(user, model=model_name, system=rec['system'], max_tokens=1800, seed=seed)
    pred = ''.join(sorted(DL.RC_parse(raw)))
    if not pred:
        q = user.split('【问题/选项】', 1)[1].split('请按以下格式输出', 1)[0].strip() if '【问题/选项】' in user else user[-1500:]
        forced = chat(FORCE.format(q=q, raw=raw[-2500:]), model=model_name, max_tokens=40, seed=seed)
        pred = ''.join(sorted(DL.RC_parse(forced) or set(''.join(re.findall(r'^[\s\[【]*(?:正确答案[\]】]?)?\s*([A-E](?:[、,，\s]*[A-E])*)\s*$', forced.strip()))) - set('、,， ')))
        raw += '\n【兜底追问】' + forced
    return pred, raw


def f1(p, g):
    p, g = set(p), set(g)
    if not p or not g:
        return 0.0
    tp = len(p & g)
    return 0.0 if not tp else 2 * tp / (len(p) + len(g))


def run_one(rec, model_name, seed, voc_all):
    case = rec['user'].split('【案情】', 1)[1].split('【问题/选项】', 1)[0].strip()
    R, mods = retriever(rec)
    voc = DL.vocab(mods)
    base_pred, base_raw = answer(rec, rec['user'], model_name, seed)
    try:
        facts0, bad = EL.extract(case, voc, mods, model_name, seed, with_law=True)
    except ValueError:   # JSON 截断或格式错误：回收已完整写出的事实
        prompt = EL.EXTRACT_LAW.format(vocab=EL.vocab_text(voc, mods, True), law=EL.law_text(mods), case=case)
        raw = chat(prompt, model=model_name, seed=seed, max_tokens=700)
        facts0, bad = EL.validate(re.findall(r'"(-?\w+\([^"()]*\))"', raw), voc)
    facts, model, apps, extra, trace, alt = reason_loop(case, facts0, R, mods, voc, model_name, seed)
    block = engine_block(facts, model, apps, extra, facts0, alt)
    opt_items, opt_arts, opt_block = option_agent(rec, model, apps, facts, R, extra, model_name, seed) if USE_OPTIONS else ([], [], '')
    block += opt_block
    pipe_pred, pipe_raw = answer(rec, rec['user'] + block, model_name, seed)
    gold = rec['gold']
    return dict(qid=rec['qid'], gold=gold, modules=mods, base=base_pred, pipe=pipe_pred,
                base_em=int(set(base_pred) == set(gold)), pipe_em=int(set(pipe_pred) == set(gold)),
                base_f1=f1(base_pred, gold), pipe_f1=f1(pipe_pred, gold), facts0=facts0, dropped_extract=bad, facts=facts,
                extra_articles=extra, option_items=opt_items, option_articles=opt_arts, trace=trace, engine_block=block, base_raw=base_raw[-700:], pipe_raw=pipe_raw[-900:])


def control_set(n, seed=0):
    import pandas as pd
    lego = {json.loads(l)['qid']: json.loads(l) for l in open(ARCHIVE, encoding='utf-8')}
    df = pd.read_excel(bench_xlsx())
    pool = []
    for q, r in lego.items():
        gold = {c['art'] for c in cites_of(str(df.iloc[q]['解析'])) if c['law'] == 'civil-code'} & RS.COVERED
        if gold and set(r['provided_article_nos']) & RS.COVERED and q not in EXAMPLES and q not in (517, 577, 575):
            pool.append(q)
    random.seed(seed)
    return sorted(random.sample(pool, n))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--set', choices=['examples', 'control'])
    ap.add_argument('--qids', type=int, nargs='*')
    ap.add_argument('--n', type=int, default=19)
    ap.add_argument('--model', default='qwen3.5-35b-a3b')
    ap.add_argument('--seed', type=int, default=7)
    ap.add_argument('--no-options', action='store_true', help='不启用选项智能体（覆盖标注 + 选项级检索）')
    ap.add_argument('--variant', choices=['v1', 'v2', 'v2noopt'], default='v1')
    ap.add_argument('--out', default=None)
    a = ap.parse_args()
    global USE_OPTIONS, OUT, VARIANT
    VARIANT = a.variant
    USE_OPTIONS = (a.variant == 'v2') and not a.no_options
    if a.out:
        OUT = Path(a.out)
    qids = a.qids or (EXAMPLES if a.set == 'examples' else control_set(a.n))
    lego = {json.loads(l)['qid']: json.loads(l) for l in open(ARCHIVE, encoding='utf-8')}
    voc_all = DL.vocab(list(FR.MODULES))
    res = []
    with open(OUT, 'a', encoding='utf-8') as fo:
        for q in qids:
            try:
                r = run_one(lego[q], a.model, a.seed, voc_all)
            except Exception as e:  # noqa: BLE001
                print(f'Q{q} 失败：{type(e).__name__}: {e}')
                continue
            r['set'] = a.set or 'custom'
            fo.write(json.dumps(r, ensure_ascii=False) + '\n')
            res.append(r)
            v = sum(len(t.get('verified', [])) for t in r['trace'])
            rm = sum(len(t.get('audited_removed', [])) for t in r['trace'])
            print(f"Q{q:<4} 金标 {r['gold']:<5} LEGO {r['base'] or '-':<5}{'✓' if r['base_em'] else '✗'}  流水线 {r['pipe'] or '-':<5}"
                  f"{'✓' if r['pipe_em'] else '✗'}  | 复审删除 {rm}，核实补入 {v}，引擎补检索 {r['extra_articles']}，"
                  f"未覆盖选项 {[o.get('label') for o in r['option_items'] if not o.get('covered')]} → 选项检索 {r['option_articles']}")
    if res:
        n = len(res)
        print(f"\n共 {n} 题：LEGO 原提示 EM {sum(r['base_em'] for r in res)}/{n}（F1 {sum(r['base_f1'] for r in res) / n:.3f}）；"
              f"流水线 EM {sum(r['pipe_em'] for r in res)}/{n}（F1 {sum(r['pipe_f1'] for r in res) / n:.3f}）")
        print(f"  纠正 {[r['qid'] for r in res if r['pipe_em'] and not r['base_em']]}  改错 {[r['qid'] for r in res if r['base_em'] and not r['pipe_em']]}")


if __name__ == '__main__':
    main()
