# -*- coding: utf-8 -*-
"""
刑法规则层（人工形式化），写法同 ../src/formal_rules.py：
  体 'p(..)' / '-p(..)' 强否定 / '~p(..)' 例外条件（Naf）/ ('or', [...])
  头 'p(..)' / '-p(..)' / ('OBL'|'FOR'|'PERM', 承担者, 相对方, 'q(..)')；承担者可以是常量 court（人民法院）
  源 'art17#2'（第17条第2款）、'art17-1'（第17条之一）、'art133-1#1'；'spc-minor10' 等为司法解释
  锚 (节点编号, 关键词)：规则挂在 crim_nodes.json 的该节点下；生成时校验节点文字含关键词，防止导图改动后错位

建模约定
  人 P、犯罪事件 X、罪名 C（常量：theft fraud snatching robbery intentionalInjury intentionalHomicide ...）
  constitutes(P,X,C)   行为符合罪名 C 的构成要件（客观+主观，不含责任年龄与能力）
  responsible(P,X,C)   对 C 负刑事责任（年龄、能力、违法阻却均已考虑）
  convicted(P,X,C)     以 C 定罪
  量刑：应当 → ('OBL','court',None,'sentence(P,X,方式)')；可以 → ('PERM', ...)；不得 → ('FOR', ...)
        方式：lighter 从轻 / lighterOrReduced 从轻或减轻 / lighterReducedOrExempt / reducedOrExempt / reduced / exempt / heavier 从重
"""
S, D = 'Strict', 'Defeasible'


def R(key, srcs, body, heads, anchor, note, auth='npc', strength=D):
    return dict(key=key, srcs=srcs if isinstance(srcs, list) else [srcs], body=body,
                heads=heads if isinstance(heads, list) else [heads], anchor=anchor, note=note, auth=auth, strength=strength)


def SENT(kind, mode, P='P', X='X'):
    return (kind, 'court', None, f'sentence({P},{X},{mode})')


# 司法解释等非刑法典法源（原文取自导图节点，标明出处）
OTHER_SOURCES = {
    'spc-minor10': ('《最高人民法院关于审理未成年人刑事案件具体应用法律若干问题的解释》（法释〔2006〕1号）第10条第1款',
                    't0577'),
}

GRAVE14 = ['intentionalHomicide', 'intentionalInjury', 'rape', 'robbery', 'drugTrafficking', 'arson', 'explosion', 'poisoning']
MODULES = {}

# ════════ 一、刑事责任年龄与能力（第17、17条之一、18、19条）
MODULES['k-capacity'] = ('刑事责任年龄与能力', [
    R('k-age16', 'art17#1', [('or', ['age16to18(P)', 'adult(P)'])], 'age16plus(P)', ('t0551', '刑事责任年龄'), '已满十六周岁', auth='doctrine'),
    R('k-under18', 'art17#4', [('or', ['age12to14(P)', 'age14to16(P)', 'age16to18(P)'])], 'under18(P)', ('t0551', '刑事责任年龄'), '不满十八周岁', auth='doctrine'),
    R('k17-1', 'art17#1', ['constitutes(P,X,C)', 'age16plus(P)'], 'responsible(P,X,C)', ('t0551', '刑事责任年龄'),
      '已满十六周岁的人犯罪，应当负刑事责任'),
    *[R(f'k17-2-{c}', 'art17#2', ['constitutes(P,X,%s)' % c, 'age14to16(P)'] + (['causesGraveInjuryOrDeath(X)'] if c == 'intentionalInjury' else [])
        + (['~convertedRobbery(P,X)'] if c == 'robbery' else []),
        f'responsible(P,X,{c})', ('t0551', '刑事责任年龄'),
        '已满十四不满十六周岁，犯故意杀人、故意伤害致人重伤或死亡、强奸、抢劫、贩卖毒品、放火、爆炸、投放危险物质罪的，应当负刑事责任'
        + ('（转化型抢劫除外，见司法解释）' if c == 'robbery' else '')) for c in GRAVE14],
    R('k17-3', 'art17#3', ['constitutes(P,X,C)', 'age12to14(P)', ('or', ['constitutes(P,X,intentionalHomicide)', 'constitutes(P,X,intentionalInjury)']),
                           ('or', ['causesDeath(X)', 'especiallyCruelGraveDisability(X)']), 'heinous(X)', 'sppApprovedProsecution(X)'],
      'responsible(P,X,C)', ('t0551', '刑事责任年龄'),
      '已满十二不满十四周岁，犯故意杀人、故意伤害罪，致人死亡或以特别残忍手段致人重伤造成严重残疾，情节恶劣，经最高人民检察院核准追诉的，应当负刑事责任'),
    R('k17-4', 'art17#4', ['responsible(P,X,C)', 'under18(P)'], SENT('OBL', 'lighterOrReduced'), ('t0551', '刑事责任年龄'),
      '对不满十八周岁的人应当从轻或者减轻处罚'),
    R('k17-1b', 'art17-1', ['responsible(P,X,C)', 'age75plus(P)', 'intentionalCrime(X)'], SENT('PERM', 'lighterOrReduced'), ('t0551', '刑事责任年龄'),
      '已满七十五周岁的人故意犯罪的，可以从轻或者减轻处罚'),
    R('k17-1c', 'art17-1', ['responsible(P,X,C)', 'age75plus(P)', 'negligentCrime(X)'], SENT('OBL', 'lighterOrReduced'), ('t0551', '刑事责任年龄'),
      '已满七十五周岁的人过失犯罪的，应当从轻或者减轻处罚'),
    R('k18-1', 'art18#1', ['constitutes(P,X,C)', 'mentallyIll(P)', 'unableToRecognizeOrControlAtTime(P,X)', 'forensicallyCertified(P)'],
      '-responsible(P,X,C)', ('t0588', '精神病人'), '精神病人在不能辨认或者不能控制自己行为时造成危害结果，经法定程序鉴定确认的，不负刑事责任'),
    R('k18-3', 'art18#3', ['responsible(P,X,C)', 'mentallyIll(P)', 'partiallyImpairedCapacity(P,X)'], SENT('PERM', 'lighterOrReduced'),
      ('t0588', '精神病人'), '尚未完全丧失辨认或者控制能力的精神病人犯罪的，应当负刑事责任，但是可以从轻或者减轻处罚'),
    R('k19', 'art19', ['responsible(P,X,C)', ('or', ['deafAndMute(P)', 'blind(P)'])], SENT('PERM', 'lighterReducedOrExempt'),
      ('t0597', '又聋又哑'), '又聋又哑的人或者盲人犯罪，可以从轻、减轻或者免除处罚'),
])

