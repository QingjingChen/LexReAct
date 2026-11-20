#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
用 LLM 起草规则卡片的自然语言版本与形式化版本，并由程序逐项检查；不通过的带着错误清单退回重写。

  python src/codebook/build_review_all.py               # 先生成 graph/civil/codebook/rows.json（每行的卡片、笔记、法条）
  python src/codebook/draft_llm.py --chapter 第三编 第四章 --model qwen4-max
  python src/codebook/build_review_all.py -o review/civil_code_rule_cards.xlsx   # 把通过检查的草稿填入审核表

输入（每行）：LEGO 概念卡片（参考）、markdown 笔记原文（参考）、挂载法条原文（权威）、谓词词表、一个人工形式化的示例卡片。
检查：法条与款存在且属于本行；规则语法、变量安全；谓词与已有用法的参数个数一致、新谓词有中文释义；
      自然语言版本每一项都引用了规则、每条规则都被引用；LegalRuleML 通过 OASIS XSD；编译为 ASP 并能被推理机加载求解。
输出：graph/civil/codebook/drafts/<编>_<章>.json（每行：status、model、nl、rules、overrides、predicates、attempts、errors）。
"""
import argparse
import collections
import json
import re
import sys
import tempfile
import threading
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE), str(HERE.parent)]
import build_codebook as B  # noqa: E402
import build_review_all as BR  # noqa: E402
import civil_ch02_natural_person as M  # noqa: E402
import civil_code as CC  # noqa: E402
import formal_rules as FR  # noqa: E402
import graph2lrml as G  # noqa: E402
import llm_client as LLM  # noqa: E402
import lrml2ddl  # noqa: E402
from paths import CRIM_KB, SCHEMA  # noqa: E402

CR_ROWS = CRIM_KB / 'codebook' / 'rows.json'
import importlib.util  # noqa: E402

_spec = importlib.util.spec_from_file_location('lexreact_run_cases', HERE.parent / 'run_cases.py')   # 按路径加载，避免与 src/criminal/run_cases.py 同名
RC = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(RC)

ATOM = re.compile(r'^([-~]?)([a-z][A-Za-z0-9]*)\(\s*([A-Za-z0-9_]+(?:\s*,\s*[A-Za-z0-9_]+)*)\s*\)$')
KEY = re.compile(r'^c(\d+)(?:-[A-Za-z0-9]+)*$')
SRC = re.compile(r'^art(\d+)(?:-(\d+))?$')
FIELDS = ['issue', 'conditions', 'exceptions', 'effects', 'priority', 'distinguish']
DEON = {'OBL', 'FOR', 'PERM', 'RIGHT'}
LOCK = threading.Lock()

SYSTEM = """你是中国民法的法律知识工程师，负责把《民法典》条文形式化为可废止规则（Defeasible Deontic Logic），并写出与之逐项对应的自然语言规则卡片。
只输出一个 JSON 对象，不要输出任何解释或 Markdown。"""

SPEC = """## 任务
根据下面的材料，为本行写一张规则卡片：自然语言版本（nl）和形式化版本（rules），两者逐项对应。
材料的权威性：挂载法条原文 ＞ 笔记 ＞ LEGO 卡片。LEGO 卡片由模型生成，可能有错，只作参考；笔记是专家备考笔记，可用于理解体系和例外。

## 输出格式（JSON）
{
 "nl": {"issue": [{"text": "争点", "rules": ["c510-1"]}], "conditions": [...], "exceptions": [...], "effects": [...], "priority": [...], "distinguish": [...]},
 "rules": [{"key": "c510-1", "srcs": ["art510"], "body": ["contract(K)", "~agreedOn(K,T)", {"or": ["a(X)", "b(X) c(X)"]}],
            "heads": ["p(K)", {"type": "OBL", "bearer": "A", "counterparty": "B", "content": "perform(A,K)"}],
            "note": "一句话中文说明", "auth": "npc"}],
 "overrides": [["c511-2", "c511-1", "优先的理由"]],
 "predicates": {"newPredicate": "中文释义"}
}

