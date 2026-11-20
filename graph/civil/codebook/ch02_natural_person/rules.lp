% 由 lrml2ddl.py 从 civil_graph.lrml 生成。配合 ddl_engine/language.asp + Deontic/defeasible-ab.asp + Deontic/deontic.asp 使用。
isNon(non(A)) :- fact(non(A)).
cand(A) :- fact(A), not isNon(A).
cand(A) :- fact(non(A)).
atom(A) :- cand(A).
true.

% c15-cert-flag[0.0] 有出生证明或死亡证明（辅助）（第15条；npc）
inst(r("c15-cert-flag",0,0,(E,P,T,))) :- cand(recordedInCertificate(P,E,T)).
constitutiveRule(r("c15-cert-flag",0,0,(E,P,T,)),hasCertificate(P,E)) :- inst(r("c15-cert-flag",0,0,(E,P,T,))).
mainHead(r("c15-cert-flag",0,0,(E,P,T,)),constitutiveRule,hasCertificate(P,E)) :- inst(r("c15-cert-flag",0,0,(E,P,T,))).
cand(hasCertificate(P,E)) :- inst(r("c15-cert-flag",0,0,(E,P,T,))).
body(r("c15-cert-flag",0,0,(E,P,T,)),recordedInCertificate(P,E,T)) :- inst(r("c15-cert-flag",0,0,(E,P,T,))).

% c13[0.0] 自然人从出生时起到死亡时止，具有民事权利能力（第13条；npc）
inst(r("c13",0,0,(P,))) :- cand(naturalPerson(P)), cand(born(P)).
constitutiveRule(r("c13",0,0,(P,)),legalCapacity(P)) :- inst(r("c13",0,0,(P,))).
mainHead(r("c13",0,0,(P,)),constitutiveRule,legalCapacity(P)) :- inst(r("c13",0,0,(P,))).
cand(legalCapacity(P)) :- inst(r("c13",0,0,(P,))).
body(r("c13",0,0,(P,)),naturalPerson(P)) :- inst(r("c13",0,0,(P,))).
body(r("c13",0,0,(P,)),born(P)) :- inst(r("c13",0,0,(P,))).
inst(x("c13",0,0,0,(P,))) :- inst(r("c13",0,0,(P,))), cand(dead(P)).
constitutiveRule(x("c13",0,0,0,(P,)),non(legalCapacity(P))) :- inst(x("c13",0,0,0,(P,))).
body(x("c13",0,0,0,(P,)),naturalPerson(P)) :- inst(x("c13",0,0,0,(P,))).
body(x("c13",0,0,0,(P,)),born(P)) :- inst(x("c13",0,0,0,(P,))).
body(x("c13",0,0,0,(P,)),dead(P)) :- inst(x("c13",0,0,0,(P,))).
superior(x("c13",0,0,0,(P,)),r("c13",0,0,(P,))) :- inst(x("c13",0,0,0,(P,))).
exc(x("c13",0,0,0,(P,)),r("c13",0,0,(P,)),constitutiveRule,legalCapacity(P)) :- inst(x("c13",0,0,0,(P,))).

% c15-cert[0.0] 出生、死亡时间以出生证明、死亡证明记载的时间为准（第15条；npc）
inst(r("c15-cert",0,0,(E,P,T,))) :- cand(recordedInCertificate(P,E,T)).
constitutiveRule(r("c15-cert",0,0,(E,P,T,)),eventTime(P,E,T)) :- inst(r("c15-cert",0,0,(E,P,T,))).
mainHead(r("c15-cert",0,0,(E,P,T,)),constitutiveRule,eventTime(P,E,T)) :- inst(r("c15-cert",0,0,(E,P,T,))).
cand(eventTime(P,E,T)) :- inst(r("c15-cert",0,0,(E,P,T,))).
body(r("c15-cert",0,0,(E,P,T,)),recordedInCertificate(P,E,T)) :- inst(r("c15-cert",0,0,(E,P,T,))).
inst(x("c15-cert",0,0,0,(E,P,T,))) :- inst(r("c15-cert",0,0,(E,P,T,))), cand(rebuttedByEvidence(P,E)).
constitutiveRule(x("c15-cert",0,0,0,(E,P,T,)),non(eventTime(P,E,T))) :- inst(x("c15-cert",0,0,0,(E,P,T,))).
body(x("c15-cert",0,0,0,(E,P,T,)),recordedInCertificate(P,E,T)) :- inst(x("c15-cert",0,0,0,(E,P,T,))).
body(x("c15-cert",0,0,0,(E,P,T,)),rebuttedByEvidence(P,E)) :- inst(x("c15-cert",0,0,0,(E,P,T,))).
superior(x("c15-cert",0,0,0,(E,P,T,)),r("c15-cert",0,0,(E,P,T,))) :- inst(x("c15-cert",0,0,0,(E,P,T,))).
exc(x("c15-cert",0,0,0,(E,P,T,)),r("c15-cert",0,0,(E,P,T,)),constitutiveRule,eventTime(P,E,T)) :- inst(x("c15-cert",0,0,0,(E,P,T,))).

% c15-reg[0.0] 没有出生证明、死亡证明的，以户籍登记或者其他有效身份登记记载的时间为准（第15条；npc）
inst(r("c15-reg",0,0,(E,P,T,))) :- cand(recordedInRegistration(P,E,T)).
constitutiveRule(r("c15-reg",0,0,(E,P,T,)),eventTime(P,E,T)) :- inst(r("c15-reg",0,0,(E,P,T,))).
mainHead(r("c15-reg",0,0,(E,P,T,)),constitutiveRule,eventTime(P,E,T)) :- inst(r("c15-reg",0,0,(E,P,T,))).
cand(eventTime(P,E,T)) :- inst(r("c15-reg",0,0,(E,P,T,))).
body(r("c15-reg",0,0,(E,P,T,)),recordedInRegistration(P,E,T)) :- inst(r("c15-reg",0,0,(E,P,T,))).
inst(x("c15-reg",0,0,0,(E,P,T,))) :- inst(r("c15-reg",0,0,(E,P,T,))), cand(hasCertificate(P,E)).
constitutiveRule(x("c15-reg",0,0,0,(E,P,T,)),non(eventTime(P,E,T))) :- inst(x("c15-reg",0,0,0,(E,P,T,))).
body(x("c15-reg",0,0,0,(E,P,T,)),recordedInRegistration(P,E,T)) :- inst(x("c15-reg",0,0,0,(E,P,T,))).
body(x("c15-reg",0,0,0,(E,P,T,)),hasCertificate(P,E)) :- inst(x("c15-reg",0,0,0,(E,P,T,))).
superior(x("c15-reg",0,0,0,(E,P,T,)),r("c15-reg",0,0,(E,P,T,))) :- inst(x("c15-reg",0,0,0,(E,P,T,))).
exc(x("c15-reg",0,0,0,(E,P,T,)),r("c15-reg",0,0,(E,P,T,)),constitutiveRule,eventTime(P,E,T)) :- inst(x("c15-reg",0,0,0,(E,P,T,))).
inst(x("c15-reg",0,0,1,(E,P,T,))) :- inst(r("c15-reg",0,0,(E,P,T,))), cand(rebuttedByEvidence(P,E)).
constitutiveRule(x("c15-reg",0,0,1,(E,P,T,)),non(eventTime(P,E,T))) :- inst(x("c15-reg",0,0,1,(E,P,T,))).
body(x("c15-reg",0,0,1,(E,P,T,)),recordedInRegistration(P,E,T)) :- inst(x("c15-reg",0,0,1,(E,P,T,))).
body(x("c15-reg",0,0,1,(E,P,T,)),rebuttedByEvidence(P,E)) :- inst(x("c15-reg",0,0,1,(E,P,T,))).
superior(x("c15-reg",0,0,1,(E,P,T,)),r("c15-reg",0,0,(E,P,T,))) :- inst(x("c15-reg",0,0,1,(E,P,T,))).
exc(x("c15-reg",0,0,1,(E,P,T,)),r("c15-reg",0,0,(E,P,T,)),constitutiveRule,eventTime(P,E,T)) :- inst(x("c15-reg",0,0,1,(E,P,T,))).

% c15-proof[0.0] 有其他证据足以推翻以上记载时间的，以该证据证明的时间为准（第15条；npc）
inst(r("c15-proof",0,0,(E,P,T,))) :- cand(provenByOtherEvidence(P,E,T)).
constitutiveRule(r("c15-proof",0,0,(E,P,T,)),eventTime(P,E,T)) :- inst(r("c15-proof",0,0,(E,P,T,))).
mainHead(r("c15-proof",0,0,(E,P,T,)),constitutiveRule,eventTime(P,E,T)) :- inst(r("c15-proof",0,0,(E,P,T,))).
cand(eventTime(P,E,T)) :- inst(r("c15-proof",0,0,(E,P,T,))).
body(r("c15-proof",0,0,(E,P,T,)),provenByOtherEvidence(P,E,T)) :- inst(r("c15-proof",0,0,(E,P,T,))).
% c15-proof[0.1] 有其他证据足以推翻以上记载时间的，以该证据证明的时间为准（第15条；npc）
inst(r("c15-proof",0,1,(E,P,T,))) :- cand(provenByOtherEvidence(P,E,T)).
constitutiveRule(r("c15-proof",0,1,(E,P,T,)),rebuttedByEvidence(P,E)) :- inst(r("c15-proof",0,1,(E,P,T,))).
mainHead(r("c15-proof",0,1,(E,P,T,)),constitutiveRule,rebuttedByEvidence(P,E)) :- inst(r("c15-proof",0,1,(E,P,T,))).
cand(rebuttedByEvidence(P,E)) :- inst(r("c15-proof",0,1,(E,P,T,))).
body(r("c15-proof",0,1,(E,P,T,)),provenByOtherEvidence(P,E,T)) :- inst(r("c15-proof",0,1,(E,P,T,))).

% c16[0.0] 涉及遗产继承、接受赠与等胎儿利益保护的，胎儿视为具有民事权利能力（第16条；npc）
inst(r("c16",0,0,(F,))) :- cand(fetus(F)), cand(fetalInheritanceInterest(F)).
constitutiveRule(r("c16",0,0,(F,)),deemedLegalCapacity(F)) :- inst(r("c16",0,0,(F,))).
mainHead(r("c16",0,0,(F,)),constitutiveRule,deemedLegalCapacity(F)) :- inst(r("c16",0,0,(F,))).
cand(deemedLegalCapacity(F)) :- inst(r("c16",0,0,(F,))).
body(r("c16",0,0,(F,)),fetus(F)) :- inst(r("c16",0,0,(F,))).
body(r("c16",0,0,(F,)),fetalInheritanceInterest(F)) :- inst(r("c16",0,0,(F,))).
inst(x("c16",0,0,0,(F,))) :- inst(r("c16",0,0,(F,))), cand(stillborn(F)).
constitutiveRule(x("c16",0,0,0,(F,)),non(deemedLegalCapacity(F))) :- inst(x("c16",0,0,0,(F,))).
body(x("c16",0,0,0,(F,)),fetus(F)) :- inst(x("c16",0,0,0,(F,))).
body(x("c16",0,0,0,(F,)),fetalInheritanceInterest(F)) :- inst(x("c16",0,0,0,(F,))).
body(x("c16",0,0,0,(F,)),stillborn(F)) :- inst(x("c16",0,0,0,(F,))).
superior(x("c16",0,0,0,(F,)),r("c16",0,0,(F,))) :- inst(x("c16",0,0,0,(F,))).
exc(x("c16",0,0,0,(F,)),r("c16",0,0,(F,)),constitutiveRule,deemedLegalCapacity(F)) :- inst(x("c16",0,0,0,(F,))).
% c16[1.0] 涉及遗产继承、接受赠与等胎儿利益保护的，胎儿视为具有民事权利能力（第16条；npc）
inst(r("c16",1,0,(F,))) :- cand(fetus(F)), cand(fetalGiftInterest(F)).
constitutiveRule(r("c16",1,0,(F,)),deemedLegalCapacity(F)) :- inst(r("c16",1,0,(F,))).
mainHead(r("c16",1,0,(F,)),constitutiveRule,deemedLegalCapacity(F)) :- inst(r("c16",1,0,(F,))).
cand(deemedLegalCapacity(F)) :- inst(r("c16",1,0,(F,))).
body(r("c16",1,0,(F,)),fetus(F)) :- inst(r("c16",1,0,(F,))).
body(r("c16",1,0,(F,)),fetalGiftInterest(F)) :- inst(r("c16",1,0,(F,))).
inst(x("c16",1,0,0,(F,))) :- inst(r("c16",1,0,(F,))), cand(stillborn(F)).
constitutiveRule(x("c16",1,0,0,(F,)),non(deemedLegalCapacity(F))) :- inst(x("c16",1,0,0,(F,))).
body(x("c16",1,0,0,(F,)),fetus(F)) :- inst(x("c16",1,0,0,(F,))).
body(x("c16",1,0,0,(F,)),fetalGiftInterest(F)) :- inst(x("c16",1,0,0,(F,))).
body(x("c16",1,0,0,(F,)),stillborn(F)) :- inst(x("c16",1,0,0,(F,))).
superior(x("c16",1,0,0,(F,)),r("c16",1,0,(F,))) :- inst(x("c16",1,0,0,(F,))).
exc(x("c16",1,0,0,(F,)),r("c16",1,0,(F,)),constitutiveRule,deemedLegalCapacity(F)) :- inst(x("c16",1,0,0,(F,))).
% c16[2.0] 涉及遗产继承、接受赠与等胎儿利益保护的，胎儿视为具有民事权利能力（第16条；npc）
inst(r("c16",2,0,(F,))) :- cand(fetus(F)), cand(otherFetalInterest(F)).
constitutiveRule(r("c16",2,0,(F,)),deemedLegalCapacity(F)) :- inst(r("c16",2,0,(F,))).
mainHead(r("c16",2,0,(F,)),constitutiveRule,deemedLegalCapacity(F)) :- inst(r("c16",2,0,(F,))).
cand(deemedLegalCapacity(F)) :- inst(r("c16",2,0,(F,))).
body(r("c16",2,0,(F,)),fetus(F)) :- inst(r("c16",2,0,(F,))).
body(r("c16",2,0,(F,)),otherFetalInterest(F)) :- inst(r("c16",2,0,(F,))).
inst(x("c16",2,0,0,(F,))) :- inst(r("c16",2,0,(F,))), cand(stillborn(F)).
constitutiveRule(x("c16",2,0,0,(F,)),non(deemedLegalCapacity(F))) :- inst(x("c16",2,0,0,(F,))).
body(x("c16",2,0,0,(F,)),fetus(F)) :- inst(x("c16",2,0,0,(F,))).
body(x("c16",2,0,0,(F,)),otherFetalInterest(F)) :- inst(x("c16",2,0,0,(F,))).
body(x("c16",2,0,0,(F,)),stillborn(F)) :- inst(x("c16",2,0,0,(F,))).
superior(x("c16",2,0,0,(F,)),r("c16",2,0,(F,))) :- inst(x("c16",2,0,0,(F,))).
exc(x("c16",2,0,0,(F,)),r("c16",2,0,(F,)),constitutiveRule,deemedLegalCapacity(F)) :- inst(x("c16",2,0,0,(F,))).

% c16-still[0.0] 胎儿娩出时为死体的，其民事权利能力自始不存在（第16条；npc）
inst(r("c16-still",0,0,(F,))) :- cand(fetus(F)), cand(stillborn(F)).
constitutiveRule(r("c16-still",0,0,(F,)),non(deemedLegalCapacity(F))) :- inst(r("c16-still",0,0,(F,))).
mainHead(r("c16-still",0,0,(F,)),constitutiveRule,non(deemedLegalCapacity(F))) :- inst(r("c16-still",0,0,(F,))).
cand(deemedLegalCapacity(F)) :- inst(r("c16-still",0,0,(F,))).
body(r("c16-still",0,0,(F,)),fetus(F)) :- inst(r("c16-still",0,0,(F,))).
body(r("c16-still",0,0,(F,)),stillborn(F)) :- inst(r("c16-still",0,0,(F,))).

% c18-full[0.0] 成年人为完全民事行为能力人（第18条第1款；npc）
inst(r("c18-full",0,0,(P,))) :- cand(adult(P)).
constitutiveRule(r("c18-full",0,0,(P,)),fullCapacity(P)) :- inst(r("c18-full",0,0,(P,))).
mainHead(r("c18-full",0,0,(P,)),constitutiveRule,fullCapacity(P)) :- inst(r("c18-full",0,0,(P,))).
cand(fullCapacity(P)) :- inst(r("c18-full",0,0,(P,))).
body(r("c18-full",0,0,(P,)),adult(P)) :- inst(r("c18-full",0,0,(P,))).
inst(x("c18-full",0,0,0,(P,))) :- inst(r("c18-full",0,0,(P,))), cand(cannotDiscern(P)).
constitutiveRule(x("c18-full",0,0,0,(P,)),non(fullCapacity(P))) :- inst(x("c18-full",0,0,0,(P,))).
body(x("c18-full",0,0,0,(P,)),adult(P)) :- inst(x("c18-full",0,0,0,(P,))).
body(x("c18-full",0,0,0,(P,)),cannotDiscern(P)) :- inst(x("c18-full",0,0,0,(P,))).
superior(x("c18-full",0,0,0,(P,)),r("c18-full",0,0,(P,))) :- inst(x("c18-full",0,0,0,(P,))).
exc(x("c18-full",0,0,0,(P,)),r("c18-full",0,0,(P,)),constitutiveRule,fullCapacity(P)) :- inst(x("c18-full",0,0,0,(P,))).
inst(x("c18-full",0,0,1,(P,))) :- inst(r("c18-full",0,0,(P,))), cand(cannotFullyDiscern(P)).
constitutiveRule(x("c18-full",0,0,1,(P,)),non(fullCapacity(P))) :- inst(x("c18-full",0,0,1,(P,))).
body(x("c18-full",0,0,1,(P,)),adult(P)) :- inst(x("c18-full",0,0,1,(P,))).
body(x("c18-full",0,0,1,(P,)),cannotFullyDiscern(P)) :- inst(x("c18-full",0,0,1,(P,))).
superior(x("c18-full",0,0,1,(P,)),r("c18-full",0,0,(P,))) :- inst(x("c18-full",0,0,1,(P,))).
exc(x("c18-full",0,0,1,(P,)),r("c18-full",0,0,(P,)),constitutiveRule,fullCapacity(P)) :- inst(x("c18-full",0,0,1,(P,))).

% c18-emancipated[0.0] 十六周岁以上、以自己劳动收入为主要生活来源的未成年人，视为完全民事行为能力人（第18条第2款；npc）
inst(r("c18-emancipated",0,0,(P,))) :- cand(minor(P)), cand(age16plus(P)), cand(ownLabourIncomeMainSource(P)).
constitutiveRule(r("c18-emancipated",0,0,(P,)),fullCapacity(P)) :- inst(r("c18-emancipated",0,0,(P,))).
mainHead(r("c18-emancipated",0,0,(P,)),constitutiveRule,fullCapacity(P)) :- inst(r("c18-emancipated",0,0,(P,))).
cand(fullCapacity(P)) :- inst(r("c18-emancipated",0,0,(P,))).
body(r("c18-emancipated",0,0,(P,)),minor(P)) :- inst(r("c18-emancipated",0,0,(P,))).
body(r("c18-emancipated",0,0,(P,)),age16plus(P)) :- inst(r("c18-emancipated",0,0,(P,))).
body(r("c18-emancipated",0,0,(P,)),ownLabourIncomeMainSource(P)) :- inst(r("c18-emancipated",0,0,(P,))).
inst(x("c18-emancipated",0,0,0,(P,))) :- inst(r("c18-emancipated",0,0,(P,))), cand(cannotDiscern(P)).
constitutiveRule(x("c18-emancipated",0,0,0,(P,)),non(fullCapacity(P))) :- inst(x("c18-emancipated",0,0,0,(P,))).
body(x("c18-emancipated",0,0,0,(P,)),minor(P)) :- inst(x("c18-emancipated",0,0,0,(P,))).
body(x("c18-emancipated",0,0,0,(P,)),age16plus(P)) :- inst(x("c18-emancipated",0,0,0,(P,))).
body(x("c18-emancipated",0,0,0,(P,)),ownLabourIncomeMainSource(P)) :- inst(x("c18-emancipated",0,0,0,(P,))).
body(x("c18-emancipated",0,0,0,(P,)),cannotDiscern(P)) :- inst(x("c18-emancipated",0,0,0,(P,))).
superior(x("c18-emancipated",0,0,0,(P,)),r("c18-emancipated",0,0,(P,))) :- inst(x("c18-emancipated",0,0,0,(P,))).
exc(x("c18-emancipated",0,0,0,(P,)),r("c18-emancipated",0,0,(P,)),constitutiveRule,fullCapacity(P)) :- inst(x("c18-emancipated",0,0,0,(P,))).
inst(x("c18-emancipated",0,0,1,(P,))) :- inst(r("c18-emancipated",0,0,(P,))), cand(cannotFullyDiscern(P)).
constitutiveRule(x("c18-emancipated",0,0,1,(P,)),non(fullCapacity(P))) :- inst(x("c18-emancipated",0,0,1,(P,))).
body(x("c18-emancipated",0,0,1,(P,)),minor(P)) :- inst(x("c18-emancipated",0,0,1,(P,))).
body(x("c18-emancipated",0,0,1,(P,)),age16plus(P)) :- inst(x("c18-emancipated",0,0,1,(P,))).
body(x("c18-emancipated",0,0,1,(P,)),ownLabourIncomeMainSource(P)) :- inst(x("c18-emancipated",0,0,1,(P,))).
body(x("c18-emancipated",0,0,1,(P,)),cannotFullyDiscern(P)) :- inst(x("c18-emancipated",0,0,1,(P,))).
superior(x("c18-emancipated",0,0,1,(P,)),r("c18-emancipated",0,0,(P,))) :- inst(x("c18-emancipated",0,0,1,(P,))).
exc(x("c18-emancipated",0,0,1,(P,)),r("c18-emancipated",0,0,(P,)),constitutiveRule,fullCapacity(P)) :- inst(x("c18-emancipated",0,0,1,(P,))).
% c18-emancipated[0.1] 十六周岁以上、以自己劳动收入为主要生活来源的未成年人，视为完全民事行为能力人（第18条第2款；npc）
inst(r("c18-emancipated",0,1,(P,))) :- cand(minor(P)), cand(age16plus(P)), cand(ownLabourIncomeMainSource(P)).
constitutiveRule(r("c18-emancipated",0,1,(P,)),non(limitedCapacity(P))) :- inst(r("c18-emancipated",0,1,(P,))).
mainHead(r("c18-emancipated",0,1,(P,)),constitutiveRule,non(limitedCapacity(P))) :- inst(r("c18-emancipated",0,1,(P,))).
cand(limitedCapacity(P)) :- inst(r("c18-emancipated",0,1,(P,))).
body(r("c18-emancipated",0,1,(P,)),minor(P)) :- inst(r("c18-emancipated",0,1,(P,))).
body(r("c18-emancipated",0,1,(P,)),age16plus(P)) :- inst(r("c18-emancipated",0,1,(P,))).
body(r("c18-emancipated",0,1,(P,)),ownLabourIncomeMainSource(P)) :- inst(r("c18-emancipated",0,1,(P,))).
inst(x("c18-emancipated",0,1,0,(P,))) :- inst(r("c18-emancipated",0,1,(P,))), cand(cannotDiscern(P)).
constitutiveRule(x("c18-emancipated",0,1,0,(P,)),limitedCapacity(P)) :- inst(x("c18-emancipated",0,1,0,(P,))).
body(x("c18-emancipated",0,1,0,(P,)),minor(P)) :- inst(x("c18-emancipated",0,1,0,(P,))).
body(x("c18-emancipated",0,1,0,(P,)),age16plus(P)) :- inst(x("c18-emancipated",0,1,0,(P,))).
body(x("c18-emancipated",0,1,0,(P,)),ownLabourIncomeMainSource(P)) :- inst(x("c18-emancipated",0,1,0,(P,))).
body(x("c18-emancipated",0,1,0,(P,)),cannotDiscern(P)) :- inst(x("c18-emancipated",0,1,0,(P,))).
superior(x("c18-emancipated",0,1,0,(P,)),r("c18-emancipated",0,1,(P,))) :- inst(x("c18-emancipated",0,1,0,(P,))).
exc(x("c18-emancipated",0,1,0,(P,)),r("c18-emancipated",0,1,(P,)),constitutiveRule,non(limitedCapacity(P))) :- inst(x("c18-emancipated",0,1,0,(P,))).
inst(x("c18-emancipated",0,1,1,(P,))) :- inst(r("c18-emancipated",0,1,(P,))), cand(cannotFullyDiscern(P)).
constitutiveRule(x("c18-emancipated",0,1,1,(P,)),limitedCapacity(P)) :- inst(x("c18-emancipated",0,1,1,(P,))).
body(x("c18-emancipated",0,1,1,(P,)),minor(P)) :- inst(x("c18-emancipated",0,1,1,(P,))).
body(x("c18-emancipated",0,1,1,(P,)),age16plus(P)) :- inst(x("c18-emancipated",0,1,1,(P,))).
body(x("c18-emancipated",0,1,1,(P,)),ownLabourIncomeMainSource(P)) :- inst(x("c18-emancipated",0,1,1,(P,))).
body(x("c18-emancipated",0,1,1,(P,)),cannotFullyDiscern(P)) :- inst(x("c18-emancipated",0,1,1,(P,))).
superior(x("c18-emancipated",0,1,1,(P,)),r("c18-emancipated",0,1,(P,))) :- inst(x("c18-emancipated",0,1,1,(P,))).
exc(x("c18-emancipated",0,1,1,(P,)),r("c18-emancipated",0,1,(P,)),constitutiveRule,non(limitedCapacity(P))) :- inst(x("c18-emancipated",0,1,1,(P,))).

% c19[0.0] 八周岁以上的未成年人为限制民事行为能力人（第19条；npc）
inst(r("c19",0,0,(P,))) :- cand(minor(P)).
constitutiveRule(r("c19",0,0,(P,)),limitedCapacity(P)) :- inst(r("c19",0,0,(P,))).
mainHead(r("c19",0,0,(P,)),constitutiveRule,limitedCapacity(P)) :- inst(r("c19",0,0,(P,))).
cand(limitedCapacity(P)) :- inst(r("c19",0,0,(P,))).
body(r("c19",0,0,(P,)),minor(P)) :- inst(r("c19",0,0,(P,))).
inst(x("c19",0,0,0,(P,))) :- inst(r("c19",0,0,(P,))), cand(under8(P)).
constitutiveRule(x("c19",0,0,0,(P,)),non(limitedCapacity(P))) :- inst(x("c19",0,0,0,(P,))).
body(x("c19",0,0,0,(P,)),minor(P)) :- inst(x("c19",0,0,0,(P,))).
body(x("c19",0,0,0,(P,)),under8(P)) :- inst(x("c19",0,0,0,(P,))).
superior(x("c19",0,0,0,(P,)),r("c19",0,0,(P,))) :- inst(x("c19",0,0,0,(P,))).
exc(x("c19",0,0,0,(P,)),r("c19",0,0,(P,)),constitutiveRule,limitedCapacity(P)) :- inst(x("c19",0,0,0,(P,))).

% c20[0.0] 不满八周岁的未成年人为无民事行为能力人（第20条；npc）
inst(r("c20",0,0,(P,))) :- cand(minor(P)), cand(under8(P)).
constitutiveRule(r("c20",0,0,(P,)),noCapacity(P)) :- inst(r("c20",0,0,(P,))).
mainHead(r("c20",0,0,(P,)),constitutiveRule,noCapacity(P)) :- inst(r("c20",0,0,(P,))).
cand(noCapacity(P)) :- inst(r("c20",0,0,(P,))).
body(r("c20",0,0,(P,)),minor(P)) :- inst(r("c20",0,0,(P,))).
body(r("c20",0,0,(P,)),under8(P)) :- inst(r("c20",0,0,(P,))).

% c21-1[0.0] 不能辨认自己行为的成年人为无民事行为能力人（第21条第1款；npc）
inst(r("c21-1",0,0,(P,))) :- cand(adult(P)), cand(cannotDiscern(P)).
constitutiveRule(r("c21-1",0,0,(P,)),noCapacity(P)) :- inst(r("c21-1",0,0,(P,))).
mainHead(r("c21-1",0,0,(P,)),constitutiveRule,noCapacity(P)) :- inst(r("c21-1",0,0,(P,))).
cand(noCapacity(P)) :- inst(r("c21-1",0,0,(P,))).
body(r("c21-1",0,0,(P,)),adult(P)) :- inst(r("c21-1",0,0,(P,))).
body(r("c21-1",0,0,(P,)),cannotDiscern(P)) :- inst(r("c21-1",0,0,(P,))).

% c21-2[0.0] 八周岁以上的未成年人不能辨认自己行为的，为无民事行为能力人（优先于第19条）（第21条第2款；npc）
inst(r("c21-2",0,0,(P,))) :- cand(minor(P)), cand(cannotDiscern(P)).
constitutiveRule(r("c21-2",0,0,(P,)),noCapacity(P)) :- inst(r("c21-2",0,0,(P,))).
mainHead(r("c21-2",0,0,(P,)),constitutiveRule,noCapacity(P)) :- inst(r("c21-2",0,0,(P,))).
cand(noCapacity(P)) :- inst(r("c21-2",0,0,(P,))).
body(r("c21-2",0,0,(P,)),minor(P)) :- inst(r("c21-2",0,0,(P,))).
body(r("c21-2",0,0,(P,)),cannotDiscern(P)) :- inst(r("c21-2",0,0,(P,))).
% c21-2[0.1] 八周岁以上的未成年人不能辨认自己行为的，为无民事行为能力人（优先于第19条）（第21条第2款；npc）
inst(r("c21-2",0,1,(P,))) :- cand(minor(P)), cand(cannotDiscern(P)).
constitutiveRule(r("c21-2",0,1,(P,)),non(limitedCapacity(P))) :- inst(r("c21-2",0,1,(P,))).
mainHead(r("c21-2",0,1,(P,)),constitutiveRule,non(limitedCapacity(P))) :- inst(r("c21-2",0,1,(P,))).
cand(limitedCapacity(P)) :- inst(r("c21-2",0,1,(P,))).
body(r("c21-2",0,1,(P,)),minor(P)) :- inst(r("c21-2",0,1,(P,))).
body(r("c21-2",0,1,(P,)),cannotDiscern(P)) :- inst(r("c21-2",0,1,(P,))).

% c22[0.0] 不能完全辨认自己行为的成年人为限制民事行为能力人（第22条；npc）
inst(r("c22",0,0,(P,))) :- cand(adult(P)), cand(cannotFullyDiscern(P)).
constitutiveRule(r("c22",0,0,(P,)),limitedCapacity(P)) :- inst(r("c22",0,0,(P,))).
mainHead(r("c22",0,0,(P,)),constitutiveRule,limitedCapacity(P)) :- inst(r("c22",0,0,(P,))).
cand(limitedCapacity(P)) :- inst(r("c22",0,0,(P,))).
body(r("c22",0,0,(P,)),adult(P)) :- inst(r("c22",0,0,(P,))).
body(r("c22",0,0,(P,)),cannotFullyDiscern(P)) :- inst(r("c22",0,0,(P,))).
inst(x("c22",0,0,0,(P,))) :- inst(r("c22",0,0,(P,))), cand(cannotDiscern(P)).
constitutiveRule(x("c22",0,0,0,(P,)),non(limitedCapacity(P))) :- inst(x("c22",0,0,0,(P,))).
body(x("c22",0,0,0,(P,)),adult(P)) :- inst(x("c22",0,0,0,(P,))).
body(x("c22",0,0,0,(P,)),cannotFullyDiscern(P)) :- inst(x("c22",0,0,0,(P,))).
body(x("c22",0,0,0,(P,)),cannotDiscern(P)) :- inst(x("c22",0,0,0,(P,))).
superior(x("c22",0,0,0,(P,)),r("c22",0,0,(P,))) :- inst(x("c22",0,0,0,(P,))).
exc(x("c22",0,0,0,(P,)),r("c22",0,0,(P,)),constitutiveRule,limitedCapacity(P)) :- inst(x("c22",0,0,0,(P,))).

% c17-adult[0.0] 十八周岁以上的自然人为成年人（第17条；npc）
inst(r("c17-adult",0,0,(P,))) :- cand(naturalPerson(P)), cand(age18plus(P)).
constitutiveRule(r("c17-adult",0,0,(P,)),adult(P)) :- inst(r("c17-adult",0,0,(P,))).
mainHead(r("c17-adult",0,0,(P,)),constitutiveRule,adult(P)) :- inst(r("c17-adult",0,0,(P,))).
cand(adult(P)) :- inst(r("c17-adult",0,0,(P,))).
body(r("c17-adult",0,0,(P,)),naturalPerson(P)) :- inst(r("c17-adult",0,0,(P,))).
body(r("c17-adult",0,0,(P,)),age18plus(P)) :- inst(r("c17-adult",0,0,(P,))).