# ════════ 二、正当防卫与紧急避险（第20、21条）
MODULES['k-justification'] = ('正当化事由', [
    R('k20-cond', 'art20#1', ['defensiveAct(P,X)', 'ongoingUnlawfulAttack(X)', 'harmToAttacker(X)', 'defensiveIntent(P,X)'], 'defenseConditions(P,X)',
      ('t0875', '成立条件'), '起因（不法侵害）、时间（正在进行）、对象（不法侵害人）、主观（防卫意图）'),
    R('k20-1', 'art20#1', ['defenseConditions(P,X)', 'constitutes(P,X,C)', '~excessiveDefense(P,X)'], ['justifiedDefense(P,X)', '-responsible(P,X,C)'],
      ('t0871', '正当防卫'), '正当防卫，不负刑事责任'),
    R('k20-2', 'art20#2', ['defenseConditions(P,X)', 'obviouslyExceedsNecessity(X)', 'causesSeriousHarm(X)', '~violentCrimeEndangeringLife(X)'],
      'excessiveDefense(P,X)', ('t0907', '防卫过当'), '正当防卫明显超过必要限度造成重大损害的，是防卫过当'),
    R('k20-2b', 'art20#2', ['excessiveDefense(P,X)', 'responsible(P,X,C)'], SENT('OBL', 'reducedOrExempt'), ('t0907', '防卫过当'),
      '防卫过当应当负刑事责任，但是应当减轻或者免除处罚'),
    R('k20-3', 'art20#3', ['defenseConditions(P,X)', 'constitutes(P,X,C)', 'violentCrimeEndangeringLife(X)'], ['justifiedDefense(P,X)', '-responsible(P,X,C)'],
      ('t0898', '特别防卫'), '对行凶、杀人、抢劫、强奸、绑架等严重危及人身安全的暴力犯罪防卫，造成伤亡的，不属于防卫过当，不负刑事责任'),
    R('k20-late', 'art20#1', ['defensiveAct(P,X)', 'attackAlreadyEnded(X)'], '-defenseConditions(P,X)', ('t0921', '事后防卫'),
      '不法侵害已经结束后的“防卫”是事后防卫，不成立正当防卫', auth='doctrine'),
    R('k21-cond', 'art21#1', ['avertsDanger(P,X)', 'ongoingDanger(X)', 'noOtherMeans(X)', 'harmsThirdPartyInterest(X)', '~specialDutyToFaceOwnDanger(P,X)'],
      'necessityConditions(P,X)', ('t0935', '成立条件'), '正在发生的危险、不得已、损害另一合法权益；避免本人危险不适用于负有特定责任的人（第21条第3款）'),
    R('k21-1', 'art21#1', ['necessityConditions(P,X)', 'constitutes(P,X,C)', '~excessiveNecessity(P,X)'], ['justifiedNecessity(P,X)', '-responsible(P,X,C)'],
      ('t0931', '紧急避险'), '紧急避险，不负刑事责任'),
    R('k21-2', 'art21#2', ['necessityConditions(P,X)', 'exceedsNecessityUndueHarm(X)'], 'excessiveNecessity(P,X)', ('t0953', '避险过当'),
      '紧急避险超过必要限度造成不应有的损害的，是避险过当'),
    R('k21-2b', 'art21#2', ['excessiveNecessity(P,X)', 'responsible(P,X,C)'], SENT('OBL', 'reducedOrExempt'), ('t0953', '避险过当'),
      '避险过当应当负刑事责任，但是应当减轻或者免除处罚'),
])