## 形式化约定
1. 以法条原文为准。法条没有写明、来自学理或笔记的内容，只能写成 auth 为 "doctrine" 的规则，并在 note 中说明；司法解释写 "spc"。
2. 宣示性、原则性或纯程序性的条款不写规则，只在 nl 中写一项，"rules" 为空列表。
3. 原子写作 谓词(参数,...)：谓词为 lowerCamelCase 英文；变量以大写字母开头（P、X、K、A…），个体常量小写；人民法院用常量 court。
4. body 中："p(X)" 须成立；"-p(X)" 须证得 p 不成立；"~p(X)" 表示“除非 p”（但书、“……的除外”、“另有约定的除外”）；{"or": [...]} 为选择，分支内用空格连接表示“且”。
5. heads 中："p(X)" / "-p(X)" 为构成性结论（定义、“视为”、效力）；"应当/必须" 用 type OBL，"不得/禁止" 用 FOR，"可以" 用 PERM，"有权/享有……权利" 用 RIGHT；bearer 为承担者变量或常量，counterparty 可为 null。
6. 安全性：每个变量都必须出现在 body 中某个不带 ~ 或 - 前缀的原子里；head 与 ~ 原子中的变量也必须如此。规则体不能含有其自身结论的否定。
7. 但书、例外既可以写成 "~p(..)"，也可以写成单独的例外规则并在 overrides 中声明 [优先规则, 被排除规则, 理由]。条文之间的优先关系（特别规定、另有规定）也写入 overrides。
8. 谓词优先复用“谓词词表”中的谓词，参数个数与含义必须一致；需要新谓词时，在 predicates 中给出中文释义，且不要与词表中含义不同的谓词同名。
9. srcs 只能是本行挂载的法条：整条写 "art510"，第2款写 "art510-2"。key 写作 "c{条号}-{后缀}"，在本行内唯一，例如 "c510-1"、"c511-price"。
10. nl 的每一项都要在 rules 中标出形式化它的规则 key（宣示性说明可为空）；每条规则至少被 nl 的一项引用。nl 的文字应概括法条与笔记，准确、简洁。
"""


def to_json_rule(r):
    body = [b if isinstance(b, str) else {'or': b[1]} for b in r['body']]
    heads = [h if isinstance(h, str) else {'type': h[0], 'bearer': h[1], 'counterparty': h[2], 'content': h[3]} for h in r['heads']]
    return dict(key=r['key'], srcs=r['srcs'], body=body, heads=heads, note=r['note'], auth=r['auth'])


def example():
    c = next(c for c in M.CARDS if c['id'] == 'np-16')
    ks = []
    for f in ('issue', 'conditions', 'exceptions', 'effects', 'priority'):
        for _, refs in c['nl'][f]:
            ks += [k for k in refs if k not in ks]
    rules = {r['key']: r for r in M.RULES}
    out = dict(nl={f: [dict(text=t, rules=refs) for t, refs in c['nl'][f]] for f in FIELDS},
               rules=[to_json_rule(rules[k]) for k in ks if k in rules],
               overrides=[[o, u, w] for o, u, w in M.OVERRIDES if o in ks and u in ks][:2], predicates={})
    arts = sorted({B.art_of(s) for k in ks if k in rules for s in rules[k]['srcs']})
    return arts, json.dumps(out, ensure_ascii=False, indent=1)


# ───────────────────────── 词表
def vocabulary(extra_rules=()):
    arity = {}
    base = DOM['base_rules'] if DOM else [r for _, rs in FR.MODULES.values() for r in rs] + list(M.RULES)
    for r in list(base) + list(extra_rules):
        for x in list(r['body']) + list(r['heads']):
            for t in atoms_of(x):
                m = ATOM.match(t.strip())
                if m:
                    arity.setdefault(m.group(2), len(m.group(3).split(',')))
    return arity


def atoms_of(x):
    if isinstance(x, str):
        return x.split()
    if isinstance(x, tuple) and x[0] == 'or':
        return [t for y in x[1] for t in y.split()]
    if isinstance(x, tuple):
        return [x[3]]
    if isinstance(x, dict) and 'or' in x:
        return [t for y in x['or'] for t in y.split()]
    if isinstance(x, dict):
        return [x.get('content', '')]
    return []


# ───────────────────────── 检查
def check(d, row, arity, gloss, taken):
    errs = []
    if not isinstance(d, dict) or 'rules' not in d or 'nl' not in d:
        return ['输出必须是含 nl 与 rules 的 JSON 对象']
    arts = set(row['articles'])
    preds = d.get('predicates') or {}
    keys = []
    local_arity = dict(arity)
    for r in d['rules']:
        k = r.get('key', '')
        key_re = DOM['key_re'] if DOM else KEY
        m = key_re.match(k)
        if not m:
            errs.append(f'规则 key “{k}” 格式不对（民法 c{{条号}}-{{后缀}}；刑法 k{{条号}}-{{后缀}}，“之一”写作 z1）')
        elif (DOM['key_art'](m) if DOM else int(m.group(1))) not in arts:
            errs.append(f'规则 {k} 的条号不属于本行挂载的法条 {sorted(arts)}')
        if k in keys:
            errs.append(f'规则 key {k} 重复')
        if k in taken:
            errs.append(f'规则 key {k} 已被其他规则使用，请换一个后缀')
        keys.append(k)
        if not r.get('srcs'):
            errs.append(f'{k}：srcs 不能为空')
        for s in r.get('srcs', []):
            m = (DOM['src_re'] if DOM else SRC).match(s)
            if not m or (DOM['src_art'](m) if DOM else int(m.group(1))) not in arts:
                errs.append(f'{k}：srcs “{s}” 不是本行挂载的法条（{sorted(arts)}）')
                continue
            try:
                (DOM['text_of'] if DOM else CC.text_of)(s)
            except Exception:  # noqa: BLE001
                errs.append(f'{k}：法典中没有 {s}（条或款号超出范围）')
        if r.get('auth') not in ('npc', 'doctrine', 'spc'):
            errs.append(f'{k}：auth 只能是 npc、doctrine 或 spc')
        if not r.get('note'):
            errs.append(f'{k}：缺少 note')
        pos_vars, all_vars = set(), set()
        heads = r.get('heads') or []
        if not heads:
            errs.append(f'{k}：heads 不能为空')
        elif DOM.get('name') == 'criminal' and 0 < sum(isinstance(h, dict) for h in heads) < len(heads):
            errs.append(f'{k}：同一条规则不能同时有规范性结论和构成性结论，请拆成两条')
        for part, items in (('body', r.get('body') or []), ('heads', heads)):
            for it in items:
                if isinstance(it, dict) and part == 'heads':
                    if it.get('type') not in DEON:
                        errs.append(f'{k}：规范性结论的 type 只能是 OBL/FOR/PERM/RIGHT')
                    for v in (it.get('bearer'), it.get('counterparty')):
                        if v and not re.fullmatch(r'[A-Za-z][A-Za-z0-9]*', v):
                            errs.append(f'{k}：bearer/counterparty “{v}” 不合法')
                        elif v and v[0].isupper():
                            all_vars.add(v)
                if isinstance(it, dict) and part == 'body' and 'or' not in it:
                    errs.append(f'{k}：body 中的对象只能是 {{"or": [...]}}')
                for t in atoms_of(it):
                    mm = ATOM.match(t.strip())
                    if not mm:
                        errs.append(f'{k}：原子 “{t}” 语法不合法（应为 谓词(参数,...)，谓词小写开头）')
                        continue
                    sign, p, args = mm.group(1), mm.group(2), [x.strip() for x in mm.group(3).split(',')]
                    if part == 'heads' and sign == '~':
                        errs.append(f'{k}：结论中不能用 ~')
                    n = len(args)
                    if p in local_arity and local_arity[p] != n:
                        errs.append(f'{k}：谓词 {p} 已有用法为 {local_arity[p]} 个参数，这里用了 {n} 个')
                    local_arity.setdefault(p, n)
                    if p not in gloss and p not in preds:
                        errs.append(f'{k}：新谓词 {p} 需要在 predicates 中给出中文释义')
                    vs = {x for x in args if x[0].isupper()}
                    all_vars |= vs
                    in_or = isinstance(it, dict)
                    if part == 'body' and sign == '' and not in_or:
                        pos_vars |= vs
        # 选择支中的变量：每个分支都出现的才算约束
        for it in r.get('body') or []:
            if isinstance(it, dict) and 'or' in it:
                branch_vars = []
                for br in it['or']:
                    bv = set()
                    for t in br.split():
                        mm = ATOM.match(t.strip())
                        if mm and mm.group(1) == '':
                            bv |= {x.strip() for x in mm.group(3).split(',') if x.strip()[0].isupper()}
                    branch_vars.append(bv)
                if branch_vars:
                    pos_vars |= set.intersection(*branch_vars)
        free = all_vars - pos_vars
        if free:
            errs.append(f'{k}：变量 {sorted(free)} 没有出现在 body 的正面原子中（不安全）')
    refs = collections.Counter()
    for f in FIELDS:
        for it in (d['nl'].get(f) or []):
            if not isinstance(it, dict) or not it.get('text'):
                errs.append(f'nl.{f} 的每一项须为 {{"text":…, "rules":[…]}}')
                continue
            for k in it.get('rules', []):
                if k not in keys:
                    errs.append(f'nl.{f}“{it["text"][:16]}”引用了不存在的规则 {k}')
                refs[k] += 1
    if not any(d['nl'].get(f) for f in FIELDS):
        errs.append('nl 不能为空')
    for k in keys:
        if not refs[k]:
            errs.append(f'规则 {k} 没有被 nl 的任何一项引用')
    for o in d.get('overrides') or []:
        if not (isinstance(o, list) and len(o) == 3):
            errs.append('overrides 每项须为 [优先规则, 被排除规则, 理由]')
        elif o[0] not in keys and o[0] not in taken or o[1] not in keys and o[1] not in taken:
            errs.append(f'优先关系 {o[0]} > {o[1]} 引用了不存在的规则')
    for p, z in preds.items():
        if p in gloss and gloss[p] != z:
            errs.append(f'谓词 {p} 已在词表中表示“{gloss[p]}”，不能重新定义为“{z}”，请换名或沿用原义')
    if errs:
        return errs
    return compile_check(d)


def compile_check(d):
    rules = [BR.draft_rule(r) for r in d['rules']]
    keys = {r['key'] for r in rules}
    head = ('<?xml version="1.0" encoding="UTF-8"?>\n<lrml:LegalRuleML xmlns:lrml="http://docs.oasis-open.org/legalruleml/ns/v1.0/" '
            'xmlns:ruleml="http://ruleml.org/spec" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '
            'xmlns:lrmlv="http://docs.oasis-open.org/legalruleml/ns/v1.0/metamodel#">\n  <lrml:Prefix key="cnv" refID="http://example.org/lexgo/civil-vocab#"/>\n')
    rx = DOM['rule_xml'] if DOM else G.rule_xml
    body = '  <lrml:Statements key="draft">\n' + '\n'.join(rx(r, '    ') for r in rules) + '\n  </lrml:Statements>\n'
    ovs = [o for o in d.get('overrides') or [] if o[0] in keys and o[1] in keys]
    if ovs:
        body += '  <lrml:Statements key="priorities">\n' + '\n'.join(
            f'    <lrml:OverrideStatement key="ov-{o}--{u}"><lrml:Override over="#{o}" under="#{u}"/></lrml:OverrideStatement>' for o, u, _ in ovs) + '\n  </lrml:Statements>\n'
    xml = head + body + '</lrml:LegalRuleML>\n'
    from lxml import etree
    with tempfile.TemporaryDirectory() as td:
        p = Path(td) / 'd.lrml'
        p.write_text(xml, encoding='utf-8')
        try:
            schema = etree.XMLSchema(etree.parse(str(SCHEMA)))
            if not schema.validate(etree.parse(str(p))):
                return [f'LegalRuleML 未通过 XSD：{e.message[:160]}' for e in list(schema.error_log)[:3]]
            rs, ov = lrml2ddl.load(p, taxonomy=False)
            lp = Path(td) / 'd.lp'
            lp.write_text(lrml2ddl.translate(rs, ov), encoding='utf-8')
        except (AssertionError, ValueError) as e:
            return [f'编译为 ASP 失败：{e}']
        except Exception as e:  # noqa: BLE001
            return [f'LegalRuleML 生成失败：{type(e).__name__}: {e}']
        try:
            RC.solve([], lp)
        except Exception as e:  # noqa: BLE001
            return [f'推理机加载失败：{str(e)[:200]}']
    return []


# ───────────────────────── 起草
def prompt_for(row, vocab_text, ex_arts, ex_json):
    lego = '\n\n'.join(f'{k} {c["title"]}\n' + '\n'.join(f'{f}: ' + '；'.join(c.get(f, [])) for f in
                                                         ('issue_frames', 'positive_conditions', 'negative_conditions', 'legal_effects', 'priority_or_exception', 'distinguish_from') if c.get(f))
                       for k, c in row['lego'].items()) or '（本行没有 LEGO 卡片）'
    arts = '\n'.join(DOM['art_text'](x) for x in row['articles'])
    ex_text = '\n'.join(DOM['art_text'](x) for x in ex_arts)
    return f"""{SPEC}{DOM['note']}
