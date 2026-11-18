% 由 lrml2ddl.py 从 civil_graph.lrml 生成。配合 ddl_engine/language.asp + Deontic/defeasible-ab.asp + Deontic/deontic.asp 使用。
isNon(non(A)) :- fact(non(A)).
cand(A) :- fact(A), not isNon(A).
cand(A) :- fact(non(A)).
atom(A) :- cand(A).
true.

% tx-t0016[0.0] 分类（自动抽取自图的层级）：附属刑法 ⊑ 广义刑法
inst(r("tx-t0016",0,0,(X,))) :- cand(isA(X,"附属刑法")).
constitutiveRule(r("tx-t0016",0,0,(X,)),isA(X,"广义刑法")) :- inst(r("tx-t0016",0,0,(X,))).
mainHead(r("tx-t0016",0,0,(X,)),constitutiveRule,isA(X,"广义刑法")) :- inst(r("tx-t0016",0,0,(X,))).
cand(isA(X,"广义刑法")) :- inst(r("tx-t0016",0,0,(X,))).
body(r("tx-t0016",0,0,(X,)),isA(X,"附属刑法")) :- inst(r("tx-t0016",0,0,(X,))).

% tx-t0018[0.0] 分类（自动抽取自图的层级）：特别刑法 ⊑ 广义刑法
inst(r("tx-t0018",0,0,(X,))) :- cand(isA(X,"特别刑法")).
constitutiveRule(r("tx-t0018",0,0,(X,)),isA(X,"广义刑法")) :- inst(r("tx-t0018",0,0,(X,))).
mainHead(r("tx-t0018",0,0,(X,)),constitutiveRule,isA(X,"广义刑法")) :- inst(r("tx-t0018",0,0,(X,))).
cand(isA(X,"广义刑法")) :- inst(r("tx-t0018",0,0,(X,))).
body(r("tx-t0018",0,0,(X,)),isA(X,"特别刑法")) :- inst(r("tx-t0018",0,0,(X,))).

% tx-t0085[0.0] 分类（自动抽取自图的层级）：目的解释 ⊑ 论理解释
inst(r("tx-t0085",0,0,(X,))) :- cand(isA(X,"目的解释")).
constitutiveRule(r("tx-t0085",0,0,(X,)),isA(X,"论理解释")) :- inst(r("tx-t0085",0,0,(X,))).
mainHead(r("tx-t0085",0,0,(X,)),constitutiveRule,isA(X,"论理解释")) :- inst(r("tx-t0085",0,0,(X,))).
cand(isA(X,"论理解释")) :- inst(r("tx-t0085",0,0,(X,))).
body(r("tx-t0085",0,0,(X,)),isA(X,"目的解释")) :- inst(r("tx-t0085",0,0,(X,))).

% tx-t0090[0.0] 分类（自动抽取自图的层级）：扩大解释 ⊑ 论理解释
inst(r("tx-t0090",0,0,(X,))) :- cand(isA(X,"扩大解释")).
constitutiveRule(r("tx-t0090",0,0,(X,)),isA(X,"论理解释")) :- inst(r("tx-t0090",0,0,(X,))).
mainHead(r("tx-t0090",0,0,(X,)),constitutiveRule,isA(X,"论理解释")) :- inst(r("tx-t0090",0,0,(X,))).
cand(isA(X,"论理解释")) :- inst(r("tx-t0090",0,0,(X,))).
body(r("tx-t0090",0,0,(X,)),isA(X,"扩大解释")) :- inst(r("tx-t0090",0,0,(X,))).

% tx-t0093[0.0] 分类（自动抽取自图的层级）：缩小解释 ⊑ 论理解释
inst(r("tx-t0093",0,0,(X,))) :- cand(isA(X,"缩小解释")).
constitutiveRule(r("tx-t0093",0,0,(X,)),isA(X,"论理解释")) :- inst(r("tx-t0093",0,0,(X,))).
mainHead(r("tx-t0093",0,0,(X,)),constitutiveRule,isA(X,"论理解释")) :- inst(r("tx-t0093",0,0,(X,))).
cand(isA(X,"论理解释")) :- inst(r("tx-t0093",0,0,(X,))).
body(r("tx-t0093",0,0,(X,)),isA(X,"缩小解释")) :- inst(r("tx-t0093",0,0,(X,))).

% tx-t0094[0.0] 分类（自动抽取自图的层级）：当然解释 ⊑ 论理解释
inst(r("tx-t0094",0,0,(X,))) :- cand(isA(X,"当然解释")).
constitutiveRule(r("tx-t0094",0,0,(X,)),isA(X,"论理解释")) :- inst(r("tx-t0094",0,0,(X,))).
mainHead(r("tx-t0094",0,0,(X,)),constitutiveRule,isA(X,"论理解释")) :- inst(r("tx-t0094",0,0,(X,))).
cand(isA(X,"论理解释")) :- inst(r("tx-t0094",0,0,(X,))).
body(r("tx-t0094",0,0,(X,)),isA(X,"当然解释")) :- inst(r("tx-t0094",0,0,(X,))).

% tx-t0097[0.0] 分类（自动抽取自图的层级）：比较解释 ⊑ 论理解释
inst(r("tx-t0097",0,0,(X,))) :- cand(isA(X,"比较解释")).
constitutiveRule(r("tx-t0097",0,0,(X,)),isA(X,"论理解释")) :- inst(r("tx-t0097",0,0,(X,))).
mainHead(r("tx-t0097",0,0,(X,)),constitutiveRule,isA(X,"论理解释")) :- inst(r("tx-t0097",0,0,(X,))).
cand(isA(X,"论理解释")) :- inst(r("tx-t0097",0,0,(X,))).
body(r("tx-t0097",0,0,(X,)),isA(X,"比较解释")) :- inst(r("tx-t0097",0,0,(X,))).

% tx-t0098[0.0] 分类（自动抽取自图的层级）：历史解释 ⊑ 论理解释
inst(r("tx-t0098",0,0,(X,))) :- cand(isA(X,"历史解释")).
constitutiveRule(r("tx-t0098",0,0,(X,)),isA(X,"论理解释")) :- inst(r("tx-t0098",0,0,(X,))).
mainHead(r("tx-t0098",0,0,(X,)),constitutiveRule,isA(X,"论理解释")) :- inst(r("tx-t0098",0,0,(X,))).
cand(isA(X,"论理解释")) :- inst(r("tx-t0098",0,0,(X,))).
body(r("tx-t0098",0,0,(X,)),isA(X,"历史解释")) :- inst(r("tx-t0098",0,0,(X,))).

% tx-t0100[0.0] 分类（自动抽取自图的层级）：扩大解释VS类推解释 ⊑ 论理解释
inst(r("tx-t0100",0,0,(X,))) :- cand(isA(X,"扩大解释VS类推解释")).
constitutiveRule(r("tx-t0100",0,0,(X,)),isA(X,"论理解释")) :- inst(r("tx-t0100",0,0,(X,))).
mainHead(r("tx-t0100",0,0,(X,)),constitutiveRule,isA(X,"论理解释")) :- inst(r("tx-t0100",0,0,(X,))).
cand(isA(X,"论理解释")) :- inst(r("tx-t0100",0,0,(X,))).
body(r("tx-t0100",0,0,(X,)),isA(X,"扩大解释VS类推解释")) :- inst(r("tx-t0100",0,0,(X,))).