# ════════ 三、故意犯罪的停止形态与共同犯罪（第22–24、26–29条）
MODULES['k-stages'] = ('犯罪形态与共同犯罪', [
    R('k22', 'art22#1', ['preparedToolsOrConditions(P,X)', '~commencedExecution(P,X)', '~voluntarilyAbandoned(P,X)'], 'preparation(P,X)',
      ('t1042', '预备'), '为了犯罪，准备工具、制造条件，因意志以外原因未能着手的，是犯罪预备'),
    R('k22-2', 'art22#2', ['preparation(P,X)', 'responsible(P,X,C)'], SENT('PERM', 'lighterReducedOrExempt'), ('t1042', '预备'),
      '对于预备犯，可以比照既遂犯从轻、减轻处罚或者免除处罚'),
    R('k23', 'art23#1', ['commencedExecution(P,X)', 'notAccomplished(X)', '~voluntarilyAbandoned(P,X)'], 'attempt(P,X)', ('t1067', '未遂'),
      '已经着手实行犯罪，由于犯罪分子意志以外的原因而未得逞的，是犯罪未遂'),
    R('k23-2', 'art23#2', ['attempt(P,X)', 'responsible(P,X,C)'], SENT('PERM', 'lighterOrReduced'), ('t1067', '未遂'),
      '对于未遂犯，可以比照既遂犯从轻或者减轻处罚'),
    R('k24', 'art24#1', ['voluntarilyAbandoned(P,X)', 'notAccomplished(X)'], 'discontinuance(P,X)', ('t1140', '中止'),
      '在犯罪过程中，自动放弃犯罪或者自动有效地防止犯罪结果发生的，是犯罪中止'),
    R('k24-2a', 'art24#2', ['discontinuance(P,X)', 'responsible(P,X,C)', '~causedDamage(X)'], SENT('OBL', 'exempt'), ('t1140', '中止'),
      '对于中止犯，没有造成损害的，应当免除处罚'),
    R('k24-2b', 'art24#2', ['discontinuance(P,X)', 'responsible(P,X,C)', 'causedDamage(X)'], SENT('OBL', 'reduced'), ('t1140', '中止'),
      '对于中止犯，造成损害的，应当减轻处罚'),
    R('k24-noAttempt', 'art24#1', ['voluntarilyAbandoned(P,X)', 'notAccomplished(X)', 'commencedExecution(P,X)'], '-attempt(P,X)', ('t1183', '犯罪中止VS犯罪预备'),
      '自动性是犯罪中止区别于未遂、预备的标志', auth='doctrine'),
    R('k27', 'art27', ['accessoryRole(P,X)', 'responsible(P,X,C)'], SENT('OBL', 'lighterReducedOrExempt'), ('t1303', '从犯'),
      '在共同犯罪中起次要或者辅助作用的，是从犯，应当从轻、减轻处罚或者免除处罚'),
    R('k28', 'art28', ['coercedToParticipate(P,X)', 'responsible(P,X,C)'], SENT('OBL', 'reducedOrExempt'), ('t1311', '胁从犯'),
      '对于被胁迫参加犯罪的，应当按照他的犯罪情节减轻处罚或者免除处罚'),
    R('k29-1', 'art29#1', ['instigates(P,Q,X)', 'under18(Q)', 'responsible(P,X,C)'], SENT('OBL', 'heavier'), ('t1326', '教唆犯'),
      '教唆不满十八周岁的人犯罪的，应当从重处罚'),
    R('k29-2', 'art29#2', ['instigates(P,Q,X)', 'instigatedDidNotCommit(Q,X)', 'responsible(P,X,C)'], SENT('PERM', 'lighterOrReduced'),
      ('t1326', '教唆犯'), '被教唆的人没有犯被教唆的罪的，对于教唆犯，可以从轻或者减轻处罚'),
])