% c17-minor[0.0] 不满十八周岁的自然人为未成年人（第17条；npc）
inst(r("c17-minor",0,0,(P,))) :- cand(naturalPerson(P)), cand(under18(P)).
constitutiveRule(r("c17-minor",0,0,(P,)),minor(P)) :- inst(r("c17-minor",0,0,(P,))).
mainHead(r("c17-minor",0,0,(P,)),constitutiveRule,minor(P)) :- inst(r("c17-minor",0,0,(P,))).
cand(minor(P)) :- inst(r("c17-minor",0,0,(P,))).
body(r("c17-minor",0,0,(P,)),naturalPerson(P)) :- inst(r("c17-minor",0,0,(P,))).
body(r("c17-minor",0,0,(P,)),under18(P)) :- inst(r("c17-minor",0,0,(P,))).

% c18-act[0.0] 完全民事行为能力人可以独立实施民事法律行为（第18条第1款；npc）
inst(r("c18-act",0,0,(P,))) :- cand(fullCapacity(P)).
permissiveRule(r("c18-act",0,0,(P,)),actIndependently(P)) :- inst(r("c18-act",0,0,(P,))).
mainHead(r("c18-act",0,0,(P,)),permissiveRule,actIndependently(P)) :- inst(r("c18-act",0,0,(P,))).
cand(actIndependently(P)) :- inst(r("c18-act",0,0,(P,))).
body(r("c18-act",0,0,(P,)),fullCapacity(P)) :- inst(r("c18-act",0,0,(P,))).

% c19-rep[0.0] 限制民事行为能力人实施民事法律行为由法定代理人代理或者经其同意、追认（纯获利益与相适应的行为除外，见第145条）（第19条、第22条；npc
inst(r("c19-rep",0,0,(P,))) :- cand(limitedCapacity(P)).
constitutiveRule(r("c19-rep",0,0,(P,)),needsRepresentationOrConsent(P)) :- inst(r("c19-rep",0,0,(P,))).
mainHead(r("c19-rep",0,0,(P,)),constitutiveRule,needsRepresentationOrConsent(P)) :- inst(r("c19-rep",0,0,(P,))).
cand(needsRepresentationOrConsent(P)) :- inst(r("c19-rep",0,0,(P,))).
body(r("c19-rep",0,0,(P,)),limitedCapacity(P)) :- inst(r("c19-rep",0,0,(P,))).

% c20-rep[0.0] 无民事行为能力人由其法定代理人代理实施民事法律行为（第20条、第21条第1款；npc）
inst(r("c20-rep",0,0,(P,))) :- cand(noCapacity(P)).
constitutiveRule(r("c20-rep",0,0,(P,)),actsOnlyThroughRepresentative(P)) :- inst(r("c20-rep",0,0,(P,))).
mainHead(r("c20-rep",0,0,(P,)),constitutiveRule,actsOnlyThroughRepresentative(P)) :- inst(r("c20-rep",0,0,(P,))).
cand(actsOnlyThroughRepresentative(P)) :- inst(r("c20-rep",0,0,(P,))).
body(r("c20-rep",0,0,(P,)),noCapacity(P)) :- inst(r("c20-rep",0,0,(P,))).

% c23[0.0] 无民事行为能力人、限制民事行为能力人的监护人是其法定代理人（第23条；npc）
inst(r("c23",0,0,(G,P,))) :- cand(guardianOf(G,P)), cand(noCapacity(P)).
constitutiveRule(r("c23",0,0,(G,P,)),legalRepresentative(G,P)) :- inst(r("c23",0,0,(G,P,))).
mainHead(r("c23",0,0,(G,P,)),constitutiveRule,legalRepresentative(G,P)) :- inst(r("c23",0,0,(G,P,))).
cand(legalRepresentative(G,P)) :- inst(r("c23",0,0,(G,P,))).
body(r("c23",0,0,(G,P,)),guardianOf(G,P)) :- inst(r("c23",0,0,(G,P,))).
body(r("c23",0,0,(G,P,)),noCapacity(P)) :- inst(r("c23",0,0,(G,P,))).
% c23[1.0] 无民事行为能力人、限制民事行为能力人的监护人是其法定代理人（第23条；npc）
inst(r("c23",1,0,(G,P,))) :- cand(guardianOf(G,P)), cand(limitedCapacity(P)).
constitutiveRule(r("c23",1,0,(G,P,)),legalRepresentative(G,P)) :- inst(r("c23",1,0,(G,P,))).
mainHead(r("c23",1,0,(G,P,)),constitutiveRule,legalRepresentative(G,P)) :- inst(r("c23",1,0,(G,P,))).
cand(legalRepresentative(G,P)) :- inst(r("c23",1,0,(G,P,))).
body(r("c23",1,0,(G,P,)),guardianOf(G,P)) :- inst(r("c23",1,0,(G,P,))).
body(r("c23",1,0,(G,P,)),limitedCapacity(P)) :- inst(r("c23",1,0,(G,P,))).

% c24-1[0.0] 利害关系人或者有关组织可以申请认定成年人为无或限制民事行为能力人（第24条第1款；npc）
inst(r("c24-1",0,0,(A,P,))) :- cand(adult(P)), cand(cannotDiscern(P)), cand(interestedParty(A,P)).
permissiveRule(r("c24-1",0,0,(A,P,)),applyCapacityDeclaration(A,P)) :- inst(r("c24-1",0,0,(A,P,))).
mainHead(r("c24-1",0,0,(A,P,)),permissiveRule,applyCapacityDeclaration(A,P)) :- inst(r("c24-1",0,0,(A,P,))).
cand(applyCapacityDeclaration(A,P)) :- inst(r("c24-1",0,0,(A,P,))).
body(r("c24-1",0,0,(A,P,)),adult(P)) :- inst(r("c24-1",0,0,(A,P,))).
body(r("c24-1",0,0,(A,P,)),cannotDiscern(P)) :- inst(r("c24-1",0,0,(A,P,))).
body(r("c24-1",0,0,(A,P,)),interestedParty(A,P)) :- inst(r("c24-1",0,0,(A,P,))).
% c24-1[1.0] 利害关系人或者有关组织可以申请认定成年人为无或限制民事行为能力人（第24条第1款；npc）
inst(r("c24-1",1,0,(A,P,))) :- cand(adult(P)), cand(cannotDiscern(P)), cand(concernsPerson(A,P)), cand(relevantOrg(A)).
permissiveRule(r("c24-1",1,0,(A,P,)),applyCapacityDeclaration(A,P)) :- inst(r("c24-1",1,0,(A,P,))).
mainHead(r("c24-1",1,0,(A,P,)),permissiveRule,applyCapacityDeclaration(A,P)) :- inst(r("c24-1",1,0,(A,P,))).
cand(applyCapacityDeclaration(A,P)) :- inst(r("c24-1",1,0,(A,P,))).
body(r("c24-1",1,0,(A,P,)),adult(P)) :- inst(r("c24-1",1,0,(A,P,))).
body(r("c24-1",1,0,(A,P,)),cannotDiscern(P)) :- inst(r("c24-1",1,0,(A,P,))).
body(r("c24-1",1,0,(A,P,)),concernsPerson(A,P)) :- inst(r("c24-1",1,0,(A,P,))).
body(r("c24-1",1,0,(A,P,)),relevantOrg(A)) :- inst(r("c24-1",1,0,(A,P,))).
% c24-1[2.0] 利害关系人或者有关组织可以申请认定成年人为无或限制民事行为能力人（第24条第1款；npc）
inst(r("c24-1",2,0,(A,P,))) :- cand(adult(P)), cand(cannotFullyDiscern(P)), cand(interestedParty(A,P)).
permissiveRule(r("c24-1",2,0,(A,P,)),applyCapacityDeclaration(A,P)) :- inst(r("c24-1",2,0,(A,P,))).
mainHead(r("c24-1",2,0,(A,P,)),permissiveRule,applyCapacityDeclaration(A,P)) :- inst(r("c24-1",2,0,(A,P,))).
cand(applyCapacityDeclaration(A,P)) :- inst(r("c24-1",2,0,(A,P,))).
body(r("c24-1",2,0,(A,P,)),adult(P)) :- inst(r("c24-1",2,0,(A,P,))).
body(r("c24-1",2,0,(A,P,)),cannotFullyDiscern(P)) :- inst(r("c24-1",2,0,(A,P,))).
body(r("c24-1",2,0,(A,P,)),interestedParty(A,P)) :- inst(r("c24-1",2,0,(A,P,))).
% c24-1[3.0] 利害关系人或者有关组织可以申请认定成年人为无或限制民事行为能力人（第24条第1款；npc）
inst(r("c24-1",3,0,(A,P,))) :- cand(adult(P)), cand(cannotFullyDiscern(P)), cand(concernsPerson(A,P)), cand(relevantOrg(A)).
permissiveRule(r("c24-1",3,0,(A,P,)),applyCapacityDeclaration(A,P)) :- inst(r("c24-1",3,0,(A,P,))).
mainHead(r("c24-1",3,0,(A,P,)),permissiveRule,applyCapacityDeclaration(A,P)) :- inst(r("c24-1",3,0,(A,P,))).
cand(applyCapacityDeclaration(A,P)) :- inst(r("c24-1",3,0,(A,P,))).
body(r("c24-1",3,0,(A,P,)),adult(P)) :- inst(r("c24-1",3,0,(A,P,))).
body(r("c24-1",3,0,(A,P,)),cannotFullyDiscern(P)) :- inst(r("c24-1",3,0,(A,P,))).
body(r("c24-1",3,0,(A,P,)),concernsPerson(A,P)) :- inst(r("c24-1",3,0,(A,P,))).
body(r("c24-1",3,0,(A,P,)),relevantOrg(A)) :- inst(r("c24-1",3,0,(A,P,))).

% c24-2[0.0] 经本人、利害关系人或者有关组织申请，人民法院可以认定其恢复为限制或完全民事行为能力人（第24条第2款；npc）
inst(r("c24-2",0,0,(A,P,))) :- cand(declaredIncapable(P)), cand(capacityRecovered(P)), cand(appliedForRestoration(A,P)), cand(isSelf(A,P)).
permissiveRule(r("c24-2",0,0,(A,P,)),declareCapacityRestored(P)) :- inst(r("c24-2",0,0,(A,P,))).
mainHead(r("c24-2",0,0,(A,P,)),permissiveRule,declareCapacityRestored(P)) :- inst(r("c24-2",0,0,(A,P,))).
cand(declareCapacityRestored(P)) :- inst(r("c24-2",0,0,(A,P,))).
body(r("c24-2",0,0,(A,P,)),declaredIncapable(P)) :- inst(r("c24-2",0,0,(A,P,))).
body(r("c24-2",0,0,(A,P,)),capacityRecovered(P)) :- inst(r("c24-2",0,0,(A,P,))).
body(r("c24-2",0,0,(A,P,)),appliedForRestoration(A,P)) :- inst(r("c24-2",0,0,(A,P,))).
body(r("c24-2",0,0,(A,P,)),isSelf(A,P)) :- inst(r("c24-2",0,0,(A,P,))).
% c24-2[1.0] 经本人、利害关系人或者有关组织申请，人民法院可以认定其恢复为限制或完全民事行为能力人（第24条第2款；npc）
inst(r("c24-2",1,0,(A,P,))) :- cand(declaredIncapable(P)), cand(capacityRecovered(P)), cand(appliedForRestoration(A,P)), cand(interestedParty(A,P)).
permissiveRule(r("c24-2",1,0,(A,P,)),declareCapacityRestored(P)) :- inst(r("c24-2",1,0,(A,P,))).
mainHead(r("c24-2",1,0,(A,P,)),permissiveRule,declareCapacityRestored(P)) :- inst(r("c24-2",1,0,(A,P,))).
cand(declareCapacityRestored(P)) :- inst(r("c24-2",1,0,(A,P,))).
body(r("c24-2",1,0,(A,P,)),declaredIncapable(P)) :- inst(r("c24-2",1,0,(A,P,))).
body(r("c24-2",1,0,(A,P,)),capacityRecovered(P)) :- inst(r("c24-2",1,0,(A,P,))).
body(r("c24-2",1,0,(A,P,)),appliedForRestoration(A,P)) :- inst(r("c24-2",1,0,(A,P,))).
body(r("c24-2",1,0,(A,P,)),interestedParty(A,P)) :- inst(r("c24-2",1,0,(A,P,))).
% c24-2[2.0] 经本人、利害关系人或者有关组织申请，人民法院可以认定其恢复为限制或完全民事行为能力人（第24条第2款；npc）
inst(r("c24-2",2,0,(A,P,))) :- cand(declaredIncapable(P)), cand(capacityRecovered(P)), cand(appliedForRestoration(A,P)), cand(relevantOrg(A)).
permissiveRule(r("c24-2",2,0,(A,P,)),declareCapacityRestored(P)) :- inst(r("c24-2",2,0,(A,P,))).
mainHead(r("c24-2",2,0,(A,P,)),permissiveRule,declareCapacityRestored(P)) :- inst(r("c24-2",2,0,(A,P,))).
cand(declareCapacityRestored(P)) :- inst(r("c24-2",2,0,(A,P,))).
body(r("c24-2",2,0,(A,P,)),declaredIncapable(P)) :- inst(r("c24-2",2,0,(A,P,))).
body(r("c24-2",2,0,(A,P,)),capacityRecovered(P)) :- inst(r("c24-2",2,0,(A,P,))).
body(r("c24-2",2,0,(A,P,)),appliedForRestoration(A,P)) :- inst(r("c24-2",2,0,(A,P,))).
body(r("c24-2",2,0,(A,P,)),relevantOrg(A)) :- inst(r("c24-2",2,0,(A,P,))).

% c24-3[0.0] 有关组织包括居民委员会、村民委员会、学校、医疗机构、妇女联合会、残疾人联合会、依法设立的老年人组织、民政部门等（第24条第3款；npc）
inst(r("c24-3",0,0,(O,))) :- cand(residentsCommittee(O)).
constitutiveRule(r("c24-3",0,0,(O,)),relevantOrg(O)) :- inst(r("c24-3",0,0,(O,))).
mainHead(r("c24-3",0,0,(O,)),constitutiveRule,relevantOrg(O)) :- inst(r("c24-3",0,0,(O,))).
cand(relevantOrg(O)) :- inst(r("c24-3",0,0,(O,))).
body(r("c24-3",0,0,(O,)),residentsCommittee(O)) :- inst(r("c24-3",0,0,(O,))).
% c24-3[1.0] 有关组织包括居民委员会、村民委员会、学校、医疗机构、妇女联合会、残疾人联合会、依法设立的老年人组织、民政部门等（第24条第3款；npc）
inst(r("c24-3",1,0,(O,))) :- cand(villagersCommittee(O)).
constitutiveRule(r("c24-3",1,0,(O,)),relevantOrg(O)) :- inst(r("c24-3",1,0,(O,))).
mainHead(r("c24-3",1,0,(O,)),constitutiveRule,relevantOrg(O)) :- inst(r("c24-3",1,0,(O,))).
cand(relevantOrg(O)) :- inst(r("c24-3",1,0,(O,))).
body(r("c24-3",1,0,(O,)),villagersCommittee(O)) :- inst(r("c24-3",1,0,(O,))).
% c24-3[2.0] 有关组织包括居民委员会、村民委员会、学校、医疗机构、妇女联合会、残疾人联合会、依法设立的老年人组织、民政部门等（第24条第3款；npc）
inst(r("c24-3",2,0,(O,))) :- cand(school(O)).
constitutiveRule(r("c24-3",2,0,(O,)),relevantOrg(O)) :- inst(r("c24-3",2,0,(O,))).
mainHead(r("c24-3",2,0,(O,)),constitutiveRule,relevantOrg(O)) :- inst(r("c24-3",2,0,(O,))).
cand(relevantOrg(O)) :- inst(r("c24-3",2,0,(O,))).
body(r("c24-3",2,0,(O,)),school(O)) :- inst(r("c24-3",2,0,(O,))).
% c24-3[3.0] 有关组织包括居民委员会、村民委员会、学校、医疗机构、妇女联合会、残疾人联合会、依法设立的老年人组织、民政部门等（第24条第3款；npc）
inst(r("c24-3",3,0,(O,))) :- cand(medicalInstitution(O)).
constitutiveRule(r("c24-3",3,0,(O,)),relevantOrg(O)) :- inst(r("c24-3",3,0,(O,))).
mainHead(r("c24-3",3,0,(O,)),constitutiveRule,relevantOrg(O)) :- inst(r("c24-3",3,0,(O,))).
cand(relevantOrg(O)) :- inst(r("c24-3",3,0,(O,))).
body(r("c24-3",3,0,(O,)),medicalInstitution(O)) :- inst(r("c24-3",3,0,(O,))).
% c24-3[4.0] 有关组织包括居民委员会、村民委员会、学校、医疗机构、妇女联合会、残疾人联合会、依法设立的老年人组织、民政部门等（第24条第3款；npc）
inst(r("c24-3",4,0,(O,))) :- cand(womensFederation(O)).
constitutiveRule(r("c24-3",4,0,(O,)),relevantOrg(O)) :- inst(r("c24-3",4,0,(O,))).
mainHead(r("c24-3",4,0,(O,)),constitutiveRule,relevantOrg(O)) :- inst(r("c24-3",4,0,(O,))).
cand(relevantOrg(O)) :- inst(r("c24-3",4,0,(O,))).
body(r("c24-3",4,0,(O,)),womensFederation(O)) :- inst(r("c24-3",4,0,(O,))).
% c24-3[5.0] 有关组织包括居民委员会、村民委员会、学校、医疗机构、妇女联合会、残疾人联合会、依法设立的老年人组织、民政部门等（第24条第3款；npc）
inst(r("c24-3",5,0,(O,))) :- cand(disabledPersonsFederation(O)).
constitutiveRule(r("c24-3",5,0,(O,)),relevantOrg(O)) :- inst(r("c24-3",5,0,(O,))).
mainHead(r("c24-3",5,0,(O,)),constitutiveRule,relevantOrg(O)) :- inst(r("c24-3",5,0,(O,))).
cand(relevantOrg(O)) :- inst(r("c24-3",5,0,(O,))).
body(r("c24-3",5,0,(O,)),disabledPersonsFederation(O)) :- inst(r("c24-3",5,0,(O,))).
% c24-3[6.0] 有关组织包括居民委员会、村民委员会、学校、医疗机构、妇女联合会、残疾人联合会、依法设立的老年人组织、民政部门等（第24条第3款；npc）
inst(r("c24-3",6,0,(O,))) :- cand(elderlyOrganization(O)).
constitutiveRule(r("c24-3",6,0,(O,)),relevantOrg(O)) :- inst(r("c24-3",6,0,(O,))).
mainHead(r("c24-3",6,0,(O,)),constitutiveRule,relevantOrg(O)) :- inst(r("c24-3",6,0,(O,))).
cand(relevantOrg(O)) :- inst(r("c24-3",6,0,(O,))).
body(r("c24-3",6,0,(O,)),elderlyOrganization(O)) :- inst(r("c24-3",6,0,(O,))).
% c24-3[7.0] 有关组织包括居民委员会、村民委员会、学校、医疗机构、妇女联合会、残疾人联合会、依法设立的老年人组织、民政部门等（第24条第3款；npc）
inst(r("c24-3",7,0,(O,))) :- cand(civilAffairsDept(O)).
constitutiveRule(r("c24-3",7,0,(O,)),relevantOrg(O)) :- inst(r("c24-3",7,0,(O,))).
mainHead(r("c24-3",7,0,(O,)),constitutiveRule,relevantOrg(O)) :- inst(r("c24-3",7,0,(O,))).
cand(relevantOrg(O)) :- inst(r("c24-3",7,0,(O,))).
body(r("c24-3",7,0,(O,)),civilAffairsDept(O)) :- inst(r("c24-3",7,0,(O,))).

% c25-1[0.0] 自然人以户籍登记或者其他有效身份登记记载的居所为住所（第25条；npc）
inst(r("c25-1",0,0,(L,P,))) :- cand(registeredResidence(P,L)).
constitutiveRule(r("c25-1",0,0,(L,P,)),domicile(P,L)) :- inst(r("c25-1",0,0,(L,P,))).
mainHead(r("c25-1",0,0,(L,P,)),constitutiveRule,domicile(P,L)) :- inst(r("c25-1",0,0,(L,P,))).
cand(domicile(P,L)) :- inst(r("c25-1",0,0,(L,P,))).
body(r("c25-1",0,0,(L,P,)),registeredResidence(P,L)) :- inst(r("c25-1",0,0,(L,P,))).
inst(x("c25-1",0,0,0,(L,P,))) :- inst(r("c25-1",0,0,(L,P,))), cand(habitualResidenceDiffers(P)).
constitutiveRule(x("c25-1",0,0,0,(L,P,)),non(domicile(P,L))) :- inst(x("c25-1",0,0,0,(L,P,))).
body(x("c25-1",0,0,0,(L,P,)),registeredResidence(P,L)) :- inst(x("c25-1",0,0,0,(L,P,))).
body(x("c25-1",0,0,0,(L,P,)),habitualResidenceDiffers(P)) :- inst(x("c25-1",0,0,0,(L,P,))).
superior(x("c25-1",0,0,0,(L,P,)),r("c25-1",0,0,(L,P,))) :- inst(x("c25-1",0,0,0,(L,P,))).
exc(x("c25-1",0,0,0,(L,P,)),r("c25-1",0,0,(L,P,)),constitutiveRule,domicile(P,L)) :- inst(x("c25-1",0,0,0,(L,P,))).
% c25-1[1.0] 自然人以户籍登记或者其他有效身份登记记载的居所为住所（第25条；npc）
inst(r("c25-1",1,0,(L,P,))) :- cand(otherIdRecordResidence(P,L)).
constitutiveRule(r("c25-1",1,0,(L,P,)),domicile(P,L)) :- inst(r("c25-1",1,0,(L,P,))).
mainHead(r("c25-1",1,0,(L,P,)),constitutiveRule,domicile(P,L)) :- inst(r("c25-1",1,0,(L,P,))).
cand(domicile(P,L)) :- inst(r("c25-1",1,0,(L,P,))).
body(r("c25-1",1,0,(L,P,)),otherIdRecordResidence(P,L)) :- inst(r("c25-1",1,0,(L,P,))).
inst(x("c25-1",1,0,0,(L,P,))) :- inst(r("c25-1",1,0,(L,P,))), cand(habitualResidenceDiffers(P)).
constitutiveRule(x("c25-1",1,0,0,(L,P,)),non(domicile(P,L))) :- inst(x("c25-1",1,0,0,(L,P,))).
body(x("c25-1",1,0,0,(L,P,)),otherIdRecordResidence(P,L)) :- inst(x("c25-1",1,0,0,(L,P,))).
body(x("c25-1",1,0,0,(L,P,)),habitualResidenceDiffers(P)) :- inst(x("c25-1",1,0,0,(L,P,))).
superior(x("c25-1",1,0,0,(L,P,)),r("c25-1",1,0,(L,P,))) :- inst(x("c25-1",1,0,0,(L,P,))).
exc(x("c25-1",1,0,0,(L,P,)),r("c25-1",1,0,(L,P,)),constitutiveRule,domicile(P,L)) :- inst(x("c25-1",1,0,0,(L,P,))).

% c25-2[0.0] 经常居所与住所不一致的，经常居所视为住所（第25条；npc）
inst(r("c25-2",0,0,(L,P,))) :- cand(habitualResidence(P,L)), cand(habitualResidenceDiffers(P)).
constitutiveRule(r("c25-2",0,0,(L,P,)),domicile(P,L)) :- inst(r("c25-2",0,0,(L,P,))).
mainHead(r("c25-2",0,0,(L,P,)),constitutiveRule,domicile(P,L)) :- inst(r("c25-2",0,0,(L,P,))).
cand(domicile(P,L)) :- inst(r("c25-2",0,0,(L,P,))).
body(r("c25-2",0,0,(L,P,)),habitualResidence(P,L)) :- inst(r("c25-2",0,0,(L,P,))).
body(r("c25-2",0,0,(L,P,)),habitualResidenceDiffers(P)) :- inst(r("c25-2",0,0,(L,P,))).

% c26-1[0.0] 父母对未成年子女负有抚养、教育和保护的义务（第26条第1款；npc）
inst(r("c26-1",0,0,(C,Pa,))) :- cand(parentOf(Pa,C)), cand(minor(C)).
prescriptiveRule(r("c26-1",0,0,(C,Pa,)),raiseEducateProtect(Pa,C)) :- inst(r("c26-1",0,0,(C,Pa,))).
mainHead(r("c26-1",0,0,(C,Pa,)),prescriptiveRule,raiseEducateProtect(Pa,C)) :- inst(r("c26-1",0,0,(C,Pa,))).
cand(raiseEducateProtect(Pa,C)) :- inst(r("c26-1",0,0,(C,Pa,))).
body(r("c26-1",0,0,(C,Pa,)),parentOf(Pa,C)) :- inst(r("c26-1",0,0,(C,Pa,))).
body(r("c26-1",0,0,(C,Pa,)),minor(C)) :- inst(r("c26-1",0,0,(C,Pa,))).

% c26-2[0.0] 成年子女对父母负有赡养、扶助和保护的义务（第26条第2款；npc）
inst(r("c26-2",0,0,(C,Pa,))) :- cand(childOf(C,Pa)), cand(adult(C)).
prescriptiveRule(r("c26-2",0,0,(C,Pa,)),supportAssistProtect(C,Pa)) :- inst(r("c26-2",0,0,(C,Pa,))).
mainHead(r("c26-2",0,0,(C,Pa,)),prescriptiveRule,supportAssistProtect(C,Pa)) :- inst(r("c26-2",0,0,(C,Pa,))).
cand(supportAssistProtect(C,Pa)) :- inst(r("c26-2",0,0,(C,Pa,))).
body(r("c26-2",0,0,(C,Pa,)),childOf(C,Pa)) :- inst(r("c26-2",0,0,(C,Pa,))).
body(r("c26-2",0,0,(C,Pa,)),adult(C)) :- inst(r("c26-2",0,0,(C,Pa,))).

% c-ward-minor[0.0] 未成年人需要监护（视为完全民事行为能力人的除外，参照第39条第1项）（第27条第1款、第39条；doctrine）
inst(r("c-ward-minor",0,0,(C,))) :- cand(minor(C)).
constitutiveRule(r("c-ward-minor",0,0,(C,)),needsGuardian(C)) :- inst(r("c-ward-minor",0,0,(C,))).
mainHead(r("c-ward-minor",0,0,(C,)),constitutiveRule,needsGuardian(C)) :- inst(r("c-ward-minor",0,0,(C,))).
cand(needsGuardian(C)) :- inst(r("c-ward-minor",0,0,(C,))).
body(r("c-ward-minor",0,0,(C,)),minor(C)) :- inst(r("c-ward-minor",0,0,(C,))).
inst(x("c-ward-minor",0,0,0,(C,))) :- inst(r("c-ward-minor",0,0,(C,))), cand(fullCapacity(C)).
constitutiveRule(x("c-ward-minor",0,0,0,(C,)),non(needsGuardian(C))) :- inst(x("c-ward-minor",0,0,0,(C,))).
body(x("c-ward-minor",0,0,0,(C,)),minor(C)) :- inst(x("c-ward-minor",0,0,0,(C,))).
body(x("c-ward-minor",0,0,0,(C,)),fullCapacity(C)) :- inst(x("c-ward-minor",0,0,0,(C,))).
superior(x("c-ward-minor",0,0,0,(C,)),r("c-ward-minor",0,0,(C,))) :- inst(x("c-ward-minor",0,0,0,(C,))).
exc(x("c-ward-minor",0,0,0,(C,)),r("c-ward-minor",0,0,(C,)),constitutiveRule,needsGuardian(C)) :- inst(x("c-ward-minor",0,0,0,(C,))).

% c27-parent-flag[0.0] 父母担任监护人（辅助）（第27条第2款；npc）
inst(r("c27-parent-flag",0,0,(C,Pa,))) :- cand(parentOf(Pa,C)), cand(guardianOf(Pa,C)).
constitutiveRule(r("c27-parent-flag",0,0,(C,Pa,)),hasParentGuardian(C)) :- inst(r("c27-parent-flag",0,0,(C,Pa,))).
mainHead(r("c27-parent-flag",0,0,(C,Pa,)),constitutiveRule,hasParentGuardian(C)) :- inst(r("c27-parent-flag",0,0,(C,Pa,))).
cand(hasParentGuardian(C)) :- inst(r("c27-parent-flag",0,0,(C,Pa,))).
body(r("c27-parent-flag",0,0,(C,Pa,)),parentOf(Pa,C)) :- inst(r("c27-parent-flag",0,0,(C,Pa,))).
body(r("c27-parent-flag",0,0,(C,Pa,)),guardianOf(Pa,C)) :- inst(r("c27-parent-flag",0,0,(C,Pa,))).

% c-able[0.0] “有监护能力”：完全民事行为能力人，且无身体健康、经济条件等方面的不适宜情形（总则编解释第6条）（第27条第2款、第28条；spc）
inst(r("c-able",0,0,(G,))) :- cand(fullCapacity(G)).
constitutiveRule(r("c-able",0,0,(G,)),ableGuardian(G)) :- inst(r("c-able",0,0,(G,))).
mainHead(r("c-able",0,0,(G,)),constitutiveRule,ableGuardian(G)) :- inst(r("c-able",0,0,(G,))).
cand(ableGuardian(G)) :- inst(r("c-able",0,0,(G,))).
body(r("c-able",0,0,(G,)),fullCapacity(G)) :- inst(r("c-able",0,0,(G,))).
inst(x("c-able",0,0,0,(G,))) :- inst(r("c-able",0,0,(G,))), cand(unfitForGuardianship(G)).
constitutiveRule(x("c-able",0,0,0,(G,)),non(ableGuardian(G))) :- inst(x("c-able",0,0,0,(G,))).
body(x("c-able",0,0,0,(G,)),fullCapacity(G)) :- inst(x("c-able",0,0,0,(G,))).
body(x("c-able",0,0,0,(G,)),unfitForGuardianship(G)) :- inst(x("c-able",0,0,0,(G,))).
superior(x("c-able",0,0,0,(G,)),r("c-able",0,0,(G,))) :- inst(x("c-able",0,0,0,(G,))).
exc(x("c-able",0,0,0,(G,)),r("c-able",0,0,(G,)),constitutiveRule,ableGuardian(G)) :- inst(x("c-able",0,0,0,(G,))).

