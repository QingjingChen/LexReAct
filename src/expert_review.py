#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
生成规则的专家审核工作簿：法条原文 ↔ 专家知识图谱 ↔ 形式化规则 三方对照（民法、刑法各一份）。

规则由程序译成中文命题（不经 LLM），法条原文从 data/civil/civil_code_20200528.txt 逐款截取，
图谱原文与路径来自 graph/civil/graph_nodes.json，案例推理链由 run_cases.py 实际运行得到。

  python src/expert_review.py civil -o review/civil_review.xlsx --court-check court.html   # 附与最高法网页的逐条比对
  python src/expert_review.py criminal -o review/criminal_review.xlsx

工作表：审核总览 / 规则审核 / 优先关系审核 / 案例审核 / 例外候选审核 / 覆盖检查 / 法源
"""
import argparse
import collections
import datetime
import json
import math
import re
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(HERE / 'criminal'))
import paths as PATHS  # noqa: E402
import civil_code as CC  # noqa: E402
import formal_rules as FR  # noqa: E402  （main() 中按法域替换）

from openpyxl import Workbook  # noqa: E402
from openpyxl.formatting.rule import CellIsRule  # noqa: E402
from openpyxl.styles import Alignment, Border, Font, PatternFill, Side  # noqa: E402
from openpyxl.utils import get_column_letter  # noqa: E402
from openpyxl.worksheet.datavalidation import DataValidation  # noqa: E402

REPO = 'https://github.com/QingjingChen/LexReAct/blob/main/'
COURT_URL = 'https://www.court.gov.cn/zixun/xiangqing/233181.html'

# formal_rules.ZH 未收录的谓词（仅用于审核表的中文译述）
ZH_EXTRA = {
    'incapableClaimantWithoutAgent': '无/限制民事行为能力人没有法定代理人（或代理人死亡、丧失能力、丧失代理权）',
    'heirOrAdministratorUndetermined': '继承开始后未确定继承人或遗产管理人', 'claimantControlledByObligor': '权利人被义务人或其他人控制',
    'otherObstacle': '其他导致权利人不能行使请求权的障碍', 'equivalentProceeding': '与提起诉讼或申请仲裁具有同等效力的其他情形',
    'statutorilyExempt': '依法不适用诉讼时效的其他请求权', 'mortgageBannedByLaw': '法律、行政法规规定不得抵押的其他财产',
    'agreedDeterminationPeriodExpired': '约定的债权确定期间届满', 'noAgreedPeriod': '没有约定或约定不明确债权确定期间',
    'twoYearsSinceEstablished': '自最高额抵押权设立之日起满二年', 'determinationRequested': '抵押权人或抵押人请求确定债权',
    'noNewClaimPossible': '新的债权不可能发生', 'mortgageeKnowsSeizure': '抵押权人知道或应当知道抵押财产被查封、扣押',
    'debtorOrMortgagorBankruptOrDissolved': '债务人、抵押人被宣告破产或解散', 'sameCollateralSecurity': '同一动产上已设立的抵押权或质权',
    'lienRanksFirst': '留置权人优先受偿', 'easementHolder': '是地役权人', 'contractProvidesOtherwise': '合同另有约定',
    'dominantLandRightMortgageRealized': '需役地上的用益物权被抵押且实现抵押权', 'businessSeverelyDeteriorated': '经营状况严重恶化',
    'assetsTransferredToEvadeDebt': '转移财产、抽逃资金以逃避债务', 'lostCommercialCredibility': '丧失商业信誉',
    'mayLoseAbilityToPerform': '有丧失或可能丧失履行债务能力的其他情形', 'notifyCounterparty': '及时通知对方',
    'liquidatedDamages': '约定了违约金', 'excessivelyHigherThanLoss': '违约金过分高于造成的损失', 'partyRequestsAdjustment': '当事人请求调整',
    'courtMayReduceLD': '法院或仲裁机构可以适当减少违约金', 'lowerThanLoss': '违约金低于造成的损失',
    'courtMayIncreaseLD': '法院或仲裁机构可以增加违约金', 'liquidatedDamagesForDelay': '就迟延履行约定违约金', 'breachingParty': '是违约方',
    'paidLD': '已支付违约金', 'stillPerform': '仍应履行债务', 'depositAgreed': '约定了定金',
    'exceeds20PercentOfSubject': '定金超过主合同标的额的百分之二十', 'depositPayer': '是给付定金的一方', 'depositReceiver': '是收受定金的一方',
    'nonBreachingParty': '是守约方', 'nonAssignableByNature': '根据债权性质不得转让', 'nonAssignableByLaw': '依照法律规定不得转让',
    'agreedNonAssignable': '按照当事人约定不得转让', 'monetaryClaim': '金钱债权', 'accessoryRightOf': '是该债权的从权利',
    'personalToCreditor': '专属于债权人自身', 'demandedConsent': '已催告债权人同意', 'creditorSilent': '债权人未作表示',
    'buyerCausedDeliveryDelay': '因买受人原因未按约定期限交付', 'carriageToBuyerDesignatedPlace': '约定运送至买受人指定地点',
    'handedToCarrier': '已交付承运人', 'noAgreedDeliveryPlace': '没有约定交付地点或约定不明确', 'needsCarriage': '标的物需要运输',
    'handedToFirstCarrier': '已交付给第一承运人', 'placedAtDeliveryPoint': '出卖人已将标的物置于交付地点',
    'buyerFailedToCollect': '买受人违反约定没有收取', 'qualityDefectFrustratesPurpose': '标的物质量不符合要求致使不能实现合同目的',
    'buyerRejectsGoods': '买受人拒绝接受标的物', 'buyerTerminates': '买受人解除合同', 'riskAgreedOnSeller': '约定风险由出卖人承担',
    'tenantPossessesUnderLease': '承租人按照租赁合同占有租赁物', 'ownershipChanged': '租赁物所有权发生变动', 'houseLease': '房屋租赁',
    'tenantOf': '是承租人', 'landlordSells': '出租人出卖租赁房屋', 'coOwnerExercisesPreemption': '房屋按份共有人行使优先购买权',
    'saleToCloseRelative': '出卖给近亲属', 'landlordOf': '是出租人', 'tenantNotifiedOfSale': '承租人已收到出卖通知',
    'noAnswerWithin15Days': '十五日内未明确表示购买', 'acquiredDuringMarriage': '婚姻关系存续期间所得',
    'wagesOrRemuneration': '工资、奖金、劳务报酬', 'businessOrInvestmentIncome': '生产、经营、投资的收益', 'ipIncome': '知识产权的收益',
    'inheritedOrGifted': '继承或受赠的财产', 'otherCommonProperty': '其他应当归共同所有的财产', 'premaritalProperty': '一方的婚前财产',
    'personalInjuryCompensation': '一方因受到人身损害获得的赔偿或补偿', 'designatedSolelyToOneSpouse': '遗嘱或赠与合同中确定只归一方的财产',
    'personalUseItem': '一方专用的生活用品', 'otherSeparateProperty': '其他应当归一方的财产', 'debtOf': '债务（负债人）',
    'bothSigned': '夫妻双方共同签名', 'spouseRatified': '夫妻一方事后追认', 'incurredDuringMarriage': '婚姻关系存续期间所负',
    'inOwnName': '以个人名义', 'forDailyHouseholdNeeds': '为家庭日常生活需要', 'exceedsDailyNeeds': '超出家庭日常生活需要',
    'creditorProvesCommonUse': '债权人能够证明用于夫妻共同生活、共同生产经营或基于共同意思表示', 'estateOf': '是被继承人的遗产',
    'supportAgreementCovers': '遗赠扶养协议处分了该遗产', 'biologicalChild': '是婚生或非婚生子女', 'adoptedChild': '是养子女',
    'stepchildWithSupport': '是有扶养关系的继子女', 'childOf': '是子女', 'biologicalParent': '是生父母', 'adoptiveParent': '是养父母',
    'stepparentWithSupport': '是有扶养关系的继父母', 'parentOf': '是父母', 'spouseOf': '是配偶', 'widowedInLaw': '是丧偶儿媳或丧偶女婿',
    'mainSupportDutyFulfilled': '对公婆或岳父母尽了主要赡养义务', 'siblingOf': '是兄弟姐妹', 'grandparentOf': '是祖父母、外祖父母',
    'heirCandidate': '是继承人', 'killedDeceased': '故意杀害被继承人', 'killedCoHeirForEstate': '为争夺遗产杀害其他继承人',
    'abandonedOrSeriouslyAbused': '遗弃被继承人或虐待被继承人情节严重', 'forgedOrDestroyedWillSeriously': '伪造、篡改、隐匿或销毁遗嘱，情节严重',
    'coercedWillSeriously': '以欺诈、胁迫手段迫使或妨碍被继承人设立、变更或撤回遗嘱，情节严重', 'repented': '确有悔改表现',
    'forgivenByDeceased': '被继承人表示宽恕', 'namedInLaterWill': '被继承人事后在遗嘱中将其列为继承人', 'predeceased': '先于被继承人死亡',
    'renounced': '放弃继承', 'firstOrderInherits': '由第一顺序继承人继承', 'lineaDescendant': '是直系晚辈血亲', 'willOf': '是其所立遗嘱',
    'willByFraud': '受欺诈所立的遗嘱', 'willByDuress': '受胁迫所立的遗嘱', 'forgedWill': '伪造的遗嘱', 'conflictingWills': '数份遗嘱内容相抵触',
    'madeLater': '设立在后', 'contraryActAfterWill': '立遗嘱后实施与遗嘱内容相反的民事法律行为', 'willCoversEstate': '遗嘱处分了该遗产',
    'paidFromWardsProperty': '从被监护人本人财产中支付赔偿费用', 'guardianPaysShortfall': '不足部分由监护人赔偿',
    'defectCausedByProducer': '产品缺陷由生产者造成', 'defectCausedBySellerFault': '因销售者的过错使产品存在缺陷',
    'tortfeasorIdentified': '已查明具体侵权人',
}
GLOSS = {**FR.ZH, **ZH_EXTRA}
CONST = {}  # 个体常量的中文（刑法：罪名、量刑方式、时效档次）

CRIM_CONST = {
    'lighter': '从轻', 'lighterOrReduced': '从轻或减轻', 'lighterReducedOrExempt': '从轻、减轻或免除', 'reducedOrExempt': '减轻或免除',
    'reduced': '减轻', 'exempt': '免除', 'heavier': '从重', 'parole': '假释', 'probation': '缓刑', 'court': '人民法院',
    'under5': '不满五年有期徒刑', 'from5to10': '五年以上不满十年有期徒刑', 'from10': '十年以上有期徒刑', 'lifeOrDeath': '无期徒刑、死刑',
    'y5': '五年', 'y10': '十年', 'y15': '十五年', 'y20': '二十年',
}

AUTH = {'npc': '条文明文', 'doctrine': '学理归纳', 'spc': '司法解释'}
VERDICTS = ['确认', '小改后确认', '需重大修改', '删除', '有争议', '移出主实验', '无法判断']
EXC_VERDICTS = ['已覆盖', '非规范例外', '需补充规则', '有争议', '无法判断']
COV_VERDICTS = ['无需形式化', '已间接覆盖', '需补充规则', '有争议', '无法判断']

# ───────────────────────── 规则 → 中文命题


def split_atom(a):
    m = re.fullmatch(r'([-~]?)(\w+)\((.*)\)', a.strip())
    return m.group(1), m.group(2), [x.strip() for x in m.group(3).split(',')]


def atom_zh(a):
    sign, p, args = split_atom(a)
    s = f'{GLOSS.get(p, p)}（{"，".join(CONST.get(x, x) for x in args)}）'
    return {'': s, '-': f'并非{s}〔须证得〕', '~': s}[sign]


def conj_zh(s):
    return ' 且 '.join(atom_zh(t) for t in s.split())


def head_zh(h):
    if isinstance(h, tuple):
        kind, bearer, cp, q = h
        bearer = CONST.get(bearer, bearer)
        to = f'（对 {cp}）' if cp else ''
        return {'OBL': f'【义务】{bearer}{to} 应当：', 'FOR': f'【禁止】{bearer}{to} 不得：',
                'PERM': f'【许可】{bearer}{to} 可以：', 'RIGHT': f'【权利】{bearer}{to} 享有：'}[kind] + atom_zh(q)
    return atom_zh(h)


def body_parts(body):
    """→ (前提列表, 除非列表, 标记集合)"""
    pre, unless, flags = [], [], set()
    for b in body:
        if isinstance(b, tuple) and b[0] == 'or':
            flags.add('Or')
            pre.append('下列之一〔' + '；'.join(f'{"①②③④⑤⑥⑦⑧⑨⑩"[i]} {conj_zh(x)}' for i, x in enumerate(b[1])) + '〕')
            if any(t.startswith('-') for x in b[1] for t in x.split()):
                flags.add('Neg')
        elif b.startswith('~'):
            flags.add('Naf')
            unless.append(atom_zh(b))
        else:
            if b.startswith('-'):
                flags.add('Neg')
            pre.append(atom_zh(b))
    return pre, unless, flags


def rule_formal(r):
    def f(x):
        if isinstance(x, tuple):
            return ('(' + ' ∨ '.join(x[1]) + ')') if x[0] == 'or' else f'{x[0]}[{x[1]}{"→" + x[2] if x[2] else ""}]({x[3]})'
        return x
    return f'{", ".join(f(b) for b in r["body"])}  ⇒  {"; ".join(f(h) for h in r["heads"])}'


def rule_sentence(r):
    pre, unless, _ = body_parts(r['body'])
    s = '如果 ' + '，且 '.join(pre) if pre else '（无前提）'
    if unless:
        s += '；\n除非有证据表明：' + ' 或 '.join(unless)
    return s + '；\n则 ' + '，并且 '.join(head_zh(h) for h in r['heads'])


def src_label(s):
    if DOM['name'] == 'criminal':
        if s in DOM['FR'].OTHER_SOURCES:
            return DOM['FR'].OTHER_SOURCES[s][0]
        try:
            return DOM['CODE'].label_of(s)
        except Exception:  # noqa: BLE001
            return s
    m = re.fullmatch(r'art(\d+)(?:-(\d+))?', s)
    if not m:
        return s
    return f'第{m.group(1)}条' + (f'第{m.group(2)}款' if m.group(2) else '')


def src_text(s):
    if s in getattr(DOM['FR'], 'OTHER_SOURCES', {}):
        nid = DOM['FR'].OTHER_SOURCES[s][1]
        return f'（原文取自图谱节点 {nid}）' + (NODES[nid]['clean'] or '')
    try:
        return DOM['CODE'].text_of(s)
    except Exception:  # noqa: BLE001
        return '（未能自动截取，请核对）'


# ───────────────────────── 图谱

NODES = {}
DOM = {'name': 'civil', 'FR': FR, 'CODE': CC}


def node_path(nid):
    out = []
    n = NODES.get(nid)
    while n and n['parent']:
        n = NODES[n['parent']]
        if n['kind'] != 'root':
            t = n['clean'] or n['text'] or ''
            out.append(t[:20] + ('…' if len(t) > 20 else ''))
    return ' › '.join(reversed(out))


def node_subtree(nid, limit=700, depth=2):
    lines = []

    def walk(i, d):
        n = NODES[i]
        t = (n['clean'] or n['text'] or '').replace('\n', ' ')
        lines.append('  ' * d + ('' if d == 0 else '· ') + t)
        if d < depth:
            for c in n['children']:
                walk(c, d + 1)
    walk(nid, 0)
    s = '\n'.join(lines)
    return s if len(s) <= limit else s[:limit] + '\n……（下级节点从略，见节点 ' + nid + '）'


# ───────────────────────── 样式（同“审核 sample.xlsx”）

FONT = 'Microsoft YaHei'
NAVY, INK = '17365D', '1F2937'
THIN = Side(style='thin', color='BFBFBF')
BORDER = Border(left=THIN, right=THIN, top=THIN, bottom=THIN)
HEAD_FILL = PatternFill('solid', fgColor=NAVY)
VERDICT_FILL = PatternFill('solid', fgColor='FFF4CE')
TOTAL_FILL = PatternFill('solid', fgColor='D9EAF7')


def title(ws, text, ncol):
    ws.merge_cells(start_row=1, start_column=1, end_row=1, end_column=ncol)
    c = ws.cell(1, 1, text)
    c.font = Font(name=FONT, bold=True, size=16, color='FFFFFF')
    c.fill = HEAD_FILL
    ws.row_dimensions[1].height = 28
    ws.sheet_view.showGridLines = False


def header(ws, row, cols):
    for j, (name, width) in enumerate(cols, 1):
        c = ws.cell(row, j, name)
        c.font = Font(name=FONT, bold=True, size=10, color='FFFFFF')
        c.fill = HEAD_FILL
        c.alignment = Alignment(horizontal='center', vertical='center', wrap_text=True)
        c.border = BORDER
        ws.column_dimensions[get_column_letter(j)].width = width
    ws.row_dimensions[row].height = 32


def body_cell(ws, r, j, v, center=False):
    c = ws.cell(r, j, v)
    c.font = Font(name=FONT, size=10, color=INK)
    c.alignment = Alignment(horizontal='center' if center else 'left', vertical='top', wrap_text=True)
    c.border = BORDER
    return c


def fit_height(ws, r, cols, values):
    lines = 1
    for (name, width), v in zip(cols, values):
        if v is None:
            continue
        per = max(1, int(width / 1.9))  # 每行约容纳的汉字数
        lines = max(lines, sum(math.ceil(max(1, len(seg)) / per) for seg in str(v).split('\n')))
    ws.row_dimensions[r].height = min(409, max(30, 13.5 * lines + 6))


def review_sheet(wb, name, ttl, cols, rows, verdicts, centered=()):
    """rows: 前若干列的值；专家列（结论/建议/理由/补充法源/审核人/日期）自动追加"""
    expert = [('专家结论', 14), ('专家建议文本', 36), ('专家理由', 30), ('补充法源', 24), ('审核人', 10), ('审核日期', 12)]
    allcols = cols + expert
    ws = wb.create_sheet(name)
    title(ws, ttl, len(allcols))
    header(ws, 3, allcols)
    vcol = len(cols) + 1
    for i, row in enumerate(rows):
        r = 4 + i
        vals = list(row) + ['待确认', None, None, None, None, None]
        for j, v in enumerate(vals, 1):
            c = body_cell(ws, r, j, v, center=(j in centered or j == 1))
            if j == vcol:
                c.fill = VERDICT_FILL
                c.alignment = Alignment(horizontal='center', vertical='top', wrap_text=True)
            if j == len(allcols):
                c.number_format = 'yyyy-mm-dd'
        fit_height(ws, r, allcols, vals)
    last = 3 + len(rows)
    L = get_column_letter(vcol)
    rng = f'{L}4:{L}{last}'
    dv = DataValidation(type='list', formula1='"' + ','.join(verdicts + ['待确认']) + '"', allow_blank=True)
    dv.add(rng)
    ws.add_data_validation(dv)
    good = ['确认', '小改后确认', '已覆盖', '非规范例外', '无需形式化', '已间接覆盖']
    bad = ['需重大修改', '删除', '需补充规则']
    for v in verdicts + ['待确认']:
        if v in good:
            fill, color = 'E2F0D9', '375623'
        elif v in bad:
            fill, color = 'FCE4D6', '9C0006'
        elif v == '待确认':
            fill, color = 'E7E6E6', '666666'
        else:
            fill, color = 'FFF2CC', '7F6000'
        ws.conditional_formatting.add(rng, CellIsRule(operator='equal', formula=[f'"{v}"'],
                                                      fill=PatternFill('solid', bgColor=fill), font=Font(color=color)))
    ws.freeze_panes = 'D4'
    ws.auto_filter.ref = f'A3:{get_column_letter(len(allcols))}{last}'
    return ws, rng


# ───────────────────────── 各表数据

def rule_rows(index):
    rules = [(mk, mname, r) for mk, (mname, rs) in DOM['FR'].MODULES.items() for r in rs]
    over_by = collections.defaultdict(list)
    under_by = collections.defaultdict(list)
    for o, u, why in DOM['FR'].OVERRIDES:
        over_by[o].append(f'优先于 {u}（{why}）')
        under_by[u].append(f'被 {o} 排除（{why}）')
    rows, stats = [], collections.Counter()
    for i, (mk, mname, r) in enumerate(rules, 1):
        _, unless, flags = body_parts(r['body'])
        if any(isinstance(h, str) and h.startswith('-') for h in r['heads']):
            flags.add('Neg')
        notes = []
        if r['auth'] != 'npc':
            notes.append('学理归纳：不要求逐字对应法条，请判断是否为通说且与法条不冲突')
        if 'Naf' in flags:
            notes.append('含“除非”：缺少该事实时规则照常适用，请判断举证/推定方向是否正确')
        if 'Or' in flags:
            notes.append('含“下列之一”：请核对列举是否完整、是否为选择关系')
        if 'Neg' in flags:
            notes.append('含明确否定：须证得“并非…”，请核对否定对象')
        rel = over_by[r['key']] + under_by[r['key']]
        if rel:
            notes.append('参与优先关系（见“优先关系审核”）')
        level = '高' if (r['auth'] != 'npc' or 'Naf' in flags or rel) else ('中' if flags else '低')
        stats[level] += 1
        info = index['rules'].get(r['key'], {})
        nid = info.get('node', '')
        rows.append([
            i, mname, r['key'], r['note'], level, '\n'.join(notes) or '常规规则：核对条件与结论',
            AUTH.get(r['auth'], r['auth']),
            '；'.join(src_label(s) for s in r['srcs']),
            '\n'.join(f'【{src_label(s)}】{src_text(s)}' for s in r['srcs']),
            f'{nid}\n{node_path(nid)}' if nid else '（未挂接）',
            node_subtree(nid) if nid else '',
            rule_sentence(r),
            '\n'.join(rel) or '无',
            rule_formal(r),
        ])
    return rows, stats


RULE_COLS = [('序号', 6), ('模块', 14), ('Rule ID', 16), ('规则标题', 28), ('风险等级', 8), ('核查重点', 30),
             ('来源类型', 10), ('法源', 14), ('法条原文', 48), ('图谱节点\n与路径', 26), ('图谱原文（节点及下级）', 44),
             ('规则（中文命题）', 48), ('相关优先关系', 30), ('形式化表达（供技术核对）', 40)]


def override_rows():
    rules = {r['key']: r for _, rs in DOM['FR'].MODULES.values() for r in rs}
    rows = []
    for i, (o, u, why) in enumerate(DOM['FR'].OVERRIDES, 1):
        ro, ru = rules[o], rules[u]
        rows.append([i, o, '；'.join(src_label(s) for s in ro['srcs']), rule_sentence(ro),
                     u, '；'.join(src_label(s) for s in ru['srcs']), rule_sentence(ru), why])
    return rows


OVR_COLS = [('序号', 6), ('优先规则', 16), ('优先规则法源', 14), ('优先规则（中文命题）', 44),
            ('被排除规则', 16), ('被排除规则法源', 14), ('被排除规则（中文命题）', 44), ('优先理由', 30)]


def lit_zh(lit):
    lit = lit.strip()
    neg = lit.startswith('!')
    lit = lit.lstrip('!').strip()
    mod = ''
    if lit[:2] in ('O ', 'P '):
        mod, lit = {'O': '【义务】', 'P': '【许可】'}[lit[0]], lit[2:].strip()
    s = mod + atom_zh(lit)
    return f'不能推出：{s}' if neg else s


ATOM = re.compile(r'(?<![\w（])(\w+)\(([^()]*)\)')


def zh_line(line):
    line = re.sub(r'\b(?:art\d+(?:-\d+)?(?:#\d+)?|spc-\w+)', lambda m: src_label(m.group(0)), line)
    line = re.sub(r'^([✓✗] )!', r'\1不能推出：', line)
    line = re.sub(r'^([✓✗] )-', r'\1并非 ', line)
    for _ in range(3):
        line = ATOM.sub(lambda m: (f'并非 {m.group(2)}' if m.group(1) == 'non' else
                                   f'{GLOSS.get(m.group(1), m.group(1))}（{"，".join(CONST.get(x.strip(), x.strip()) for x in m.group(2).split(","))}）'), line)
    return line


def case_rows(python):
    out = subprocess.run([python, str(DOM['case_script']), '-v'], capture_output=True, text=True, cwd=HERE.parent)
    chains, cur = {}, None
    for line in out.stdout.splitlines():
        m = re.match(r'(PASS|FAIL)\s+(\S+)', line)
        if m:
            cur = m.group(2)
            chains[cur] = {'status': m.group(1), 'lines': []}
        elif cur and line.startswith('    '):
            chains[cur]['lines'].append(zh_line(line[4:]))
    rows = []
    for i, c in enumerate(json.load(open(DOM['cases'], encoding='utf-8')), 1):
        ch = chains.get(c['id'], {'status': '未运行', 'lines': []})
        rows.append([i, c['id'], c['title'], '\n'.join('· ' + lit_zh(f) for f in c['facts']),
                     '\n'.join('· ' + lit_zh(e) for e in c['expect']), ch['status'],
                     '\n'.join(ch['lines'])[:3000]])
    return rows


CASE_COLS = [('序号', 6), ('案例 ID', 10), ('案情', 30), ('输入事实', 34), ('系统结论', 34), ('测试', 8), ('推理链（由推理机生成）', 60)]


def exception_rows(index):
    rows = []
    for i, e in enumerate(index['exception_candidates'], 1):
        cites = '；'.join(f'第{c["art"]}条' if isinstance(c, dict) else str(c) for c in e['cites']) or '无'
        rows.append([i, e['node'], node_path(e['node']), node_subtree(e['node'], limit=500, depth=1), cites,
                     '、'.join(e['formalized_by']) or '无'])
    return rows


EXC_COLS = [('序号', 6), ('图谱节点', 10), ('图谱路径', 30), ('节点原文（及下级）', 54), ('引用法条', 14), ('已形式化规则', 16)]


def coverage_rows():
    pat = r'art(\d+(?:-\d)?)' if DOM['name'] == 'criminal' else r'art(\d+)'
    used = {re.match(pat, s).group(1) for _, rs in DOM['FR'].MODULES.values() for r in rs for s in r['srcs'] if re.match(pat, s)}
    cited = collections.defaultdict(list)
    for n in NODES.values():
        for c in n['cites']:
            if c.get('law') == DOM['law'] and n['id'] not in cited[str(c['art'])]:
                cited[str(c['art'])].append(n['id'])
    rows = []
    arts = sorted((a for a in cited if a not in used), key=lambda a: (-len(cited[a]), tuple(int(x) for x in a.split('-'))))
    for i, a in enumerate(arts, 1):
        ex = cited[a][:3]
        rows.append([i, src_label(f'art{a}'), len(cited[a]), src_text(f'art{a}'),
                     '\n'.join(f'{x}：{(NODES[x]["clean"] or "")[:80]}' for x in ex)])
    return rows, len(used), len(cited)


COV_COLS = [('序号', 6), ('法条', 12), ('图谱引用次数', 10), ('法条原文', 56), ('图谱中的引用节点（前 3 个）', 56)]


# ───────────────────────── 总览、法源

def overview(wb, sheets, court_note):
    ws = wb.create_sheet('审核总览', 0)
    title(ws, DOM['title'], 8)
    cols = [('审核表', 16), ('说明', 44), ('审核对象', 26), ('条目数', 9), ('已确认/小改后确认/无需处理', 16),
            ('需重大修改/删除/需补充', 16), ('有争议/无法判断', 14), ('待确认', 10)]
    header(ws, 2, cols)
    r = 3
    for name, desc, obj, rng, good, bad, open_ in sheets:
        s = f"'{name}'!{rng}"
        cnt = lambda labels: '+'.join(f'COUNTIF({s},"{x}")' for x in labels)  # noqa: E731
        vals = [name, desc, obj, f'=ROWS({s})', '=' + cnt(good), '=' + cnt(bad), '=' + cnt(open_), f'=COUNTIF({s},"待确认")']
        for j, v in enumerate(vals, 1):
            body_cell(ws, r, j, v, center=j >= 4)
        ws.row_dimensions[r].height = 58
        r += 1
    for j, v in enumerate(['合计', None, None] + [f'=SUM({get_column_letter(j)}3:{get_column_letter(j)}{r - 1})' for j in range(4, 9)], 1):
        c = body_cell(ws, r, j, v, center=j >= 4)
        c.fill, c.font = TOTAL_FILL, Font(name=FONT, size=10, bold=True, color=INK)
    r += 2
    notes = [
        ('审核原则', '专家只做法律判断，不读代码。\n1. 法条原文：' + court_note +
         f'\n2. 规则：由程序把 {DOM["rules_file"]} 直译为中文命题（不经 LLM），“形式化表达”列仅供技术人员对照。\n'
         '3. 图谱：只审规则挂接的节点、例外候选节点与未形式化的被引法条，不通读全图。\n'
         '4. 建议顺序：规则审核按“风险等级=高”筛选先审 → 优先关系审核 → 案例审核 → 例外候选与覆盖检查。'),
        ('规则读法', '如果 A，且 B；除非有证据表明：C；则 D\n'
         '· “且”：全部前提都须成立；“下列之一〔①…；②…〕”：括号内任一分支成立即可。\n'
         '· “除非有证据表明 C”：只要案件中没有出现 C，规则就适用；出现 C 时规则被阻却。'
         '请特别判断：缺少 C 的信息时直接适用规则，是否符合法律上的举证或推定方向。\n'
         '· “并非 X〔须证得〕”：必须有事实证明 X 不成立，不能只因“未提及”。\n'
         '· 所有规则均为可废止规则：被“优先关系审核”中的规则推翻时不适用。\n'
         '· ' + DOM['vars']),
        ('专家结论标签', '规则 / 优先关系 / 案例：\n确认：与法条和图谱一致\n小改后确认：措辞或个别条件需微调，在“专家建议文本”写出改法\n'
         '需重大修改：条件、例外、结论或法源有实质错误\n删除：不应作为规则\n有争议：存在学说分歧，请在“专家理由”写明观点\n'
         '移出主实验：规则本身可接受，但不宜用于实验评测\n无法判断：超出审核范围或信息不足\n\n'
         '例外候选：已覆盖 / 非规范例外（只是普通表述）/ 需补充规则 / 有争议 / 无法判断\n'
         '覆盖检查：无需形式化 / 已间接覆盖 / 需补充规则 / 有争议 / 无法判断'),
        ('来源类型', f'条文明文：规则直接来自{DOM["code_name"]}条文，应逐项对应原文。\n'
         f'学理归纳：由学理通说或图谱笔记归纳（{DOM["doctrine_eg"]}），不要求逐字对应，请判断是否为通说、是否与条文冲突。\n'
         '司法解释：规则来自司法解释，原文见“法条原文”列。'),
        ('双人审核', '高风险条目建议两位专家独立审核（各用一份副本），汇总后计算一致性（Cohen\'s κ），分歧交第三人裁决。'),
    ]
    for k, v in notes:
        ws.merge_cells(start_row=r, start_column=2, end_row=r, end_column=8)
        body_cell(ws, r, 1, k).font = Font(name=FONT, size=10, bold=True, color=INK)
        body_cell(ws, r, 2, v)
        ws.row_dimensions[r].height = 14 * (v.count('\n') + 1) + 12
        r += 1


def sources(wb, court_note):
    ws = wb.create_sheet('法源')
    title(ws, '官方法源与审核材料', 6)
    ws.merge_cells('A2:F2')
    c = ws.cell(2, 1, '法律含义以官方文本为准。新增来源请记录发布机构、日期、条款与 URL。法条原文：' + court_note)
    c.font = Font(name=FONT, size=10, color=INK)
    c.alignment = Alignment(wrap_text=True, vertical='top')
    ws.row_dimensions[2].height = 34
    cols = [('Source ID', 18), ('发布机构', 18), ('文件名', 40), ('日期', 24), ('URL', 64), ('用途', 42)]
    header(ws, 4, cols)
    rows = DOM['sources']
    for i, row in enumerate(rows, 5):
        for j, v in enumerate(row, 1):
            body_cell(ws, i, j, v)
        ws.row_dimensions[i].height = 32


def court_check(html_path):
    import html as H
    raw = Path(html_path).read_text(encoding='utf-8')
    t = re.sub(r'(?is)<(script|style).*?</\1>', '', raw)
    t = re.sub(r'(?i)<br\s*/?>|</p>|</div>', '\n', t)
    t = H.unescape(re.sub(r'<[^>]+>', '', t))
    txt = '\n'.join(x.strip() for x in t.split('\n') if x.strip())
    heads = list(re.finditer(r'(?m)^第([一二三四五六七八九十百千零]+)条[　 ]*', txt))
    court = {}
    for i, m in enumerate(heads):
        body = txt[m.end():heads[i + 1].start() if i + 1 < len(heads) else len(txt)]
        body = re.split(r'(?m)^\s*第[一二三四五六七八九十]+[章节编]|^\s*附[　 ]*则|^责任编辑', body)[0]
        court.setdefault(CC.cn2int(m.group(1)), body)
    norm = lambda s: re.sub(r'\s+', '', s)  # noqa: E731
    mine = CC.articles()
    diff = [n for n in range(1, 1261) if norm(re.sub(r'^第[一二三四五六七八九十百千零]+条　', '', mine[n])) != norm(court.get(n, ''))]
    today = datetime.date.today().isoformat()
    if not diff:
        return f'仓库文本已与最高人民法院网页逐条比对（{today}），1260 条全部一致。'
    return f'仓库文本与最高人民法院网页逐条比对（{today}）：{len(diff)} 条不一致：{"、".join(map(str, diff[:20]))}，请人工核对。'


WIKI = ('https://zh.wikisource.org/w/index.php?title=%E4%B8%AD%E5%8D%8E%E4%BA%BA%E6%B0%91%E5%85%B1%E5%92%8C%E5%9B%BD'
        '%E5%88%91%E6%B3%95_(2023%E5%B9%B4)')
SIXLAWS = 'https://www.6laws.net/6law/lawcn/%E4%B8%AD%E5%8D%8E%E4%BA%BA%E6%B0%91%E5%85%B1%E5%92%8C%E5%9B%BD%E5%88%91%E6%B3%95.htm'


def configure(name):
    global NODES, GLOSS, CONST
    if name == 'civil':
        DOM.update(name='civil', FR=FR, CODE=CC, law='civil-code', cases=PATHS.CASES, case_script=HERE / 'run_cases.py',
                   nodes=PATHS.GRAPH_NODES, index=PATHS.LRML_INDEX, code_name='民法典', rules_file='src/formal_rules.py',
                   title='民法规则专家审核｜民法典 ↔ 专家知识图谱 ↔ 形式化规则',
                   doctrine_eg='如“无效行为不是有效行为”',
                   vars='大写字母（P、X、K…）是变量，代表同一案件中的同一主体/行为/合同；小写（如 jia、k1）是案例中的具体当事人或行为。')
        GLOSS, CONST = {**FR.ZH, **ZH_EXTRA}, {'court': '人民法院'}
        n_rules = sum(len(rs) for _, rs in FR.MODULES.values())
        DOM['sources'] = [
            ('CC-2020', '全国人民代表大会', '中华人民共和国民法典', '2020-05-28 通过；2021-01-01 施行', COURT_URL, '法条原文（最高人民法院发布文本）'),
            ('CC-REPO', '本项目', 'data/civil/civil_code_20200528.txt', '—', REPO + 'data/civil/civil_code_20200528.txt',
             '“法条原文”列的来源，已与 CC-2020 逐条比对'),
            ('GRAPH', '本项目', 'data/civil/civil_graph.markdown（专家知识图谱，8355 个节点）', '—', REPO + 'data/civil/civil_graph.markdown',
             '“图谱原文”“图谱路径”列的来源'),
            ('RULES', '本项目', f'src/formal_rules.py（{len(FR.MODULES)} 个模块，{n_rules} 条规则，{len(FR.OVERRIDES)} 组优先关系）', '—',
             REPO + 'src/formal_rules.py', '“规则（中文命题）”列由此直译'),
            ('INDEX', '本项目', 'graph/civil/civil_graph_index.json', '—', REPO + 'graph/civil/civil_graph_index.json', '规则 ↔ 图谱节点 ↔ 法条；例外候选节点'),
            ('CASES', '本项目', 'graph/civil/cases.json', '—', REPO + 'graph/civil/cases.json', '“案例审核”表'),
        ]
    else:
        import crim_rules as KR
        import criminal_code as KC
        DOM.update(name='criminal', FR=KR, CODE=KC, law='criminal-law', cases=PATHS.CRIM_CASES,
                   case_script=HERE / 'criminal' / 'run_cases.py', nodes=PATHS.CRIM_NODES, index=PATHS.CRIM_LRML_INDEX,
                   code_name='刑法', rules_file='src/criminal/crim_rules.py',
                   title='刑法规则专家审核｜刑法 ↔ 专家知识图谱 ↔ 形式化规则',
                   doctrine_eg='如“已满十六不满十八周岁或已满十八周岁的，为已满十六周岁”这类年龄段归纳',
                   vars='大写字母是变量：P 为行为人，X 为犯罪事件，C 为罪名；“量刑（P，X，从轻）”表示人民法院对 P 的 X 从轻处罚。'
                        '小写（如 jia、x）是案例中的具体当事人或事件。')
        GLOSS = {**KR.ZH, 'multipleExtortion': '多次敲诈勒索'}
        CONST = {**KR.CHARGE_ZH, **CRIM_CONST}
        n_rules = sum(len(rs) for _, rs in KR.MODULES.values())
        DOM['sources'] = [
            ('CL-2023', '全国人民代表大会', '中华人民共和国刑法（1997 年修订，修正至刑法修正案（十二））',
             '修正案（十二）2023-12-29 通过；2024-03-01 施行', '—', '法律含义以全国人大公布的官方文本为准'),
            ('SRC-PDF', '京师律师事务所整理', '刑法 2024 版 PDF（三方核对来源之一）', '2024', '本地文件', '核对来源'),
            ('SRC-WIKI', '维基文库', '中华人民共和国刑法 (2023年)', '—', WIKI, '核对来源'),
            ('SRC-6LAWS', '6laws.net', '中华人民共和国刑法', '—', SIXLAWS, '核对来源'),
            ('CL-REPO', '本项目', 'data/criminal/criminal_law_2023.txt（505 条）', '—', REPO + 'data/criminal/criminal_law_2023.txt',
             '“法条原文”列的来源：三方核对结果'),
            ('RECONCILE', '本项目', 'data/criminal/reconcile_report.md', '—', REPO + 'data/criminal/reconcile_report.md', '35 条差异的逐条裁决'),
            ('SPC-2006-1', '最高人民法院', '关于审理未成年人刑事案件具体应用法律若干问题的解释（法释〔2006〕1号）', '2006', '—',
             '规则 k-conv-minor 等的法源（原文取自图谱节点 t0577）'),
            ('GRAPH', '本项目', 'data/criminal/criminal_graph.itmz / criminal_graph.markdown（专家知识图谱，9828 个节点）', '—',
             REPO + 'data/criminal/criminal_graph.markdown', '“图谱原文”“图谱路径”列的来源'),
            ('RULES', '本项目', f'src/criminal/crim_rules.py（{len(KR.MODULES)} 个模块，{n_rules} 条规则，{len(KR.OVERRIDES)} 组优先关系）', '—',
             REPO + 'src/criminal/crim_rules.py', '“规则（中文命题）”列由此直译'),
            ('INDEX', '本项目', 'graph/criminal/criminal_graph_index.json', '—', REPO + 'graph/criminal/criminal_graph_index.json',
             '规则 ↔ 图谱节点 ↔ 法条；例外候选节点'),
            ('CASES', '本项目', 'graph/criminal/cases.json', '—', REPO + 'graph/criminal/cases.json', '“案例审核”表'),
        ]
    DOM['n_rules'] = n_rules
    NODES = {n['id']: n for n in json.load(open(DOM['nodes'], encoding='utf-8'))}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('domain', choices=['civil', 'criminal'])
    ap.add_argument('-o', '--out')
    ap.add_argument('--court-check', help='（民法）最高人民法院民法典网页的本地 HTML，用于逐条比对')
    a = ap.parse_args()
    configure(a.domain)
    if a.domain == 'civil':
        court_note = court_check(a.court_check) if a.court_check else '未与官方网页比对（加 --court-check）。'
    else:
        court_note = ('由 PDF（京师律所整理 2024 版）、维基文库、6laws 三个独立文本逐条核对：三方一致 470 条，其余 35 条按多数或人工裁决，'
                      '见 data/criminal/reconcile_report.md。其中第452条第3款措辞为人工裁决，请对照官方文本确认。')
    index = json.load(open(DOM['index'], encoding='utf-8'))
    out = Path(a.out or HERE.parent / 'review' / f'{a.domain}_review.xlsx')

    wb = Workbook()
    wb.remove(wb.active)
    rr, stats = rule_rows(index)
    _, r_rng = review_sheet(wb, '规则审核', f'规则审核｜{DOM["n_rules"]} 条形式化规则（风险等级 高 {stats["高"]} / 中 {stats["中"]} / 低 {stats["低"]}）',
                            RULE_COLS, rr, VERDICTS, centered=(5, 7))
    orows = override_rows()
    _, o_rng = review_sheet(wb, '优先关系审核', f'优先关系审核｜{len(orows)} 组规则冲突时的优先顺序', OVR_COLS, orows, VERDICTS)
    crows = case_rows(sys.executable)
    _, c_rng = review_sheet(wb, '案例审核', f'案例审核｜{len(crows)} 个单元案例：事实 → 系统结论是否正确', CASE_COLS, crows, VERDICTS,
                            centered=(6,))
    erows = exception_rows(index)
    _, e_rng = review_sheet(wb, '例外候选审核', f'例外候选审核｜{len(erows)} 个图谱中含例外信号的节点', EXC_COLS, erows, EXC_VERDICTS)
    vrows, n_used, n_cited = coverage_rows()
    _, v_rng = review_sheet(wb, '覆盖检查', f'覆盖检查｜图谱引用了 {n_cited} 条法条，其中 {len(vrows)} 条尚无规则（按引用次数排序）',
                            COV_COLS, vrows, COV_VERDICTS, centered=(3,))
    good = ['确认', '小改后确认']
    bad = ['需重大修改', '删除']
    open_ = ['有争议', '无法判断', '移出主实验']
    overview(wb, [
        ('规则审核', '每条规则的法条原文、图谱原文、中文命题并排；先按“风险等级=高”筛选审核。', f'{DOM["n_rules"]} 条规则', r_rng, good, bad, open_),
        ('优先关系审核', '两条规则冲突时谁优先；请判断优先方向与理由。', f'{len(orows)} 组优先关系', o_rng, good, bad, open_),
        ('案例审核', '给定事实，系统推出的结论及推理链；只需判断结论在法律上是否正确。', f'{len(crows)} 个案例', c_rng, good, bad, open_),
        ('例外候选审核', '图谱中含“但是、除外、不得”等例外信号的节点；判断是否为应形式化的法律例外。', f'{len(erows)} 个节点', e_rng,
         ['已覆盖', '非规范例外'], ['需补充规则'], ['有争议', '无法判断']),
        ('覆盖检查', '图谱引用、但还没有任何规则的法条；判断是否需要补充。可只审引用次数靠前的部分。', f'{len(vrows)} 条法条', v_rng,
         ['无需形式化', '已间接覆盖'], ['需补充规则'], ['有争议', '无法判断']),
    ], court_note)
    sources(wb, court_note)
    out.parent.mkdir(parents=True, exist_ok=True)
    wb.save(out)
    print(f'规则 {len(rr)}（高 {stats["高"]} 中 {stats["中"]} 低 {stats["低"]}），优先关系 {len(orows)}，案例 {len(crows)}，'
          f'例外候选 {len(erows)}，未覆盖法条 {len(vrows)}/{n_cited} → {out}\n{court_note}')


if __name__ == '__main__':
    main()