# ════════ 四、量刑制度：累犯、自首、坦白、立功、缓刑、假释（第65–68、72、74、81条）
MODULES['k-sentencing'] = ('量刑与刑罚执行制度', [
    R('k65', 'art65#1', ['priorSentenceFixedTermOrAbove(P)', 'within5YearsAfterRelease(P,X)', 'newCrimeDeservesFixedTerm(X)', 'responsible(P,X,C)',
                         '~negligentCrime(X)', '~priorNegligent(P)', '~under18AtPriorCrime(P)', '~under18(P)'],
      'recidivist(P,X)', ('t2190', '累犯的概念'), '一般累犯：前罪被判有期徒刑以上，执行完毕或赦免后五年内再犯应判有期徒刑以上之罪；过失犯罪和不满十八周岁的人犯罪的除外'),
    R('k66', 'art66', ['priorSpecialCategoryCrime(P)', 'specialCategoryCrime(X)', 'priorSentenceServedOrPardoned(P)', 'responsible(P,X,C)'], 'recidivist(P,X)',
      ('t2214', '特别累犯'), '危害国家安全、恐怖活动、黑社会性质组织犯罪的犯罪分子，在任何时候再犯上述任一类罪的，都以累犯论处'),
    R('k65-sent', 'art65#1', ['recidivist(P,X)'], SENT('OBL', 'heavier'), ('t2232', '累犯的刑事责任'), '累犯应当从重处罚'),
    R('k74', 'art74', [('or', ['recidivist(P,X)', 'ringleaderOfCriminalGroup(P,X)'])], SENT('FOR', 'probation'), ('t2242', '不适用缓刑'),
      '对于累犯和犯罪集团的首要分子，不适用缓刑'),
    R('k81-2', 'art81#2', [('or', ['recidivist(P,X)', 'violentListedCrime(X) sentenced10YearsOrMore(P,X)'])], SENT('FOR', 'parole'), ('t2731', '限制条件'),
      '对累犯以及因故意杀人、强奸、抢劫、绑架、放火、爆炸、投放危险物质或有组织的暴力性犯罪被判处十年以上有期徒刑、无期徒刑的，不得假释'),
    R('k81-1', 'art81#1', ['servedHalfOrThirteenYears(P,X)', 'abidesPrisonRules(P)', 'showsRepentance(P)', 'noRiskOfReoffending(P)'], SENT('PERM', 'parole'),
      ('t2712', '对象条件'), '执行原判刑期二分之一以上（无期徒刑实际执行十三年以上），确有悔改表现，没有再犯罪危险的，可以假释'),
    R('k67-1', 'art67#1', ['surrendersVoluntarily(P,X)', 'confessesTruthfully(P,X)'], 'surrender(P,X)', ('t2255', '一般自首'),
      '犯罪以后自动投案，如实供述自己的罪行的，是自首'),
    R('k67-2', 'art67#2', ['underCoerciveMeasureOrServing(P)', 'confessesOtherCrimeUnknownToAuthorities(P,X)'], 'surrender(P,X)', ('t2300', '特别自首'),
      '被采取强制措施的犯罪嫌疑人、被告人和正在服刑的罪犯，如实供述司法机关还未掌握的本人其他罪行的，以自首论'),
    R('k67-1s', 'art67#1', ['surrender(P,X)', 'responsible(P,X,C)'], SENT('PERM', 'lighterOrReduced'), ('t2369', '自首情节'),
      '对于自首的犯罪分子，可以从轻或者减轻处罚'),
    R('k67-1e', 'art67#1', ['surrender(P,X)', 'responsible(P,X,C)', 'minorCrime(X)'], SENT('PERM', 'exempt'), ('t2369', '自首情节'),
      '犯罪较轻的，可以免除处罚'),
    R('k67-3', 'art67#3', ['confessesTruthfully(P,X)', 'responsible(P,X,C)', '~surrender(P,X)'], 'confession(P,X)',
      ('t2344', '坦白'), '不具有自首情节，但如实供述自己罪行的，是坦白'),
    R('k67-3s', 'art67#3', ['confession(P,X)'], SENT('PERM', 'lighter'), ('t2344', '坦白'), '坦白的，可以从轻处罚'),
    R('k67-3b', 'art67#3', ['confession(P,X)', 'avertedEspeciallySeriousConsequence(P,X)'], SENT('PERM', 'reduced'), ('t2344', '坦白'),
      '因如实供述避免特别严重后果发生的，可以减轻处罚'),
    R('k68', 'art68', ['meritoriousService(P)', 'responsible(P,X,C)'], SENT('PERM', 'lighterOrReduced'), ('t2378', '立功'),
      '有揭发他人犯罪行为查证属实等立功表现的，可以从轻或者减轻处罚'),
    R('k68-major', 'art68', ['majorMeritoriousService(P)', 'responsible(P,X,C)'], SENT('PERM', 'reducedOrExempt'), ('t2378', '立功'),
      '有重大立功表现的，可以减轻或者免除处罚'),
    R('k72', 'art72#1', ['sentencedDetentionOrUpTo3Years(P,X)', 'lightCircumstances(X)', 'showsRepentance(P)', 'noRiskOfReoffending(P)',
                         'noMajorAdverseCommunityImpact(P)'], SENT('PERM', 'probation'), ('t2527', '缓刑的适用条件'),
      '被判处拘役、三年以下有期徒刑，同时符合情节较轻、有悔罪表现、没有再犯罪危险、对社区无重大不良影响的，可以宣告缓刑'),
    R('k72-must', 'art72#1', ['sentencedDetentionOrUpTo3Years(P,X)', 'lightCircumstances(X)', 'showsRepentance(P)', 'noRiskOfReoffending(P)',
                              'noMajorAdverseCommunityImpact(P)', ('or', ['under18(P)', 'pregnant(P)', 'age75plus(P)'])], SENT('OBL', 'probation'),
      ('t2527', '缓刑的适用条件'), '其中不满十八周岁的人、怀孕的妇女和已满七十五周岁的人，应当宣告缓刑'),
])

# ════════ 五、追诉时效（第87–89条）
TIERS = [('under5', 'y5', '法定最高刑为不满五年有期徒刑的，经过五年'), ('from5to10', 'y10', '五年以上不满十年的，经过十年'),
         ('from10', 'y15', '十年以上有期徒刑的，经过十五年'), ('lifeOrDeath', 'y20', '无期徒刑、死刑的，经过二十年')]
MODULES['k-limitation'] = ('追诉时效', [
    *[R(f'k87-{t}', 'art87', ['maxStatutoryPenalty(X,%s)' % t, 'elapsedAtLeast(X,%s)' % y] + (['~sppApprovedProsecution(X)'] if t == 'lifeOrDeath' else []),
        'timeBarred(X)',
        ('t2819', '追诉期限'), f'犯罪经过下列期限不再追诉：{d}') for t, y, d in TIERS],
    R('k88-1', 'art88#1', ['caseFiledOrAccepted(X)', 'evadesInvestigationOrTrial(P,X)'], '-timeBarred(X)', ('t2845', '时效延长'),
      '立案侦查或者法院受理案件以后，逃避侦查或者审判的，不受追诉期限的限制'),
    R('k88-2', 'art88#2', ['victimComplainedWithinPeriod(X)', 'authoritiesFailedToFileCase(X)'], '-timeBarred(X)', ('t2845', '时效延长'),
      '被害人在追诉期限内提出控告，应当立案而不予立案的，不受追诉期限的限制'),
    R('k87-noProsec', 'art87', ['timeBarred(X)', 'responsible(P,X,C)'], 'notProsecuted(P,X)', ('t2819', '追诉期限'), '超过追诉期限的，不再追诉'),
])