% c-eligible[0.0] “依法具有监护资格的人”：第27、28条所列有监护能力的亲属（第27条第2款、第28条；doctrine）
inst(r("c-eligible",0,0,(C,G,))) :- cand(grandparentOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c-eligible",0,0,(C,G,)),eligibleGuardian(G,C)) :- inst(r("c-eligible",0,0,(C,G,))).
mainHead(r("c-eligible",0,0,(C,G,)),constitutiveRule,eligibleGuardian(G,C)) :- inst(r("c-eligible",0,0,(C,G,))).
cand(eligibleGuardian(G,C)) :- inst(r("c-eligible",0,0,(C,G,))).
body(r("c-eligible",0,0,(C,G,)),grandparentOf(G,C)) :- inst(r("c-eligible",0,0,(C,G,))).
body(r("c-eligible",0,0,(C,G,)),ableGuardian(G)) :- inst(r("c-eligible",0,0,(C,G,))).
% c-eligible[1.0] “依法具有监护资格的人”：第27、28条所列有监护能力的亲属（第27条第2款、第28条；doctrine）
inst(r("c-eligible",1,0,(C,G,))) :- cand(olderSiblingOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c-eligible",1,0,(C,G,)),eligibleGuardian(G,C)) :- inst(r("c-eligible",1,0,(C,G,))).
mainHead(r("c-eligible",1,0,(C,G,)),constitutiveRule,eligibleGuardian(G,C)) :- inst(r("c-eligible",1,0,(C,G,))).
cand(eligibleGuardian(G,C)) :- inst(r("c-eligible",1,0,(C,G,))).
body(r("c-eligible",1,0,(C,G,)),olderSiblingOf(G,C)) :- inst(r("c-eligible",1,0,(C,G,))).
body(r("c-eligible",1,0,(C,G,)),ableGuardian(G)) :- inst(r("c-eligible",1,0,(C,G,))).
% c-eligible[2.0] “依法具有监护资格的人”：第27、28条所列有监护能力的亲属（第27条第2款、第28条；doctrine）
inst(r("c-eligible",2,0,(C,G,))) :- cand(spouseOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c-eligible",2,0,(C,G,)),eligibleGuardian(G,C)) :- inst(r("c-eligible",2,0,(C,G,))).
mainHead(r("c-eligible",2,0,(C,G,)),constitutiveRule,eligibleGuardian(G,C)) :- inst(r("c-eligible",2,0,(C,G,))).
cand(eligibleGuardian(G,C)) :- inst(r("c-eligible",2,0,(C,G,))).
body(r("c-eligible",2,0,(C,G,)),spouseOf(G,C)) :- inst(r("c-eligible",2,0,(C,G,))).
body(r("c-eligible",2,0,(C,G,)),ableGuardian(G)) :- inst(r("c-eligible",2,0,(C,G,))).
% c-eligible[3.0] “依法具有监护资格的人”：第27、28条所列有监护能力的亲属（第27条第2款、第28条；doctrine）
inst(r("c-eligible",3,0,(C,G,))) :- cand(parentOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c-eligible",3,0,(C,G,)),eligibleGuardian(G,C)) :- inst(r("c-eligible",3,0,(C,G,))).
mainHead(r("c-eligible",3,0,(C,G,)),constitutiveRule,eligibleGuardian(G,C)) :- inst(r("c-eligible",3,0,(C,G,))).
cand(eligibleGuardian(G,C)) :- inst(r("c-eligible",3,0,(C,G,))).
body(r("c-eligible",3,0,(C,G,)),parentOf(G,C)) :- inst(r("c-eligible",3,0,(C,G,))).
body(r("c-eligible",3,0,(C,G,)),ableGuardian(G)) :- inst(r("c-eligible",3,0,(C,G,))).
% c-eligible[4.0] “依法具有监护资格的人”：第27、28条所列有监护能力的亲属（第27条第2款、第28条；doctrine）
inst(r("c-eligible",4,0,(C,G,))) :- cand(childOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c-eligible",4,0,(C,G,)),eligibleGuardian(G,C)) :- inst(r("c-eligible",4,0,(C,G,))).
mainHead(r("c-eligible",4,0,(C,G,)),constitutiveRule,eligibleGuardian(G,C)) :- inst(r("c-eligible",4,0,(C,G,))).
cand(eligibleGuardian(G,C)) :- inst(r("c-eligible",4,0,(C,G,))).
body(r("c-eligible",4,0,(C,G,)),childOf(G,C)) :- inst(r("c-eligible",4,0,(C,G,))).
body(r("c-eligible",4,0,(C,G,)),ableGuardian(G)) :- inst(r("c-eligible",4,0,(C,G,))).
% c-eligible[5.0] “依法具有监护资格的人”：第27、28条所列有监护能力的亲属（第27条第2款、第28条；doctrine）
inst(r("c-eligible",5,0,(C,G,))) :- cand(closeRelativeOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c-eligible",5,0,(C,G,)),eligibleGuardian(G,C)) :- inst(r("c-eligible",5,0,(C,G,))).
mainHead(r("c-eligible",5,0,(C,G,)),constitutiveRule,eligibleGuardian(G,C)) :- inst(r("c-eligible",5,0,(C,G,))).
cand(eligibleGuardian(G,C)) :- inst(r("c-eligible",5,0,(C,G,))).
body(r("c-eligible",5,0,(C,G,)),closeRelativeOf(G,C)) :- inst(r("c-eligible",5,0,(C,G,))).
body(r("c-eligible",5,0,(C,G,)),ableGuardian(G)) :- inst(r("c-eligible",5,0,(C,G,))).

% c27-1[0.0] 父母是未成年子女的监护人（第27条第1款；npc）
inst(r("c27-1",0,0,(C,Pa,))) :- cand(parentOf(Pa,C)), cand(minor(C)).
constitutiveRule(r("c27-1",0,0,(C,Pa,)),guardianOf(Pa,C)) :- inst(r("c27-1",0,0,(C,Pa,))).
mainHead(r("c27-1",0,0,(C,Pa,)),constitutiveRule,guardianOf(Pa,C)) :- inst(r("c27-1",0,0,(C,Pa,))).
cand(guardianOf(Pa,C)) :- inst(r("c27-1",0,0,(C,Pa,))).
body(r("c27-1",0,0,(C,Pa,)),parentOf(Pa,C)) :- inst(r("c27-1",0,0,(C,Pa,))).
body(r("c27-1",0,0,(C,Pa,)),minor(C)) :- inst(r("c27-1",0,0,(C,Pa,))).
inst(x("c27-1",0,0,0,(C,Pa,))) :- inst(r("c27-1",0,0,(C,Pa,))), cand(deceased(Pa)).
constitutiveRule(x("c27-1",0,0,0,(C,Pa,)),non(guardianOf(Pa,C))) :- inst(x("c27-1",0,0,0,(C,Pa,))).
body(x("c27-1",0,0,0,(C,Pa,)),parentOf(Pa,C)) :- inst(x("c27-1",0,0,0,(C,Pa,))).
body(x("c27-1",0,0,0,(C,Pa,)),minor(C)) :- inst(x("c27-1",0,0,0,(C,Pa,))).
body(x("c27-1",0,0,0,(C,Pa,)),deceased(Pa)) :- inst(x("c27-1",0,0,0,(C,Pa,))).
superior(x("c27-1",0,0,0,(C,Pa,)),r("c27-1",0,0,(C,Pa,))) :- inst(x("c27-1",0,0,0,(C,Pa,))).
exc(x("c27-1",0,0,0,(C,Pa,)),r("c27-1",0,0,(C,Pa,)),constitutiveRule,guardianOf(Pa,C)) :- inst(x("c27-1",0,0,0,(C,Pa,))).
inst(x("c27-1",0,0,1,(C,Pa,))) :- inst(r("c27-1",0,0,(C,Pa,))), cand(lacksGuardianCapacity(Pa)).
constitutiveRule(x("c27-1",0,0,1,(C,Pa,)),non(guardianOf(Pa,C))) :- inst(x("c27-1",0,0,1,(C,Pa,))).
body(x("c27-1",0,0,1,(C,Pa,)),parentOf(Pa,C)) :- inst(x("c27-1",0,0,1,(C,Pa,))).
body(x("c27-1",0,0,1,(C,Pa,)),minor(C)) :- inst(x("c27-1",0,0,1,(C,Pa,))).
body(x("c27-1",0,0,1,(C,Pa,)),lacksGuardianCapacity(Pa)) :- inst(x("c27-1",0,0,1,(C,Pa,))).
superior(x("c27-1",0,0,1,(C,Pa,)),r("c27-1",0,0,(C,Pa,))) :- inst(x("c27-1",0,0,1,(C,Pa,))).
exc(x("c27-1",0,0,1,(C,Pa,)),r("c27-1",0,0,(C,Pa,)),constitutiveRule,guardianOf(Pa,C)) :- inst(x("c27-1",0,0,1,(C,Pa,))).

% c27-2-1[0.0] 父母已经死亡或者没有监护能力的，由有监护能力的祖父母、外祖父母担任监护人（第一顺序）（第27条第2款；npc）
inst(r("c27-2-1",0,0,(C,G,))) :- cand(minor(C)), cand(grandparentOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c27-2-1",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c27-2-1",0,0,(C,G,))).
mainHead(r("c27-2-1",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c27-2-1",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c27-2-1",0,0,(C,G,))).
body(r("c27-2-1",0,0,(C,G,)),minor(C)) :- inst(r("c27-2-1",0,0,(C,G,))).
body(r("c27-2-1",0,0,(C,G,)),grandparentOf(G,C)) :- inst(r("c27-2-1",0,0,(C,G,))).
body(r("c27-2-1",0,0,(C,G,)),ableGuardian(G)) :- inst(r("c27-2-1",0,0,(C,G,))).
inst(x("c27-2-1",0,0,0,(C,G,))) :- inst(r("c27-2-1",0,0,(C,G,))), cand(hasParentGuardian(C)).
constitutiveRule(x("c27-2-1",0,0,0,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-1",0,0,0,(C,G,))).
body(x("c27-2-1",0,0,0,(C,G,)),minor(C)) :- inst(x("c27-2-1",0,0,0,(C,G,))).
body(x("c27-2-1",0,0,0,(C,G,)),grandparentOf(G,C)) :- inst(x("c27-2-1",0,0,0,(C,G,))).
body(x("c27-2-1",0,0,0,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-1",0,0,0,(C,G,))).
body(x("c27-2-1",0,0,0,(C,G,)),hasParentGuardian(C)) :- inst(x("c27-2-1",0,0,0,(C,G,))).
superior(x("c27-2-1",0,0,0,(C,G,)),r("c27-2-1",0,0,(C,G,))) :- inst(x("c27-2-1",0,0,0,(C,G,))).
exc(x("c27-2-1",0,0,0,(C,G,)),r("c27-2-1",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-1",0,0,0,(C,G,))).
inst(x("c27-2-1",0,0,1,(C,G,))) :- inst(r("c27-2-1",0,0,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c27-2-1",0,0,1,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-1",0,0,1,(C,G,))).
body(x("c27-2-1",0,0,1,(C,G,)),minor(C)) :- inst(x("c27-2-1",0,0,1,(C,G,))).
body(x("c27-2-1",0,0,1,(C,G,)),grandparentOf(G,C)) :- inst(x("c27-2-1",0,0,1,(C,G,))).
body(x("c27-2-1",0,0,1,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-1",0,0,1,(C,G,))).
body(x("c27-2-1",0,0,1,(C,G,)),specialGuardianSet(C)) :- inst(x("c27-2-1",0,0,1,(C,G,))).
superior(x("c27-2-1",0,0,1,(C,G,)),r("c27-2-1",0,0,(C,G,))) :- inst(x("c27-2-1",0,0,1,(C,G,))).
exc(x("c27-2-1",0,0,1,(C,G,)),r("c27-2-1",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-1",0,0,1,(C,G,))).
% c27-2-1[0.1] 父母已经死亡或者没有监护能力的，由有监护能力的祖父母、外祖父母担任监护人（第一顺序）（第27条第2款；npc）
inst(r("c27-2-1",0,1,(C,G,))) :- cand(minor(C)), cand(grandparentOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c27-2-1",0,1,(C,G,)),minorOrder1Available(C)) :- inst(r("c27-2-1",0,1,(C,G,))).
mainHead(r("c27-2-1",0,1,(C,G,)),constitutiveRule,minorOrder1Available(C)) :- inst(r("c27-2-1",0,1,(C,G,))).
cand(minorOrder1Available(C)) :- inst(r("c27-2-1",0,1,(C,G,))).
body(r("c27-2-1",0,1,(C,G,)),minor(C)) :- inst(r("c27-2-1",0,1,(C,G,))).
body(r("c27-2-1",0,1,(C,G,)),grandparentOf(G,C)) :- inst(r("c27-2-1",0,1,(C,G,))).
body(r("c27-2-1",0,1,(C,G,)),ableGuardian(G)) :- inst(r("c27-2-1",0,1,(C,G,))).
inst(x("c27-2-1",0,1,0,(C,G,))) :- inst(r("c27-2-1",0,1,(C,G,))), cand(hasParentGuardian(C)).
constitutiveRule(x("c27-2-1",0,1,0,(C,G,)),non(minorOrder1Available(C))) :- inst(x("c27-2-1",0,1,0,(C,G,))).
body(x("c27-2-1",0,1,0,(C,G,)),minor(C)) :- inst(x("c27-2-1",0,1,0,(C,G,))).
body(x("c27-2-1",0,1,0,(C,G,)),grandparentOf(G,C)) :- inst(x("c27-2-1",0,1,0,(C,G,))).
body(x("c27-2-1",0,1,0,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-1",0,1,0,(C,G,))).
body(x("c27-2-1",0,1,0,(C,G,)),hasParentGuardian(C)) :- inst(x("c27-2-1",0,1,0,(C,G,))).
superior(x("c27-2-1",0,1,0,(C,G,)),r("c27-2-1",0,1,(C,G,))) :- inst(x("c27-2-1",0,1,0,(C,G,))).
exc(x("c27-2-1",0,1,0,(C,G,)),r("c27-2-1",0,1,(C,G,)),constitutiveRule,minorOrder1Available(C)) :- inst(x("c27-2-1",0,1,0,(C,G,))).
inst(x("c27-2-1",0,1,1,(C,G,))) :- inst(r("c27-2-1",0,1,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c27-2-1",0,1,1,(C,G,)),non(minorOrder1Available(C))) :- inst(x("c27-2-1",0,1,1,(C,G,))).
body(x("c27-2-1",0,1,1,(C,G,)),minor(C)) :- inst(x("c27-2-1",0,1,1,(C,G,))).
body(x("c27-2-1",0,1,1,(C,G,)),grandparentOf(G,C)) :- inst(x("c27-2-1",0,1,1,(C,G,))).
body(x("c27-2-1",0,1,1,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-1",0,1,1,(C,G,))).
body(x("c27-2-1",0,1,1,(C,G,)),specialGuardianSet(C)) :- inst(x("c27-2-1",0,1,1,(C,G,))).
superior(x("c27-2-1",0,1,1,(C,G,)),r("c27-2-1",0,1,(C,G,))) :- inst(x("c27-2-1",0,1,1,(C,G,))).
exc(x("c27-2-1",0,1,1,(C,G,)),r("c27-2-1",0,1,(C,G,)),constitutiveRule,minorOrder1Available(C)) :- inst(x("c27-2-1",0,1,1,(C,G,))).

% c27-2-2[0.0] 没有第一顺序的，由兄、姐担任（第二顺序）（第27条第2款；npc）
inst(r("c27-2-2",0,0,(C,G,))) :- cand(minor(C)), cand(olderSiblingOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c27-2-2",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c27-2-2",0,0,(C,G,))).
mainHead(r("c27-2-2",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c27-2-2",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c27-2-2",0,0,(C,G,))).
body(r("c27-2-2",0,0,(C,G,)),minor(C)) :- inst(r("c27-2-2",0,0,(C,G,))).
body(r("c27-2-2",0,0,(C,G,)),olderSiblingOf(G,C)) :- inst(r("c27-2-2",0,0,(C,G,))).
body(r("c27-2-2",0,0,(C,G,)),ableGuardian(G)) :- inst(r("c27-2-2",0,0,(C,G,))).
inst(x("c27-2-2",0,0,0,(C,G,))) :- inst(r("c27-2-2",0,0,(C,G,))), cand(hasParentGuardian(C)).
constitutiveRule(x("c27-2-2",0,0,0,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-2",0,0,0,(C,G,))).
body(x("c27-2-2",0,0,0,(C,G,)),minor(C)) :- inst(x("c27-2-2",0,0,0,(C,G,))).
body(x("c27-2-2",0,0,0,(C,G,)),olderSiblingOf(G,C)) :- inst(x("c27-2-2",0,0,0,(C,G,))).
body(x("c27-2-2",0,0,0,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-2",0,0,0,(C,G,))).
body(x("c27-2-2",0,0,0,(C,G,)),hasParentGuardian(C)) :- inst(x("c27-2-2",0,0,0,(C,G,))).
superior(x("c27-2-2",0,0,0,(C,G,)),r("c27-2-2",0,0,(C,G,))) :- inst(x("c27-2-2",0,0,0,(C,G,))).
exc(x("c27-2-2",0,0,0,(C,G,)),r("c27-2-2",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-2",0,0,0,(C,G,))).
inst(x("c27-2-2",0,0,1,(C,G,))) :- inst(r("c27-2-2",0,0,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c27-2-2",0,0,1,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-2",0,0,1,(C,G,))).
body(x("c27-2-2",0,0,1,(C,G,)),minor(C)) :- inst(x("c27-2-2",0,0,1,(C,G,))).
body(x("c27-2-2",0,0,1,(C,G,)),olderSiblingOf(G,C)) :- inst(x("c27-2-2",0,0,1,(C,G,))).
body(x("c27-2-2",0,0,1,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-2",0,0,1,(C,G,))).
body(x("c27-2-2",0,0,1,(C,G,)),specialGuardianSet(C)) :- inst(x("c27-2-2",0,0,1,(C,G,))).
superior(x("c27-2-2",0,0,1,(C,G,)),r("c27-2-2",0,0,(C,G,))) :- inst(x("c27-2-2",0,0,1,(C,G,))).
exc(x("c27-2-2",0,0,1,(C,G,)),r("c27-2-2",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-2",0,0,1,(C,G,))).
inst(x("c27-2-2",0,0,2,(C,G,))) :- inst(r("c27-2-2",0,0,(C,G,))), cand(minorOrder1Available(C)).
constitutiveRule(x("c27-2-2",0,0,2,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-2",0,0,2,(C,G,))).
body(x("c27-2-2",0,0,2,(C,G,)),minor(C)) :- inst(x("c27-2-2",0,0,2,(C,G,))).
body(x("c27-2-2",0,0,2,(C,G,)),olderSiblingOf(G,C)) :- inst(x("c27-2-2",0,0,2,(C,G,))).
body(x("c27-2-2",0,0,2,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-2",0,0,2,(C,G,))).
body(x("c27-2-2",0,0,2,(C,G,)),minorOrder1Available(C)) :- inst(x("c27-2-2",0,0,2,(C,G,))).
superior(x("c27-2-2",0,0,2,(C,G,)),r("c27-2-2",0,0,(C,G,))) :- inst(x("c27-2-2",0,0,2,(C,G,))).
exc(x("c27-2-2",0,0,2,(C,G,)),r("c27-2-2",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-2",0,0,2,(C,G,))).
% c27-2-2[0.1] 没有第一顺序的，由兄、姐担任（第二顺序）（第27条第2款；npc）
inst(r("c27-2-2",0,1,(C,G,))) :- cand(minor(C)), cand(olderSiblingOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c27-2-2",0,1,(C,G,)),minorOrder2Available(C)) :- inst(r("c27-2-2",0,1,(C,G,))).
mainHead(r("c27-2-2",0,1,(C,G,)),constitutiveRule,minorOrder2Available(C)) :- inst(r("c27-2-2",0,1,(C,G,))).
cand(minorOrder2Available(C)) :- inst(r("c27-2-2",0,1,(C,G,))).
body(r("c27-2-2",0,1,(C,G,)),minor(C)) :- inst(r("c27-2-2",0,1,(C,G,))).
body(r("c27-2-2",0,1,(C,G,)),olderSiblingOf(G,C)) :- inst(r("c27-2-2",0,1,(C,G,))).
body(r("c27-2-2",0,1,(C,G,)),ableGuardian(G)) :- inst(r("c27-2-2",0,1,(C,G,))).
inst(x("c27-2-2",0,1,0,(C,G,))) :- inst(r("c27-2-2",0,1,(C,G,))), cand(hasParentGuardian(C)).
constitutiveRule(x("c27-2-2",0,1,0,(C,G,)),non(minorOrder2Available(C))) :- inst(x("c27-2-2",0,1,0,(C,G,))).
body(x("c27-2-2",0,1,0,(C,G,)),minor(C)) :- inst(x("c27-2-2",0,1,0,(C,G,))).
body(x("c27-2-2",0,1,0,(C,G,)),olderSiblingOf(G,C)) :- inst(x("c27-2-2",0,1,0,(C,G,))).
body(x("c27-2-2",0,1,0,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-2",0,1,0,(C,G,))).
body(x("c27-2-2",0,1,0,(C,G,)),hasParentGuardian(C)) :- inst(x("c27-2-2",0,1,0,(C,G,))).
superior(x("c27-2-2",0,1,0,(C,G,)),r("c27-2-2",0,1,(C,G,))) :- inst(x("c27-2-2",0,1,0,(C,G,))).
exc(x("c27-2-2",0,1,0,(C,G,)),r("c27-2-2",0,1,(C,G,)),constitutiveRule,minorOrder2Available(C)) :- inst(x("c27-2-2",0,1,0,(C,G,))).
inst(x("c27-2-2",0,1,1,(C,G,))) :- inst(r("c27-2-2",0,1,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c27-2-2",0,1,1,(C,G,)),non(minorOrder2Available(C))) :- inst(x("c27-2-2",0,1,1,(C,G,))).
body(x("c27-2-2",0,1,1,(C,G,)),minor(C)) :- inst(x("c27-2-2",0,1,1,(C,G,))).
body(x("c27-2-2",0,1,1,(C,G,)),olderSiblingOf(G,C)) :- inst(x("c27-2-2",0,1,1,(C,G,))).
body(x("c27-2-2",0,1,1,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-2",0,1,1,(C,G,))).
body(x("c27-2-2",0,1,1,(C,G,)),specialGuardianSet(C)) :- inst(x("c27-2-2",0,1,1,(C,G,))).
superior(x("c27-2-2",0,1,1,(C,G,)),r("c27-2-2",0,1,(C,G,))) :- inst(x("c27-2-2",0,1,1,(C,G,))).
exc(x("c27-2-2",0,1,1,(C,G,)),r("c27-2-2",0,1,(C,G,)),constitutiveRule,minorOrder2Available(C)) :- inst(x("c27-2-2",0,1,1,(C,G,))).
inst(x("c27-2-2",0,1,2,(C,G,))) :- inst(r("c27-2-2",0,1,(C,G,))), cand(minorOrder1Available(C)).
constitutiveRule(x("c27-2-2",0,1,2,(C,G,)),non(minorOrder2Available(C))) :- inst(x("c27-2-2",0,1,2,(C,G,))).
body(x("c27-2-2",0,1,2,(C,G,)),minor(C)) :- inst(x("c27-2-2",0,1,2,(C,G,))).
body(x("c27-2-2",0,1,2,(C,G,)),olderSiblingOf(G,C)) :- inst(x("c27-2-2",0,1,2,(C,G,))).
body(x("c27-2-2",0,1,2,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-2",0,1,2,(C,G,))).
body(x("c27-2-2",0,1,2,(C,G,)),minorOrder1Available(C)) :- inst(x("c27-2-2",0,1,2,(C,G,))).
superior(x("c27-2-2",0,1,2,(C,G,)),r("c27-2-2",0,1,(C,G,))) :- inst(x("c27-2-2",0,1,2,(C,G,))).
exc(x("c27-2-2",0,1,2,(C,G,)),r("c27-2-2",0,1,(C,G,)),constitutiveRule,minorOrder2Available(C)) :- inst(x("c27-2-2",0,1,2,(C,G,))).

% c27-2-3[0.0] 前两顺序都没有的，由其他愿意担任监护人的个人或者组织担任，但须经被监护人住所地的居民委员会、村民委员会或者民政部门同意（第27条第2款；np
inst(r("c27-2-3",0,0,(C,G,))) :- cand(minor(C)), cand(willingToServe(G,C)), cand(ableGuardian(G)), cand(approvedByLocalAuthority(G,C)).
constitutiveRule(r("c27-2-3",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c27-2-3",0,0,(C,G,))).
mainHead(r("c27-2-3",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c27-2-3",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c27-2-3",0,0,(C,G,))).
body(r("c27-2-3",0,0,(C,G,)),minor(C)) :- inst(r("c27-2-3",0,0,(C,G,))).
body(r("c27-2-3",0,0,(C,G,)),willingToServe(G,C)) :- inst(r("c27-2-3",0,0,(C,G,))).
body(r("c27-2-3",0,0,(C,G,)),ableGuardian(G)) :- inst(r("c27-2-3",0,0,(C,G,))).
body(r("c27-2-3",0,0,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(r("c27-2-3",0,0,(C,G,))).
inst(x("c27-2-3",0,0,0,(C,G,))) :- inst(r("c27-2-3",0,0,(C,G,))), cand(hasParentGuardian(C)).
constitutiveRule(x("c27-2-3",0,0,0,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-3",0,0,0,(C,G,))).
body(x("c27-2-3",0,0,0,(C,G,)),minor(C)) :- inst(x("c27-2-3",0,0,0,(C,G,))).
body(x("c27-2-3",0,0,0,(C,G,)),willingToServe(G,C)) :- inst(x("c27-2-3",0,0,0,(C,G,))).
body(x("c27-2-3",0,0,0,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-3",0,0,0,(C,G,))).
body(x("c27-2-3",0,0,0,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c27-2-3",0,0,0,(C,G,))).
body(x("c27-2-3",0,0,0,(C,G,)),hasParentGuardian(C)) :- inst(x("c27-2-3",0,0,0,(C,G,))).
superior(x("c27-2-3",0,0,0,(C,G,)),r("c27-2-3",0,0,(C,G,))) :- inst(x("c27-2-3",0,0,0,(C,G,))).
exc(x("c27-2-3",0,0,0,(C,G,)),r("c27-2-3",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-3",0,0,0,(C,G,))).
inst(x("c27-2-3",0,0,1,(C,G,))) :- inst(r("c27-2-3",0,0,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c27-2-3",0,0,1,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-3",0,0,1,(C,G,))).
body(x("c27-2-3",0,0,1,(C,G,)),minor(C)) :- inst(x("c27-2-3",0,0,1,(C,G,))).
body(x("c27-2-3",0,0,1,(C,G,)),willingToServe(G,C)) :- inst(x("c27-2-3",0,0,1,(C,G,))).
body(x("c27-2-3",0,0,1,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-3",0,0,1,(C,G,))).
body(x("c27-2-3",0,0,1,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c27-2-3",0,0,1,(C,G,))).
body(x("c27-2-3",0,0,1,(C,G,)),specialGuardianSet(C)) :- inst(x("c27-2-3",0,0,1,(C,G,))).
superior(x("c27-2-3",0,0,1,(C,G,)),r("c27-2-3",0,0,(C,G,))) :- inst(x("c27-2-3",0,0,1,(C,G,))).
exc(x("c27-2-3",0,0,1,(C,G,)),r("c27-2-3",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-3",0,0,1,(C,G,))).
inst(x("c27-2-3",0,0,2,(C,G,))) :- inst(r("c27-2-3",0,0,(C,G,))), cand(minorOrder1Available(C)).
constitutiveRule(x("c27-2-3",0,0,2,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-3",0,0,2,(C,G,))).
body(x("c27-2-3",0,0,2,(C,G,)),minor(C)) :- inst(x("c27-2-3",0,0,2,(C,G,))).
body(x("c27-2-3",0,0,2,(C,G,)),willingToServe(G,C)) :- inst(x("c27-2-3",0,0,2,(C,G,))).
body(x("c27-2-3",0,0,2,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-3",0,0,2,(C,G,))).
body(x("c27-2-3",0,0,2,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c27-2-3",0,0,2,(C,G,))).
body(x("c27-2-3",0,0,2,(C,G,)),minorOrder1Available(C)) :- inst(x("c27-2-3",0,0,2,(C,G,))).
superior(x("c27-2-3",0,0,2,(C,G,)),r("c27-2-3",0,0,(C,G,))) :- inst(x("c27-2-3",0,0,2,(C,G,))).
exc(x("c27-2-3",0,0,2,(C,G,)),r("c27-2-3",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-3",0,0,2,(C,G,))).
inst(x("c27-2-3",0,0,3,(C,G,))) :- inst(r("c27-2-3",0,0,(C,G,))), cand(minorOrder2Available(C)).
constitutiveRule(x("c27-2-3",0,0,3,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-3",0,0,3,(C,G,))).
body(x("c27-2-3",0,0,3,(C,G,)),minor(C)) :- inst(x("c27-2-3",0,0,3,(C,G,))).
body(x("c27-2-3",0,0,3,(C,G,)),willingToServe(G,C)) :- inst(x("c27-2-3",0,0,3,(C,G,))).
body(x("c27-2-3",0,0,3,(C,G,)),ableGuardian(G)) :- inst(x("c27-2-3",0,0,3,(C,G,))).
body(x("c27-2-3",0,0,3,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c27-2-3",0,0,3,(C,G,))).
body(x("c27-2-3",0,0,3,(C,G,)),minorOrder2Available(C)) :- inst(x("c27-2-3",0,0,3,(C,G,))).
superior(x("c27-2-3",0,0,3,(C,G,)),r("c27-2-3",0,0,(C,G,))) :- inst(x("c27-2-3",0,0,3,(C,G,))).
exc(x("c27-2-3",0,0,3,(C,G,)),r("c27-2-3",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-3",0,0,3,(C,G,))).
% c27-2-3[1.0] 前两顺序都没有的，由其他愿意担任监护人的个人或者组织担任，但须经被监护人住所地的居民委员会、村民委员会或者民政部门同意（第27条第2款；np
inst(r("c27-2-3",1,0,(C,G,))) :- cand(minor(C)), cand(willingToServe(G,C)), cand(organization(G)), cand(approvedByLocalAuthority(G,C)).
constitutiveRule(r("c27-2-3",1,0,(C,G,)),guardianOf(G,C)) :- inst(r("c27-2-3",1,0,(C,G,))).
mainHead(r("c27-2-3",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c27-2-3",1,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c27-2-3",1,0,(C,G,))).
body(r("c27-2-3",1,0,(C,G,)),minor(C)) :- inst(r("c27-2-3",1,0,(C,G,))).
body(r("c27-2-3",1,0,(C,G,)),willingToServe(G,C)) :- inst(r("c27-2-3",1,0,(C,G,))).
body(r("c27-2-3",1,0,(C,G,)),organization(G)) :- inst(r("c27-2-3",1,0,(C,G,))).
body(r("c27-2-3",1,0,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(r("c27-2-3",1,0,(C,G,))).
inst(x("c27-2-3",1,0,0,(C,G,))) :- inst(r("c27-2-3",1,0,(C,G,))), cand(hasParentGuardian(C)).
constitutiveRule(x("c27-2-3",1,0,0,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-3",1,0,0,(C,G,))).
body(x("c27-2-3",1,0,0,(C,G,)),minor(C)) :- inst(x("c27-2-3",1,0,0,(C,G,))).
body(x("c27-2-3",1,0,0,(C,G,)),willingToServe(G,C)) :- inst(x("c27-2-3",1,0,0,(C,G,))).
body(x("c27-2-3",1,0,0,(C,G,)),organization(G)) :- inst(x("c27-2-3",1,0,0,(C,G,))).
body(x("c27-2-3",1,0,0,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c27-2-3",1,0,0,(C,G,))).
body(x("c27-2-3",1,0,0,(C,G,)),hasParentGuardian(C)) :- inst(x("c27-2-3",1,0,0,(C,G,))).
superior(x("c27-2-3",1,0,0,(C,G,)),r("c27-2-3",1,0,(C,G,))) :- inst(x("c27-2-3",1,0,0,(C,G,))).
exc(x("c27-2-3",1,0,0,(C,G,)),r("c27-2-3",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-3",1,0,0,(C,G,))).
inst(x("c27-2-3",1,0,1,(C,G,))) :- inst(r("c27-2-3",1,0,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c27-2-3",1,0,1,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-3",1,0,1,(C,G,))).
body(x("c27-2-3",1,0,1,(C,G,)),minor(C)) :- inst(x("c27-2-3",1,0,1,(C,G,))).
body(x("c27-2-3",1,0,1,(C,G,)),willingToServe(G,C)) :- inst(x("c27-2-3",1,0,1,(C,G,))).
body(x("c27-2-3",1,0,1,(C,G,)),organization(G)) :- inst(x("c27-2-3",1,0,1,(C,G,))).
body(x("c27-2-3",1,0,1,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c27-2-3",1,0,1,(C,G,))).
body(x("c27-2-3",1,0,1,(C,G,)),specialGuardianSet(C)) :- inst(x("c27-2-3",1,0,1,(C,G,))).
superior(x("c27-2-3",1,0,1,(C,G,)),r("c27-2-3",1,0,(C,G,))) :- inst(x("c27-2-3",1,0,1,(C,G,))).
exc(x("c27-2-3",1,0,1,(C,G,)),r("c27-2-3",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-3",1,0,1,(C,G,))).
inst(x("c27-2-3",1,0,2,(C,G,))) :- inst(r("c27-2-3",1,0,(C,G,))), cand(minorOrder1Available(C)).
constitutiveRule(x("c27-2-3",1,0,2,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-3",1,0,2,(C,G,))).
body(x("c27-2-3",1,0,2,(C,G,)),minor(C)) :- inst(x("c27-2-3",1,0,2,(C,G,))).
body(x("c27-2-3",1,0,2,(C,G,)),willingToServe(G,C)) :- inst(x("c27-2-3",1,0,2,(C,G,))).
body(x("c27-2-3",1,0,2,(C,G,)),organization(G)) :- inst(x("c27-2-3",1,0,2,(C,G,))).
body(x("c27-2-3",1,0,2,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c27-2-3",1,0,2,(C,G,))).
body(x("c27-2-3",1,0,2,(C,G,)),minorOrder1Available(C)) :- inst(x("c27-2-3",1,0,2,(C,G,))).
superior(x("c27-2-3",1,0,2,(C,G,)),r("c27-2-3",1,0,(C,G,))) :- inst(x("c27-2-3",1,0,2,(C,G,))).
exc(x("c27-2-3",1,0,2,(C,G,)),r("c27-2-3",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-3",1,0,2,(C,G,))).
inst(x("c27-2-3",1,0,3,(C,G,))) :- inst(r("c27-2-3",1,0,(C,G,))), cand(minorOrder2Available(C)).
constitutiveRule(x("c27-2-3",1,0,3,(C,G,)),non(guardianOf(G,C))) :- inst(x("c27-2-3",1,0,3,(C,G,))).
body(x("c27-2-3",1,0,3,(C,G,)),minor(C)) :- inst(x("c27-2-3",1,0,3,(C,G,))).
body(x("c27-2-3",1,0,3,(C,G,)),willingToServe(G,C)) :- inst(x("c27-2-3",1,0,3,(C,G,))).
body(x("c27-2-3",1,0,3,(C,G,)),organization(G)) :- inst(x("c27-2-3",1,0,3,(C,G,))).
body(x("c27-2-3",1,0,3,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c27-2-3",1,0,3,(C,G,))).
body(x("c27-2-3",1,0,3,(C,G,)),minorOrder2Available(C)) :- inst(x("c27-2-3",1,0,3,(C,G,))).
superior(x("c27-2-3",1,0,3,(C,G,)),r("c27-2-3",1,0,(C,G,))) :- inst(x("c27-2-3",1,0,3,(C,G,))).
exc(x("c27-2-3",1,0,3,(C,G,)),r("c27-2-3",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c27-2-3",1,0,3,(C,G,))).

% c-ward-adult[0.0] 无民事行为能力或者限制民事行为能力的成年人需要监护（第28条；npc）
inst(r("c-ward-adult",0,0,(C,))) :- cand(adult(C)), cand(noCapacity(C)).
constitutiveRule(r("c-ward-adult",0,0,(C,)),needsGuardian(C)) :- inst(r("c-ward-adult",0,0,(C,))).
mainHead(r("c-ward-adult",0,0,(C,)),constitutiveRule,needsGuardian(C)) :- inst(r("c-ward-adult",0,0,(C,))).
cand(needsGuardian(C)) :- inst(r("c-ward-adult",0,0,(C,))).
body(r("c-ward-adult",0,0,(C,)),adult(C)) :- inst(r("c-ward-adult",0,0,(C,))).
body(r("c-ward-adult",0,0,(C,)),noCapacity(C)) :- inst(r("c-ward-adult",0,0,(C,))).
% c-ward-adult[0.1] 无民事行为能力或者限制民事行为能力的成年人需要监护（第28条；npc）
inst(r("c-ward-adult",0,1,(C,))) :- cand(adult(C)), cand(noCapacity(C)).
constitutiveRule(r("c-ward-adult",0,1,(C,)),incapableAdult(C)) :- inst(r("c-ward-adult",0,1,(C,))).
mainHead(r("c-ward-adult",0,1,(C,)),constitutiveRule,incapableAdult(C)) :- inst(r("c-ward-adult",0,1,(C,))).
cand(incapableAdult(C)) :- inst(r("c-ward-adult",0,1,(C,))).
body(r("c-ward-adult",0,1,(C,)),adult(C)) :- inst(r("c-ward-adult",0,1,(C,))).
body(r("c-ward-adult",0,1,(C,)),noCapacity(C)) :- inst(r("c-ward-adult",0,1,(C,))).
% c-ward-adult[1.0] 无民事行为能力或者限制民事行为能力的成年人需要监护（第28条；npc）
inst(r("c-ward-adult",1,0,(C,))) :- cand(adult(C)), cand(limitedCapacity(C)).
constitutiveRule(r("c-ward-adult",1,0,(C,)),needsGuardian(C)) :- inst(r("c-ward-adult",1,0,(C,))).
mainHead(r("c-ward-adult",1,0,(C,)),constitutiveRule,needsGuardian(C)) :- inst(r("c-ward-adult",1,0,(C,))).
cand(needsGuardian(C)) :- inst(r("c-ward-adult",1,0,(C,))).
body(r("c-ward-adult",1,0,(C,)),adult(C)) :- inst(r("c-ward-adult",1,0,(C,))).
body(r("c-ward-adult",1,0,(C,)),limitedCapacity(C)) :- inst(r("c-ward-adult",1,0,(C,))).
% c-ward-adult[1.1] 无民事行为能力或者限制民事行为能力的成年人需要监护（第28条；npc）
inst(r("c-ward-adult",1,1,(C,))) :- cand(adult(C)), cand(limitedCapacity(C)).
constitutiveRule(r("c-ward-adult",1,1,(C,)),incapableAdult(C)) :- inst(r("c-ward-adult",1,1,(C,))).
mainHead(r("c-ward-adult",1,1,(C,)),constitutiveRule,incapableAdult(C)) :- inst(r("c-ward-adult",1,1,(C,))).
cand(incapableAdult(C)) :- inst(r("c-ward-adult",1,1,(C,))).
body(r("c-ward-adult",1,1,(C,)),adult(C)) :- inst(r("c-ward-adult",1,1,(C,))).
body(r("c-ward-adult",1,1,(C,)),limitedCapacity(C)) :- inst(r("c-ward-adult",1,1,(C,))).

% c28-1[0.0] 无或限制民事行为能力的成年人，由有监护能力的配偶担任监护人（第一顺序）（第28条；npc）
inst(r("c28-1",0,0,(C,G,))) :- cand(incapableAdult(C)), cand(spouseOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c28-1",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c28-1",0,0,(C,G,))).
mainHead(r("c28-1",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c28-1",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c28-1",0,0,(C,G,))).
body(r("c28-1",0,0,(C,G,)),incapableAdult(C)) :- inst(r("c28-1",0,0,(C,G,))).
body(r("c28-1",0,0,(C,G,)),spouseOf(G,C)) :- inst(r("c28-1",0,0,(C,G,))).
body(r("c28-1",0,0,(C,G,)),ableGuardian(G)) :- inst(r("c28-1",0,0,(C,G,))).
inst(x("c28-1",0,0,0,(C,G,))) :- inst(r("c28-1",0,0,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c28-1",0,0,0,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-1",0,0,0,(C,G,))).
body(x("c28-1",0,0,0,(C,G,)),incapableAdult(C)) :- inst(x("c28-1",0,0,0,(C,G,))).
body(x("c28-1",0,0,0,(C,G,)),spouseOf(G,C)) :- inst(x("c28-1",0,0,0,(C,G,))).
body(x("c28-1",0,0,0,(C,G,)),ableGuardian(G)) :- inst(x("c28-1",0,0,0,(C,G,))).
body(x("c28-1",0,0,0,(C,G,)),specialGuardianSet(C)) :- inst(x("c28-1",0,0,0,(C,G,))).
superior(x("c28-1",0,0,0,(C,G,)),r("c28-1",0,0,(C,G,))) :- inst(x("c28-1",0,0,0,(C,G,))).
exc(x("c28-1",0,0,0,(C,G,)),r("c28-1",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-1",0,0,0,(C,G,))).
% c28-1[0.1] 无或限制民事行为能力的成年人，由有监护能力的配偶担任监护人（第一顺序）（第28条；npc）
inst(r("c28-1",0,1,(C,G,))) :- cand(incapableAdult(C)), cand(spouseOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c28-1",0,1,(C,G,)),adultOrder1Available(C)) :- inst(r("c28-1",0,1,(C,G,))).
mainHead(r("c28-1",0,1,(C,G,)),constitutiveRule,adultOrder1Available(C)) :- inst(r("c28-1",0,1,(C,G,))).
cand(adultOrder1Available(C)) :- inst(r("c28-1",0,1,(C,G,))).
body(r("c28-1",0,1,(C,G,)),incapableAdult(C)) :- inst(r("c28-1",0,1,(C,G,))).
body(r("c28-1",0,1,(C,G,)),spouseOf(G,C)) :- inst(r("c28-1",0,1,(C,G,))).
body(r("c28-1",0,1,(C,G,)),ableGuardian(G)) :- inst(r("c28-1",0,1,(C,G,))).
inst(x("c28-1",0,1,0,(C,G,))) :- inst(r("c28-1",0,1,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c28-1",0,1,0,(C,G,)),non(adultOrder1Available(C))) :- inst(x("c28-1",0,1,0,(C,G,))).
body(x("c28-1",0,1,0,(C,G,)),incapableAdult(C)) :- inst(x("c28-1",0,1,0,(C,G,))).
body(x("c28-1",0,1,0,(C,G,)),spouseOf(G,C)) :- inst(x("c28-1",0,1,0,(C,G,))).
body(x("c28-1",0,1,0,(C,G,)),ableGuardian(G)) :- inst(x("c28-1",0,1,0,(C,G,))).
body(x("c28-1",0,1,0,(C,G,)),specialGuardianSet(C)) :- inst(x("c28-1",0,1,0,(C,G,))).
superior(x("c28-1",0,1,0,(C,G,)),r("c28-1",0,1,(C,G,))) :- inst(x("c28-1",0,1,0,(C,G,))).
exc(x("c28-1",0,1,0,(C,G,)),r("c28-1",0,1,(C,G,)),constitutiveRule,adultOrder1Available(C)) :- inst(x("c28-1",0,1,0,(C,G,))).

% c28-2[0.0] 没有第一顺序的，由父母、子女担任（第二顺序）（第28条；npc）
inst(r("c28-2",0,0,(C,G,))) :- cand(incapableAdult(C)), cand(parentOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c28-2",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c28-2",0,0,(C,G,))).
mainHead(r("c28-2",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c28-2",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c28-2",0,0,(C,G,))).
body(r("c28-2",0,0,(C,G,)),incapableAdult(C)) :- inst(r("c28-2",0,0,(C,G,))).
body(r("c28-2",0,0,(C,G,)),parentOf(G,C)) :- inst(r("c28-2",0,0,(C,G,))).
body(r("c28-2",0,0,(C,G,)),ableGuardian(G)) :- inst(r("c28-2",0,0,(C,G,))).
inst(x("c28-2",0,0,0,(C,G,))) :- inst(r("c28-2",0,0,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c28-2",0,0,0,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-2",0,0,0,(C,G,))).
body(x("c28-2",0,0,0,(C,G,)),incapableAdult(C)) :- inst(x("c28-2",0,0,0,(C,G,))).
body(x("c28-2",0,0,0,(C,G,)),parentOf(G,C)) :- inst(x("c28-2",0,0,0,(C,G,))).
body(x("c28-2",0,0,0,(C,G,)),ableGuardian(G)) :- inst(x("c28-2",0,0,0,(C,G,))).
body(x("c28-2",0,0,0,(C,G,)),specialGuardianSet(C)) :- inst(x("c28-2",0,0,0,(C,G,))).
superior(x("c28-2",0,0,0,(C,G,)),r("c28-2",0,0,(C,G,))) :- inst(x("c28-2",0,0,0,(C,G,))).
exc(x("c28-2",0,0,0,(C,G,)),r("c28-2",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-2",0,0,0,(C,G,))).
inst(x("c28-2",0,0,1,(C,G,))) :- inst(r("c28-2",0,0,(C,G,))), cand(adultOrder1Available(C)).
constitutiveRule(x("c28-2",0,0,1,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-2",0,0,1,(C,G,))).
body(x("c28-2",0,0,1,(C,G,)),incapableAdult(C)) :- inst(x("c28-2",0,0,1,(C,G,))).
body(x("c28-2",0,0,1,(C,G,)),parentOf(G,C)) :- inst(x("c28-2",0,0,1,(C,G,))).
body(x("c28-2",0,0,1,(C,G,)),ableGuardian(G)) :- inst(x("c28-2",0,0,1,(C,G,))).
body(x("c28-2",0,0,1,(C,G,)),adultOrder1Available(C)) :- inst(x("c28-2",0,0,1,(C,G,))).
superior(x("c28-2",0,0,1,(C,G,)),r("c28-2",0,0,(C,G,))) :- inst(x("c28-2",0,0,1,(C,G,))).
exc(x("c28-2",0,0,1,(C,G,)),r("c28-2",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-2",0,0,1,(C,G,))).
% c28-2[0.1] 没有第一顺序的，由父母、子女担任（第二顺序）（第28条；npc）
inst(r("c28-2",0,1,(C,G,))) :- cand(incapableAdult(C)), cand(parentOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c28-2",0,1,(C,G,)),adultOrder2Available(C)) :- inst(r("c28-2",0,1,(C,G,))).
mainHead(r("c28-2",0,1,(C,G,)),constitutiveRule,adultOrder2Available(C)) :- inst(r("c28-2",0,1,(C,G,))).
cand(adultOrder2Available(C)) :- inst(r("c28-2",0,1,(C,G,))).
body(r("c28-2",0,1,(C,G,)),incapableAdult(C)) :- inst(r("c28-2",0,1,(C,G,))).
body(r("c28-2",0,1,(C,G,)),parentOf(G,C)) :- inst(r("c28-2",0,1,(C,G,))).
body(r("c28-2",0,1,(C,G,)),ableGuardian(G)) :- inst(r("c28-2",0,1,(C,G,))).
inst(x("c28-2",0,1,0,(C,G,))) :- inst(r("c28-2",0,1,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c28-2",0,1,0,(C,G,)),non(adultOrder2Available(C))) :- inst(x("c28-2",0,1,0,(C,G,))).
body(x("c28-2",0,1,0,(C,G,)),incapableAdult(C)) :- inst(x("c28-2",0,1,0,(C,G,))).
body(x("c28-2",0,1,0,(C,G,)),parentOf(G,C)) :- inst(x("c28-2",0,1,0,(C,G,))).
body(x("c28-2",0,1,0,(C,G,)),ableGuardian(G)) :- inst(x("c28-2",0,1,0,(C,G,))).
body(x("c28-2",0,1,0,(C,G,)),specialGuardianSet(C)) :- inst(x("c28-2",0,1,0,(C,G,))).
superior(x("c28-2",0,1,0,(C,G,)),r("c28-2",0,1,(C,G,))) :- inst(x("c28-2",0,1,0,(C,G,))).
exc(x("c28-2",0,1,0,(C,G,)),r("c28-2",0,1,(C,G,)),constitutiveRule,adultOrder2Available(C)) :- inst(x("c28-2",0,1,0,(C,G,))).
inst(x("c28-2",0,1,1,(C,G,))) :- inst(r("c28-2",0,1,(C,G,))), cand(adultOrder1Available(C)).
constitutiveRule(x("c28-2",0,1,1,(C,G,)),non(adultOrder2Available(C))) :- inst(x("c28-2",0,1,1,(C,G,))).
body(x("c28-2",0,1,1,(C,G,)),incapableAdult(C)) :- inst(x("c28-2",0,1,1,(C,G,))).
body(x("c28-2",0,1,1,(C,G,)),parentOf(G,C)) :- inst(x("c28-2",0,1,1,(C,G,))).
body(x("c28-2",0,1,1,(C,G,)),ableGuardian(G)) :- inst(x("c28-2",0,1,1,(C,G,))).
body(x("c28-2",0,1,1,(C,G,)),adultOrder1Available(C)) :- inst(x("c28-2",0,1,1,(C,G,))).
superior(x("c28-2",0,1,1,(C,G,)),r("c28-2",0,1,(C,G,))) :- inst(x("c28-2",0,1,1,(C,G,))).
exc(x("c28-2",0,1,1,(C,G,)),r("c28-2",0,1,(C,G,)),constitutiveRule,adultOrder2Available(C)) :- inst(x("c28-2",0,1,1,(C,G,))).
% c28-2[1.0] 没有第一顺序的，由父母、子女担任（第二顺序）（第28条；npc）
inst(r("c28-2",1,0,(C,G,))) :- cand(incapableAdult(C)), cand(childOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c28-2",1,0,(C,G,)),guardianOf(G,C)) :- inst(r("c28-2",1,0,(C,G,))).
mainHead(r("c28-2",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c28-2",1,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c28-2",1,0,(C,G,))).
body(r("c28-2",1,0,(C,G,)),incapableAdult(C)) :- inst(r("c28-2",1,0,(C,G,))).
body(r("c28-2",1,0,(C,G,)),childOf(G,C)) :- inst(r("c28-2",1,0,(C,G,))).
body(r("c28-2",1,0,(C,G,)),ableGuardian(G)) :- inst(r("c28-2",1,0,(C,G,))).
inst(x("c28-2",1,0,0,(C,G,))) :- inst(r("c28-2",1,0,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c28-2",1,0,0,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-2",1,0,0,(C,G,))).
body(x("c28-2",1,0,0,(C,G,)),incapableAdult(C)) :- inst(x("c28-2",1,0,0,(C,G,))).
body(x("c28-2",1,0,0,(C,G,)),childOf(G,C)) :- inst(x("c28-2",1,0,0,(C,G,))).
body(x("c28-2",1,0,0,(C,G,)),ableGuardian(G)) :- inst(x("c28-2",1,0,0,(C,G,))).
body(x("c28-2",1,0,0,(C,G,)),specialGuardianSet(C)) :- inst(x("c28-2",1,0,0,(C,G,))).
superior(x("c28-2",1,0,0,(C,G,)),r("c28-2",1,0,(C,G,))) :- inst(x("c28-2",1,0,0,(C,G,))).
exc(x("c28-2",1,0,0,(C,G,)),r("c28-2",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-2",1,0,0,(C,G,))).
inst(x("c28-2",1,0,1,(C,G,))) :- inst(r("c28-2",1,0,(C,G,))), cand(adultOrder1Available(C)).
constitutiveRule(x("c28-2",1,0,1,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-2",1,0,1,(C,G,))).
body(x("c28-2",1,0,1,(C,G,)),incapableAdult(C)) :- inst(x("c28-2",1,0,1,(C,G,))).
body(x("c28-2",1,0,1,(C,G,)),childOf(G,C)) :- inst(x("c28-2",1,0,1,(C,G,))).
body(x("c28-2",1,0,1,(C,G,)),ableGuardian(G)) :- inst(x("c28-2",1,0,1,(C,G,))).
body(x("c28-2",1,0,1,(C,G,)),adultOrder1Available(C)) :- inst(x("c28-2",1,0,1,(C,G,))).
superior(x("c28-2",1,0,1,(C,G,)),r("c28-2",1,0,(C,G,))) :- inst(x("c28-2",1,0,1,(C,G,))).
exc(x("c28-2",1,0,1,(C,G,)),r("c28-2",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-2",1,0,1,(C,G,))).
% c28-2[1.1] 没有第一顺序的，由父母、子女担任（第二顺序）（第28条；npc）
inst(r("c28-2",1,1,(C,G,))) :- cand(incapableAdult(C)), cand(childOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c28-2",1,1,(C,G,)),adultOrder2Available(C)) :- inst(r("c28-2",1,1,(C,G,))).
mainHead(r("c28-2",1,1,(C,G,)),constitutiveRule,adultOrder2Available(C)) :- inst(r("c28-2",1,1,(C,G,))).
cand(adultOrder2Available(C)) :- inst(r("c28-2",1,1,(C,G,))).
body(r("c28-2",1,1,(C,G,)),incapableAdult(C)) :- inst(r("c28-2",1,1,(C,G,))).
body(r("c28-2",1,1,(C,G,)),childOf(G,C)) :- inst(r("c28-2",1,1,(C,G,))).
body(r("c28-2",1,1,(C,G,)),ableGuardian(G)) :- inst(r("c28-2",1,1,(C,G,))).
inst(x("c28-2",1,1,0,(C,G,))) :- inst(r("c28-2",1,1,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c28-2",1,1,0,(C,G,)),non(adultOrder2Available(C))) :- inst(x("c28-2",1,1,0,(C,G,))).
body(x("c28-2",1,1,0,(C,G,)),incapableAdult(C)) :- inst(x("c28-2",1,1,0,(C,G,))).
body(x("c28-2",1,1,0,(C,G,)),childOf(G,C)) :- inst(x("c28-2",1,1,0,(C,G,))).
body(x("c28-2",1,1,0,(C,G,)),ableGuardian(G)) :- inst(x("c28-2",1,1,0,(C,G,))).
body(x("c28-2",1,1,0,(C,G,)),specialGuardianSet(C)) :- inst(x("c28-2",1,1,0,(C,G,))).
superior(x("c28-2",1,1,0,(C,G,)),r("c28-2",1,1,(C,G,))) :- inst(x("c28-2",1,1,0,(C,G,))).
exc(x("c28-2",1,1,0,(C,G,)),r("c28-2",1,1,(C,G,)),constitutiveRule,adultOrder2Available(C)) :- inst(x("c28-2",1,1,0,(C,G,))).
inst(x("c28-2",1,1,1,(C,G,))) :- inst(r("c28-2",1,1,(C,G,))), cand(adultOrder1Available(C)).
constitutiveRule(x("c28-2",1,1,1,(C,G,)),non(adultOrder2Available(C))) :- inst(x("c28-2",1,1,1,(C,G,))).
body(x("c28-2",1,1,1,(C,G,)),incapableAdult(C)) :- inst(x("c28-2",1,1,1,(C,G,))).
body(x("c28-2",1,1,1,(C,G,)),childOf(G,C)) :- inst(x("c28-2",1,1,1,(C,G,))).
body(x("c28-2",1,1,1,(C,G,)),ableGuardian(G)) :- inst(x("c28-2",1,1,1,(C,G,))).
body(x("c28-2",1,1,1,(C,G,)),adultOrder1Available(C)) :- inst(x("c28-2",1,1,1,(C,G,))).
superior(x("c28-2",1,1,1,(C,G,)),r("c28-2",1,1,(C,G,))) :- inst(x("c28-2",1,1,1,(C,G,))).
exc(x("c28-2",1,1,1,(C,G,)),r("c28-2",1,1,(C,G,)),constitutiveRule,adultOrder2Available(C)) :- inst(x("c28-2",1,1,1,(C,G,))).

% c28-3[0.0] 再没有的，由其他近亲属担任（第三顺序）（第28条；npc）
inst(r("c28-3",0,0,(C,G,))) :- cand(incapableAdult(C)), cand(closeRelativeOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c28-3",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c28-3",0,0,(C,G,))).
mainHead(r("c28-3",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c28-3",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c28-3",0,0,(C,G,))).
body(r("c28-3",0,0,(C,G,)),incapableAdult(C)) :- inst(r("c28-3",0,0,(C,G,))).
body(r("c28-3",0,0,(C,G,)),closeRelativeOf(G,C)) :- inst(r("c28-3",0,0,(C,G,))).
body(r("c28-3",0,0,(C,G,)),ableGuardian(G)) :- inst(r("c28-3",0,0,(C,G,))).
inst(x("c28-3",0,0,0,(C,G,))) :- inst(r("c28-3",0,0,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c28-3",0,0,0,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-3",0,0,0,(C,G,))).
body(x("c28-3",0,0,0,(C,G,)),incapableAdult(C)) :- inst(x("c28-3",0,0,0,(C,G,))).
body(x("c28-3",0,0,0,(C,G,)),closeRelativeOf(G,C)) :- inst(x("c28-3",0,0,0,(C,G,))).
body(x("c28-3",0,0,0,(C,G,)),ableGuardian(G)) :- inst(x("c28-3",0,0,0,(C,G,))).
body(x("c28-3",0,0,0,(C,G,)),specialGuardianSet(C)) :- inst(x("c28-3",0,0,0,(C,G,))).
superior(x("c28-3",0,0,0,(C,G,)),r("c28-3",0,0,(C,G,))) :- inst(x("c28-3",0,0,0,(C,G,))).
exc(x("c28-3",0,0,0,(C,G,)),r("c28-3",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-3",0,0,0,(C,G,))).
inst(x("c28-3",0,0,1,(C,G,))) :- inst(r("c28-3",0,0,(C,G,))), cand(adultOrder1Available(C)).
constitutiveRule(x("c28-3",0,0,1,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-3",0,0,1,(C,G,))).
body(x("c28-3",0,0,1,(C,G,)),incapableAdult(C)) :- inst(x("c28-3",0,0,1,(C,G,))).
body(x("c28-3",0,0,1,(C,G,)),closeRelativeOf(G,C)) :- inst(x("c28-3",0,0,1,(C,G,))).
body(x("c28-3",0,0,1,(C,G,)),ableGuardian(G)) :- inst(x("c28-3",0,0,1,(C,G,))).
body(x("c28-3",0,0,1,(C,G,)),adultOrder1Available(C)) :- inst(x("c28-3",0,0,1,(C,G,))).
superior(x("c28-3",0,0,1,(C,G,)),r("c28-3",0,0,(C,G,))) :- inst(x("c28-3",0,0,1,(C,G,))).
exc(x("c28-3",0,0,1,(C,G,)),r("c28-3",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-3",0,0,1,(C,G,))).
inst(x("c28-3",0,0,2,(C,G,))) :- inst(r("c28-3",0,0,(C,G,))), cand(adultOrder2Available(C)).
constitutiveRule(x("c28-3",0,0,2,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-3",0,0,2,(C,G,))).
body(x("c28-3",0,0,2,(C,G,)),incapableAdult(C)) :- inst(x("c28-3",0,0,2,(C,G,))).
body(x("c28-3",0,0,2,(C,G,)),closeRelativeOf(G,C)) :- inst(x("c28-3",0,0,2,(C,G,))).
body(x("c28-3",0,0,2,(C,G,)),ableGuardian(G)) :- inst(x("c28-3",0,0,2,(C,G,))).
body(x("c28-3",0,0,2,(C,G,)),adultOrder2Available(C)) :- inst(x("c28-3",0,0,2,(C,G,))).
superior(x("c28-3",0,0,2,(C,G,)),r("c28-3",0,0,(C,G,))) :- inst(x("c28-3",0,0,2,(C,G,))).
exc(x("c28-3",0,0,2,(C,G,)),r("c28-3",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-3",0,0,2,(C,G,))).
% c28-3[0.1] 再没有的，由其他近亲属担任（第三顺序）（第28条；npc）
inst(r("c28-3",0,1,(C,G,))) :- cand(incapableAdult(C)), cand(closeRelativeOf(G,C)), cand(ableGuardian(G)).
constitutiveRule(r("c28-3",0,1,(C,G,)),adultOrder3Available(C)) :- inst(r("c28-3",0,1,(C,G,))).
mainHead(r("c28-3",0,1,(C,G,)),constitutiveRule,adultOrder3Available(C)) :- inst(r("c28-3",0,1,(C,G,))).
cand(adultOrder3Available(C)) :- inst(r("c28-3",0,1,(C,G,))).
body(r("c28-3",0,1,(C,G,)),incapableAdult(C)) :- inst(r("c28-3",0,1,(C,G,))).
body(r("c28-3",0,1,(C,G,)),closeRelativeOf(G,C)) :- inst(r("c28-3",0,1,(C,G,))).
body(r("c28-3",0,1,(C,G,)),ableGuardian(G)) :- inst(r("c28-3",0,1,(C,G,))).
inst(x("c28-3",0,1,0,(C,G,))) :- inst(r("c28-3",0,1,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c28-3",0,1,0,(C,G,)),non(adultOrder3Available(C))) :- inst(x("c28-3",0,1,0,(C,G,))).
body(x("c28-3",0,1,0,(C,G,)),incapableAdult(C)) :- inst(x("c28-3",0,1,0,(C,G,))).
body(x("c28-3",0,1,0,(C,G,)),closeRelativeOf(G,C)) :- inst(x("c28-3",0,1,0,(C,G,))).
body(x("c28-3",0,1,0,(C,G,)),ableGuardian(G)) :- inst(x("c28-3",0,1,0,(C,G,))).
body(x("c28-3",0,1,0,(C,G,)),specialGuardianSet(C)) :- inst(x("c28-3",0,1,0,(C,G,))).
superior(x("c28-3",0,1,0,(C,G,)),r("c28-3",0,1,(C,G,))) :- inst(x("c28-3",0,1,0,(C,G,))).
exc(x("c28-3",0,1,0,(C,G,)),r("c28-3",0,1,(C,G,)),constitutiveRule,adultOrder3Available(C)) :- inst(x("c28-3",0,1,0,(C,G,))).
inst(x("c28-3",0,1,1,(C,G,))) :- inst(r("c28-3",0,1,(C,G,))), cand(adultOrder1Available(C)).
constitutiveRule(x("c28-3",0,1,1,(C,G,)),non(adultOrder3Available(C))) :- inst(x("c28-3",0,1,1,(C,G,))).
body(x("c28-3",0,1,1,(C,G,)),incapableAdult(C)) :- inst(x("c28-3",0,1,1,(C,G,))).
body(x("c28-3",0,1,1,(C,G,)),closeRelativeOf(G,C)) :- inst(x("c28-3",0,1,1,(C,G,))).
body(x("c28-3",0,1,1,(C,G,)),ableGuardian(G)) :- inst(x("c28-3",0,1,1,(C,G,))).
body(x("c28-3",0,1,1,(C,G,)),adultOrder1Available(C)) :- inst(x("c28-3",0,1,1,(C,G,))).
superior(x("c28-3",0,1,1,(C,G,)),r("c28-3",0,1,(C,G,))) :- inst(x("c28-3",0,1,1,(C,G,))).
exc(x("c28-3",0,1,1,(C,G,)),r("c28-3",0,1,(C,G,)),constitutiveRule,adultOrder3Available(C)) :- inst(x("c28-3",0,1,1,(C,G,))).
inst(x("c28-3",0,1,2,(C,G,))) :- inst(r("c28-3",0,1,(C,G,))), cand(adultOrder2Available(C)).
constitutiveRule(x("c28-3",0,1,2,(C,G,)),non(adultOrder3Available(C))) :- inst(x("c28-3",0,1,2,(C,G,))).
body(x("c28-3",0,1,2,(C,G,)),incapableAdult(C)) :- inst(x("c28-3",0,1,2,(C,G,))).
body(x("c28-3",0,1,2,(C,G,)),closeRelativeOf(G,C)) :- inst(x("c28-3",0,1,2,(C,G,))).
body(x("c28-3",0,1,2,(C,G,)),ableGuardian(G)) :- inst(x("c28-3",0,1,2,(C,G,))).
body(x("c28-3",0,1,2,(C,G,)),adultOrder2Available(C)) :- inst(x("c28-3",0,1,2,(C,G,))).
superior(x("c28-3",0,1,2,(C,G,)),r("c28-3",0,1,(C,G,))) :- inst(x("c28-3",0,1,2,(C,G,))).
exc(x("c28-3",0,1,2,(C,G,)),r("c28-3",0,1,(C,G,)),constitutiveRule,adultOrder3Available(C)) :- inst(x("c28-3",0,1,2,(C,G,))).

% c28-4[0.0] 前三顺序都没有的，由其他愿意担任监护人的个人或者组织担任，但须经被监护人住所地的居民委员会、村民委员会或者民政部门同意（第28条；npc）
inst(r("c28-4",0,0,(C,G,))) :- cand(incapableAdult(C)), cand(willingToServe(G,C)), cand(ableGuardian(G)), cand(approvedByLocalAuthority(G,C)).
constitutiveRule(r("c28-4",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c28-4",0,0,(C,G,))).
mainHead(r("c28-4",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c28-4",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c28-4",0,0,(C,G,))).
body(r("c28-4",0,0,(C,G,)),incapableAdult(C)) :- inst(r("c28-4",0,0,(C,G,))).
body(r("c28-4",0,0,(C,G,)),willingToServe(G,C)) :- inst(r("c28-4",0,0,(C,G,))).
body(r("c28-4",0,0,(C,G,)),ableGuardian(G)) :- inst(r("c28-4",0,0,(C,G,))).
body(r("c28-4",0,0,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(r("c28-4",0,0,(C,G,))).
inst(x("c28-4",0,0,0,(C,G,))) :- inst(r("c28-4",0,0,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c28-4",0,0,0,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-4",0,0,0,(C,G,))).
body(x("c28-4",0,0,0,(C,G,)),incapableAdult(C)) :- inst(x("c28-4",0,0,0,(C,G,))).
body(x("c28-4",0,0,0,(C,G,)),willingToServe(G,C)) :- inst(x("c28-4",0,0,0,(C,G,))).
body(x("c28-4",0,0,0,(C,G,)),ableGuardian(G)) :- inst(x("c28-4",0,0,0,(C,G,))).
body(x("c28-4",0,0,0,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c28-4",0,0,0,(C,G,))).
body(x("c28-4",0,0,0,(C,G,)),specialGuardianSet(C)) :- inst(x("c28-4",0,0,0,(C,G,))).
superior(x("c28-4",0,0,0,(C,G,)),r("c28-4",0,0,(C,G,))) :- inst(x("c28-4",0,0,0,(C,G,))).
exc(x("c28-4",0,0,0,(C,G,)),r("c28-4",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-4",0,0,0,(C,G,))).
inst(x("c28-4",0,0,1,(C,G,))) :- inst(r("c28-4",0,0,(C,G,))), cand(adultOrder1Available(C)).
constitutiveRule(x("c28-4",0,0,1,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-4",0,0,1,(C,G,))).
body(x("c28-4",0,0,1,(C,G,)),incapableAdult(C)) :- inst(x("c28-4",0,0,1,(C,G,))).
body(x("c28-4",0,0,1,(C,G,)),willingToServe(G,C)) :- inst(x("c28-4",0,0,1,(C,G,))).
body(x("c28-4",0,0,1,(C,G,)),ableGuardian(G)) :- inst(x("c28-4",0,0,1,(C,G,))).
body(x("c28-4",0,0,1,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c28-4",0,0,1,(C,G,))).
body(x("c28-4",0,0,1,(C,G,)),adultOrder1Available(C)) :- inst(x("c28-4",0,0,1,(C,G,))).
superior(x("c28-4",0,0,1,(C,G,)),r("c28-4",0,0,(C,G,))) :- inst(x("c28-4",0,0,1,(C,G,))).
exc(x("c28-4",0,0,1,(C,G,)),r("c28-4",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-4",0,0,1,(C,G,))).
inst(x("c28-4",0,0,2,(C,G,))) :- inst(r("c28-4",0,0,(C,G,))), cand(adultOrder2Available(C)).
constitutiveRule(x("c28-4",0,0,2,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-4",0,0,2,(C,G,))).
body(x("c28-4",0,0,2,(C,G,)),incapableAdult(C)) :- inst(x("c28-4",0,0,2,(C,G,))).
body(x("c28-4",0,0,2,(C,G,)),willingToServe(G,C)) :- inst(x("c28-4",0,0,2,(C,G,))).
body(x("c28-4",0,0,2,(C,G,)),ableGuardian(G)) :- inst(x("c28-4",0,0,2,(C,G,))).
body(x("c28-4",0,0,2,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c28-4",0,0,2,(C,G,))).
body(x("c28-4",0,0,2,(C,G,)),adultOrder2Available(C)) :- inst(x("c28-4",0,0,2,(C,G,))).
superior(x("c28-4",0,0,2,(C,G,)),r("c28-4",0,0,(C,G,))) :- inst(x("c28-4",0,0,2,(C,G,))).
exc(x("c28-4",0,0,2,(C,G,)),r("c28-4",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-4",0,0,2,(C,G,))).
inst(x("c28-4",0,0,3,(C,G,))) :- inst(r("c28-4",0,0,(C,G,))), cand(adultOrder3Available(C)).
constitutiveRule(x("c28-4",0,0,3,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-4",0,0,3,(C,G,))).
body(x("c28-4",0,0,3,(C,G,)),incapableAdult(C)) :- inst(x("c28-4",0,0,3,(C,G,))).
body(x("c28-4",0,0,3,(C,G,)),willingToServe(G,C)) :- inst(x("c28-4",0,0,3,(C,G,))).
body(x("c28-4",0,0,3,(C,G,)),ableGuardian(G)) :- inst(x("c28-4",0,0,3,(C,G,))).
body(x("c28-4",0,0,3,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c28-4",0,0,3,(C,G,))).
body(x("c28-4",0,0,3,(C,G,)),adultOrder3Available(C)) :- inst(x("c28-4",0,0,3,(C,G,))).
superior(x("c28-4",0,0,3,(C,G,)),r("c28-4",0,0,(C,G,))) :- inst(x("c28-4",0,0,3,(C,G,))).
exc(x("c28-4",0,0,3,(C,G,)),r("c28-4",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-4",0,0,3,(C,G,))).
% c28-4[1.0] 前三顺序都没有的，由其他愿意担任监护人的个人或者组织担任，但须经被监护人住所地的居民委员会、村民委员会或者民政部门同意（第28条；npc）
inst(r("c28-4",1,0,(C,G,))) :- cand(incapableAdult(C)), cand(willingToServe(G,C)), cand(organization(G)), cand(approvedByLocalAuthority(G,C)).
constitutiveRule(r("c28-4",1,0,(C,G,)),guardianOf(G,C)) :- inst(r("c28-4",1,0,(C,G,))).
mainHead(r("c28-4",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c28-4",1,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c28-4",1,0,(C,G,))).
body(r("c28-4",1,0,(C,G,)),incapableAdult(C)) :- inst(r("c28-4",1,0,(C,G,))).
body(r("c28-4",1,0,(C,G,)),willingToServe(G,C)) :- inst(r("c28-4",1,0,(C,G,))).
body(r("c28-4",1,0,(C,G,)),organization(G)) :- inst(r("c28-4",1,0,(C,G,))).
body(r("c28-4",1,0,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(r("c28-4",1,0,(C,G,))).
inst(x("c28-4",1,0,0,(C,G,))) :- inst(r("c28-4",1,0,(C,G,))), cand(specialGuardianSet(C)).
constitutiveRule(x("c28-4",1,0,0,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-4",1,0,0,(C,G,))).
body(x("c28-4",1,0,0,(C,G,)),incapableAdult(C)) :- inst(x("c28-4",1,0,0,(C,G,))).
body(x("c28-4",1,0,0,(C,G,)),willingToServe(G,C)) :- inst(x("c28-4",1,0,0,(C,G,))).
body(x("c28-4",1,0,0,(C,G,)),organization(G)) :- inst(x("c28-4",1,0,0,(C,G,))).
body(x("c28-4",1,0,0,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c28-4",1,0,0,(C,G,))).
body(x("c28-4",1,0,0,(C,G,)),specialGuardianSet(C)) :- inst(x("c28-4",1,0,0,(C,G,))).
superior(x("c28-4",1,0,0,(C,G,)),r("c28-4",1,0,(C,G,))) :- inst(x("c28-4",1,0,0,(C,G,))).
exc(x("c28-4",1,0,0,(C,G,)),r("c28-4",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-4",1,0,0,(C,G,))).
inst(x("c28-4",1,0,1,(C,G,))) :- inst(r("c28-4",1,0,(C,G,))), cand(adultOrder1Available(C)).
constitutiveRule(x("c28-4",1,0,1,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-4",1,0,1,(C,G,))).
body(x("c28-4",1,0,1,(C,G,)),incapableAdult(C)) :- inst(x("c28-4",1,0,1,(C,G,))).
body(x("c28-4",1,0,1,(C,G,)),willingToServe(G,C)) :- inst(x("c28-4",1,0,1,(C,G,))).
body(x("c28-4",1,0,1,(C,G,)),organization(G)) :- inst(x("c28-4",1,0,1,(C,G,))).
body(x("c28-4",1,0,1,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c28-4",1,0,1,(C,G,))).
body(x("c28-4",1,0,1,(C,G,)),adultOrder1Available(C)) :- inst(x("c28-4",1,0,1,(C,G,))).
superior(x("c28-4",1,0,1,(C,G,)),r("c28-4",1,0,(C,G,))) :- inst(x("c28-4",1,0,1,(C,G,))).
exc(x("c28-4",1,0,1,(C,G,)),r("c28-4",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-4",1,0,1,(C,G,))).
inst(x("c28-4",1,0,2,(C,G,))) :- inst(r("c28-4",1,0,(C,G,))), cand(adultOrder2Available(C)).
constitutiveRule(x("c28-4",1,0,2,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-4",1,0,2,(C,G,))).
body(x("c28-4",1,0,2,(C,G,)),incapableAdult(C)) :- inst(x("c28-4",1,0,2,(C,G,))).
body(x("c28-4",1,0,2,(C,G,)),willingToServe(G,C)) :- inst(x("c28-4",1,0,2,(C,G,))).
body(x("c28-4",1,0,2,(C,G,)),organization(G)) :- inst(x("c28-4",1,0,2,(C,G,))).
body(x("c28-4",1,0,2,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c28-4",1,0,2,(C,G,))).
body(x("c28-4",1,0,2,(C,G,)),adultOrder2Available(C)) :- inst(x("c28-4",1,0,2,(C,G,))).
superior(x("c28-4",1,0,2,(C,G,)),r("c28-4",1,0,(C,G,))) :- inst(x("c28-4",1,0,2,(C,G,))).
exc(x("c28-4",1,0,2,(C,G,)),r("c28-4",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-4",1,0,2,(C,G,))).
inst(x("c28-4",1,0,3,(C,G,))) :- inst(r("c28-4",1,0,(C,G,))), cand(adultOrder3Available(C)).
constitutiveRule(x("c28-4",1,0,3,(C,G,)),non(guardianOf(G,C))) :- inst(x("c28-4",1,0,3,(C,G,))).
body(x("c28-4",1,0,3,(C,G,)),incapableAdult(C)) :- inst(x("c28-4",1,0,3,(C,G,))).
body(x("c28-4",1,0,3,(C,G,)),willingToServe(G,C)) :- inst(x("c28-4",1,0,3,(C,G,))).
body(x("c28-4",1,0,3,(C,G,)),organization(G)) :- inst(x("c28-4",1,0,3,(C,G,))).
body(x("c28-4",1,0,3,(C,G,)),approvedByLocalAuthority(G,C)) :- inst(x("c28-4",1,0,3,(C,G,))).
body(x("c28-4",1,0,3,(C,G,)),adultOrder3Available(C)) :- inst(x("c28-4",1,0,3,(C,G,))).
superior(x("c28-4",1,0,3,(C,G,)),r("c28-4",1,0,(C,G,))) :- inst(x("c28-4",1,0,3,(C,G,))).
exc(x("c28-4",1,0,3,(C,G,)),r("c28-4",1,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c28-4",1,0,3,(C,G,))).

% c29[0.0] 担任监护人的父母可以通过遗嘱指定监护人（第29条；npc）
inst(r("c29",0,0,(C,Pa,))) :- cand(parentOf(Pa,C)), cand(guardianOf(Pa,C)).
permissiveRule(r("c29",0,0,(C,Pa,)),designateGuardianByWill(Pa,C)) :- inst(r("c29",0,0,(C,Pa,))).
mainHead(r("c29",0,0,(C,Pa,)),permissiveRule,designateGuardianByWill(Pa,C)) :- inst(r("c29",0,0,(C,Pa,))).
cand(designateGuardianByWill(Pa,C)) :- inst(r("c29",0,0,(C,Pa,))).
body(r("c29",0,0,(C,Pa,)),parentOf(Pa,C)) :- inst(r("c29",0,0,(C,Pa,))).
body(r("c29",0,0,(C,Pa,)),guardianOf(Pa,C)) :- inst(r("c29",0,0,(C,Pa,))).

% c29-effect[0.0] 遗嘱生效时被指定的人同意担任的，为监护人；不同意的，依第27、28条确定（总则编解释第7条）（第29条；spc）
inst(r("c29-effect",0,0,(C,G,))) :- cand(designatedByParentsWill(G,C)), cand(agreesToServe(G,C)).
constitutiveRule(r("c29-effect",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c29-effect",0,0,(C,G,))).
mainHead(r("c29-effect",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c29-effect",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c29-effect",0,0,(C,G,))).
body(r("c29-effect",0,0,(C,G,)),designatedByParentsWill(G,C)) :- inst(r("c29-effect",0,0,(C,G,))).
body(r("c29-effect",0,0,(C,G,)),agreesToServe(G,C)) :- inst(r("c29-effect",0,0,(C,G,))).
inst(x("c29-effect",0,0,0,(C,G,))) :- inst(r("c29-effect",0,0,(C,G,))), cand(hasParentGuardian(C)).
constitutiveRule(x("c29-effect",0,0,0,(C,G,)),non(guardianOf(G,C))) :- inst(x("c29-effect",0,0,0,(C,G,))).
body(x("c29-effect",0,0,0,(C,G,)),designatedByParentsWill(G,C)) :- inst(x("c29-effect",0,0,0,(C,G,))).
body(x("c29-effect",0,0,0,(C,G,)),agreesToServe(G,C)) :- inst(x("c29-effect",0,0,0,(C,G,))).
body(x("c29-effect",0,0,0,(C,G,)),hasParentGuardian(C)) :- inst(x("c29-effect",0,0,0,(C,G,))).
superior(x("c29-effect",0,0,0,(C,G,)),r("c29-effect",0,0,(C,G,))) :- inst(x("c29-effect",0,0,0,(C,G,))).
exc(x("c29-effect",0,0,0,(C,G,)),r("c29-effect",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(x("c29-effect",0,0,0,(C,G,))).
% c29-effect[0.1] 遗嘱生效时被指定的人同意担任的，为监护人；不同意的，依第27、28条确定（总则编解释第7条）（第29条；spc）
inst(r("c29-effect",0,1,(C,G,))) :- cand(designatedByParentsWill(G,C)), cand(agreesToServe(G,C)).
constitutiveRule(r("c29-effect",0,1,(C,G,)),specialGuardianSet(C)) :- inst(r("c29-effect",0,1,(C,G,))).
mainHead(r("c29-effect",0,1,(C,G,)),constitutiveRule,specialGuardianSet(C)) :- inst(r("c29-effect",0,1,(C,G,))).
cand(specialGuardianSet(C)) :- inst(r("c29-effect",0,1,(C,G,))).
body(r("c29-effect",0,1,(C,G,)),designatedByParentsWill(G,C)) :- inst(r("c29-effect",0,1,(C,G,))).
body(r("c29-effect",0,1,(C,G,)),agreesToServe(G,C)) :- inst(r("c29-effect",0,1,(C,G,))).
inst(x("c29-effect",0,1,0,(C,G,))) :- inst(r("c29-effect",0,1,(C,G,))), cand(hasParentGuardian(C)).
constitutiveRule(x("c29-effect",0,1,0,(C,G,)),non(specialGuardianSet(C))) :- inst(x("c29-effect",0,1,0,(C,G,))).
body(x("c29-effect",0,1,0,(C,G,)),designatedByParentsWill(G,C)) :- inst(x("c29-effect",0,1,0,(C,G,))).
body(x("c29-effect",0,1,0,(C,G,)),agreesToServe(G,C)) :- inst(x("c29-effect",0,1,0,(C,G,))).
body(x("c29-effect",0,1,0,(C,G,)),hasParentGuardian(C)) :- inst(x("c29-effect",0,1,0,(C,G,))).
superior(x("c29-effect",0,1,0,(C,G,)),r("c29-effect",0,1,(C,G,))) :- inst(x("c29-effect",0,1,0,(C,G,))).
exc(x("c29-effect",0,1,0,(C,G,)),r("c29-effect",0,1,(C,G,)),constitutiveRule,specialGuardianSet(C)) :- inst(x("c29-effect",0,1,0,(C,G,))).

% c30[0.0] 依法具有监护资格的人之间可以协议确定监护人（第30条；npc）
inst(r("c30",0,0,(C,G,))) :- cand(agreedGuardian(G,C)), cand(eligibleGuardian(G,C)).
constitutiveRule(r("c30",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c30",0,0,(C,G,))).
mainHead(r("c30",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c30",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c30",0,0,(C,G,))).
body(r("c30",0,0,(C,G,)),agreedGuardian(G,C)) :- inst(r("c30",0,0,(C,G,))).
body(r("c30",0,0,(C,G,)),eligibleGuardian(G,C)) :- inst(r("c30",0,0,(C,G,))).
% c30[0.1] 依法具有监护资格的人之间可以协议确定监护人（第30条；npc）
inst(r("c30",0,1,(C,G,))) :- cand(agreedGuardian(G,C)), cand(eligibleGuardian(G,C)).
constitutiveRule(r("c30",0,1,(C,G,)),specialGuardianSet(C)) :- inst(r("c30",0,1,(C,G,))).
mainHead(r("c30",0,1,(C,G,)),constitutiveRule,specialGuardianSet(C)) :- inst(r("c30",0,1,(C,G,))).
cand(specialGuardianSet(C)) :- inst(r("c30",0,1,(C,G,))).
body(r("c30",0,1,(C,G,)),agreedGuardian(G,C)) :- inst(r("c30",0,1,(C,G,))).
body(r("c30",0,1,(C,G,)),eligibleGuardian(G,C)) :- inst(r("c30",0,1,(C,G,))).

% c30-wish[0.0] 协议确定监护人应当尊重被监护人的真实意愿（第30条；npc）
inst(r("c30-wish",0,0,(C,G,))) :- cand(agreedGuardian(G,C)).
prescriptiveRule(r("c30-wish",0,0,(C,G,)),respectWardsWishes(G,C)) :- inst(r("c30-wish",0,0,(C,G,))).
mainHead(r("c30-wish",0,0,(C,G,)),prescriptiveRule,respectWardsWishes(G,C)) :- inst(r("c30-wish",0,0,(C,G,))).
cand(respectWardsWishes(G,C)) :- inst(r("c30-wish",0,0,(C,G,))).
body(r("c30-wish",0,0,(C,G,)),agreedGuardian(G,C)) :- inst(r("c30-wish",0,0,(C,G,))).

% c31-1[0.0] 对监护人的确定有争议的，由被监护人住所地的居民委员会、村民委员会或者民政部门指定监护人（第31条第1款；npc）
inst(r("c31-1",0,0,(C,O,))) :- cand(guardianDispute(C)), cand(localAuthority(O,C)).
permissiveRule(r("c31-1",0,0,(C,O,)),designateGuardian(O,C)) :- inst(r("c31-1",0,0,(C,O,))).
mainHead(r("c31-1",0,0,(C,O,)),permissiveRule,designateGuardian(O,C)) :- inst(r("c31-1",0,0,(C,O,))).
cand(designateGuardian(O,C)) :- inst(r("c31-1",0,0,(C,O,))).
body(r("c31-1",0,0,(C,O,)),guardianDispute(C)) :- inst(r("c31-1",0,0,(C,O,))).
body(r("c31-1",0,0,(C,O,)),localAuthority(O,C)) :- inst(r("c31-1",0,0,(C,O,))).

% c31-1-court[0.0] 有关当事人对指定不服的，或者直接，可以向人民法院申请指定监护人（第31条第1款；npc）
inst(r("c31-1-court",0,0,(A,C,))) :- cand(guardianDispute(C)), cand(concernedParty(A,C)).
permissiveRule(r("c31-1-court",0,0,(A,C,)),applyCourtDesignation(A,C)) :- inst(r("c31-1-court",0,0,(A,C,))).
mainHead(r("c31-1-court",0,0,(A,C,)),permissiveRule,applyCourtDesignation(A,C)) :- inst(r("c31-1-court",0,0,(A,C,))).
cand(applyCourtDesignation(A,C)) :- inst(r("c31-1-court",0,0,(A,C,))).
body(r("c31-1-court",0,0,(A,C,)),guardianDispute(C)) :- inst(r("c31-1-court",0,0,(A,C,))).
body(r("c31-1-court",0,0,(A,C,)),concernedParty(A,C)) :- inst(r("c31-1-court",0,0,(A,C,))).

% c31-2[0.0] 指定机关应当尊重被监护人的真实意愿，按照最有利于被监护人的原则在依法具有监护资格的人中指定（第31条第2款；npc）
inst(r("c31-2",0,0,(C,O,))) :- cand(designator(O,C)).
prescriptiveRule(r("c31-2",0,0,(C,O,)),designateAmongEligibleInBestInterest(O,C)) :- inst(r("c31-2",0,0,(C,O,))).
mainHead(r("c31-2",0,0,(C,O,)),prescriptiveRule,designateAmongEligibleInBestInterest(O,C)) :- inst(r("c31-2",0,0,(C,O,))).
cand(designateAmongEligibleInBestInterest(O,C)) :- inst(r("c31-2",0,0,(C,O,))).
body(r("c31-2",0,0,(C,O,)),designator(O,C)) :- inst(r("c31-2",0,0,(C,O,))).

% c31-3[0.0] 指定监护人前，被监护人的合法权益处于无人保护状态的，由被监护人住所地的居民委员会、村民委员会或者民政部门等担任临时监护人（第31条第3款；n
inst(r("c31-3",0,0,(C,O,))) :- cand(guardianDispute(C)), cand(unprotectedBeforeDesignation(C)), cand(localAuthority(O,C)).
constitutiveRule(r("c31-3",0,0,(C,O,)),temporaryGuardian(O,C)) :- inst(r("c31-3",0,0,(C,O,))).
mainHead(r("c31-3",0,0,(C,O,)),constitutiveRule,temporaryGuardian(O,C)) :- inst(r("c31-3",0,0,(C,O,))).
cand(temporaryGuardian(O,C)) :- inst(r("c31-3",0,0,(C,O,))).
body(r("c31-3",0,0,(C,O,)),guardianDispute(C)) :- inst(r("c31-3",0,0,(C,O,))).
body(r("c31-3",0,0,(C,O,)),unprotectedBeforeDesignation(C)) :- inst(r("c31-3",0,0,(C,O,))).
body(r("c31-3",0,0,(C,O,)),localAuthority(O,C)) :- inst(r("c31-3",0,0,(C,O,))).

% c31-designated[0.0] 被指定的人为监护人（第31条第1款；npc）
inst(r("c31-designated",0,0,(C,G,))) :- cand(designatedGuardian(G,C)).
constitutiveRule(r("c31-designated",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c31-designated",0,0,(C,G,))).
mainHead(r("c31-designated",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c31-designated",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c31-designated",0,0,(C,G,))).
body(r("c31-designated",0,0,(C,G,)),designatedGuardian(G,C)) :- inst(r("c31-designated",0,0,(C,G,))).
% c31-designated[0.1] 被指定的人为监护人（第31条第1款；npc）
inst(r("c31-designated",0,1,(C,G,))) :- cand(designatedGuardian(G,C)).
constitutiveRule(r("c31-designated",0,1,(C,G,)),specialGuardianSet(C)) :- inst(r("c31-designated",0,1,(C,G,))).
mainHead(r("c31-designated",0,1,(C,G,)),constitutiveRule,specialGuardianSet(C)) :- inst(r("c31-designated",0,1,(C,G,))).
cand(specialGuardianSet(C)) :- inst(r("c31-designated",0,1,(C,G,))).
body(r("c31-designated",0,1,(C,G,)),designatedGuardian(G,C)) :- inst(r("c31-designated",0,1,(C,G,))).

% c31-4[0.0] 监护人被指定后，不得擅自变更（第31条第4款；npc）
inst(r("c31-4",0,0,(C,G,))) :- cand(designatedGuardian(G,C)).
prescriptiveRule(r("c31-4",0,0,(C,G,)),non(changeGuardianUnilaterally(G,C))) :- inst(r("c31-4",0,0,(C,G,))).
mainHead(r("c31-4",0,0,(C,G,)),prescriptiveRule,non(changeGuardianUnilaterally(G,C))) :- inst(r("c31-4",0,0,(C,G,))).
cand(changeGuardianUnilaterally(G,C)) :- inst(r("c31-4",0,0,(C,G,))).
body(r("c31-4",0,0,(C,G,)),designatedGuardian(G,C)) :- inst(r("c31-4",0,0,(C,G,))).

% c31-4-liab[0.0] 擅自变更的，不免除被指定的监护人的责任（第31条第4款；npc）
inst(r("c31-4-liab",0,0,(C,G,))) :- cand(designatedGuardian(G,C)), cand(changedWithoutAuthorization(G,C)).
constitutiveRule(r("c31-4-liab",0,0,(C,G,)),non(releasedFromGuardianResponsibility(G,C))) :- inst(r("c31-4-liab",0,0,(C,G,))).
mainHead(r("c31-4-liab",0,0,(C,G,)),constitutiveRule,non(releasedFromGuardianResponsibility(G,C))) :- inst(r("c31-4-liab",0,0,(C,G,))).
cand(releasedFromGuardianResponsibility(G,C)) :- inst(r("c31-4-liab",0,0,(C,G,))).
body(r("c31-4-liab",0,0,(C,G,)),designatedGuardian(G,C)) :- inst(r("c31-4-liab",0,0,(C,G,))).
body(r("c31-4-liab",0,0,(C,G,)),changedWithoutAuthorization(G,C)) :- inst(r("c31-4-liab",0,0,(C,G,))).

% c-has-eligible[0.0] 存在依法具有监护资格的人（辅助）（第32条；npc）
inst(r("c-has-eligible",0,0,(C,G,))) :- cand(eligibleGuardian(G,C)).
constitutiveRule(r("c-has-eligible",0,0,(C,G,)),hasEligibleGuardian(C)) :- inst(r("c-has-eligible",0,0,(C,G,))).
mainHead(r("c-has-eligible",0,0,(C,G,)),constitutiveRule,hasEligibleGuardian(C)) :- inst(r("c-has-eligible",0,0,(C,G,))).
cand(hasEligibleGuardian(C)) :- inst(r("c-has-eligible",0,0,(C,G,))).
body(r("c-has-eligible",0,0,(C,G,)),eligibleGuardian(G,C)) :- inst(r("c-has-eligible",0,0,(C,G,))).

% c32[0.0] 没有依法具有监护资格的人的，监护人由民政部门担任（第32条；npc）
inst(r("c32",0,0,(C,))) :- cand(needsGuardian(C)).
constitutiveRule(r("c32",0,0,(C,)),guardianOf(civilAffairs,C)) :- inst(r("c32",0,0,(C,))).
mainHead(r("c32",0,0,(C,)),constitutiveRule,guardianOf(civilAffairs,C)) :- inst(r("c32",0,0,(C,))).
cand(guardianOf(civilAffairs,C)) :- inst(r("c32",0,0,(C,))).
body(r("c32",0,0,(C,)),needsGuardian(C)) :- inst(r("c32",0,0,(C,))).
inst(x("c32",0,0,0,(C,))) :- inst(r("c32",0,0,(C,))), cand(hasEligibleGuardian(C)).
constitutiveRule(x("c32",0,0,0,(C,)),non(guardianOf(civilAffairs,C))) :- inst(x("c32",0,0,0,(C,))).
body(x("c32",0,0,0,(C,)),needsGuardian(C)) :- inst(x("c32",0,0,0,(C,))).
body(x("c32",0,0,0,(C,)),hasEligibleGuardian(C)) :- inst(x("c32",0,0,0,(C,))).
superior(x("c32",0,0,0,(C,)),r("c32",0,0,(C,))) :- inst(x("c32",0,0,0,(C,))).
exc(x("c32",0,0,0,(C,)),r("c32",0,0,(C,)),constitutiveRule,guardianOf(civilAffairs,C)) :- inst(x("c32",0,0,0,(C,))).

% c32-committee[0.0] 也可以由具备履行监护职责条件的被监护人住所地的居民委员会、村民委员会担任（第32条；npc）
inst(r("c32-committee",0,0,(C,O,))) :- cand(needsGuardian(C)), cand(committeeAbleToServe(O,C)).
permissiveRule(r("c32-committee",0,0,(C,O,)),serveAsGuardian(O,C)) :- inst(r("c32-committee",0,0,(C,O,))).
mainHead(r("c32-committee",0,0,(C,O,)),permissiveRule,serveAsGuardian(O,C)) :- inst(r("c32-committee",0,0,(C,O,))).
cand(serveAsGuardian(O,C)) :- inst(r("c32-committee",0,0,(C,O,))).
body(r("c32-committee",0,0,(C,O,)),needsGuardian(C)) :- inst(r("c32-committee",0,0,(C,O,))).
body(r("c32-committee",0,0,(C,O,)),committeeAbleToServe(O,C)) :- inst(r("c32-committee",0,0,(C,O,))).
inst(x("c32-committee",0,0,0,(C,O,))) :- inst(r("c32-committee",0,0,(C,O,))), cand(hasEligibleGuardian(C)).
prescriptiveRule(x("c32-committee",0,0,0,(C,O,)),non(serveAsGuardian(O,C))) :- inst(x("c32-committee",0,0,0,(C,O,))).
body(x("c32-committee",0,0,0,(C,O,)),needsGuardian(C)) :- inst(x("c32-committee",0,0,0,(C,O,))).
body(x("c32-committee",0,0,0,(C,O,)),committeeAbleToServe(O,C)) :- inst(x("c32-committee",0,0,0,(C,O,))).
body(x("c32-committee",0,0,0,(C,O,)),hasEligibleGuardian(C)) :- inst(x("c32-committee",0,0,0,(C,O,))).
superior(x("c32-committee",0,0,0,(C,O,)),r("c32-committee",0,0,(C,O,))) :- inst(x("c32-committee",0,0,0,(C,O,))).
exc(x("c32-committee",0,0,0,(C,O,)),r("c32-committee",0,0,(C,O,)),permissiveRule,serveAsGuardian(O,C)) :- inst(x("c32-committee",0,0,0,(C,O,))).

% c33[0.0] 完全民事行为能力的成年人可以书面事先确定监护人，在其丧失或者部分丧失民事行为能力时，由该监护人履行监护职责（第33条；npc）
inst(r("c33",0,0,(G,P,))) :- cand(adult(P)), cand(writtenVoluntaryGuardianAgreement(G,P)), cand(madeWhileFullyCapable(P)), cand(noCapacity(P)).
constitutiveRule(r("c33",0,0,(G,P,)),guardianOf(G,P)) :- inst(r("c33",0,0,(G,P,))).
mainHead(r("c33",0,0,(G,P,)),constitutiveRule,guardianOf(G,P)) :- inst(r("c33",0,0,(G,P,))).
cand(guardianOf(G,P)) :- inst(r("c33",0,0,(G,P,))).
body(r("c33",0,0,(G,P,)),adult(P)) :- inst(r("c33",0,0,(G,P,))).
body(r("c33",0,0,(G,P,)),writtenVoluntaryGuardianAgreement(G,P)) :- inst(r("c33",0,0,(G,P,))).
body(r("c33",0,0,(G,P,)),madeWhileFullyCapable(P)) :- inst(r("c33",0,0,(G,P,))).
body(r("c33",0,0,(G,P,)),noCapacity(P)) :- inst(r("c33",0,0,(G,P,))).
% c33[0.1] 完全民事行为能力的成年人可以书面事先确定监护人，在其丧失或者部分丧失民事行为能力时，由该监护人履行监护职责（第33条；npc）
inst(r("c33",0,1,(G,P,))) :- cand(adult(P)), cand(writtenVoluntaryGuardianAgreement(G,P)), cand(madeWhileFullyCapable(P)), cand(noCapacity(P)).
constitutiveRule(r("c33",0,1,(G,P,)),specialGuardianSet(P)) :- inst(r("c33",0,1,(G,P,))).
mainHead(r("c33",0,1,(G,P,)),constitutiveRule,specialGuardianSet(P)) :- inst(r("c33",0,1,(G,P,))).
cand(specialGuardianSet(P)) :- inst(r("c33",0,1,(G,P,))).
body(r("c33",0,1,(G,P,)),adult(P)) :- inst(r("c33",0,1,(G,P,))).
body(r("c33",0,1,(G,P,)),writtenVoluntaryGuardianAgreement(G,P)) :- inst(r("c33",0,1,(G,P,))).
body(r("c33",0,1,(G,P,)),madeWhileFullyCapable(P)) :- inst(r("c33",0,1,(G,P,))).
body(r("c33",0,1,(G,P,)),noCapacity(P)) :- inst(r("c33",0,1,(G,P,))).
% c33[1.0] 完全民事行为能力的成年人可以书面事先确定监护人，在其丧失或者部分丧失民事行为能力时，由该监护人履行监护职责（第33条；npc）
inst(r("c33",1,0,(G,P,))) :- cand(adult(P)), cand(writtenVoluntaryGuardianAgreement(G,P)), cand(madeWhileFullyCapable(P)), cand(limitedCapacity(P)).
constitutiveRule(r("c33",1,0,(G,P,)),guardianOf(G,P)) :- inst(r("c33",1,0,(G,P,))).
mainHead(r("c33",1,0,(G,P,)),constitutiveRule,guardianOf(G,P)) :- inst(r("c33",1,0,(G,P,))).
cand(guardianOf(G,P)) :- inst(r("c33",1,0,(G,P,))).
body(r("c33",1,0,(G,P,)),adult(P)) :- inst(r("c33",1,0,(G,P,))).
body(r("c33",1,0,(G,P,)),writtenVoluntaryGuardianAgreement(G,P)) :- inst(r("c33",1,0,(G,P,))).
body(r("c33",1,0,(G,P,)),madeWhileFullyCapable(P)) :- inst(r("c33",1,0,(G,P,))).
body(r("c33",1,0,(G,P,)),limitedCapacity(P)) :- inst(r("c33",1,0,(G,P,))).
% c33[1.1] 完全民事行为能力的成年人可以书面事先确定监护人，在其丧失或者部分丧失民事行为能力时，由该监护人履行监护职责（第33条；npc）
inst(r("c33",1,1,(G,P,))) :- cand(adult(P)), cand(writtenVoluntaryGuardianAgreement(G,P)), cand(madeWhileFullyCapable(P)), cand(limitedCapacity(P)).
constitutiveRule(r("c33",1,1,(G,P,)),specialGuardianSet(P)) :- inst(r("c33",1,1,(G,P,))).
mainHead(r("c33",1,1,(G,P,)),constitutiveRule,specialGuardianSet(P)) :- inst(r("c33",1,1,(G,P,))).
cand(specialGuardianSet(P)) :- inst(r("c33",1,1,(G,P,))).
body(r("c33",1,1,(G,P,)),adult(P)) :- inst(r("c33",1,1,(G,P,))).
body(r("c33",1,1,(G,P,)),writtenVoluntaryGuardianAgreement(G,P)) :- inst(r("c33",1,1,(G,P,))).
body(r("c33",1,1,(G,P,)),madeWhileFullyCapable(P)) :- inst(r("c33",1,1,(G,P,))).
body(r("c33",1,1,(G,P,)),limitedCapacity(P)) :- inst(r("c33",1,1,(G,P,))).

% c34-1[0.0] 监护人的职责是代理被监护人实施民事法律行为，保护其人身权利、财产权利以及其他合法权益（第34条第1款；npc）
inst(r("c34-1",0,0,(C,G,))) :- cand(guardianOf(G,C)).
prescriptiveRule(r("c34-1",0,0,(C,G,)),representAndProtectWard(G,C)) :- inst(r("c34-1",0,0,(C,G,))).
mainHead(r("c34-1",0,0,(C,G,)),prescriptiveRule,representAndProtectWard(G,C)) :- inst(r("c34-1",0,0,(C,G,))).
cand(representAndProtectWard(G,C)) :- inst(r("c34-1",0,0,(C,G,))).
body(r("c34-1",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c34-1",0,0,(C,G,))).

% c34-3[0.0] 监护人不履行监护职责或者侵害被监护人合法权益的，应当承担法律责任（第34条第3款；npc）
inst(r("c34-3",0,0,(C,G,))) :- cand(guardianOf(G,C)), cand(failsGuardianDuty(G,C)).
constitutiveRule(r("c34-3",0,0,(C,G,)),bearsLegalLiability(G,C)) :- inst(r("c34-3",0,0,(C,G,))).
mainHead(r("c34-3",0,0,(C,G,)),constitutiveRule,bearsLegalLiability(G,C)) :- inst(r("c34-3",0,0,(C,G,))).
cand(bearsLegalLiability(G,C)) :- inst(r("c34-3",0,0,(C,G,))).
body(r("c34-3",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c34-3",0,0,(C,G,))).
body(r("c34-3",0,0,(C,G,)),failsGuardianDuty(G,C)) :- inst(r("c34-3",0,0,(C,G,))).
% c34-3[1.0] 监护人不履行监护职责或者侵害被监护人合法权益的，应当承担法律责任（第34条第3款；npc）
inst(r("c34-3",1,0,(C,G,))) :- cand(guardianOf(G,C)), cand(infringesWardRights(G,C)).
constitutiveRule(r("c34-3",1,0,(C,G,)),bearsLegalLiability(G,C)) :- inst(r("c34-3",1,0,(C,G,))).
mainHead(r("c34-3",1,0,(C,G,)),constitutiveRule,bearsLegalLiability(G,C)) :- inst(r("c34-3",1,0,(C,G,))).
cand(bearsLegalLiability(G,C)) :- inst(r("c34-3",1,0,(C,G,))).
body(r("c34-3",1,0,(C,G,)),guardianOf(G,C)) :- inst(r("c34-3",1,0,(C,G,))).
body(r("c34-3",1,0,(C,G,)),infringesWardRights(G,C)) :- inst(r("c34-3",1,0,(C,G,))).

% c35-best[0.0] 监护人应当按照最有利于被监护人的原则履行监护职责（第35条第1款；npc）
inst(r("c35-best",0,0,(C,G,))) :- cand(guardianOf(G,C)).
prescriptiveRule(r("c35-best",0,0,(C,G,)),actInWardsBestInterest(G,C)) :- inst(r("c35-best",0,0,(C,G,))).
mainHead(r("c35-best",0,0,(C,G,)),prescriptiveRule,actInWardsBestInterest(G,C)) :- inst(r("c35-best",0,0,(C,G,))).
cand(actInWardsBestInterest(G,C)) :- inst(r("c35-best",0,0,(C,G,))).
body(r("c35-best",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c35-best",0,0,(C,G,))).

% c34-4[0.0] 因突发事件等紧急情况被监护人无人照料的，被监护人住所地的居民委员会、村民委员会或者民政部门应当安排必要的临时生活照料措施（第34条第4款；n
inst(r("c34-4",0,0,(C,G,O,))) :- cand(guardianOf(G,C)), cand(guardianTemporarilyUnableByEmergency(G,C)), cand(wardUnattended(C)), cand(localAuthority(O,C)).
prescriptiveRule(r("c34-4",0,0,(C,G,O,)),arrangeTemporaryCare(O,C)) :- inst(r("c34-4",0,0,(C,G,O,))).
mainHead(r("c34-4",0,0,(C,G,O,)),prescriptiveRule,arrangeTemporaryCare(O,C)) :- inst(r("c34-4",0,0,(C,G,O,))).
cand(arrangeTemporaryCare(O,C)) :- inst(r("c34-4",0,0,(C,G,O,))).
body(r("c34-4",0,0,(C,G,O,)),guardianOf(G,C)) :- inst(r("c34-4",0,0,(C,G,O,))).
body(r("c34-4",0,0,(C,G,O,)),guardianTemporarilyUnableByEmergency(G,C)) :- inst(r("c34-4",0,0,(C,G,O,))).
body(r("c34-4",0,0,(C,G,O,)),wardUnattended(C)) :- inst(r("c34-4",0,0,(C,G,O,))).
body(r("c34-4",0,0,(C,G,O,)),localAuthority(O,C)) :- inst(r("c34-4",0,0,(C,G,O,))).

% c35-dispose[0.0] 监护人除为维护被监护人利益外，不得处分被监护人的财产（第35条第1款；npc）
inst(r("c35-dispose",0,0,(C,G,))) :- cand(guardianOf(G,C)).
prescriptiveRule(r("c35-dispose",0,0,(C,G,)),non(disposeWardProperty(G,C))) :- inst(r("c35-dispose",0,0,(C,G,))).
mainHead(r("c35-dispose",0,0,(C,G,)),prescriptiveRule,non(disposeWardProperty(G,C))) :- inst(r("c35-dispose",0,0,(C,G,))).
cand(disposeWardProperty(G,C)) :- inst(r("c35-dispose",0,0,(C,G,))).
body(r("c35-dispose",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c35-dispose",0,0,(C,G,))).
inst(x("c35-dispose",0,0,0,(C,G,))) :- inst(r("c35-dispose",0,0,(C,G,))), cand(forWardsInterest(G,C)).
permissiveRule(x("c35-dispose",0,0,0,(C,G,)),disposeWardProperty(G,C)) :- inst(x("c35-dispose",0,0,0,(C,G,))).
body(x("c35-dispose",0,0,0,(C,G,)),guardianOf(G,C)) :- inst(x("c35-dispose",0,0,0,(C,G,))).
body(x("c35-dispose",0,0,0,(C,G,)),forWardsInterest(G,C)) :- inst(x("c35-dispose",0,0,0,(C,G,))).
superior(x("c35-dispose",0,0,0,(C,G,)),r("c35-dispose",0,0,(C,G,))) :- inst(x("c35-dispose",0,0,0,(C,G,))).
exc(x("c35-dispose",0,0,0,(C,G,)),r("c35-dispose",0,0,(C,G,)),prescriptiveRule,non(disposeWardProperty(G,C))) :- inst(x("c35-dispose",0,0,0,(C,G,))).

% c35-minor[0.0] 未成年人的监护人作出与被监护人利益有关的决定时，应当根据其年龄和智力状况尊重其真实意愿（第35条第2款；npc）
inst(r("c35-minor",0,0,(C,G,))) :- cand(guardianOf(G,C)), cand(minor(C)), cand(decisionAffectingWard(G,C)).
prescriptiveRule(r("c35-minor",0,0,(C,G,)),respectWishesByAgeAndIntellect(G,C)) :- inst(r("c35-minor",0,0,(C,G,))).
mainHead(r("c35-minor",0,0,(C,G,)),prescriptiveRule,respectWishesByAgeAndIntellect(G,C)) :- inst(r("c35-minor",0,0,(C,G,))).
cand(respectWishesByAgeAndIntellect(G,C)) :- inst(r("c35-minor",0,0,(C,G,))).
body(r("c35-minor",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c35-minor",0,0,(C,G,))).
body(r("c35-minor",0,0,(C,G,)),minor(C)) :- inst(r("c35-minor",0,0,(C,G,))).
body(r("c35-minor",0,0,(C,G,)),decisionAffectingWard(G,C)) :- inst(r("c35-minor",0,0,(C,G,))).

% c35-adult[0.0] 成年人的监护人应当最大程度地尊重被监护人的真实意愿，保障并协助其实施相适应的民事法律行为（第35条第3款；npc）
inst(r("c35-adult",0,0,(C,G,))) :- cand(guardianOf(G,C)), cand(adult(C)).
prescriptiveRule(r("c35-adult",0,0,(C,G,)),respectWishesToMaximum(G,C)) :- inst(r("c35-adult",0,0,(C,G,))).
mainHead(r("c35-adult",0,0,(C,G,)),prescriptiveRule,respectWishesToMaximum(G,C)) :- inst(r("c35-adult",0,0,(C,G,))).
cand(respectWishesToMaximum(G,C)) :- inst(r("c35-adult",0,0,(C,G,))).
body(r("c35-adult",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c35-adult",0,0,(C,G,))).
body(r("c35-adult",0,0,(C,G,)),adult(C)) :- inst(r("c35-adult",0,0,(C,G,))).

% c35-noninterf[0.0] 对被监护人有能力独立处理的事务，监护人不得干涉（第35条第3款；npc）
inst(r("c35-noninterf",0,0,(C,G,M,))) :- cand(guardianOf(G,C)), cand(adult(C)), cand(wardCanHandleAlone(C,M)).
prescriptiveRule(r("c35-noninterf",0,0,(C,G,M,)),non(interfereInAffair(G,C,M))) :- inst(r("c35-noninterf",0,0,(C,G,M,))).
mainHead(r("c35-noninterf",0,0,(C,G,M,)),prescriptiveRule,non(interfereInAffair(G,C,M))) :- inst(r("c35-noninterf",0,0,(C,G,M,))).
cand(interfereInAffair(G,C,M)) :- inst(r("c35-noninterf",0,0,(C,G,M,))).
body(r("c35-noninterf",0,0,(C,G,M,)),guardianOf(G,C)) :- inst(r("c35-noninterf",0,0,(C,G,M,))).
body(r("c35-noninterf",0,0,(C,G,M,)),adult(C)) :- inst(r("c35-noninterf",0,0,(C,G,M,))).
body(r("c35-noninterf",0,0,(C,G,M,)),wardCanHandleAlone(C,M)) :- inst(r("c35-noninterf",0,0,(C,G,M,))).

% c36-ground[0.0] 撤销事由：严重损害被监护人身心健康；怠于或无法履行且拒绝委托致其危困；其他严重侵害其合法权益的行为（第36条第1款；npc）
inst(r("c36-ground",0,0,(C,G,))) :- cand(guardianOf(G,C)), cand(seriouslyHarmsWard(G,C)).
constitutiveRule(r("c36-ground",0,0,(C,G,)),guardianshipRevocationGround(G,C)) :- inst(r("c36-ground",0,0,(C,G,))).
mainHead(r("c36-ground",0,0,(C,G,)),constitutiveRule,guardianshipRevocationGround(G,C)) :- inst(r("c36-ground",0,0,(C,G,))).
cand(guardianshipRevocationGround(G,C)) :- inst(r("c36-ground",0,0,(C,G,))).
body(r("c36-ground",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c36-ground",0,0,(C,G,))).
body(r("c36-ground",0,0,(C,G,)),seriouslyHarmsWard(G,C)) :- inst(r("c36-ground",0,0,(C,G,))).
% c36-ground[1.0] 撤销事由：严重损害被监护人身心健康；怠于或无法履行且拒绝委托致其危困；其他严重侵害其合法权益的行为（第36条第1款；npc）
inst(r("c36-ground",1,0,(C,G,))) :- cand(guardianOf(G,C)), cand(neglectOrRefusalLeavesWardInDistress(G,C)).
constitutiveRule(r("c36-ground",1,0,(C,G,)),guardianshipRevocationGround(G,C)) :- inst(r("c36-ground",1,0,(C,G,))).
mainHead(r("c36-ground",1,0,(C,G,)),constitutiveRule,guardianshipRevocationGround(G,C)) :- inst(r("c36-ground",1,0,(C,G,))).
cand(guardianshipRevocationGround(G,C)) :- inst(r("c36-ground",1,0,(C,G,))).
body(r("c36-ground",1,0,(C,G,)),guardianOf(G,C)) :- inst(r("c36-ground",1,0,(C,G,))).
body(r("c36-ground",1,0,(C,G,)),neglectOrRefusalLeavesWardInDistress(G,C)) :- inst(r("c36-ground",1,0,(C,G,))).
% c36-ground[2.0] 撤销事由：严重损害被监护人身心健康；怠于或无法履行且拒绝委托致其危困；其他严重侵害其合法权益的行为（第36条第1款；npc）
inst(r("c36-ground",2,0,(C,G,))) :- cand(guardianOf(G,C)), cand(otherSeriousInfringement(G,C)).
constitutiveRule(r("c36-ground",2,0,(C,G,)),guardianshipRevocationGround(G,C)) :- inst(r("c36-ground",2,0,(C,G,))).
mainHead(r("c36-ground",2,0,(C,G,)),constitutiveRule,guardianshipRevocationGround(G,C)) :- inst(r("c36-ground",2,0,(C,G,))).
cand(guardianshipRevocationGround(G,C)) :- inst(r("c36-ground",2,0,(C,G,))).
body(r("c36-ground",2,0,(C,G,)),guardianOf(G,C)) :- inst(r("c36-ground",2,0,(C,G,))).
body(r("c36-ground",2,0,(C,G,)),otherSeriousInfringement(G,C)) :- inst(r("c36-ground",2,0,(C,G,))).

% c36-1[0.0] 有撤销事由的，人民法院根据有关个人或者组织的申请，撤销其监护人资格（第36条第1款；npc）
inst(r("c36-1",0,0,(C,G,))) :- cand(guardianshipRevocationGround(G,C)), cand(revocationApplied(G,C)).
prescriptiveRule(r("c36-1",0,0,(C,G,)),revokeGuardianship(G,C)) :- inst(r("c36-1",0,0,(C,G,))).
mainHead(r("c36-1",0,0,(C,G,)),prescriptiveRule,revokeGuardianship(G,C)) :- inst(r("c36-1",0,0,(C,G,))).
cand(revokeGuardianship(G,C)) :- inst(r("c36-1",0,0,(C,G,))).
body(r("c36-1",0,0,(C,G,)),guardianshipRevocationGround(G,C)) :- inst(r("c36-1",0,0,(C,G,))).
body(r("c36-1",0,0,(C,G,)),revocationApplied(G,C)) :- inst(r("c36-1",0,0,(C,G,))).

% c36-2[0.0] 可以申请撤销的有关个人、组织（第36条第2款；npc）
inst(r("c36-2",0,0,(C,O,))) :- cand(concernsWard(O,C)), cand(eligibleGuardian(O,C)).
constitutiveRule(r("c36-2",0,0,(C,O,)),qualifiedRevocationApplicant(O,C)) :- inst(r("c36-2",0,0,(C,O,))).
mainHead(r("c36-2",0,0,(C,O,)),constitutiveRule,qualifiedRevocationApplicant(O,C)) :- inst(r("c36-2",0,0,(C,O,))).
cand(qualifiedRevocationApplicant(O,C)) :- inst(r("c36-2",0,0,(C,O,))).
body(r("c36-2",0,0,(C,O,)),concernsWard(O,C)) :- inst(r("c36-2",0,0,(C,O,))).
body(r("c36-2",0,0,(C,O,)),eligibleGuardian(O,C)) :- inst(r("c36-2",0,0,(C,O,))).
% c36-2[1.0] 可以申请撤销的有关个人、组织（第36条第2款；npc）
inst(r("c36-2",1,0,(C,O,))) :- cand(concernsWard(O,C)), cand(relevantOrg(O)).
constitutiveRule(r("c36-2",1,0,(C,O,)),qualifiedRevocationApplicant(O,C)) :- inst(r("c36-2",1,0,(C,O,))).
mainHead(r("c36-2",1,0,(C,O,)),constitutiveRule,qualifiedRevocationApplicant(O,C)) :- inst(r("c36-2",1,0,(C,O,))).
cand(qualifiedRevocationApplicant(O,C)) :- inst(r("c36-2",1,0,(C,O,))).
body(r("c36-2",1,0,(C,O,)),concernsWard(O,C)) :- inst(r("c36-2",1,0,(C,O,))).
body(r("c36-2",1,0,(C,O,)),relevantOrg(O)) :- inst(r("c36-2",1,0,(C,O,))).
% c36-2[2.0] 可以申请撤销的有关个人、组织（第36条第2款；npc）
inst(r("c36-2",2,0,(C,O,))) :- cand(concernsWard(O,C)), cand(minorsProtectionOrg(O)).
constitutiveRule(r("c36-2",2,0,(C,O,)),qualifiedRevocationApplicant(O,C)) :- inst(r("c36-2",2,0,(C,O,))).
mainHead(r("c36-2",2,0,(C,O,)),constitutiveRule,qualifiedRevocationApplicant(O,C)) :- inst(r("c36-2",2,0,(C,O,))).
cand(qualifiedRevocationApplicant(O,C)) :- inst(r("c36-2",2,0,(C,O,))).
body(r("c36-2",2,0,(C,O,)),concernsWard(O,C)) :- inst(r("c36-2",2,0,(C,O,))).
body(r("c36-2",2,0,(C,O,)),minorsProtectionOrg(O)) :- inst(r("c36-2",2,0,(C,O,))).

% c36-3[0.0] 其他个人和组织未及时申请的，民政部门应当向人民法院申请（第36条第3款；npc）
inst(r("c36-3",0,0,(C,G,))) :- cand(guardianshipRevocationGround(G,C)), cand(othersFailedToApplyInTime(C)).
prescriptiveRule(r("c36-3",0,0,(C,G,)),applyForRevocation(G,C)) :- inst(r("c36-3",0,0,(C,G,))).
mainHead(r("c36-3",0,0,(C,G,)),prescriptiveRule,applyForRevocation(G,C)) :- inst(r("c36-3",0,0,(C,G,))).
cand(applyForRevocation(G,C)) :- inst(r("c36-3",0,0,(C,G,))).
body(r("c36-3",0,0,(C,G,)),guardianshipRevocationGround(G,C)) :- inst(r("c36-3",0,0,(C,G,))).
body(r("c36-3",0,0,(C,G,)),othersFailedToApplyInTime(C)) :- inst(r("c36-3",0,0,(C,G,))).

% c36-after[0.0] 撤销后安排必要的临时监护措施，并按照最有利于被监护人的原则依法指定监护人（第36条第1款；npc）
inst(r("c36-after",0,0,(C,G,))) :- cand(guardianshipRevoked(G,C)).
prescriptiveRule(r("c36-after",0,0,(C,G,)),arrangeTemporaryMeasuresAndDesignate(C)) :- inst(r("c36-after",0,0,(C,G,))).
mainHead(r("c36-after",0,0,(C,G,)),prescriptiveRule,arrangeTemporaryMeasuresAndDesignate(C)) :- inst(r("c36-after",0,0,(C,G,))).
cand(arrangeTemporaryMeasuresAndDesignate(C)) :- inst(r("c36-after",0,0,(C,G,))).
body(r("c36-after",0,0,(C,G,)),guardianshipRevoked(G,C)) :- inst(r("c36-after",0,0,(C,G,))).

% c36-effect[0.0] 被撤销监护人资格的，不再是监护人（第36条第1款；npc）
inst(r("c36-effect",0,0,(C,G,))) :- cand(guardianshipRevoked(G,C)).
constitutiveRule(r("c36-effect",0,0,(C,G,)),non(guardianOf(G,C))) :- inst(r("c36-effect",0,0,(C,G,))).
mainHead(r("c36-effect",0,0,(C,G,)),constitutiveRule,non(guardianOf(G,C))) :- inst(r("c36-effect",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c36-effect",0,0,(C,G,))).
body(r("c36-effect",0,0,(C,G,)),guardianshipRevoked(G,C)) :- inst(r("c36-effect",0,0,(C,G,))).

% c37[0.0] 依法负担抚养费、赡养费、扶养费的父母、子女、配偶等，被撤销监护人资格后，应当继续履行负担的义务（第37条；npc）
inst(r("c37",0,0,(C,G,))) :- cand(guardianshipRevoked(G,C)), cand(owesMaintenance(G,C)).
prescriptiveRule(r("c37",0,0,(C,G,)),continuePayingMaintenance(G,C)) :- inst(r("c37",0,0,(C,G,))).
mainHead(r("c37",0,0,(C,G,)),prescriptiveRule,continuePayingMaintenance(G,C)) :- inst(r("c37",0,0,(C,G,))).
cand(continuePayingMaintenance(G,C)) :- inst(r("c37",0,0,(C,G,))).
body(r("c37",0,0,(C,G,)),guardianshipRevoked(G,C)) :- inst(r("c37",0,0,(C,G,))).
body(r("c37",0,0,(C,G,)),owesMaintenance(G,C)) :- inst(r("c37",0,0,(C,G,))).

% c38[0.0] 被撤销资格的父母或者子女，确有悔改表现的，经其申请，人民法院可以视情况恢复其监护人资格（对被监护人实施故意犯罪的除外）（第38条；npc）
inst(r("c38",0,0,(C,G,))) :- cand(guardianshipRevoked(G,C)), cand(parentOf(G,C)), cand(guardianRepented(G,C)), cand(appliedForRestoration(G,C)).
permissiveRule(r("c38",0,0,(C,G,)),restoreGuardianship(G,C)) :- inst(r("c38",0,0,(C,G,))).
mainHead(r("c38",0,0,(C,G,)),permissiveRule,restoreGuardianship(G,C)) :- inst(r("c38",0,0,(C,G,))).
cand(restoreGuardianship(G,C)) :- inst(r("c38",0,0,(C,G,))).
body(r("c38",0,0,(C,G,)),guardianshipRevoked(G,C)) :- inst(r("c38",0,0,(C,G,))).
body(r("c38",0,0,(C,G,)),parentOf(G,C)) :- inst(r("c38",0,0,(C,G,))).
body(r("c38",0,0,(C,G,)),guardianRepented(G,C)) :- inst(r("c38",0,0,(C,G,))).
body(r("c38",0,0,(C,G,)),appliedForRestoration(G,C)) :- inst(r("c38",0,0,(C,G,))).
inst(x("c38",0,0,0,(C,G,))) :- inst(r("c38",0,0,(C,G,))), cand(intentionalCrimeAgainstWard(G,C)).
prescriptiveRule(x("c38",0,0,0,(C,G,)),non(restoreGuardianship(G,C))) :- inst(x("c38",0,0,0,(C,G,))).
body(x("c38",0,0,0,(C,G,)),guardianshipRevoked(G,C)) :- inst(x("c38",0,0,0,(C,G,))).
body(x("c38",0,0,0,(C,G,)),parentOf(G,C)) :- inst(x("c38",0,0,0,(C,G,))).
body(x("c38",0,0,0,(C,G,)),guardianRepented(G,C)) :- inst(x("c38",0,0,0,(C,G,))).
body(x("c38",0,0,0,(C,G,)),appliedForRestoration(G,C)) :- inst(x("c38",0,0,0,(C,G,))).
body(x("c38",0,0,0,(C,G,)),intentionalCrimeAgainstWard(G,C)) :- inst(x("c38",0,0,0,(C,G,))).
superior(x("c38",0,0,0,(C,G,)),r("c38",0,0,(C,G,))) :- inst(x("c38",0,0,0,(C,G,))).
exc(x("c38",0,0,0,(C,G,)),r("c38",0,0,(C,G,)),permissiveRule,restoreGuardianship(G,C)) :- inst(x("c38",0,0,0,(C,G,))).
% c38[1.0] 被撤销资格的父母或者子女，确有悔改表现的，经其申请，人民法院可以视情况恢复其监护人资格（对被监护人实施故意犯罪的除外）（第38条；npc）
inst(r("c38",1,0,(C,G,))) :- cand(guardianshipRevoked(G,C)), cand(childOf(G,C)), cand(guardianRepented(G,C)), cand(appliedForRestoration(G,C)).
permissiveRule(r("c38",1,0,(C,G,)),restoreGuardianship(G,C)) :- inst(r("c38",1,0,(C,G,))).
mainHead(r("c38",1,0,(C,G,)),permissiveRule,restoreGuardianship(G,C)) :- inst(r("c38",1,0,(C,G,))).
cand(restoreGuardianship(G,C)) :- inst(r("c38",1,0,(C,G,))).
body(r("c38",1,0,(C,G,)),guardianshipRevoked(G,C)) :- inst(r("c38",1,0,(C,G,))).
body(r("c38",1,0,(C,G,)),childOf(G,C)) :- inst(r("c38",1,0,(C,G,))).
body(r("c38",1,0,(C,G,)),guardianRepented(G,C)) :- inst(r("c38",1,0,(C,G,))).
body(r("c38",1,0,(C,G,)),appliedForRestoration(G,C)) :- inst(r("c38",1,0,(C,G,))).
inst(x("c38",1,0,0,(C,G,))) :- inst(r("c38",1,0,(C,G,))), cand(intentionalCrimeAgainstWard(G,C)).
prescriptiveRule(x("c38",1,0,0,(C,G,)),non(restoreGuardianship(G,C))) :- inst(x("c38",1,0,0,(C,G,))).
body(x("c38",1,0,0,(C,G,)),guardianshipRevoked(G,C)) :- inst(x("c38",1,0,0,(C,G,))).
body(x("c38",1,0,0,(C,G,)),childOf(G,C)) :- inst(x("c38",1,0,0,(C,G,))).
body(x("c38",1,0,0,(C,G,)),guardianRepented(G,C)) :- inst(x("c38",1,0,0,(C,G,))).
body(x("c38",1,0,0,(C,G,)),appliedForRestoration(G,C)) :- inst(x("c38",1,0,0,(C,G,))).
body(x("c38",1,0,0,(C,G,)),intentionalCrimeAgainstWard(G,C)) :- inst(x("c38",1,0,0,(C,G,))).
superior(x("c38",1,0,0,(C,G,)),r("c38",1,0,(C,G,))) :- inst(x("c38",1,0,0,(C,G,))).
exc(x("c38",1,0,0,(C,G,)),r("c38",1,0,(C,G,)),permissiveRule,restoreGuardianship(G,C)) :- inst(x("c38",1,0,0,(C,G,))).

% c38-end[0.0] 恢复后，人民法院指定的监护人与被监护人的监护关系同时终止（第38条；npc）
inst(r("c38-end",0,0,(C,D,G,))) :- cand(guardianshipRestored(G,C)), cand(designatedGuardian(D,C)).
constitutiveRule(r("c38-end",0,0,(C,D,G,)),guardianshipTerminated(D,C)) :- inst(r("c38-end",0,0,(C,D,G,))).
mainHead(r("c38-end",0,0,(C,D,G,)),constitutiveRule,guardianshipTerminated(D,C)) :- inst(r("c38-end",0,0,(C,D,G,))).
cand(guardianshipTerminated(D,C)) :- inst(r("c38-end",0,0,(C,D,G,))).
body(r("c38-end",0,0,(C,D,G,)),guardianshipRestored(G,C)) :- inst(r("c38-end",0,0,(C,D,G,))).
body(r("c38-end",0,0,(C,D,G,)),designatedGuardian(D,C)) :- inst(r("c38-end",0,0,(C,D,G,))).

% c38-restored[0.0] 恢复监护人资格的，重新成为监护人（第38条；npc）
inst(r("c38-restored",0,0,(C,G,))) :- cand(guardianshipRestored(G,C)).
constitutiveRule(r("c38-restored",0,0,(C,G,)),guardianOf(G,C)) :- inst(r("c38-restored",0,0,(C,G,))).
mainHead(r("c38-restored",0,0,(C,G,)),constitutiveRule,guardianOf(G,C)) :- inst(r("c38-restored",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c38-restored",0,0,(C,G,))).
body(r("c38-restored",0,0,(C,G,)),guardianshipRestored(G,C)) :- inst(r("c38-restored",0,0,(C,G,))).

% c39-1[0.0] 被监护人取得或恢复完全民事行为能力、监护人丧失监护能力、一方死亡或者法院认定的其他情形，监护关系终止（第39条第1款；npc）
inst(r("c39-1",0,0,(C,G,))) :- cand(servedAsGuardian(G,C)), cand(fullCapacity(C)).
constitutiveRule(r("c39-1",0,0,(C,G,)),guardianshipTerminated(G,C)) :- inst(r("c39-1",0,0,(C,G,))).
mainHead(r("c39-1",0,0,(C,G,)),constitutiveRule,guardianshipTerminated(G,C)) :- inst(r("c39-1",0,0,(C,G,))).
cand(guardianshipTerminated(G,C)) :- inst(r("c39-1",0,0,(C,G,))).
body(r("c39-1",0,0,(C,G,)),servedAsGuardian(G,C)) :- inst(r("c39-1",0,0,(C,G,))).
body(r("c39-1",0,0,(C,G,)),fullCapacity(C)) :- inst(r("c39-1",0,0,(C,G,))).
% c39-1[1.0] 被监护人取得或恢复完全民事行为能力、监护人丧失监护能力、一方死亡或者法院认定的其他情形，监护关系终止（第39条第1款；npc）
inst(r("c39-1",1,0,(C,G,))) :- cand(servedAsGuardian(G,C)), cand(lostGuardianCapacity(G)).
constitutiveRule(r("c39-1",1,0,(C,G,)),guardianshipTerminated(G,C)) :- inst(r("c39-1",1,0,(C,G,))).
mainHead(r("c39-1",1,0,(C,G,)),constitutiveRule,guardianshipTerminated(G,C)) :- inst(r("c39-1",1,0,(C,G,))).
cand(guardianshipTerminated(G,C)) :- inst(r("c39-1",1,0,(C,G,))).
body(r("c39-1",1,0,(C,G,)),servedAsGuardian(G,C)) :- inst(r("c39-1",1,0,(C,G,))).
body(r("c39-1",1,0,(C,G,)),lostGuardianCapacity(G)) :- inst(r("c39-1",1,0,(C,G,))).
% c39-1[2.0] 被监护人取得或恢复完全民事行为能力、监护人丧失监护能力、一方死亡或者法院认定的其他情形，监护关系终止（第39条第1款；npc）
inst(r("c39-1",2,0,(C,G,))) :- cand(servedAsGuardian(G,C)), cand(died(C)).
constitutiveRule(r("c39-1",2,0,(C,G,)),guardianshipTerminated(G,C)) :- inst(r("c39-1",2,0,(C,G,))).
mainHead(r("c39-1",2,0,(C,G,)),constitutiveRule,guardianshipTerminated(G,C)) :- inst(r("c39-1",2,0,(C,G,))).
cand(guardianshipTerminated(G,C)) :- inst(r("c39-1",2,0,(C,G,))).
body(r("c39-1",2,0,(C,G,)),servedAsGuardian(G,C)) :- inst(r("c39-1",2,0,(C,G,))).
body(r("c39-1",2,0,(C,G,)),died(C)) :- inst(r("c39-1",2,0,(C,G,))).
% c39-1[3.0] 被监护人取得或恢复完全民事行为能力、监护人丧失监护能力、一方死亡或者法院认定的其他情形，监护关系终止（第39条第1款；npc）
inst(r("c39-1",3,0,(C,G,))) :- cand(servedAsGuardian(G,C)), cand(died(G)).
constitutiveRule(r("c39-1",3,0,(C,G,)),guardianshipTerminated(G,C)) :- inst(r("c39-1",3,0,(C,G,))).
mainHead(r("c39-1",3,0,(C,G,)),constitutiveRule,guardianshipTerminated(G,C)) :- inst(r("c39-1",3,0,(C,G,))).
cand(guardianshipTerminated(G,C)) :- inst(r("c39-1",3,0,(C,G,))).
body(r("c39-1",3,0,(C,G,)),servedAsGuardian(G,C)) :- inst(r("c39-1",3,0,(C,G,))).
body(r("c39-1",3,0,(C,G,)),died(G)) :- inst(r("c39-1",3,0,(C,G,))).
% c39-1[4.0] 被监护人取得或恢复完全民事行为能力、监护人丧失监护能力、一方死亡或者法院认定的其他情形，监护关系终止（第39条第1款；npc）
inst(r("c39-1",4,0,(C,G,))) :- cand(servedAsGuardian(G,C)), cand(courtFindsTermination(G,C)).
constitutiveRule(r("c39-1",4,0,(C,G,)),guardianshipTerminated(G,C)) :- inst(r("c39-1",4,0,(C,G,))).
mainHead(r("c39-1",4,0,(C,G,)),constitutiveRule,guardianshipTerminated(G,C)) :- inst(r("c39-1",4,0,(C,G,))).
cand(guardianshipTerminated(G,C)) :- inst(r("c39-1",4,0,(C,G,))).
body(r("c39-1",4,0,(C,G,)),servedAsGuardian(G,C)) :- inst(r("c39-1",4,0,(C,G,))).
body(r("c39-1",4,0,(C,G,)),courtFindsTermination(G,C)) :- inst(r("c39-1",4,0,(C,G,))).

% c39-end[0.0] 监护关系终止的，不再是监护人（第39条第1款；npc）
inst(r("c39-end",0,0,(C,G,))) :- cand(guardianshipTerminated(G,C)).
constitutiveRule(r("c39-end",0,0,(C,G,)),non(guardianOf(G,C))) :- inst(r("c39-end",0,0,(C,G,))).
mainHead(r("c39-end",0,0,(C,G,)),constitutiveRule,non(guardianOf(G,C))) :- inst(r("c39-end",0,0,(C,G,))).
cand(guardianOf(G,C)) :- inst(r("c39-end",0,0,(C,G,))).
body(r("c39-end",0,0,(C,G,)),guardianshipTerminated(G,C)) :- inst(r("c39-end",0,0,(C,G,))).

% c39-2[0.0] 监护关系终止后，被监护人仍然需要监护的，应当依法另行确定监护人（第39条第2款；npc）
inst(r("c39-2",0,0,(C,G,))) :- cand(guardianshipTerminated(G,C)), cand(needsGuardian(C)).
constitutiveRule(r("c39-2",0,0,(C,G,)),needsNewGuardian(C)) :- inst(r("c39-2",0,0,(C,G,))).
mainHead(r("c39-2",0,0,(C,G,)),constitutiveRule,needsNewGuardian(C)) :- inst(r("c39-2",0,0,(C,G,))).
cand(needsNewGuardian(C)) :- inst(r("c39-2",0,0,(C,G,))).
body(r("c39-2",0,0,(C,G,)),guardianshipTerminated(G,C)) :- inst(r("c39-2",0,0,(C,G,))).
body(r("c39-2",0,0,(C,G,)),needsGuardian(C)) :- inst(r("c39-2",0,0,(C,G,))).

% c40[0.0] 自然人下落不明满二年的，利害关系人可以申请宣告其为失踪人（第40条；npc）
inst(r("c40",0,0,(A,P,))) :- cand(missingFor2Years(P)), cand(interestedParty(A,P)).
permissiveRule(r("c40",0,0,(A,P,)),applyMissingDeclaration(A,P)) :- inst(r("c40",0,0,(A,P,))).
mainHead(r("c40",0,0,(A,P,)),permissiveRule,applyMissingDeclaration(A,P)) :- inst(r("c40",0,0,(A,P,))).
cand(applyMissingDeclaration(A,P)) :- inst(r("c40",0,0,(A,P,))).
body(r("c40",0,0,(A,P,)),missingFor2Years(P)) :- inst(r("c40",0,0,(A,P,))).
body(r("c40",0,0,(A,P,)),interestedParty(A,P)) :- inst(r("c40",0,0,(A,P,))).

% c41-1[0.0] 下落不明的时间自失去音讯之日起计算（第41条；npc）
inst(r("c41-1",0,0,(D,P,))) :- cand(lostContactOn(P,D)).
constitutiveRule(r("c41-1",0,0,(D,P,)),missingSince(P,D)) :- inst(r("c41-1",0,0,(D,P,))).
mainHead(r("c41-1",0,0,(D,P,)),constitutiveRule,missingSince(P,D)) :- inst(r("c41-1",0,0,(D,P,))).
cand(missingSince(P,D)) :- inst(r("c41-1",0,0,(D,P,))).
body(r("c41-1",0,0,(D,P,)),lostContactOn(P,D)) :- inst(r("c41-1",0,0,(D,P,))).
inst(x("c41-1",0,0,0,(D,P,))) :- inst(r("c41-1",0,0,(D,P,))), cand(missingDuringWar(P)).
constitutiveRule(x("c41-1",0,0,0,(D,P,)),non(missingSince(P,D))) :- inst(x("c41-1",0,0,0,(D,P,))).
body(x("c41-1",0,0,0,(D,P,)),lostContactOn(P,D)) :- inst(x("c41-1",0,0,0,(D,P,))).
body(x("c41-1",0,0,0,(D,P,)),missingDuringWar(P)) :- inst(x("c41-1",0,0,0,(D,P,))).
superior(x("c41-1",0,0,0,(D,P,)),r("c41-1",0,0,(D,P,))) :- inst(x("c41-1",0,0,0,(D,P,))).
exc(x("c41-1",0,0,0,(D,P,)),r("c41-1",0,0,(D,P,)),constitutiveRule,missingSince(P,D)) :- inst(x("c41-1",0,0,0,(D,P,))).

% c41-2[0.0] 战争期间下落不明的，自战争结束之日或者有关机关确定的下落不明之日起计算（第41条；npc）
inst(r("c41-2",0,0,(D,P,))) :- cand(missingDuringWar(P)), cand(warEndedFor(P,D)).
constitutiveRule(r("c41-2",0,0,(D,P,)),missingSince(P,D)) :- inst(r("c41-2",0,0,(D,P,))).
mainHead(r("c41-2",0,0,(D,P,)),constitutiveRule,missingSince(P,D)) :- inst(r("c41-2",0,0,(D,P,))).
cand(missingSince(P,D)) :- inst(r("c41-2",0,0,(D,P,))).
body(r("c41-2",0,0,(D,P,)),missingDuringWar(P)) :- inst(r("c41-2",0,0,(D,P,))).
body(r("c41-2",0,0,(D,P,)),warEndedFor(P,D)) :- inst(r("c41-2",0,0,(D,P,))).
% c41-2[1.0] 战争期间下落不明的，自战争结束之日或者有关机关确定的下落不明之日起计算（第41条；npc）
inst(r("c41-2",1,0,(D,P,))) :- cand(missingDuringWar(P)), cand(authorityDeterminedMissingDate(P,D)).
constitutiveRule(r("c41-2",1,0,(D,P,)),missingSince(P,D)) :- inst(r("c41-2",1,0,(D,P,))).
mainHead(r("c41-2",1,0,(D,P,)),constitutiveRule,missingSince(P,D)) :- inst(r("c41-2",1,0,(D,P,))).
cand(missingSince(P,D)) :- inst(r("c41-2",1,0,(D,P,))).
body(r("c41-2",1,0,(D,P,)),missingDuringWar(P)) :- inst(r("c41-2",1,0,(D,P,))).
body(r("c41-2",1,0,(D,P,)),authorityDeterminedMissingDate(P,D)) :- inst(r("c41-2",1,0,(D,P,))).

% c42-flag[0.0] 有第42条第1款规定的代管人（辅助）（第42条第2款；npc）
inst(r("c42-flag",0,0,(K,P,))) :- cand(custodianCandidate(K,P)).
constitutiveRule(r("c42-flag",0,0,(K,P,)),hasCustodianCandidate(P)) :- inst(r("c42-flag",0,0,(K,P,))).
mainHead(r("c42-flag",0,0,(K,P,)),constitutiveRule,hasCustodianCandidate(P)) :- inst(r("c42-flag",0,0,(K,P,))).
cand(hasCustodianCandidate(P)) :- inst(r("c42-flag",0,0,(K,P,))).
body(r("c42-flag",0,0,(K,P,)),custodianCandidate(K,P)) :- inst(r("c42-flag",0,0,(K,P,))).

% c42-1[0.0] 失踪人的财产由其配偶、成年子女、父母或者其他愿意担任财产代管人的人代管（第42条第1款；npc）
inst(r("c42-1",0,0,(K,P,))) :- cand(declaredMissing(P)), cand(spouseOf(K,P)).
constitutiveRule(r("c42-1",0,0,(K,P,)),custodianCandidate(K,P)) :- inst(r("c42-1",0,0,(K,P,))).
mainHead(r("c42-1",0,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(r("c42-1",0,0,(K,P,))).
cand(custodianCandidate(K,P)) :- inst(r("c42-1",0,0,(K,P,))).
body(r("c42-1",0,0,(K,P,)),declaredMissing(P)) :- inst(r("c42-1",0,0,(K,P,))).
body(r("c42-1",0,0,(K,P,)),spouseOf(K,P)) :- inst(r("c42-1",0,0,(K,P,))).
inst(x("c42-1",0,0,0,(K,P,))) :- inst(r("c42-1",0,0,(K,P,))), cand(custodyDispute(P)).
constitutiveRule(x("c42-1",0,0,0,(K,P,)),non(custodianCandidate(K,P))) :- inst(x("c42-1",0,0,0,(K,P,))).
body(x("c42-1",0,0,0,(K,P,)),declaredMissing(P)) :- inst(x("c42-1",0,0,0,(K,P,))).
body(x("c42-1",0,0,0,(K,P,)),spouseOf(K,P)) :- inst(x("c42-1",0,0,0,(K,P,))).
body(x("c42-1",0,0,0,(K,P,)),custodyDispute(P)) :- inst(x("c42-1",0,0,0,(K,P,))).
superior(x("c42-1",0,0,0,(K,P,)),r("c42-1",0,0,(K,P,))) :- inst(x("c42-1",0,0,0,(K,P,))).
exc(x("c42-1",0,0,0,(K,P,)),r("c42-1",0,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(x("c42-1",0,0,0,(K,P,))).
inst(x("c42-1",0,0,1,(K,P,))) :- inst(r("c42-1",0,0,(K,P,))), cand(lacksCustodyCapacity(K)).
constitutiveRule(x("c42-1",0,0,1,(K,P,)),non(custodianCandidate(K,P))) :- inst(x("c42-1",0,0,1,(K,P,))).
body(x("c42-1",0,0,1,(K,P,)),declaredMissing(P)) :- inst(x("c42-1",0,0,1,(K,P,))).
body(x("c42-1",0,0,1,(K,P,)),spouseOf(K,P)) :- inst(x("c42-1",0,0,1,(K,P,))).
body(x("c42-1",0,0,1,(K,P,)),lacksCustodyCapacity(K)) :- inst(x("c42-1",0,0,1,(K,P,))).
superior(x("c42-1",0,0,1,(K,P,)),r("c42-1",0,0,(K,P,))) :- inst(x("c42-1",0,0,1,(K,P,))).
exc(x("c42-1",0,0,1,(K,P,)),r("c42-1",0,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(x("c42-1",0,0,1,(K,P,))).
% c42-1[1.0] 失踪人的财产由其配偶、成年子女、父母或者其他愿意担任财产代管人的人代管（第42条第1款；npc）
inst(r("c42-1",1,0,(K,P,))) :- cand(declaredMissing(P)), cand(adultChildOf(K,P)).
constitutiveRule(r("c42-1",1,0,(K,P,)),custodianCandidate(K,P)) :- inst(r("c42-1",1,0,(K,P,))).
mainHead(r("c42-1",1,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(r("c42-1",1,0,(K,P,))).
cand(custodianCandidate(K,P)) :- inst(r("c42-1",1,0,(K,P,))).
body(r("c42-1",1,0,(K,P,)),declaredMissing(P)) :- inst(r("c42-1",1,0,(K,P,))).
body(r("c42-1",1,0,(K,P,)),adultChildOf(K,P)) :- inst(r("c42-1",1,0,(K,P,))).
inst(x("c42-1",1,0,0,(K,P,))) :- inst(r("c42-1",1,0,(K,P,))), cand(custodyDispute(P)).
constitutiveRule(x("c42-1",1,0,0,(K,P,)),non(custodianCandidate(K,P))) :- inst(x("c42-1",1,0,0,(K,P,))).
body(x("c42-1",1,0,0,(K,P,)),declaredMissing(P)) :- inst(x("c42-1",1,0,0,(K,P,))).
body(x("c42-1",1,0,0,(K,P,)),adultChildOf(K,P)) :- inst(x("c42-1",1,0,0,(K,P,))).
body(x("c42-1",1,0,0,(K,P,)),custodyDispute(P)) :- inst(x("c42-1",1,0,0,(K,P,))).
superior(x("c42-1",1,0,0,(K,P,)),r("c42-1",1,0,(K,P,))) :- inst(x("c42-1",1,0,0,(K,P,))).
exc(x("c42-1",1,0,0,(K,P,)),r("c42-1",1,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(x("c42-1",1,0,0,(K,P,))).
inst(x("c42-1",1,0,1,(K,P,))) :- inst(r("c42-1",1,0,(K,P,))), cand(lacksCustodyCapacity(K)).
constitutiveRule(x("c42-1",1,0,1,(K,P,)),non(custodianCandidate(K,P))) :- inst(x("c42-1",1,0,1,(K,P,))).
body(x("c42-1",1,0,1,(K,P,)),declaredMissing(P)) :- inst(x("c42-1",1,0,1,(K,P,))).
body(x("c42-1",1,0,1,(K,P,)),adultChildOf(K,P)) :- inst(x("c42-1",1,0,1,(K,P,))).
body(x("c42-1",1,0,1,(K,P,)),lacksCustodyCapacity(K)) :- inst(x("c42-1",1,0,1,(K,P,))).
superior(x("c42-1",1,0,1,(K,P,)),r("c42-1",1,0,(K,P,))) :- inst(x("c42-1",1,0,1,(K,P,))).
exc(x("c42-1",1,0,1,(K,P,)),r("c42-1",1,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(x("c42-1",1,0,1,(K,P,))).
% c42-1[2.0] 失踪人的财产由其配偶、成年子女、父母或者其他愿意担任财产代管人的人代管（第42条第1款；npc）
inst(r("c42-1",2,0,(K,P,))) :- cand(declaredMissing(P)), cand(parentOf(K,P)).
constitutiveRule(r("c42-1",2,0,(K,P,)),custodianCandidate(K,P)) :- inst(r("c42-1",2,0,(K,P,))).
mainHead(r("c42-1",2,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(r("c42-1",2,0,(K,P,))).
cand(custodianCandidate(K,P)) :- inst(r("c42-1",2,0,(K,P,))).
body(r("c42-1",2,0,(K,P,)),declaredMissing(P)) :- inst(r("c42-1",2,0,(K,P,))).
body(r("c42-1",2,0,(K,P,)),parentOf(K,P)) :- inst(r("c42-1",2,0,(K,P,))).
inst(x("c42-1",2,0,0,(K,P,))) :- inst(r("c42-1",2,0,(K,P,))), cand(custodyDispute(P)).
constitutiveRule(x("c42-1",2,0,0,(K,P,)),non(custodianCandidate(K,P))) :- inst(x("c42-1",2,0,0,(K,P,))).
body(x("c42-1",2,0,0,(K,P,)),declaredMissing(P)) :- inst(x("c42-1",2,0,0,(K,P,))).
body(x("c42-1",2,0,0,(K,P,)),parentOf(K,P)) :- inst(x("c42-1",2,0,0,(K,P,))).
body(x("c42-1",2,0,0,(K,P,)),custodyDispute(P)) :- inst(x("c42-1",2,0,0,(K,P,))).
superior(x("c42-1",2,0,0,(K,P,)),r("c42-1",2,0,(K,P,))) :- inst(x("c42-1",2,0,0,(K,P,))).
exc(x("c42-1",2,0,0,(K,P,)),r("c42-1",2,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(x("c42-1",2,0,0,(K,P,))).
inst(x("c42-1",2,0,1,(K,P,))) :- inst(r("c42-1",2,0,(K,P,))), cand(lacksCustodyCapacity(K)).
constitutiveRule(x("c42-1",2,0,1,(K,P,)),non(custodianCandidate(K,P))) :- inst(x("c42-1",2,0,1,(K,P,))).
body(x("c42-1",2,0,1,(K,P,)),declaredMissing(P)) :- inst(x("c42-1",2,0,1,(K,P,))).
body(x("c42-1",2,0,1,(K,P,)),parentOf(K,P)) :- inst(x("c42-1",2,0,1,(K,P,))).
body(x("c42-1",2,0,1,(K,P,)),lacksCustodyCapacity(K)) :- inst(x("c42-1",2,0,1,(K,P,))).
superior(x("c42-1",2,0,1,(K,P,)),r("c42-1",2,0,(K,P,))) :- inst(x("c42-1",2,0,1,(K,P,))).
exc(x("c42-1",2,0,1,(K,P,)),r("c42-1",2,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(x("c42-1",2,0,1,(K,P,))).
% c42-1[3.0] 失踪人的财产由其配偶、成年子女、父母或者其他愿意担任财产代管人的人代管（第42条第1款；npc）
inst(r("c42-1",3,0,(K,P,))) :- cand(declaredMissing(P)), cand(willingCustodian(K,P)).
constitutiveRule(r("c42-1",3,0,(K,P,)),custodianCandidate(K,P)) :- inst(r("c42-1",3,0,(K,P,))).
mainHead(r("c42-1",3,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(r("c42-1",3,0,(K,P,))).
cand(custodianCandidate(K,P)) :- inst(r("c42-1",3,0,(K,P,))).
body(r("c42-1",3,0,(K,P,)),declaredMissing(P)) :- inst(r("c42-1",3,0,(K,P,))).
body(r("c42-1",3,0,(K,P,)),willingCustodian(K,P)) :- inst(r("c42-1",3,0,(K,P,))).
inst(x("c42-1",3,0,0,(K,P,))) :- inst(r("c42-1",3,0,(K,P,))), cand(custodyDispute(P)).
constitutiveRule(x("c42-1",3,0,0,(K,P,)),non(custodianCandidate(K,P))) :- inst(x("c42-1",3,0,0,(K,P,))).
body(x("c42-1",3,0,0,(K,P,)),declaredMissing(P)) :- inst(x("c42-1",3,0,0,(K,P,))).
body(x("c42-1",3,0,0,(K,P,)),willingCustodian(K,P)) :- inst(x("c42-1",3,0,0,(K,P,))).
body(x("c42-1",3,0,0,(K,P,)),custodyDispute(P)) :- inst(x("c42-1",3,0,0,(K,P,))).
superior(x("c42-1",3,0,0,(K,P,)),r("c42-1",3,0,(K,P,))) :- inst(x("c42-1",3,0,0,(K,P,))).
exc(x("c42-1",3,0,0,(K,P,)),r("c42-1",3,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(x("c42-1",3,0,0,(K,P,))).
inst(x("c42-1",3,0,1,(K,P,))) :- inst(r("c42-1",3,0,(K,P,))), cand(lacksCustodyCapacity(K)).
constitutiveRule(x("c42-1",3,0,1,(K,P,)),non(custodianCandidate(K,P))) :- inst(x("c42-1",3,0,1,(K,P,))).
body(x("c42-1",3,0,1,(K,P,)),declaredMissing(P)) :- inst(x("c42-1",3,0,1,(K,P,))).
body(x("c42-1",3,0,1,(K,P,)),willingCustodian(K,P)) :- inst(x("c42-1",3,0,1,(K,P,))).
body(x("c42-1",3,0,1,(K,P,)),lacksCustodyCapacity(K)) :- inst(x("c42-1",3,0,1,(K,P,))).
superior(x("c42-1",3,0,1,(K,P,)),r("c42-1",3,0,(K,P,))) :- inst(x("c42-1",3,0,1,(K,P,))).
exc(x("c42-1",3,0,1,(K,P,)),r("c42-1",3,0,(K,P,)),constitutiveRule,custodianCandidate(K,P)) :- inst(x("c42-1",3,0,1,(K,P,))).

% c43-1[0.0] 财产代管人应当妥善管理失踪人的财产，维护其财产权益（第43条第1款；npc）
inst(r("c43-1",0,0,(K,P,))) :- cand(propertyCustodian(K,P)).
prescriptiveRule(r("c43-1",0,0,(K,P,)),manageMissingPersonsProperty(K,P)) :- inst(r("c43-1",0,0,(K,P,))).
mainHead(r("c43-1",0,0,(K,P,)),prescriptiveRule,manageMissingPersonsProperty(K,P)) :- inst(r("c43-1",0,0,(K,P,))).
cand(manageMissingPersonsProperty(K,P)) :- inst(r("c43-1",0,0,(K,P,))).
body(r("c43-1",0,0,(K,P,)),propertyCustodian(K,P)) :- inst(r("c43-1",0,0,(K,P,))).

% c44-1[0.0] 财产代管人不履行职责、侵害失踪人财产权益或者丧失代管能力的，利害关系人可以申请变更（第44条第1款；npc）
inst(r("c44-1",0,0,(A,K,P,))) :- cand(propertyCustodian(K,P)), cand(failsCustodyDuty(K,P)), cand(interestedParty(A,P)).
permissiveRule(r("c44-1",0,0,(A,K,P,)),applyChangeCustodian(A,P)) :- inst(r("c44-1",0,0,(A,K,P,))).
mainHead(r("c44-1",0,0,(A,K,P,)),permissiveRule,applyChangeCustodian(A,P)) :- inst(r("c44-1",0,0,(A,K,P,))).
cand(applyChangeCustodian(A,P)) :- inst(r("c44-1",0,0,(A,K,P,))).
body(r("c44-1",0,0,(A,K,P,)),propertyCustodian(K,P)) :- inst(r("c44-1",0,0,(A,K,P,))).
body(r("c44-1",0,0,(A,K,P,)),failsCustodyDuty(K,P)) :- inst(r("c44-1",0,0,(A,K,P,))).
body(r("c44-1",0,0,(A,K,P,)),interestedParty(A,P)) :- inst(r("c44-1",0,0,(A,K,P,))).
% c44-1[1.0] 财产代管人不履行职责、侵害失踪人财产权益或者丧失代管能力的，利害关系人可以申请变更（第44条第1款；npc）
inst(r("c44-1",1,0,(A,K,P,))) :- cand(propertyCustodian(K,P)), cand(infringesMissingPersonsProperty(K,P)), cand(interestedParty(A,P)).
permissiveRule(r("c44-1",1,0,(A,K,P,)),applyChangeCustodian(A,P)) :- inst(r("c44-1",1,0,(A,K,P,))).
mainHead(r("c44-1",1,0,(A,K,P,)),permissiveRule,applyChangeCustodian(A,P)) :- inst(r("c44-1",1,0,(A,K,P,))).
cand(applyChangeCustodian(A,P)) :- inst(r("c44-1",1,0,(A,K,P,))).
body(r("c44-1",1,0,(A,K,P,)),propertyCustodian(K,P)) :- inst(r("c44-1",1,0,(A,K,P,))).
body(r("c44-1",1,0,(A,K,P,)),infringesMissingPersonsProperty(K,P)) :- inst(r("c44-1",1,0,(A,K,P,))).
body(r("c44-1",1,0,(A,K,P,)),interestedParty(A,P)) :- inst(r("c44-1",1,0,(A,K,P,))).
% c44-1[2.0] 财产代管人不履行职责、侵害失踪人财产权益或者丧失代管能力的，利害关系人可以申请变更（第44条第1款；npc）
inst(r("c44-1",2,0,(A,K,P,))) :- cand(propertyCustodian(K,P)), cand(lacksCustodyCapacity(K)), cand(interestedParty(A,P)).
permissiveRule(r("c44-1",2,0,(A,K,P,)),applyChangeCustodian(A,P)) :- inst(r("c44-1",2,0,(A,K,P,))).
mainHead(r("c44-1",2,0,(A,K,P,)),permissiveRule,applyChangeCustodian(A,P)) :- inst(r("c44-1",2,0,(A,K,P,))).
cand(applyChangeCustodian(A,P)) :- inst(r("c44-1",2,0,(A,K,P,))).
body(r("c44-1",2,0,(A,K,P,)),propertyCustodian(K,P)) :- inst(r("c44-1",2,0,(A,K,P,))).
body(r("c44-1",2,0,(A,K,P,)),lacksCustodyCapacity(K)) :- inst(r("c44-1",2,0,(A,K,P,))).
body(r("c44-1",2,0,(A,K,P,)),interestedParty(A,P)) :- inst(r("c44-1",2,0,(A,K,P,))).

% c43-2[0.0] 失踪人所欠税款、债务和应付的其他费用，由财产代管人从失踪人的财产中支付（第43条第2款；npc）
inst(r("c43-2",0,0,(K,P,Z,))) :- cand(propertyCustodian(K,P)), cand(owedByMissingPerson(P,Z)).
prescriptiveRule(r("c43-2",0,0,(K,P,Z,)),payFromMissingPersonsProperty(K,P,Z)) :- inst(r("c43-2",0,0,(K,P,Z,))).
mainHead(r("c43-2",0,0,(K,P,Z,)),prescriptiveRule,payFromMissingPersonsProperty(K,P,Z)) :- inst(r("c43-2",0,0,(K,P,Z,))).
cand(payFromMissingPersonsProperty(K,P,Z)) :- inst(r("c43-2",0,0,(K,P,Z,))).
body(r("c43-2",0,0,(K,P,Z,)),propertyCustodian(K,P)) :- inst(r("c43-2",0,0,(K,P,Z,))).
body(r("c43-2",0,0,(K,P,Z,)),owedByMissingPerson(P,Z)) :- inst(r("c43-2",0,0,(K,P,Z,))).

% c43-3[0.0] 财产代管人因故意或者重大过失造成失踪人财产损失的，应当承担赔偿责任（第43条第3款；npc）
inst(r("c43-3",0,0,(K,P,))) :- cand(propertyCustodian(K,P)), cand(custodianIntent(K,P)), cand(missingPersonsPropertyLost(K,P)).
prescriptiveRule(r("c43-3",0,0,(K,P,)),compensateMissingPerson(K,P)) :- inst(r("c43-3",0,0,(K,P,))).
mainHead(r("c43-3",0,0,(K,P,)),prescriptiveRule,compensateMissingPerson(K,P)) :- inst(r("c43-3",0,0,(K,P,))).
cand(compensateMissingPerson(K,P)) :- inst(r("c43-3",0,0,(K,P,))).
body(r("c43-3",0,0,(K,P,)),propertyCustodian(K,P)) :- inst(r("c43-3",0,0,(K,P,))).
body(r("c43-3",0,0,(K,P,)),custodianIntent(K,P)) :- inst(r("c43-3",0,0,(K,P,))).
body(r("c43-3",0,0,(K,P,)),missingPersonsPropertyLost(K,P)) :- inst(r("c43-3",0,0,(K,P,))).
% c43-3[1.0] 财产代管人因故意或者重大过失造成失踪人财产损失的，应当承担赔偿责任（第43条第3款；npc）
inst(r("c43-3",1,0,(K,P,))) :- cand(propertyCustodian(K,P)), cand(custodianGrossNegligence(K,P)), cand(missingPersonsPropertyLost(K,P)).
prescriptiveRule(r("c43-3",1,0,(K,P,)),compensateMissingPerson(K,P)) :- inst(r("c43-3",1,0,(K,P,))).
mainHead(r("c43-3",1,0,(K,P,)),prescriptiveRule,compensateMissingPerson(K,P)) :- inst(r("c43-3",1,0,(K,P,))).
cand(compensateMissingPerson(K,P)) :- inst(r("c43-3",1,0,(K,P,))).
body(r("c43-3",1,0,(K,P,)),propertyCustodian(K,P)) :- inst(r("c43-3",1,0,(K,P,))).
body(r("c43-3",1,0,(K,P,)),custodianGrossNegligence(K,P)) :- inst(r("c43-3",1,0,(K,P,))).
body(r("c43-3",1,0,(K,P,)),missingPersonsPropertyLost(K,P)) :- inst(r("c43-3",1,0,(K,P,))).

% c44-2[0.0] 财产代管人有正当理由的，可以申请变更财产代管人（第44条第2款；npc）
inst(r("c44-2",0,0,(K,P,))) :- cand(propertyCustodian(K,P)), cand(justifiedReason(K)).
permissiveRule(r("c44-2",0,0,(K,P,)),applyChangeCustodian(K,P)) :- inst(r("c44-2",0,0,(K,P,))).
mainHead(r("c44-2",0,0,(K,P,)),permissiveRule,applyChangeCustodian(K,P)) :- inst(r("c44-2",0,0,(K,P,))).
cand(applyChangeCustodian(K,P)) :- inst(r("c44-2",0,0,(K,P,))).
body(r("c44-2",0,0,(K,P,)),propertyCustodian(K,P)) :- inst(r("c44-2",0,0,(K,P,))).
body(r("c44-2",0,0,(K,P,)),justifiedReason(K)) :- inst(r("c44-2",0,0,(K,P,))).

% c44-3[0.0] 变更后的财产代管人有权请求原财产代管人及时移交有关财产并报告代管情况（第44条第3款；npc）
inst(r("c44-3",0,0,(K0,K1,P,))) :- cand(custodianChanged(K0,K1,P)).
constitutiveRule(r("c44-3",0,0,(K0,K1,P,)),demandHandoverAndReport(K1,K0)) :- inst(r("c44-3",0,0,(K0,K1,P,))).
mainHead(r("c44-3",0,0,(K0,K1,P,)),constitutiveRule,demandHandoverAndReport(K1,K0)) :- inst(r("c44-3",0,0,(K0,K1,P,))).
cand(demandHandoverAndReport(K1,K0)) :- inst(r("c44-3",0,0,(K0,K1,P,))).
body(r("c44-3",0,0,(K0,K1,P,)),custodianChanged(K0,K1,P)) :- inst(r("c44-3",0,0,(K0,K1,P,))).

% c42-2[0.0] 代管有争议的，由人民法院指定的人代管（第42条第2款；npc）
inst(r("c42-2",0,0,(P,))) :- cand(declaredMissing(P)), cand(custodyDispute(P)).
prescriptiveRule(r("c42-2",0,0,(P,)),designatePropertyCustodian(P)) :- inst(r("c42-2",0,0,(P,))).
mainHead(r("c42-2",0,0,(P,)),prescriptiveRule,designatePropertyCustodian(P)) :- inst(r("c42-2",0,0,(P,))).
cand(designatePropertyCustodian(P)) :- inst(r("c42-2",0,0,(P,))).
body(r("c42-2",0,0,(P,)),declaredMissing(P)) :- inst(r("c42-2",0,0,(P,))).
body(r("c42-2",0,0,(P,)),custodyDispute(P)) :- inst(r("c42-2",0,0,(P,))).

% c42-2b[0.0] 没有前款规定的人或者其无代管能力的，由人民法院指定的人代管（第42条第2款；npc）
inst(r("c42-2b",0,0,(P,))) :- cand(declaredMissing(P)).
prescriptiveRule(r("c42-2b",0,0,(P,)),designatePropertyCustodian(P)) :- inst(r("c42-2b",0,0,(P,))).
mainHead(r("c42-2b",0,0,(P,)),prescriptiveRule,designatePropertyCustodian(P)) :- inst(r("c42-2b",0,0,(P,))).
cand(designatePropertyCustodian(P)) :- inst(r("c42-2b",0,0,(P,))).
body(r("c42-2b",0,0,(P,)),declaredMissing(P)) :- inst(r("c42-2b",0,0,(P,))).
inst(x("c42-2b",0,0,0,(P,))) :- inst(r("c42-2b",0,0,(P,))), cand(hasCustodianCandidate(P)).
permissiveRule(x("c42-2b",0,0,0,(P,)),non(designatePropertyCustodian(P))) :- inst(x("c42-2b",0,0,0,(P,))).
body(x("c42-2b",0,0,0,(P,)),declaredMissing(P)) :- inst(x("c42-2b",0,0,0,(P,))).
body(x("c42-2b",0,0,0,(P,)),hasCustodianCandidate(P)) :- inst(x("c42-2b",0,0,0,(P,))).
superior(x("c42-2b",0,0,0,(P,)),r("c42-2b",0,0,(P,))) :- inst(x("c42-2b",0,0,0,(P,))).
exc(x("c42-2b",0,0,0,(P,)),r("c42-2b",0,0,(P,)),prescriptiveRule,designatePropertyCustodian(P)) :- inst(x("c42-2b",0,0,0,(P,))).

% c45-1[0.0] 失踪人重新出现，经本人或者利害关系人申请，人民法院应当撤销失踪宣告（第45条第1款；npc）
inst(r("c45-1",0,0,(P,))) :- cand(declaredMissing(P)), cand(reappeared(P)), cand(appliedToRevokeMissing(P)).
prescriptiveRule(r("c45-1",0,0,(P,)),revokeMissingDeclaration(P)) :- inst(r("c45-1",0,0,(P,))).
mainHead(r("c45-1",0,0,(P,)),prescriptiveRule,revokeMissingDeclaration(P)) :- inst(r("c45-1",0,0,(P,))).
cand(revokeMissingDeclaration(P)) :- inst(r("c45-1",0,0,(P,))).
body(r("c45-1",0,0,(P,)),declaredMissing(P)) :- inst(r("c45-1",0,0,(P,))).
body(r("c45-1",0,0,(P,)),reappeared(P)) :- inst(r("c45-1",0,0,(P,))).
body(r("c45-1",0,0,(P,)),appliedToRevokeMissing(P)) :- inst(r("c45-1",0,0,(P,))).

% c45-2[0.0] 失踪人重新出现，有权请求财产代管人及时移交有关财产并报告代管情况（第45条第2款；npc）
inst(r("c45-2",0,0,(K,P,))) :- cand(declaredMissing(P)), cand(reappeared(P)), cand(propertyCustodian(K,P)).
constitutiveRule(r("c45-2",0,0,(K,P,)),demandHandoverAndReport(P,K)) :- inst(r("c45-2",0,0,(K,P,))).
mainHead(r("c45-2",0,0,(K,P,)),constitutiveRule,demandHandoverAndReport(P,K)) :- inst(r("c45-2",0,0,(K,P,))).
cand(demandHandoverAndReport(P,K)) :- inst(r("c45-2",0,0,(K,P,))).
body(r("c45-2",0,0,(K,P,)),declaredMissing(P)) :- inst(r("c45-2",0,0,(K,P,))).
body(r("c45-2",0,0,(K,P,)),reappeared(P)) :- inst(r("c45-2",0,0,(K,P,))).
body(r("c45-2",0,0,(K,P,)),propertyCustodian(K,P)) :- inst(r("c45-2",0,0,(K,P,))).

% c46-cond[0.0] 宣告死亡的条件：下落不明满四年；因意外事件下落不明满二年；或因意外事件下落不明且经有关机关证明不可能生存（不受二年限制）（第46条第1款、第
inst(r("c46-cond",0,0,(P,))) :- cand(missingFor4Years(P)).
constitutiveRule(r("c46-cond",0,0,(P,)),deathDeclarationConditionsMet(P)) :- inst(r("c46-cond",0,0,(P,))).
mainHead(r("c46-cond",0,0,(P,)),constitutiveRule,deathDeclarationConditionsMet(P)) :- inst(r("c46-cond",0,0,(P,))).
cand(deathDeclarationConditionsMet(P)) :- inst(r("c46-cond",0,0,(P,))).
body(r("c46-cond",0,0,(P,)),missingFor4Years(P)) :- inst(r("c46-cond",0,0,(P,))).
% c46-cond[1.0] 宣告死亡的条件：下落不明满四年；因意外事件下落不明满二年；或因意外事件下落不明且经有关机关证明不可能生存（不受二年限制）（第46条第1款、第
inst(r("c46-cond",1,0,(P,))) :- cand(accidentMissingFor2Years(P)).
constitutiveRule(r("c46-cond",1,0,(P,)),deathDeclarationConditionsMet(P)) :- inst(r("c46-cond",1,0,(P,))).
mainHead(r("c46-cond",1,0,(P,)),constitutiveRule,deathDeclarationConditionsMet(P)) :- inst(r("c46-cond",1,0,(P,))).
cand(deathDeclarationConditionsMet(P)) :- inst(r("c46-cond",1,0,(P,))).
body(r("c46-cond",1,0,(P,)),accidentMissingFor2Years(P)) :- inst(r("c46-cond",1,0,(P,))).
% c46-cond[2.0] 宣告死亡的条件：下落不明满四年；因意外事件下落不明满二年；或因意外事件下落不明且经有关机关证明不可能生存（不受二年限制）（第46条第1款、第
inst(r("c46-cond",2,0,(P,))) :- cand(accidentMissing(P)), cand(certifiedCannotSurvive(P)).
constitutiveRule(r("c46-cond",2,0,(P,)),deathDeclarationConditionsMet(P)) :- inst(r("c46-cond",2,0,(P,))).
mainHead(r("c46-cond",2,0,(P,)),constitutiveRule,deathDeclarationConditionsMet(P)) :- inst(r("c46-cond",2,0,(P,))).
cand(deathDeclarationConditionsMet(P)) :- inst(r("c46-cond",2,0,(P,))).
body(r("c46-cond",2,0,(P,)),accidentMissing(P)) :- inst(r("c46-cond",2,0,(P,))).
body(r("c46-cond",2,0,(P,)),certifiedCannotSurvive(P)) :- inst(r("c46-cond",2,0,(P,))).

% c46-apply[0.0] 符合条件的，利害关系人可以申请宣告该自然人死亡（第46条第1款；npc）
inst(r("c46-apply",0,0,(A,P,))) :- cand(deathDeclarationConditionsMet(P)), cand(interestedParty(A,P)).
permissiveRule(r("c46-apply",0,0,(A,P,)),applyDeathDeclaration(A,P)) :- inst(r("c46-apply",0,0,(A,P,))).
mainHead(r("c46-apply",0,0,(A,P,)),permissiveRule,applyDeathDeclaration(A,P)) :- inst(r("c46-apply",0,0,(A,P,))).
cand(applyDeathDeclaration(A,P)) :- inst(r("c46-apply",0,0,(A,P,))).
body(r("c46-apply",0,0,(A,P,)),deathDeclarationConditionsMet(P)) :- inst(r("c46-apply",0,0,(A,P,))).
body(r("c46-apply",0,0,(A,P,)),interestedParty(A,P)) :- inst(r("c46-apply",0,0,(A,P,))).

% c47[0.0] 有的申请宣告死亡、有的申请宣告失踪，符合宣告死亡条件的，人民法院应当宣告死亡（第47条；npc）
inst(r("c47",0,0,(P,))) :- cand(deathDeclarationApplied(P)), cand(missingDeclarationApplied(P)), cand(deathDeclarationConditionsMet(P)).
prescriptiveRule(r("c47",0,0,(P,)),declareDeath(P)) :- inst(r("c47",0,0,(P,))).
mainHead(r("c47",0,0,(P,)),prescriptiveRule,declareDeath(P)) :- inst(r("c47",0,0,(P,))).
cand(declareDeath(P)) :- inst(r("c47",0,0,(P,))).
body(r("c47",0,0,(P,)),deathDeclarationApplied(P)) :- inst(r("c47",0,0,(P,))).
body(r("c47",0,0,(P,)),missingDeclarationApplied(P)) :- inst(r("c47",0,0,(P,))).
body(r("c47",0,0,(P,)),deathDeclarationConditionsMet(P)) :- inst(r("c47",0,0,(P,))).

% c48-1[0.0] 宣告死亡的判决作出之日视为其死亡的日期（第48条；npc）
inst(r("c48-1",0,0,(D,P,))) :- cand(declaredDead(P)), cand(judgmentDate(P,D)).
constitutiveRule(r("c48-1",0,0,(D,P,)),deemedDeathDate(P,D)) :- inst(r("c48-1",0,0,(D,P,))).
mainHead(r("c48-1",0,0,(D,P,)),constitutiveRule,deemedDeathDate(P,D)) :- inst(r("c48-1",0,0,(D,P,))).
cand(deemedDeathDate(P,D)) :- inst(r("c48-1",0,0,(D,P,))).
body(r("c48-1",0,0,(D,P,)),declaredDead(P)) :- inst(r("c48-1",0,0,(D,P,))).
body(r("c48-1",0,0,(D,P,)),judgmentDate(P,D)) :- inst(r("c48-1",0,0,(D,P,))).
inst(x("c48-1",0,0,0,(D,P,))) :- inst(r("c48-1",0,0,(D,P,))), cand(accidentMissing(P)).
constitutiveRule(x("c48-1",0,0,0,(D,P,)),non(deemedDeathDate(P,D))) :- inst(x("c48-1",0,0,0,(D,P,))).
body(x("c48-1",0,0,0,(D,P,)),declaredDead(P)) :- inst(x("c48-1",0,0,0,(D,P,))).
body(x("c48-1",0,0,0,(D,P,)),judgmentDate(P,D)) :- inst(x("c48-1",0,0,0,(D,P,))).
body(x("c48-1",0,0,0,(D,P,)),accidentMissing(P)) :- inst(x("c48-1",0,0,0,(D,P,))).
superior(x("c48-1",0,0,0,(D,P,)),r("c48-1",0,0,(D,P,))) :- inst(x("c48-1",0,0,0,(D,P,))).
exc(x("c48-1",0,0,0,(D,P,)),r("c48-1",0,0,(D,P,)),constitutiveRule,deemedDeathDate(P,D)) :- inst(x("c48-1",0,0,0,(D,P,))).

% c48-2[0.0] 因意外事件下落不明宣告死亡的，意外事件发生之日视为其死亡的日期（第48条；npc）
inst(r("c48-2",0,0,(D,P,))) :- cand(declaredDead(P)), cand(accidentMissing(P)), cand(accidentDate(P,D)).
constitutiveRule(r("c48-2",0,0,(D,P,)),deemedDeathDate(P,D)) :- inst(r("c48-2",0,0,(D,P,))).
mainHead(r("c48-2",0,0,(D,P,)),constitutiveRule,deemedDeathDate(P,D)) :- inst(r("c48-2",0,0,(D,P,))).
cand(deemedDeathDate(P,D)) :- inst(r("c48-2",0,0,(D,P,))).
body(r("c48-2",0,0,(D,P,)),declaredDead(P)) :- inst(r("c48-2",0,0,(D,P,))).
body(r("c48-2",0,0,(D,P,)),accidentMissing(P)) :- inst(r("c48-2",0,0,(D,P,))).
body(r("c48-2",0,0,(D,P,)),accidentDate(P,D)) :- inst(r("c48-2",0,0,(D,P,))).

% c49[0.0] 被宣告死亡但并未死亡的，不影响其在被宣告死亡期间实施的民事法律行为的效力（第49条；npc）
inst(r("c49",0,0,(P,X,))) :- cand(declaredDead(P)), cand(actuallyAlive(P)), cand(actDuringDeclaredDeath(X,P)).
constitutiveRule(r("c49",0,0,(P,X,)),validityUnaffectedByDeathDeclaration(X)) :- inst(r("c49",0,0,(P,X,))).
mainHead(r("c49",0,0,(P,X,)),constitutiveRule,validityUnaffectedByDeathDeclaration(X)) :- inst(r("c49",0,0,(P,X,))).
cand(validityUnaffectedByDeathDeclaration(X)) :- inst(r("c49",0,0,(P,X,))).
body(r("c49",0,0,(P,X,)),declaredDead(P)) :- inst(r("c49",0,0,(P,X,))).
body(r("c49",0,0,(P,X,)),actuallyAlive(P)) :- inst(r("c49",0,0,(P,X,))).
body(r("c49",0,0,(P,X,)),actDuringDeclaredDeath(X,P)) :- inst(r("c49",0,0,(P,X,))).

% c51-1[0.0] 被宣告死亡的人的婚姻关系，自死亡宣告之日起消除（第51条；npc）
inst(r("c51-1",0,0,(H,P,))) :- cand(declaredDead(P)), cand(spouseOf(H,P)).
constitutiveRule(r("c51-1",0,0,(H,P,)),marriageDissolved(H,P)) :- inst(r("c51-1",0,0,(H,P,))).
mainHead(r("c51-1",0,0,(H,P,)),constitutiveRule,marriageDissolved(H,P)) :- inst(r("c51-1",0,0,(H,P,))).
cand(marriageDissolved(H,P)) :- inst(r("c51-1",0,0,(H,P,))).
body(r("c51-1",0,0,(H,P,)),declaredDead(P)) :- inst(r("c51-1",0,0,(H,P,))).
body(r("c51-1",0,0,(H,P,)),spouseOf(H,P)) :- inst(r("c51-1",0,0,(H,P,))).
inst(x("c51-1",0,0,0,(H,P,))) :- inst(r("c51-1",0,0,(H,P,))), cand(deathDeclarationRevoked(P)).
constitutiveRule(x("c51-1",0,0,0,(H,P,)),non(marriageDissolved(H,P))) :- inst(x("c51-1",0,0,0,(H,P,))).
body(x("c51-1",0,0,0,(H,P,)),declaredDead(P)) :- inst(x("c51-1",0,0,0,(H,P,))).
body(x("c51-1",0,0,0,(H,P,)),spouseOf(H,P)) :- inst(x("c51-1",0,0,0,(H,P,))).
body(x("c51-1",0,0,0,(H,P,)),deathDeclarationRevoked(P)) :- inst(x("c51-1",0,0,0,(H,P,))).
superior(x("c51-1",0,0,0,(H,P,)),r("c51-1",0,0,(H,P,))) :- inst(x("c51-1",0,0,0,(H,P,))).
exc(x("c51-1",0,0,0,(H,P,)),r("c51-1",0,0,(H,P,)),constitutiveRule,marriageDissolved(H,P)) :- inst(x("c51-1",0,0,0,(H,P,))).

% c50[0.0] 被宣告死亡的人重新出现，经本人或者利害关系人申请，人民法院应当撤销死亡宣告（第50条；npc）
inst(r("c50",0,0,(P,))) :- cand(declaredDead(P)), cand(reappeared(P)), cand(appliedToRevokeDeath(P)).
prescriptiveRule(r("c50",0,0,(P,)),revokeDeathDeclaration(P)) :- inst(r("c50",0,0,(P,))).
mainHead(r("c50",0,0,(P,)),prescriptiveRule,revokeDeathDeclaration(P)) :- inst(r("c50",0,0,(P,))).
cand(revokeDeathDeclaration(P)) :- inst(r("c50",0,0,(P,))).
body(r("c50",0,0,(P,)),declaredDead(P)) :- inst(r("c50",0,0,(P,))).
body(r("c50",0,0,(P,)),reappeared(P)) :- inst(r("c50",0,0,(P,))).
body(r("c50",0,0,(P,)),appliedToRevokeDeath(P)) :- inst(r("c50",0,0,(P,))).

% c51-2[0.0] 死亡宣告被撤销的，婚姻关系自撤销之日起自行恢复（配偶再婚或者书面声明不愿意恢复的除外）（第51条；npc）
inst(r("c51-2",0,0,(H,P,))) :- cand(deathDeclarationRevoked(P)), cand(spouseOf(H,P)).
constitutiveRule(r("c51-2",0,0,(H,P,)),marriageRestored(H,P)) :- inst(r("c51-2",0,0,(H,P,))).
mainHead(r("c51-2",0,0,(H,P,)),constitutiveRule,marriageRestored(H,P)) :- inst(r("c51-2",0,0,(H,P,))).
cand(marriageRestored(H,P)) :- inst(r("c51-2",0,0,(H,P,))).
body(r("c51-2",0,0,(H,P,)),deathDeclarationRevoked(P)) :- inst(r("c51-2",0,0,(H,P,))).
body(r("c51-2",0,0,(H,P,)),spouseOf(H,P)) :- inst(r("c51-2",0,0,(H,P,))).
inst(x("c51-2",0,0,0,(H,P,))) :- inst(r("c51-2",0,0,(H,P,))), cand(spouseRemarried(H)).
constitutiveRule(x("c51-2",0,0,0,(H,P,)),non(marriageRestored(H,P))) :- inst(x("c51-2",0,0,0,(H,P,))).
body(x("c51-2",0,0,0,(H,P,)),deathDeclarationRevoked(P)) :- inst(x("c51-2",0,0,0,(H,P,))).
body(x("c51-2",0,0,0,(H,P,)),spouseOf(H,P)) :- inst(x("c51-2",0,0,0,(H,P,))).
body(x("c51-2",0,0,0,(H,P,)),spouseRemarried(H)) :- inst(x("c51-2",0,0,0,(H,P,))).
superior(x("c51-2",0,0,0,(H,P,)),r("c51-2",0,0,(H,P,))) :- inst(x("c51-2",0,0,0,(H,P,))).
exc(x("c51-2",0,0,0,(H,P,)),r("c51-2",0,0,(H,P,)),constitutiveRule,marriageRestored(H,P)) :- inst(x("c51-2",0,0,0,(H,P,))).
inst(x("c51-2",0,0,1,(H,P,))) :- inst(r("c51-2",0,0,(H,P,))), cand(declaredUnwillingToRestore(H,P)).
constitutiveRule(x("c51-2",0,0,1,(H,P,)),non(marriageRestored(H,P))) :- inst(x("c51-2",0,0,1,(H,P,))).
body(x("c51-2",0,0,1,(H,P,)),deathDeclarationRevoked(P)) :- inst(x("c51-2",0,0,1,(H,P,))).
body(x("c51-2",0,0,1,(H,P,)),spouseOf(H,P)) :- inst(x("c51-2",0,0,1,(H,P,))).
body(x("c51-2",0,0,1,(H,P,)),declaredUnwillingToRestore(H,P)) :- inst(x("c51-2",0,0,1,(H,P,))).
superior(x("c51-2",0,0,1,(H,P,)),r("c51-2",0,0,(H,P,))) :- inst(x("c51-2",0,0,1,(H,P,))).
exc(x("c51-2",0,0,1,(H,P,)),r("c51-2",0,0,(H,P,)),constitutiveRule,marriageRestored(H,P)) :- inst(x("c51-2",0,0,1,(H,P,))).

% c52[0.0] 子女在其被宣告死亡期间被依法收养的，不得以未经本人同意为由主张收养行为无效（第52条；npc）
inst(r("c52",0,0,(C,P,))) :- cand(deathDeclarationRevoked(P)), cand(childOf(C,P)), cand(adoptedDuringDeclaredDeath(C,P)).
prescriptiveRule(r("c52",0,0,(C,P,)),non(claimAdoptionVoidForLackOfConsent(P,C))) :- inst(r("c52",0,0,(C,P,))).
mainHead(r("c52",0,0,(C,P,)),prescriptiveRule,non(claimAdoptionVoidForLackOfConsent(P,C))) :- inst(r("c52",0,0,(C,P,))).
cand(claimAdoptionVoidForLackOfConsent(P,C)) :- inst(r("c52",0,0,(C,P,))).
body(r("c52",0,0,(C,P,)),deathDeclarationRevoked(P)) :- inst(r("c52",0,0,(C,P,))).
body(r("c52",0,0,(C,P,)),childOf(C,P)) :- inst(r("c52",0,0,(C,P,))).
body(r("c52",0,0,(C,P,)),adoptedDuringDeclaredDeath(C,P)) :- inst(r("c52",0,0,(C,P,))).

% c53-1[0.0] 被撤销死亡宣告的人有权请求依照继承编取得其财产的民事主体返还财产（第53条第1款；npc）
inst(r("c53-1",0,0,(P,Y,))) :- cand(deathDeclarationRevoked(P)), cand(acquiredUnderSuccession(Y,P)).
constitutiveRule(r("c53-1",0,0,(P,Y,)),claimPropertyReturn(P,Y)) :- inst(r("c53-1",0,0,(P,Y,))).
mainHead(r("c53-1",0,0,(P,Y,)),constitutiveRule,claimPropertyReturn(P,Y)) :- inst(r("c53-1",0,0,(P,Y,))).
cand(claimPropertyReturn(P,Y)) :- inst(r("c53-1",0,0,(P,Y,))).
body(r("c53-1",0,0,(P,Y,)),deathDeclarationRevoked(P)) :- inst(r("c53-1",0,0,(P,Y,))).
body(r("c53-1",0,0,(P,Y,)),acquiredUnderSuccession(Y,P)) :- inst(r("c53-1",0,0,(P,Y,))).

% c53-1b[0.0] 无法返还的，应当给予适当补偿（第53条第1款；npc）
inst(r("c53-1b",0,0,(P,Y,))) :- cand(deathDeclarationRevoked(P)), cand(acquiredUnderSuccession(Y,P)), cand(cannotReturn(Y,P)).
prescriptiveRule(r("c53-1b",0,0,(P,Y,)),giveAppropriateCompensation(Y,P)) :- inst(r("c53-1b",0,0,(P,Y,))).
mainHead(r("c53-1b",0,0,(P,Y,)),prescriptiveRule,giveAppropriateCompensation(Y,P)) :- inst(r("c53-1b",0,0,(P,Y,))).
cand(giveAppropriateCompensation(Y,P)) :- inst(r("c53-1b",0,0,(P,Y,))).
body(r("c53-1b",0,0,(P,Y,)),deathDeclarationRevoked(P)) :- inst(r("c53-1b",0,0,(P,Y,))).
body(r("c53-1b",0,0,(P,Y,)),acquiredUnderSuccession(Y,P)) :- inst(r("c53-1b",0,0,(P,Y,))).
body(r("c53-1b",0,0,(P,Y,)),cannotReturn(Y,P)) :- inst(r("c53-1b",0,0,(P,Y,))).

% c53-2[0.0] 利害关系人隐瞒真实情况致使他人被宣告死亡而取得其财产的，除返还财产外，还应当赔偿损失（第53条第2款；npc）
inst(r("c53-2",0,0,(P,Y,))) :- cand(concealedTruth(Y,P)), cand(acquiredByDeathDeclaration(Y,P)).
prescriptiveRule(r("c53-2",0,0,(P,Y,)),returnAndCompensateLoss(Y,P)) :- inst(r("c53-2",0,0,(P,Y,))).
mainHead(r("c53-2",0,0,(P,Y,)),prescriptiveRule,returnAndCompensateLoss(Y,P)) :- inst(r("c53-2",0,0,(P,Y,))).
cand(returnAndCompensateLoss(Y,P)) :- inst(r("c53-2",0,0,(P,Y,))).
body(r("c53-2",0,0,(P,Y,)),concealedTruth(Y,P)) :- inst(r("c53-2",0,0,(P,Y,))).
body(r("c53-2",0,0,(P,Y,)),acquiredByDeathDeclaration(Y,P)) :- inst(r("c53-2",0,0,(P,Y,))).

% c54[0.0] 自然人从事工商业经营，经依法登记，为个体工商户（第54条；npc）
inst(r("c54",0,0,(P,))) :- cand(naturalPerson(P)), cand(industrialCommercialOperation(P)), cand(registeredAsBusiness(P)).
constitutiveRule(r("c54",0,0,(P,)),individualBusiness(P)) :- inst(r("c54",0,0,(P,))).
mainHead(r("c54",0,0,(P,)),constitutiveRule,individualBusiness(P)) :- inst(r("c54",0,0,(P,))).
cand(individualBusiness(P)) :- inst(r("c54",0,0,(P,))).
body(r("c54",0,0,(P,)),naturalPerson(P)) :- inst(r("c54",0,0,(P,))).
body(r("c54",0,0,(P,)),industrialCommercialOperation(P)) :- inst(r("c54",0,0,(P,))).
body(r("c54",0,0,(P,)),registeredAsBusiness(P)) :- inst(r("c54",0,0,(P,))).

% c56-1a[0.0] 个体工商户的债务，个人经营的，以个人财产承担（第56条第1款；npc）
inst(r("c56-1a",0,0,(P,Z,))) :- cand(individualBusiness(P)), cand(debtOfOperator(Z,P)), cand(personallyOperated(P)).
constitutiveRule(r("c56-1a",0,0,(P,Z,)),payableFromPersonalAssets(Z)) :- inst(r("c56-1a",0,0,(P,Z,))).
mainHead(r("c56-1a",0,0,(P,Z,)),constitutiveRule,payableFromPersonalAssets(Z)) :- inst(r("c56-1a",0,0,(P,Z,))).
cand(payableFromPersonalAssets(Z)) :- inst(r("c56-1a",0,0,(P,Z,))).
body(r("c56-1a",0,0,(P,Z,)),individualBusiness(P)) :- inst(r("c56-1a",0,0,(P,Z,))).
body(r("c56-1a",0,0,(P,Z,)),debtOfOperator(Z,P)) :- inst(r("c56-1a",0,0,(P,Z,))).
body(r("c56-1a",0,0,(P,Z,)),personallyOperated(P)) :- inst(r("c56-1a",0,0,(P,Z,))).

% c56-1b[0.0] 家庭经营的，以家庭财产承担；无法区分的，以家庭财产承担（第56条第1款；npc）
inst(r("c56-1b",0,0,(P,Z,))) :- cand(individualBusiness(P)), cand(debtOfOperator(Z,P)), cand(familyOperated(P)).
constitutiveRule(r("c56-1b",0,0,(P,Z,)),payableFromFamilyAssets(Z)) :- inst(r("c56-1b",0,0,(P,Z,))).
mainHead(r("c56-1b",0,0,(P,Z,)),constitutiveRule,payableFromFamilyAssets(Z)) :- inst(r("c56-1b",0,0,(P,Z,))).
cand(payableFromFamilyAssets(Z)) :- inst(r("c56-1b",0,0,(P,Z,))).
body(r("c56-1b",0,0,(P,Z,)),individualBusiness(P)) :- inst(r("c56-1b",0,0,(P,Z,))).
body(r("c56-1b",0,0,(P,Z,)),debtOfOperator(Z,P)) :- inst(r("c56-1b",0,0,(P,Z,))).
body(r("c56-1b",0,0,(P,Z,)),familyOperated(P)) :- inst(r("c56-1b",0,0,(P,Z,))).
% c56-1b[1.0] 家庭经营的，以家庭财产承担；无法区分的，以家庭财产承担（第56条第1款；npc）
inst(r("c56-1b",1,0,(P,Z,))) :- cand(individualBusiness(P)), cand(debtOfOperator(Z,P)), cand(operationIndistinguishable(P)).
constitutiveRule(r("c56-1b",1,0,(P,Z,)),payableFromFamilyAssets(Z)) :- inst(r("c56-1b",1,0,(P,Z,))).
mainHead(r("c56-1b",1,0,(P,Z,)),constitutiveRule,payableFromFamilyAssets(Z)) :- inst(r("c56-1b",1,0,(P,Z,))).
cand(payableFromFamilyAssets(Z)) :- inst(r("c56-1b",1,0,(P,Z,))).
body(r("c56-1b",1,0,(P,Z,)),individualBusiness(P)) :- inst(r("c56-1b",1,0,(P,Z,))).
body(r("c56-1b",1,0,(P,Z,)),debtOfOperator(Z,P)) :- inst(r("c56-1b",1,0,(P,Z,))).
body(r("c56-1b",1,0,(P,Z,)),operationIndistinguishable(P)) :- inst(r("c56-1b",1,0,(P,Z,))).

% c54-name[0.0] 个体工商户可以起字号（第54条；npc）
inst(r("c54-name",0,0,(P,))) :- cand(individualBusiness(P)).
permissiveRule(r("c54-name",0,0,(P,)),adoptTradeName(P)) :- inst(r("c54-name",0,0,(P,))).
mainHead(r("c54-name",0,0,(P,)),permissiveRule,adoptTradeName(P)) :- inst(r("c54-name",0,0,(P,))).
cand(adoptTradeName(P)) :- inst(r("c54-name",0,0,(P,))).
body(r("c54-name",0,0,(P,)),individualBusiness(P)) :- inst(r("c54-name",0,0,(P,))).

% c55[0.0] 农村集体经济组织的成员，依法取得农村土地承包经营权，从事家庭承包经营的，为农村承包经营户（第55条；npc）
inst(r("c55",0,0,(P,))) :- cand(collectiveMember(P)), cand(obtainedLandContractRight(P)), cand(familyContractOperation(P)).
constitutiveRule(r("c55",0,0,(P,)),ruralContractHousehold(P)) :- inst(r("c55",0,0,(P,))).
mainHead(r("c55",0,0,(P,)),constitutiveRule,ruralContractHousehold(P)) :- inst(r("c55",0,0,(P,))).
cand(ruralContractHousehold(P)) :- inst(r("c55",0,0,(P,))).
body(r("c55",0,0,(P,)),collectiveMember(P)) :- inst(r("c55",0,0,(P,))).
body(r("c55",0,0,(P,)),obtainedLandContractRight(P)) :- inst(r("c55",0,0,(P,))).
body(r("c55",0,0,(P,)),familyContractOperation(P)) :- inst(r("c55",0,0,(P,))).

% c56-2a[0.0] 农村承包经营户的债务，以从事农村土地承包经营的农户财产承担（第56条第2款；npc）
inst(r("c56-2a",0,0,(P,Z,))) :- cand(ruralContractHousehold(P)), cand(debtOfOperator(Z,P)).
constitutiveRule(r("c56-2a",0,0,(P,Z,)),payableFromHouseholdAssets(Z)) :- inst(r("c56-2a",0,0,(P,Z,))).
mainHead(r("c56-2a",0,0,(P,Z,)),constitutiveRule,payableFromHouseholdAssets(Z)) :- inst(r("c56-2a",0,0,(P,Z,))).
cand(payableFromHouseholdAssets(Z)) :- inst(r("c56-2a",0,0,(P,Z,))).
body(r("c56-2a",0,0,(P,Z,)),ruralContractHousehold(P)) :- inst(r("c56-2a",0,0,(P,Z,))).
body(r("c56-2a",0,0,(P,Z,)),debtOfOperator(Z,P)) :- inst(r("c56-2a",0,0,(P,Z,))).
inst(x("c56-2a",0,0,0,(P,Z,))) :- inst(r("c56-2a",0,0,(P,Z,))), cand(operatedByPartOfMembers(P)).
constitutiveRule(x("c56-2a",0,0,0,(P,Z,)),non(payableFromHouseholdAssets(Z))) :- inst(x("c56-2a",0,0,0,(P,Z,))).
body(x("c56-2a",0,0,0,(P,Z,)),ruralContractHousehold(P)) :- inst(x("c56-2a",0,0,0,(P,Z,))).
body(x("c56-2a",0,0,0,(P,Z,)),debtOfOperator(Z,P)) :- inst(x("c56-2a",0,0,0,(P,Z,))).
body(x("c56-2a",0,0,0,(P,Z,)),operatedByPartOfMembers(P)) :- inst(x("c56-2a",0,0,0,(P,Z,))).
superior(x("c56-2a",0,0,0,(P,Z,)),r("c56-2a",0,0,(P,Z,))) :- inst(x("c56-2a",0,0,0,(P,Z,))).
exc(x("c56-2a",0,0,0,(P,Z,)),r("c56-2a",0,0,(P,Z,)),constitutiveRule,payableFromHouseholdAssets(Z)) :- inst(x("c56-2a",0,0,0,(P,Z,))).

% c56-2b[0.0] 事实上由农户部分成员经营的，以该部分成员的财产承担（第56条第2款；npc）
inst(r("c56-2b",0,0,(P,Z,))) :- cand(ruralContractHousehold(P)), cand(debtOfOperator(Z,P)), cand(operatedByPartOfMembers(P)).
constitutiveRule(r("c56-2b",0,0,(P,Z,)),payableFromOperatingMembersAssets(Z)) :- inst(r("c56-2b",0,0,(P,Z,))).
mainHead(r("c56-2b",0,0,(P,Z,)),constitutiveRule,payableFromOperatingMembersAssets(Z)) :- inst(r("c56-2b",0,0,(P,Z,))).
cand(payableFromOperatingMembersAssets(Z)) :- inst(r("c56-2b",0,0,(P,Z,))).
body(r("c56-2b",0,0,(P,Z,)),ruralContractHousehold(P)) :- inst(r("c56-2b",0,0,(P,Z,))).
body(r("c56-2b",0,0,(P,Z,)),debtOfOperator(Z,P)) :- inst(r("c56-2b",0,0,(P,Z,))).
body(r("c56-2b",0,0,(P,Z,)),operatedByPartOfMembers(P)) :- inst(r("c56-2b",0,0,(P,Z,))).

% —— Naf 的语义是“仅阻断宿主规则”：其他推出同一结论的规则实例优先于该例外 ——
superior(L2,XL) :- exc(XL,L,T,H), mainHead(L2,T,H), L2 != L.
% —— Override → superior ——
superior(r("c21-2",0,0,(P,)),r("c19",0,0,(P,))) :- inst(r("c21-2",0,0,(P,))), inst(r("c19",0,0,(P,))).
superior(r("c21-2",0,1,(P,)),r("c19",0,0,(P,))) :- inst(r("c21-2",0,1,(P,))), inst(r("c19",0,0,(P,))).
superior(r("c18-emancipated",0,0,(P,)),r("c19",0,0,(P,))) :- inst(r("c18-emancipated",0,0,(P,))), inst(r("c19",0,0,(P,))).
superior(r("c18-emancipated",0,1,(P,)),r("c19",0,0,(P,))) :- inst(r("c18-emancipated",0,1,(P,))), inst(r("c19",0,0,(P,))).
superior(r("c36-effect",0,0,(C,G,)),r("c27-1",0,0,(C,Pa,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c27-1",0,0,(C,Pa,))).
superior(r("c36-effect",0,0,(C,G,)),r("c27-2-1",0,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c27-2-1",0,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c27-2-1",0,1,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c27-2-1",0,1,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c27-2-2",0,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c27-2-2",0,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c27-2-2",0,1,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c27-2-2",0,1,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c27-2-3",0,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c27-2-3",0,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c27-2-3",1,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c27-2-3",1,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c28-1",0,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c28-1",0,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c28-1",0,1,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c28-1",0,1,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c28-2",0,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c28-2",0,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c28-2",0,1,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c28-2",0,1,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c28-2",1,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c28-2",1,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c28-2",1,1,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c28-2",1,1,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c28-3",0,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c28-3",0,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c28-3",0,1,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c28-3",0,1,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c28-4",0,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c28-4",0,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c28-4",1,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c28-4",1,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c29-effect",0,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c29-effect",0,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c29-effect",0,1,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c29-effect",0,1,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c30",0,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c30",0,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c30",0,1,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c30",0,1,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c31-designated",0,0,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c31-designated",0,0,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c31-designated",0,1,(C,G,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c31-designated",0,1,(C,G,))).
superior(r("c36-effect",0,0,(C,G,)),r("c32",0,0,(C,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c32",0,0,(C,))).
superior(r("c36-effect",0,0,(C,G,)),r("c33",0,0,(G,P,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c33",0,0,(G,P,))).
superior(r("c36-effect",0,0,(C,G,)),r("c33",0,1,(G,P,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c33",0,1,(G,P,))).
superior(r("c36-effect",0,0,(C,G,)),r("c33",1,0,(G,P,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c33",1,0,(G,P,))).
superior(r("c36-effect",0,0,(C,G,)),r("c33",1,1,(G,P,))) :- inst(r("c36-effect",0,0,(C,G,))), inst(r("c33",1,1,(G,P,))).
superior(r("c39-end",0,0,(C,G,)),r("c27-1",0,0,(C,Pa,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c27-1",0,0,(C,Pa,))).
superior(r("c39-end",0,0,(C,G,)),r("c27-2-1",0,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c27-2-1",0,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c27-2-1",0,1,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c27-2-1",0,1,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c27-2-2",0,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c27-2-2",0,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c27-2-2",0,1,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c27-2-2",0,1,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c27-2-3",0,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c27-2-3",0,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c27-2-3",1,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c27-2-3",1,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c28-1",0,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c28-1",0,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c28-1",0,1,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c28-1",0,1,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c28-2",0,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c28-2",0,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c28-2",0,1,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c28-2",0,1,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c28-2",1,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c28-2",1,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c28-2",1,1,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c28-2",1,1,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c28-3",0,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c28-3",0,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c28-3",0,1,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c28-3",0,1,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c28-4",0,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c28-4",0,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c28-4",1,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c28-4",1,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c29-effect",0,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c29-effect",0,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c29-effect",0,1,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c29-effect",0,1,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c30",0,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c30",0,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c30",0,1,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c30",0,1,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c31-designated",0,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c31-designated",0,0,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c31-designated",0,1,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c31-designated",0,1,(C,G,))).
superior(r("c39-end",0,0,(C,G,)),r("c32",0,0,(C,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c32",0,0,(C,))).
superior(r("c39-end",0,0,(C,G,)),r("c33",0,0,(G,P,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c33",0,0,(G,P,))).
superior(r("c39-end",0,0,(C,G,)),r("c33",0,1,(G,P,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c33",0,1,(G,P,))).
superior(r("c39-end",0,0,(C,G,)),r("c33",1,0,(G,P,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c33",1,0,(G,P,))).
superior(r("c39-end",0,0,(C,G,)),r("c33",1,1,(G,P,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c33",1,1,(G,P,))).
superior(r("c39-end",0,0,(C,G,)),r("c38-restored",0,0,(C,G,))) :- inst(r("c39-end",0,0,(C,G,))), inst(r("c38-restored",0,0,(C,G,))).
superior(r("c38-restored",0,0,(C,G,)),r("c36-effect",0,0,(C,G,))) :- inst(r("c38-restored",0,0,(C,G,))), inst(r("c36-effect",0,0,(C,G,))).