% k-convict[0.0] 符合构成要件且负刑事责任、未过追诉时效的，以该罪定罪（罪刑法定，第3条）（第3条；doctrine）
inst(r("k-convict",0,0,(C,P,X,))) :- cand(constitutes(P,X,C)), cand(responsible(P,X,C)).
constitutiveRule(r("k-convict",0,0,(C,P,X,)),convicted(P,X,C)) :- inst(r("k-convict",0,0,(C,P,X,))).
mainHead(r("k-convict",0,0,(C,P,X,)),constitutiveRule,convicted(P,X,C)) :- inst(r("k-convict",0,0,(C,P,X,))).
cand(convicted(P,X,C)) :- inst(r("k-convict",0,0,(C,P,X,))).
body(r("k-convict",0,0,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k-convict",0,0,(C,P,X,))).
body(r("k-convict",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k-convict",0,0,(C,P,X,))).
inst(x("k-convict",0,0,0,(C,P,X,))) :- inst(r("k-convict",0,0,(C,P,X,))), cand(notProsecuted(P,X)).
constitutiveRule(x("k-convict",0,0,0,(C,P,X,)),non(convicted(P,X,C))) :- inst(x("k-convict",0,0,0,(C,P,X,))).
body(x("k-convict",0,0,0,(C,P,X,)),constitutes(P,X,C)) :- inst(x("k-convict",0,0,0,(C,P,X,))).
body(x("k-convict",0,0,0,(C,P,X,)),responsible(P,X,C)) :- inst(x("k-convict",0,0,0,(C,P,X,))).
body(x("k-convict",0,0,0,(C,P,X,)),notProsecuted(P,X)) :- inst(x("k-convict",0,0,0,(C,P,X,))).
superior(x("k-convict",0,0,0,(C,P,X,)),r("k-convict",0,0,(C,P,X,))) :- inst(x("k-convict",0,0,0,(C,P,X,))).
exc(x("k-convict",0,0,0,(C,P,X,)),r("k-convict",0,0,(C,P,X,)),constitutiveRule,convicted(P,X,C)) :- inst(x("k-convict",0,0,0,(C,P,X,))).

% tx-t0541[0.0] 分类（自动抽取自图的层级）：所谓辨认能力 ⊑ 辨认和控制自己行为的能力
inst(r("tx-t0541",0,0,(X,))) :- cand(isA(X,"所谓辨认能力")).
constitutiveRule(r("tx-t0541",0,0,(X,)),isA(X,"辨认和控制自己行为的能力")) :- inst(r("tx-t0541",0,0,(X,))).
mainHead(r("tx-t0541",0,0,(X,)),constitutiveRule,isA(X,"辨认和控制自己行为的能力")) :- inst(r("tx-t0541",0,0,(X,))).
cand(isA(X,"辨认和控制自己行为的能力")) :- inst(r("tx-t0541",0,0,(X,))).
body(r("tx-t0541",0,0,(X,)),isA(X,"所谓辨认能力")) :- inst(r("tx-t0541",0,0,(X,))).

% tx-t0543[0.0] 分类（自动抽取自图的层级）：所谓控制能力 ⊑ 辨认和控制自己行为的能力
inst(r("tx-t0543",0,0,(X,))) :- cand(isA(X,"所谓控制能力")).
constitutiveRule(r("tx-t0543",0,0,(X,)),isA(X,"辨认和控制自己行为的能力")) :- inst(r("tx-t0543",0,0,(X,))).
mainHead(r("tx-t0543",0,0,(X,)),constitutiveRule,isA(X,"辨认和控制自己行为的能力")) :- inst(r("tx-t0543",0,0,(X,))).
cand(isA(X,"辨认和控制自己行为的能力")) :- inst(r("tx-t0543",0,0,(X,))).
body(r("tx-t0543",0,0,(X,)),isA(X,"所谓控制能力")) :- inst(r("tx-t0543",0,0,(X,))).

% k-age16[0.0] 已满十六周岁（第17条第1款；doctrine）
inst(r("k-age16",0,0,(P,))) :- cand(age16to18(P)).
constitutiveRule(r("k-age16",0,0,(P,)),age16plus(P)) :- inst(r("k-age16",0,0,(P,))).
mainHead(r("k-age16",0,0,(P,)),constitutiveRule,age16plus(P)) :- inst(r("k-age16",0,0,(P,))).
cand(age16plus(P)) :- inst(r("k-age16",0,0,(P,))).
body(r("k-age16",0,0,(P,)),age16to18(P)) :- inst(r("k-age16",0,0,(P,))).
% k-age16[1.0] 已满十六周岁（第17条第1款；doctrine）
inst(r("k-age16",1,0,(P,))) :- cand(adult(P)).
constitutiveRule(r("k-age16",1,0,(P,)),age16plus(P)) :- inst(r("k-age16",1,0,(P,))).
mainHead(r("k-age16",1,0,(P,)),constitutiveRule,age16plus(P)) :- inst(r("k-age16",1,0,(P,))).
cand(age16plus(P)) :- inst(r("k-age16",1,0,(P,))).
body(r("k-age16",1,0,(P,)),adult(P)) :- inst(r("k-age16",1,0,(P,))).

% k-under18[0.0] 不满十八周岁（第17条第4款；doctrine）
inst(r("k-under18",0,0,(P,))) :- cand(age12to14(P)).
constitutiveRule(r("k-under18",0,0,(P,)),under18(P)) :- inst(r("k-under18",0,0,(P,))).
mainHead(r("k-under18",0,0,(P,)),constitutiveRule,under18(P)) :- inst(r("k-under18",0,0,(P,))).
cand(under18(P)) :- inst(r("k-under18",0,0,(P,))).
body(r("k-under18",0,0,(P,)),age12to14(P)) :- inst(r("k-under18",0,0,(P,))).
% k-under18[1.0] 不满十八周岁（第17条第4款；doctrine）
inst(r("k-under18",1,0,(P,))) :- cand(age14to16(P)).
constitutiveRule(r("k-under18",1,0,(P,)),under18(P)) :- inst(r("k-under18",1,0,(P,))).
mainHead(r("k-under18",1,0,(P,)),constitutiveRule,under18(P)) :- inst(r("k-under18",1,0,(P,))).
cand(under18(P)) :- inst(r("k-under18",1,0,(P,))).
body(r("k-under18",1,0,(P,)),age14to16(P)) :- inst(r("k-under18",1,0,(P,))).
% k-under18[2.0] 不满十八周岁（第17条第4款；doctrine）
inst(r("k-under18",2,0,(P,))) :- cand(age16to18(P)).
constitutiveRule(r("k-under18",2,0,(P,)),under18(P)) :- inst(r("k-under18",2,0,(P,))).
mainHead(r("k-under18",2,0,(P,)),constitutiveRule,under18(P)) :- inst(r("k-under18",2,0,(P,))).
cand(under18(P)) :- inst(r("k-under18",2,0,(P,))).
body(r("k-under18",2,0,(P,)),age16to18(P)) :- inst(r("k-under18",2,0,(P,))).

% k17-1[0.0] 已满十六周岁的人犯罪，应当负刑事责任（第17条第1款；npc）
inst(r("k17-1",0,0,(C,P,X,))) :- cand(constitutes(P,X,C)), cand(age16plus(P)).
constitutiveRule(r("k17-1",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k17-1",0,0,(C,P,X,))).
mainHead(r("k17-1",0,0,(C,P,X,)),constitutiveRule,responsible(P,X,C)) :- inst(r("k17-1",0,0,(C,P,X,))).
cand(responsible(P,X,C)) :- inst(r("k17-1",0,0,(C,P,X,))).
body(r("k17-1",0,0,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k17-1",0,0,(C,P,X,))).
body(r("k17-1",0,0,(C,P,X,)),age16plus(P)) :- inst(r("k17-1",0,0,(C,P,X,))).

% k17-2-intentionalHomicide[0.0] 已满十四不满十六周岁，犯故意杀人、故意伤害致人重伤或死亡、强奸、抢劫、贩卖毒品、放火、爆炸、投放危险物质罪的，应当负刑事责任（第17条第2款
inst(r("k17-2-intentionalHomicide",0,0,(P,X,))) :- cand(constitutes(P,X,intentionalHomicide)), cand(age14to16(P)).
constitutiveRule(r("k17-2-intentionalHomicide",0,0,(P,X,)),responsible(P,X,intentionalHomicide)) :- inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).
mainHead(r("k17-2-intentionalHomicide",0,0,(P,X,)),constitutiveRule,responsible(P,X,intentionalHomicide)) :- inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).
cand(responsible(P,X,intentionalHomicide)) :- inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).
body(r("k17-2-intentionalHomicide",0,0,(P,X,)),constitutes(P,X,intentionalHomicide)) :- inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).
body(r("k17-2-intentionalHomicide",0,0,(P,X,)),age14to16(P)) :- inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).

% k17-2-intentionalInjury[0.0] 已满十四不满十六周岁，犯故意杀人、故意伤害致人重伤或死亡、强奸、抢劫、贩卖毒品、放火、爆炸、投放危险物质罪的，应当负刑事责任（第17条第2款
inst(r("k17-2-intentionalInjury",0,0,(P,X,))) :- cand(constitutes(P,X,intentionalInjury)), cand(age14to16(P)), cand(causesGraveInjuryOrDeath(X)).
constitutiveRule(r("k17-2-intentionalInjury",0,0,(P,X,)),responsible(P,X,intentionalInjury)) :- inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
mainHead(r("k17-2-intentionalInjury",0,0,(P,X,)),constitutiveRule,responsible(P,X,intentionalInjury)) :- inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
cand(responsible(P,X,intentionalInjury)) :- inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
body(r("k17-2-intentionalInjury",0,0,(P,X,)),constitutes(P,X,intentionalInjury)) :- inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
body(r("k17-2-intentionalInjury",0,0,(P,X,)),age14to16(P)) :- inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
body(r("k17-2-intentionalInjury",0,0,(P,X,)),causesGraveInjuryOrDeath(X)) :- inst(r("k17-2-intentionalInjury",0,0,(P,X,))).

% k17-2-rape[0.0] 已满十四不满十六周岁，犯故意杀人、故意伤害致人重伤或死亡、强奸、抢劫、贩卖毒品、放火、爆炸、投放危险物质罪的，应当负刑事责任（第17条第2款
inst(r("k17-2-rape",0,0,(P,X,))) :- cand(constitutes(P,X,rape)), cand(age14to16(P)).
constitutiveRule(r("k17-2-rape",0,0,(P,X,)),responsible(P,X,rape)) :- inst(r("k17-2-rape",0,0,(P,X,))).
mainHead(r("k17-2-rape",0,0,(P,X,)),constitutiveRule,responsible(P,X,rape)) :- inst(r("k17-2-rape",0,0,(P,X,))).
cand(responsible(P,X,rape)) :- inst(r("k17-2-rape",0,0,(P,X,))).
body(r("k17-2-rape",0,0,(P,X,)),constitutes(P,X,rape)) :- inst(r("k17-2-rape",0,0,(P,X,))).
body(r("k17-2-rape",0,0,(P,X,)),age14to16(P)) :- inst(r("k17-2-rape",0,0,(P,X,))).

% k17-2-robbery[0.0] 已满十四不满十六周岁，犯故意杀人、故意伤害致人重伤或死亡、强奸、抢劫、贩卖毒品、放火、爆炸、投放危险物质罪的，应当负刑事责任（转化型抢劫除外
inst(r("k17-2-robbery",0,0,(P,X,))) :- cand(constitutes(P,X,robbery)), cand(age14to16(P)).
constitutiveRule(r("k17-2-robbery",0,0,(P,X,)),responsible(P,X,robbery)) :- inst(r("k17-2-robbery",0,0,(P,X,))).
mainHead(r("k17-2-robbery",0,0,(P,X,)),constitutiveRule,responsible(P,X,robbery)) :- inst(r("k17-2-robbery",0,0,(P,X,))).
cand(responsible(P,X,robbery)) :- inst(r("k17-2-robbery",0,0,(P,X,))).
body(r("k17-2-robbery",0,0,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k17-2-robbery",0,0,(P,X,))).
body(r("k17-2-robbery",0,0,(P,X,)),age14to16(P)) :- inst(r("k17-2-robbery",0,0,(P,X,))).
inst(x("k17-2-robbery",0,0,0,(P,X,))) :- inst(r("k17-2-robbery",0,0,(P,X,))), cand(convertedRobbery(P,X)).
constitutiveRule(x("k17-2-robbery",0,0,0,(P,X,)),non(responsible(P,X,robbery))) :- inst(x("k17-2-robbery",0,0,0,(P,X,))).
body(x("k17-2-robbery",0,0,0,(P,X,)),constitutes(P,X,robbery)) :- inst(x("k17-2-robbery",0,0,0,(P,X,))).
body(x("k17-2-robbery",0,0,0,(P,X,)),age14to16(P)) :- inst(x("k17-2-robbery",0,0,0,(P,X,))).
body(x("k17-2-robbery",0,0,0,(P,X,)),convertedRobbery(P,X)) :- inst(x("k17-2-robbery",0,0,0,(P,X,))).
superior(x("k17-2-robbery",0,0,0,(P,X,)),r("k17-2-robbery",0,0,(P,X,))) :- inst(x("k17-2-robbery",0,0,0,(P,X,))).
exc(x("k17-2-robbery",0,0,0,(P,X,)),r("k17-2-robbery",0,0,(P,X,)),constitutiveRule,responsible(P,X,robbery)) :- inst(x("k17-2-robbery",0,0,0,(P,X,))).

% k17-2-drugTrafficking[0.0] 已满十四不满十六周岁，犯故意杀人、故意伤害致人重伤或死亡、强奸、抢劫、贩卖毒品、放火、爆炸、投放危险物质罪的，应当负刑事责任（第17条第2款
inst(r("k17-2-drugTrafficking",0,0,(P,X,))) :- cand(constitutes(P,X,drugTrafficking)), cand(age14to16(P)).
constitutiveRule(r("k17-2-drugTrafficking",0,0,(P,X,)),responsible(P,X,drugTrafficking)) :- inst(r("k17-2-drugTrafficking",0,0,(P,X,))).
mainHead(r("k17-2-drugTrafficking",0,0,(P,X,)),constitutiveRule,responsible(P,X,drugTrafficking)) :- inst(r("k17-2-drugTrafficking",0,0,(P,X,))).
cand(responsible(P,X,drugTrafficking)) :- inst(r("k17-2-drugTrafficking",0,0,(P,X,))).
body(r("k17-2-drugTrafficking",0,0,(P,X,)),constitutes(P,X,drugTrafficking)) :- inst(r("k17-2-drugTrafficking",0,0,(P,X,))).
body(r("k17-2-drugTrafficking",0,0,(P,X,)),age14to16(P)) :- inst(r("k17-2-drugTrafficking",0,0,(P,X,))).

% k17-2-arson[0.0] 已满十四不满十六周岁，犯故意杀人、故意伤害致人重伤或死亡、强奸、抢劫、贩卖毒品、放火、爆炸、投放危险物质罪的，应当负刑事责任（第17条第2款
inst(r("k17-2-arson",0,0,(P,X,))) :- cand(constitutes(P,X,arson)), cand(age14to16(P)).
constitutiveRule(r("k17-2-arson",0,0,(P,X,)),responsible(P,X,arson)) :- inst(r("k17-2-arson",0,0,(P,X,))).
mainHead(r("k17-2-arson",0,0,(P,X,)),constitutiveRule,responsible(P,X,arson)) :- inst(r("k17-2-arson",0,0,(P,X,))).
cand(responsible(P,X,arson)) :- inst(r("k17-2-arson",0,0,(P,X,))).
body(r("k17-2-arson",0,0,(P,X,)),constitutes(P,X,arson)) :- inst(r("k17-2-arson",0,0,(P,X,))).
body(r("k17-2-arson",0,0,(P,X,)),age14to16(P)) :- inst(r("k17-2-arson",0,0,(P,X,))).

% k17-2-explosion[0.0] 已满十四不满十六周岁，犯故意杀人、故意伤害致人重伤或死亡、强奸、抢劫、贩卖毒品、放火、爆炸、投放危险物质罪的，应当负刑事责任（第17条第2款
inst(r("k17-2-explosion",0,0,(P,X,))) :- cand(constitutes(P,X,explosion)), cand(age14to16(P)).
constitutiveRule(r("k17-2-explosion",0,0,(P,X,)),responsible(P,X,explosion)) :- inst(r("k17-2-explosion",0,0,(P,X,))).
mainHead(r("k17-2-explosion",0,0,(P,X,)),constitutiveRule,responsible(P,X,explosion)) :- inst(r("k17-2-explosion",0,0,(P,X,))).
cand(responsible(P,X,explosion)) :- inst(r("k17-2-explosion",0,0,(P,X,))).
body(r("k17-2-explosion",0,0,(P,X,)),constitutes(P,X,explosion)) :- inst(r("k17-2-explosion",0,0,(P,X,))).
body(r("k17-2-explosion",0,0,(P,X,)),age14to16(P)) :- inst(r("k17-2-explosion",0,0,(P,X,))).

% k17-2-poisoning[0.0] 已满十四不满十六周岁，犯故意杀人、故意伤害致人重伤或死亡、强奸、抢劫、贩卖毒品、放火、爆炸、投放危险物质罪的，应当负刑事责任（第17条第2款
inst(r("k17-2-poisoning",0,0,(P,X,))) :- cand(constitutes(P,X,poisoning)), cand(age14to16(P)).
constitutiveRule(r("k17-2-poisoning",0,0,(P,X,)),responsible(P,X,poisoning)) :- inst(r("k17-2-poisoning",0,0,(P,X,))).
mainHead(r("k17-2-poisoning",0,0,(P,X,)),constitutiveRule,responsible(P,X,poisoning)) :- inst(r("k17-2-poisoning",0,0,(P,X,))).
cand(responsible(P,X,poisoning)) :- inst(r("k17-2-poisoning",0,0,(P,X,))).
body(r("k17-2-poisoning",0,0,(P,X,)),constitutes(P,X,poisoning)) :- inst(r("k17-2-poisoning",0,0,(P,X,))).
body(r("k17-2-poisoning",0,0,(P,X,)),age14to16(P)) :- inst(r("k17-2-poisoning",0,0,(P,X,))).

% k17-3[0.0] 已满十二不满十四周岁，犯故意杀人、故意伤害罪，致人死亡或以特别残忍手段致人重伤造成严重残疾，情节恶劣，经最高人民检察院核准追诉的，应当负刑事
inst(r("k17-3",0,0,(C,P,X,))) :- cand(constitutes(P,X,C)), cand(age12to14(P)), cand(constitutes(P,X,intentionalHomicide)), cand(causesDeath(X)), cand(heinous(X)), cand(sppApprovedProsecution(X)).
constitutiveRule(r("k17-3",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k17-3",0,0,(C,P,X,))).
mainHead(r("k17-3",0,0,(C,P,X,)),constitutiveRule,responsible(P,X,C)) :- inst(r("k17-3",0,0,(C,P,X,))).
cand(responsible(P,X,C)) :- inst(r("k17-3",0,0,(C,P,X,))).
body(r("k17-3",0,0,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k17-3",0,0,(C,P,X,))).
body(r("k17-3",0,0,(C,P,X,)),age12to14(P)) :- inst(r("k17-3",0,0,(C,P,X,))).
body(r("k17-3",0,0,(C,P,X,)),constitutes(P,X,intentionalHomicide)) :- inst(r("k17-3",0,0,(C,P,X,))).
body(r("k17-3",0,0,(C,P,X,)),causesDeath(X)) :- inst(r("k17-3",0,0,(C,P,X,))).
body(r("k17-3",0,0,(C,P,X,)),heinous(X)) :- inst(r("k17-3",0,0,(C,P,X,))).
body(r("k17-3",0,0,(C,P,X,)),sppApprovedProsecution(X)) :- inst(r("k17-3",0,0,(C,P,X,))).
% k17-3[1.0] 已满十二不满十四周岁，犯故意杀人、故意伤害罪，致人死亡或以特别残忍手段致人重伤造成严重残疾，情节恶劣，经最高人民检察院核准追诉的，应当负刑事
inst(r("k17-3",1,0,(C,P,X,))) :- cand(constitutes(P,X,C)), cand(age12to14(P)), cand(constitutes(P,X,intentionalHomicide)), cand(especiallyCruelGraveDisability(X)), cand(heinous(X)), cand(sppApprovedProsecution(X)).
constitutiveRule(r("k17-3",1,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k17-3",1,0,(C,P,X,))).
mainHead(r("k17-3",1,0,(C,P,X,)),constitutiveRule,responsible(P,X,C)) :- inst(r("k17-3",1,0,(C,P,X,))).
cand(responsible(P,X,C)) :- inst(r("k17-3",1,0,(C,P,X,))).
body(r("k17-3",1,0,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k17-3",1,0,(C,P,X,))).
body(r("k17-3",1,0,(C,P,X,)),age12to14(P)) :- inst(r("k17-3",1,0,(C,P,X,))).
body(r("k17-3",1,0,(C,P,X,)),constitutes(P,X,intentionalHomicide)) :- inst(r("k17-3",1,0,(C,P,X,))).
body(r("k17-3",1,0,(C,P,X,)),especiallyCruelGraveDisability(X)) :- inst(r("k17-3",1,0,(C,P,X,))).
body(r("k17-3",1,0,(C,P,X,)),heinous(X)) :- inst(r("k17-3",1,0,(C,P,X,))).
body(r("k17-3",1,0,(C,P,X,)),sppApprovedProsecution(X)) :- inst(r("k17-3",1,0,(C,P,X,))).
% k17-3[2.0] 已满十二不满十四周岁，犯故意杀人、故意伤害罪，致人死亡或以特别残忍手段致人重伤造成严重残疾，情节恶劣，经最高人民检察院核准追诉的，应当负刑事
inst(r("k17-3",2,0,(C,P,X,))) :- cand(constitutes(P,X,C)), cand(age12to14(P)), cand(constitutes(P,X,intentionalInjury)), cand(causesDeath(X)), cand(heinous(X)), cand(sppApprovedProsecution(X)).
constitutiveRule(r("k17-3",2,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k17-3",2,0,(C,P,X,))).
mainHead(r("k17-3",2,0,(C,P,X,)),constitutiveRule,responsible(P,X,C)) :- inst(r("k17-3",2,0,(C,P,X,))).
cand(responsible(P,X,C)) :- inst(r("k17-3",2,0,(C,P,X,))).
body(r("k17-3",2,0,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k17-3",2,0,(C,P,X,))).
body(r("k17-3",2,0,(C,P,X,)),age12to14(P)) :- inst(r("k17-3",2,0,(C,P,X,))).
body(r("k17-3",2,0,(C,P,X,)),constitutes(P,X,intentionalInjury)) :- inst(r("k17-3",2,0,(C,P,X,))).
body(r("k17-3",2,0,(C,P,X,)),causesDeath(X)) :- inst(r("k17-3",2,0,(C,P,X,))).
body(r("k17-3",2,0,(C,P,X,)),heinous(X)) :- inst(r("k17-3",2,0,(C,P,X,))).
body(r("k17-3",2,0,(C,P,X,)),sppApprovedProsecution(X)) :- inst(r("k17-3",2,0,(C,P,X,))).
% k17-3[3.0] 已满十二不满十四周岁，犯故意杀人、故意伤害罪，致人死亡或以特别残忍手段致人重伤造成严重残疾，情节恶劣，经最高人民检察院核准追诉的，应当负刑事
inst(r("k17-3",3,0,(C,P,X,))) :- cand(constitutes(P,X,C)), cand(age12to14(P)), cand(constitutes(P,X,intentionalInjury)), cand(especiallyCruelGraveDisability(X)), cand(heinous(X)), cand(sppApprovedProsecution(X)).
constitutiveRule(r("k17-3",3,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k17-3",3,0,(C,P,X,))).
mainHead(r("k17-3",3,0,(C,P,X,)),constitutiveRule,responsible(P,X,C)) :- inst(r("k17-3",3,0,(C,P,X,))).
cand(responsible(P,X,C)) :- inst(r("k17-3",3,0,(C,P,X,))).
body(r("k17-3",3,0,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k17-3",3,0,(C,P,X,))).
body(r("k17-3",3,0,(C,P,X,)),age12to14(P)) :- inst(r("k17-3",3,0,(C,P,X,))).
body(r("k17-3",3,0,(C,P,X,)),constitutes(P,X,intentionalInjury)) :- inst(r("k17-3",3,0,(C,P,X,))).
body(r("k17-3",3,0,(C,P,X,)),especiallyCruelGraveDisability(X)) :- inst(r("k17-3",3,0,(C,P,X,))).
body(r("k17-3",3,0,(C,P,X,)),heinous(X)) :- inst(r("k17-3",3,0,(C,P,X,))).
body(r("k17-3",3,0,(C,P,X,)),sppApprovedProsecution(X)) :- inst(r("k17-3",3,0,(C,P,X,))).

% k17-4[0.0] 对不满十八周岁的人应当从轻或者减轻处罚（第17条第4款；npc）
inst(r("k17-4",0,0,(C,P,X,))) :- cand(responsible(P,X,C)), cand(under18(P)).
prescriptiveRule(r("k17-4",0,0,(C,P,X,)),sentence(P,X,lighterOrReduced)) :- inst(r("k17-4",0,0,(C,P,X,))).
mainHead(r("k17-4",0,0,(C,P,X,)),prescriptiveRule,sentence(P,X,lighterOrReduced)) :- inst(r("k17-4",0,0,(C,P,X,))).
cand(sentence(P,X,lighterOrReduced)) :- inst(r("k17-4",0,0,(C,P,X,))).
body(r("k17-4",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k17-4",0,0,(C,P,X,))).
body(r("k17-4",0,0,(C,P,X,)),under18(P)) :- inst(r("k17-4",0,0,(C,P,X,))).

% k17-1b[0.0] 已满七十五周岁的人故意犯罪的，可以从轻或者减轻处罚（第17条之一；npc）
inst(r("k17-1b",0,0,(C,P,X,))) :- cand(responsible(P,X,C)), cand(age75plus(P)), cand(intentionalCrime(X)).
permissiveRule(r("k17-1b",0,0,(C,P,X,)),sentence(P,X,lighterOrReduced)) :- inst(r("k17-1b",0,0,(C,P,X,))).
mainHead(r("k17-1b",0,0,(C,P,X,)),permissiveRule,sentence(P,X,lighterOrReduced)) :- inst(r("k17-1b",0,0,(C,P,X,))).
cand(sentence(P,X,lighterOrReduced)) :- inst(r("k17-1b",0,0,(C,P,X,))).
body(r("k17-1b",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k17-1b",0,0,(C,P,X,))).
body(r("k17-1b",0,0,(C,P,X,)),age75plus(P)) :- inst(r("k17-1b",0,0,(C,P,X,))).
body(r("k17-1b",0,0,(C,P,X,)),intentionalCrime(X)) :- inst(r("k17-1b",0,0,(C,P,X,))).

% k17-1c[0.0] 已满七十五周岁的人过失犯罪的，应当从轻或者减轻处罚（第17条之一；npc）
inst(r("k17-1c",0,0,(C,P,X,))) :- cand(responsible(P,X,C)), cand(age75plus(P)), cand(negligentCrime(X)).
prescriptiveRule(r("k17-1c",0,0,(C,P,X,)),sentence(P,X,lighterOrReduced)) :- inst(r("k17-1c",0,0,(C,P,X,))).
mainHead(r("k17-1c",0,0,(C,P,X,)),prescriptiveRule,sentence(P,X,lighterOrReduced)) :- inst(r("k17-1c",0,0,(C,P,X,))).
cand(sentence(P,X,lighterOrReduced)) :- inst(r("k17-1c",0,0,(C,P,X,))).
body(r("k17-1c",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k17-1c",0,0,(C,P,X,))).
body(r("k17-1c",0,0,(C,P,X,)),age75plus(P)) :- inst(r("k17-1c",0,0,(C,P,X,))).
body(r("k17-1c",0,0,(C,P,X,)),negligentCrime(X)) :- inst(r("k17-1c",0,0,(C,P,X,))).

% k-minor-conv[0.0] 已满十四不满十六周岁的人盗窃、诈骗、抢夺后当场使用暴力，故意伤害致人重伤或者死亡的，以故意伤害罪定罪处罚，不成立（转化型）抢劫罪（《最高人民
inst(r("k-minor-conv",0,0,(P,X,))) :- cand(convertedRobbery(P,X)), cand(age14to16(P)), cand(violenceOnTheSpot(P,X)), cand(causesGraveInjuryOrDeath(X)).
constitutiveRule(r("k-minor-conv",0,0,(P,X,)),constitutes(P,X,intentionalInjury)) :- inst(r("k-minor-conv",0,0,(P,X,))).
mainHead(r("k-minor-conv",0,0,(P,X,)),constitutiveRule,constitutes(P,X,intentionalInjury)) :- inst(r("k-minor-conv",0,0,(P,X,))).
cand(constitutes(P,X,intentionalInjury)) :- inst(r("k-minor-conv",0,0,(P,X,))).
body(r("k-minor-conv",0,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k-minor-conv",0,0,(P,X,))).
body(r("k-minor-conv",0,0,(P,X,)),age14to16(P)) :- inst(r("k-minor-conv",0,0,(P,X,))).
body(r("k-minor-conv",0,0,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k-minor-conv",0,0,(P,X,))).
body(r("k-minor-conv",0,0,(P,X,)),causesGraveInjuryOrDeath(X)) :- inst(r("k-minor-conv",0,0,(P,X,))).

% k18-1[0.0] 精神病人在不能辨认或者不能控制自己行为时造成危害结果，经法定程序鉴定确认的，不负刑事责任（第18条第1款；npc）
inst(r("k18-1",0,0,(C,P,X,))) :- cand(constitutes(P,X,C)), cand(mentallyIll(P)), cand(unableToRecognizeOrControlAtTime(P,X)), cand(forensicallyCertified(P)).
constitutiveRule(r("k18-1",0,0,(C,P,X,)),non(responsible(P,X,C))) :- inst(r("k18-1",0,0,(C,P,X,))).
mainHead(r("k18-1",0,0,(C,P,X,)),constitutiveRule,non(responsible(P,X,C))) :- inst(r("k18-1",0,0,(C,P,X,))).
cand(responsible(P,X,C)) :- inst(r("k18-1",0,0,(C,P,X,))).
body(r("k18-1",0,0,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k18-1",0,0,(C,P,X,))).
body(r("k18-1",0,0,(C,P,X,)),mentallyIll(P)) :- inst(r("k18-1",0,0,(C,P,X,))).
body(r("k18-1",0,0,(C,P,X,)),unableToRecognizeOrControlAtTime(P,X)) :- inst(r("k18-1",0,0,(C,P,X,))).
body(r("k18-1",0,0,(C,P,X,)),forensicallyCertified(P)) :- inst(r("k18-1",0,0,(C,P,X,))).

% k18-3[0.0] 尚未完全丧失辨认或者控制能力的精神病人犯罪的，应当负刑事责任，但是可以从轻或者减轻处罚（第18条第3款；npc）
inst(r("k18-3",0,0,(C,P,X,))) :- cand(responsible(P,X,C)), cand(mentallyIll(P)), cand(partiallyImpairedCapacity(P,X)).
permissiveRule(r("k18-3",0,0,(C,P,X,)),sentence(P,X,lighterOrReduced)) :- inst(r("k18-3",0,0,(C,P,X,))).
mainHead(r("k18-3",0,0,(C,P,X,)),permissiveRule,sentence(P,X,lighterOrReduced)) :- inst(r("k18-3",0,0,(C,P,X,))).
cand(sentence(P,X,lighterOrReduced)) :- inst(r("k18-3",0,0,(C,P,X,))).
body(r("k18-3",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k18-3",0,0,(C,P,X,))).
body(r("k18-3",0,0,(C,P,X,)),mentallyIll(P)) :- inst(r("k18-3",0,0,(C,P,X,))).
body(r("k18-3",0,0,(C,P,X,)),partiallyImpairedCapacity(P,X)) :- inst(r("k18-3",0,0,(C,P,X,))).

% k19[0.0] 又聋又哑的人或者盲人犯罪，可以从轻、减轻或者免除处罚（第19条；npc）
inst(r("k19",0,0,(C,P,X,))) :- cand(responsible(P,X,C)), cand(deafAndMute(P)).
permissiveRule(r("k19",0,0,(C,P,X,)),sentence(P,X,lighterReducedOrExempt)) :- inst(r("k19",0,0,(C,P,X,))).
mainHead(r("k19",0,0,(C,P,X,)),permissiveRule,sentence(P,X,lighterReducedOrExempt)) :- inst(r("k19",0,0,(C,P,X,))).
cand(sentence(P,X,lighterReducedOrExempt)) :- inst(r("k19",0,0,(C,P,X,))).
body(r("k19",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k19",0,0,(C,P,X,))).
body(r("k19",0,0,(C,P,X,)),deafAndMute(P)) :- inst(r("k19",0,0,(C,P,X,))).
% k19[1.0] 又聋又哑的人或者盲人犯罪，可以从轻、减轻或者免除处罚（第19条；npc）
inst(r("k19",1,0,(C,P,X,))) :- cand(responsible(P,X,C)), cand(blind(P)).
permissiveRule(r("k19",1,0,(C,P,X,)),sentence(P,X,lighterReducedOrExempt)) :- inst(r("k19",1,0,(C,P,X,))).
mainHead(r("k19",1,0,(C,P,X,)),permissiveRule,sentence(P,X,lighterReducedOrExempt)) :- inst(r("k19",1,0,(C,P,X,))).
cand(sentence(P,X,lighterReducedOrExempt)) :- inst(r("k19",1,0,(C,P,X,))).
body(r("k19",1,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k19",1,0,(C,P,X,))).
body(r("k19",1,0,(C,P,X,)),blind(P)) :- inst(r("k19",1,0,(C,P,X,))).

% k20-1[0.0] 正当防卫，不负刑事责任（第20条第1款；npc）
inst(r("k20-1",0,0,(C,P,X,))) :- cand(defenseConditions(P,X)), cand(constitutes(P,X,C)).
constitutiveRule(r("k20-1",0,0,(C,P,X,)),justifiedDefense(P,X)) :- inst(r("k20-1",0,0,(C,P,X,))).
mainHead(r("k20-1",0,0,(C,P,X,)),constitutiveRule,justifiedDefense(P,X)) :- inst(r("k20-1",0,0,(C,P,X,))).
cand(justifiedDefense(P,X)) :- inst(r("k20-1",0,0,(C,P,X,))).
body(r("k20-1",0,0,(C,P,X,)),defenseConditions(P,X)) :- inst(r("k20-1",0,0,(C,P,X,))).
body(r("k20-1",0,0,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k20-1",0,0,(C,P,X,))).
inst(x("k20-1",0,0,0,(C,P,X,))) :- inst(r("k20-1",0,0,(C,P,X,))), cand(excessiveDefense(P,X)).
constitutiveRule(x("k20-1",0,0,0,(C,P,X,)),non(justifiedDefense(P,X))) :- inst(x("k20-1",0,0,0,(C,P,X,))).
body(x("k20-1",0,0,0,(C,P,X,)),defenseConditions(P,X)) :- inst(x("k20-1",0,0,0,(C,P,X,))).
body(x("k20-1",0,0,0,(C,P,X,)),constitutes(P,X,C)) :- inst(x("k20-1",0,0,0,(C,P,X,))).
body(x("k20-1",0,0,0,(C,P,X,)),excessiveDefense(P,X)) :- inst(x("k20-1",0,0,0,(C,P,X,))).
superior(x("k20-1",0,0,0,(C,P,X,)),r("k20-1",0,0,(C,P,X,))) :- inst(x("k20-1",0,0,0,(C,P,X,))).
exc(x("k20-1",0,0,0,(C,P,X,)),r("k20-1",0,0,(C,P,X,)),constitutiveRule,justifiedDefense(P,X)) :- inst(x("k20-1",0,0,0,(C,P,X,))).
% k20-1[0.1] 正当防卫，不负刑事责任（第20条第1款；npc）
inst(r("k20-1",0,1,(C,P,X,))) :- cand(defenseConditions(P,X)), cand(constitutes(P,X,C)).
constitutiveRule(r("k20-1",0,1,(C,P,X,)),non(responsible(P,X,C))) :- inst(r("k20-1",0,1,(C,P,X,))).
mainHead(r("k20-1",0,1,(C,P,X,)),constitutiveRule,non(responsible(P,X,C))) :- inst(r("k20-1",0,1,(C,P,X,))).
cand(responsible(P,X,C)) :- inst(r("k20-1",0,1,(C,P,X,))).
body(r("k20-1",0,1,(C,P,X,)),defenseConditions(P,X)) :- inst(r("k20-1",0,1,(C,P,X,))).
body(r("k20-1",0,1,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k20-1",0,1,(C,P,X,))).
inst(x("k20-1",0,1,0,(C,P,X,))) :- inst(r("k20-1",0,1,(C,P,X,))), cand(excessiveDefense(P,X)).
constitutiveRule(x("k20-1",0,1,0,(C,P,X,)),responsible(P,X,C)) :- inst(x("k20-1",0,1,0,(C,P,X,))).
body(x("k20-1",0,1,0,(C,P,X,)),defenseConditions(P,X)) :- inst(x("k20-1",0,1,0,(C,P,X,))).
body(x("k20-1",0,1,0,(C,P,X,)),constitutes(P,X,C)) :- inst(x("k20-1",0,1,0,(C,P,X,))).
body(x("k20-1",0,1,0,(C,P,X,)),excessiveDefense(P,X)) :- inst(x("k20-1",0,1,0,(C,P,X,))).
superior(x("k20-1",0,1,0,(C,P,X,)),r("k20-1",0,1,(C,P,X,))) :- inst(x("k20-1",0,1,0,(C,P,X,))).
exc(x("k20-1",0,1,0,(C,P,X,)),r("k20-1",0,1,(C,P,X,)),constitutiveRule,non(responsible(P,X,C))) :- inst(x("k20-1",0,1,0,(C,P,X,))).

% k20-cond[0.0] 起因（不法侵害）、时间（正在进行）、对象（不法侵害人）、主观（防卫意图）（第20条第1款；npc）
inst(r("k20-cond",0,0,(P,X,))) :- cand(defensiveAct(P,X)), cand(ongoingUnlawfulAttack(X)), cand(harmToAttacker(X)), cand(defensiveIntent(P,X)).
constitutiveRule(r("k20-cond",0,0,(P,X,)),defenseConditions(P,X)) :- inst(r("k20-cond",0,0,(P,X,))).
mainHead(r("k20-cond",0,0,(P,X,)),constitutiveRule,defenseConditions(P,X)) :- inst(r("k20-cond",0,0,(P,X,))).
cand(defenseConditions(P,X)) :- inst(r("k20-cond",0,0,(P,X,))).
body(r("k20-cond",0,0,(P,X,)),defensiveAct(P,X)) :- inst(r("k20-cond",0,0,(P,X,))).
body(r("k20-cond",0,0,(P,X,)),ongoingUnlawfulAttack(X)) :- inst(r("k20-cond",0,0,(P,X,))).
body(r("k20-cond",0,0,(P,X,)),harmToAttacker(X)) :- inst(r("k20-cond",0,0,(P,X,))).
body(r("k20-cond",0,0,(P,X,)),defensiveIntent(P,X)) :- inst(r("k20-cond",0,0,(P,X,))).

% k20-3[0.0] 对行凶、杀人、抢劫、强奸、绑架等严重危及人身安全的暴力犯罪防卫，造成伤亡的，不属于防卫过当，不负刑事责任（第20条第3款；npc）
inst(r("k20-3",0,0,(C,P,X,))) :- cand(defenseConditions(P,X)), cand(constitutes(P,X,C)), cand(violentCrimeEndangeringLife(X)).
constitutiveRule(r("k20-3",0,0,(C,P,X,)),justifiedDefense(P,X)) :- inst(r("k20-3",0,0,(C,P,X,))).
mainHead(r("k20-3",0,0,(C,P,X,)),constitutiveRule,justifiedDefense(P,X)) :- inst(r("k20-3",0,0,(C,P,X,))).
cand(justifiedDefense(P,X)) :- inst(r("k20-3",0,0,(C,P,X,))).
body(r("k20-3",0,0,(C,P,X,)),defenseConditions(P,X)) :- inst(r("k20-3",0,0,(C,P,X,))).
body(r("k20-3",0,0,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k20-3",0,0,(C,P,X,))).
body(r("k20-3",0,0,(C,P,X,)),violentCrimeEndangeringLife(X)) :- inst(r("k20-3",0,0,(C,P,X,))).
% k20-3[0.1] 对行凶、杀人、抢劫、强奸、绑架等严重危及人身安全的暴力犯罪防卫，造成伤亡的，不属于防卫过当，不负刑事责任（第20条第3款；npc）
inst(r("k20-3",0,1,(C,P,X,))) :- cand(defenseConditions(P,X)), cand(constitutes(P,X,C)), cand(violentCrimeEndangeringLife(X)).
constitutiveRule(r("k20-3",0,1,(C,P,X,)),non(responsible(P,X,C))) :- inst(r("k20-3",0,1,(C,P,X,))).
mainHead(r("k20-3",0,1,(C,P,X,)),constitutiveRule,non(responsible(P,X,C))) :- inst(r("k20-3",0,1,(C,P,X,))).
cand(responsible(P,X,C)) :- inst(r("k20-3",0,1,(C,P,X,))).
body(r("k20-3",0,1,(C,P,X,)),defenseConditions(P,X)) :- inst(r("k20-3",0,1,(C,P,X,))).
body(r("k20-3",0,1,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k20-3",0,1,(C,P,X,))).
body(r("k20-3",0,1,(C,P,X,)),violentCrimeEndangeringLife(X)) :- inst(r("k20-3",0,1,(C,P,X,))).

% k20-2[0.0] 正当防卫明显超过必要限度造成重大损害的，是防卫过当（第20条第2款；npc）
inst(r("k20-2",0,0,(P,X,))) :- cand(defenseConditions(P,X)), cand(obviouslyExceedsNecessity(X)), cand(causesSeriousHarm(X)).
constitutiveRule(r("k20-2",0,0,(P,X,)),excessiveDefense(P,X)) :- inst(r("k20-2",0,0,(P,X,))).
mainHead(r("k20-2",0,0,(P,X,)),constitutiveRule,excessiveDefense(P,X)) :- inst(r("k20-2",0,0,(P,X,))).
cand(excessiveDefense(P,X)) :- inst(r("k20-2",0,0,(P,X,))).
body(r("k20-2",0,0,(P,X,)),defenseConditions(P,X)) :- inst(r("k20-2",0,0,(P,X,))).
body(r("k20-2",0,0,(P,X,)),obviouslyExceedsNecessity(X)) :- inst(r("k20-2",0,0,(P,X,))).
body(r("k20-2",0,0,(P,X,)),causesSeriousHarm(X)) :- inst(r("k20-2",0,0,(P,X,))).
inst(x("k20-2",0,0,0,(P,X,))) :- inst(r("k20-2",0,0,(P,X,))), cand(violentCrimeEndangeringLife(X)).
constitutiveRule(x("k20-2",0,0,0,(P,X,)),non(excessiveDefense(P,X))) :- inst(x("k20-2",0,0,0,(P,X,))).
body(x("k20-2",0,0,0,(P,X,)),defenseConditions(P,X)) :- inst(x("k20-2",0,0,0,(P,X,))).
body(x("k20-2",0,0,0,(P,X,)),obviouslyExceedsNecessity(X)) :- inst(x("k20-2",0,0,0,(P,X,))).
body(x("k20-2",0,0,0,(P,X,)),causesSeriousHarm(X)) :- inst(x("k20-2",0,0,0,(P,X,))).
body(x("k20-2",0,0,0,(P,X,)),violentCrimeEndangeringLife(X)) :- inst(x("k20-2",0,0,0,(P,X,))).
superior(x("k20-2",0,0,0,(P,X,)),r("k20-2",0,0,(P,X,))) :- inst(x("k20-2",0,0,0,(P,X,))).
exc(x("k20-2",0,0,0,(P,X,)),r("k20-2",0,0,(P,X,)),constitutiveRule,excessiveDefense(P,X)) :- inst(x("k20-2",0,0,0,(P,X,))).

% k20-2b[0.0] 防卫过当应当负刑事责任，但是应当减轻或者免除处罚（第20条第2款；npc）
inst(r("k20-2b",0,0,(C,P,X,))) :- cand(excessiveDefense(P,X)), cand(responsible(P,X,C)).
prescriptiveRule(r("k20-2b",0,0,(C,P,X,)),sentence(P,X,reducedOrExempt)) :- inst(r("k20-2b",0,0,(C,P,X,))).
mainHead(r("k20-2b",0,0,(C,P,X,)),prescriptiveRule,sentence(P,X,reducedOrExempt)) :- inst(r("k20-2b",0,0,(C,P,X,))).
cand(sentence(P,X,reducedOrExempt)) :- inst(r("k20-2b",0,0,(C,P,X,))).
body(r("k20-2b",0,0,(C,P,X,)),excessiveDefense(P,X)) :- inst(r("k20-2b",0,0,(C,P,X,))).
body(r("k20-2b",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k20-2b",0,0,(C,P,X,))).

% k20-late[0.0] 不法侵害已经结束后的“防卫”是事后防卫，不成立正当防卫（第20条第1款；doctrine）
inst(r("k20-late",0,0,(P,X,))) :- cand(defensiveAct(P,X)), cand(attackAlreadyEnded(X)).
constitutiveRule(r("k20-late",0,0,(P,X,)),non(defenseConditions(P,X))) :- inst(r("k20-late",0,0,(P,X,))).
mainHead(r("k20-late",0,0,(P,X,)),constitutiveRule,non(defenseConditions(P,X))) :- inst(r("k20-late",0,0,(P,X,))).
cand(defenseConditions(P,X)) :- inst(r("k20-late",0,0,(P,X,))).
body(r("k20-late",0,0,(P,X,)),defensiveAct(P,X)) :- inst(r("k20-late",0,0,(P,X,))).
body(r("k20-late",0,0,(P,X,)),attackAlreadyEnded(X)) :- inst(r("k20-late",0,0,(P,X,))).

% k21-1[0.0] 紧急避险，不负刑事责任（第21条第1款；npc）
inst(r("k21-1",0,0,(C,P,X,))) :- cand(necessityConditions(P,X)), cand(constitutes(P,X,C)).
constitutiveRule(r("k21-1",0,0,(C,P,X,)),justifiedNecessity(P,X)) :- inst(r("k21-1",0,0,(C,P,X,))).
mainHead(r("k21-1",0,0,(C,P,X,)),constitutiveRule,justifiedNecessity(P,X)) :- inst(r("k21-1",0,0,(C,P,X,))).
cand(justifiedNecessity(P,X)) :- inst(r("k21-1",0,0,(C,P,X,))).
body(r("k21-1",0,0,(C,P,X,)),necessityConditions(P,X)) :- inst(r("k21-1",0,0,(C,P,X,))).
body(r("k21-1",0,0,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k21-1",0,0,(C,P,X,))).
inst(x("k21-1",0,0,0,(C,P,X,))) :- inst(r("k21-1",0,0,(C,P,X,))), cand(excessiveNecessity(P,X)).
constitutiveRule(x("k21-1",0,0,0,(C,P,X,)),non(justifiedNecessity(P,X))) :- inst(x("k21-1",0,0,0,(C,P,X,))).
body(x("k21-1",0,0,0,(C,P,X,)),necessityConditions(P,X)) :- inst(x("k21-1",0,0,0,(C,P,X,))).
body(x("k21-1",0,0,0,(C,P,X,)),constitutes(P,X,C)) :- inst(x("k21-1",0,0,0,(C,P,X,))).
body(x("k21-1",0,0,0,(C,P,X,)),excessiveNecessity(P,X)) :- inst(x("k21-1",0,0,0,(C,P,X,))).
superior(x("k21-1",0,0,0,(C,P,X,)),r("k21-1",0,0,(C,P,X,))) :- inst(x("k21-1",0,0,0,(C,P,X,))).
exc(x("k21-1",0,0,0,(C,P,X,)),r("k21-1",0,0,(C,P,X,)),constitutiveRule,justifiedNecessity(P,X)) :- inst(x("k21-1",0,0,0,(C,P,X,))).
% k21-1[0.1] 紧急避险，不负刑事责任（第21条第1款；npc）
inst(r("k21-1",0,1,(C,P,X,))) :- cand(necessityConditions(P,X)), cand(constitutes(P,X,C)).
constitutiveRule(r("k21-1",0,1,(C,P,X,)),non(responsible(P,X,C))) :- inst(r("k21-1",0,1,(C,P,X,))).
mainHead(r("k21-1",0,1,(C,P,X,)),constitutiveRule,non(responsible(P,X,C))) :- inst(r("k21-1",0,1,(C,P,X,))).
cand(responsible(P,X,C)) :- inst(r("k21-1",0,1,(C,P,X,))).
body(r("k21-1",0,1,(C,P,X,)),necessityConditions(P,X)) :- inst(r("k21-1",0,1,(C,P,X,))).
body(r("k21-1",0,1,(C,P,X,)),constitutes(P,X,C)) :- inst(r("k21-1",0,1,(C,P,X,))).
inst(x("k21-1",0,1,0,(C,P,X,))) :- inst(r("k21-1",0,1,(C,P,X,))), cand(excessiveNecessity(P,X)).
constitutiveRule(x("k21-1",0,1,0,(C,P,X,)),responsible(P,X,C)) :- inst(x("k21-1",0,1,0,(C,P,X,))).
body(x("k21-1",0,1,0,(C,P,X,)),necessityConditions(P,X)) :- inst(x("k21-1",0,1,0,(C,P,X,))).
body(x("k21-1",0,1,0,(C,P,X,)),constitutes(P,X,C)) :- inst(x("k21-1",0,1,0,(C,P,X,))).
body(x("k21-1",0,1,0,(C,P,X,)),excessiveNecessity(P,X)) :- inst(x("k21-1",0,1,0,(C,P,X,))).
superior(x("k21-1",0,1,0,(C,P,X,)),r("k21-1",0,1,(C,P,X,))) :- inst(x("k21-1",0,1,0,(C,P,X,))).
exc(x("k21-1",0,1,0,(C,P,X,)),r("k21-1",0,1,(C,P,X,)),constitutiveRule,non(responsible(P,X,C))) :- inst(x("k21-1",0,1,0,(C,P,X,))).

% k21-cond[0.0] 正在发生的危险、不得已、损害另一合法权益；避免本人危险不适用于负有特定责任的人（第21条第3款）（第21条第1款；npc）
inst(r("k21-cond",0,0,(P,X,))) :- cand(avertsDanger(P,X)), cand(ongoingDanger(X)), cand(noOtherMeans(X)), cand(harmsThirdPartyInterest(X)).
constitutiveRule(r("k21-cond",0,0,(P,X,)),necessityConditions(P,X)) :- inst(r("k21-cond",0,0,(P,X,))).
mainHead(r("k21-cond",0,0,(P,X,)),constitutiveRule,necessityConditions(P,X)) :- inst(r("k21-cond",0,0,(P,X,))).
cand(necessityConditions(P,X)) :- inst(r("k21-cond",0,0,(P,X,))).
body(r("k21-cond",0,0,(P,X,)),avertsDanger(P,X)) :- inst(r("k21-cond",0,0,(P,X,))).
body(r("k21-cond",0,0,(P,X,)),ongoingDanger(X)) :- inst(r("k21-cond",0,0,(P,X,))).
body(r("k21-cond",0,0,(P,X,)),noOtherMeans(X)) :- inst(r("k21-cond",0,0,(P,X,))).
body(r("k21-cond",0,0,(P,X,)),harmsThirdPartyInterest(X)) :- inst(r("k21-cond",0,0,(P,X,))).
inst(x("k21-cond",0,0,0,(P,X,))) :- inst(r("k21-cond",0,0,(P,X,))), cand(specialDutyToFaceOwnDanger(P,X)).
constitutiveRule(x("k21-cond",0,0,0,(P,X,)),non(necessityConditions(P,X))) :- inst(x("k21-cond",0,0,0,(P,X,))).
body(x("k21-cond",0,0,0,(P,X,)),avertsDanger(P,X)) :- inst(x("k21-cond",0,0,0,(P,X,))).
body(x("k21-cond",0,0,0,(P,X,)),ongoingDanger(X)) :- inst(x("k21-cond",0,0,0,(P,X,))).
body(x("k21-cond",0,0,0,(P,X,)),noOtherMeans(X)) :- inst(x("k21-cond",0,0,0,(P,X,))).
body(x("k21-cond",0,0,0,(P,X,)),harmsThirdPartyInterest(X)) :- inst(x("k21-cond",0,0,0,(P,X,))).
body(x("k21-cond",0,0,0,(P,X,)),specialDutyToFaceOwnDanger(P,X)) :- inst(x("k21-cond",0,0,0,(P,X,))).
superior(x("k21-cond",0,0,0,(P,X,)),r("k21-cond",0,0,(P,X,))) :- inst(x("k21-cond",0,0,0,(P,X,))).
exc(x("k21-cond",0,0,0,(P,X,)),r("k21-cond",0,0,(P,X,)),constitutiveRule,necessityConditions(P,X)) :- inst(x("k21-cond",0,0,0,(P,X,))).

% k21-2[0.0] 紧急避险超过必要限度造成不应有的损害的，是避险过当（第21条第2款；npc）
inst(r("k21-2",0,0,(P,X,))) :- cand(necessityConditions(P,X)), cand(exceedsNecessityUndueHarm(X)).
constitutiveRule(r("k21-2",0,0,(P,X,)),excessiveNecessity(P,X)) :- inst(r("k21-2",0,0,(P,X,))).
mainHead(r("k21-2",0,0,(P,X,)),constitutiveRule,excessiveNecessity(P,X)) :- inst(r("k21-2",0,0,(P,X,))).
cand(excessiveNecessity(P,X)) :- inst(r("k21-2",0,0,(P,X,))).
body(r("k21-2",0,0,(P,X,)),necessityConditions(P,X)) :- inst(r("k21-2",0,0,(P,X,))).
body(r("k21-2",0,0,(P,X,)),exceedsNecessityUndueHarm(X)) :- inst(r("k21-2",0,0,(P,X,))).

% k21-2b[0.0] 避险过当应当负刑事责任，但是应当减轻或者免除处罚（第21条第2款；npc）
inst(r("k21-2b",0,0,(C,P,X,))) :- cand(excessiveNecessity(P,X)), cand(responsible(P,X,C)).
prescriptiveRule(r("k21-2b",0,0,(C,P,X,)),sentence(P,X,reducedOrExempt)) :- inst(r("k21-2b",0,0,(C,P,X,))).
mainHead(r("k21-2b",0,0,(C,P,X,)),prescriptiveRule,sentence(P,X,reducedOrExempt)) :- inst(r("k21-2b",0,0,(C,P,X,))).
cand(sentence(P,X,reducedOrExempt)) :- inst(r("k21-2b",0,0,(C,P,X,))).
body(r("k21-2b",0,0,(C,P,X,)),excessiveNecessity(P,X)) :- inst(r("k21-2b",0,0,(C,P,X,))).
body(r("k21-2b",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k21-2b",0,0,(C,P,X,))).

% k22[0.0] 为了犯罪，准备工具、制造条件，因意志以外原因未能着手的，是犯罪预备（第22条第1款；npc）
inst(r("k22",0,0,(P,X,))) :- cand(preparedToolsOrConditions(P,X)).
constitutiveRule(r("k22",0,0,(P,X,)),preparation(P,X)) :- inst(r("k22",0,0,(P,X,))).
mainHead(r("k22",0,0,(P,X,)),constitutiveRule,preparation(P,X)) :- inst(r("k22",0,0,(P,X,))).
cand(preparation(P,X)) :- inst(r("k22",0,0,(P,X,))).
body(r("k22",0,0,(P,X,)),preparedToolsOrConditions(P,X)) :- inst(r("k22",0,0,(P,X,))).
inst(x("k22",0,0,0,(P,X,))) :- inst(r("k22",0,0,(P,X,))), cand(commencedExecution(P,X)).
constitutiveRule(x("k22",0,0,0,(P,X,)),non(preparation(P,X))) :- inst(x("k22",0,0,0,(P,X,))).
body(x("k22",0,0,0,(P,X,)),preparedToolsOrConditions(P,X)) :- inst(x("k22",0,0,0,(P,X,))).
body(x("k22",0,0,0,(P,X,)),commencedExecution(P,X)) :- inst(x("k22",0,0,0,(P,X,))).
superior(x("k22",0,0,0,(P,X,)),r("k22",0,0,(P,X,))) :- inst(x("k22",0,0,0,(P,X,))).
exc(x("k22",0,0,0,(P,X,)),r("k22",0,0,(P,X,)),constitutiveRule,preparation(P,X)) :- inst(x("k22",0,0,0,(P,X,))).
inst(x("k22",0,0,1,(P,X,))) :- inst(r("k22",0,0,(P,X,))), cand(voluntarilyAbandoned(P,X)).
constitutiveRule(x("k22",0,0,1,(P,X,)),non(preparation(P,X))) :- inst(x("k22",0,0,1,(P,X,))).
body(x("k22",0,0,1,(P,X,)),preparedToolsOrConditions(P,X)) :- inst(x("k22",0,0,1,(P,X,))).
body(x("k22",0,0,1,(P,X,)),voluntarilyAbandoned(P,X)) :- inst(x("k22",0,0,1,(P,X,))).
superior(x("k22",0,0,1,(P,X,)),r("k22",0,0,(P,X,))) :- inst(x("k22",0,0,1,(P,X,))).
exc(x("k22",0,0,1,(P,X,)),r("k22",0,0,(P,X,)),constitutiveRule,preparation(P,X)) :- inst(x("k22",0,0,1,(P,X,))).

% k22-2[0.0] 对于预备犯，可以比照既遂犯从轻、减轻处罚或者免除处罚（第22条第2款；npc）
inst(r("k22-2",0,0,(C,P,X,))) :- cand(preparation(P,X)), cand(responsible(P,X,C)).
permissiveRule(r("k22-2",0,0,(C,P,X,)),sentence(P,X,lighterReducedOrExempt)) :- inst(r("k22-2",0,0,(C,P,X,))).
mainHead(r("k22-2",0,0,(C,P,X,)),permissiveRule,sentence(P,X,lighterReducedOrExempt)) :- inst(r("k22-2",0,0,(C,P,X,))).
cand(sentence(P,X,lighterReducedOrExempt)) :- inst(r("k22-2",0,0,(C,P,X,))).
body(r("k22-2",0,0,(C,P,X,)),preparation(P,X)) :- inst(r("k22-2",0,0,(C,P,X,))).
body(r("k22-2",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k22-2",0,0,(C,P,X,))).

% k23[0.0] 已经着手实行犯罪，由于犯罪分子意志以外的原因而未得逞的，是犯罪未遂（第23条第1款；npc）
inst(r("k23",0,0,(P,X,))) :- cand(commencedExecution(P,X)), cand(notAccomplished(X)).
constitutiveRule(r("k23",0,0,(P,X,)),attempt(P,X)) :- inst(r("k23",0,0,(P,X,))).
mainHead(r("k23",0,0,(P,X,)),constitutiveRule,attempt(P,X)) :- inst(r("k23",0,0,(P,X,))).
cand(attempt(P,X)) :- inst(r("k23",0,0,(P,X,))).
body(r("k23",0,0,(P,X,)),commencedExecution(P,X)) :- inst(r("k23",0,0,(P,X,))).
body(r("k23",0,0,(P,X,)),notAccomplished(X)) :- inst(r("k23",0,0,(P,X,))).
inst(x("k23",0,0,0,(P,X,))) :- inst(r("k23",0,0,(P,X,))), cand(voluntarilyAbandoned(P,X)).
constitutiveRule(x("k23",0,0,0,(P,X,)),non(attempt(P,X))) :- inst(x("k23",0,0,0,(P,X,))).
body(x("k23",0,0,0,(P,X,)),commencedExecution(P,X)) :- inst(x("k23",0,0,0,(P,X,))).
body(x("k23",0,0,0,(P,X,)),notAccomplished(X)) :- inst(x("k23",0,0,0,(P,X,))).
body(x("k23",0,0,0,(P,X,)),voluntarilyAbandoned(P,X)) :- inst(x("k23",0,0,0,(P,X,))).
superior(x("k23",0,0,0,(P,X,)),r("k23",0,0,(P,X,))) :- inst(x("k23",0,0,0,(P,X,))).
exc(x("k23",0,0,0,(P,X,)),r("k23",0,0,(P,X,)),constitutiveRule,attempt(P,X)) :- inst(x("k23",0,0,0,(P,X,))).

% k23-2[0.0] 对于未遂犯，可以比照既遂犯从轻或者减轻处罚（第23条第2款；npc）
inst(r("k23-2",0,0,(C,P,X,))) :- cand(attempt(P,X)), cand(responsible(P,X,C)).
permissiveRule(r("k23-2",0,0,(C,P,X,)),sentence(P,X,lighterOrReduced)) :- inst(r("k23-2",0,0,(C,P,X,))).
mainHead(r("k23-2",0,0,(C,P,X,)),permissiveRule,sentence(P,X,lighterOrReduced)) :- inst(r("k23-2",0,0,(C,P,X,))).
cand(sentence(P,X,lighterOrReduced)) :- inst(r("k23-2",0,0,(C,P,X,))).
body(r("k23-2",0,0,(C,P,X,)),attempt(P,X)) :- inst(r("k23-2",0,0,(C,P,X,))).
body(r("k23-2",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k23-2",0,0,(C,P,X,))).

% k24[0.0] 在犯罪过程中，自动放弃犯罪或者自动有效地防止犯罪结果发生的，是犯罪中止（第24条第1款；npc）
inst(r("k24",0,0,(P,X,))) :- cand(voluntarilyAbandoned(P,X)), cand(notAccomplished(X)).
constitutiveRule(r("k24",0,0,(P,X,)),discontinuance(P,X)) :- inst(r("k24",0,0,(P,X,))).
mainHead(r("k24",0,0,(P,X,)),constitutiveRule,discontinuance(P,X)) :- inst(r("k24",0,0,(P,X,))).
cand(discontinuance(P,X)) :- inst(r("k24",0,0,(P,X,))).
body(r("k24",0,0,(P,X,)),voluntarilyAbandoned(P,X)) :- inst(r("k24",0,0,(P,X,))).
body(r("k24",0,0,(P,X,)),notAccomplished(X)) :- inst(r("k24",0,0,(P,X,))).

% k24-2a[0.0] 对于中止犯，没有造成损害的，应当免除处罚（第24条第2款；npc）
inst(r("k24-2a",0,0,(C,P,X,))) :- cand(discontinuance(P,X)), cand(responsible(P,X,C)).
prescriptiveRule(r("k24-2a",0,0,(C,P,X,)),sentence(P,X,exempt)) :- inst(r("k24-2a",0,0,(C,P,X,))).
mainHead(r("k24-2a",0,0,(C,P,X,)),prescriptiveRule,sentence(P,X,exempt)) :- inst(r("k24-2a",0,0,(C,P,X,))).
cand(sentence(P,X,exempt)) :- inst(r("k24-2a",0,0,(C,P,X,))).
body(r("k24-2a",0,0,(C,P,X,)),discontinuance(P,X)) :- inst(r("k24-2a",0,0,(C,P,X,))).
body(r("k24-2a",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k24-2a",0,0,(C,P,X,))).
inst(x("k24-2a",0,0,0,(C,P,X,))) :- inst(r("k24-2a",0,0,(C,P,X,))), cand(causedDamage(X)).
permissiveRule(x("k24-2a",0,0,0,(C,P,X,)),non(sentence(P,X,exempt))) :- inst(x("k24-2a",0,0,0,(C,P,X,))).
body(x("k24-2a",0,0,0,(C,P,X,)),discontinuance(P,X)) :- inst(x("k24-2a",0,0,0,(C,P,X,))).
body(x("k24-2a",0,0,0,(C,P,X,)),responsible(P,X,C)) :- inst(x("k24-2a",0,0,0,(C,P,X,))).
body(x("k24-2a",0,0,0,(C,P,X,)),causedDamage(X)) :- inst(x("k24-2a",0,0,0,(C,P,X,))).
superior(x("k24-2a",0,0,0,(C,P,X,)),r("k24-2a",0,0,(C,P,X,))) :- inst(x("k24-2a",0,0,0,(C,P,X,))).
exc(x("k24-2a",0,0,0,(C,P,X,)),r("k24-2a",0,0,(C,P,X,)),prescriptiveRule,sentence(P,X,exempt)) :- inst(x("k24-2a",0,0,0,(C,P,X,))).

% k24-2b[0.0] 对于中止犯，造成损害的，应当减轻处罚（第24条第2款；npc）
inst(r("k24-2b",0,0,(C,P,X,))) :- cand(discontinuance(P,X)), cand(responsible(P,X,C)), cand(causedDamage(X)).
prescriptiveRule(r("k24-2b",0,0,(C,P,X,)),sentence(P,X,reduced)) :- inst(r("k24-2b",0,0,(C,P,X,))).
mainHead(r("k24-2b",0,0,(C,P,X,)),prescriptiveRule,sentence(P,X,reduced)) :- inst(r("k24-2b",0,0,(C,P,X,))).
cand(sentence(P,X,reduced)) :- inst(r("k24-2b",0,0,(C,P,X,))).
body(r("k24-2b",0,0,(C,P,X,)),discontinuance(P,X)) :- inst(r("k24-2b",0,0,(C,P,X,))).
body(r("k24-2b",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k24-2b",0,0,(C,P,X,))).
body(r("k24-2b",0,0,(C,P,X,)),causedDamage(X)) :- inst(r("k24-2b",0,0,(C,P,X,))).

% k24-noAttempt[0.0] 自动性是犯罪中止区别于未遂、预备的标志（第24条第1款；doctrine）
inst(r("k24-noAttempt",0,0,(P,X,))) :- cand(voluntarilyAbandoned(P,X)), cand(notAccomplished(X)), cand(commencedExecution(P,X)).
constitutiveRule(r("k24-noAttempt",0,0,(P,X,)),non(attempt(P,X))) :- inst(r("k24-noAttempt",0,0,(P,X,))).
mainHead(r("k24-noAttempt",0,0,(P,X,)),constitutiveRule,non(attempt(P,X))) :- inst(r("k24-noAttempt",0,0,(P,X,))).
cand(attempt(P,X)) :- inst(r("k24-noAttempt",0,0,(P,X,))).
body(r("k24-noAttempt",0,0,(P,X,)),voluntarilyAbandoned(P,X)) :- inst(r("k24-noAttempt",0,0,(P,X,))).
body(r("k24-noAttempt",0,0,(P,X,)),notAccomplished(X)) :- inst(r("k24-noAttempt",0,0,(P,X,))).
body(r("k24-noAttempt",0,0,(P,X,)),commencedExecution(P,X)) :- inst(r("k24-noAttempt",0,0,(P,X,))).

% k27[0.0] 在共同犯罪中起次要或者辅助作用的，是从犯，应当从轻、减轻处罚或者免除处罚（第27条；npc）
inst(r("k27",0,0,(C,P,X,))) :- cand(accessoryRole(P,X)), cand(responsible(P,X,C)).
prescriptiveRule(r("k27",0,0,(C,P,X,)),sentence(P,X,lighterReducedOrExempt)) :- inst(r("k27",0,0,(C,P,X,))).
mainHead(r("k27",0,0,(C,P,X,)),prescriptiveRule,sentence(P,X,lighterReducedOrExempt)) :- inst(r("k27",0,0,(C,P,X,))).
cand(sentence(P,X,lighterReducedOrExempt)) :- inst(r("k27",0,0,(C,P,X,))).
body(r("k27",0,0,(C,P,X,)),accessoryRole(P,X)) :- inst(r("k27",0,0,(C,P,X,))).
body(r("k27",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k27",0,0,(C,P,X,))).

% k28[0.0] 对于被胁迫参加犯罪的，应当按照他的犯罪情节减轻处罚或者免除处罚（第28条；npc）
inst(r("k28",0,0,(C,P,X,))) :- cand(coercedToParticipate(P,X)), cand(responsible(P,X,C)).
prescriptiveRule(r("k28",0,0,(C,P,X,)),sentence(P,X,reducedOrExempt)) :- inst(r("k28",0,0,(C,P,X,))).
mainHead(r("k28",0,0,(C,P,X,)),prescriptiveRule,sentence(P,X,reducedOrExempt)) :- inst(r("k28",0,0,(C,P,X,))).
cand(sentence(P,X,reducedOrExempt)) :- inst(r("k28",0,0,(C,P,X,))).
body(r("k28",0,0,(C,P,X,)),coercedToParticipate(P,X)) :- inst(r("k28",0,0,(C,P,X,))).
body(r("k28",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k28",0,0,(C,P,X,))).

% k29-1[0.0] 教唆不满十八周岁的人犯罪的，应当从重处罚（第29条第1款；npc）
inst(r("k29-1",0,0,(C,P,Q,X,))) :- cand(instigates(P,Q,X)), cand(under18(Q)), cand(responsible(P,X,C)).
prescriptiveRule(r("k29-1",0,0,(C,P,Q,X,)),sentence(P,X,heavier)) :- inst(r("k29-1",0,0,(C,P,Q,X,))).
mainHead(r("k29-1",0,0,(C,P,Q,X,)),prescriptiveRule,sentence(P,X,heavier)) :- inst(r("k29-1",0,0,(C,P,Q,X,))).
cand(sentence(P,X,heavier)) :- inst(r("k29-1",0,0,(C,P,Q,X,))).
body(r("k29-1",0,0,(C,P,Q,X,)),instigates(P,Q,X)) :- inst(r("k29-1",0,0,(C,P,Q,X,))).
body(r("k29-1",0,0,(C,P,Q,X,)),under18(Q)) :- inst(r("k29-1",0,0,(C,P,Q,X,))).
body(r("k29-1",0,0,(C,P,Q,X,)),responsible(P,X,C)) :- inst(r("k29-1",0,0,(C,P,Q,X,))).

% k29-2[0.0] 被教唆的人没有犯被教唆的罪的，对于教唆犯，可以从轻或者减轻处罚（第29条第2款；npc）
inst(r("k29-2",0,0,(C,P,Q,X,))) :- cand(instigates(P,Q,X)), cand(instigatedDidNotCommit(Q,X)), cand(responsible(P,X,C)).
permissiveRule(r("k29-2",0,0,(C,P,Q,X,)),sentence(P,X,lighterOrReduced)) :- inst(r("k29-2",0,0,(C,P,Q,X,))).
mainHead(r("k29-2",0,0,(C,P,Q,X,)),permissiveRule,sentence(P,X,lighterOrReduced)) :- inst(r("k29-2",0,0,(C,P,Q,X,))).
cand(sentence(P,X,lighterOrReduced)) :- inst(r("k29-2",0,0,(C,P,Q,X,))).
body(r("k29-2",0,0,(C,P,Q,X,)),instigates(P,Q,X)) :- inst(r("k29-2",0,0,(C,P,Q,X,))).
body(r("k29-2",0,0,(C,P,Q,X,)),instigatedDidNotCommit(Q,X)) :- inst(r("k29-2",0,0,(C,P,Q,X,))).
body(r("k29-2",0,0,(C,P,Q,X,)),responsible(P,X,C)) :- inst(r("k29-2",0,0,(C,P,Q,X,))).

% tx-t1694[0.0] 分类（自动抽取自图的层级）：哲学根据 ⊑ 刑事责任的根据
inst(r("tx-t1694",0,0,(X,))) :- cand(isA(X,"哲学根据")).
constitutiveRule(r("tx-t1694",0,0,(X,)),isA(X,"刑事责任的根据")) :- inst(r("tx-t1694",0,0,(X,))).
mainHead(r("tx-t1694",0,0,(X,)),constitutiveRule,isA(X,"刑事责任的根据")) :- inst(r("tx-t1694",0,0,(X,))).
cand(isA(X,"刑事责任的根据")) :- inst(r("tx-t1694",0,0,(X,))).
body(r("tx-t1694",0,0,(X,)),isA(X,"哲学根据")) :- inst(r("tx-t1694",0,0,(X,))).

% tx-t1696[0.0] 分类（自动抽取自图的层级）：法学根据 ⊑ 刑事责任的根据
inst(r("tx-t1696",0,0,(X,))) :- cand(isA(X,"法学根据")).
constitutiveRule(r("tx-t1696",0,0,(X,)),isA(X,"刑事责任的根据")) :- inst(r("tx-t1696",0,0,(X,))).
mainHead(r("tx-t1696",0,0,(X,)),constitutiveRule,isA(X,"刑事责任的根据")) :- inst(r("tx-t1696",0,0,(X,))).
cand(isA(X,"刑事责任的根据")) :- inst(r("tx-t1696",0,0,(X,))).
body(r("tx-t1696",0,0,(X,)),isA(X,"法学根据")) :- inst(r("tx-t1696",0,0,(X,))).

% tx-t1786[0.0] 分类（自动抽取自图的层级）：学理分类 ⊑ 刑罚的种类
inst(r("tx-t1786",0,0,(X,))) :- cand(isA(X,"学理分类")).
constitutiveRule(r("tx-t1786",0,0,(X,)),isA(X,"刑罚的种类")) :- inst(r("tx-t1786",0,0,(X,))).
mainHead(r("tx-t1786",0,0,(X,)),constitutiveRule,isA(X,"刑罚的种类")) :- inst(r("tx-t1786",0,0,(X,))).
cand(isA(X,"刑罚的种类")) :- inst(r("tx-t1786",0,0,(X,))).
body(r("tx-t1786",0,0,(X,)),isA(X,"学理分类")) :- inst(r("tx-t1786",0,0,(X,))).

% tx-t1792[0.0] 分类（自动抽取自图的层级）：刑法中的分类 ⊑ 刑罚的种类
inst(r("tx-t1792",0,0,(X,))) :- cand(isA(X,"刑法中的分类")).
constitutiveRule(r("tx-t1792",0,0,(X,)),isA(X,"刑罚的种类")) :- inst(r("tx-t1792",0,0,(X,))).
mainHead(r("tx-t1792",0,0,(X,)),constitutiveRule,isA(X,"刑罚的种类")) :- inst(r("tx-t1792",0,0,(X,))).
cand(isA(X,"刑罚的种类")) :- inst(r("tx-t1792",0,0,(X,))).
body(r("tx-t1792",0,0,(X,)),isA(X,"刑法中的分类")) :- inst(r("tx-t1792",0,0,(X,))).

% tx-t1827[0.0] 分类（自动抽取自图的层级）：有期徒刑 ⊑ 主刑
inst(r("tx-t1827",0,0,(X,))) :- cand(isA(X,"有期徒刑")).
constitutiveRule(r("tx-t1827",0,0,(X,)),isA(X,"主刑")) :- inst(r("tx-t1827",0,0,(X,))).
mainHead(r("tx-t1827",0,0,(X,)),constitutiveRule,isA(X,"主刑")) :- inst(r("tx-t1827",0,0,(X,))).
cand(isA(X,"主刑")) :- inst(r("tx-t1827",0,0,(X,))).
body(r("tx-t1827",0,0,(X,)),isA(X,"有期徒刑")) :- inst(r("tx-t1827",0,0,(X,))).

% tx-t1838[0.0] 分类（自动抽取自图的层级）：无期徒刑 ⊑ 主刑
inst(r("tx-t1838",0,0,(X,))) :- cand(isA(X,"无期徒刑")).
constitutiveRule(r("tx-t1838",0,0,(X,)),isA(X,"主刑")) :- inst(r("tx-t1838",0,0,(X,))).
mainHead(r("tx-t1838",0,0,(X,)),constitutiveRule,isA(X,"主刑")) :- inst(r("tx-t1838",0,0,(X,))).
cand(isA(X,"主刑")) :- inst(r("tx-t1838",0,0,(X,))).
body(r("tx-t1838",0,0,(X,)),isA(X,"无期徒刑")) :- inst(r("tx-t1838",0,0,(X,))).

% tx-t1847[0.0] 分类（自动抽取自图的层级）：死刑 ⊑ 主刑
inst(r("tx-t1847",0,0,(X,))) :- cand(isA(X,"死刑")).
constitutiveRule(r("tx-t1847",0,0,(X,)),isA(X,"主刑")) :- inst(r("tx-t1847",0,0,(X,))).
mainHead(r("tx-t1847",0,0,(X,)),constitutiveRule,isA(X,"主刑")) :- inst(r("tx-t1847",0,0,(X,))).
cand(isA(X,"主刑")) :- inst(r("tx-t1847",0,0,(X,))).
body(r("tx-t1847",0,0,(X,)),isA(X,"死刑")) :- inst(r("tx-t1847",0,0,(X,))).

% k65[0.0] 一般累犯：前罪被判有期徒刑以上，执行完毕或赦免后五年内再犯应判有期徒刑以上之罪；过失犯罪和不满十八周岁的人犯罪的除外（第65条第1款；npc
inst(r("k65",0,0,(C,P,X,))) :- cand(priorSentenceFixedTermOrAbove(P)), cand(within5YearsAfterRelease(P,X)), cand(newCrimeDeservesFixedTerm(X)), cand(responsible(P,X,C)).
constitutiveRule(r("k65",0,0,(C,P,X,)),recidivist(P,X)) :- inst(r("k65",0,0,(C,P,X,))).
mainHead(r("k65",0,0,(C,P,X,)),constitutiveRule,recidivist(P,X)) :- inst(r("k65",0,0,(C,P,X,))).
cand(recidivist(P,X)) :- inst(r("k65",0,0,(C,P,X,))).
body(r("k65",0,0,(C,P,X,)),priorSentenceFixedTermOrAbove(P)) :- inst(r("k65",0,0,(C,P,X,))).
body(r("k65",0,0,(C,P,X,)),within5YearsAfterRelease(P,X)) :- inst(r("k65",0,0,(C,P,X,))).
body(r("k65",0,0,(C,P,X,)),newCrimeDeservesFixedTerm(X)) :- inst(r("k65",0,0,(C,P,X,))).
body(r("k65",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k65",0,0,(C,P,X,))).
inst(x("k65",0,0,0,(C,P,X,))) :- inst(r("k65",0,0,(C,P,X,))), cand(negligentCrime(X)).
constitutiveRule(x("k65",0,0,0,(C,P,X,)),non(recidivist(P,X))) :- inst(x("k65",0,0,0,(C,P,X,))).
body(x("k65",0,0,0,(C,P,X,)),priorSentenceFixedTermOrAbove(P)) :- inst(x("k65",0,0,0,(C,P,X,))).
body(x("k65",0,0,0,(C,P,X,)),within5YearsAfterRelease(P,X)) :- inst(x("k65",0,0,0,(C,P,X,))).
body(x("k65",0,0,0,(C,P,X,)),newCrimeDeservesFixedTerm(X)) :- inst(x("k65",0,0,0,(C,P,X,))).
body(x("k65",0,0,0,(C,P,X,)),responsible(P,X,C)) :- inst(x("k65",0,0,0,(C,P,X,))).
body(x("k65",0,0,0,(C,P,X,)),negligentCrime(X)) :- inst(x("k65",0,0,0,(C,P,X,))).
superior(x("k65",0,0,0,(C,P,X,)),r("k65",0,0,(C,P,X,))) :- inst(x("k65",0,0,0,(C,P,X,))).
exc(x("k65",0,0,0,(C,P,X,)),r("k65",0,0,(C,P,X,)),constitutiveRule,recidivist(P,X)) :- inst(x("k65",0,0,0,(C,P,X,))).
inst(x("k65",0,0,1,(C,P,X,))) :- inst(r("k65",0,0,(C,P,X,))), cand(priorNegligent(P)).
constitutiveRule(x("k65",0,0,1,(C,P,X,)),non(recidivist(P,X))) :- inst(x("k65",0,0,1,(C,P,X,))).
body(x("k65",0,0,1,(C,P,X,)),priorSentenceFixedTermOrAbove(P)) :- inst(x("k65",0,0,1,(C,P,X,))).
body(x("k65",0,0,1,(C,P,X,)),within5YearsAfterRelease(P,X)) :- inst(x("k65",0,0,1,(C,P,X,))).
body(x("k65",0,0,1,(C,P,X,)),newCrimeDeservesFixedTerm(X)) :- inst(x("k65",0,0,1,(C,P,X,))).
body(x("k65",0,0,1,(C,P,X,)),responsible(P,X,C)) :- inst(x("k65",0,0,1,(C,P,X,))).
body(x("k65",0,0,1,(C,P,X,)),priorNegligent(P)) :- inst(x("k65",0,0,1,(C,P,X,))).
superior(x("k65",0,0,1,(C,P,X,)),r("k65",0,0,(C,P,X,))) :- inst(x("k65",0,0,1,(C,P,X,))).
exc(x("k65",0,0,1,(C,P,X,)),r("k65",0,0,(C,P,X,)),constitutiveRule,recidivist(P,X)) :- inst(x("k65",0,0,1,(C,P,X,))).
inst(x("k65",0,0,2,(C,P,X,))) :- inst(r("k65",0,0,(C,P,X,))), cand(under18AtPriorCrime(P)).
constitutiveRule(x("k65",0,0,2,(C,P,X,)),non(recidivist(P,X))) :- inst(x("k65",0,0,2,(C,P,X,))).
body(x("k65",0,0,2,(C,P,X,)),priorSentenceFixedTermOrAbove(P)) :- inst(x("k65",0,0,2,(C,P,X,))).
body(x("k65",0,0,2,(C,P,X,)),within5YearsAfterRelease(P,X)) :- inst(x("k65",0,0,2,(C,P,X,))).
body(x("k65",0,0,2,(C,P,X,)),newCrimeDeservesFixedTerm(X)) :- inst(x("k65",0,0,2,(C,P,X,))).
body(x("k65",0,0,2,(C,P,X,)),responsible(P,X,C)) :- inst(x("k65",0,0,2,(C,P,X,))).
body(x("k65",0,0,2,(C,P,X,)),under18AtPriorCrime(P)) :- inst(x("k65",0,0,2,(C,P,X,))).
superior(x("k65",0,0,2,(C,P,X,)),r("k65",0,0,(C,P,X,))) :- inst(x("k65",0,0,2,(C,P,X,))).
exc(x("k65",0,0,2,(C,P,X,)),r("k65",0,0,(C,P,X,)),constitutiveRule,recidivist(P,X)) :- inst(x("k65",0,0,2,(C,P,X,))).
inst(x("k65",0,0,3,(C,P,X,))) :- inst(r("k65",0,0,(C,P,X,))), cand(under18(P)).
constitutiveRule(x("k65",0,0,3,(C,P,X,)),non(recidivist(P,X))) :- inst(x("k65",0,0,3,(C,P,X,))).
body(x("k65",0,0,3,(C,P,X,)),priorSentenceFixedTermOrAbove(P)) :- inst(x("k65",0,0,3,(C,P,X,))).
body(x("k65",0,0,3,(C,P,X,)),within5YearsAfterRelease(P,X)) :- inst(x("k65",0,0,3,(C,P,X,))).
body(x("k65",0,0,3,(C,P,X,)),newCrimeDeservesFixedTerm(X)) :- inst(x("k65",0,0,3,(C,P,X,))).
body(x("k65",0,0,3,(C,P,X,)),responsible(P,X,C)) :- inst(x("k65",0,0,3,(C,P,X,))).
body(x("k65",0,0,3,(C,P,X,)),under18(P)) :- inst(x("k65",0,0,3,(C,P,X,))).
superior(x("k65",0,0,3,(C,P,X,)),r("k65",0,0,(C,P,X,))) :- inst(x("k65",0,0,3,(C,P,X,))).
exc(x("k65",0,0,3,(C,P,X,)),r("k65",0,0,(C,P,X,)),constitutiveRule,recidivist(P,X)) :- inst(x("k65",0,0,3,(C,P,X,))).

% k66[0.0] 危害国家安全、恐怖活动、黑社会性质组织犯罪的犯罪分子，在任何时候再犯上述任一类罪的，都以累犯论处（第66条；npc）
inst(r("k66",0,0,(C,P,X,))) :- cand(priorSpecialCategoryCrime(P)), cand(specialCategoryCrime(X)), cand(priorSentenceServedOrPardoned(P)), cand(responsible(P,X,C)).
constitutiveRule(r("k66",0,0,(C,P,X,)),recidivist(P,X)) :- inst(r("k66",0,0,(C,P,X,))).
mainHead(r("k66",0,0,(C,P,X,)),constitutiveRule,recidivist(P,X)) :- inst(r("k66",0,0,(C,P,X,))).
cand(recidivist(P,X)) :- inst(r("k66",0,0,(C,P,X,))).
body(r("k66",0,0,(C,P,X,)),priorSpecialCategoryCrime(P)) :- inst(r("k66",0,0,(C,P,X,))).
body(r("k66",0,0,(C,P,X,)),specialCategoryCrime(X)) :- inst(r("k66",0,0,(C,P,X,))).
body(r("k66",0,0,(C,P,X,)),priorSentenceServedOrPardoned(P)) :- inst(r("k66",0,0,(C,P,X,))).
body(r("k66",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k66",0,0,(C,P,X,))).

% k65-sent[0.0] 累犯应当从重处罚（第65条第1款；npc）
inst(r("k65-sent",0,0,(P,X,))) :- cand(recidivist(P,X)).
prescriptiveRule(r("k65-sent",0,0,(P,X,)),sentence(P,X,heavier)) :- inst(r("k65-sent",0,0,(P,X,))).
mainHead(r("k65-sent",0,0,(P,X,)),prescriptiveRule,sentence(P,X,heavier)) :- inst(r("k65-sent",0,0,(P,X,))).
cand(sentence(P,X,heavier)) :- inst(r("k65-sent",0,0,(P,X,))).
body(r("k65-sent",0,0,(P,X,)),recidivist(P,X)) :- inst(r("k65-sent",0,0,(P,X,))).

% k74[0.0] 对于累犯和犯罪集团的首要分子，不适用缓刑（第74条；npc）
inst(r("k74",0,0,(P,X,))) :- cand(recidivist(P,X)).
prescriptiveRule(r("k74",0,0,(P,X,)),non(sentence(P,X,probation))) :- inst(r("k74",0,0,(P,X,))).
mainHead(r("k74",0,0,(P,X,)),prescriptiveRule,non(sentence(P,X,probation))) :- inst(r("k74",0,0,(P,X,))).
cand(sentence(P,X,probation)) :- inst(r("k74",0,0,(P,X,))).
body(r("k74",0,0,(P,X,)),recidivist(P,X)) :- inst(r("k74",0,0,(P,X,))).
% k74[1.0] 对于累犯和犯罪集团的首要分子，不适用缓刑（第74条；npc）
inst(r("k74",1,0,(P,X,))) :- cand(ringleaderOfCriminalGroup(P,X)).
prescriptiveRule(r("k74",1,0,(P,X,)),non(sentence(P,X,probation))) :- inst(r("k74",1,0,(P,X,))).
mainHead(r("k74",1,0,(P,X,)),prescriptiveRule,non(sentence(P,X,probation))) :- inst(r("k74",1,0,(P,X,))).
cand(sentence(P,X,probation)) :- inst(r("k74",1,0,(P,X,))).
body(r("k74",1,0,(P,X,)),ringleaderOfCriminalGroup(P,X)) :- inst(r("k74",1,0,(P,X,))).

% k67-1[0.0] 犯罪以后自动投案，如实供述自己的罪行的，是自首（第67条第1款；npc）
inst(r("k67-1",0,0,(P,X,))) :- cand(surrendersVoluntarily(P,X)), cand(confessesTruthfully(P,X)).
constitutiveRule(r("k67-1",0,0,(P,X,)),surrender(P,X)) :- inst(r("k67-1",0,0,(P,X,))).
mainHead(r("k67-1",0,0,(P,X,)),constitutiveRule,surrender(P,X)) :- inst(r("k67-1",0,0,(P,X,))).
cand(surrender(P,X)) :- inst(r("k67-1",0,0,(P,X,))).
body(r("k67-1",0,0,(P,X,)),surrendersVoluntarily(P,X)) :- inst(r("k67-1",0,0,(P,X,))).
body(r("k67-1",0,0,(P,X,)),confessesTruthfully(P,X)) :- inst(r("k67-1",0,0,(P,X,))).

% k67-2[0.0] 被采取强制措施的犯罪嫌疑人、被告人和正在服刑的罪犯，如实供述司法机关还未掌握的本人其他罪行的，以自首论（第67条第2款；npc）
inst(r("k67-2",0,0,(P,X,))) :- cand(underCoerciveMeasureOrServing(P)), cand(confessesOtherCrimeUnknownToAuthorities(P,X)).
constitutiveRule(r("k67-2",0,0,(P,X,)),surrender(P,X)) :- inst(r("k67-2",0,0,(P,X,))).
mainHead(r("k67-2",0,0,(P,X,)),constitutiveRule,surrender(P,X)) :- inst(r("k67-2",0,0,(P,X,))).
cand(surrender(P,X)) :- inst(r("k67-2",0,0,(P,X,))).
body(r("k67-2",0,0,(P,X,)),underCoerciveMeasureOrServing(P)) :- inst(r("k67-2",0,0,(P,X,))).
body(r("k67-2",0,0,(P,X,)),confessesOtherCrimeUnknownToAuthorities(P,X)) :- inst(r("k67-2",0,0,(P,X,))).

% k67-3[0.0] 不具有自首情节，但如实供述自己罪行的，是坦白（第67条第3款；npc）
inst(r("k67-3",0,0,(C,P,X,))) :- cand(confessesTruthfully(P,X)), cand(responsible(P,X,C)).
constitutiveRule(r("k67-3",0,0,(C,P,X,)),confession(P,X)) :- inst(r("k67-3",0,0,(C,P,X,))).
mainHead(r("k67-3",0,0,(C,P,X,)),constitutiveRule,confession(P,X)) :- inst(r("k67-3",0,0,(C,P,X,))).
cand(confession(P,X)) :- inst(r("k67-3",0,0,(C,P,X,))).
body(r("k67-3",0,0,(C,P,X,)),confessesTruthfully(P,X)) :- inst(r("k67-3",0,0,(C,P,X,))).
body(r("k67-3",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k67-3",0,0,(C,P,X,))).
inst(x("k67-3",0,0,0,(C,P,X,))) :- inst(r("k67-3",0,0,(C,P,X,))), cand(surrender(P,X)).
constitutiveRule(x("k67-3",0,0,0,(C,P,X,)),non(confession(P,X))) :- inst(x("k67-3",0,0,0,(C,P,X,))).
body(x("k67-3",0,0,0,(C,P,X,)),confessesTruthfully(P,X)) :- inst(x("k67-3",0,0,0,(C,P,X,))).
body(x("k67-3",0,0,0,(C,P,X,)),responsible(P,X,C)) :- inst(x("k67-3",0,0,0,(C,P,X,))).
body(x("k67-3",0,0,0,(C,P,X,)),surrender(P,X)) :- inst(x("k67-3",0,0,0,(C,P,X,))).
superior(x("k67-3",0,0,0,(C,P,X,)),r("k67-3",0,0,(C,P,X,))) :- inst(x("k67-3",0,0,0,(C,P,X,))).
exc(x("k67-3",0,0,0,(C,P,X,)),r("k67-3",0,0,(C,P,X,)),constitutiveRule,confession(P,X)) :- inst(x("k67-3",0,0,0,(C,P,X,))).

% k67-3s[0.0] 坦白的，可以从轻处罚（第67条第3款；npc）
inst(r("k67-3s",0,0,(P,X,))) :- cand(confession(P,X)).
permissiveRule(r("k67-3s",0,0,(P,X,)),sentence(P,X,lighter)) :- inst(r("k67-3s",0,0,(P,X,))).
mainHead(r("k67-3s",0,0,(P,X,)),permissiveRule,sentence(P,X,lighter)) :- inst(r("k67-3s",0,0,(P,X,))).
cand(sentence(P,X,lighter)) :- inst(r("k67-3s",0,0,(P,X,))).
body(r("k67-3s",0,0,(P,X,)),confession(P,X)) :- inst(r("k67-3s",0,0,(P,X,))).

% k67-3b[0.0] 因如实供述避免特别严重后果发生的，可以减轻处罚（第67条第3款；npc）
inst(r("k67-3b",0,0,(P,X,))) :- cand(confession(P,X)), cand(avertedEspeciallySeriousConsequence(P,X)).
permissiveRule(r("k67-3b",0,0,(P,X,)),sentence(P,X,reduced)) :- inst(r("k67-3b",0,0,(P,X,))).
mainHead(r("k67-3b",0,0,(P,X,)),permissiveRule,sentence(P,X,reduced)) :- inst(r("k67-3b",0,0,(P,X,))).
cand(sentence(P,X,reduced)) :- inst(r("k67-3b",0,0,(P,X,))).
body(r("k67-3b",0,0,(P,X,)),confession(P,X)) :- inst(r("k67-3b",0,0,(P,X,))).
body(r("k67-3b",0,0,(P,X,)),avertedEspeciallySeriousConsequence(P,X)) :- inst(r("k67-3b",0,0,(P,X,))).

% k67-1s[0.0] 对于自首的犯罪分子，可以从轻或者减轻处罚（第67条第1款；npc）
inst(r("k67-1s",0,0,(C,P,X,))) :- cand(surrender(P,X)), cand(responsible(P,X,C)).
permissiveRule(r("k67-1s",0,0,(C,P,X,)),sentence(P,X,lighterOrReduced)) :- inst(r("k67-1s",0,0,(C,P,X,))).
mainHead(r("k67-1s",0,0,(C,P,X,)),permissiveRule,sentence(P,X,lighterOrReduced)) :- inst(r("k67-1s",0,0,(C,P,X,))).
cand(sentence(P,X,lighterOrReduced)) :- inst(r("k67-1s",0,0,(C,P,X,))).
body(r("k67-1s",0,0,(C,P,X,)),surrender(P,X)) :- inst(r("k67-1s",0,0,(C,P,X,))).
body(r("k67-1s",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k67-1s",0,0,(C,P,X,))).

% k67-1e[0.0] 犯罪较轻的，可以免除处罚（第67条第1款；npc）
inst(r("k67-1e",0,0,(C,P,X,))) :- cand(surrender(P,X)), cand(responsible(P,X,C)), cand(minorCrime(X)).
permissiveRule(r("k67-1e",0,0,(C,P,X,)),sentence(P,X,exempt)) :- inst(r("k67-1e",0,0,(C,P,X,))).
mainHead(r("k67-1e",0,0,(C,P,X,)),permissiveRule,sentence(P,X,exempt)) :- inst(r("k67-1e",0,0,(C,P,X,))).
cand(sentence(P,X,exempt)) :- inst(r("k67-1e",0,0,(C,P,X,))).
body(r("k67-1e",0,0,(C,P,X,)),surrender(P,X)) :- inst(r("k67-1e",0,0,(C,P,X,))).
body(r("k67-1e",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k67-1e",0,0,(C,P,X,))).
body(r("k67-1e",0,0,(C,P,X,)),minorCrime(X)) :- inst(r("k67-1e",0,0,(C,P,X,))).

% k68[0.0] 有揭发他人犯罪行为查证属实等立功表现的，可以从轻或者减轻处罚（第68条；npc）
inst(r("k68",0,0,(C,P,X,))) :- cand(meritoriousService(P)), cand(responsible(P,X,C)).
permissiveRule(r("k68",0,0,(C,P,X,)),sentence(P,X,lighterOrReduced)) :- inst(r("k68",0,0,(C,P,X,))).
mainHead(r("k68",0,0,(C,P,X,)),permissiveRule,sentence(P,X,lighterOrReduced)) :- inst(r("k68",0,0,(C,P,X,))).
cand(sentence(P,X,lighterOrReduced)) :- inst(r("k68",0,0,(C,P,X,))).
body(r("k68",0,0,(C,P,X,)),meritoriousService(P)) :- inst(r("k68",0,0,(C,P,X,))).
body(r("k68",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k68",0,0,(C,P,X,))).

% k68-major[0.0] 有重大立功表现的，可以减轻或者免除处罚（第68条；npc）
inst(r("k68-major",0,0,(C,P,X,))) :- cand(majorMeritoriousService(P)), cand(responsible(P,X,C)).
permissiveRule(r("k68-major",0,0,(C,P,X,)),sentence(P,X,reducedOrExempt)) :- inst(r("k68-major",0,0,(C,P,X,))).
mainHead(r("k68-major",0,0,(C,P,X,)),permissiveRule,sentence(P,X,reducedOrExempt)) :- inst(r("k68-major",0,0,(C,P,X,))).
cand(sentence(P,X,reducedOrExempt)) :- inst(r("k68-major",0,0,(C,P,X,))).
body(r("k68-major",0,0,(C,P,X,)),majorMeritoriousService(P)) :- inst(r("k68-major",0,0,(C,P,X,))).
body(r("k68-major",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k68-major",0,0,(C,P,X,))).

% k72[0.0] 被判处拘役、三年以下有期徒刑，同时符合情节较轻、有悔罪表现、没有再犯罪危险、对社区无重大不良影响的，可以宣告缓刑（第72条第1款；npc）
inst(r("k72",0,0,(P,X,))) :- cand(sentencedDetentionOrUpTo3Years(P,X)), cand(lightCircumstances(X)), cand(showsRepentance(P)), cand(noRiskOfReoffending(P)), cand(noMajorAdverseCommunityImpact(P)).
permissiveRule(r("k72",0,0,(P,X,)),sentence(P,X,probation)) :- inst(r("k72",0,0,(P,X,))).
mainHead(r("k72",0,0,(P,X,)),permissiveRule,sentence(P,X,probation)) :- inst(r("k72",0,0,(P,X,))).
cand(sentence(P,X,probation)) :- inst(r("k72",0,0,(P,X,))).
body(r("k72",0,0,(P,X,)),sentencedDetentionOrUpTo3Years(P,X)) :- inst(r("k72",0,0,(P,X,))).
body(r("k72",0,0,(P,X,)),lightCircumstances(X)) :- inst(r("k72",0,0,(P,X,))).
body(r("k72",0,0,(P,X,)),showsRepentance(P)) :- inst(r("k72",0,0,(P,X,))).
body(r("k72",0,0,(P,X,)),noRiskOfReoffending(P)) :- inst(r("k72",0,0,(P,X,))).
body(r("k72",0,0,(P,X,)),noMajorAdverseCommunityImpact(P)) :- inst(r("k72",0,0,(P,X,))).

% k72-must[0.0] 其中不满十八周岁的人、怀孕的妇女和已满七十五周岁的人，应当宣告缓刑（第72条第1款；npc）
inst(r("k72-must",0,0,(P,X,))) :- cand(sentencedDetentionOrUpTo3Years(P,X)), cand(lightCircumstances(X)), cand(showsRepentance(P)), cand(noRiskOfReoffending(P)), cand(noMajorAdverseCommunityImpact(P)), cand(under18(P)).
prescriptiveRule(r("k72-must",0,0,(P,X,)),sentence(P,X,probation)) :- inst(r("k72-must",0,0,(P,X,))).
mainHead(r("k72-must",0,0,(P,X,)),prescriptiveRule,sentence(P,X,probation)) :- inst(r("k72-must",0,0,(P,X,))).
cand(sentence(P,X,probation)) :- inst(r("k72-must",0,0,(P,X,))).
body(r("k72-must",0,0,(P,X,)),sentencedDetentionOrUpTo3Years(P,X)) :- inst(r("k72-must",0,0,(P,X,))).
body(r("k72-must",0,0,(P,X,)),lightCircumstances(X)) :- inst(r("k72-must",0,0,(P,X,))).
body(r("k72-must",0,0,(P,X,)),showsRepentance(P)) :- inst(r("k72-must",0,0,(P,X,))).
body(r("k72-must",0,0,(P,X,)),noRiskOfReoffending(P)) :- inst(r("k72-must",0,0,(P,X,))).
body(r("k72-must",0,0,(P,X,)),noMajorAdverseCommunityImpact(P)) :- inst(r("k72-must",0,0,(P,X,))).
body(r("k72-must",0,0,(P,X,)),under18(P)) :- inst(r("k72-must",0,0,(P,X,))).
% k72-must[1.0] 其中不满十八周岁的人、怀孕的妇女和已满七十五周岁的人，应当宣告缓刑（第72条第1款；npc）
inst(r("k72-must",1,0,(P,X,))) :- cand(sentencedDetentionOrUpTo3Years(P,X)), cand(lightCircumstances(X)), cand(showsRepentance(P)), cand(noRiskOfReoffending(P)), cand(noMajorAdverseCommunityImpact(P)), cand(pregnant(P)).
prescriptiveRule(r("k72-must",1,0,(P,X,)),sentence(P,X,probation)) :- inst(r("k72-must",1,0,(P,X,))).
mainHead(r("k72-must",1,0,(P,X,)),prescriptiveRule,sentence(P,X,probation)) :- inst(r("k72-must",1,0,(P,X,))).
cand(sentence(P,X,probation)) :- inst(r("k72-must",1,0,(P,X,))).
body(r("k72-must",1,0,(P,X,)),sentencedDetentionOrUpTo3Years(P,X)) :- inst(r("k72-must",1,0,(P,X,))).
body(r("k72-must",1,0,(P,X,)),lightCircumstances(X)) :- inst(r("k72-must",1,0,(P,X,))).
body(r("k72-must",1,0,(P,X,)),showsRepentance(P)) :- inst(r("k72-must",1,0,(P,X,))).
body(r("k72-must",1,0,(P,X,)),noRiskOfReoffending(P)) :- inst(r("k72-must",1,0,(P,X,))).
body(r("k72-must",1,0,(P,X,)),noMajorAdverseCommunityImpact(P)) :- inst(r("k72-must",1,0,(P,X,))).
body(r("k72-must",1,0,(P,X,)),pregnant(P)) :- inst(r("k72-must",1,0,(P,X,))).
% k72-must[2.0] 其中不满十八周岁的人、怀孕的妇女和已满七十五周岁的人，应当宣告缓刑（第72条第1款；npc）
inst(r("k72-must",2,0,(P,X,))) :- cand(sentencedDetentionOrUpTo3Years(P,X)), cand(lightCircumstances(X)), cand(showsRepentance(P)), cand(noRiskOfReoffending(P)), cand(noMajorAdverseCommunityImpact(P)), cand(age75plus(P)).
prescriptiveRule(r("k72-must",2,0,(P,X,)),sentence(P,X,probation)) :- inst(r("k72-must",2,0,(P,X,))).
mainHead(r("k72-must",2,0,(P,X,)),prescriptiveRule,sentence(P,X,probation)) :- inst(r("k72-must",2,0,(P,X,))).
cand(sentence(P,X,probation)) :- inst(r("k72-must",2,0,(P,X,))).
body(r("k72-must",2,0,(P,X,)),sentencedDetentionOrUpTo3Years(P,X)) :- inst(r("k72-must",2,0,(P,X,))).
body(r("k72-must",2,0,(P,X,)),lightCircumstances(X)) :- inst(r("k72-must",2,0,(P,X,))).
body(r("k72-must",2,0,(P,X,)),showsRepentance(P)) :- inst(r("k72-must",2,0,(P,X,))).
body(r("k72-must",2,0,(P,X,)),noRiskOfReoffending(P)) :- inst(r("k72-must",2,0,(P,X,))).
body(r("k72-must",2,0,(P,X,)),noMajorAdverseCommunityImpact(P)) :- inst(r("k72-must",2,0,(P,X,))).
body(r("k72-must",2,0,(P,X,)),age75plus(P)) :- inst(r("k72-must",2,0,(P,X,))).

% tx-t2596[0.0] 分类（自动抽取自图的层级）：对象条件 ⊑ 减刑的条件
inst(r("tx-t2596",0,0,(X,))) :- cand(isA(X,"对象条件")).
constitutiveRule(r("tx-t2596",0,0,(X,)),isA(X,"减刑的条件")) :- inst(r("tx-t2596",0,0,(X,))).
mainHead(r("tx-t2596",0,0,(X,)),constitutiveRule,isA(X,"减刑的条件")) :- inst(r("tx-t2596",0,0,(X,))).
cand(isA(X,"减刑的条件")) :- inst(r("tx-t2596",0,0,(X,))).
body(r("tx-t2596",0,0,(X,)),isA(X,"对象条件")) :- inst(r("tx-t2596",0,0,(X,))).

% tx-t2602[0.0] 分类（自动抽取自图的层级）：实质条件 ⊑ 减刑的条件
inst(r("tx-t2602",0,0,(X,))) :- cand(isA(X,"实质条件")).
constitutiveRule(r("tx-t2602",0,0,(X,)),isA(X,"减刑的条件")) :- inst(r("tx-t2602",0,0,(X,))).
mainHead(r("tx-t2602",0,0,(X,)),constitutiveRule,isA(X,"减刑的条件")) :- inst(r("tx-t2602",0,0,(X,))).
cand(isA(X,"减刑的条件")) :- inst(r("tx-t2602",0,0,(X,))).
body(r("tx-t2602",0,0,(X,)),isA(X,"实质条件")) :- inst(r("tx-t2602",0,0,(X,))).

% tx-t2604[0.0] 分类（自动抽取自图的层级）：可以减刑的实质条件 ⊑ 实质条件
inst(r("tx-t2604",0,0,(X,))) :- cand(isA(X,"可以减刑的实质条件")).
constitutiveRule(r("tx-t2604",0,0,(X,)),isA(X,"实质条件")) :- inst(r("tx-t2604",0,0,(X,))).
mainHead(r("tx-t2604",0,0,(X,)),constitutiveRule,isA(X,"实质条件")) :- inst(r("tx-t2604",0,0,(X,))).
cand(isA(X,"实质条件")) :- inst(r("tx-t2604",0,0,(X,))).
body(r("tx-t2604",0,0,(X,)),isA(X,"可以减刑的实质条件")) :- inst(r("tx-t2604",0,0,(X,))).

% tx-t2622[0.0] 分类（自动抽取自图的层级）：应当减刑的实质条件 ⊑ 实质条件
inst(r("tx-t2622",0,0,(X,))) :- cand(isA(X,"应当减刑的实质条件")).
constitutiveRule(r("tx-t2622",0,0,(X,)),isA(X,"实质条件")) :- inst(r("tx-t2622",0,0,(X,))).
mainHead(r("tx-t2622",0,0,(X,)),constitutiveRule,isA(X,"实质条件")) :- inst(r("tx-t2622",0,0,(X,))).
cand(isA(X,"实质条件")) :- inst(r("tx-t2622",0,0,(X,))).
body(r("tx-t2622",0,0,(X,)),isA(X,"应当减刑的实质条件")) :- inst(r("tx-t2622",0,0,(X,))).

% tx-t2712[0.0] 分类（自动抽取自图的层级）：对象条件 ⊑ 假释的条件
inst(r("tx-t2712",0,0,(X,))) :- cand(isA(X,"对象条件")).
constitutiveRule(r("tx-t2712",0,0,(X,)),isA(X,"假释的条件")) :- inst(r("tx-t2712",0,0,(X,))).
mainHead(r("tx-t2712",0,0,(X,)),constitutiveRule,isA(X,"假释的条件")) :- inst(r("tx-t2712",0,0,(X,))).
cand(isA(X,"假释的条件")) :- inst(r("tx-t2712",0,0,(X,))).
body(r("tx-t2712",0,0,(X,)),isA(X,"对象条件")) :- inst(r("tx-t2712",0,0,(X,))).

% tx-t2721[0.0] 分类（自动抽取自图的层级）：实质条件 ⊑ 假释的条件
inst(r("tx-t2721",0,0,(X,))) :- cand(isA(X,"实质条件")).
constitutiveRule(r("tx-t2721",0,0,(X,)),isA(X,"假释的条件")) :- inst(r("tx-t2721",0,0,(X,))).
mainHead(r("tx-t2721",0,0,(X,)),constitutiveRule,isA(X,"假释的条件")) :- inst(r("tx-t2721",0,0,(X,))).
cand(isA(X,"假释的条件")) :- inst(r("tx-t2721",0,0,(X,))).
body(r("tx-t2721",0,0,(X,)),isA(X,"实质条件")) :- inst(r("tx-t2721",0,0,(X,))).

% tx-t2731[0.0] 分类（自动抽取自图的层级）：限制条件 ⊑ 假释的条件
inst(r("tx-t2731",0,0,(X,))) :- cand(isA(X,"限制条件")).
constitutiveRule(r("tx-t2731",0,0,(X,)),isA(X,"假释的条件")) :- inst(r("tx-t2731",0,0,(X,))).
mainHead(r("tx-t2731",0,0,(X,)),constitutiveRule,isA(X,"假释的条件")) :- inst(r("tx-t2731",0,0,(X,))).
cand(isA(X,"假释的条件")) :- inst(r("tx-t2731",0,0,(X,))).
body(r("tx-t2731",0,0,(X,)),isA(X,"限制条件")) :- inst(r("tx-t2731",0,0,(X,))).

% k81-1[0.0] 执行原判刑期二分之一以上（无期徒刑实际执行十三年以上），确有悔改表现，没有再犯罪危险的，可以假释（第81条第1款；npc）
inst(r("k81-1",0,0,(P,X,))) :- cand(servedHalfOrThirteenYears(P,X)), cand(abidesPrisonRules(P)), cand(showsRepentance(P)), cand(noRiskOfReoffending(P)).
permissiveRule(r("k81-1",0,0,(P,X,)),sentence(P,X,parole)) :- inst(r("k81-1",0,0,(P,X,))).
mainHead(r("k81-1",0,0,(P,X,)),permissiveRule,sentence(P,X,parole)) :- inst(r("k81-1",0,0,(P,X,))).
cand(sentence(P,X,parole)) :- inst(r("k81-1",0,0,(P,X,))).
body(r("k81-1",0,0,(P,X,)),servedHalfOrThirteenYears(P,X)) :- inst(r("k81-1",0,0,(P,X,))).
body(r("k81-1",0,0,(P,X,)),abidesPrisonRules(P)) :- inst(r("k81-1",0,0,(P,X,))).
body(r("k81-1",0,0,(P,X,)),showsRepentance(P)) :- inst(r("k81-1",0,0,(P,X,))).
body(r("k81-1",0,0,(P,X,)),noRiskOfReoffending(P)) :- inst(r("k81-1",0,0,(P,X,))).

% k81-2[0.0] 对累犯以及因故意杀人、强奸、抢劫、绑架、放火、爆炸、投放危险物质或有组织的暴力性犯罪被判处十年以上有期徒刑、无期徒刑的，不得假释（第81条第
inst(r("k81-2",0,0,(P,X,))) :- cand(recidivist(P,X)).
prescriptiveRule(r("k81-2",0,0,(P,X,)),non(sentence(P,X,parole))) :- inst(r("k81-2",0,0,(P,X,))).
mainHead(r("k81-2",0,0,(P,X,)),prescriptiveRule,non(sentence(P,X,parole))) :- inst(r("k81-2",0,0,(P,X,))).
cand(sentence(P,X,parole)) :- inst(r("k81-2",0,0,(P,X,))).
body(r("k81-2",0,0,(P,X,)),recidivist(P,X)) :- inst(r("k81-2",0,0,(P,X,))).
% k81-2[1.0] 对累犯以及因故意杀人、强奸、抢劫、绑架、放火、爆炸、投放危险物质或有组织的暴力性犯罪被判处十年以上有期徒刑、无期徒刑的，不得假释（第81条第
inst(r("k81-2",1,0,(P,X,))) :- cand(violentListedCrime(X)), cand(sentenced10YearsOrMore(P,X)).
prescriptiveRule(r("k81-2",1,0,(P,X,)),non(sentence(P,X,parole))) :- inst(r("k81-2",1,0,(P,X,))).
mainHead(r("k81-2",1,0,(P,X,)),prescriptiveRule,non(sentence(P,X,parole))) :- inst(r("k81-2",1,0,(P,X,))).
cand(sentence(P,X,parole)) :- inst(r("k81-2",1,0,(P,X,))).
body(r("k81-2",1,0,(P,X,)),violentListedCrime(X)) :- inst(r("k81-2",1,0,(P,X,))).
body(r("k81-2",1,0,(P,X,)),sentenced10YearsOrMore(P,X)) :- inst(r("k81-2",1,0,(P,X,))).

% k87-under5[0.0] 犯罪经过下列期限不再追诉：法定最高刑为不满五年有期徒刑的，经过五年（第87条；npc）
inst(r("k87-under5",0,0,(X,))) :- cand(maxStatutoryPenalty(X,under5)), cand(elapsedAtLeast(X,y5)).
constitutiveRule(r("k87-under5",0,0,(X,)),timeBarred(X)) :- inst(r("k87-under5",0,0,(X,))).
mainHead(r("k87-under5",0,0,(X,)),constitutiveRule,timeBarred(X)) :- inst(r("k87-under5",0,0,(X,))).
cand(timeBarred(X)) :- inst(r("k87-under5",0,0,(X,))).
body(r("k87-under5",0,0,(X,)),maxStatutoryPenalty(X,under5)) :- inst(r("k87-under5",0,0,(X,))).
body(r("k87-under5",0,0,(X,)),elapsedAtLeast(X,y5)) :- inst(r("k87-under5",0,0,(X,))).

% k87-from5to10[0.0] 犯罪经过下列期限不再追诉：五年以上不满十年的，经过十年（第87条；npc）
inst(r("k87-from5to10",0,0,(X,))) :- cand(maxStatutoryPenalty(X,from5to10)), cand(elapsedAtLeast(X,y10)).
constitutiveRule(r("k87-from5to10",0,0,(X,)),timeBarred(X)) :- inst(r("k87-from5to10",0,0,(X,))).
mainHead(r("k87-from5to10",0,0,(X,)),constitutiveRule,timeBarred(X)) :- inst(r("k87-from5to10",0,0,(X,))).
cand(timeBarred(X)) :- inst(r("k87-from5to10",0,0,(X,))).
body(r("k87-from5to10",0,0,(X,)),maxStatutoryPenalty(X,from5to10)) :- inst(r("k87-from5to10",0,0,(X,))).
body(r("k87-from5to10",0,0,(X,)),elapsedAtLeast(X,y10)) :- inst(r("k87-from5to10",0,0,(X,))).

% k87-from10[0.0] 犯罪经过下列期限不再追诉：十年以上有期徒刑的，经过十五年（第87条；npc）
inst(r("k87-from10",0,0,(X,))) :- cand(maxStatutoryPenalty(X,from10)), cand(elapsedAtLeast(X,y15)).
constitutiveRule(r("k87-from10",0,0,(X,)),timeBarred(X)) :- inst(r("k87-from10",0,0,(X,))).
mainHead(r("k87-from10",0,0,(X,)),constitutiveRule,timeBarred(X)) :- inst(r("k87-from10",0,0,(X,))).
cand(timeBarred(X)) :- inst(r("k87-from10",0,0,(X,))).
body(r("k87-from10",0,0,(X,)),maxStatutoryPenalty(X,from10)) :- inst(r("k87-from10",0,0,(X,))).
body(r("k87-from10",0,0,(X,)),elapsedAtLeast(X,y15)) :- inst(r("k87-from10",0,0,(X,))).

% k87-lifeOrDeath[0.0] 犯罪经过下列期限不再追诉：无期徒刑、死刑的，经过二十年（第87条；npc）
inst(r("k87-lifeOrDeath",0,0,(X,))) :- cand(maxStatutoryPenalty(X,lifeOrDeath)), cand(elapsedAtLeast(X,y20)).
constitutiveRule(r("k87-lifeOrDeath",0,0,(X,)),timeBarred(X)) :- inst(r("k87-lifeOrDeath",0,0,(X,))).
mainHead(r("k87-lifeOrDeath",0,0,(X,)),constitutiveRule,timeBarred(X)) :- inst(r("k87-lifeOrDeath",0,0,(X,))).
cand(timeBarred(X)) :- inst(r("k87-lifeOrDeath",0,0,(X,))).
body(r("k87-lifeOrDeath",0,0,(X,)),maxStatutoryPenalty(X,lifeOrDeath)) :- inst(r("k87-lifeOrDeath",0,0,(X,))).
body(r("k87-lifeOrDeath",0,0,(X,)),elapsedAtLeast(X,y20)) :- inst(r("k87-lifeOrDeath",0,0,(X,))).
inst(x("k87-lifeOrDeath",0,0,0,(X,))) :- inst(r("k87-lifeOrDeath",0,0,(X,))), cand(sppApprovedProsecution(X)).
constitutiveRule(x("k87-lifeOrDeath",0,0,0,(X,)),non(timeBarred(X))) :- inst(x("k87-lifeOrDeath",0,0,0,(X,))).
body(x("k87-lifeOrDeath",0,0,0,(X,)),maxStatutoryPenalty(X,lifeOrDeath)) :- inst(x("k87-lifeOrDeath",0,0,0,(X,))).
body(x("k87-lifeOrDeath",0,0,0,(X,)),elapsedAtLeast(X,y20)) :- inst(x("k87-lifeOrDeath",0,0,0,(X,))).
body(x("k87-lifeOrDeath",0,0,0,(X,)),sppApprovedProsecution(X)) :- inst(x("k87-lifeOrDeath",0,0,0,(X,))).
superior(x("k87-lifeOrDeath",0,0,0,(X,)),r("k87-lifeOrDeath",0,0,(X,))) :- inst(x("k87-lifeOrDeath",0,0,0,(X,))).
exc(x("k87-lifeOrDeath",0,0,0,(X,)),r("k87-lifeOrDeath",0,0,(X,)),constitutiveRule,timeBarred(X)) :- inst(x("k87-lifeOrDeath",0,0,0,(X,))).

% k87-noProsec[0.0] 超过追诉期限的，不再追诉（第87条；npc）
inst(r("k87-noProsec",0,0,(C,P,X,))) :- cand(timeBarred(X)), cand(responsible(P,X,C)).
constitutiveRule(r("k87-noProsec",0,0,(C,P,X,)),notProsecuted(P,X)) :- inst(r("k87-noProsec",0,0,(C,P,X,))).
mainHead(r("k87-noProsec",0,0,(C,P,X,)),constitutiveRule,notProsecuted(P,X)) :- inst(r("k87-noProsec",0,0,(C,P,X,))).
cand(notProsecuted(P,X)) :- inst(r("k87-noProsec",0,0,(C,P,X,))).
body(r("k87-noProsec",0,0,(C,P,X,)),timeBarred(X)) :- inst(r("k87-noProsec",0,0,(C,P,X,))).
body(r("k87-noProsec",0,0,(C,P,X,)),responsible(P,X,C)) :- inst(r("k87-noProsec",0,0,(C,P,X,))).

% k88-1[0.0] 立案侦查或者法院受理案件以后，逃避侦查或者审判的，不受追诉期限的限制（第88条第1款；npc）
inst(r("k88-1",0,0,(P,X,))) :- cand(caseFiledOrAccepted(X)), cand(evadesInvestigationOrTrial(P,X)).
constitutiveRule(r("k88-1",0,0,(P,X,)),non(timeBarred(X))) :- inst(r("k88-1",0,0,(P,X,))).
mainHead(r("k88-1",0,0,(P,X,)),constitutiveRule,non(timeBarred(X))) :- inst(r("k88-1",0,0,(P,X,))).
cand(timeBarred(X)) :- inst(r("k88-1",0,0,(P,X,))).
body(r("k88-1",0,0,(P,X,)),caseFiledOrAccepted(X)) :- inst(r("k88-1",0,0,(P,X,))).
body(r("k88-1",0,0,(P,X,)),evadesInvestigationOrTrial(P,X)) :- inst(r("k88-1",0,0,(P,X,))).

% k88-2[0.0] 被害人在追诉期限内提出控告，应当立案而不予立案的，不受追诉期限的限制（第88条第2款；npc）
inst(r("k88-2",0,0,(X,))) :- cand(victimComplainedWithinPeriod(X)), cand(authoritiesFailedToFileCase(X)).
constitutiveRule(r("k88-2",0,0,(X,)),non(timeBarred(X))) :- inst(r("k88-2",0,0,(X,))).
mainHead(r("k88-2",0,0,(X,)),constitutiveRule,non(timeBarred(X))) :- inst(r("k88-2",0,0,(X,))).
cand(timeBarred(X)) :- inst(r("k88-2",0,0,(X,))).
body(r("k88-2",0,0,(X,)),victimComplainedWithinPeriod(X)) :- inst(r("k88-2",0,0,(X,))).
body(r("k88-2",0,0,(X,)),authoritiesFailedToFileCase(X)) :- inst(r("k88-2",0,0,(X,))).

% tx-t3033[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 分裂国家罪
inst(r("tx-t3033",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t3033",0,0,(X,)),isA(X,"分裂国家罪")) :- inst(r("tx-t3033",0,0,(X,))).
mainHead(r("tx-t3033",0,0,(X,)),constitutiveRule,isA(X,"分裂国家罪")) :- inst(r("tx-t3033",0,0,(X,))).
cand(isA(X,"分裂国家罪")) :- inst(r("tx-t3033",0,0,(X,))).
body(r("tx-t3033",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t3033",0,0,(X,))).

% tx-t3035[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 分裂国家罪
inst(r("tx-t3035",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t3035",0,0,(X,)),isA(X,"分裂国家罪")) :- inst(r("tx-t3035",0,0,(X,))).
mainHead(r("tx-t3035",0,0,(X,)),constitutiveRule,isA(X,"分裂国家罪")) :- inst(r("tx-t3035",0,0,(X,))).
cand(isA(X,"分裂国家罪")) :- inst(r("tx-t3035",0,0,(X,))).
body(r("tx-t3035",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t3035",0,0,(X,))).

% tx-t3316[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 放火罪
inst(r("tx-t3316",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t3316",0,0,(X,)),isA(X,"放火罪")) :- inst(r("tx-t3316",0,0,(X,))).
mainHead(r("tx-t3316",0,0,(X,)),constitutiveRule,isA(X,"放火罪")) :- inst(r("tx-t3316",0,0,(X,))).
cand(isA(X,"放火罪")) :- inst(r("tx-t3316",0,0,(X,))).
body(r("tx-t3316",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t3316",0,0,(X,))).

% tx-t3318[0.0] 分类（自动抽取自图的层级）：此罪彼罪 ⊑ 放火罪
inst(r("tx-t3318",0,0,(X,))) :- cand(isA(X,"此罪彼罪")).
constitutiveRule(r("tx-t3318",0,0,(X,)),isA(X,"放火罪")) :- inst(r("tx-t3318",0,0,(X,))).
mainHead(r("tx-t3318",0,0,(X,)),constitutiveRule,isA(X,"放火罪")) :- inst(r("tx-t3318",0,0,(X,))).
cand(isA(X,"放火罪")) :- inst(r("tx-t3318",0,0,(X,))).
body(r("tx-t3318",0,0,(X,)),isA(X,"此罪彼罪")) :- inst(r("tx-t3318",0,0,(X,))).

% tx-t3348[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 爆炸罪
inst(r("tx-t3348",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t3348",0,0,(X,)),isA(X,"爆炸罪")) :- inst(r("tx-t3348",0,0,(X,))).
mainHead(r("tx-t3348",0,0,(X,)),constitutiveRule,isA(X,"爆炸罪")) :- inst(r("tx-t3348",0,0,(X,))).
cand(isA(X,"爆炸罪")) :- inst(r("tx-t3348",0,0,(X,))).
body(r("tx-t3348",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t3348",0,0,(X,))).

% tx-t3350[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 爆炸罪
inst(r("tx-t3350",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t3350",0,0,(X,)),isA(X,"爆炸罪")) :- inst(r("tx-t3350",0,0,(X,))).
mainHead(r("tx-t3350",0,0,(X,)),constitutiveRule,isA(X,"爆炸罪")) :- inst(r("tx-t3350",0,0,(X,))).
cand(isA(X,"爆炸罪")) :- inst(r("tx-t3350",0,0,(X,))).
body(r("tx-t3350",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t3350",0,0,(X,))).

% tx-t3371[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 投放危险物质罪
inst(r("tx-t3371",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t3371",0,0,(X,)),isA(X,"投放危险物质罪")) :- inst(r("tx-t3371",0,0,(X,))).
mainHead(r("tx-t3371",0,0,(X,)),constitutiveRule,isA(X,"投放危险物质罪")) :- inst(r("tx-t3371",0,0,(X,))).
cand(isA(X,"投放危险物质罪")) :- inst(r("tx-t3371",0,0,(X,))).
body(r("tx-t3371",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t3371",0,0,(X,))).

% tx-t3373[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 投放危险物质罪
inst(r("tx-t3373",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t3373",0,0,(X,)),isA(X,"投放危险物质罪")) :- inst(r("tx-t3373",0,0,(X,))).
mainHead(r("tx-t3373",0,0,(X,)),constitutiveRule,isA(X,"投放危险物质罪")) :- inst(r("tx-t3373",0,0,(X,))).
cand(isA(X,"投放危险物质罪")) :- inst(r("tx-t3373",0,0,(X,))).
body(r("tx-t3373",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t3373",0,0,(X,))).

% tx-t3489[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 破坏交通工具罪
inst(r("tx-t3489",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t3489",0,0,(X,)),isA(X,"破坏交通工具罪")) :- inst(r("tx-t3489",0,0,(X,))).
mainHead(r("tx-t3489",0,0,(X,)),constitutiveRule,isA(X,"破坏交通工具罪")) :- inst(r("tx-t3489",0,0,(X,))).
cand(isA(X,"破坏交通工具罪")) :- inst(r("tx-t3489",0,0,(X,))).
body(r("tx-t3489",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t3489",0,0,(X,))).

% tx-t3493[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 破坏交通工具罪
inst(r("tx-t3493",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t3493",0,0,(X,)),isA(X,"破坏交通工具罪")) :- inst(r("tx-t3493",0,0,(X,))).
mainHead(r("tx-t3493",0,0,(X,)),constitutiveRule,isA(X,"破坏交通工具罪")) :- inst(r("tx-t3493",0,0,(X,))).
cand(isA(X,"破坏交通工具罪")) :- inst(r("tx-t3493",0,0,(X,))).
body(r("tx-t3493",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t3493",0,0,(X,))).

% k133[0.0] 违反交通运输管理法规，因而发生重大事故，致人重伤、死亡或者使公私财产遭受重大损失的（第133条；npc）
inst(r("k133",0,0,(P,X,))) :- cand(violatesTrafficRegulations(P,X)), cand(majorAccident(X)), cand(causesGraveInjuryOrDeath(X)).
constitutiveRule(r("k133",0,0,(P,X,)),constitutes(P,X,trafficAccident)) :- inst(r("k133",0,0,(P,X,))).
mainHead(r("k133",0,0,(P,X,)),constitutiveRule,constitutes(P,X,trafficAccident)) :- inst(r("k133",0,0,(P,X,))).
cand(constitutes(P,X,trafficAccident)) :- inst(r("k133",0,0,(P,X,))).
body(r("k133",0,0,(P,X,)),violatesTrafficRegulations(P,X)) :- inst(r("k133",0,0,(P,X,))).
body(r("k133",0,0,(P,X,)),majorAccident(X)) :- inst(r("k133",0,0,(P,X,))).
body(r("k133",0,0,(P,X,)),causesGraveInjuryOrDeath(X)) :- inst(r("k133",0,0,(P,X,))).
% k133[1.0] 违反交通运输管理法规，因而发生重大事故，致人重伤、死亡或者使公私财产遭受重大损失的（第133条；npc）
inst(r("k133",1,0,(P,X,))) :- cand(violatesTrafficRegulations(P,X)), cand(majorAccident(X)), cand(majorPropertyLoss(X)).
constitutiveRule(r("k133",1,0,(P,X,)),constitutes(P,X,trafficAccident)) :- inst(r("k133",1,0,(P,X,))).
mainHead(r("k133",1,0,(P,X,)),constitutiveRule,constitutes(P,X,trafficAccident)) :- inst(r("k133",1,0,(P,X,))).
cand(constitutes(P,X,trafficAccident)) :- inst(r("k133",1,0,(P,X,))).
body(r("k133",1,0,(P,X,)),violatesTrafficRegulations(P,X)) :- inst(r("k133",1,0,(P,X,))).
body(r("k133",1,0,(P,X,)),majorAccident(X)) :- inst(r("k133",1,0,(P,X,))).
body(r("k133",1,0,(P,X,)),majorPropertyLoss(X)) :- inst(r("k133",1,0,(P,X,))).

% k133-flee[0.0] 交通运输肇事后逃逸：处三年以上七年以下有期徒刑（第133条；npc）
inst(r("k133-flee",0,0,(P,X,))) :- cand(convicted(P,X,trafficAccident)), cand(fleesAfterAccident(P,X)).
constitutiveRule(r("k133-flee",0,0,(P,X,)),trafficAccidentFleeing(P,X)) :- inst(r("k133-flee",0,0,(P,X,))).
mainHead(r("k133-flee",0,0,(P,X,)),constitutiveRule,trafficAccidentFleeing(P,X)) :- inst(r("k133-flee",0,0,(P,X,))).
cand(trafficAccidentFleeing(P,X)) :- inst(r("k133-flee",0,0,(P,X,))).
body(r("k133-flee",0,0,(P,X,)),convicted(P,X,trafficAccident)) :- inst(r("k133-flee",0,0,(P,X,))).
body(r("k133-flee",0,0,(P,X,)),fleesAfterAccident(P,X)) :- inst(r("k133-flee",0,0,(P,X,))).

% k133-fleedeath[0.0] 因逃逸致人死亡的，处七年以上有期徒刑（第133条；npc）
inst(r("k133-fleedeath",0,0,(P,X,))) :- cand(convicted(P,X,trafficAccident)), cand(fleesAfterAccident(P,X)), cand(victimDiesBecauseOfFleeing(X)).
constitutiveRule(r("k133-fleedeath",0,0,(P,X,)),trafficAccidentFleeingDeath(P,X)) :- inst(r("k133-fleedeath",0,0,(P,X,))).
mainHead(r("k133-fleedeath",0,0,(P,X,)),constitutiveRule,trafficAccidentFleeingDeath(P,X)) :- inst(r("k133-fleedeath",0,0,(P,X,))).
cand(trafficAccidentFleeingDeath(P,X)) :- inst(r("k133-fleedeath",0,0,(P,X,))).
body(r("k133-fleedeath",0,0,(P,X,)),convicted(P,X,trafficAccident)) :- inst(r("k133-fleedeath",0,0,(P,X,))).
body(r("k133-fleedeath",0,0,(P,X,)),fleesAfterAccident(P,X)) :- inst(r("k133-fleedeath",0,0,(P,X,))).
body(r("k133-fleedeath",0,0,(P,X,)),victimDiesBecauseOfFleeing(X)) :- inst(r("k133-fleedeath",0,0,(P,X,))).

% k133-1[0.0] 在道路上驾驶机动车，追逐竞驶情节恶劣、醉酒驾驶、校车或客运严重超员超速、违规运输危险化学品的（第133条之一第1款；npc）
inst(r("k133-1",0,0,(P,X,))) :- cand(drivesMotorVehicleOnRoad(P,X)), cand(racingSerious(P,X)).
constitutiveRule(r("k133-1",0,0,(P,X,)),constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",0,0,(P,X,))).
mainHead(r("k133-1",0,0,(P,X,)),constitutiveRule,constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",0,0,(P,X,))).
cand(constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",0,0,(P,X,))).
body(r("k133-1",0,0,(P,X,)),drivesMotorVehicleOnRoad(P,X)) :- inst(r("k133-1",0,0,(P,X,))).
body(r("k133-1",0,0,(P,X,)),racingSerious(P,X)) :- inst(r("k133-1",0,0,(P,X,))).
% k133-1[1.0] 在道路上驾驶机动车，追逐竞驶情节恶劣、醉酒驾驶、校车或客运严重超员超速、违规运输危险化学品的（第133条之一第1款；npc）
inst(r("k133-1",1,0,(P,X,))) :- cand(drivesMotorVehicleOnRoad(P,X)), cand(drunkDriving(P,X)).
constitutiveRule(r("k133-1",1,0,(P,X,)),constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",1,0,(P,X,))).
mainHead(r("k133-1",1,0,(P,X,)),constitutiveRule,constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",1,0,(P,X,))).
cand(constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",1,0,(P,X,))).
body(r("k133-1",1,0,(P,X,)),drivesMotorVehicleOnRoad(P,X)) :- inst(r("k133-1",1,0,(P,X,))).
body(r("k133-1",1,0,(P,X,)),drunkDriving(P,X)) :- inst(r("k133-1",1,0,(P,X,))).
% k133-1[2.0] 在道路上驾驶机动车，追逐竞驶情节恶劣、醉酒驾驶、校车或客运严重超员超速、违规运输危险化学品的（第133条之一第1款；npc）
inst(r("k133-1",2,0,(P,X,))) :- cand(drivesMotorVehicleOnRoad(P,X)), cand(seriousOverloadOrSpeeding(P,X)).
constitutiveRule(r("k133-1",2,0,(P,X,)),constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",2,0,(P,X,))).
mainHead(r("k133-1",2,0,(P,X,)),constitutiveRule,constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",2,0,(P,X,))).
cand(constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",2,0,(P,X,))).
body(r("k133-1",2,0,(P,X,)),drivesMotorVehicleOnRoad(P,X)) :- inst(r("k133-1",2,0,(P,X,))).
body(r("k133-1",2,0,(P,X,)),seriousOverloadOrSpeeding(P,X)) :- inst(r("k133-1",2,0,(P,X,))).
% k133-1[3.0] 在道路上驾驶机动车，追逐竞驶情节恶劣、醉酒驾驶、校车或客运严重超员超速、违规运输危险化学品的（第133条之一第1款；npc）
inst(r("k133-1",3,0,(P,X,))) :- cand(drivesMotorVehicleOnRoad(P,X)), cand(illegalHazardousTransport(P,X)).
constitutiveRule(r("k133-1",3,0,(P,X,)),constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",3,0,(P,X,))).
mainHead(r("k133-1",3,0,(P,X,)),constitutiveRule,constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",3,0,(P,X,))).
cand(constitutes(P,X,dangerousDriving)) :- inst(r("k133-1",3,0,(P,X,))).
body(r("k133-1",3,0,(P,X,)),drivesMotorVehicleOnRoad(P,X)) :- inst(r("k133-1",3,0,(P,X,))).
body(r("k133-1",3,0,(P,X,)),illegalHazardousTransport(P,X)) :- inst(r("k133-1",3,0,(P,X,))).

% tx-t3658[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 危险驾驶罪
inst(r("tx-t3658",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t3658",0,0,(X,)),isA(X,"危险驾驶罪")) :- inst(r("tx-t3658",0,0,(X,))).
mainHead(r("tx-t3658",0,0,(X,)),constitutiveRule,isA(X,"危险驾驶罪")) :- inst(r("tx-t3658",0,0,(X,))).
cand(isA(X,"危险驾驶罪")) :- inst(r("tx-t3658",0,0,(X,))).
body(r("tx-t3658",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t3658",0,0,(X,))).

% tx-t3661[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 危险驾驶罪
inst(r("tx-t3661",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t3661",0,0,(X,)),isA(X,"危险驾驶罪")) :- inst(r("tx-t3661",0,0,(X,))).
mainHead(r("tx-t3661",0,0,(X,)),constitutiveRule,isA(X,"危险驾驶罪")) :- inst(r("tx-t3661",0,0,(X,))).
cand(isA(X,"危险驾驶罪")) :- inst(r("tx-t3661",0,0,(X,))).
body(r("tx-t3661",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t3661",0,0,(X,))).

% tx-t3740[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 劫持航空器罪
inst(r("tx-t3740",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t3740",0,0,(X,)),isA(X,"劫持航空器罪")) :- inst(r("tx-t3740",0,0,(X,))).
mainHead(r("tx-t3740",0,0,(X,)),constitutiveRule,isA(X,"劫持航空器罪")) :- inst(r("tx-t3740",0,0,(X,))).
cand(isA(X,"劫持航空器罪")) :- inst(r("tx-t3740",0,0,(X,))).
body(r("tx-t3740",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t3740",0,0,(X,))).

% tx-t3742[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 劫持航空器罪
inst(r("tx-t3742",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t3742",0,0,(X,)),isA(X,"劫持航空器罪")) :- inst(r("tx-t3742",0,0,(X,))).
mainHead(r("tx-t3742",0,0,(X,)),constitutiveRule,isA(X,"劫持航空器罪")) :- inst(r("tx-t3742",0,0,(X,))).
cand(isA(X,"劫持航空器罪")) :- inst(r("tx-t3742",0,0,(X,))).
body(r("tx-t3742",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t3742",0,0,(X,))).

% tx-t3943[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 重大责任事故罪
inst(r("tx-t3943",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t3943",0,0,(X,)),isA(X,"重大责任事故罪")) :- inst(r("tx-t3943",0,0,(X,))).
mainHead(r("tx-t3943",0,0,(X,)),constitutiveRule,isA(X,"重大责任事故罪")) :- inst(r("tx-t3943",0,0,(X,))).
cand(isA(X,"重大责任事故罪")) :- inst(r("tx-t3943",0,0,(X,))).
body(r("tx-t3943",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t3943",0,0,(X,))).

% tx-t3955[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 重大责任事故罪
inst(r("tx-t3955",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t3955",0,0,(X,)),isA(X,"重大责任事故罪")) :- inst(r("tx-t3955",0,0,(X,))).
mainHead(r("tx-t3955",0,0,(X,)),constitutiveRule,isA(X,"重大责任事故罪")) :- inst(r("tx-t3955",0,0,(X,))).
cand(isA(X,"重大责任事故罪")) :- inst(r("tx-t3955",0,0,(X,))).
body(r("tx-t3955",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t3955",0,0,(X,))).

% tx-t3967[0.0] 分类（自动抽取自图的层级）：过失致人死亡的特别法条 ⊑ 特别法条
inst(r("tx-t3967",0,0,(X,))) :- cand(isA(X,"过失致人死亡的特别法条")).
constitutiveRule(r("tx-t3967",0,0,(X,)),isA(X,"特别法条")) :- inst(r("tx-t3967",0,0,(X,))).
mainHead(r("tx-t3967",0,0,(X,)),constitutiveRule,isA(X,"特别法条")) :- inst(r("tx-t3967",0,0,(X,))).
cand(isA(X,"特别法条")) :- inst(r("tx-t3967",0,0,(X,))).
body(r("tx-t3967",0,0,(X,)),isA(X,"过失致人死亡的特别法条")) :- inst(r("tx-t3967",0,0,(X,))).

% tx-t3968[0.0] 分类（自动抽取自图的层级）：失火罪的特别法条 ⊑ 特别法条
inst(r("tx-t3968",0,0,(X,))) :- cand(isA(X,"失火罪的特别法条")).
constitutiveRule(r("tx-t3968",0,0,(X,)),isA(X,"特别法条")) :- inst(r("tx-t3968",0,0,(X,))).
mainHead(r("tx-t3968",0,0,(X,)),constitutiveRule,isA(X,"特别法条")) :- inst(r("tx-t3968",0,0,(X,))).
cand(isA(X,"特别法条")) :- inst(r("tx-t3968",0,0,(X,))).
body(r("tx-t3968",0,0,(X,)),isA(X,"失火罪的特别法条")) :- inst(r("tx-t3968",0,0,(X,))).

% tx-t4030[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 危险作业罪
inst(r("tx-t4030",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t4030",0,0,(X,)),isA(X,"危险作业罪")) :- inst(r("tx-t4030",0,0,(X,))).
mainHead(r("tx-t4030",0,0,(X,)),constitutiveRule,isA(X,"危险作业罪")) :- inst(r("tx-t4030",0,0,(X,))).
cand(isA(X,"危险作业罪")) :- inst(r("tx-t4030",0,0,(X,))).
body(r("tx-t4030",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t4030",0,0,(X,))).

% tx-t4032[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 危险作业罪
inst(r("tx-t4032",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t4032",0,0,(X,)),isA(X,"危险作业罪")) :- inst(r("tx-t4032",0,0,(X,))).
mainHead(r("tx-t4032",0,0,(X,)),constitutiveRule,isA(X,"危险作业罪")) :- inst(r("tx-t4032",0,0,(X,))).
cand(isA(X,"危险作业罪")) :- inst(r("tx-t4032",0,0,(X,))).
body(r("tx-t4032",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t4032",0,0,(X,))).

% tx-t4443[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 非国家工作人员受贿罪
inst(r("tx-t4443",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t4443",0,0,(X,)),isA(X,"非国家工作人员受贿罪")) :- inst(r("tx-t4443",0,0,(X,))).
mainHead(r("tx-t4443",0,0,(X,)),constitutiveRule,isA(X,"非国家工作人员受贿罪")) :- inst(r("tx-t4443",0,0,(X,))).
cand(isA(X,"非国家工作人员受贿罪")) :- inst(r("tx-t4443",0,0,(X,))).
body(r("tx-t4443",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t4443",0,0,(X,))).

% tx-t4449[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 非国家工作人员受贿罪
inst(r("tx-t4449",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t4449",0,0,(X,)),isA(X,"非国家工作人员受贿罪")) :- inst(r("tx-t4449",0,0,(X,))).
mainHead(r("tx-t4449",0,0,(X,)),constitutiveRule,isA(X,"非国家工作人员受贿罪")) :- inst(r("tx-t4449",0,0,(X,))).
cand(isA(X,"非国家工作人员受贿罪")) :- inst(r("tx-t4449",0,0,(X,))).
body(r("tx-t4449",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t4449",0,0,(X,))).

% tx-t4570[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 非法吸收公众存款罪
inst(r("tx-t4570",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t4570",0,0,(X,)),isA(X,"非法吸收公众存款罪")) :- inst(r("tx-t4570",0,0,(X,))).
mainHead(r("tx-t4570",0,0,(X,)),constitutiveRule,isA(X,"非法吸收公众存款罪")) :- inst(r("tx-t4570",0,0,(X,))).
cand(isA(X,"非法吸收公众存款罪")) :- inst(r("tx-t4570",0,0,(X,))).
body(r("tx-t4570",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t4570",0,0,(X,))).

% tx-t4605[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 非法吸收公众存款罪
inst(r("tx-t4605",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t4605",0,0,(X,)),isA(X,"非法吸收公众存款罪")) :- inst(r("tx-t4605",0,0,(X,))).
mainHead(r("tx-t4605",0,0,(X,)),constitutiveRule,isA(X,"非法吸收公众存款罪")) :- inst(r("tx-t4605",0,0,(X,))).
cand(isA(X,"非法吸收公众存款罪")) :- inst(r("tx-t4605",0,0,(X,))).
body(r("tx-t4605",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t4605",0,0,(X,))).

% tx-t4645[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 妨害信用卡管理罪
inst(r("tx-t4645",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t4645",0,0,(X,)),isA(X,"妨害信用卡管理罪")) :- inst(r("tx-t4645",0,0,(X,))).
mainHead(r("tx-t4645",0,0,(X,)),constitutiveRule,isA(X,"妨害信用卡管理罪")) :- inst(r("tx-t4645",0,0,(X,))).
cand(isA(X,"妨害信用卡管理罪")) :- inst(r("tx-t4645",0,0,(X,))).
body(r("tx-t4645",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t4645",0,0,(X,))).

% tx-t4648[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 妨害信用卡管理罪
inst(r("tx-t4648",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t4648",0,0,(X,)),isA(X,"妨害信用卡管理罪")) :- inst(r("tx-t4648",0,0,(X,))).
mainHead(r("tx-t4648",0,0,(X,)),constitutiveRule,isA(X,"妨害信用卡管理罪")) :- inst(r("tx-t4648",0,0,(X,))).
cand(isA(X,"妨害信用卡管理罪")) :- inst(r("tx-t4648",0,0,(X,))).
body(r("tx-t4648",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t4648",0,0,(X,))).

% tx-t4761[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 利用未公开信息交易罪
inst(r("tx-t4761",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t4761",0,0,(X,)),isA(X,"利用未公开信息交易罪")) :- inst(r("tx-t4761",0,0,(X,))).
mainHead(r("tx-t4761",0,0,(X,)),constitutiveRule,isA(X,"利用未公开信息交易罪")) :- inst(r("tx-t4761",0,0,(X,))).
cand(isA(X,"利用未公开信息交易罪")) :- inst(r("tx-t4761",0,0,(X,))).
body(r("tx-t4761",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t4761",0,0,(X,))).

% tx-t4763[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 利用未公开信息交易罪
inst(r("tx-t4763",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t4763",0,0,(X,)),isA(X,"利用未公开信息交易罪")) :- inst(r("tx-t4763",0,0,(X,))).
mainHead(r("tx-t4763",0,0,(X,)),constitutiveRule,isA(X,"利用未公开信息交易罪")) :- inst(r("tx-t4763",0,0,(X,))).
cand(isA(X,"利用未公开信息交易罪")) :- inst(r("tx-t4763",0,0,(X,))).
body(r("tx-t4763",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t4763",0,0,(X,))).

% tx-t4955[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 贷款诈骗罪
inst(r("tx-t4955",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t4955",0,0,(X,)),isA(X,"贷款诈骗罪")) :- inst(r("tx-t4955",0,0,(X,))).
mainHead(r("tx-t4955",0,0,(X,)),constitutiveRule,isA(X,"贷款诈骗罪")) :- inst(r("tx-t4955",0,0,(X,))).
cand(isA(X,"贷款诈骗罪")) :- inst(r("tx-t4955",0,0,(X,))).
body(r("tx-t4955",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t4955",0,0,(X,))).

% tx-t4962[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 贷款诈骗罪
inst(r("tx-t4962",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t4962",0,0,(X,)),isA(X,"贷款诈骗罪")) :- inst(r("tx-t4962",0,0,(X,))).
mainHead(r("tx-t4962",0,0,(X,)),constitutiveRule,isA(X,"贷款诈骗罪")) :- inst(r("tx-t4962",0,0,(X,))).
cand(isA(X,"贷款诈骗罪")) :- inst(r("tx-t4962",0,0,(X,))).
body(r("tx-t4962",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t4962",0,0,(X,))).

% tx-t5089[0.0] 分类（自动抽取自图的层级）：逃税罪 ⊑ 危害税收征管罪
inst(r("tx-t5089",0,0,(X,))) :- cand(isA(X,"逃税罪")).
constitutiveRule(r("tx-t5089",0,0,(X,)),isA(X,"危害税收征管罪")) :- inst(r("tx-t5089",0,0,(X,))).
mainHead(r("tx-t5089",0,0,(X,)),constitutiveRule,isA(X,"危害税收征管罪")) :- inst(r("tx-t5089",0,0,(X,))).
cand(isA(X,"危害税收征管罪")) :- inst(r("tx-t5089",0,0,(X,))).
body(r("tx-t5089",0,0,(X,)),isA(X,"逃税罪")) :- inst(r("tx-t5089",0,0,(X,))).

% tx-t5125[0.0] 分类（自动抽取自图的层级）：抗税罪 ⊑ 危害税收征管罪
inst(r("tx-t5125",0,0,(X,))) :- cand(isA(X,"抗税罪")).
constitutiveRule(r("tx-t5125",0,0,(X,)),isA(X,"危害税收征管罪")) :- inst(r("tx-t5125",0,0,(X,))).
mainHead(r("tx-t5125",0,0,(X,)),constitutiveRule,isA(X,"危害税收征管罪")) :- inst(r("tx-t5125",0,0,(X,))).
cand(isA(X,"危害税收征管罪")) :- inst(r("tx-t5125",0,0,(X,))).
body(r("tx-t5125",0,0,(X,)),isA(X,"抗税罪")) :- inst(r("tx-t5125",0,0,(X,))).

% tx-t5108[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 逃税罪
inst(r("tx-t5108",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t5108",0,0,(X,)),isA(X,"逃税罪")) :- inst(r("tx-t5108",0,0,(X,))).
mainHead(r("tx-t5108",0,0,(X,)),constitutiveRule,isA(X,"逃税罪")) :- inst(r("tx-t5108",0,0,(X,))).
cand(isA(X,"逃税罪")) :- inst(r("tx-t5108",0,0,(X,))).
body(r("tx-t5108",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t5108",0,0,(X,))).

% tx-t5118[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 逃税罪
inst(r("tx-t5118",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t5118",0,0,(X,)),isA(X,"逃税罪")) :- inst(r("tx-t5118",0,0,(X,))).
mainHead(r("tx-t5118",0,0,(X,)),constitutiveRule,isA(X,"逃税罪")) :- inst(r("tx-t5118",0,0,(X,))).
cand(isA(X,"逃税罪")) :- inst(r("tx-t5118",0,0,(X,))).
body(r("tx-t5118",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t5118",0,0,(X,))).

% tx-t5206[0.0] 分类（自动抽取自图的层级）：假冒注册商标罪 ⊑ 侵犯知识产权罪
inst(r("tx-t5206",0,0,(X,))) :- cand(isA(X,"假冒注册商标罪")).
constitutiveRule(r("tx-t5206",0,0,(X,)),isA(X,"侵犯知识产权罪")) :- inst(r("tx-t5206",0,0,(X,))).
mainHead(r("tx-t5206",0,0,(X,)),constitutiveRule,isA(X,"侵犯知识产权罪")) :- inst(r("tx-t5206",0,0,(X,))).
cand(isA(X,"侵犯知识产权罪")) :- inst(r("tx-t5206",0,0,(X,))).
body(r("tx-t5206",0,0,(X,)),isA(X,"假冒注册商标罪")) :- inst(r("tx-t5206",0,0,(X,))).

% tx-t5323[0.0] 分类（自动抽取自图的层级）：销售侵权复制品罪 ⊑ 侵犯知识产权罪
inst(r("tx-t5323",0,0,(X,))) :- cand(isA(X,"销售侵权复制品罪")).
constitutiveRule(r("tx-t5323",0,0,(X,)),isA(X,"侵犯知识产权罪")) :- inst(r("tx-t5323",0,0,(X,))).
mainHead(r("tx-t5323",0,0,(X,)),constitutiveRule,isA(X,"侵犯知识产权罪")) :- inst(r("tx-t5323",0,0,(X,))).
cand(isA(X,"侵犯知识产权罪")) :- inst(r("tx-t5323",0,0,(X,))).
body(r("tx-t5323",0,0,(X,)),isA(X,"销售侵权复制品罪")) :- inst(r("tx-t5323",0,0,(X,))).

% tx-t5347[0.0] 分类（自动抽取自图的层级）：侵犯商业秘密罪 ⊑ 侵犯知识产权罪
inst(r("tx-t5347",0,0,(X,))) :- cand(isA(X,"侵犯商业秘密罪")).
constitutiveRule(r("tx-t5347",0,0,(X,)),isA(X,"侵犯知识产权罪")) :- inst(r("tx-t5347",0,0,(X,))).
mainHead(r("tx-t5347",0,0,(X,)),constitutiveRule,isA(X,"侵犯知识产权罪")) :- inst(r("tx-t5347",0,0,(X,))).
cand(isA(X,"侵犯知识产权罪")) :- inst(r("tx-t5347",0,0,(X,))).
body(r("tx-t5347",0,0,(X,)),isA(X,"侵犯商业秘密罪")) :- inst(r("tx-t5347",0,0,(X,))).

% tx-t5241[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 假冒注册商标罪
inst(r("tx-t5241",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t5241",0,0,(X,)),isA(X,"假冒注册商标罪")) :- inst(r("tx-t5241",0,0,(X,))).
mainHead(r("tx-t5241",0,0,(X,)),constitutiveRule,isA(X,"假冒注册商标罪")) :- inst(r("tx-t5241",0,0,(X,))).
cand(isA(X,"假冒注册商标罪")) :- inst(r("tx-t5241",0,0,(X,))).
body(r("tx-t5241",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t5241",0,0,(X,))).

% tx-t5251[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 假冒注册商标罪
inst(r("tx-t5251",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t5251",0,0,(X,)),isA(X,"假冒注册商标罪")) :- inst(r("tx-t5251",0,0,(X,))).
mainHead(r("tx-t5251",0,0,(X,)),constitutiveRule,isA(X,"假冒注册商标罪")) :- inst(r("tx-t5251",0,0,(X,))).
cand(isA(X,"假冒注册商标罪")) :- inst(r("tx-t5251",0,0,(X,))).
body(r("tx-t5251",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t5251",0,0,(X,))).

% tx-t5381[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 侵犯商业秘密罪
inst(r("tx-t5381",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t5381",0,0,(X,)),isA(X,"侵犯商业秘密罪")) :- inst(r("tx-t5381",0,0,(X,))).
mainHead(r("tx-t5381",0,0,(X,)),constitutiveRule,isA(X,"侵犯商业秘密罪")) :- inst(r("tx-t5381",0,0,(X,))).
cand(isA(X,"侵犯商业秘密罪")) :- inst(r("tx-t5381",0,0,(X,))).
body(r("tx-t5381",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t5381",0,0,(X,))).

% tx-t5387[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 侵犯商业秘密罪
inst(r("tx-t5387",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t5387",0,0,(X,)),isA(X,"侵犯商业秘密罪")) :- inst(r("tx-t5387",0,0,(X,))).
mainHead(r("tx-t5387",0,0,(X,)),constitutiveRule,isA(X,"侵犯商业秘密罪")) :- inst(r("tx-t5387",0,0,(X,))).
cand(isA(X,"侵犯商业秘密罪")) :- inst(r("tx-t5387",0,0,(X,))).
body(r("tx-t5387",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t5387",0,0,(X,))).

% tx-t5413[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 合同诈骗罪
inst(r("tx-t5413",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t5413",0,0,(X,)),isA(X,"合同诈骗罪")) :- inst(r("tx-t5413",0,0,(X,))).
mainHead(r("tx-t5413",0,0,(X,)),constitutiveRule,isA(X,"合同诈骗罪")) :- inst(r("tx-t5413",0,0,(X,))).
cand(isA(X,"合同诈骗罪")) :- inst(r("tx-t5413",0,0,(X,))).
body(r("tx-t5413",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t5413",0,0,(X,))).

% tx-t5417[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 合同诈骗罪
inst(r("tx-t5417",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t5417",0,0,(X,)),isA(X,"合同诈骗罪")) :- inst(r("tx-t5417",0,0,(X,))).
mainHead(r("tx-t5417",0,0,(X,)),constitutiveRule,isA(X,"合同诈骗罪")) :- inst(r("tx-t5417",0,0,(X,))).
cand(isA(X,"合同诈骗罪")) :- inst(r("tx-t5417",0,0,(X,))).
body(r("tx-t5417",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t5417",0,0,(X,))).

% tx-t5494[0.0] 分类（自动抽取自图的层级）：本罪VS集资诈骗罪 ⊑ 此罪与彼罪
inst(r("tx-t5494",0,0,(X,))) :- cand(isA(X,"本罪VS集资诈骗罪")).
constitutiveRule(r("tx-t5494",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t5494",0,0,(X,))).
mainHead(r("tx-t5494",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t5494",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t5494",0,0,(X,))).
body(r("tx-t5494",0,0,(X,)),isA(X,"本罪VS集资诈骗罪")) :- inst(r("tx-t5494",0,0,(X,))).

% tx-t5496[0.0] 分类（自动抽取自图的层级）：本罪VS非法经营罪 ⊑ 此罪与彼罪
inst(r("tx-t5496",0,0,(X,))) :- cand(isA(X,"本罪VS非法经营罪")).
constitutiveRule(r("tx-t5496",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t5496",0,0,(X,))).
mainHead(r("tx-t5496",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t5496",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t5496",0,0,(X,))).
body(r("tx-t5496",0,0,(X,)),isA(X,"本罪VS非法经营罪")) :- inst(r("tx-t5496",0,0,(X,))).

% k232[0.0] 故意杀人的（第232条；npc）
inst(r("k232",0,0,(P,X,))) :- cand(intentionallyKills(P,X)).
constitutiveRule(r("k232",0,0,(P,X,)),constitutes(P,X,intentionalHomicide)) :- inst(r("k232",0,0,(P,X,))).
mainHead(r("k232",0,0,(P,X,)),constitutiveRule,constitutes(P,X,intentionalHomicide)) :- inst(r("k232",0,0,(P,X,))).
cand(constitutes(P,X,intentionalHomicide)) :- inst(r("k232",0,0,(P,X,))).
body(r("k232",0,0,(P,X,)),intentionallyKills(P,X)) :- inst(r("k232",0,0,(P,X,))).

% tx-t5670[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 故意杀人罪
inst(r("tx-t5670",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t5670",0,0,(X,)),isA(X,"故意杀人罪")) :- inst(r("tx-t5670",0,0,(X,))).
mainHead(r("tx-t5670",0,0,(X,)),constitutiveRule,isA(X,"故意杀人罪")) :- inst(r("tx-t5670",0,0,(X,))).
cand(isA(X,"故意杀人罪")) :- inst(r("tx-t5670",0,0,(X,))).
body(r("tx-t5670",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t5670",0,0,(X,))).

% tx-t5684[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 故意杀人罪
inst(r("tx-t5684",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t5684",0,0,(X,)),isA(X,"故意杀人罪")) :- inst(r("tx-t5684",0,0,(X,))).
mainHead(r("tx-t5684",0,0,(X,)),constitutiveRule,isA(X,"故意杀人罪")) :- inst(r("tx-t5684",0,0,(X,))).
cand(isA(X,"故意杀人罪")) :- inst(r("tx-t5684",0,0,(X,))).
body(r("tx-t5684",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t5684",0,0,(X,))).

% tx-t5727[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 过失致人死亡罪
inst(r("tx-t5727",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t5727",0,0,(X,)),isA(X,"过失致人死亡罪")) :- inst(r("tx-t5727",0,0,(X,))).
mainHead(r("tx-t5727",0,0,(X,)),constitutiveRule,isA(X,"过失致人死亡罪")) :- inst(r("tx-t5727",0,0,(X,))).
cand(isA(X,"过失致人死亡罪")) :- inst(r("tx-t5727",0,0,(X,))).
body(r("tx-t5727",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t5727",0,0,(X,))).

% tx-t5729[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 过失致人死亡罪
inst(r("tx-t5729",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t5729",0,0,(X,)),isA(X,"过失致人死亡罪")) :- inst(r("tx-t5729",0,0,(X,))).
mainHead(r("tx-t5729",0,0,(X,)),constitutiveRule,isA(X,"过失致人死亡罪")) :- inst(r("tx-t5729",0,0,(X,))).
cand(isA(X,"过失致人死亡罪")) :- inst(r("tx-t5729",0,0,(X,))).
body(r("tx-t5729",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t5729",0,0,(X,))).

% k234[0.0] 故意伤害他人身体的（第234条第1款；npc）
inst(r("k234",0,0,(P,X,))) :- cand(intentionallyInjures(P,X)).
constitutiveRule(r("k234",0,0,(P,X,)),constitutes(P,X,intentionalInjury)) :- inst(r("k234",0,0,(P,X,))).
mainHead(r("k234",0,0,(P,X,)),constitutiveRule,constitutes(P,X,intentionalInjury)) :- inst(r("k234",0,0,(P,X,))).
cand(constitutes(P,X,intentionalInjury)) :- inst(r("k234",0,0,(P,X,))).
body(r("k234",0,0,(P,X,)),intentionallyInjures(P,X)) :- inst(r("k234",0,0,(P,X,))).

% tx-t5885[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 雇用童工从事危重劳动罪
inst(r("tx-t5885",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t5885",0,0,(X,)),isA(X,"雇用童工从事危重劳动罪")) :- inst(r("tx-t5885",0,0,(X,))).
mainHead(r("tx-t5885",0,0,(X,)),constitutiveRule,isA(X,"雇用童工从事危重劳动罪")) :- inst(r("tx-t5885",0,0,(X,))).
cand(isA(X,"雇用童工从事危重劳动罪")) :- inst(r("tx-t5885",0,0,(X,))).
body(r("tx-t5885",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t5885",0,0,(X,))).

% tx-t5888[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 雇用童工从事危重劳动罪
inst(r("tx-t5888",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t5888",0,0,(X,)),isA(X,"雇用童工从事危重劳动罪")) :- inst(r("tx-t5888",0,0,(X,))).
mainHead(r("tx-t5888",0,0,(X,)),constitutiveRule,isA(X,"雇用童工从事危重劳动罪")) :- inst(r("tx-t5888",0,0,(X,))).
cand(isA(X,"雇用童工从事危重劳动罪")) :- inst(r("tx-t5888",0,0,(X,))).
body(r("tx-t5888",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t5888",0,0,(X,))).

% tx-t5999[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 负有照护职责人员性侵罪
inst(r("tx-t5999",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t5999",0,0,(X,)),isA(X,"负有照护职责人员性侵罪")) :- inst(r("tx-t5999",0,0,(X,))).
mainHead(r("tx-t5999",0,0,(X,)),constitutiveRule,isA(X,"负有照护职责人员性侵罪")) :- inst(r("tx-t5999",0,0,(X,))).
cand(isA(X,"负有照护职责人员性侵罪")) :- inst(r("tx-t5999",0,0,(X,))).
body(r("tx-t5999",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t5999",0,0,(X,))).

% tx-t6002[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 负有照护职责人员性侵罪
inst(r("tx-t6002",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t6002",0,0,(X,)),isA(X,"负有照护职责人员性侵罪")) :- inst(r("tx-t6002",0,0,(X,))).
mainHead(r("tx-t6002",0,0,(X,)),constitutiveRule,isA(X,"负有照护职责人员性侵罪")) :- inst(r("tx-t6002",0,0,(X,))).
cand(isA(X,"负有照护职责人员性侵罪")) :- inst(r("tx-t6002",0,0,(X,))).
body(r("tx-t6002",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6002",0,0,(X,))).

% tx-t6108[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 非法拘禁罪
inst(r("tx-t6108",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t6108",0,0,(X,)),isA(X,"非法拘禁罪")) :- inst(r("tx-t6108",0,0,(X,))).
mainHead(r("tx-t6108",0,0,(X,)),constitutiveRule,isA(X,"非法拘禁罪")) :- inst(r("tx-t6108",0,0,(X,))).
cand(isA(X,"非法拘禁罪")) :- inst(r("tx-t6108",0,0,(X,))).
body(r("tx-t6108",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t6108",0,0,(X,))).

% tx-t6119[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 非法拘禁罪
inst(r("tx-t6119",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t6119",0,0,(X,)),isA(X,"非法拘禁罪")) :- inst(r("tx-t6119",0,0,(X,))).
mainHead(r("tx-t6119",0,0,(X,)),constitutiveRule,isA(X,"非法拘禁罪")) :- inst(r("tx-t6119",0,0,(X,))).
cand(isA(X,"非法拘禁罪")) :- inst(r("tx-t6119",0,0,(X,))).
body(r("tx-t6119",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6119",0,0,(X,))).

% tx-t6150[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 绑架罪
inst(r("tx-t6150",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t6150",0,0,(X,)),isA(X,"绑架罪")) :- inst(r("tx-t6150",0,0,(X,))).
mainHead(r("tx-t6150",0,0,(X,)),constitutiveRule,isA(X,"绑架罪")) :- inst(r("tx-t6150",0,0,(X,))).
cand(isA(X,"绑架罪")) :- inst(r("tx-t6150",0,0,(X,))).
body(r("tx-t6150",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t6150",0,0,(X,))).

% tx-t6153[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 绑架罪
inst(r("tx-t6153",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t6153",0,0,(X,)),isA(X,"绑架罪")) :- inst(r("tx-t6153",0,0,(X,))).
mainHead(r("tx-t6153",0,0,(X,)),constitutiveRule,isA(X,"绑架罪")) :- inst(r("tx-t6153",0,0,(X,))).
cand(isA(X,"绑架罪")) :- inst(r("tx-t6153",0,0,(X,))).
body(r("tx-t6153",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6153",0,0,(X,))).

% tx-t6154[0.0] 分类（自动抽取自图的层级）：绑架罪VS非法拘禁罪 ⊑ 此罪与彼罪
inst(r("tx-t6154",0,0,(X,))) :- cand(isA(X,"绑架罪VS非法拘禁罪")).
constitutiveRule(r("tx-t6154",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6154",0,0,(X,))).
mainHead(r("tx-t6154",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t6154",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t6154",0,0,(X,))).
body(r("tx-t6154",0,0,(X,)),isA(X,"绑架罪VS非法拘禁罪")) :- inst(r("tx-t6154",0,0,(X,))).

% tx-t6175[0.0] 分类（自动抽取自图的层级）：绑架罪VS抢劫罪 ⊑ 此罪与彼罪
inst(r("tx-t6175",0,0,(X,))) :- cand(isA(X,"绑架罪VS抢劫罪")).
constitutiveRule(r("tx-t6175",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6175",0,0,(X,))).
mainHead(r("tx-t6175",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t6175",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t6175",0,0,(X,))).
body(r("tx-t6175",0,0,(X,)),isA(X,"绑架罪VS抢劫罪")) :- inst(r("tx-t6175",0,0,(X,))).

% tx-t6416[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 暴力干涉婚姻自由罪
inst(r("tx-t6416",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t6416",0,0,(X,)),isA(X,"暴力干涉婚姻自由罪")) :- inst(r("tx-t6416",0,0,(X,))).
mainHead(r("tx-t6416",0,0,(X,)),constitutiveRule,isA(X,"暴力干涉婚姻自由罪")) :- inst(r("tx-t6416",0,0,(X,))).
cand(isA(X,"暴力干涉婚姻自由罪")) :- inst(r("tx-t6416",0,0,(X,))).
body(r("tx-t6416",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t6416",0,0,(X,))).

% tx-t6420[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 暴力干涉婚姻自由罪
inst(r("tx-t6420",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t6420",0,0,(X,)),isA(X,"暴力干涉婚姻自由罪")) :- inst(r("tx-t6420",0,0,(X,))).
mainHead(r("tx-t6420",0,0,(X,)),constitutiveRule,isA(X,"暴力干涉婚姻自由罪")) :- inst(r("tx-t6420",0,0,(X,))).
cand(isA(X,"暴力干涉婚姻自由罪")) :- inst(r("tx-t6420",0,0,(X,))).
body(r("tx-t6420",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6420",0,0,(X,))).

% tx-t6468[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 虐待罪
inst(r("tx-t6468",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t6468",0,0,(X,)),isA(X,"虐待罪")) :- inst(r("tx-t6468",0,0,(X,))).
mainHead(r("tx-t6468",0,0,(X,)),constitutiveRule,isA(X,"虐待罪")) :- inst(r("tx-t6468",0,0,(X,))).
cand(isA(X,"虐待罪")) :- inst(r("tx-t6468",0,0,(X,))).
body(r("tx-t6468",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t6468",0,0,(X,))).

% tx-t6472[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 虐待罪
inst(r("tx-t6472",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t6472",0,0,(X,)),isA(X,"虐待罪")) :- inst(r("tx-t6472",0,0,(X,))).
mainHead(r("tx-t6472",0,0,(X,)),constitutiveRule,isA(X,"虐待罪")) :- inst(r("tx-t6472",0,0,(X,))).
cand(isA(X,"虐待罪")) :- inst(r("tx-t6472",0,0,(X,))).
body(r("tx-t6472",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6472",0,0,(X,))).

% tx-t6498[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 遗弃罪
inst(r("tx-t6498",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t6498",0,0,(X,)),isA(X,"遗弃罪")) :- inst(r("tx-t6498",0,0,(X,))).
mainHead(r("tx-t6498",0,0,(X,)),constitutiveRule,isA(X,"遗弃罪")) :- inst(r("tx-t6498",0,0,(X,))).
cand(isA(X,"遗弃罪")) :- inst(r("tx-t6498",0,0,(X,))).
body(r("tx-t6498",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t6498",0,0,(X,))).

% tx-t6501[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 遗弃罪
inst(r("tx-t6501",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t6501",0,0,(X,)),isA(X,"遗弃罪")) :- inst(r("tx-t6501",0,0,(X,))).
mainHead(r("tx-t6501",0,0,(X,)),constitutiveRule,isA(X,"遗弃罪")) :- inst(r("tx-t6501",0,0,(X,))).
cand(isA(X,"遗弃罪")) :- inst(r("tx-t6501",0,0,(X,))).
body(r("tx-t6501",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6501",0,0,(X,))).

% tx-t6502[0.0] 分类（自动抽取自图的层级）：遗弃罪VS故意杀人罪 ⊑ 此罪与彼罪
inst(r("tx-t6502",0,0,(X,))) :- cand(isA(X,"遗弃罪VS故意杀人罪")).
constitutiveRule(r("tx-t6502",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6502",0,0,(X,))).
mainHead(r("tx-t6502",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t6502",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t6502",0,0,(X,))).
body(r("tx-t6502",0,0,(X,)),isA(X,"遗弃罪VS故意杀人罪")) :- inst(r("tx-t6502",0,0,(X,))).

% tx-t6507[0.0] 分类（自动抽取自图的层级）：遗弃罪VS虐待罪 ⊑ 此罪与彼罪
inst(r("tx-t6507",0,0,(X,))) :- cand(isA(X,"遗弃罪VS虐待罪")).
constitutiveRule(r("tx-t6507",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6507",0,0,(X,))).
mainHead(r("tx-t6507",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t6507",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t6507",0,0,(X,))).
body(r("tx-t6507",0,0,(X,)),isA(X,"遗弃罪VS虐待罪")) :- inst(r("tx-t6507",0,0,(X,))).

% tx-t6558[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 侮辱罪
inst(r("tx-t6558",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t6558",0,0,(X,)),isA(X,"侮辱罪")) :- inst(r("tx-t6558",0,0,(X,))).
mainHead(r("tx-t6558",0,0,(X,)),constitutiveRule,isA(X,"侮辱罪")) :- inst(r("tx-t6558",0,0,(X,))).
cand(isA(X,"侮辱罪")) :- inst(r("tx-t6558",0,0,(X,))).
body(r("tx-t6558",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t6558",0,0,(X,))).

% tx-t6573[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 侮辱罪
inst(r("tx-t6573",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t6573",0,0,(X,)),isA(X,"侮辱罪")) :- inst(r("tx-t6573",0,0,(X,))).
mainHead(r("tx-t6573",0,0,(X,)),constitutiveRule,isA(X,"侮辱罪")) :- inst(r("tx-t6573",0,0,(X,))).
cand(isA(X,"侮辱罪")) :- inst(r("tx-t6573",0,0,(X,))).
body(r("tx-t6573",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6573",0,0,(X,))).

% tx-t6598[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 诽谤罪
inst(r("tx-t6598",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t6598",0,0,(X,)),isA(X,"诽谤罪")) :- inst(r("tx-t6598",0,0,(X,))).
mainHead(r("tx-t6598",0,0,(X,)),constitutiveRule,isA(X,"诽谤罪")) :- inst(r("tx-t6598",0,0,(X,))).
cand(isA(X,"诽谤罪")) :- inst(r("tx-t6598",0,0,(X,))).
body(r("tx-t6598",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t6598",0,0,(X,))).

% tx-t6610[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 诽谤罪
inst(r("tx-t6610",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t6610",0,0,(X,)),isA(X,"诽谤罪")) :- inst(r("tx-t6610",0,0,(X,))).
mainHead(r("tx-t6610",0,0,(X,)),constitutiveRule,isA(X,"诽谤罪")) :- inst(r("tx-t6610",0,0,(X,))).
cand(isA(X,"诽谤罪")) :- inst(r("tx-t6610",0,0,(X,))).
body(r("tx-t6610",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6610",0,0,(X,))).

% k263[0.0] 以暴力、胁迫或者其他方法抢劫财物的（第263条；npc）
inst(r("k263",0,0,(P,X,))) :- cand(violenceOrCoercion(P,X)), cand(takesProperty(P,X)), cand(illegalPossessionPurpose(P,X)).
constitutiveRule(r("k263",0,0,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k263",0,0,(P,X,))).
mainHead(r("k263",0,0,(P,X,)),constitutiveRule,constitutes(P,X,robbery)) :- inst(r("k263",0,0,(P,X,))).
cand(constitutes(P,X,robbery)) :- inst(r("k263",0,0,(P,X,))).
body(r("k263",0,0,(P,X,)),violenceOrCoercion(P,X)) :- inst(r("k263",0,0,(P,X,))).
body(r("k263",0,0,(P,X,)),takesProperty(P,X)) :- inst(r("k263",0,0,(P,X,))).
body(r("k263",0,0,(P,X,)),illegalPossessionPurpose(P,X)) :- inst(r("k263",0,0,(P,X,))).

% k263-agg[0.0] 入户、在公共交通工具上、抢劫银行、多次或数额巨大、致人重伤死亡、冒充军警、持枪、抢劫军用或救灾物资：十年以上、无期或死刑（第263条；npc
inst(r("k263-agg",0,0,(P,X,))) :- cand(convicted(P,X,robbery)), cand(inHome(X)).
constitutiveRule(r("k263-agg",0,0,(P,X,)),aggravatedRobbery(P,X)) :- inst(r("k263-agg",0,0,(P,X,))).
mainHead(r("k263-agg",0,0,(P,X,)),constitutiveRule,aggravatedRobbery(P,X)) :- inst(r("k263-agg",0,0,(P,X,))).
cand(aggravatedRobbery(P,X)) :- inst(r("k263-agg",0,0,(P,X,))).
body(r("k263-agg",0,0,(P,X,)),convicted(P,X,robbery)) :- inst(r("k263-agg",0,0,(P,X,))).
body(r("k263-agg",0,0,(P,X,)),inHome(X)) :- inst(r("k263-agg",0,0,(P,X,))).
% k263-agg[1.0] 入户、在公共交通工具上、抢劫银行、多次或数额巨大、致人重伤死亡、冒充军警、持枪、抢劫军用或救灾物资：十年以上、无期或死刑（第263条；npc
inst(r("k263-agg",1,0,(P,X,))) :- cand(convicted(P,X,robbery)), cand(onPublicTransport(X)).
constitutiveRule(r("k263-agg",1,0,(P,X,)),aggravatedRobbery(P,X)) :- inst(r("k263-agg",1,0,(P,X,))).
mainHead(r("k263-agg",1,0,(P,X,)),constitutiveRule,aggravatedRobbery(P,X)) :- inst(r("k263-agg",1,0,(P,X,))).
cand(aggravatedRobbery(P,X)) :- inst(r("k263-agg",1,0,(P,X,))).
body(r("k263-agg",1,0,(P,X,)),convicted(P,X,robbery)) :- inst(r("k263-agg",1,0,(P,X,))).
body(r("k263-agg",1,0,(P,X,)),onPublicTransport(X)) :- inst(r("k263-agg",1,0,(P,X,))).
% k263-agg[2.0] 入户、在公共交通工具上、抢劫银行、多次或数额巨大、致人重伤死亡、冒充军警、持枪、抢劫军用或救灾物资：十年以上、无期或死刑（第263条；npc
inst(r("k263-agg",2,0,(P,X,))) :- cand(convicted(P,X,robbery)), cand(targetsBankOrFinancialInstitution(X)).
constitutiveRule(r("k263-agg",2,0,(P,X,)),aggravatedRobbery(P,X)) :- inst(r("k263-agg",2,0,(P,X,))).
mainHead(r("k263-agg",2,0,(P,X,)),constitutiveRule,aggravatedRobbery(P,X)) :- inst(r("k263-agg",2,0,(P,X,))).
cand(aggravatedRobbery(P,X)) :- inst(r("k263-agg",2,0,(P,X,))).
body(r("k263-agg",2,0,(P,X,)),convicted(P,X,robbery)) :- inst(r("k263-agg",2,0,(P,X,))).
body(r("k263-agg",2,0,(P,X,)),targetsBankOrFinancialInstitution(X)) :- inst(r("k263-agg",2,0,(P,X,))).
% k263-agg[3.0] 入户、在公共交通工具上、抢劫银行、多次或数额巨大、致人重伤死亡、冒充军警、持枪、抢劫军用或救灾物资：十年以上、无期或死刑（第263条；npc
inst(r("k263-agg",3,0,(P,X,))) :- cand(convicted(P,X,robbery)), cand(multipleRobberyOrHugeAmount(P,X)).
constitutiveRule(r("k263-agg",3,0,(P,X,)),aggravatedRobbery(P,X)) :- inst(r("k263-agg",3,0,(P,X,))).
mainHead(r("k263-agg",3,0,(P,X,)),constitutiveRule,aggravatedRobbery(P,X)) :- inst(r("k263-agg",3,0,(P,X,))).
cand(aggravatedRobbery(P,X)) :- inst(r("k263-agg",3,0,(P,X,))).
body(r("k263-agg",3,0,(P,X,)),convicted(P,X,robbery)) :- inst(r("k263-agg",3,0,(P,X,))).
body(r("k263-agg",3,0,(P,X,)),multipleRobberyOrHugeAmount(P,X)) :- inst(r("k263-agg",3,0,(P,X,))).
% k263-agg[4.0] 入户、在公共交通工具上、抢劫银行、多次或数额巨大、致人重伤死亡、冒充军警、持枪、抢劫军用或救灾物资：十年以上、无期或死刑（第263条；npc
inst(r("k263-agg",4,0,(P,X,))) :- cand(convicted(P,X,robbery)), cand(causesGraveInjuryOrDeath(X)).
constitutiveRule(r("k263-agg",4,0,(P,X,)),aggravatedRobbery(P,X)) :- inst(r("k263-agg",4,0,(P,X,))).
mainHead(r("k263-agg",4,0,(P,X,)),constitutiveRule,aggravatedRobbery(P,X)) :- inst(r("k263-agg",4,0,(P,X,))).
cand(aggravatedRobbery(P,X)) :- inst(r("k263-agg",4,0,(P,X,))).
body(r("k263-agg",4,0,(P,X,)),convicted(P,X,robbery)) :- inst(r("k263-agg",4,0,(P,X,))).
body(r("k263-agg",4,0,(P,X,)),causesGraveInjuryOrDeath(X)) :- inst(r("k263-agg",4,0,(P,X,))).
% k263-agg[5.0] 入户、在公共交通工具上、抢劫银行、多次或数额巨大、致人重伤死亡、冒充军警、持枪、抢劫军用或救灾物资：十年以上、无期或死刑（第263条；npc
inst(r("k263-agg",5,0,(P,X,))) :- cand(convicted(P,X,robbery)), cand(impersonatesMilitaryOrPolice(P,X)).
constitutiveRule(r("k263-agg",5,0,(P,X,)),aggravatedRobbery(P,X)) :- inst(r("k263-agg",5,0,(P,X,))).
mainHead(r("k263-agg",5,0,(P,X,)),constitutiveRule,aggravatedRobbery(P,X)) :- inst(r("k263-agg",5,0,(P,X,))).
cand(aggravatedRobbery(P,X)) :- inst(r("k263-agg",5,0,(P,X,))).
body(r("k263-agg",5,0,(P,X,)),convicted(P,X,robbery)) :- inst(r("k263-agg",5,0,(P,X,))).
body(r("k263-agg",5,0,(P,X,)),impersonatesMilitaryOrPolice(P,X)) :- inst(r("k263-agg",5,0,(P,X,))).
% k263-agg[6.0] 入户、在公共交通工具上、抢劫银行、多次或数额巨大、致人重伤死亡、冒充军警、持枪、抢劫军用或救灾物资：十年以上、无期或死刑（第263条；npc
inst(r("k263-agg",6,0,(P,X,))) :- cand(convicted(P,X,robbery)), cand(armedWithGun(P,X)).
constitutiveRule(r("k263-agg",6,0,(P,X,)),aggravatedRobbery(P,X)) :- inst(r("k263-agg",6,0,(P,X,))).
mainHead(r("k263-agg",6,0,(P,X,)),constitutiveRule,aggravatedRobbery(P,X)) :- inst(r("k263-agg",6,0,(P,X,))).
cand(aggravatedRobbery(P,X)) :- inst(r("k263-agg",6,0,(P,X,))).
body(r("k263-agg",6,0,(P,X,)),convicted(P,X,robbery)) :- inst(r("k263-agg",6,0,(P,X,))).
body(r("k263-agg",6,0,(P,X,)),armedWithGun(P,X)) :- inst(r("k263-agg",6,0,(P,X,))).
% k263-agg[7.0] 入户、在公共交通工具上、抢劫银行、多次或数额巨大、致人重伤死亡、冒充军警、持枪、抢劫军用或救灾物资：十年以上、无期或死刑（第263条；npc
inst(r("k263-agg",7,0,(P,X,))) :- cand(convicted(P,X,robbery)), cand(militaryOrReliefSupplies(X)).
constitutiveRule(r("k263-agg",7,0,(P,X,)),aggravatedRobbery(P,X)) :- inst(r("k263-agg",7,0,(P,X,))).
mainHead(r("k263-agg",7,0,(P,X,)),constitutiveRule,aggravatedRobbery(P,X)) :- inst(r("k263-agg",7,0,(P,X,))).
cand(aggravatedRobbery(P,X)) :- inst(r("k263-agg",7,0,(P,X,))).
body(r("k263-agg",7,0,(P,X,)),convicted(P,X,robbery)) :- inst(r("k263-agg",7,0,(P,X,))).
body(r("k263-agg",7,0,(P,X,)),militaryOrReliefSupplies(X)) :- inst(r("k263-agg",7,0,(P,X,))).

% tx-t6795[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 抢劫罪
inst(r("tx-t6795",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t6795",0,0,(X,)),isA(X,"抢劫罪")) :- inst(r("tx-t6795",0,0,(X,))).
mainHead(r("tx-t6795",0,0,(X,)),constitutiveRule,isA(X,"抢劫罪")) :- inst(r("tx-t6795",0,0,(X,))).
cand(isA(X,"抢劫罪")) :- inst(r("tx-t6795",0,0,(X,))).
body(r("tx-t6795",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t6795",0,0,(X,))).

% tx-t6813[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 抢劫罪
inst(r("tx-t6813",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t6813",0,0,(X,)),isA(X,"抢劫罪")) :- inst(r("tx-t6813",0,0,(X,))).
mainHead(r("tx-t6813",0,0,(X,)),constitutiveRule,isA(X,"抢劫罪")) :- inst(r("tx-t6813",0,0,(X,))).
cand(isA(X,"抢劫罪")) :- inst(r("tx-t6813",0,0,(X,))).
body(r("tx-t6813",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6813",0,0,(X,))).

% tx-t6841[0.0] 分类（自动抽取自图的层级）：抢劫罪VS绑架罪 ⊑ 此罪与彼罪
inst(r("tx-t6841",0,0,(X,))) :- cand(isA(X,"抢劫罪VS绑架罪")).
constitutiveRule(r("tx-t6841",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6841",0,0,(X,))).
mainHead(r("tx-t6841",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t6841",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t6841",0,0,(X,))).
body(r("tx-t6841",0,0,(X,)),isA(X,"抢劫罪VS绑架罪")) :- inst(r("tx-t6841",0,0,(X,))).

% tx-t6852[0.0] 分类（自动抽取自图的层级）：抢劫罪VS寻衅滋事罪 ⊑ 此罪与彼罪
inst(r("tx-t6852",0,0,(X,))) :- cand(isA(X,"抢劫罪VS寻衅滋事罪")).
constitutiveRule(r("tx-t6852",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t6852",0,0,(X,))).
mainHead(r("tx-t6852",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t6852",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t6852",0,0,(X,))).
body(r("tx-t6852",0,0,(X,)),isA(X,"抢劫罪VS寻衅滋事罪")) :- inst(r("tx-t6852",0,0,(X,))).

% k269[0.0] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",0,0,(P,X,))) :- cand(constitutes(P,X,theft)), cand(violenceOnTheSpot(P,X)), cand(toKeepLoot(P,X)).
constitutiveRule(r("k269",0,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k269",0,0,(P,X,))).
mainHead(r("k269",0,0,(P,X,)),constitutiveRule,convertedRobbery(P,X)) :- inst(r("k269",0,0,(P,X,))).
cand(convertedRobbery(P,X)) :- inst(r("k269",0,0,(P,X,))).
body(r("k269",0,0,(P,X,)),constitutes(P,X,theft)) :- inst(r("k269",0,0,(P,X,))).
body(r("k269",0,0,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",0,0,(P,X,))).
body(r("k269",0,0,(P,X,)),toKeepLoot(P,X)) :- inst(r("k269",0,0,(P,X,))).
% k269[0.1] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",0,1,(P,X,))) :- cand(constitutes(P,X,theft)), cand(violenceOnTheSpot(P,X)), cand(toKeepLoot(P,X)).
constitutiveRule(r("k269",0,1,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k269",0,1,(P,X,))).
mainHead(r("k269",0,1,(P,X,)),constitutiveRule,constitutes(P,X,robbery)) :- inst(r("k269",0,1,(P,X,))).
cand(constitutes(P,X,robbery)) :- inst(r("k269",0,1,(P,X,))).
body(r("k269",0,1,(P,X,)),constitutes(P,X,theft)) :- inst(r("k269",0,1,(P,X,))).
body(r("k269",0,1,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",0,1,(P,X,))).
body(r("k269",0,1,(P,X,)),toKeepLoot(P,X)) :- inst(r("k269",0,1,(P,X,))).
% k269[1.0] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",1,0,(P,X,))) :- cand(constitutes(P,X,theft)), cand(violenceOnTheSpot(P,X)), cand(toResistArrest(P,X)).
constitutiveRule(r("k269",1,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k269",1,0,(P,X,))).
mainHead(r("k269",1,0,(P,X,)),constitutiveRule,convertedRobbery(P,X)) :- inst(r("k269",1,0,(P,X,))).
cand(convertedRobbery(P,X)) :- inst(r("k269",1,0,(P,X,))).
body(r("k269",1,0,(P,X,)),constitutes(P,X,theft)) :- inst(r("k269",1,0,(P,X,))).
body(r("k269",1,0,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",1,0,(P,X,))).
body(r("k269",1,0,(P,X,)),toResistArrest(P,X)) :- inst(r("k269",1,0,(P,X,))).
% k269[1.1] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",1,1,(P,X,))) :- cand(constitutes(P,X,theft)), cand(violenceOnTheSpot(P,X)), cand(toResistArrest(P,X)).
constitutiveRule(r("k269",1,1,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k269",1,1,(P,X,))).
mainHead(r("k269",1,1,(P,X,)),constitutiveRule,constitutes(P,X,robbery)) :- inst(r("k269",1,1,(P,X,))).
cand(constitutes(P,X,robbery)) :- inst(r("k269",1,1,(P,X,))).
body(r("k269",1,1,(P,X,)),constitutes(P,X,theft)) :- inst(r("k269",1,1,(P,X,))).
body(r("k269",1,1,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",1,1,(P,X,))).
body(r("k269",1,1,(P,X,)),toResistArrest(P,X)) :- inst(r("k269",1,1,(P,X,))).
% k269[2.0] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",2,0,(P,X,))) :- cand(constitutes(P,X,theft)), cand(violenceOnTheSpot(P,X)), cand(toDestroyEvidence(P,X)).
constitutiveRule(r("k269",2,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k269",2,0,(P,X,))).
mainHead(r("k269",2,0,(P,X,)),constitutiveRule,convertedRobbery(P,X)) :- inst(r("k269",2,0,(P,X,))).
cand(convertedRobbery(P,X)) :- inst(r("k269",2,0,(P,X,))).
body(r("k269",2,0,(P,X,)),constitutes(P,X,theft)) :- inst(r("k269",2,0,(P,X,))).
body(r("k269",2,0,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",2,0,(P,X,))).
body(r("k269",2,0,(P,X,)),toDestroyEvidence(P,X)) :- inst(r("k269",2,0,(P,X,))).
% k269[2.1] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",2,1,(P,X,))) :- cand(constitutes(P,X,theft)), cand(violenceOnTheSpot(P,X)), cand(toDestroyEvidence(P,X)).
constitutiveRule(r("k269",2,1,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k269",2,1,(P,X,))).
mainHead(r("k269",2,1,(P,X,)),constitutiveRule,constitutes(P,X,robbery)) :- inst(r("k269",2,1,(P,X,))).
cand(constitutes(P,X,robbery)) :- inst(r("k269",2,1,(P,X,))).
body(r("k269",2,1,(P,X,)),constitutes(P,X,theft)) :- inst(r("k269",2,1,(P,X,))).
body(r("k269",2,1,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",2,1,(P,X,))).
body(r("k269",2,1,(P,X,)),toDestroyEvidence(P,X)) :- inst(r("k269",2,1,(P,X,))).
% k269[3.0] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",3,0,(P,X,))) :- cand(constitutes(P,X,fraud)), cand(violenceOnTheSpot(P,X)), cand(toKeepLoot(P,X)).
constitutiveRule(r("k269",3,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k269",3,0,(P,X,))).
mainHead(r("k269",3,0,(P,X,)),constitutiveRule,convertedRobbery(P,X)) :- inst(r("k269",3,0,(P,X,))).
cand(convertedRobbery(P,X)) :- inst(r("k269",3,0,(P,X,))).
body(r("k269",3,0,(P,X,)),constitutes(P,X,fraud)) :- inst(r("k269",3,0,(P,X,))).
body(r("k269",3,0,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",3,0,(P,X,))).
body(r("k269",3,0,(P,X,)),toKeepLoot(P,X)) :- inst(r("k269",3,0,(P,X,))).
% k269[3.1] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",3,1,(P,X,))) :- cand(constitutes(P,X,fraud)), cand(violenceOnTheSpot(P,X)), cand(toKeepLoot(P,X)).
constitutiveRule(r("k269",3,1,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k269",3,1,(P,X,))).
mainHead(r("k269",3,1,(P,X,)),constitutiveRule,constitutes(P,X,robbery)) :- inst(r("k269",3,1,(P,X,))).
cand(constitutes(P,X,robbery)) :- inst(r("k269",3,1,(P,X,))).
body(r("k269",3,1,(P,X,)),constitutes(P,X,fraud)) :- inst(r("k269",3,1,(P,X,))).
body(r("k269",3,1,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",3,1,(P,X,))).
body(r("k269",3,1,(P,X,)),toKeepLoot(P,X)) :- inst(r("k269",3,1,(P,X,))).
% k269[4.0] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",4,0,(P,X,))) :- cand(constitutes(P,X,fraud)), cand(violenceOnTheSpot(P,X)), cand(toResistArrest(P,X)).
constitutiveRule(r("k269",4,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k269",4,0,(P,X,))).
mainHead(r("k269",4,0,(P,X,)),constitutiveRule,convertedRobbery(P,X)) :- inst(r("k269",4,0,(P,X,))).
cand(convertedRobbery(P,X)) :- inst(r("k269",4,0,(P,X,))).
body(r("k269",4,0,(P,X,)),constitutes(P,X,fraud)) :- inst(r("k269",4,0,(P,X,))).
body(r("k269",4,0,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",4,0,(P,X,))).
body(r("k269",4,0,(P,X,)),toResistArrest(P,X)) :- inst(r("k269",4,0,(P,X,))).
% k269[4.1] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",4,1,(P,X,))) :- cand(constitutes(P,X,fraud)), cand(violenceOnTheSpot(P,X)), cand(toResistArrest(P,X)).
constitutiveRule(r("k269",4,1,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k269",4,1,(P,X,))).
mainHead(r("k269",4,1,(P,X,)),constitutiveRule,constitutes(P,X,robbery)) :- inst(r("k269",4,1,(P,X,))).
cand(constitutes(P,X,robbery)) :- inst(r("k269",4,1,(P,X,))).
body(r("k269",4,1,(P,X,)),constitutes(P,X,fraud)) :- inst(r("k269",4,1,(P,X,))).
body(r("k269",4,1,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",4,1,(P,X,))).
body(r("k269",4,1,(P,X,)),toResistArrest(P,X)) :- inst(r("k269",4,1,(P,X,))).
% k269[5.0] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",5,0,(P,X,))) :- cand(constitutes(P,X,fraud)), cand(violenceOnTheSpot(P,X)), cand(toDestroyEvidence(P,X)).
constitutiveRule(r("k269",5,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k269",5,0,(P,X,))).
mainHead(r("k269",5,0,(P,X,)),constitutiveRule,convertedRobbery(P,X)) :- inst(r("k269",5,0,(P,X,))).
cand(convertedRobbery(P,X)) :- inst(r("k269",5,0,(P,X,))).
body(r("k269",5,0,(P,X,)),constitutes(P,X,fraud)) :- inst(r("k269",5,0,(P,X,))).
body(r("k269",5,0,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",5,0,(P,X,))).
body(r("k269",5,0,(P,X,)),toDestroyEvidence(P,X)) :- inst(r("k269",5,0,(P,X,))).
% k269[5.1] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",5,1,(P,X,))) :- cand(constitutes(P,X,fraud)), cand(violenceOnTheSpot(P,X)), cand(toDestroyEvidence(P,X)).
constitutiveRule(r("k269",5,1,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k269",5,1,(P,X,))).
mainHead(r("k269",5,1,(P,X,)),constitutiveRule,constitutes(P,X,robbery)) :- inst(r("k269",5,1,(P,X,))).
cand(constitutes(P,X,robbery)) :- inst(r("k269",5,1,(P,X,))).
body(r("k269",5,1,(P,X,)),constitutes(P,X,fraud)) :- inst(r("k269",5,1,(P,X,))).
body(r("k269",5,1,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",5,1,(P,X,))).
body(r("k269",5,1,(P,X,)),toDestroyEvidence(P,X)) :- inst(r("k269",5,1,(P,X,))).
% k269[6.0] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",6,0,(P,X,))) :- cand(constitutes(P,X,snatching)), cand(violenceOnTheSpot(P,X)), cand(toKeepLoot(P,X)).
constitutiveRule(r("k269",6,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k269",6,0,(P,X,))).
mainHead(r("k269",6,0,(P,X,)),constitutiveRule,convertedRobbery(P,X)) :- inst(r("k269",6,0,(P,X,))).
cand(convertedRobbery(P,X)) :- inst(r("k269",6,0,(P,X,))).
body(r("k269",6,0,(P,X,)),constitutes(P,X,snatching)) :- inst(r("k269",6,0,(P,X,))).
body(r("k269",6,0,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",6,0,(P,X,))).
body(r("k269",6,0,(P,X,)),toKeepLoot(P,X)) :- inst(r("k269",6,0,(P,X,))).
% k269[6.1] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",6,1,(P,X,))) :- cand(constitutes(P,X,snatching)), cand(violenceOnTheSpot(P,X)), cand(toKeepLoot(P,X)).
constitutiveRule(r("k269",6,1,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k269",6,1,(P,X,))).
mainHead(r("k269",6,1,(P,X,)),constitutiveRule,constitutes(P,X,robbery)) :- inst(r("k269",6,1,(P,X,))).
cand(constitutes(P,X,robbery)) :- inst(r("k269",6,1,(P,X,))).
body(r("k269",6,1,(P,X,)),constitutes(P,X,snatching)) :- inst(r("k269",6,1,(P,X,))).
body(r("k269",6,1,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",6,1,(P,X,))).
body(r("k269",6,1,(P,X,)),toKeepLoot(P,X)) :- inst(r("k269",6,1,(P,X,))).
% k269[7.0] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",7,0,(P,X,))) :- cand(constitutes(P,X,snatching)), cand(violenceOnTheSpot(P,X)), cand(toResistArrest(P,X)).
constitutiveRule(r("k269",7,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k269",7,0,(P,X,))).
mainHead(r("k269",7,0,(P,X,)),constitutiveRule,convertedRobbery(P,X)) :- inst(r("k269",7,0,(P,X,))).
cand(convertedRobbery(P,X)) :- inst(r("k269",7,0,(P,X,))).
body(r("k269",7,0,(P,X,)),constitutes(P,X,snatching)) :- inst(r("k269",7,0,(P,X,))).
body(r("k269",7,0,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",7,0,(P,X,))).
body(r("k269",7,0,(P,X,)),toResistArrest(P,X)) :- inst(r("k269",7,0,(P,X,))).
% k269[7.1] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",7,1,(P,X,))) :- cand(constitutes(P,X,snatching)), cand(violenceOnTheSpot(P,X)), cand(toResistArrest(P,X)).
constitutiveRule(r("k269",7,1,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k269",7,1,(P,X,))).
mainHead(r("k269",7,1,(P,X,)),constitutiveRule,constitutes(P,X,robbery)) :- inst(r("k269",7,1,(P,X,))).
cand(constitutes(P,X,robbery)) :- inst(r("k269",7,1,(P,X,))).
body(r("k269",7,1,(P,X,)),constitutes(P,X,snatching)) :- inst(r("k269",7,1,(P,X,))).
body(r("k269",7,1,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",7,1,(P,X,))).
body(r("k269",7,1,(P,X,)),toResistArrest(P,X)) :- inst(r("k269",7,1,(P,X,))).
% k269[8.0] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",8,0,(P,X,))) :- cand(constitutes(P,X,snatching)), cand(violenceOnTheSpot(P,X)), cand(toDestroyEvidence(P,X)).
constitutiveRule(r("k269",8,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k269",8,0,(P,X,))).
mainHead(r("k269",8,0,(P,X,)),constitutiveRule,convertedRobbery(P,X)) :- inst(r("k269",8,0,(P,X,))).
cand(convertedRobbery(P,X)) :- inst(r("k269",8,0,(P,X,))).
body(r("k269",8,0,(P,X,)),constitutes(P,X,snatching)) :- inst(r("k269",8,0,(P,X,))).
body(r("k269",8,0,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",8,0,(P,X,))).
body(r("k269",8,0,(P,X,)),toDestroyEvidence(P,X)) :- inst(r("k269",8,0,(P,X,))).
% k269[8.1] 犯盗窃、诈骗、抢夺罪，为窝藏赃物、抗拒抓捕或者毁灭罪证而当场使用暴力或者以暴力相威胁的，依照抢劫罪定罪处罚（第269条；npc）
inst(r("k269",8,1,(P,X,))) :- cand(constitutes(P,X,snatching)), cand(violenceOnTheSpot(P,X)), cand(toDestroyEvidence(P,X)).
constitutiveRule(r("k269",8,1,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k269",8,1,(P,X,))).
mainHead(r("k269",8,1,(P,X,)),constitutiveRule,constitutes(P,X,robbery)) :- inst(r("k269",8,1,(P,X,))).
cand(constitutes(P,X,robbery)) :- inst(r("k269",8,1,(P,X,))).
body(r("k269",8,1,(P,X,)),constitutes(P,X,snatching)) :- inst(r("k269",8,1,(P,X,))).
body(r("k269",8,1,(P,X,)),violenceOnTheSpot(P,X)) :- inst(r("k269",8,1,(P,X,))).
body(r("k269",8,1,(P,X,)),toDestroyEvidence(P,X)) :- inst(r("k269",8,1,(P,X,))).

% k-conv-absorb[0.0] 转化为抢劫的，以抢劫罪一罪论处，不再另定盗窃、诈骗、抢夺罪（第269条；doctrine）
inst(r("k-conv-absorb",0,0,(P,X,))) :- cand(constitutes(P,X,theft)), cand(convertedRobbery(P,X)), cand(age16plus(P)).
constitutiveRule(r("k-conv-absorb",0,0,(P,X,)),non(convicted(P,X,theft))) :- inst(r("k-conv-absorb",0,0,(P,X,))).
mainHead(r("k-conv-absorb",0,0,(P,X,)),constitutiveRule,non(convicted(P,X,theft))) :- inst(r("k-conv-absorb",0,0,(P,X,))).
cand(convicted(P,X,theft)) :- inst(r("k-conv-absorb",0,0,(P,X,))).
body(r("k-conv-absorb",0,0,(P,X,)),constitutes(P,X,theft)) :- inst(r("k-conv-absorb",0,0,(P,X,))).
body(r("k-conv-absorb",0,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k-conv-absorb",0,0,(P,X,))).
body(r("k-conv-absorb",0,0,(P,X,)),age16plus(P)) :- inst(r("k-conv-absorb",0,0,(P,X,))).
% k-conv-absorb[0.1] 转化为抢劫的，以抢劫罪一罪论处，不再另定盗窃、诈骗、抢夺罪（第269条；doctrine）
inst(r("k-conv-absorb",0,1,(P,X,))) :- cand(constitutes(P,X,theft)), cand(convertedRobbery(P,X)), cand(age16plus(P)).
constitutiveRule(r("k-conv-absorb",0,1,(P,X,)),non(convicted(P,X,fraud))) :- inst(r("k-conv-absorb",0,1,(P,X,))).
mainHead(r("k-conv-absorb",0,1,(P,X,)),constitutiveRule,non(convicted(P,X,fraud))) :- inst(r("k-conv-absorb",0,1,(P,X,))).
cand(convicted(P,X,fraud)) :- inst(r("k-conv-absorb",0,1,(P,X,))).
body(r("k-conv-absorb",0,1,(P,X,)),constitutes(P,X,theft)) :- inst(r("k-conv-absorb",0,1,(P,X,))).
body(r("k-conv-absorb",0,1,(P,X,)),convertedRobbery(P,X)) :- inst(r("k-conv-absorb",0,1,(P,X,))).
body(r("k-conv-absorb",0,1,(P,X,)),age16plus(P)) :- inst(r("k-conv-absorb",0,1,(P,X,))).
% k-conv-absorb[0.2] 转化为抢劫的，以抢劫罪一罪论处，不再另定盗窃、诈骗、抢夺罪（第269条；doctrine）
inst(r("k-conv-absorb",0,2,(P,X,))) :- cand(constitutes(P,X,theft)), cand(convertedRobbery(P,X)), cand(age16plus(P)).
constitutiveRule(r("k-conv-absorb",0,2,(P,X,)),non(convicted(P,X,snatching))) :- inst(r("k-conv-absorb",0,2,(P,X,))).
mainHead(r("k-conv-absorb",0,2,(P,X,)),constitutiveRule,non(convicted(P,X,snatching))) :- inst(r("k-conv-absorb",0,2,(P,X,))).
cand(convicted(P,X,snatching)) :- inst(r("k-conv-absorb",0,2,(P,X,))).
body(r("k-conv-absorb",0,2,(P,X,)),constitutes(P,X,theft)) :- inst(r("k-conv-absorb",0,2,(P,X,))).
body(r("k-conv-absorb",0,2,(P,X,)),convertedRobbery(P,X)) :- inst(r("k-conv-absorb",0,2,(P,X,))).
body(r("k-conv-absorb",0,2,(P,X,)),age16plus(P)) :- inst(r("k-conv-absorb",0,2,(P,X,))).
% k-conv-absorb[1.0] 转化为抢劫的，以抢劫罪一罪论处，不再另定盗窃、诈骗、抢夺罪（第269条；doctrine）
inst(r("k-conv-absorb",1,0,(P,X,))) :- cand(constitutes(P,X,fraud)), cand(convertedRobbery(P,X)), cand(age16plus(P)).
constitutiveRule(r("k-conv-absorb",1,0,(P,X,)),non(convicted(P,X,theft))) :- inst(r("k-conv-absorb",1,0,(P,X,))).
mainHead(r("k-conv-absorb",1,0,(P,X,)),constitutiveRule,non(convicted(P,X,theft))) :- inst(r("k-conv-absorb",1,0,(P,X,))).
cand(convicted(P,X,theft)) :- inst(r("k-conv-absorb",1,0,(P,X,))).
body(r("k-conv-absorb",1,0,(P,X,)),constitutes(P,X,fraud)) :- inst(r("k-conv-absorb",1,0,(P,X,))).
body(r("k-conv-absorb",1,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k-conv-absorb",1,0,(P,X,))).
body(r("k-conv-absorb",1,0,(P,X,)),age16plus(P)) :- inst(r("k-conv-absorb",1,0,(P,X,))).
% k-conv-absorb[1.1] 转化为抢劫的，以抢劫罪一罪论处，不再另定盗窃、诈骗、抢夺罪（第269条；doctrine）
inst(r("k-conv-absorb",1,1,(P,X,))) :- cand(constitutes(P,X,fraud)), cand(convertedRobbery(P,X)), cand(age16plus(P)).
constitutiveRule(r("k-conv-absorb",1,1,(P,X,)),non(convicted(P,X,fraud))) :- inst(r("k-conv-absorb",1,1,(P,X,))).
mainHead(r("k-conv-absorb",1,1,(P,X,)),constitutiveRule,non(convicted(P,X,fraud))) :- inst(r("k-conv-absorb",1,1,(P,X,))).
cand(convicted(P,X,fraud)) :- inst(r("k-conv-absorb",1,1,(P,X,))).
body(r("k-conv-absorb",1,1,(P,X,)),constitutes(P,X,fraud)) :- inst(r("k-conv-absorb",1,1,(P,X,))).
body(r("k-conv-absorb",1,1,(P,X,)),convertedRobbery(P,X)) :- inst(r("k-conv-absorb",1,1,(P,X,))).
body(r("k-conv-absorb",1,1,(P,X,)),age16plus(P)) :- inst(r("k-conv-absorb",1,1,(P,X,))).
% k-conv-absorb[1.2] 转化为抢劫的，以抢劫罪一罪论处，不再另定盗窃、诈骗、抢夺罪（第269条；doctrine）
inst(r("k-conv-absorb",1,2,(P,X,))) :- cand(constitutes(P,X,fraud)), cand(convertedRobbery(P,X)), cand(age16plus(P)).
constitutiveRule(r("k-conv-absorb",1,2,(P,X,)),non(convicted(P,X,snatching))) :- inst(r("k-conv-absorb",1,2,(P,X,))).
mainHead(r("k-conv-absorb",1,2,(P,X,)),constitutiveRule,non(convicted(P,X,snatching))) :- inst(r("k-conv-absorb",1,2,(P,X,))).
cand(convicted(P,X,snatching)) :- inst(r("k-conv-absorb",1,2,(P,X,))).
body(r("k-conv-absorb",1,2,(P,X,)),constitutes(P,X,fraud)) :- inst(r("k-conv-absorb",1,2,(P,X,))).
body(r("k-conv-absorb",1,2,(P,X,)),convertedRobbery(P,X)) :- inst(r("k-conv-absorb",1,2,(P,X,))).
body(r("k-conv-absorb",1,2,(P,X,)),age16plus(P)) :- inst(r("k-conv-absorb",1,2,(P,X,))).
% k-conv-absorb[2.0] 转化为抢劫的，以抢劫罪一罪论处，不再另定盗窃、诈骗、抢夺罪（第269条；doctrine）
inst(r("k-conv-absorb",2,0,(P,X,))) :- cand(constitutes(P,X,snatching)), cand(convertedRobbery(P,X)), cand(age16plus(P)).
constitutiveRule(r("k-conv-absorb",2,0,(P,X,)),non(convicted(P,X,theft))) :- inst(r("k-conv-absorb",2,0,(P,X,))).
mainHead(r("k-conv-absorb",2,0,(P,X,)),constitutiveRule,non(convicted(P,X,theft))) :- inst(r("k-conv-absorb",2,0,(P,X,))).
cand(convicted(P,X,theft)) :- inst(r("k-conv-absorb",2,0,(P,X,))).
body(r("k-conv-absorb",2,0,(P,X,)),constitutes(P,X,snatching)) :- inst(r("k-conv-absorb",2,0,(P,X,))).
body(r("k-conv-absorb",2,0,(P,X,)),convertedRobbery(P,X)) :- inst(r("k-conv-absorb",2,0,(P,X,))).
body(r("k-conv-absorb",2,0,(P,X,)),age16plus(P)) :- inst(r("k-conv-absorb",2,0,(P,X,))).
% k-conv-absorb[2.1] 转化为抢劫的，以抢劫罪一罪论处，不再另定盗窃、诈骗、抢夺罪（第269条；doctrine）
inst(r("k-conv-absorb",2,1,(P,X,))) :- cand(constitutes(P,X,snatching)), cand(convertedRobbery(P,X)), cand(age16plus(P)).
constitutiveRule(r("k-conv-absorb",2,1,(P,X,)),non(convicted(P,X,fraud))) :- inst(r("k-conv-absorb",2,1,(P,X,))).
mainHead(r("k-conv-absorb",2,1,(P,X,)),constitutiveRule,non(convicted(P,X,fraud))) :- inst(r("k-conv-absorb",2,1,(P,X,))).
cand(convicted(P,X,fraud)) :- inst(r("k-conv-absorb",2,1,(P,X,))).
body(r("k-conv-absorb",2,1,(P,X,)),constitutes(P,X,snatching)) :- inst(r("k-conv-absorb",2,1,(P,X,))).
body(r("k-conv-absorb",2,1,(P,X,)),convertedRobbery(P,X)) :- inst(r("k-conv-absorb",2,1,(P,X,))).
body(r("k-conv-absorb",2,1,(P,X,)),age16plus(P)) :- inst(r("k-conv-absorb",2,1,(P,X,))).
% k-conv-absorb[2.2] 转化为抢劫的，以抢劫罪一罪论处，不再另定盗窃、诈骗、抢夺罪（第269条；doctrine）
inst(r("k-conv-absorb",2,2,(P,X,))) :- cand(constitutes(P,X,snatching)), cand(convertedRobbery(P,X)), cand(age16plus(P)).
constitutiveRule(r("k-conv-absorb",2,2,(P,X,)),non(convicted(P,X,snatching))) :- inst(r("k-conv-absorb",2,2,(P,X,))).
mainHead(r("k-conv-absorb",2,2,(P,X,)),constitutiveRule,non(convicted(P,X,snatching))) :- inst(r("k-conv-absorb",2,2,(P,X,))).
cand(convicted(P,X,snatching)) :- inst(r("k-conv-absorb",2,2,(P,X,))).
body(r("k-conv-absorb",2,2,(P,X,)),constitutes(P,X,snatching)) :- inst(r("k-conv-absorb",2,2,(P,X,))).
body(r("k-conv-absorb",2,2,(P,X,)),convertedRobbery(P,X)) :- inst(r("k-conv-absorb",2,2,(P,X,))).
body(r("k-conv-absorb",2,2,(P,X,)),age16plus(P)) :- inst(r("k-conv-absorb",2,2,(P,X,))).

% k264[0.0] 盗窃公私财物，数额较大，或者多次盗窃、入户盗窃、携带凶器盗窃、扒窃的（第264条；npc）
inst(r("k264",0,0,(P,X,))) :- cand(takesSecretly(P,X)), cand(illegalPossessionPurpose(P,X)), cand(amountRelativelyLarge(X)).
constitutiveRule(r("k264",0,0,(P,X,)),constitutes(P,X,theft)) :- inst(r("k264",0,0,(P,X,))).
mainHead(r("k264",0,0,(P,X,)),constitutiveRule,constitutes(P,X,theft)) :- inst(r("k264",0,0,(P,X,))).
cand(constitutes(P,X,theft)) :- inst(r("k264",0,0,(P,X,))).
body(r("k264",0,0,(P,X,)),takesSecretly(P,X)) :- inst(r("k264",0,0,(P,X,))).
body(r("k264",0,0,(P,X,)),illegalPossessionPurpose(P,X)) :- inst(r("k264",0,0,(P,X,))).
body(r("k264",0,0,(P,X,)),amountRelativelyLarge(X)) :- inst(r("k264",0,0,(P,X,))).
% k264[1.0] 盗窃公私财物，数额较大，或者多次盗窃、入户盗窃、携带凶器盗窃、扒窃的（第264条；npc）
inst(r("k264",1,0,(P,X,))) :- cand(takesSecretly(P,X)), cand(illegalPossessionPurpose(P,X)), cand(multipleTheft(P,X)).
constitutiveRule(r("k264",1,0,(P,X,)),constitutes(P,X,theft)) :- inst(r("k264",1,0,(P,X,))).
mainHead(r("k264",1,0,(P,X,)),constitutiveRule,constitutes(P,X,theft)) :- inst(r("k264",1,0,(P,X,))).
cand(constitutes(P,X,theft)) :- inst(r("k264",1,0,(P,X,))).
body(r("k264",1,0,(P,X,)),takesSecretly(P,X)) :- inst(r("k264",1,0,(P,X,))).
body(r("k264",1,0,(P,X,)),illegalPossessionPurpose(P,X)) :- inst(r("k264",1,0,(P,X,))).
body(r("k264",1,0,(P,X,)),multipleTheft(P,X)) :- inst(r("k264",1,0,(P,X,))).
% k264[2.0] 盗窃公私财物，数额较大，或者多次盗窃、入户盗窃、携带凶器盗窃、扒窃的（第264条；npc）
inst(r("k264",2,0,(P,X,))) :- cand(takesSecretly(P,X)), cand(illegalPossessionPurpose(P,X)), cand(burglaryOfHome(X)).
constitutiveRule(r("k264",2,0,(P,X,)),constitutes(P,X,theft)) :- inst(r("k264",2,0,(P,X,))).
mainHead(r("k264",2,0,(P,X,)),constitutiveRule,constitutes(P,X,theft)) :- inst(r("k264",2,0,(P,X,))).
cand(constitutes(P,X,theft)) :- inst(r("k264",2,0,(P,X,))).
body(r("k264",2,0,(P,X,)),takesSecretly(P,X)) :- inst(r("k264",2,0,(P,X,))).
body(r("k264",2,0,(P,X,)),illegalPossessionPurpose(P,X)) :- inst(r("k264",2,0,(P,X,))).
body(r("k264",2,0,(P,X,)),burglaryOfHome(X)) :- inst(r("k264",2,0,(P,X,))).
% k264[3.0] 盗窃公私财物，数额较大，或者多次盗窃、入户盗窃、携带凶器盗窃、扒窃的（第264条；npc）
inst(r("k264",3,0,(P,X,))) :- cand(takesSecretly(P,X)), cand(illegalPossessionPurpose(P,X)), cand(carryingWeapon(P,X)).
constitutiveRule(r("k264",3,0,(P,X,)),constitutes(P,X,theft)) :- inst(r("k264",3,0,(P,X,))).
mainHead(r("k264",3,0,(P,X,)),constitutiveRule,constitutes(P,X,theft)) :- inst(r("k264",3,0,(P,X,))).
cand(constitutes(P,X,theft)) :- inst(r("k264",3,0,(P,X,))).
body(r("k264",3,0,(P,X,)),takesSecretly(P,X)) :- inst(r("k264",3,0,(P,X,))).
body(r("k264",3,0,(P,X,)),illegalPossessionPurpose(P,X)) :- inst(r("k264",3,0,(P,X,))).
body(r("k264",3,0,(P,X,)),carryingWeapon(P,X)) :- inst(r("k264",3,0,(P,X,))).
% k264[4.0] 盗窃公私财物，数额较大，或者多次盗窃、入户盗窃、携带凶器盗窃、扒窃的（第264条；npc）
inst(r("k264",4,0,(P,X,))) :- cand(takesSecretly(P,X)), cand(illegalPossessionPurpose(P,X)), cand(pickpocketing(X)).
constitutiveRule(r("k264",4,0,(P,X,)),constitutes(P,X,theft)) :- inst(r("k264",4,0,(P,X,))).
mainHead(r("k264",4,0,(P,X,)),constitutiveRule,constitutes(P,X,theft)) :- inst(r("k264",4,0,(P,X,))).
cand(constitutes(P,X,theft)) :- inst(r("k264",4,0,(P,X,))).
body(r("k264",4,0,(P,X,)),takesSecretly(P,X)) :- inst(r("k264",4,0,(P,X,))).
body(r("k264",4,0,(P,X,)),illegalPossessionPurpose(P,X)) :- inst(r("k264",4,0,(P,X,))).
body(r("k264",4,0,(P,X,)),pickpocketing(X)) :- inst(r("k264",4,0,(P,X,))).

% k267[0.0] 抢夺公私财物，数额较大的，或者多次抢夺的（第267条第1款；npc）
inst(r("k267",0,0,(P,X,))) :- cand(snatchesOpenly(P,X)), cand(illegalPossessionPurpose(P,X)), cand(amountRelativelyLarge(X)).
constitutiveRule(r("k267",0,0,(P,X,)),constitutes(P,X,snatching)) :- inst(r("k267",0,0,(P,X,))).
mainHead(r("k267",0,0,(P,X,)),constitutiveRule,constitutes(P,X,snatching)) :- inst(r("k267",0,0,(P,X,))).
cand(constitutes(P,X,snatching)) :- inst(r("k267",0,0,(P,X,))).
body(r("k267",0,0,(P,X,)),snatchesOpenly(P,X)) :- inst(r("k267",0,0,(P,X,))).
body(r("k267",0,0,(P,X,)),illegalPossessionPurpose(P,X)) :- inst(r("k267",0,0,(P,X,))).
body(r("k267",0,0,(P,X,)),amountRelativelyLarge(X)) :- inst(r("k267",0,0,(P,X,))).
% k267[1.0] 抢夺公私财物，数额较大的，或者多次抢夺的（第267条第1款；npc）
inst(r("k267",1,0,(P,X,))) :- cand(snatchesOpenly(P,X)), cand(illegalPossessionPurpose(P,X)), cand(multipleSnatching(P,X)).
constitutiveRule(r("k267",1,0,(P,X,)),constitutes(P,X,snatching)) :- inst(r("k267",1,0,(P,X,))).
mainHead(r("k267",1,0,(P,X,)),constitutiveRule,constitutes(P,X,snatching)) :- inst(r("k267",1,0,(P,X,))).
cand(constitutes(P,X,snatching)) :- inst(r("k267",1,0,(P,X,))).
body(r("k267",1,0,(P,X,)),snatchesOpenly(P,X)) :- inst(r("k267",1,0,(P,X,))).
body(r("k267",1,0,(P,X,)),illegalPossessionPurpose(P,X)) :- inst(r("k267",1,0,(P,X,))).
body(r("k267",1,0,(P,X,)),multipleSnatching(P,X)) :- inst(r("k267",1,0,(P,X,))).

% k267-2[0.0] 携带凶器抢夺的，依照第二百六十三条（抢劫罪）定罪处罚（第267条第2款；npc）
inst(r("k267-2",0,0,(P,X,))) :- cand(snatchesOpenly(P,X)), cand(illegalPossessionPurpose(P,X)), cand(carryingWeapon(P,X)).
constitutiveRule(r("k267-2",0,0,(P,X,)),constitutes(P,X,robbery)) :- inst(r("k267-2",0,0,(P,X,))).
mainHead(r("k267-2",0,0,(P,X,)),constitutiveRule,constitutes(P,X,robbery)) :- inst(r("k267-2",0,0,(P,X,))).
cand(constitutes(P,X,robbery)) :- inst(r("k267-2",0,0,(P,X,))).
body(r("k267-2",0,0,(P,X,)),snatchesOpenly(P,X)) :- inst(r("k267-2",0,0,(P,X,))).
body(r("k267-2",0,0,(P,X,)),illegalPossessionPurpose(P,X)) :- inst(r("k267-2",0,0,(P,X,))).
body(r("k267-2",0,0,(P,X,)),carryingWeapon(P,X)) :- inst(r("k267-2",0,0,(P,X,))).

% k266[0.0] 诈骗公私财物，数额较大的（虚构事实→陷入错误→基于错误处分财产）（第266条；npc）
inst(r("k266",0,0,(P,X,))) :- cand(deceives(P,X)), cand(victimDisposesUnderMistake(X)), cand(illegalPossessionPurpose(P,X)), cand(amountRelativelyLarge(X)).
constitutiveRule(r("k266",0,0,(P,X,)),constitutes(P,X,fraud)) :- inst(r("k266",0,0,(P,X,))).
mainHead(r("k266",0,0,(P,X,)),constitutiveRule,constitutes(P,X,fraud)) :- inst(r("k266",0,0,(P,X,))).
cand(constitutes(P,X,fraud)) :- inst(r("k266",0,0,(P,X,))).
body(r("k266",0,0,(P,X,)),deceives(P,X)) :- inst(r("k266",0,0,(P,X,))).
body(r("k266",0,0,(P,X,)),victimDisposesUnderMistake(X)) :- inst(r("k266",0,0,(P,X,))).
body(r("k266",0,0,(P,X,)),illegalPossessionPurpose(P,X)) :- inst(r("k266",0,0,(P,X,))).
body(r("k266",0,0,(P,X,)),amountRelativelyLarge(X)) :- inst(r("k266",0,0,(P,X,))).

% tx-t7089[0.0] 分类（自动抽取自图的层级）：诈骗罪VS新型诈骗罪 ⊑ 此罪与彼罪
inst(r("tx-t7089",0,0,(X,))) :- cand(isA(X,"诈骗罪VS新型诈骗罪")).
constitutiveRule(r("tx-t7089",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7089",0,0,(X,))).
mainHead(r("tx-t7089",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t7089",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t7089",0,0,(X,))).
body(r("tx-t7089",0,0,(X,)),isA(X,"诈骗罪VS新型诈骗罪")) :- inst(r("tx-t7089",0,0,(X,))).

% tx-t7101[0.0] 分类（自动抽取自图的层级）：诈骗罪VS虚假诉讼罪 ⊑ 此罪与彼罪
inst(r("tx-t7101",0,0,(X,))) :- cand(isA(X,"诈骗罪VS虚假诉讼罪")).
constitutiveRule(r("tx-t7101",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7101",0,0,(X,))).
mainHead(r("tx-t7101",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t7101",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t7101",0,0,(X,))).
body(r("tx-t7101",0,0,(X,)),isA(X,"诈骗罪VS虚假诉讼罪")) :- inst(r("tx-t7101",0,0,(X,))).

% k270[0.0] 将代为保管的他人财物非法占为己有，数额较大，拒不退还的（第270条第1款；npc）
inst(r("k270",0,0,(P,X,))) :- cand(entrustedPropertyOf(P,X)), cand(illegallyAppropriates(P,X)), cand(amountRelativelyLarge(X)), cand(refusesToReturn(P,X)).
constitutiveRule(r("k270",0,0,(P,X,)),constitutes(P,X,embezzlementOfEntrusted)) :- inst(r("k270",0,0,(P,X,))).
mainHead(r("k270",0,0,(P,X,)),constitutiveRule,constitutes(P,X,embezzlementOfEntrusted)) :- inst(r("k270",0,0,(P,X,))).
cand(constitutes(P,X,embezzlementOfEntrusted)) :- inst(r("k270",0,0,(P,X,))).
body(r("k270",0,0,(P,X,)),entrustedPropertyOf(P,X)) :- inst(r("k270",0,0,(P,X,))).
body(r("k270",0,0,(P,X,)),illegallyAppropriates(P,X)) :- inst(r("k270",0,0,(P,X,))).
body(r("k270",0,0,(P,X,)),amountRelativelyLarge(X)) :- inst(r("k270",0,0,(P,X,))).
body(r("k270",0,0,(P,X,)),refusesToReturn(P,X)) :- inst(r("k270",0,0,(P,X,))).

% k270-2[0.0] 将他人的遗忘物或者埋藏物非法占为己有，数额较大，拒不交出的（第270条第2款；npc）
inst(r("k270-2",0,0,(P,X,))) :- cand(forgottenProperty(X)), cand(illegallyAppropriates(P,X)), cand(amountRelativelyLarge(X)), cand(refusesToHandOver(P,X)).
constitutiveRule(r("k270-2",0,0,(P,X,)),constitutes(P,X,embezzlementOfEntrusted)) :- inst(r("k270-2",0,0,(P,X,))).
mainHead(r("k270-2",0,0,(P,X,)),constitutiveRule,constitutes(P,X,embezzlementOfEntrusted)) :- inst(r("k270-2",0,0,(P,X,))).
cand(constitutes(P,X,embezzlementOfEntrusted)) :- inst(r("k270-2",0,0,(P,X,))).
body(r("k270-2",0,0,(P,X,)),forgottenProperty(X)) :- inst(r("k270-2",0,0,(P,X,))).
body(r("k270-2",0,0,(P,X,)),illegallyAppropriates(P,X)) :- inst(r("k270-2",0,0,(P,X,))).
body(r("k270-2",0,0,(P,X,)),amountRelativelyLarge(X)) :- inst(r("k270-2",0,0,(P,X,))).
body(r("k270-2",0,0,(P,X,)),refusesToHandOver(P,X)) :- inst(r("k270-2",0,0,(P,X,))).
% k270-2[1.0] 将他人的遗忘物或者埋藏物非法占为己有，数额较大，拒不交出的（第270条第2款；npc）
inst(r("k270-2",1,0,(P,X,))) :- cand(buriedProperty(X)), cand(illegallyAppropriates(P,X)), cand(amountRelativelyLarge(X)), cand(refusesToHandOver(P,X)).
constitutiveRule(r("k270-2",1,0,(P,X,)),constitutes(P,X,embezzlementOfEntrusted)) :- inst(r("k270-2",1,0,(P,X,))).
mainHead(r("k270-2",1,0,(P,X,)),constitutiveRule,constitutes(P,X,embezzlementOfEntrusted)) :- inst(r("k270-2",1,0,(P,X,))).
cand(constitutes(P,X,embezzlementOfEntrusted)) :- inst(r("k270-2",1,0,(P,X,))).
body(r("k270-2",1,0,(P,X,)),buriedProperty(X)) :- inst(r("k270-2",1,0,(P,X,))).
body(r("k270-2",1,0,(P,X,)),illegallyAppropriates(P,X)) :- inst(r("k270-2",1,0,(P,X,))).
body(r("k270-2",1,0,(P,X,)),amountRelativelyLarge(X)) :- inst(r("k270-2",1,0,(P,X,))).
body(r("k270-2",1,0,(P,X,)),refusesToHandOver(P,X)) :- inst(r("k270-2",1,0,(P,X,))).

% k270-3[0.0] 本条罪，告诉的才处理（第270条第3款；npc）
inst(r("k270-3",0,0,(P,X,))) :- cand(convicted(P,X,embezzlementOfEntrusted)).
constitutiveRule(r("k270-3",0,0,(P,X,)),prosecutedOnlyUponComplaint(P,X)) :- inst(r("k270-3",0,0,(P,X,))).
mainHead(r("k270-3",0,0,(P,X,)),constitutiveRule,prosecutedOnlyUponComplaint(P,X)) :- inst(r("k270-3",0,0,(P,X,))).
cand(prosecutedOnlyUponComplaint(P,X)) :- inst(r("k270-3",0,0,(P,X,))).
body(r("k270-3",0,0,(P,X,)),convicted(P,X,embezzlementOfEntrusted)) :- inst(r("k270-3",0,0,(P,X,))).

% tx-t7172[0.0] 分类（自动抽取自图的层级）：侵占罪是亲告罪 ⊑ 是否属于亲告罪
inst(r("tx-t7172",0,0,(X,))) :- cand(isA(X,"侵占罪是亲告罪")).
constitutiveRule(r("tx-t7172",0,0,(X,)),isA(X,"是否属于亲告罪")) :- inst(r("tx-t7172",0,0,(X,))).
mainHead(r("tx-t7172",0,0,(X,)),constitutiveRule,isA(X,"是否属于亲告罪")) :- inst(r("tx-t7172",0,0,(X,))).
cand(isA(X,"是否属于亲告罪")) :- inst(r("tx-t7172",0,0,(X,))).
body(r("tx-t7172",0,0,(X,)),isA(X,"侵占罪是亲告罪")) :- inst(r("tx-t7172",0,0,(X,))).

% tx-t7173[0.0] 分类（自动抽取自图的层级）：盗窃罪是公诉犯罪 ⊑ 是否属于亲告罪
inst(r("tx-t7173",0,0,(X,))) :- cand(isA(X,"盗窃罪是公诉犯罪")).
constitutiveRule(r("tx-t7173",0,0,(X,)),isA(X,"是否属于亲告罪")) :- inst(r("tx-t7173",0,0,(X,))).
mainHead(r("tx-t7173",0,0,(X,)),constitutiveRule,isA(X,"是否属于亲告罪")) :- inst(r("tx-t7173",0,0,(X,))).
cand(isA(X,"是否属于亲告罪")) :- inst(r("tx-t7173",0,0,(X,))).
body(r("tx-t7173",0,0,(X,)),isA(X,"盗窃罪是公诉犯罪")) :- inst(r("tx-t7173",0,0,(X,))).

% k271[0.0] 单位工作人员利用职务便利，将本单位财物非法占为己有，数额较大的（第271条第1款；npc）
inst(r("k271",0,0,(P,X,))) :- cand(employeeOfUnit(P,X)), cand(usesPosition(P,X)), cand(appropriatesUnitProperty(P,X)), cand(amountRelativelyLarge(X)).
constitutiveRule(r("k271",0,0,(P,X,)),constitutes(P,X,occupationalEmbezzlement)) :- inst(r("k271",0,0,(P,X,))).
mainHead(r("k271",0,0,(P,X,)),constitutiveRule,constitutes(P,X,occupationalEmbezzlement)) :- inst(r("k271",0,0,(P,X,))).
cand(constitutes(P,X,occupationalEmbezzlement)) :- inst(r("k271",0,0,(P,X,))).
body(r("k271",0,0,(P,X,)),employeeOfUnit(P,X)) :- inst(r("k271",0,0,(P,X,))).
body(r("k271",0,0,(P,X,)),usesPosition(P,X)) :- inst(r("k271",0,0,(P,X,))).
body(r("k271",0,0,(P,X,)),appropriatesUnitProperty(P,X)) :- inst(r("k271",0,0,(P,X,))).
body(r("k271",0,0,(P,X,)),amountRelativelyLarge(X)) :- inst(r("k271",0,0,(P,X,))).
inst(x("k271",0,0,0,(P,X,))) :- inst(r("k271",0,0,(P,X,))), cand(stateFunctionary(P)).
constitutiveRule(x("k271",0,0,0,(P,X,)),non(constitutes(P,X,occupationalEmbezzlement))) :- inst(x("k271",0,0,0,(P,X,))).
body(x("k271",0,0,0,(P,X,)),employeeOfUnit(P,X)) :- inst(x("k271",0,0,0,(P,X,))).
body(x("k271",0,0,0,(P,X,)),usesPosition(P,X)) :- inst(x("k271",0,0,0,(P,X,))).
body(x("k271",0,0,0,(P,X,)),appropriatesUnitProperty(P,X)) :- inst(x("k271",0,0,0,(P,X,))).
body(x("k271",0,0,0,(P,X,)),amountRelativelyLarge(X)) :- inst(x("k271",0,0,0,(P,X,))).
body(x("k271",0,0,0,(P,X,)),stateFunctionary(P)) :- inst(x("k271",0,0,0,(P,X,))).
superior(x("k271",0,0,0,(P,X,)),r("k271",0,0,(P,X,))) :- inst(x("k271",0,0,0,(P,X,))).
exc(x("k271",0,0,0,(P,X,)),r("k271",0,0,(P,X,)),constitutiveRule,constitutes(P,X,occupationalEmbezzlement)) :- inst(x("k271",0,0,0,(P,X,))).

% k271-2[0.0] 国有单位中从事公务的人员有前款行为的，依照贪污罪定罪处罚（第271条第2款；npc）
inst(r("k271-2",0,0,(P,X,))) :- cand(employeeOfUnit(P,X)), cand(usesPosition(P,X)), cand(appropriatesUnitProperty(P,X)), cand(stateFunctionary(P)).
constitutiveRule(r("k271-2",0,0,(P,X,)),constitutes(P,X,corruption)) :- inst(r("k271-2",0,0,(P,X,))).
mainHead(r("k271-2",0,0,(P,X,)),constitutiveRule,constitutes(P,X,corruption)) :- inst(r("k271-2",0,0,(P,X,))).
cand(constitutes(P,X,corruption)) :- inst(r("k271-2",0,0,(P,X,))).
body(r("k271-2",0,0,(P,X,)),employeeOfUnit(P,X)) :- inst(r("k271-2",0,0,(P,X,))).
body(r("k271-2",0,0,(P,X,)),usesPosition(P,X)) :- inst(r("k271-2",0,0,(P,X,))).
body(r("k271-2",0,0,(P,X,)),appropriatesUnitProperty(P,X)) :- inst(r("k271-2",0,0,(P,X,))).
body(r("k271-2",0,0,(P,X,)),stateFunctionary(P)) :- inst(r("k271-2",0,0,(P,X,))).

% k274[0.0] 敲诈勒索公私财物，数额较大或者多次敲诈勒索的（第274条；npc）
inst(r("k274",0,0,(P,X,))) :- cand(threatensOrBlackmails(P,X)), cand(victimHandsOverOutOfFear(X)), cand(amountRelativelyLarge(X)).
constitutiveRule(r("k274",0,0,(P,X,)),constitutes(P,X,extortion)) :- inst(r("k274",0,0,(P,X,))).
mainHead(r("k274",0,0,(P,X,)),constitutiveRule,constitutes(P,X,extortion)) :- inst(r("k274",0,0,(P,X,))).
cand(constitutes(P,X,extortion)) :- inst(r("k274",0,0,(P,X,))).
body(r("k274",0,0,(P,X,)),threatensOrBlackmails(P,X)) :- inst(r("k274",0,0,(P,X,))).
body(r("k274",0,0,(P,X,)),victimHandsOverOutOfFear(X)) :- inst(r("k274",0,0,(P,X,))).
body(r("k274",0,0,(P,X,)),amountRelativelyLarge(X)) :- inst(r("k274",0,0,(P,X,))).
% k274[1.0] 敲诈勒索公私财物，数额较大或者多次敲诈勒索的（第274条；npc）
inst(r("k274",1,0,(P,X,))) :- cand(threatensOrBlackmails(P,X)), cand(victimHandsOverOutOfFear(X)), cand(multipleExtortion(P,X)).
constitutiveRule(r("k274",1,0,(P,X,)),constitutes(P,X,extortion)) :- inst(r("k274",1,0,(P,X,))).
mainHead(r("k274",1,0,(P,X,)),constitutiveRule,constitutes(P,X,extortion)) :- inst(r("k274",1,0,(P,X,))).
cand(constitutes(P,X,extortion)) :- inst(r("k274",1,0,(P,X,))).
body(r("k274",1,0,(P,X,)),threatensOrBlackmails(P,X)) :- inst(r("k274",1,0,(P,X,))).
body(r("k274",1,0,(P,X,)),victimHandsOverOutOfFear(X)) :- inst(r("k274",1,0,(P,X,))).
body(r("k274",1,0,(P,X,)),multipleExtortion(P,X)) :- inst(r("k274",1,0,(P,X,))).

% tx-t7263[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 敲诈勒索罪
inst(r("tx-t7263",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t7263",0,0,(X,)),isA(X,"敲诈勒索罪")) :- inst(r("tx-t7263",0,0,(X,))).
mainHead(r("tx-t7263",0,0,(X,)),constitutiveRule,isA(X,"敲诈勒索罪")) :- inst(r("tx-t7263",0,0,(X,))).
cand(isA(X,"敲诈勒索罪")) :- inst(r("tx-t7263",0,0,(X,))).
body(r("tx-t7263",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t7263",0,0,(X,))).

% tx-t7268[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 敲诈勒索罪
inst(r("tx-t7268",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t7268",0,0,(X,)),isA(X,"敲诈勒索罪")) :- inst(r("tx-t7268",0,0,(X,))).
mainHead(r("tx-t7268",0,0,(X,)),constitutiveRule,isA(X,"敲诈勒索罪")) :- inst(r("tx-t7268",0,0,(X,))).
cand(isA(X,"敲诈勒索罪")) :- inst(r("tx-t7268",0,0,(X,))).
body(r("tx-t7268",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7268",0,0,(X,))).

% tx-t7286[0.0] 分类（自动抽取自图的层级）：敲诈勒索罪VS诈骗罪 ⊑ 此罪与彼罪
inst(r("tx-t7286",0,0,(X,))) :- cand(isA(X,"敲诈勒索罪VS诈骗罪")).
constitutiveRule(r("tx-t7286",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7286",0,0,(X,))).
mainHead(r("tx-t7286",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t7286",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t7286",0,0,(X,))).
body(r("tx-t7286",0,0,(X,)),isA(X,"敲诈勒索罪VS诈骗罪")) :- inst(r("tx-t7286",0,0,(X,))).

% tx-t7294[0.0] 分类（自动抽取自图的层级）：敲诈勒索罪VS招摇撞骗罪 ⊑ 此罪与彼罪
inst(r("tx-t7294",0,0,(X,))) :- cand(isA(X,"敲诈勒索罪VS招摇撞骗罪")).
constitutiveRule(r("tx-t7294",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7294",0,0,(X,))).
mainHead(r("tx-t7294",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t7294",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t7294",0,0,(X,))).
body(r("tx-t7294",0,0,(X,)),isA(X,"敲诈勒索罪VS招摇撞骗罪")) :- inst(r("tx-t7294",0,0,(X,))).

% tx-t7305[0.0] 分类（自动抽取自图的层级）：敲诈勒索罪VS绑架罪 ⊑ 此罪与彼罪
inst(r("tx-t7305",0,0,(X,))) :- cand(isA(X,"敲诈勒索罪VS绑架罪")).
constitutiveRule(r("tx-t7305",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7305",0,0,(X,))).
mainHead(r("tx-t7305",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t7305",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t7305",0,0,(X,))).
body(r("tx-t7305",0,0,(X,)),isA(X,"敲诈勒索罪VS绑架罪")) :- inst(r("tx-t7305",0,0,(X,))).

% tx-t7309[0.0] 分类（自动抽取自图的层级）：盗窃中携带凶器 ⊑ 凶器
inst(r("tx-t7309",0,0,(X,))) :- cand(isA(X,"盗窃中携带凶器")).
constitutiveRule(r("tx-t7309",0,0,(X,)),isA(X,"凶器")) :- inst(r("tx-t7309",0,0,(X,))).
mainHead(r("tx-t7309",0,0,(X,)),constitutiveRule,isA(X,"凶器")) :- inst(r("tx-t7309",0,0,(X,))).
cand(isA(X,"凶器")) :- inst(r("tx-t7309",0,0,(X,))).
body(r("tx-t7309",0,0,(X,)),isA(X,"盗窃中携带凶器")) :- inst(r("tx-t7309",0,0,(X,))).

% tx-t7311[0.0] 分类（自动抽取自图的层级）：盗窃中使用或者显示凶器 ⊑ 凶器
inst(r("tx-t7311",0,0,(X,))) :- cand(isA(X,"盗窃中使用或者显示凶器")).
constitutiveRule(r("tx-t7311",0,0,(X,)),isA(X,"凶器")) :- inst(r("tx-t7311",0,0,(X,))).
mainHead(r("tx-t7311",0,0,(X,)),constitutiveRule,isA(X,"凶器")) :- inst(r("tx-t7311",0,0,(X,))).
cand(isA(X,"凶器")) :- inst(r("tx-t7311",0,0,(X,))).
body(r("tx-t7311",0,0,(X,)),isA(X,"盗窃中使用或者显示凶器")) :- inst(r("tx-t7311",0,0,(X,))).

% tx-t7313[0.0] 分类（自动抽取自图的层级）：抢夺中携带凶器 ⊑ 凶器
inst(r("tx-t7313",0,0,(X,))) :- cand(isA(X,"抢夺中携带凶器")).
constitutiveRule(r("tx-t7313",0,0,(X,)),isA(X,"凶器")) :- inst(r("tx-t7313",0,0,(X,))).
mainHead(r("tx-t7313",0,0,(X,)),constitutiveRule,isA(X,"凶器")) :- inst(r("tx-t7313",0,0,(X,))).
cand(isA(X,"凶器")) :- inst(r("tx-t7313",0,0,(X,))).
body(r("tx-t7313",0,0,(X,)),isA(X,"抢夺中携带凶器")) :- inst(r("tx-t7313",0,0,(X,))).

% tx-t7315[0.0] 分类（自动抽取自图的层级）：抢夺中使用凶器 ⊑ 凶器
inst(r("tx-t7315",0,0,(X,))) :- cand(isA(X,"抢夺中使用凶器")).
constitutiveRule(r("tx-t7315",0,0,(X,)),isA(X,"凶器")) :- inst(r("tx-t7315",0,0,(X,))).
mainHead(r("tx-t7315",0,0,(X,)),constitutiveRule,isA(X,"凶器")) :- inst(r("tx-t7315",0,0,(X,))).
cand(isA(X,"凶器")) :- inst(r("tx-t7315",0,0,(X,))).
body(r("tx-t7315",0,0,(X,)),isA(X,"抢夺中使用凶器")) :- inst(r("tx-t7315",0,0,(X,))).

% tx-t7437[0.0] 分类（自动抽取自图的层级）：挪用资金罪VS职务侵占罪 ⊑ 此罪与彼罪
inst(r("tx-t7437",0,0,(X,))) :- cand(isA(X,"挪用资金罪VS职务侵占罪")).
constitutiveRule(r("tx-t7437",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7437",0,0,(X,))).
mainHead(r("tx-t7437",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t7437",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t7437",0,0,(X,))).
body(r("tx-t7437",0,0,(X,)),isA(X,"挪用资金罪VS职务侵占罪")) :- inst(r("tx-t7437",0,0,(X,))).

% tx-t7451[0.0] 分类（自动抽取自图的层级）：挪用资金罪VS挪用公款罪 ⊑ 此罪与彼罪
inst(r("tx-t7451",0,0,(X,))) :- cand(isA(X,"挪用资金罪VS挪用公款罪")).
constitutiveRule(r("tx-t7451",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7451",0,0,(X,))).
mainHead(r("tx-t7451",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t7451",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t7451",0,0,(X,))).
body(r("tx-t7451",0,0,(X,)),isA(X,"挪用资金罪VS挪用公款罪")) :- inst(r("tx-t7451",0,0,(X,))).

% tx-t7663[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 非法获取国家秘密罪
inst(r("tx-t7663",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t7663",0,0,(X,)),isA(X,"非法获取国家秘密罪")) :- inst(r("tx-t7663",0,0,(X,))).
mainHead(r("tx-t7663",0,0,(X,)),constitutiveRule,isA(X,"非法获取国家秘密罪")) :- inst(r("tx-t7663",0,0,(X,))).
cand(isA(X,"非法获取国家秘密罪")) :- inst(r("tx-t7663",0,0,(X,))).
body(r("tx-t7663",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t7663",0,0,(X,))).

% tx-t7666[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 非法获取国家秘密罪
inst(r("tx-t7666",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t7666",0,0,(X,)),isA(X,"非法获取国家秘密罪")) :- inst(r("tx-t7666",0,0,(X,))).
mainHead(r("tx-t7666",0,0,(X,)),constitutiveRule,isA(X,"非法获取国家秘密罪")) :- inst(r("tx-t7666",0,0,(X,))).
cand(isA(X,"非法获取国家秘密罪")) :- inst(r("tx-t7666",0,0,(X,))).
body(r("tx-t7666",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7666",0,0,(X,))).

% tx-t7717[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 高空抛物罪
inst(r("tx-t7717",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t7717",0,0,(X,)),isA(X,"高空抛物罪")) :- inst(r("tx-t7717",0,0,(X,))).
mainHead(r("tx-t7717",0,0,(X,)),constitutiveRule,isA(X,"高空抛物罪")) :- inst(r("tx-t7717",0,0,(X,))).
cand(isA(X,"高空抛物罪")) :- inst(r("tx-t7717",0,0,(X,))).
body(r("tx-t7717",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t7717",0,0,(X,))).

% tx-t7721[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 高空抛物罪
inst(r("tx-t7721",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t7721",0,0,(X,)),isA(X,"高空抛物罪")) :- inst(r("tx-t7721",0,0,(X,))).
mainHead(r("tx-t7721",0,0,(X,)),constitutiveRule,isA(X,"高空抛物罪")) :- inst(r("tx-t7721",0,0,(X,))).
cand(isA(X,"高空抛物罪")) :- inst(r("tx-t7721",0,0,(X,))).
body(r("tx-t7721",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7721",0,0,(X,))).

% tx-t7763[0.0] 分类（自动抽取自图的层级）：组织考试作弊罪 ⊑ 考试犯罪
inst(r("tx-t7763",0,0,(X,))) :- cand(isA(X,"组织考试作弊罪")).
constitutiveRule(r("tx-t7763",0,0,(X,)),isA(X,"考试犯罪")) :- inst(r("tx-t7763",0,0,(X,))).
mainHead(r("tx-t7763",0,0,(X,)),constitutiveRule,isA(X,"考试犯罪")) :- inst(r("tx-t7763",0,0,(X,))).
cand(isA(X,"考试犯罪")) :- inst(r("tx-t7763",0,0,(X,))).
body(r("tx-t7763",0,0,(X,)),isA(X,"组织考试作弊罪")) :- inst(r("tx-t7763",0,0,(X,))).

% tx-t7790[0.0] 分类（自动抽取自图的层级）：代替考试罪 ⊑ 考试犯罪
inst(r("tx-t7790",0,0,(X,))) :- cand(isA(X,"代替考试罪")).
constitutiveRule(r("tx-t7790",0,0,(X,)),isA(X,"考试犯罪")) :- inst(r("tx-t7790",0,0,(X,))).
mainHead(r("tx-t7790",0,0,(X,)),constitutiveRule,isA(X,"考试犯罪")) :- inst(r("tx-t7790",0,0,(X,))).
cand(isA(X,"考试犯罪")) :- inst(r("tx-t7790",0,0,(X,))).
body(r("tx-t7790",0,0,(X,)),isA(X,"代替考试罪")) :- inst(r("tx-t7790",0,0,(X,))).

% tx-t7781[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 组织考试作弊罪
inst(r("tx-t7781",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t7781",0,0,(X,)),isA(X,"组织考试作弊罪")) :- inst(r("tx-t7781",0,0,(X,))).
mainHead(r("tx-t7781",0,0,(X,)),constitutiveRule,isA(X,"组织考试作弊罪")) :- inst(r("tx-t7781",0,0,(X,))).
cand(isA(X,"组织考试作弊罪")) :- inst(r("tx-t7781",0,0,(X,))).
body(r("tx-t7781",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t7781",0,0,(X,))).

% tx-t7786[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 组织考试作弊罪
inst(r("tx-t7786",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t7786",0,0,(X,)),isA(X,"组织考试作弊罪")) :- inst(r("tx-t7786",0,0,(X,))).
mainHead(r("tx-t7786",0,0,(X,)),constitutiveRule,isA(X,"组织考试作弊罪")) :- inst(r("tx-t7786",0,0,(X,))).
cand(isA(X,"组织考试作弊罪")) :- inst(r("tx-t7786",0,0,(X,))).
body(r("tx-t7786",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7786",0,0,(X,))).

% tx-t7930[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 帮助信息网络犯罪活动罪
inst(r("tx-t7930",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t7930",0,0,(X,)),isA(X,"帮助信息网络犯罪活动罪")) :- inst(r("tx-t7930",0,0,(X,))).
mainHead(r("tx-t7930",0,0,(X,)),constitutiveRule,isA(X,"帮助信息网络犯罪活动罪")) :- inst(r("tx-t7930",0,0,(X,))).
cand(isA(X,"帮助信息网络犯罪活动罪")) :- inst(r("tx-t7930",0,0,(X,))).
body(r("tx-t7930",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t7930",0,0,(X,))).

% tx-t7933[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 帮助信息网络犯罪活动罪
inst(r("tx-t7933",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t7933",0,0,(X,)),isA(X,"帮助信息网络犯罪活动罪")) :- inst(r("tx-t7933",0,0,(X,))).
mainHead(r("tx-t7933",0,0,(X,)),constitutiveRule,isA(X,"帮助信息网络犯罪活动罪")) :- inst(r("tx-t7933",0,0,(X,))).
cand(isA(X,"帮助信息网络犯罪活动罪")) :- inst(r("tx-t7933",0,0,(X,))).
body(r("tx-t7933",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7933",0,0,(X,))).

% tx-t7966[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 聚众斗殴罪
inst(r("tx-t7966",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t7966",0,0,(X,)),isA(X,"聚众斗殴罪")) :- inst(r("tx-t7966",0,0,(X,))).
mainHead(r("tx-t7966",0,0,(X,)),constitutiveRule,isA(X,"聚众斗殴罪")) :- inst(r("tx-t7966",0,0,(X,))).
cand(isA(X,"聚众斗殴罪")) :- inst(r("tx-t7966",0,0,(X,))).
body(r("tx-t7966",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t7966",0,0,(X,))).

% tx-t7974[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 聚众斗殴罪
inst(r("tx-t7974",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t7974",0,0,(X,)),isA(X,"聚众斗殴罪")) :- inst(r("tx-t7974",0,0,(X,))).
mainHead(r("tx-t7974",0,0,(X,)),constitutiveRule,isA(X,"聚众斗殴罪")) :- inst(r("tx-t7974",0,0,(X,))).
cand(isA(X,"聚众斗殴罪")) :- inst(r("tx-t7974",0,0,(X,))).
body(r("tx-t7974",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t7974",0,0,(X,))).

% tx-t8032[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 赌博罪
inst(r("tx-t8032",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8032",0,0,(X,)),isA(X,"赌博罪")) :- inst(r("tx-t8032",0,0,(X,))).
mainHead(r("tx-t8032",0,0,(X,)),constitutiveRule,isA(X,"赌博罪")) :- inst(r("tx-t8032",0,0,(X,))).
cand(isA(X,"赌博罪")) :- inst(r("tx-t8032",0,0,(X,))).
body(r("tx-t8032",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8032",0,0,(X,))).

% tx-t8035[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 赌博罪
inst(r("tx-t8035",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8035",0,0,(X,)),isA(X,"赌博罪")) :- inst(r("tx-t8035",0,0,(X,))).
mainHead(r("tx-t8035",0,0,(X,)),constitutiveRule,isA(X,"赌博罪")) :- inst(r("tx-t8035",0,0,(X,))).
cand(isA(X,"赌博罪")) :- inst(r("tx-t8035",0,0,(X,))).
body(r("tx-t8035",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8035",0,0,(X,))).

% tx-t8043[0.0] 分类（自动抽取自图的层级）：赌博罪VS相关犯罪 ⊑ 此罪与彼罪
inst(r("tx-t8043",0,0,(X,))) :- cand(isA(X,"赌博罪VS相关犯罪")).
constitutiveRule(r("tx-t8043",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8043",0,0,(X,))).
mainHead(r("tx-t8043",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t8043",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t8043",0,0,(X,))).
body(r("tx-t8043",0,0,(X,)),isA(X,"赌博罪VS相关犯罪")) :- inst(r("tx-t8043",0,0,(X,))).

% tx-t8054[0.0] 分类（自动抽取自图的层级）：开设赌场罪VS赌博罪 ⊑ 此罪与彼罪
inst(r("tx-t8054",0,0,(X,))) :- cand(isA(X,"开设赌场罪VS赌博罪")).
constitutiveRule(r("tx-t8054",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8054",0,0,(X,))).
mainHead(r("tx-t8054",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t8054",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t8054",0,0,(X,))).
body(r("tx-t8054",0,0,(X,)),isA(X,"开设赌场罪VS赌博罪")) :- inst(r("tx-t8054",0,0,(X,))).

% tx-t8272[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 脱逃罪
inst(r("tx-t8272",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8272",0,0,(X,)),isA(X,"脱逃罪")) :- inst(r("tx-t8272",0,0,(X,))).
mainHead(r("tx-t8272",0,0,(X,)),constitutiveRule,isA(X,"脱逃罪")) :- inst(r("tx-t8272",0,0,(X,))).
cand(isA(X,"脱逃罪")) :- inst(r("tx-t8272",0,0,(X,))).
body(r("tx-t8272",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8272",0,0,(X,))).

% tx-t8277[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 脱逃罪
inst(r("tx-t8277",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8277",0,0,(X,)),isA(X,"脱逃罪")) :- inst(r("tx-t8277",0,0,(X,))).
mainHead(r("tx-t8277",0,0,(X,)),constitutiveRule,isA(X,"脱逃罪")) :- inst(r("tx-t8277",0,0,(X,))).
cand(isA(X,"脱逃罪")) :- inst(r("tx-t8277",0,0,(X,))).
body(r("tx-t8277",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8277",0,0,(X,))).

% tx-t8370[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 妨害作证罪
inst(r("tx-t8370",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8370",0,0,(X,)),isA(X,"妨害作证罪")) :- inst(r("tx-t8370",0,0,(X,))).
mainHead(r("tx-t8370",0,0,(X,)),constitutiveRule,isA(X,"妨害作证罪")) :- inst(r("tx-t8370",0,0,(X,))).
cand(isA(X,"妨害作证罪")) :- inst(r("tx-t8370",0,0,(X,))).
body(r("tx-t8370",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8370",0,0,(X,))).

% tx-t8373[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 妨害作证罪
inst(r("tx-t8373",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8373",0,0,(X,)),isA(X,"妨害作证罪")) :- inst(r("tx-t8373",0,0,(X,))).
mainHead(r("tx-t8373",0,0,(X,)),constitutiveRule,isA(X,"妨害作证罪")) :- inst(r("tx-t8373",0,0,(X,))).
cand(isA(X,"妨害作证罪")) :- inst(r("tx-t8373",0,0,(X,))).
body(r("tx-t8373",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8373",0,0,(X,))).

% tx-t8409[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 扰乱法庭秩序罪
inst(r("tx-t8409",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8409",0,0,(X,)),isA(X,"扰乱法庭秩序罪")) :- inst(r("tx-t8409",0,0,(X,))).
mainHead(r("tx-t8409",0,0,(X,)),constitutiveRule,isA(X,"扰乱法庭秩序罪")) :- inst(r("tx-t8409",0,0,(X,))).
cand(isA(X,"扰乱法庭秩序罪")) :- inst(r("tx-t8409",0,0,(X,))).
body(r("tx-t8409",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8409",0,0,(X,))).

% tx-t8411[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 扰乱法庭秩序罪
inst(r("tx-t8411",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8411",0,0,(X,)),isA(X,"扰乱法庭秩序罪")) :- inst(r("tx-t8411",0,0,(X,))).
mainHead(r("tx-t8411",0,0,(X,)),constitutiveRule,isA(X,"扰乱法庭秩序罪")) :- inst(r("tx-t8411",0,0,(X,))).
cand(isA(X,"扰乱法庭秩序罪")) :- inst(r("tx-t8411",0,0,(X,))).
body(r("tx-t8411",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8411",0,0,(X,))).

% tx-t8456[0.0] 分类（自动抽取自图的层级）：医疗事故罪 ⊑ 危害公共卫生类罪
inst(r("tx-t8456",0,0,(X,))) :- cand(isA(X,"医疗事故罪")).
constitutiveRule(r("tx-t8456",0,0,(X,)),isA(X,"危害公共卫生类罪")) :- inst(r("tx-t8456",0,0,(X,))).
mainHead(r("tx-t8456",0,0,(X,)),constitutiveRule,isA(X,"危害公共卫生类罪")) :- inst(r("tx-t8456",0,0,(X,))).
cand(isA(X,"危害公共卫生类罪")) :- inst(r("tx-t8456",0,0,(X,))).
body(r("tx-t8456",0,0,(X,)),isA(X,"医疗事故罪")) :- inst(r("tx-t8456",0,0,(X,))).

% tx-t8481[0.0] 分类（自动抽取自图的层级）：非法行医罪 ⊑ 危害公共卫生类罪
inst(r("tx-t8481",0,0,(X,))) :- cand(isA(X,"非法行医罪")).
constitutiveRule(r("tx-t8481",0,0,(X,)),isA(X,"危害公共卫生类罪")) :- inst(r("tx-t8481",0,0,(X,))).
mainHead(r("tx-t8481",0,0,(X,)),constitutiveRule,isA(X,"危害公共卫生类罪")) :- inst(r("tx-t8481",0,0,(X,))).
cand(isA(X,"危害公共卫生类罪")) :- inst(r("tx-t8481",0,0,(X,))).
body(r("tx-t8481",0,0,(X,)),isA(X,"非法行医罪")) :- inst(r("tx-t8481",0,0,(X,))).

% tx-t8516[0.0] 分类（自动抽取自图的层级）：妨害传染病防治罪 ⊑ 危害公共卫生类罪
inst(r("tx-t8516",0,0,(X,))) :- cand(isA(X,"妨害传染病防治罪")).
constitutiveRule(r("tx-t8516",0,0,(X,)),isA(X,"危害公共卫生类罪")) :- inst(r("tx-t8516",0,0,(X,))).
mainHead(r("tx-t8516",0,0,(X,)),constitutiveRule,isA(X,"危害公共卫生类罪")) :- inst(r("tx-t8516",0,0,(X,))).
cand(isA(X,"危害公共卫生类罪")) :- inst(r("tx-t8516",0,0,(X,))).
body(r("tx-t8516",0,0,(X,)),isA(X,"妨害传染病防治罪")) :- inst(r("tx-t8516",0,0,(X,))).

% tx-t8470[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 医疗事故罪
inst(r("tx-t8470",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8470",0,0,(X,)),isA(X,"医疗事故罪")) :- inst(r("tx-t8470",0,0,(X,))).
mainHead(r("tx-t8470",0,0,(X,)),constitutiveRule,isA(X,"医疗事故罪")) :- inst(r("tx-t8470",0,0,(X,))).
cand(isA(X,"医疗事故罪")) :- inst(r("tx-t8470",0,0,(X,))).
body(r("tx-t8470",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8470",0,0,(X,))).

% tx-t8479[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 医疗事故罪
inst(r("tx-t8479",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8479",0,0,(X,)),isA(X,"医疗事故罪")) :- inst(r("tx-t8479",0,0,(X,))).
mainHead(r("tx-t8479",0,0,(X,)),constitutiveRule,isA(X,"医疗事故罪")) :- inst(r("tx-t8479",0,0,(X,))).
cand(isA(X,"医疗事故罪")) :- inst(r("tx-t8479",0,0,(X,))).
body(r("tx-t8479",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8479",0,0,(X,))).

% tx-t8501[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 非法行医罪
inst(r("tx-t8501",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8501",0,0,(X,)),isA(X,"非法行医罪")) :- inst(r("tx-t8501",0,0,(X,))).
mainHead(r("tx-t8501",0,0,(X,)),constitutiveRule,isA(X,"非法行医罪")) :- inst(r("tx-t8501",0,0,(X,))).
cand(isA(X,"非法行医罪")) :- inst(r("tx-t8501",0,0,(X,))).
body(r("tx-t8501",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8501",0,0,(X,))).

% tx-t8503[0.0] 分类（自动抽取自图的层级）：此罪或此罪 ⊑ 非法行医罪
inst(r("tx-t8503",0,0,(X,))) :- cand(isA(X,"此罪或此罪")).
constitutiveRule(r("tx-t8503",0,0,(X,)),isA(X,"非法行医罪")) :- inst(r("tx-t8503",0,0,(X,))).
mainHead(r("tx-t8503",0,0,(X,)),constitutiveRule,isA(X,"非法行医罪")) :- inst(r("tx-t8503",0,0,(X,))).
cand(isA(X,"非法行医罪")) :- inst(r("tx-t8503",0,0,(X,))).
body(r("tx-t8503",0,0,(X,)),isA(X,"此罪或此罪")) :- inst(r("tx-t8503",0,0,(X,))).

% tx-t8504[0.0] 分类（自动抽取自图的层级）：非法行医罪VS医疗事故罪 ⊑ 此罪或此罪
inst(r("tx-t8504",0,0,(X,))) :- cand(isA(X,"非法行医罪VS医疗事故罪")).
constitutiveRule(r("tx-t8504",0,0,(X,)),isA(X,"此罪或此罪")) :- inst(r("tx-t8504",0,0,(X,))).
mainHead(r("tx-t8504",0,0,(X,)),constitutiveRule,isA(X,"此罪或此罪")) :- inst(r("tx-t8504",0,0,(X,))).
cand(isA(X,"此罪或此罪")) :- inst(r("tx-t8504",0,0,(X,))).
body(r("tx-t8504",0,0,(X,)),isA(X,"非法行医罪VS医疗事故罪")) :- inst(r("tx-t8504",0,0,(X,))).

% tx-t8514[0.0] 分类（自动抽取自图的层级）：非法行医罪VS诈骗罪 ⊑ 此罪或此罪
inst(r("tx-t8514",0,0,(X,))) :- cand(isA(X,"非法行医罪VS诈骗罪")).
constitutiveRule(r("tx-t8514",0,0,(X,)),isA(X,"此罪或此罪")) :- inst(r("tx-t8514",0,0,(X,))).
mainHead(r("tx-t8514",0,0,(X,)),constitutiveRule,isA(X,"此罪或此罪")) :- inst(r("tx-t8514",0,0,(X,))).
cand(isA(X,"此罪或此罪")) :- inst(r("tx-t8514",0,0,(X,))).
body(r("tx-t8514",0,0,(X,)),isA(X,"非法行医罪VS诈骗罪")) :- inst(r("tx-t8514",0,0,(X,))).

% tx-t8537[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 妨害传染病防治罪
inst(r("tx-t8537",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8537",0,0,(X,)),isA(X,"妨害传染病防治罪")) :- inst(r("tx-t8537",0,0,(X,))).
mainHead(r("tx-t8537",0,0,(X,)),constitutiveRule,isA(X,"妨害传染病防治罪")) :- inst(r("tx-t8537",0,0,(X,))).
cand(isA(X,"妨害传染病防治罪")) :- inst(r("tx-t8537",0,0,(X,))).
body(r("tx-t8537",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8537",0,0,(X,))).

% tx-t8541[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 妨害传染病防治罪
inst(r("tx-t8541",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8541",0,0,(X,)),isA(X,"妨害传染病防治罪")) :- inst(r("tx-t8541",0,0,(X,))).
mainHead(r("tx-t8541",0,0,(X,)),constitutiveRule,isA(X,"妨害传染病防治罪")) :- inst(r("tx-t8541",0,0,(X,))).
cand(isA(X,"妨害传染病防治罪")) :- inst(r("tx-t8541",0,0,(X,))).
body(r("tx-t8541",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8541",0,0,(X,))).

% tx-t8633[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 盗伐林木罪
inst(r("tx-t8633",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8633",0,0,(X,)),isA(X,"盗伐林木罪")) :- inst(r("tx-t8633",0,0,(X,))).
mainHead(r("tx-t8633",0,0,(X,)),constitutiveRule,isA(X,"盗伐林木罪")) :- inst(r("tx-t8633",0,0,(X,))).
cand(isA(X,"盗伐林木罪")) :- inst(r("tx-t8633",0,0,(X,))).
body(r("tx-t8633",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8633",0,0,(X,))).

% tx-t8641[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 盗伐林木罪
inst(r("tx-t8641",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8641",0,0,(X,)),isA(X,"盗伐林木罪")) :- inst(r("tx-t8641",0,0,(X,))).
mainHead(r("tx-t8641",0,0,(X,)),constitutiveRule,isA(X,"盗伐林木罪")) :- inst(r("tx-t8641",0,0,(X,))).
cand(isA(X,"盗伐林木罪")) :- inst(r("tx-t8641",0,0,(X,))).
body(r("tx-t8641",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8641",0,0,(X,))).

% tx-t8749[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 非法持有毒品罪
inst(r("tx-t8749",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8749",0,0,(X,)),isA(X,"非法持有毒品罪")) :- inst(r("tx-t8749",0,0,(X,))).
mainHead(r("tx-t8749",0,0,(X,)),constitutiveRule,isA(X,"非法持有毒品罪")) :- inst(r("tx-t8749",0,0,(X,))).
cand(isA(X,"非法持有毒品罪")) :- inst(r("tx-t8749",0,0,(X,))).
body(r("tx-t8749",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8749",0,0,(X,))).

% tx-t8751[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 非法持有毒品罪
inst(r("tx-t8751",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8751",0,0,(X,)),isA(X,"非法持有毒品罪")) :- inst(r("tx-t8751",0,0,(X,))).
mainHead(r("tx-t8751",0,0,(X,)),constitutiveRule,isA(X,"非法持有毒品罪")) :- inst(r("tx-t8751",0,0,(X,))).
cand(isA(X,"非法持有毒品罪")) :- inst(r("tx-t8751",0,0,(X,))).
body(r("tx-t8751",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8751",0,0,(X,))).

% tx-t8773[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 组织卖淫罪
inst(r("tx-t8773",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8773",0,0,(X,)),isA(X,"组织卖淫罪")) :- inst(r("tx-t8773",0,0,(X,))).
mainHead(r("tx-t8773",0,0,(X,)),constitutiveRule,isA(X,"组织卖淫罪")) :- inst(r("tx-t8773",0,0,(X,))).
cand(isA(X,"组织卖淫罪")) :- inst(r("tx-t8773",0,0,(X,))).
body(r("tx-t8773",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8773",0,0,(X,))).

% tx-t8776[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 组织卖淫罪
inst(r("tx-t8776",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8776",0,0,(X,)),isA(X,"组织卖淫罪")) :- inst(r("tx-t8776",0,0,(X,))).
mainHead(r("tx-t8776",0,0,(X,)),constitutiveRule,isA(X,"组织卖淫罪")) :- inst(r("tx-t8776",0,0,(X,))).
cand(isA(X,"组织卖淫罪")) :- inst(r("tx-t8776",0,0,(X,))).
body(r("tx-t8776",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8776",0,0,(X,))).

% tx-t8794[0.0] 分类（自动抽取自图的层级）：强迫卖淫罪VS组织卖淫罪 ⊑ 此罪与彼罪
inst(r("tx-t8794",0,0,(X,))) :- cand(isA(X,"强迫卖淫罪VS组织卖淫罪")).
constitutiveRule(r("tx-t8794",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8794",0,0,(X,))).
mainHead(r("tx-t8794",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t8794",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t8794",0,0,(X,))).
body(r("tx-t8794",0,0,(X,)),isA(X,"强迫卖淫罪VS组织卖淫罪")) :- inst(r("tx-t8794",0,0,(X,))).

% tx-t8807[0.0] 分类（自动抽取自图的层级）：强迫卖淫罪VS强奸罪 ⊑ 此罪与彼罪
inst(r("tx-t8807",0,0,(X,))) :- cand(isA(X,"强迫卖淫罪VS强奸罪")).
constitutiveRule(r("tx-t8807",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8807",0,0,(X,))).
mainHead(r("tx-t8807",0,0,(X,)),constitutiveRule,isA(X,"此罪与彼罪")) :- inst(r("tx-t8807",0,0,(X,))).
cand(isA(X,"此罪与彼罪")) :- inst(r("tx-t8807",0,0,(X,))).
body(r("tx-t8807",0,0,(X,)),isA(X,"强迫卖淫罪VS强奸罪")) :- inst(r("tx-t8807",0,0,(X,))).

% tx-t8837[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 传播性病罪
inst(r("tx-t8837",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8837",0,0,(X,)),isA(X,"传播性病罪")) :- inst(r("tx-t8837",0,0,(X,))).
mainHead(r("tx-t8837",0,0,(X,)),constitutiveRule,isA(X,"传播性病罪")) :- inst(r("tx-t8837",0,0,(X,))).
cand(isA(X,"传播性病罪")) :- inst(r("tx-t8837",0,0,(X,))).
body(r("tx-t8837",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8837",0,0,(X,))).

% tx-t8841[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 传播性病罪
inst(r("tx-t8841",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8841",0,0,(X,)),isA(X,"传播性病罪")) :- inst(r("tx-t8841",0,0,(X,))).
mainHead(r("tx-t8841",0,0,(X,)),constitutiveRule,isA(X,"传播性病罪")) :- inst(r("tx-t8841",0,0,(X,))).
cand(isA(X,"传播性病罪")) :- inst(r("tx-t8841",0,0,(X,))).
body(r("tx-t8841",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8841",0,0,(X,))).

% tx-t8895[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 侮辱国歌罪
inst(r("tx-t8895",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8895",0,0,(X,)),isA(X,"侮辱国歌罪")) :- inst(r("tx-t8895",0,0,(X,))).
mainHead(r("tx-t8895",0,0,(X,)),constitutiveRule,isA(X,"侮辱国歌罪")) :- inst(r("tx-t8895",0,0,(X,))).
cand(isA(X,"侮辱国歌罪")) :- inst(r("tx-t8895",0,0,(X,))).
body(r("tx-t8895",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8895",0,0,(X,))).

% tx-t8898[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 侮辱国歌罪
inst(r("tx-t8898",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8898",0,0,(X,)),isA(X,"侮辱国歌罪")) :- inst(r("tx-t8898",0,0,(X,))).
mainHead(r("tx-t8898",0,0,(X,)),constitutiveRule,isA(X,"侮辱国歌罪")) :- inst(r("tx-t8898",0,0,(X,))).
cand(isA(X,"侮辱国歌罪")) :- inst(r("tx-t8898",0,0,(X,))).
body(r("tx-t8898",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8898",0,0,(X,))).

% k382[0.0] 国家工作人员利用职务上的便利，侵吞、窃取、骗取或者以其他手段非法占有公共财物的，是贪污罪（第382条第1款；npc）
inst(r("k382",0,0,(P,X,))) :- cand(stateFunctionary(P)), cand(usesPosition(P,X)), cand(appropriatesPublicProperty(P,X)).
constitutiveRule(r("k382",0,0,(P,X,)),constitutes(P,X,corruption)) :- inst(r("k382",0,0,(P,X,))).
mainHead(r("k382",0,0,(P,X,)),constitutiveRule,constitutes(P,X,corruption)) :- inst(r("k382",0,0,(P,X,))).
cand(constitutes(P,X,corruption)) :- inst(r("k382",0,0,(P,X,))).
body(r("k382",0,0,(P,X,)),stateFunctionary(P)) :- inst(r("k382",0,0,(P,X,))).
body(r("k382",0,0,(P,X,)),usesPosition(P,X)) :- inst(r("k382",0,0,(P,X,))).
body(r("k382",0,0,(P,X,)),appropriatesPublicProperty(P,X)) :- inst(r("k382",0,0,(P,X,))).

% k382-2[0.0] 受国家机关、国有单位委托管理、经营国有财产的人员，利用职务便利非法占有国有财物的，以贪污论（第382条第2款；npc）
inst(r("k382-2",0,0,(P,X,))) :- cand(entrustedToManageStateAssets(P)), cand(usesPosition(P,X)), cand(appropriatesPublicProperty(P,X)).
constitutiveRule(r("k382-2",0,0,(P,X,)),constitutes(P,X,corruption)) :- inst(r("k382-2",0,0,(P,X,))).
mainHead(r("k382-2",0,0,(P,X,)),constitutiveRule,constitutes(P,X,corruption)) :- inst(r("k382-2",0,0,(P,X,))).
cand(constitutes(P,X,corruption)) :- inst(r("k382-2",0,0,(P,X,))).
body(r("k382-2",0,0,(P,X,)),entrustedToManageStateAssets(P)) :- inst(r("k382-2",0,0,(P,X,))).
body(r("k382-2",0,0,(P,X,)),usesPosition(P,X)) :- inst(r("k382-2",0,0,(P,X,))).
body(r("k382-2",0,0,(P,X,)),appropriatesPublicProperty(P,X)) :- inst(r("k382-2",0,0,(P,X,))).

% k382-3[0.0] 与前两款所列人员勾结，伙同贪污的，以共犯论处（第382条第3款；npc）
inst(r("k382-3",0,0,(P,Q,X,))) :- cand(colludesWith(P,Q,X)), cand(constitutes(Q,X,corruption)).
constitutiveRule(r("k382-3",0,0,(P,Q,X,)),constitutes(P,X,corruption)) :- inst(r("k382-3",0,0,(P,Q,X,))).
mainHead(r("k382-3",0,0,(P,Q,X,)),constitutiveRule,constitutes(P,X,corruption)) :- inst(r("k382-3",0,0,(P,Q,X,))).
cand(constitutes(P,X,corruption)) :- inst(r("k382-3",0,0,(P,Q,X,))).
body(r("k382-3",0,0,(P,Q,X,)),colludesWith(P,Q,X)) :- inst(r("k382-3",0,0,(P,Q,X,))).
body(r("k382-3",0,0,(P,Q,X,)),constitutes(Q,X,corruption)) :- inst(r("k382-3",0,0,(P,Q,X,))).

% tx-t8978[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 贪污罪
inst(r("tx-t8978",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t8978",0,0,(X,)),isA(X,"贪污罪")) :- inst(r("tx-t8978",0,0,(X,))).
mainHead(r("tx-t8978",0,0,(X,)),constitutiveRule,isA(X,"贪污罪")) :- inst(r("tx-t8978",0,0,(X,))).
cand(isA(X,"贪污罪")) :- inst(r("tx-t8978",0,0,(X,))).
body(r("tx-t8978",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t8978",0,0,(X,))).

% tx-t8995[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 贪污罪
inst(r("tx-t8995",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t8995",0,0,(X,)),isA(X,"贪污罪")) :- inst(r("tx-t8995",0,0,(X,))).
mainHead(r("tx-t8995",0,0,(X,)),constitutiveRule,isA(X,"贪污罪")) :- inst(r("tx-t8995",0,0,(X,))).
cand(isA(X,"贪污罪")) :- inst(r("tx-t8995",0,0,(X,))).
body(r("tx-t8995",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t8995",0,0,(X,))).

% tx-t8917[0.0] 分类（自动抽取自图的层级）：第三百八十二条 ⊑ 相关法条
inst(r("tx-t8917",0,0,(X,))) :- cand(isA(X,"第三百八十二条")).
constitutiveRule(r("tx-t8917",0,0,(X,)),isA(X,"相关法条")) :- inst(r("tx-t8917",0,0,(X,))).
mainHead(r("tx-t8917",0,0,(X,)),constitutiveRule,isA(X,"相关法条")) :- inst(r("tx-t8917",0,0,(X,))).
cand(isA(X,"相关法条")) :- inst(r("tx-t8917",0,0,(X,))).
body(r("tx-t8917",0,0,(X,)),isA(X,"第三百八十二条")) :- inst(r("tx-t8917",0,0,(X,))).

% tx-t8921[0.0] 分类（自动抽取自图的层级）：第三百八十三条 ⊑ 相关法条
inst(r("tx-t8921",0,0,(X,))) :- cand(isA(X,"第三百八十三条")).
constitutiveRule(r("tx-t8921",0,0,(X,)),isA(X,"相关法条")) :- inst(r("tx-t8921",0,0,(X,))).
mainHead(r("tx-t8921",0,0,(X,)),constitutiveRule,isA(X,"相关法条")) :- inst(r("tx-t8921",0,0,(X,))).
cand(isA(X,"相关法条")) :- inst(r("tx-t8921",0,0,(X,))).
body(r("tx-t8921",0,0,(X,)),isA(X,"第三百八十三条")) :- inst(r("tx-t8921",0,0,(X,))).

% k385[0.0] 国家工作人员利用职务上的便利，索取他人财物，或者非法收受他人财物、为他人谋取利益的，是受贿罪（第385条第1款；npc）
inst(r("k385",0,0,(P,X,))) :- cand(stateFunctionary(P)), cand(usesPosition(P,X)), cand(solicitsProperty(P,X)).
constitutiveRule(r("k385",0,0,(P,X,)),constitutes(P,X,bribeTaking)) :- inst(r("k385",0,0,(P,X,))).
mainHead(r("k385",0,0,(P,X,)),constitutiveRule,constitutes(P,X,bribeTaking)) :- inst(r("k385",0,0,(P,X,))).
cand(constitutes(P,X,bribeTaking)) :- inst(r("k385",0,0,(P,X,))).
body(r("k385",0,0,(P,X,)),stateFunctionary(P)) :- inst(r("k385",0,0,(P,X,))).
body(r("k385",0,0,(P,X,)),usesPosition(P,X)) :- inst(r("k385",0,0,(P,X,))).
body(r("k385",0,0,(P,X,)),solicitsProperty(P,X)) :- inst(r("k385",0,0,(P,X,))).
% k385[1.0] 国家工作人员利用职务上的便利，索取他人财物，或者非法收受他人财物、为他人谋取利益的，是受贿罪（第385条第1款；npc）
inst(r("k385",1,0,(P,X,))) :- cand(stateFunctionary(P)), cand(usesPosition(P,X)), cand(acceptsProperty(P,X)), cand(seeksBenefitForGiver(P,X)).
constitutiveRule(r("k385",1,0,(P,X,)),constitutes(P,X,bribeTaking)) :- inst(r("k385",1,0,(P,X,))).
mainHead(r("k385",1,0,(P,X,)),constitutiveRule,constitutes(P,X,bribeTaking)) :- inst(r("k385",1,0,(P,X,))).
cand(constitutes(P,X,bribeTaking)) :- inst(r("k385",1,0,(P,X,))).
body(r("k385",1,0,(P,X,)),stateFunctionary(P)) :- inst(r("k385",1,0,(P,X,))).
body(r("k385",1,0,(P,X,)),usesPosition(P,X)) :- inst(r("k385",1,0,(P,X,))).
body(r("k385",1,0,(P,X,)),acceptsProperty(P,X)) :- inst(r("k385",1,0,(P,X,))).
body(r("k385",1,0,(P,X,)),seeksBenefitForGiver(P,X)) :- inst(r("k385",1,0,(P,X,))).

% k389[0.0] 为谋取不正当利益，给予国家工作人员以财物的，是行贿罪（第389条第1款；npc）
inst(r("k389",0,0,(P,X,))) :- cand(givesPropertyToFunctionary(P,X)), cand(seeksImproperBenefit(P,X)).
constitutiveRule(r("k389",0,0,(P,X,)),constitutes(P,X,bribeGiving)) :- inst(r("k389",0,0,(P,X,))).
mainHead(r("k389",0,0,(P,X,)),constitutiveRule,constitutes(P,X,bribeGiving)) :- inst(r("k389",0,0,(P,X,))).
cand(constitutes(P,X,bribeGiving)) :- inst(r("k389",0,0,(P,X,))).
body(r("k389",0,0,(P,X,)),givesPropertyToFunctionary(P,X)) :- inst(r("k389",0,0,(P,X,))).
body(r("k389",0,0,(P,X,)),seeksImproperBenefit(P,X)) :- inst(r("k389",0,0,(P,X,))).

% k390-3[0.0] 行贿人在被追诉前主动交待行贿行为的，可以从轻或者减轻处罚（第390条第3款；npc）
inst(r("k390-3",0,0,(P,X,))) :- cand(convicted(P,X,bribeGiving)), cand(confessesBeforeProsecution(P,X)).
permissiveRule(r("k390-3",0,0,(P,X,)),sentence(P,X,lighterOrReduced)) :- inst(r("k390-3",0,0,(P,X,))).
mainHead(r("k390-3",0,0,(P,X,)),permissiveRule,sentence(P,X,lighterOrReduced)) :- inst(r("k390-3",0,0,(P,X,))).
cand(sentence(P,X,lighterOrReduced)) :- inst(r("k390-3",0,0,(P,X,))).
body(r("k390-3",0,0,(P,X,)),convicted(P,X,bribeGiving)) :- inst(r("k390-3",0,0,(P,X,))).
body(r("k390-3",0,0,(P,X,)),confessesBeforeProsecution(P,X)) :- inst(r("k390-3",0,0,(P,X,))).

% k389-3[0.0] 因被勒索给予国家工作人员以财物，没有获得不正当利益的，不是行贿（第389条第3款；npc）
inst(r("k389-3",0,0,(P,X,))) :- cand(givesPropertyToFunctionary(P,X)), cand(extortedByFunctionary(P,X)).
constitutiveRule(r("k389-3",0,0,(P,X,)),non(constitutes(P,X,bribeGiving))) :- inst(r("k389-3",0,0,(P,X,))).
mainHead(r("k389-3",0,0,(P,X,)),constitutiveRule,non(constitutes(P,X,bribeGiving))) :- inst(r("k389-3",0,0,(P,X,))).
cand(constitutes(P,X,bribeGiving)) :- inst(r("k389-3",0,0,(P,X,))).
body(r("k389-3",0,0,(P,X,)),givesPropertyToFunctionary(P,X)) :- inst(r("k389-3",0,0,(P,X,))).
body(r("k389-3",0,0,(P,X,)),extortedByFunctionary(P,X)) :- inst(r("k389-3",0,0,(P,X,))).
inst(x("k389-3",0,0,0,(P,X,))) :- inst(r("k389-3",0,0,(P,X,))), cand(obtainedImproperBenefit(P,X)).
constitutiveRule(x("k389-3",0,0,0,(P,X,)),constitutes(P,X,bribeGiving)) :- inst(x("k389-3",0,0,0,(P,X,))).
body(x("k389-3",0,0,0,(P,X,)),givesPropertyToFunctionary(P,X)) :- inst(x("k389-3",0,0,0,(P,X,))).
body(x("k389-3",0,0,0,(P,X,)),extortedByFunctionary(P,X)) :- inst(x("k389-3",0,0,0,(P,X,))).
body(x("k389-3",0,0,0,(P,X,)),obtainedImproperBenefit(P,X)) :- inst(x("k389-3",0,0,0,(P,X,))).
superior(x("k389-3",0,0,0,(P,X,)),r("k389-3",0,0,(P,X,))) :- inst(x("k389-3",0,0,0,(P,X,))).
exc(x("k389-3",0,0,0,(P,X,)),r("k389-3",0,0,(P,X,)),constitutiveRule,non(constitutes(P,X,bribeGiving))) :- inst(x("k389-3",0,0,0,(P,X,))).

% tx-t9282[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 对有影响力的人行贿罪
inst(r("tx-t9282",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t9282",0,0,(X,)),isA(X,"对有影响力的人行贿罪")) :- inst(r("tx-t9282",0,0,(X,))).
mainHead(r("tx-t9282",0,0,(X,)),constitutiveRule,isA(X,"对有影响力的人行贿罪")) :- inst(r("tx-t9282",0,0,(X,))).
cand(isA(X,"对有影响力的人行贿罪")) :- inst(r("tx-t9282",0,0,(X,))).
body(r("tx-t9282",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t9282",0,0,(X,))).

% tx-t9284[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 对有影响力的人行贿罪
inst(r("tx-t9284",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t9284",0,0,(X,)),isA(X,"对有影响力的人行贿罪")) :- inst(r("tx-t9284",0,0,(X,))).
mainHead(r("tx-t9284",0,0,(X,)),constitutiveRule,isA(X,"对有影响力的人行贿罪")) :- inst(r("tx-t9284",0,0,(X,))).
cand(isA(X,"对有影响力的人行贿罪")) :- inst(r("tx-t9284",0,0,(X,))).
body(r("tx-t9284",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t9284",0,0,(X,))).

% tx-t9314[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 巨额财产来源不明罪
inst(r("tx-t9314",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t9314",0,0,(X,)),isA(X,"巨额财产来源不明罪")) :- inst(r("tx-t9314",0,0,(X,))).
mainHead(r("tx-t9314",0,0,(X,)),constitutiveRule,isA(X,"巨额财产来源不明罪")) :- inst(r("tx-t9314",0,0,(X,))).
cand(isA(X,"巨额财产来源不明罪")) :- inst(r("tx-t9314",0,0,(X,))).
body(r("tx-t9314",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t9314",0,0,(X,))).

% tx-t9319[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 巨额财产来源不明罪
inst(r("tx-t9319",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t9319",0,0,(X,)),isA(X,"巨额财产来源不明罪")) :- inst(r("tx-t9319",0,0,(X,))).
mainHead(r("tx-t9319",0,0,(X,)),constitutiveRule,isA(X,"巨额财产来源不明罪")) :- inst(r("tx-t9319",0,0,(X,))).
cand(isA(X,"巨额财产来源不明罪")) :- inst(r("tx-t9319",0,0,(X,))).
body(r("tx-t9319",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t9319",0,0,(X,))).

% tx-t9609[0.0] 分类（自动抽取自图的层级）：罪与非罪 ⊑ 私放在押人员罪
inst(r("tx-t9609",0,0,(X,))) :- cand(isA(X,"罪与非罪")).
constitutiveRule(r("tx-t9609",0,0,(X,)),isA(X,"私放在押人员罪")) :- inst(r("tx-t9609",0,0,(X,))).
mainHead(r("tx-t9609",0,0,(X,)),constitutiveRule,isA(X,"私放在押人员罪")) :- inst(r("tx-t9609",0,0,(X,))).
cand(isA(X,"私放在押人员罪")) :- inst(r("tx-t9609",0,0,(X,))).
body(r("tx-t9609",0,0,(X,)),isA(X,"罪与非罪")) :- inst(r("tx-t9609",0,0,(X,))).

% tx-t9612[0.0] 分类（自动抽取自图的层级）：此罪与彼罪 ⊑ 私放在押人员罪
inst(r("tx-t9612",0,0,(X,))) :- cand(isA(X,"此罪与彼罪")).
constitutiveRule(r("tx-t9612",0,0,(X,)),isA(X,"私放在押人员罪")) :- inst(r("tx-t9612",0,0,(X,))).
mainHead(r("tx-t9612",0,0,(X,)),constitutiveRule,isA(X,"私放在押人员罪")) :- inst(r("tx-t9612",0,0,(X,))).
cand(isA(X,"私放在押人员罪")) :- inst(r("tx-t9612",0,0,(X,))).
body(r("tx-t9612",0,0,(X,)),isA(X,"此罪与彼罪")) :- inst(r("tx-t9612",0,0,(X,))).

% —— Naf 的语义是“仅阻断宿主规则”：其他推出同一结论的规则实例优先于该例外 ——
superior(L2,XL) :- exc(XL,L,T,H), mainHead(L2,T,H), L2 != L.
% —— Override → superior ——
superior(r("k18-1",0,0,(C,P,X,)),r("k17-1",0,0,(C,P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-1",0,0,(C,P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-2-intentionalHomicide",0,0,(P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-2-intentionalInjury",0,0,(P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-2-rape",0,0,(P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-2-rape",0,0,(P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-2-robbery",0,0,(P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-2-robbery",0,0,(P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-2-drugTrafficking",0,0,(P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-2-drugTrafficking",0,0,(P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-2-arson",0,0,(P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-2-arson",0,0,(P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-2-explosion",0,0,(P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-2-explosion",0,0,(P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-2-poisoning",0,0,(P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-2-poisoning",0,0,(P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-3",0,0,(C,P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-3",0,0,(C,P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-3",1,0,(C,P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-3",1,0,(C,P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-3",2,0,(C,P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-3",2,0,(C,P,X,))).
superior(r("k18-1",0,0,(C,P,X,)),r("k17-3",3,0,(C,P,X,))) :- inst(r("k18-1",0,0,(C,P,X,))), inst(r("k17-3",3,0,(C,P,X,))).
superior(r("k20-1",0,0,(C,P,X,)),r("k17-1",0,0,(C,P,X,))) :- inst(r("k20-1",0,0,(C,P,X,))), inst(r("k17-1",0,0,(C,P,X,))).
superior(r("k20-1",0,1,(C,P,X,)),r("k17-1",0,0,(C,P,X,))) :- inst(r("k20-1",0,1,(C,P,X,))), inst(r("k17-1",0,0,(C,P,X,))).
superior(r("k20-3",0,0,(C,P,X,)),r("k17-1",0,0,(C,P,X,))) :- inst(r("k20-3",0,0,(C,P,X,))), inst(r("k17-1",0,0,(C,P,X,))).
superior(r("k20-3",0,1,(C,P,X,)),r("k17-1",0,0,(C,P,X,))) :- inst(r("k20-3",0,1,(C,P,X,))), inst(r("k17-1",0,0,(C,P,X,))).
superior(r("k20-1",0,0,(C,P,X,)),r("k17-2-intentionalHomicide",0,0,(P,X,))) :- inst(r("k20-1",0,0,(C,P,X,))), inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).
superior(r("k20-1",0,1,(C,P,X,)),r("k17-2-intentionalHomicide",0,0,(P,X,))) :- inst(r("k20-1",0,1,(C,P,X,))), inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).
superior(r("k20-1",0,0,(C,P,X,)),r("k17-2-intentionalInjury",0,0,(P,X,))) :- inst(r("k20-1",0,0,(C,P,X,))), inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
superior(r("k20-1",0,1,(C,P,X,)),r("k17-2-intentionalInjury",0,0,(P,X,))) :- inst(r("k20-1",0,1,(C,P,X,))), inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
superior(r("k20-1",0,0,(C,P,X,)),r("k17-2-rape",0,0,(P,X,))) :- inst(r("k20-1",0,0,(C,P,X,))), inst(r("k17-2-rape",0,0,(P,X,))).
superior(r("k20-1",0,1,(C,P,X,)),r("k17-2-rape",0,0,(P,X,))) :- inst(r("k20-1",0,1,(C,P,X,))), inst(r("k17-2-rape",0,0,(P,X,))).
superior(r("k20-1",0,0,(C,P,X,)),r("k17-2-robbery",0,0,(P,X,))) :- inst(r("k20-1",0,0,(C,P,X,))), inst(r("k17-2-robbery",0,0,(P,X,))).
superior(r("k20-1",0,1,(C,P,X,)),r("k17-2-robbery",0,0,(P,X,))) :- inst(r("k20-1",0,1,(C,P,X,))), inst(r("k17-2-robbery",0,0,(P,X,))).
superior(r("k20-1",0,0,(C,P,X,)),r("k17-2-drugTrafficking",0,0,(P,X,))) :- inst(r("k20-1",0,0,(C,P,X,))), inst(r("k17-2-drugTrafficking",0,0,(P,X,))).
superior(r("k20-1",0,1,(C,P,X,)),r("k17-2-drugTrafficking",0,0,(P,X,))) :- inst(r("k20-1",0,1,(C,P,X,))), inst(r("k17-2-drugTrafficking",0,0,(P,X,))).
superior(r("k20-1",0,0,(C,P,X,)),r("k17-2-arson",0,0,(P,X,))) :- inst(r("k20-1",0,0,(C,P,X,))), inst(r("k17-2-arson",0,0,(P,X,))).
superior(r("k20-1",0,1,(C,P,X,)),r("k17-2-arson",0,0,(P,X,))) :- inst(r("k20-1",0,1,(C,P,X,))), inst(r("k17-2-arson",0,0,(P,X,))).
superior(r("k20-1",0,0,(C,P,X,)),r("k17-2-explosion",0,0,(P,X,))) :- inst(r("k20-1",0,0,(C,P,X,))), inst(r("k17-2-explosion",0,0,(P,X,))).
superior(r("k20-1",0,1,(C,P,X,)),r("k17-2-explosion",0,0,(P,X,))) :- inst(r("k20-1",0,1,(C,P,X,))), inst(r("k17-2-explosion",0,0,(P,X,))).
superior(r("k20-1",0,0,(C,P,X,)),r("k17-2-poisoning",0,0,(P,X,))) :- inst(r("k20-1",0,0,(C,P,X,))), inst(r("k17-2-poisoning",0,0,(P,X,))).
superior(r("k20-1",0,1,(C,P,X,)),r("k17-2-poisoning",0,0,(P,X,))) :- inst(r("k20-1",0,1,(C,P,X,))), inst(r("k17-2-poisoning",0,0,(P,X,))).
superior(r("k20-3",0,0,(C,P,X,)),r("k17-2-intentionalHomicide",0,0,(P,X,))) :- inst(r("k20-3",0,0,(C,P,X,))), inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).
superior(r("k20-3",0,1,(C,P,X,)),r("k17-2-intentionalHomicide",0,0,(P,X,))) :- inst(r("k20-3",0,1,(C,P,X,))), inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).
superior(r("k20-3",0,0,(C,P,X,)),r("k17-2-intentionalInjury",0,0,(P,X,))) :- inst(r("k20-3",0,0,(C,P,X,))), inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
superior(r("k20-3",0,1,(C,P,X,)),r("k17-2-intentionalInjury",0,0,(P,X,))) :- inst(r("k20-3",0,1,(C,P,X,))), inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
superior(r("k20-3",0,0,(C,P,X,)),r("k17-2-rape",0,0,(P,X,))) :- inst(r("k20-3",0,0,(C,P,X,))), inst(r("k17-2-rape",0,0,(P,X,))).
superior(r("k20-3",0,1,(C,P,X,)),r("k17-2-rape",0,0,(P,X,))) :- inst(r("k20-3",0,1,(C,P,X,))), inst(r("k17-2-rape",0,0,(P,X,))).
superior(r("k20-3",0,0,(C,P,X,)),r("k17-2-robbery",0,0,(P,X,))) :- inst(r("k20-3",0,0,(C,P,X,))), inst(r("k17-2-robbery",0,0,(P,X,))).
superior(r("k20-3",0,1,(C,P,X,)),r("k17-2-robbery",0,0,(P,X,))) :- inst(r("k20-3",0,1,(C,P,X,))), inst(r("k17-2-robbery",0,0,(P,X,))).
superior(r("k20-3",0,0,(C,P,X,)),r("k17-2-drugTrafficking",0,0,(P,X,))) :- inst(r("k20-3",0,0,(C,P,X,))), inst(r("k17-2-drugTrafficking",0,0,(P,X,))).
superior(r("k20-3",0,1,(C,P,X,)),r("k17-2-drugTrafficking",0,0,(P,X,))) :- inst(r("k20-3",0,1,(C,P,X,))), inst(r("k17-2-drugTrafficking",0,0,(P,X,))).
superior(r("k20-3",0,0,(C,P,X,)),r("k17-2-arson",0,0,(P,X,))) :- inst(r("k20-3",0,0,(C,P,X,))), inst(r("k17-2-arson",0,0,(P,X,))).
superior(r("k20-3",0,1,(C,P,X,)),r("k17-2-arson",0,0,(P,X,))) :- inst(r("k20-3",0,1,(C,P,X,))), inst(r("k17-2-arson",0,0,(P,X,))).
superior(r("k20-3",0,0,(C,P,X,)),r("k17-2-explosion",0,0,(P,X,))) :- inst(r("k20-3",0,0,(C,P,X,))), inst(r("k17-2-explosion",0,0,(P,X,))).
superior(r("k20-3",0,1,(C,P,X,)),r("k17-2-explosion",0,0,(P,X,))) :- inst(r("k20-3",0,1,(C,P,X,))), inst(r("k17-2-explosion",0,0,(P,X,))).
superior(r("k20-3",0,0,(C,P,X,)),r("k17-2-poisoning",0,0,(P,X,))) :- inst(r("k20-3",0,0,(C,P,X,))), inst(r("k17-2-poisoning",0,0,(P,X,))).
superior(r("k20-3",0,1,(C,P,X,)),r("k17-2-poisoning",0,0,(P,X,))) :- inst(r("k20-3",0,1,(C,P,X,))), inst(r("k17-2-poisoning",0,0,(P,X,))).
superior(r("k21-1",0,0,(C,P,X,)),r("k17-2-intentionalHomicide",0,0,(P,X,))) :- inst(r("k21-1",0,0,(C,P,X,))), inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).
superior(r("k21-1",0,1,(C,P,X,)),r("k17-2-intentionalHomicide",0,0,(P,X,))) :- inst(r("k21-1",0,1,(C,P,X,))), inst(r("k17-2-intentionalHomicide",0,0,(P,X,))).
superior(r("k21-1",0,0,(C,P,X,)),r("k17-2-intentionalInjury",0,0,(P,X,))) :- inst(r("k21-1",0,0,(C,P,X,))), inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
superior(r("k21-1",0,1,(C,P,X,)),r("k17-2-intentionalInjury",0,0,(P,X,))) :- inst(r("k21-1",0,1,(C,P,X,))), inst(r("k17-2-intentionalInjury",0,0,(P,X,))).
superior(r("k21-1",0,0,(C,P,X,)),r("k17-2-rape",0,0,(P,X,))) :- inst(r("k21-1",0,0,(C,P,X,))), inst(r("k17-2-rape",0,0,(P,X,))).
superior(r("k21-1",0,1,(C,P,X,)),r("k17-2-rape",0,0,(P,X,))) :- inst(r("k21-1",0,1,(C,P,X,))), inst(r("k17-2-rape",0,0,(P,X,))).
superior(r("k21-1",0,0,(C,P,X,)),r("k17-2-robbery",0,0,(P,X,))) :- inst(r("k21-1",0,0,(C,P,X,))), inst(r("k17-2-robbery",0,0,(P,X,))).
superior(r("k21-1",0,1,(C,P,X,)),r("k17-2-robbery",0,0,(P,X,))) :- inst(r("k21-1",0,1,(C,P,X,))), inst(r("k17-2-robbery",0,0,(P,X,))).
superior(r("k21-1",0,0,(C,P,X,)),r("k17-2-drugTrafficking",0,0,(P,X,))) :- inst(r("k21-1",0,0,(C,P,X,))), inst(r("k17-2-drugTrafficking",0,0,(P,X,))).
superior(r("k21-1",0,1,(C,P,X,)),r("k17-2-drugTrafficking",0,0,(P,X,))) :- inst(r("k21-1",0,1,(C,P,X,))), inst(r("k17-2-drugTrafficking",0,0,(P,X,))).
superior(r("k21-1",0,0,(C,P,X,)),r("k17-2-arson",0,0,(P,X,))) :- inst(r("k21-1",0,0,(C,P,X,))), inst(r("k17-2-arson",0,0,(P,X,))).
superior(r("k21-1",0,1,(C,P,X,)),r("k17-2-arson",0,0,(P,X,))) :- inst(r("k21-1",0,1,(C,P,X,))), inst(r("k17-2-arson",0,0,(P,X,))).
superior(r("k21-1",0,0,(C,P,X,)),r("k17-2-explosion",0,0,(P,X,))) :- inst(r("k21-1",0,0,(C,P,X,))), inst(r("k17-2-explosion",0,0,(P,X,))).
superior(r("k21-1",0,1,(C,P,X,)),r("k17-2-explosion",0,0,(P,X,))) :- inst(r("k21-1",0,1,(C,P,X,))), inst(r("k17-2-explosion",0,0,(P,X,))).
superior(r("k21-1",0,0,(C,P,X,)),r("k17-2-poisoning",0,0,(P,X,))) :- inst(r("k21-1",0,0,(C,P,X,))), inst(r("k17-2-poisoning",0,0,(P,X,))).
superior(r("k21-1",0,1,(C,P,X,)),r("k17-2-poisoning",0,0,(P,X,))) :- inst(r("k21-1",0,1,(C,P,X,))), inst(r("k17-2-poisoning",0,0,(P,X,))).
superior(r("k21-1",0,0,(C,P,X,)),r("k17-1",0,0,(C,P,X,))) :- inst(r("k21-1",0,0,(C,P,X,))), inst(r("k17-1",0,0,(C,P,X,))).
superior(r("k21-1",0,1,(C,P,X,)),r("k17-1",0,0,(C,P,X,))) :- inst(r("k21-1",0,1,(C,P,X,))), inst(r("k17-1",0,0,(C,P,X,))).
superior(r("k20-late",0,0,(P,X,)),r("k20-cond",0,0,(P,X,))) :- inst(r("k20-late",0,0,(P,X,))), inst(r("k20-cond",0,0,(P,X,))).
superior(r("k389-3",0,0,(P,X,)),r("k389",0,0,(P,X,))) :- inst(r("k389-3",0,0,(P,X,))), inst(r("k389",0,0,(P,X,))).
superior(r("k88-1",0,0,(P,X,)),r("k87-under5",0,0,(X,))) :- inst(r("k88-1",0,0,(P,X,))), inst(r("k87-under5",0,0,(X,))).
superior(r("k88-1",0,0,(P,X,)),r("k87-from5to10",0,0,(X,))) :- inst(r("k88-1",0,0,(P,X,))), inst(r("k87-from5to10",0,0,(X,))).
superior(r("k88-1",0,0,(P,X,)),r("k87-from10",0,0,(X,))) :- inst(r("k88-1",0,0,(P,X,))), inst(r("k87-from10",0,0,(X,))).
superior(r("k88-1",0,0,(P,X,)),r("k87-lifeOrDeath",0,0,(X,))) :- inst(r("k88-1",0,0,(P,X,))), inst(r("k87-lifeOrDeath",0,0,(X,))).
superior(r("k88-2",0,0,(X,)),r("k87-under5",0,0,(X,))) :- inst(r("k88-2",0,0,(X,))), inst(r("k87-under5",0,0,(X,))).
superior(r("k88-2",0,0,(X,)),r("k87-from5to10",0,0,(X,))) :- inst(r("k88-2",0,0,(X,))), inst(r("k87-from5to10",0,0,(X,))).
superior(r("k88-2",0,0,(X,)),r("k87-from10",0,0,(X,))) :- inst(r("k88-2",0,0,(X,))), inst(r("k87-from10",0,0,(X,))).
superior(r("k88-2",0,0,(X,)),r("k87-lifeOrDeath",0,0,(X,))) :- inst(r("k88-2",0,0,(X,))), inst(r("k87-lifeOrDeath",0,0,(X,))).
superior(r("k-conv-absorb",0,0,(P,X,)),r("k-convict",0,0,(C,P,X,))) :- inst(r("k-conv-absorb",0,0,(P,X,))), inst(r("k-convict",0,0,(C,P,X,))).
superior(r("k-conv-absorb",0,1,(P,X,)),r("k-convict",0,0,(C,P,X,))) :- inst(r("k-conv-absorb",0,1,(P,X,))), inst(r("k-convict",0,0,(C,P,X,))).
superior(r("k-conv-absorb",0,2,(P,X,)),r("k-convict",0,0,(C,P,X,))) :- inst(r("k-conv-absorb",0,2,(P,X,))), inst(r("k-convict",0,0,(C,P,X,))).
superior(r("k-conv-absorb",1,0,(P,X,)),r("k-convict",0,0,(C,P,X,))) :- inst(r("k-conv-absorb",1,0,(P,X,))), inst(r("k-convict",0,0,(C,P,X,))).
superior(r("k-conv-absorb",1,1,(P,X,)),r("k-convict",0,0,(C,P,X,))) :- inst(r("k-conv-absorb",1,1,(P,X,))), inst(r("k-convict",0,0,(C,P,X,))).
superior(r("k-conv-absorb",1,2,(P,X,)),r("k-convict",0,0,(C,P,X,))) :- inst(r("k-conv-absorb",1,2,(P,X,))), inst(r("k-convict",0,0,(C,P,X,))).
superior(r("k-conv-absorb",2,0,(P,X,)),r("k-convict",0,0,(C,P,X,))) :- inst(r("k-conv-absorb",2,0,(P,X,))), inst(r("k-convict",0,0,(C,P,X,))).
superior(r("k-conv-absorb",2,1,(P,X,)),r("k-convict",0,0,(C,P,X,))) :- inst(r("k-conv-absorb",2,1,(P,X,))), inst(r("k-convict",0,0,(C,P,X,))).
superior(r("k-conv-absorb",2,2,(P,X,)),r("k-convict",0,0,(C,P,X,))) :- inst(r("k-conv-absorb",2,2,(P,X,))), inst(r("k-convict",0,0,(C,P,X,))).
superior(r("k74",0,0,(P,X,)),r("k72",0,0,(P,X,))) :- inst(r("k74",0,0,(P,X,))), inst(r("k72",0,0,(P,X,))).
superior(r("k74",1,0,(P,X,)),r("k72",0,0,(P,X,))) :- inst(r("k74",1,0,(P,X,))), inst(r("k72",0,0,(P,X,))).
superior(r("k74",0,0,(P,X,)),r("k72-must",0,0,(P,X,))) :- inst(r("k74",0,0,(P,X,))), inst(r("k72-must",0,0,(P,X,))).
superior(r("k74",0,0,(P,X,)),r("k72-must",1,0,(P,X,))) :- inst(r("k74",0,0,(P,X,))), inst(r("k72-must",1,0,(P,X,))).
superior(r("k74",0,0,(P,X,)),r("k72-must",2,0,(P,X,))) :- inst(r("k74",0,0,(P,X,))), inst(r("k72-must",2,0,(P,X,))).
superior(r("k74",1,0,(P,X,)),r("k72-must",0,0,(P,X,))) :- inst(r("k74",1,0,(P,X,))), inst(r("k72-must",0,0,(P,X,))).
superior(r("k74",1,0,(P,X,)),r("k72-must",1,0,(P,X,))) :- inst(r("k74",1,0,(P,X,))), inst(r("k72-must",1,0,(P,X,))).
superior(r("k74",1,0,(P,X,)),r("k72-must",2,0,(P,X,))) :- inst(r("k74",1,0,(P,X,))), inst(r("k72-must",2,0,(P,X,))).
superior(r("k81-2",0,0,(P,X,)),r("k81-1",0,0,(P,X,))) :- inst(r("k81-2",0,0,(P,X,))), inst(r("k81-1",0,0,(P,X,))).
superior(r("k81-2",1,0,(P,X,)),r("k81-1",0,0,(P,X,))) :- inst(r("k81-2",1,0,(P,X,))), inst(r("k81-1",0,0,(P,X,))).
superior(r("k24-noAttempt",0,0,(P,X,)),r("k23",0,0,(P,X,))) :- inst(r("k24-noAttempt",0,0,(P,X,))), inst(r("k23",0,0,(P,X,))).