# ════════ 六、分则：财产犯罪、交通犯罪、侵犯人身、贪污贿赂
MODULES['k-offenses'] = ('分则常见罪名', [
    R('k264', 'art264', ['takesSecretly(P,X)', 'illegalPossessionPurpose(P,X)', ('or', ['amountRelativelyLarge(X)', 'multipleTheft(P,X)', 'burglaryOfHome(X)',
                                                                                        'carryingWeapon(P,X)', 'pickpocketing(X)'])],
      'constitutes(P,X,theft)', ('t6951', '盗窃罪'), '盗窃公私财物，数额较大，或者多次盗窃、入户盗窃、携带凶器盗窃、扒窃的'),
    R('k266', 'art266', ['deceives(P,X)', 'victimDisposesUnderMistake(X)', 'illegalPossessionPurpose(P,X)', 'amountRelativelyLarge(X)'],
      'constitutes(P,X,fraud)', ('t7065', '诈骗罪'), '诈骗公私财物，数额较大的（虚构事实→陷入错误→基于错误处分财产）'),
    R('k267', 'art267#1', ['snatchesOpenly(P,X)', 'illegalPossessionPurpose(P,X)', ('or', ['amountRelativelyLarge(X)', 'multipleSnatching(P,X)'])],
      'constitutes(P,X,snatching)', ('t7028', '抢夺罪'), '抢夺公私财物，数额较大的，或者多次抢夺的'),
    R('k263', 'art263', ['violenceOrCoercion(P,X)', 'takesProperty(P,X)', 'illegalPossessionPurpose(P,X)'], 'constitutes(P,X,robbery)', ('t6763', '抢劫罪'),
      '以暴力、胁迫或者其他方法抢劫财物的'),
    R('k263-agg', 'art263', ['convicted(P,X,robbery)', ('or', ['inHome(X)', 'onPublicTransport(X)', 'targetsBankOrFinancialInstitution(X)',
                                                               'multipleRobberyOrHugeAmount(P,X)', 'causesGraveInjuryOrDeath(X)', 'impersonatesMilitaryOrPolice(P,X)',
                                                               'armedWithGun(P,X)', 'militaryOrReliefSupplies(X)'])],
      'aggravatedRobbery(P,X)', ('t6763', '抢劫罪'), '入户、在公共交通工具上、抢劫银行、多次或数额巨大、致人重伤死亡、冒充军警、持枪、抢劫军用或救灾物资：十年以上、无期或死刑'),
    R('k267-2', 'art267#2', ['snatchesOpenly(P,X)', 'illegalPossessionPurpose(P,X)', 'carryingWeapon(P,X)'], 'constitutes(P,X,robbery)', ('t7058', '携带凶器抢夺'),
      '携带凶器抢夺的，依照第二百六十三条（抢劫罪）定罪处罚'),
    R('k269', 'art269', [('or', ['constitutes(P,X,theft)', 'constitutes(P,X,fraud)', 'constitutes(P,X,snatching)']), 'violenceOnTheSpot(P,X)',
                         ('or', ['toKeepLoot(P,X)', 'toResistArrest(P,X)', 'toDestroyEvidence(P,X)'])],
      ['convertedRobbery(P,X)', 'constitutes(P,X,robbery)'], ('t6869', '转化型抢劫'),
      '犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚'),
    R('k-minor-conv', 'spc-minor10', ['convertedRobbery(P,X)', 'age14to16(P)', 'violenceOnTheSpot(P,X)', 'causesGraveInjuryOrDeath(X)'],
      'constitutes(P,X,intentionalInjury)', ('t0577', '已满14周岁不满16周岁的人盗窃'),
      '已满十四不满十六周岁的人盗窃、诈骗、抢夺后当场使用暴力，故意伤害致人重伤或者死亡的，以故意伤害罪定罪处罚，不成立（转化型）抢劫罪', auth='spc'),
    R('k270', 'art270#1', ['entrustedPropertyOf(P,X)', 'illegallyAppropriates(P,X)', 'amountRelativelyLarge(X)', 'refusesToReturn(P,X)'],
      'constitutes(P,X,embezzlementOfEntrusted)', ('t7126', '侵占罪'), '将代为保管的他人财物非法占为己有，数额较大，拒不退还的'),
    R('k270-2', 'art270#2', [('or', ['forgottenProperty(X)', 'buriedProperty(X)']), 'illegallyAppropriates(P,X)', 'amountRelativelyLarge(X)', 'refusesToHandOver(P,X)'],
      'constitutes(P,X,embezzlementOfEntrusted)', ('t7126', '侵占罪'), '将他人的遗忘物或者埋藏物非法占为己有，数额较大，拒不交出的'),
    R('k270-3', 'art270#3', ['convicted(P,X,embezzlementOfEntrusted)'], 'prosecutedOnlyUponComplaint(P,X)', ('t7126', '侵占罪'), '本条罪，告诉的才处理'),
    R('k274', 'art274', ['threatensOrBlackmails(P,X)', 'victimHandsOverOutOfFear(X)', ('or', ['amountRelativelyLarge(X)', 'multipleExtortion(P,X)'])],
      'constitutes(P,X,extortion)', ('t7237', '敲诈勒索罪'), '敲诈勒索公私财物，数额较大或者多次敲诈勒索的'),
    R('k271', 'art271#1', ['employeeOfUnit(P,X)', 'usesPosition(P,X)', 'appropriatesUnitProperty(P,X)', 'amountRelativelyLarge(X)', '~stateFunctionary(P)'],
      'constitutes(P,X,occupationalEmbezzlement)', ('t7175', '职务侵占罪'), '单位工作人员利用职务便利，将本单位财物非法占为己有，数额较大的'),
    R('k382', 'art382#1', ['stateFunctionary(P)', 'usesPosition(P,X)', 'appropriatesPublicProperty(P,X)'], 'constitutes(P,X,corruption)', ('t8915', '贪污罪'),
      '国家工作人员利用职务上的便利，侵吞、窃取、骗取或者以其他手段非法占有公共财物的，是贪污罪'),
    R('k382-2', 'art382#2', ['entrustedToManageStateAssets(P)', 'usesPosition(P,X)', 'appropriatesPublicProperty(P,X)'], 'constitutes(P,X,corruption)',
      ('t8915', '贪污罪'), '受国家机关、国有单位委托管理、经营国有财产的人员，利用职务便利非法占有国有财物的，以贪污论'),
    R('k382-3', 'art382#3', ['colludesWith(P,Q,X)', 'constitutes(Q,X,corruption)'], 'constitutes(P,X,corruption)', ('t8915', '贪污罪'),
      '与前两款所列人员勾结，伙同贪污的，以共犯论处'),
    R('k271-2', 'art271#2', ['employeeOfUnit(P,X)', 'usesPosition(P,X)', 'appropriatesUnitProperty(P,X)', 'stateFunctionary(P)'], 'constitutes(P,X,corruption)',
      ('t7175', '职务侵占罪'), '国有单位中从事公务的人员有前款行为的，依照贪污罪定罪处罚'),
    R('k385', 'art385#1', ['stateFunctionary(P)', 'usesPosition(P,X)', ('or', ['solicitsProperty(P,X)', 'acceptsProperty(P,X) seeksBenefitForGiver(P,X)'])],
      'constitutes(P,X,bribeTaking)', ('t9086', '受贿罪'), '国家工作人员利用职务上的便利，索取他人财物，或者非法收受他人财物、为他人谋取利益的，是受贿罪'),
    R('k389', 'art389#1', ['givesPropertyToFunctionary(P,X)', 'seeksImproperBenefit(P,X)'], 'constitutes(P,X,bribeGiving)', ('t9232', '行贿罪'),
      '为谋取不正当利益，给予国家工作人员以财物的，是行贿罪'),
    R('k389-3', 'art389#3', ['givesPropertyToFunctionary(P,X)', 'extortedByFunctionary(P,X)', '~obtainedImproperBenefit(P,X)'], '-constitutes(P,X,bribeGiving)',
      ('t9236', '被勒索'), '因被勒索给予国家工作人员以财物，没有获得不正当利益的，不是行贿'),
    R('k390-3', 'art390#3', ['convicted(P,X,bribeGiving)', 'confessesBeforeProsecution(P,X)'], SENT('PERM', 'lighterOrReduced'), ('t9232', '行贿罪'),
      '行贿人在被追诉前主动交待行贿行为的，可以从轻或者减轻处罚'),
    R('k232', 'art232', ['intentionallyKills(P,X)'], 'constitutes(P,X,intentionalHomicide)', ('t5656', '故意杀人罪'), '故意杀人的'),
    R('k234', 'art234#1', ['intentionallyInjures(P,X)'], 'constitutes(P,X,intentionalInjury)', ('t5758', '故意伤害罪'), '故意伤害他人身体的'),
    R('k133', 'art133', ['violatesTrafficRegulations(P,X)', 'majorAccident(X)', ('or', ['causesGraveInjuryOrDeath(X)', 'majorPropertyLoss(X)'])],
      'constitutes(P,X,trafficAccident)', ('t3538', '交通肇事罪'), '违反交通运输管理法规，因而发生重大事故，致人重伤、死亡或者使公私财产遭受重大损失的'),
    R('k133-flee', 'art133', ['convicted(P,X,trafficAccident)', 'fleesAfterAccident(P,X)'], 'trafficAccidentFleeing(P,X)', ('t3569', '逃逸'),
      '交通运输肇事后逃逸：处三年以上七年以下有期徒刑'),
    R('k133-fleedeath', 'art133', ['convicted(P,X,trafficAccident)', 'fleesAfterAccident(P,X)', 'victimDiesBecauseOfFleeing(X)'], 'trafficAccidentFleeingDeath(P,X)',
      ('t3574', '因逃逸致人死亡'), '因逃逸致人死亡的，处七年以上有期徒刑'),
    R('k133-1', 'art133-1#1', ['drivesMotorVehicleOnRoad(P,X)', ('or', ['racingSerious(P,X)', 'drunkDriving(P,X)', 'seriousOverloadOrSpeeding(P,X)',
                                                                   'illegalHazardousTransport(P,X)'])],
      'constitutes(P,X,dangerousDriving)', ('t3621', '危险驾驶罪'), '在道路上驾驶机动车，追逐竞驶情节恶劣、醉酒驾驶、校车或客运严重超员超速、违规运输危险化学品的'),
    # —— 由构成与责任得出定罪 ——
    R('k-convict', ['art3'], ['constitutes(P,X,C)', 'responsible(P,X,C)', '~notProsecuted(P,X)'], 'convicted(P,X,C)', ('t0281', '犯罪构成'),
      '符合构成要件且负刑事责任、未过追诉时效的，以该罪定罪（罪刑法定，第3条）', auth='doctrine'),
    R('k-conv-absorb', 'art269', [('or', ['constitutes(P,X,theft)', 'constitutes(P,X,fraud)', 'constitutes(P,X,snatching)']), 'convertedRobbery(P,X)',
                                  'age16plus(P)'],
      ['-convicted(P,X,theft)', '-convicted(P,X,fraud)', '-convicted(P,X,snatching)'], ('t6869', '转化型抢劫'),
      '转化为抢劫的，以抢劫罪一罪论处，不再另定盗窃、诈骗、抢夺罪', auth='doctrine'),
])