## 示例（已经人工形式化的条文）
法条：
{ex_text}
输出：
{ex_json}

## 谓词词表（谓词/参数个数：中文释义）
{vocab_text}

## 本行材料
### 挂载法条原文（权威；srcs 只能取这些条款）
{arts}

### 笔记（markdown 原文）
{row['markdown'][:4000]}

### LEGO 概念卡片（参考）
{lego}
"""


def bigrams(t):
    t = re.sub(r'[^\u4e00-\u9fff]', '', t)
    return {t[i:i + 2] for i in range(len(t) - 1)}


def row_vocab(row, arity, gloss, core, local, k=120):
    """只给本行相关的谓词：手写词表（core）、本章已起草的谓词（local），再加与本行法条原文最相近的 k 个，避免词表随全书增长而撑大每次请求"""
    keep = {p for p in arity if p in core or p in local}
    bg = bigrams(''.join(DOM['art_text'](x) for x in row['articles']))
    scored = sorted(((len(bg & bigrams(gloss.get(p, ''))), p) for p in arity if p not in keep and p in gloss), reverse=True)
    keep |= {p for sc, p in scored[:k] if sc > 0}
    return '\n'.join(f'{p}/{n}：{gloss.get(p, "")}' for p, n in sorted(arity.items()) if p in keep and p in gloss)


def draft_row(row, model, arity, gloss, vocab_text, ex, taken, attempts=3):
    if callable(vocab_text):
        vocab_text = vocab_text(row)
    base = prompt_for(row, vocab_text, *ex)
    p, errs, d, raw = base, [], None, ''
    tag = f'draft:{"|".join(row["chapter"])}'
    for i in range(1, attempts + 1):
        try:
            raw = LLM.chat(p, model=model, system=SYSTEM, max_tokens=16000, temperature=0.0, seed=None, tag=tag)
        except RuntimeError as e:                      # 网关或额度问题：不计为起草失败，下次运行会重试
            return dict(status='error', model=model, attempts=i, errors=[str(e)[:300]])
        try:
            d = LLM.extract_json(raw)
            errs = check(d, row, arity, gloss, taken)
        except Exception as e:  # noqa: BLE001
            errs = [f'输出无法解析为 JSON：{str(e)[:160]}']
        if not errs:
            return dict(status='ok', model=model, attempts=i, errors=[], **{k: d.get(k) or ({} if k in ('nl', 'predicates') else [])
                                                                           for k in ('nl', 'rules', 'overrides', 'predicates')})
        p = base + f'\n\n## 你上一次的输出\n{raw[:12000]}\n\n## 程序检查发现的问题（请全部修正后重新输出完整 JSON）\n' + '\n'.join(f'- {e}' for e in errs[:30])
    return dict(status='failed', model=model, attempts=attempts, errors=errs, last=raw[:20000])


STOP = threading.Event()
TRIM = True        # 词表只给本行相关的谓词（见 row_vocab）
DOM = {}


def civil_domain():
    E = B.setup_gloss(M)
    return dict(name='civil', rows=BR.ROWS, drafts=BR.DRAFTS, gloss=dict(E.GLOSS), rule_xml=G.rule_xml,
                base_rules=[r for _, rs in FR.MODULES.values() for r in rs] + list(M.RULES),
                key_re=re.compile(r'^c(\d+)(?:-[A-Za-z0-9]+)*$'), key_art=lambda m: int(m.group(1)),
                src_re=re.compile(r'^art(\d+)(?:-(\d+))?$'), src_art=lambda m: int(m.group(1)), text_of=CC.text_of,
                art_text=lambda x: f'【第{x}条】' + ' ‖ '.join(f'（第{i}款）{p}' for i, p in enumerate(CC.paragraphs(x), 1)),
                example=example, note='')


def criminal_domain():
    sys.path.insert(0, str(HERE.parent / 'criminal'))
    import crim_rules as CR
    import criminal_code as K
    import crim2lrml
    import expert_review as ER
    gloss = dict(CR.ZH)
    consts = {**CR.CHARGE_ZH, **ER.CRIM_CONST}

    def art_text(x):
        a = K.articles()[x]
        return f'【{a["label"]}】' + ' ‖ '.join(f'（第{i}款）{p}' for i, p in enumerate(a['paras'], 1))

    def ex():
        rs = [r for r in CR.MODULES['k-justification'][1] if any(s.startswith('art20') for s in r['srcs'])]
        ks = [r['key'] for r in rs]
        nl = {f: [] for f in FIELDS}
        for r in rs:
            nl['effects' if not any(isinstance(b, str) and b.startswith('~') for b in r['body']) else 'exceptions'].append(dict(text=r['note'], rules=[r['key']]))
        out = dict(nl=nl, rules=[to_json_rule(r) for r in rs], overrides=[[o, u, w] for o, u, w in CR.OVERRIDES if o in ks and u in ks], predicates={})
        return ['20'], json.dumps(out, ensure_ascii=False, indent=1)
    note = ('\n## 刑法的特别约定\n'
            '- srcs 写法：整条 "art264"，第2款 "art264#2"，第一百二十条之一 "art120-1"，其第2款 "art120-1#2"。\n'
            '- key 写法："k{条号}-{后缀}"，条号中的“之一”写作 z1，例如 "k264-basic"、"k120z1-a"。\n'
            '- 建模约定：人 P、犯罪事件 X、罪名 C。constitutes(P,X,C) 符合罪名 C 的构成要件；responsible(P,X,C) 负刑事责任；convicted(P,X,C) 定罪。'
            '量刑写作 {"type":"OBL"|"PERM"|"FOR","bearer":"court","counterparty":null,"content":"sentence(P,X,方式)"}。'
            '罪名用小写英文常量（已有：' + '、'.join(f'{k}={v}' for k, v in CR.CHARGE_ZH.items()) + '），新罪名自拟常量；'
            '量刑方式常量：' + '、'.join(f'{k}={v}' for k, v in ER.CRIM_CONST.items() if k not in ('court',)) + '。\n'
            '- 同一条规则的结论不能既有规范性结论又有构成性结论，需要时拆成两条规则。\n')
    return dict(name='criminal', rows=CR_ROWS, drafts=CR_ROWS.parent / 'drafts', gloss=gloss, rule_xml=crim2lrml.rule_xml,
                base_rules=[r for _, rs in CR.MODULES.values() for r in rs], consts=consts,
                key_re=re.compile(r'^k(\d+)(?:z(\d))?(?:-[A-Za-z0-9]+)*$'),
                key_art=lambda m: m.group(1) + (f'-{m.group(2)}' if m.group(2) else ''),
                src_re=re.compile(r'^art(\d+(?:-\d)?)(?:#(\d+))?$'), src_art=lambda m: m.group(1), text_of=K.text_of,
                art_text=art_text, example=ex, note=note)


def load_drafts(d=None):
    out = {}
    d = d or DOM['drafts']
    for f in sorted(d.glob('*.json')) if d.exists() else []:
        for rid, x in json.load(open(f, encoding='utf-8')).items():
            if x.get('status') == 'ok':
                out[rid] = x
    return out


def run_chapter(sel, model, workers, redo):
    ch = sel[0]['chapter']
    out = DOM['drafts'] / f'{re.sub(r"[　 ]+", "", ch[0])}_{re.sub(r"[　 ]+", "", ch[1])}.json'
    DOM['drafts'].mkdir(parents=True, exist_ok=True)
    done = json.load(open(out, encoding='utf-8')) if out.exists() else {}
    todo = [r for r in sel if redo or done.get(r['id'], {}).get('status') != 'ok']
    if not todo:
        return
    gloss = dict(DOM['gloss'])
    prior = load_drafts()                             # 前面各章已通过的草稿：谓词与 key 都进入词表，保持全书一致
    for d in prior.values():
        gloss.update(d.get('predicates', {}))
    arity = vocabulary([BR.draft_rule(r) for d in prior.values() for r in d['rules']])
    core = set(DOM['gloss'])
    local = {p for x in done.values() if x.get('status') == 'ok' for p in (x.get('predicates') or {})}
    vocab_text = (lambda row: row_vocab(row, arity, gloss, core, local)) if TRIM else \
        '\n'.join(f'{p}/{n}：{gloss.get(p, "")}' for p, n in sorted(arity.items()) if p in gloss)
    todo_ids = {x['id'] for x in todo}
    taken = {r['key'] for r in DOM['base_rules']} | {r['key'] for rid, d in prior.items() if rid not in todo_ids for r in d['rules']}
    ex = DOM['example']()
    print(f'{"／".join(ch)}：{len(sel)} 行，本次起草 {len(todo)} 行；模型 {model}', file=sys.stderr, flush=True)
    errors_in_row = [0]

    def work(row):
        if STOP.is_set():
            return None
        res = draft_row(row, model, arity, gloss, vocab_text, ex, taken)
        with LOCK:
            done[row['id']] = res
            out.write_text(json.dumps(done, ensure_ascii=False, indent=1), encoding='utf-8')
            print(f'  {row["id"]:12s} 第{(row["articles"] or ["—"])[0]}条等 {len(row["articles"])} 条 → {res["status"]}（第 {res["attempts"]} 次）'
                  + ('' if res['status'] == 'ok' else f'：{res["errors"][:2]}'), file=sys.stderr, flush=True)
            errors_in_row[0] = errors_in_row[0] + 1 if res['status'] == 'error' else 0
            if errors_in_row[0] >= 5:
                print('连续 5 行调用失败（可能是额度用完或网关异常），停止。已完成的结果已保存，修复后重跑即可续上。', file=sys.stderr, flush=True)
                STOP.set()
        return res
    with ThreadPoolExecutor(workers) as ex_:
        list(ex_.map(work, todo))
    ok = sum(r['status'] == 'ok' for r in done.values())
    nrules = sum(len(r.get('rules') or []) for r in done.values() if r['status'] == 'ok')
    print(f'  → 通过 {ok}/{len(sel)} 行，规则 {nrules} 条；{out.name}', file=sys.stderr, flush=True)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--law', choices=['civil', 'criminal'], default='civil')
    ap.add_argument('--chapter', nargs='+', help='编、章，例如：第三编 第四章')
    ap.add_argument('--all', action='store_true', help='按法典顺序起草全部章')
    ap.add_argument('--model', default=LLM.MODEL)
    ap.add_argument('--workers', type=int, default=4)
    ap.add_argument('--redo', action='store_true', help='重新起草已通过的行')
    ap.add_argument('--version', help='另起一版（如用另一个模型），草稿存入 drafts/<version>/，词表只在本版内累积')
    ap.add_argument('--skip', nargs='+', help='跳过这些版本（drafts/<名>/）已通过的行')
    a = ap.parse_args()
    DOM.update(civil_domain() if a.law == 'civil' else criminal_domain())
    skip = set()
    for v in a.skip or []:                       # 其他版本已通过的行不再起草（如 claude-agent 版）
        skip |= set(load_drafts(DOM['drafts'] / v))
    if a.version:
        DOM['drafts'] = DOM['drafts'] / a.version
    rows = [r for r in json.load(open(DOM['rows'], encoding='utf-8')) if not r['rules'] and r['articles']]   # 未挂载法条的卡片无从起草
    rows = [r for r in rows if r['id'] not in skip]
    akey = (lambda x: x) if a.law == 'civil' else (lambda x: tuple(int(t) for t in x.split('-')))
    if a.all:
        groups = collections.OrderedDict()
        for r in rows:
            groups.setdefault(tuple(r['chapter']), []).append(r)
        first = lambda ch: min((akey(x) for r in groups[ch] for x in r['articles']), default=akey('9999') if a.law == 'criminal' else 9999)  # noqa: E731
        order = sorted(groups, key=first)
        for ch in order:
            if STOP.is_set():
                break
            run_chapter(groups[ch], a.model, a.workers, a.redo)
    else:
        sel = [r for r in rows if all(any(c in x for x in r['chapter']) for c in a.chapter or [])]
        if not sel:
            sys.exit('没有匹配的行（或都已有规则）')
        run_chapter(sel, a.model, a.workers, a.redo)
    allres = [d for f in DOM['drafts'].glob('*.json') for d in json.load(open(f, encoding='utf-8')).values()]
    c = collections.Counter(d['status'] for d in allres)
    print(f'全部草稿：通过 {c["ok"]}，未通过 {c["failed"]}，调用出错 {c["error"]}；规则 {sum(len(d.get("rules") or []) for d in allres if d["status"] == "ok")} 条')
    print('token 用量：' + json.dumps({k: v for k, v in LLM.usage_summary().items() if k == a.model}, ensure_ascii=False))


if __name__ == '__main__':
    main()