OVERRIDES = [
    ('k18-1', 'k17-1', '精神病人不负刑事责任优先'),
    *[('k18-1', f'k17-2-{c}', '精神病人不负刑事责任优先') for c in GRAVE14],
    ('k18-1', 'k17-3', '精神病人不负刑事责任优先'),
    ('k20-1', 'k17-1', '正当防卫阻却'), ('k20-3', 'k17-1', '特别防卫阻却'),
    *[(a, f'k17-2-{c}', '正当化事由阻却') for a in ('k20-1', 'k20-3', 'k21-1') for c in GRAVE14],
    ('k21-1', 'k17-1', '紧急避险阻却'),
    ('k20-late', 'k20-cond', '事后防卫不具备时间条件'),
    ('k389-3', 'k389', '被勒索且未获不正当利益的，不是行贿'),
    ('k88-1', 'k87-under5', '逃避侦查审判'), ('k88-1', 'k87-from5to10', '逃避侦查审判'), ('k88-1', 'k87-from10', '逃避侦查审判'), ('k88-1', 'k87-lifeOrDeath', '逃避侦查审判'),
    ('k88-2', 'k87-under5', '应立案不立案'), ('k88-2', 'k87-from5to10', '应立案不立案'), ('k88-2', 'k87-from10', '应立案不立案'), ('k88-2', 'k87-lifeOrDeath', '应立案不立案'),
    ('k-conv-absorb', 'k-convict', '转化抢劫吸收前罪'),
    ('k74', 'k72', '累犯、首要分子不适用缓刑'), ('k74', 'k72-must', '累犯、首要分子不适用缓刑'),
    ('k81-2', 'k81-1', '累犯及严重暴力犯罪长刑犯不得假释'),
    ('k24-noAttempt', 'k23', '自动放弃的不是未遂'),
]

ZH = {
    'constitutes': '符合构成要件', 'responsible': '负刑事责任', 'convicted': '定罪', 'sentence': '量刑', 'age16plus': '已满十六周岁', 'adult': '已满十八周岁',
    'age16to18': '已满十六不满十八周岁', 'age14to16': '已满十四不满十六周岁', 'age12to14': '已满十二不满十四周岁', 'under18': '不满十八周岁',
    'age75plus': '已满七十五周岁', 'causesGraveInjuryOrDeath': '致人重伤或者死亡', 'causesDeath': '致人死亡', 'especiallyCruelGraveDisability': '特别残忍手段致人重伤造成严重残疾',
    'heinous': '情节恶劣', 'sppApprovedProsecution': '经最高人民检察院核准追诉', 'intentionalCrime': '故意犯罪', 'negligentCrime': '过失犯罪',
    'mentallyIll': '精神病人', 'unableToRecognizeOrControlAtTime': '行为时不能辨认或控制自己行为', 'forensicallyCertified': '经法定程序鉴定确认',
    'partiallyImpairedCapacity': '尚未完全丧失辨认或控制能力', 'deafAndMute': '又聋又哑', 'blind': '盲人',
    'defensiveAct': '防卫行为', 'ongoingUnlawfulAttack': '不法侵害正在进行', 'harmToAttacker': '损害针对不法侵害人', 'defensiveIntent': '防卫意图',
    'defenseConditions': '具备正当防卫条件', 'justifiedDefense': '正当防卫', 'excessiveDefense': '防卫过当', 'obviouslyExceedsNecessity': '明显超过必要限度',
    'causesSeriousHarm': '造成重大损害', 'violentCrimeEndangeringLife': '行凶、杀人、抢劫、强奸、绑架等严重危及人身安全的暴力犯罪',
    'attackAlreadyEnded': '不法侵害已经结束', 'avertsDanger': '避险行为', 'ongoingDanger': '危险正在发生', 'noOtherMeans': '不得已',
    'harmsThirdPartyInterest': '损害另一合法权益', 'specialDutyToFaceOwnDanger': '职务、业务上负有特定责任（避免本人危险）', 'necessityConditions': '具备紧急避险条件',
    'justifiedNecessity': '紧急避险', 'excessiveNecessity': '避险过当', 'exceedsNecessityUndueHarm': '超过必要限度造成不应有的损害',
    'preparedToolsOrConditions': '准备工具、制造条件', 'commencedExecution': '已着手实行', 'voluntarilyAbandoned': '自动放弃或自动有效防止结果',
    'notAccomplished': '未得逞', 'preparation': '犯罪预备', 'attempt': '犯罪未遂', 'discontinuance': '犯罪中止', 'causedDamage': '造成损害',
    'accessoryRole': '起次要或辅助作用', 'coercedToParticipate': '被胁迫参加犯罪', 'instigates': '教唆', 'instigatedDidNotCommit': '被教唆的人没有犯被教唆的罪',
    'priorSentenceFixedTermOrAbove': '前罪被判处有期徒刑以上刑罚', 'within5YearsAfterRelease': '刑罚执行完毕或赦免后五年内',
    'newCrimeDeservesFixedTerm': '后罪应当判处有期徒刑以上刑罚', 'priorNegligent': '前罪为过失犯罪', 'under18AtPriorCrime': '犯前罪时不满十八周岁',
    'recidivist': '累犯', 'priorSpecialCategoryCrime': '前罪为危害国家安全/恐怖活动/黑社会性质组织犯罪', 'specialCategoryCrime': '后罪为上述三类犯罪',
    'priorSentenceServedOrPardoned': '前罪刑罚执行完毕或赦免', 'ringleaderOfCriminalGroup': '犯罪集团的首要分子', 'violentListedCrime': '故意杀人、强奸、抢劫等暴力性犯罪',
    'sentenced10YearsOrMore': '被判处十年以上有期徒刑、无期徒刑', 'surrendersVoluntarily': '自动投案', 'confessesTruthfully': '如实供述自己的罪行',
    'surrender': '自首', 'underCoerciveMeasureOrServing': '被采取强制措施或正在服刑', 'confessesOtherCrimeUnknownToAuthorities': '如实供述司法机关未掌握的本人其他罪行',
    'minorCrime': '犯罪较轻', 'confession': '坦白', 'avertedEspeciallySeriousConsequence': '避免特别严重后果发生', 'meritoriousService': '立功',
    'majorMeritoriousService': '重大立功', 'sentencedDetentionOrUpTo3Years': '被判处拘役或三年以下有期徒刑', 'lightCircumstances': '犯罪情节较轻',
    'showsRepentance': '有悔罪表现', 'noRiskOfReoffending': '没有再犯罪的危险', 'noMajorAdverseCommunityImpact': '对社区没有重大不良影响', 'pregnant': '怀孕的妇女',
    'maxStatutoryPenalty': '法定最高刑', 'elapsedAtLeast': '已经过', 'timeBarred': '超过追诉期限', 'caseFiledOrAccepted': '已立案侦查或法院已受理',
    'evadesInvestigationOrTrial': '逃避侦查或者审判', 'victimComplainedWithinPeriod': '被害人在追诉期限内提出控告', 'authoritiesFailedToFileCase': '应当立案而不予立案',
    'notProsecuted': '不再追诉', 'takesSecretly': '秘密窃取', 'illegalPossessionPurpose': '以非法占有为目的', 'amountRelativelyLarge': '数额较大',
    'multipleTheft': '多次盗窃', 'burglaryOfHome': '入户盗窃', 'carryingWeapon': '携带凶器', 'pickpocketing': '扒窃', 'deceives': '虚构事实或隐瞒真相',
    'victimDisposesUnderMistake': '被害人基于错误认识处分财产', 'snatchesOpenly': '公然夺取', 'multipleSnatching': '多次抢夺', 'violenceOrCoercion': '暴力、胁迫或其他方法',
    'takesProperty': '劫取财物', 'aggravatedRobbery': '抢劫的加重情节（十年以上）', 'convertedRobbery': '转化型抢劫', 'violenceOnTheSpot': '当场使用暴力或以暴力相威胁',
    'toKeepLoot': '为窝藏赃物', 'toResistArrest': '为抗拒抓捕', 'toDestroyEvidence': '为毁灭罪证', 'entrustedPropertyOf': '代为保管他人财物',
    'illegallyAppropriates': '非法占为己有', 'refusesToReturn': '拒不退还', 'refusesToHandOver': '拒不交出', 'forgottenProperty': '遗忘物', 'buriedProperty': '埋藏物',
    'prosecutedOnlyUponComplaint': '告诉的才处理', 'threatensOrBlackmails': '威胁或要挟', 'victimHandsOverOutOfFear': '被害人基于恐惧交付财物',
    'employeeOfUnit': '单位工作人员', 'usesPosition': '利用职务上的便利', 'appropriatesUnitProperty': '非法占有本单位财物', 'stateFunctionary': '国家工作人员',
    'appropriatesPublicProperty': '非法占有公共财物', 'entrustedToManageStateAssets': '受委托管理、经营国有财产', 'colludesWith': '勾结、伙同',
    'solicitsProperty': '索取他人财物', 'acceptsProperty': '非法收受他人财物', 'seeksBenefitForGiver': '为他人谋取利益',
    'givesPropertyToFunctionary': '给予国家工作人员财物', 'seeksImproperBenefit': '为谋取不正当利益', 'extortedByFunctionary': '被索要（被勒索）',
    'obtainedImproperBenefit': '获得了不正当利益', 'confessesBeforeProsecution': '被追诉前主动交待', 'intentionallyKills': '故意杀人', 'intentionallyInjures': '故意伤害他人身体',
    'violatesTrafficRegulations': '违反交通运输管理法规', 'majorAccident': '发生重大事故', 'majorPropertyLoss': '公私财产遭受重大损失',
    'fleesAfterAccident': '肇事后逃逸', 'victimDiesBecauseOfFleeing': '因逃逸致人死亡（被害人得不到救助而死亡）', 'trafficAccidentFleeing': '交通肇事后逃逸（3-7年）',
    'trafficAccidentFleeingDeath': '因逃逸致人死亡（7年以上）', 'drivesMotorVehicleOnRoad': '在道路上驾驶机动车', 'racingSerious': '追逐竞驶情节恶劣',
    'drunkDriving': '醉酒驾驶', 'seriousOverloadOrSpeeding': '校车/客运严重超员超速', 'illegalHazardousTransport': '违规运输危险化学品危及公共安全',
    'inHome': '入户', 'onPublicTransport': '在公共交通工具上', 'targetsBankOrFinancialInstitution': '抢劫银行或其他金融机构',
    'multipleRobberyOrHugeAmount': '多次抢劫或数额巨大', 'impersonatesMilitaryOrPolice': '冒充军警人员', 'armedWithGun': '持枪',
    'militaryOrReliefSupplies': '军用物资或抢险救灾救济物资', 'servedHalfOrThirteenYears': '已执行原判刑期二分之一以上（无期实际执行十三年以上）',
    'abidesPrisonRules': '认真遵守监规',
}
CHARGE_ZH = {'theft': '盗窃罪', 'fraud': '诈骗罪', 'snatching': '抢夺罪', 'robbery': '抢劫罪', 'intentionalInjury': '故意伤害罪', 'intentionalHomicide': '故意杀人罪',
             'rape': '强奸罪', 'drugTrafficking': '贩卖毒品罪', 'arson': '放火罪', 'explosion': '爆炸罪', 'poisoning': '投放危险物质罪',
             'embezzlementOfEntrusted': '侵占罪', 'extortion': '敲诈勒索罪', 'occupationalEmbezzlement': '职务侵占罪', 'corruption': '贪污罪',
             'bribeTaking': '受贿罪', 'bribeGiving': '行贿罪', 'trafficAccident': '交通肇事罪', 'dangerousDriving': '危险驾驶罪'}
