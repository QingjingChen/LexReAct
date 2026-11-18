% 由 lrml2ddl.py 从 civil_graph.lrml 生成。配合 ddl_engine/language.asp + Deontic/defeasible-ab.asp + Deontic/deontic.asp 使用。
isNon(non(A)) :- fact(non(A)).
cand(A) :- fact(A), not isNon(A).
cand(A) :- fact(non(A)).
atom(A) :- cand(A).
true.

% tx-g0027[0.0] 分类（自动抽取自图的层级）：人格权 ⊑ 人身权
inst(r("tx-g0027",0,0,(X,))) :- cand(isA(X,"人格权")).
constitutiveRule(r("tx-g0027",0,0,(X,)),isA(X,"人身权")) :- inst(r("tx-g0027",0,0,(X,))).
mainHead(r("tx-g0027",0,0,(X,)),constitutiveRule,isA(X,"人身权")) :- inst(r("tx-g0027",0,0,(X,))).
cand(isA(X,"人身权")) :- inst(r("tx-g0027",0,0,(X,))).
body(r("tx-g0027",0,0,(X,)),isA(X,"人格权")) :- inst(r("tx-g0027",0,0,(X,))).

% tx-g0030[0.0] 分类（自动抽取自图的层级）：身份权 ⊑ 人身权
inst(r("tx-g0030",0,0,(X,))) :- cand(isA(X,"身份权")).
constitutiveRule(r("tx-g0030",0,0,(X,)),isA(X,"人身权")) :- inst(r("tx-g0030",0,0,(X,))).
mainHead(r("tx-g0030",0,0,(X,)),constitutiveRule,isA(X,"人身权")) :- inst(r("tx-g0030",0,0,(X,))).
cand(isA(X,"人身权")) :- inst(r("tx-g0030",0,0,(X,))).
body(r("tx-g0030",0,0,(X,)),isA(X,"身份权")) :- inst(r("tx-g0030",0,0,(X,))).

% tx-g0028[0.0] 分类（自动抽取自图的层级）：具体人格权 ⊑ 人格权
inst(r("tx-g0028",0,0,(X,))) :- cand(isA(X,"具体人格权")).
constitutiveRule(r("tx-g0028",0,0,(X,)),isA(X,"人格权")) :- inst(r("tx-g0028",0,0,(X,))).
mainHead(r("tx-g0028",0,0,(X,)),constitutiveRule,isA(X,"人格权")) :- inst(r("tx-g0028",0,0,(X,))).
cand(isA(X,"人格权")) :- inst(r("tx-g0028",0,0,(X,))).
body(r("tx-g0028",0,0,(X,)),isA(X,"具体人格权")) :- inst(r("tx-g0028",0,0,(X,))).

% tx-g0029[0.0] 分类（自动抽取自图的层级）：一般人格权 ⊑ 人格权
inst(r("tx-g0029",0,0,(X,))) :- cand(isA(X,"一般人格权")).
constitutiveRule(r("tx-g0029",0,0,(X,)),isA(X,"人格权")) :- inst(r("tx-g0029",0,0,(X,))).
mainHead(r("tx-g0029",0,0,(X,)),constitutiveRule,isA(X,"人格权")) :- inst(r("tx-g0029",0,0,(X,))).
cand(isA(X,"人格权")) :- inst(r("tx-g0029",0,0,(X,))).
body(r("tx-g0029",0,0,(X,)),isA(X,"一般人格权")) :- inst(r("tx-g0029",0,0,(X,))).

% tx-g0034[0.0] 分类（自动抽取自图的层级）：自物权 ⊑ 物权
inst(r("tx-g0034",0,0,(X,))) :- cand(isA(X,"自物权")).
constitutiveRule(r("tx-g0034",0,0,(X,)),isA(X,"物权")) :- inst(r("tx-g0034",0,0,(X,))).
mainHead(r("tx-g0034",0,0,(X,)),constitutiveRule,isA(X,"物权")) :- inst(r("tx-g0034",0,0,(X,))).
cand(isA(X,"物权")) :- inst(r("tx-g0034",0,0,(X,))).
body(r("tx-g0034",0,0,(X,)),isA(X,"自物权")) :- inst(r("tx-g0034",0,0,(X,))).

% tx-g0038[0.0] 分类（自动抽取自图的层级）：他物权 ⊑ 物权
inst(r("tx-g0038",0,0,(X,))) :- cand(isA(X,"他物权")).
constitutiveRule(r("tx-g0038",0,0,(X,)),isA(X,"物权")) :- inst(r("tx-g0038",0,0,(X,))).
mainHead(r("tx-g0038",0,0,(X,)),constitutiveRule,isA(X,"物权")) :- inst(r("tx-g0038",0,0,(X,))).
cand(isA(X,"物权")) :- inst(r("tx-g0038",0,0,(X,))).
body(r("tx-g0038",0,0,(X,)),isA(X,"他物权")) :- inst(r("tx-g0038",0,0,(X,))).

% tx-g0039[0.0] 分类（自动抽取自图的层级）：用益物权 ⊑ 他物权
inst(r("tx-g0039",0,0,(X,))) :- cand(isA(X,"用益物权")).
constitutiveRule(r("tx-g0039",0,0,(X,)),isA(X,"他物权")) :- inst(r("tx-g0039",0,0,(X,))).
mainHead(r("tx-g0039",0,0,(X,)),constitutiveRule,isA(X,"他物权")) :- inst(r("tx-g0039",0,0,(X,))).
cand(isA(X,"他物权")) :- inst(r("tx-g0039",0,0,(X,))).
body(r("tx-g0039",0,0,(X,)),isA(X,"用益物权")) :- inst(r("tx-g0039",0,0,(X,))).

% tx-g0046[0.0] 分类（自动抽取自图的层级）：担保物权 ⊑ 他物权
inst(r("tx-g0046",0,0,(X,))) :- cand(isA(X,"担保物权")).
constitutiveRule(r("tx-g0046",0,0,(X,)),isA(X,"他物权")) :- inst(r("tx-g0046",0,0,(X,))).
mainHead(r("tx-g0046",0,0,(X,)),constitutiveRule,isA(X,"他物权")) :- inst(r("tx-g0046",0,0,(X,))).
cand(isA(X,"他物权")) :- inst(r("tx-g0046",0,0,(X,))).
body(r("tx-g0046",0,0,(X,)),isA(X,"担保物权")) :- inst(r("tx-g0046",0,0,(X,))).

% tx-g0040[0.0] 分类（自动抽取自图的层级）：建设用地使用权 ⊑ 用益物权
inst(r("tx-g0040",0,0,(X,))) :- cand(isA(X,"建设用地使用权")).
constitutiveRule(r("tx-g0040",0,0,(X,)),isA(X,"用益物权")) :- inst(r("tx-g0040",0,0,(X,))).
mainHead(r("tx-g0040",0,0,(X,)),constitutiveRule,isA(X,"用益物权")) :- inst(r("tx-g0040",0,0,(X,))).
cand(isA(X,"用益物权")) :- inst(r("tx-g0040",0,0,(X,))).
body(r("tx-g0040",0,0,(X,)),isA(X,"建设用地使用权")) :- inst(r("tx-g0040",0,0,(X,))).

% tx-g0041[0.0] 分类（自动抽取自图的层级）：宅基地使用权 ⊑ 用益物权
inst(r("tx-g0041",0,0,(X,))) :- cand(isA(X,"宅基地使用权")).
constitutiveRule(r("tx-g0041",0,0,(X,)),isA(X,"用益物权")) :- inst(r("tx-g0041",0,0,(X,))).
mainHead(r("tx-g0041",0,0,(X,)),constitutiveRule,isA(X,"用益物权")) :- inst(r("tx-g0041",0,0,(X,))).
cand(isA(X,"用益物权")) :- inst(r("tx-g0041",0,0,(X,))).
body(r("tx-g0041",0,0,(X,)),isA(X,"宅基地使用权")) :- inst(r("tx-g0041",0,0,(X,))).

% tx-g0042[0.0] 分类（自动抽取自图的层级）：居住权 ⊑ 用益物权
inst(r("tx-g0042",0,0,(X,))) :- cand(isA(X,"居住权")).
constitutiveRule(r("tx-g0042",0,0,(X,)),isA(X,"用益物权")) :- inst(r("tx-g0042",0,0,(X,))).
mainHead(r("tx-g0042",0,0,(X,)),constitutiveRule,isA(X,"用益物权")) :- inst(r("tx-g0042",0,0,(X,))).
cand(isA(X,"用益物权")) :- inst(r("tx-g0042",0,0,(X,))).
body(r("tx-g0042",0,0,(X,)),isA(X,"居住权")) :- inst(r("tx-g0042",0,0,(X,))).

% tx-g0043[0.0] 分类（自动抽取自图的层级）：地役权 ⊑ 用益物权
inst(r("tx-g0043",0,0,(X,))) :- cand(isA(X,"地役权")).
constitutiveRule(r("tx-g0043",0,0,(X,)),isA(X,"用益物权")) :- inst(r("tx-g0043",0,0,(X,))).
mainHead(r("tx-g0043",0,0,(X,)),constitutiveRule,isA(X,"用益物权")) :- inst(r("tx-g0043",0,0,(X,))).
cand(isA(X,"用益物权")) :- inst(r("tx-g0043",0,0,(X,))).
body(r("tx-g0043",0,0,(X,)),isA(X,"地役权")) :- inst(r("tx-g0043",0,0,(X,))).

% tx-g0044[0.0] 分类（自动抽取自图的层级）：土地承包经营权 ⊑ 用益物权
inst(r("tx-g0044",0,0,(X,))) :- cand(isA(X,"土地承包经营权")).
constitutiveRule(r("tx-g0044",0,0,(X,)),isA(X,"用益物权")) :- inst(r("tx-g0044",0,0,(X,))).
mainHead(r("tx-g0044",0,0,(X,)),constitutiveRule,isA(X,"用益物权")) :- inst(r("tx-g0044",0,0,(X,))).
cand(isA(X,"用益物权")) :- inst(r("tx-g0044",0,0,(X,))).
body(r("tx-g0044",0,0,(X,)),isA(X,"土地承包经营权")) :- inst(r("tx-g0044",0,0,(X,))).

% tx-g0045[0.0] 分类（自动抽取自图的层级）：海域使用权 ⊑ 用益物权
inst(r("tx-g0045",0,0,(X,))) :- cand(isA(X,"海域使用权")).
constitutiveRule(r("tx-g0045",0,0,(X,)),isA(X,"用益物权")) :- inst(r("tx-g0045",0,0,(X,))).
mainHead(r("tx-g0045",0,0,(X,)),constitutiveRule,isA(X,"用益物权")) :- inst(r("tx-g0045",0,0,(X,))).
cand(isA(X,"用益物权")) :- inst(r("tx-g0045",0,0,(X,))).
body(r("tx-g0045",0,0,(X,)),isA(X,"海域使用权")) :- inst(r("tx-g0045",0,0,(X,))).

% tx-g0047[0.0] 分类（自动抽取自图的层级）：抵押权 ⊑ 担保物权
inst(r("tx-g0047",0,0,(X,))) :- cand(isA(X,"抵押权")).
constitutiveRule(r("tx-g0047",0,0,(X,)),isA(X,"担保物权")) :- inst(r("tx-g0047",0,0,(X,))).
mainHead(r("tx-g0047",0,0,(X,)),constitutiveRule,isA(X,"担保物权")) :- inst(r("tx-g0047",0,0,(X,))).
cand(isA(X,"担保物权")) :- inst(r("tx-g0047",0,0,(X,))).
body(r("tx-g0047",0,0,(X,)),isA(X,"抵押权")) :- inst(r("tx-g0047",0,0,(X,))).

% tx-g0048[0.0] 分类（自动抽取自图的层级）：质权 ⊑ 担保物权
inst(r("tx-g0048",0,0,(X,))) :- cand(isA(X,"质权")).
constitutiveRule(r("tx-g0048",0,0,(X,)),isA(X,"担保物权")) :- inst(r("tx-g0048",0,0,(X,))).
mainHead(r("tx-g0048",0,0,(X,)),constitutiveRule,isA(X,"担保物权")) :- inst(r("tx-g0048",0,0,(X,))).
cand(isA(X,"担保物权")) :- inst(r("tx-g0048",0,0,(X,))).
body(r("tx-g0048",0,0,(X,)),isA(X,"质权")) :- inst(r("tx-g0048",0,0,(X,))).

% tx-g0049[0.0] 分类（自动抽取自图的层级）：留置权 ⊑ 担保物权
inst(r("tx-g0049",0,0,(X,))) :- cand(isA(X,"留置权")).
constitutiveRule(r("tx-g0049",0,0,(X,)),isA(X,"担保物权")) :- inst(r("tx-g0049",0,0,(X,))).
mainHead(r("tx-g0049",0,0,(X,)),constitutiveRule,isA(X,"担保物权")) :- inst(r("tx-g0049",0,0,(X,))).
cand(isA(X,"担保物权")) :- inst(r("tx-g0049",0,0,(X,))).
body(r("tx-g0049",0,0,(X,)),isA(X,"留置权")) :- inst(r("tx-g0049",0,0,(X,))).

% tx-g0052[0.0] 分类（自动抽取自图的层级）：商标权 ⊑ 知识产权
inst(r("tx-g0052",0,0,(X,))) :- cand(isA(X,"商标权")).
constitutiveRule(r("tx-g0052",0,0,(X,)),isA(X,"知识产权")) :- inst(r("tx-g0052",0,0,(X,))).
mainHead(r("tx-g0052",0,0,(X,)),constitutiveRule,isA(X,"知识产权")) :- inst(r("tx-g0052",0,0,(X,))).
cand(isA(X,"知识产权")) :- inst(r("tx-g0052",0,0,(X,))).
body(r("tx-g0052",0,0,(X,)),isA(X,"商标权")) :- inst(r("tx-g0052",0,0,(X,))).

% tx-g0053[0.0] 分类（自动抽取自图的层级）：专利权 ⊑ 知识产权
inst(r("tx-g0053",0,0,(X,))) :- cand(isA(X,"专利权")).
constitutiveRule(r("tx-g0053",0,0,(X,)),isA(X,"知识产权")) :- inst(r("tx-g0053",0,0,(X,))).
mainHead(r("tx-g0053",0,0,(X,)),constitutiveRule,isA(X,"知识产权")) :- inst(r("tx-g0053",0,0,(X,))).
cand(isA(X,"知识产权")) :- inst(r("tx-g0053",0,0,(X,))).
body(r("tx-g0053",0,0,(X,)),isA(X,"专利权")) :- inst(r("tx-g0053",0,0,(X,))).

% tx-g0054[0.0] 分类（自动抽取自图的层级）：著作权 ⊑ 知识产权
inst(r("tx-g0054",0,0,(X,))) :- cand(isA(X,"著作权")).
constitutiveRule(r("tx-g0054",0,0,(X,)),isA(X,"知识产权")) :- inst(r("tx-g0054",0,0,(X,))).
mainHead(r("tx-g0054",0,0,(X,)),constitutiveRule,isA(X,"知识产权")) :- inst(r("tx-g0054",0,0,(X,))).
cand(isA(X,"知识产权")) :- inst(r("tx-g0054",0,0,(X,))).
body(r("tx-g0054",0,0,(X,)),isA(X,"著作权")) :- inst(r("tx-g0054",0,0,(X,))).

% tx-g0063[0.0] 分类（自动抽取自图的层级）：合同之债 ⊑ 意定之债
inst(r("tx-g0063",0,0,(X,))) :- cand(isA(X,"合同之债")).
constitutiveRule(r("tx-g0063",0,0,(X,)),isA(X,"意定之债")) :- inst(r("tx-g0063",0,0,(X,))).
mainHead(r("tx-g0063",0,0,(X,)),constitutiveRule,isA(X,"意定之债")) :- inst(r("tx-g0063",0,0,(X,))).
cand(isA(X,"意定之债")) :- inst(r("tx-g0063",0,0,(X,))).
body(r("tx-g0063",0,0,(X,)),isA(X,"合同之债")) :- inst(r("tx-g0063",0,0,(X,))).

% tx-g0064[0.0] 分类（自动抽取自图的层级）：单方允诺之债 ⊑ 意定之债
inst(r("tx-g0064",0,0,(X,))) :- cand(isA(X,"单方允诺之债")).
constitutiveRule(r("tx-g0064",0,0,(X,)),isA(X,"意定之债")) :- inst(r("tx-g0064",0,0,(X,))).
mainHead(r("tx-g0064",0,0,(X,)),constitutiveRule,isA(X,"意定之债")) :- inst(r("tx-g0064",0,0,(X,))).
cand(isA(X,"意定之债")) :- inst(r("tx-g0064",0,0,(X,))).
body(r("tx-g0064",0,0,(X,)),isA(X,"单方允诺之债")) :- inst(r("tx-g0064",0,0,(X,))).

% tx-g0237[0.0] 分类（自动抽取自图的层级）：平等原则 ⊑ 民法的基本原则
inst(r("tx-g0237",0,0,(X,))) :- cand(isA(X,"平等原则")).
constitutiveRule(r("tx-g0237",0,0,(X,)),isA(X,"民法的基本原则")) :- inst(r("tx-g0237",0,0,(X,))).
mainHead(r("tx-g0237",0,0,(X,)),constitutiveRule,isA(X,"民法的基本原则")) :- inst(r("tx-g0237",0,0,(X,))).
cand(isA(X,"民法的基本原则")) :- inst(r("tx-g0237",0,0,(X,))).
body(r("tx-g0237",0,0,(X,)),isA(X,"平等原则")) :- inst(r("tx-g0237",0,0,(X,))).

% tx-g0250[0.0] 分类（自动抽取自图的层级）：自愿原则 ⊑ 民法的基本原则
inst(r("tx-g0250",0,0,(X,))) :- cand(isA(X,"自愿原则")).
constitutiveRule(r("tx-g0250",0,0,(X,)),isA(X,"民法的基本原则")) :- inst(r("tx-g0250",0,0,(X,))).
mainHead(r("tx-g0250",0,0,(X,)),constitutiveRule,isA(X,"民法的基本原则")) :- inst(r("tx-g0250",0,0,(X,))).
cand(isA(X,"民法的基本原则")) :- inst(r("tx-g0250",0,0,(X,))).
body(r("tx-g0250",0,0,(X,)),isA(X,"自愿原则")) :- inst(r("tx-g0250",0,0,(X,))).

% tx-g0265[0.0] 分类（自动抽取自图的层级）：公平原则 ⊑ 民法的基本原则
inst(r("tx-g0265",0,0,(X,))) :- cand(isA(X,"公平原则")).
constitutiveRule(r("tx-g0265",0,0,(X,)),isA(X,"民法的基本原则")) :- inst(r("tx-g0265",0,0,(X,))).
mainHead(r("tx-g0265",0,0,(X,)),constitutiveRule,isA(X,"民法的基本原则")) :- inst(r("tx-g0265",0,0,(X,))).
cand(isA(X,"民法的基本原则")) :- inst(r("tx-g0265",0,0,(X,))).
body(r("tx-g0265",0,0,(X,)),isA(X,"公平原则")) :- inst(r("tx-g0265",0,0,(X,))).

% tx-g0286[0.0] 分类（自动抽取自图的层级）：合法原则 ⊑ 民法的基本原则
inst(r("tx-g0286",0,0,(X,))) :- cand(isA(X,"合法原则")).
constitutiveRule(r("tx-g0286",0,0,(X,)),isA(X,"民法的基本原则")) :- inst(r("tx-g0286",0,0,(X,))).
mainHead(r("tx-g0286",0,0,(X,)),constitutiveRule,isA(X,"民法的基本原则")) :- inst(r("tx-g0286",0,0,(X,))).
cand(isA(X,"民法的基本原则")) :- inst(r("tx-g0286",0,0,(X,))).
body(r("tx-g0286",0,0,(X,)),isA(X,"合法原则")) :- inst(r("tx-g0286",0,0,(X,))).

% tx-g0291[0.0] 分类（自动抽取自图的层级）：公序良俗原则 ⊑ 民法的基本原则
inst(r("tx-g0291",0,0,(X,))) :- cand(isA(X,"公序良俗原则")).
constitutiveRule(r("tx-g0291",0,0,(X,)),isA(X,"民法的基本原则")) :- inst(r("tx-g0291",0,0,(X,))).
mainHead(r("tx-g0291",0,0,(X,)),constitutiveRule,isA(X,"民法的基本原则")) :- inst(r("tx-g0291",0,0,(X,))).
cand(isA(X,"民法的基本原则")) :- inst(r("tx-g0291",0,0,(X,))).
body(r("tx-g0291",0,0,(X,)),isA(X,"公序良俗原则")) :- inst(r("tx-g0291",0,0,(X,))).

% tx-g0310[0.0] 分类（自动抽取自图的层级）：绿色原则 ⊑ 民法的基本原则
inst(r("tx-g0310",0,0,(X,))) :- cand(isA(X,"绿色原则")).
constitutiveRule(r("tx-g0310",0,0,(X,)),isA(X,"民法的基本原则")) :- inst(r("tx-g0310",0,0,(X,))).
mainHead(r("tx-g0310",0,0,(X,)),constitutiveRule,isA(X,"民法的基本原则")) :- inst(r("tx-g0310",0,0,(X,))).
cand(isA(X,"民法的基本原则")) :- inst(r("tx-g0310",0,0,(X,))).
body(r("tx-g0310",0,0,(X,)),isA(X,"绿色原则")) :- inst(r("tx-g0310",0,0,(X,))).

% tx-g0300[0.0] 分类（自动抽取自图的层级）：危害国家公序的行为类型 ⊑ 违反公序良俗行为类型
inst(r("tx-g0300",0,0,(X,))) :- cand(isA(X,"危害国家公序的行为类型")).
constitutiveRule(r("tx-g0300",0,0,(X,)),isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0300",0,0,(X,))).
mainHead(r("tx-g0300",0,0,(X,)),constitutiveRule,isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0300",0,0,(X,))).
cand(isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0300",0,0,(X,))).
body(r("tx-g0300",0,0,(X,)),isA(X,"危害国家公序的行为类型")) :- inst(r("tx-g0300",0,0,(X,))).

% tx-g0301[0.0] 分类（自动抽取自图的层级）：危害家庭关系的行为类型 ⊑ 违反公序良俗行为类型
inst(r("tx-g0301",0,0,(X,))) :- cand(isA(X,"危害家庭关系的行为类型")).
constitutiveRule(r("tx-g0301",0,0,(X,)),isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0301",0,0,(X,))).
mainHead(r("tx-g0301",0,0,(X,)),constitutiveRule,isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0301",0,0,(X,))).
cand(isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0301",0,0,(X,))).
body(r("tx-g0301",0,0,(X,)),isA(X,"危害家庭关系的行为类型")) :- inst(r("tx-g0301",0,0,(X,))).

% tx-g0303[0.0] 分类（自动抽取自图的层级）：射幸行为类型 ⊑ 违反公序良俗行为类型
inst(r("tx-g0303",0,0,(X,))) :- cand(isA(X,"射幸行为类型")).
constitutiveRule(r("tx-g0303",0,0,(X,)),isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0303",0,0,(X,))).
mainHead(r("tx-g0303",0,0,(X,)),constitutiveRule,isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0303",0,0,(X,))).
cand(isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0303",0,0,(X,))).
body(r("tx-g0303",0,0,(X,)),isA(X,"射幸行为类型")) :- inst(r("tx-g0303",0,0,(X,))).

% tx-g0305[0.0] 分类（自动抽取自图的层级）：限制营业自由的行为类型 ⊑ 违反公序良俗行为类型
inst(r("tx-g0305",0,0,(X,))) :- cand(isA(X,"限制营业自由的行为类型")).
constitutiveRule(r("tx-g0305",0,0,(X,)),isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0305",0,0,(X,))).
mainHead(r("tx-g0305",0,0,(X,)),constitutiveRule,isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0305",0,0,(X,))).
cand(isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0305",0,0,(X,))).
body(r("tx-g0305",0,0,(X,)),isA(X,"限制营业自由的行为类型")) :- inst(r("tx-g0305",0,0,(X,))).

% tx-g0306[0.0] 分类（自动抽取自图的层级）：违反公共竞争的行为类型 ⊑ 违反公序良俗行为类型
inst(r("tx-g0306",0,0,(X,))) :- cand(isA(X,"违反公共竞争的行为类型")).
constitutiveRule(r("tx-g0306",0,0,(X,)),isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0306",0,0,(X,))).
mainHead(r("tx-g0306",0,0,(X,)),constitutiveRule,isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0306",0,0,(X,))).
cand(isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0306",0,0,(X,))).
body(r("tx-g0306",0,0,(X,)),isA(X,"违反公共竞争的行为类型")) :- inst(r("tx-g0306",0,0,(X,))).

% tx-g0307[0.0] 分类（自动抽取自图的层级）：违反消费者保护的行为类型 ⊑ 违反公序良俗行为类型
inst(r("tx-g0307",0,0,(X,))) :- cand(isA(X,"违反消费者保护的行为类型")).
constitutiveRule(r("tx-g0307",0,0,(X,)),isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0307",0,0,(X,))).
mainHead(r("tx-g0307",0,0,(X,)),constitutiveRule,isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0307",0,0,(X,))).
cand(isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0307",0,0,(X,))).
body(r("tx-g0307",0,0,(X,)),isA(X,"违反消费者保护的行为类型")) :- inst(r("tx-g0307",0,0,(X,))).

% tx-g0308[0.0] 分类（自动抽取自图的层级）：违反劳动者保护的行为类型 ⊑ 违反公序良俗行为类型
inst(r("tx-g0308",0,0,(X,))) :- cand(isA(X,"违反劳动者保护的行为类型")).
constitutiveRule(r("tx-g0308",0,0,(X,)),isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0308",0,0,(X,))).
mainHead(r("tx-g0308",0,0,(X,)),constitutiveRule,isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0308",0,0,(X,))).
cand(isA(X,"违反公序良俗行为类型")) :- inst(r("tx-g0308",0,0,(X,))).
body(r("tx-g0308",0,0,(X,)),isA(X,"违反劳动者保护的行为类型")) :- inst(r("tx-g0308",0,0,(X,))).

% tx-g0395[0.0] 分类（自动抽取自图的层级）：物权法律关系的客体 ⊑ 民事法律关系的客体
inst(r("tx-g0395",0,0,(X,))) :- cand(isA(X,"物权法律关系的客体")).
constitutiveRule(r("tx-g0395",0,0,(X,)),isA(X,"民事法律关系的客体")) :- inst(r("tx-g0395",0,0,(X,))).
mainHead(r("tx-g0395",0,0,(X,)),constitutiveRule,isA(X,"民事法律关系的客体")) :- inst(r("tx-g0395",0,0,(X,))).
cand(isA(X,"民事法律关系的客体")) :- inst(r("tx-g0395",0,0,(X,))).
body(r("tx-g0395",0,0,(X,)),isA(X,"物权法律关系的客体")) :- inst(r("tx-g0395",0,0,(X,))).

% tx-g0399[0.0] 分类（自动抽取自图的层级）：债权法律关系的客体 ⊑ 民事法律关系的客体
inst(r("tx-g0399",0,0,(X,))) :- cand(isA(X,"债权法律关系的客体")).
constitutiveRule(r("tx-g0399",0,0,(X,)),isA(X,"民事法律关系的客体")) :- inst(r("tx-g0399",0,0,(X,))).
mainHead(r("tx-g0399",0,0,(X,)),constitutiveRule,isA(X,"民事法律关系的客体")) :- inst(r("tx-g0399",0,0,(X,))).
cand(isA(X,"民事法律关系的客体")) :- inst(r("tx-g0399",0,0,(X,))).
body(r("tx-g0399",0,0,(X,)),isA(X,"债权法律关系的客体")) :- inst(r("tx-g0399",0,0,(X,))).

% tx-g0402[0.0] 分类（自动抽取自图的层级）：人身权法律关系的客体 ⊑ 民事法律关系的客体
inst(r("tx-g0402",0,0,(X,))) :- cand(isA(X,"人身权法律关系的客体")).
constitutiveRule(r("tx-g0402",0,0,(X,)),isA(X,"民事法律关系的客体")) :- inst(r("tx-g0402",0,0,(X,))).
mainHead(r("tx-g0402",0,0,(X,)),constitutiveRule,isA(X,"民事法律关系的客体")) :- inst(r("tx-g0402",0,0,(X,))).
cand(isA(X,"民事法律关系的客体")) :- inst(r("tx-g0402",0,0,(X,))).
body(r("tx-g0402",0,0,(X,)),isA(X,"人身权法律关系的客体")) :- inst(r("tx-g0402",0,0,(X,))).

% tx-g0404[0.0] 分类（自动抽取自图的层级）：知识产权法律关系的客体 ⊑ 民事法律关系的客体
inst(r("tx-g0404",0,0,(X,))) :- cand(isA(X,"知识产权法律关系的客体")).
constitutiveRule(r("tx-g0404",0,0,(X,)),isA(X,"民事法律关系的客体")) :- inst(r("tx-g0404",0,0,(X,))).
mainHead(r("tx-g0404",0,0,(X,)),constitutiveRule,isA(X,"民事法律关系的客体")) :- inst(r("tx-g0404",0,0,(X,))).
cand(isA(X,"民事法律关系的客体")) :- inst(r("tx-g0404",0,0,(X,))).
body(r("tx-g0404",0,0,(X,)),isA(X,"知识产权法律关系的客体")) :- inst(r("tx-g0404",0,0,(X,))).

% tx-g0482[0.0] 分类（自动抽取自图的层级）：选择之债的选择权 ⊑ 形成权
inst(r("tx-g0482",0,0,(X,))) :- cand(isA(X,"选择之债的选择权")).
constitutiveRule(r("tx-g0482",0,0,(X,)),isA(X,"形成权")) :- inst(r("tx-g0482",0,0,(X,))).
mainHead(r("tx-g0482",0,0,(X,)),constitutiveRule,isA(X,"形成权")) :- inst(r("tx-g0482",0,0,(X,))).
cand(isA(X,"形成权")) :- inst(r("tx-g0482",0,0,(X,))).
body(r("tx-g0482",0,0,(X,)),isA(X,"选择之债的选择权")) :- inst(r("tx-g0482",0,0,(X,))).

% tx-g0485[0.0] 分类（自动抽取自图的层级）：效力待定合同的追认权 ⊑ 形成权
inst(r("tx-g0485",0,0,(X,))) :- cand(isA(X,"效力待定合同的追认权")).
constitutiveRule(r("tx-g0485",0,0,(X,)),isA(X,"形成权")) :- inst(r("tx-g0485",0,0,(X,))).
mainHead(r("tx-g0485",0,0,(X,)),constitutiveRule,isA(X,"形成权")) :- inst(r("tx-g0485",0,0,(X,))).
cand(isA(X,"形成权")) :- inst(r("tx-g0485",0,0,(X,))).
body(r("tx-g0485",0,0,(X,)),isA(X,"效力待定合同的追认权")) :- inst(r("tx-g0485",0,0,(X,))).

% tx-g0487[0.0] 分类（自动抽取自图的层级）：可撤销合同的撤销权 ⊑ 形成诉权
inst(r("tx-g0487",0,0,(X,))) :- cand(isA(X,"可撤销合同的撤销权")).
constitutiveRule(r("tx-g0487",0,0,(X,)),isA(X,"形成诉权")) :- inst(r("tx-g0487",0,0,(X,))).
mainHead(r("tx-g0487",0,0,(X,)),constitutiveRule,isA(X,"形成诉权")) :- inst(r("tx-g0487",0,0,(X,))).
cand(isA(X,"形成诉权")) :- inst(r("tx-g0487",0,0,(X,))).
body(r("tx-g0487",0,0,(X,)),isA(X,"可撤销合同的撤销权")) :- inst(r("tx-g0487",0,0,(X,))).

% tx-g0489[0.0] 分类（自动抽取自图的层级）：离婚财产分割请求权 ⊑ 形成诉权
inst(r("tx-g0489",0,0,(X,))) :- cand(isA(X,"离婚财产分割请求权")).
constitutiveRule(r("tx-g0489",0,0,(X,)),isA(X,"形成诉权")) :- inst(r("tx-g0489",0,0,(X,))).
mainHead(r("tx-g0489",0,0,(X,)),constitutiveRule,isA(X,"形成诉权")) :- inst(r("tx-g0489",0,0,(X,))).
cand(isA(X,"形成诉权")) :- inst(r("tx-g0489",0,0,(X,))).
body(r("tx-g0489",0,0,(X,)),isA(X,"离婚财产分割请求权")) :- inst(r("tx-g0489",0,0,(X,))).

% tx-g0682[0.0] 分类（自动抽取自图的层级）：有效的民事法律行为 ⊑ 民事法律行为
inst(r("tx-g0682",0,0,(X,))) :- cand(isA(X,"有效的民事法律行为")).
constitutiveRule(r("tx-g0682",0,0,(X,)),isA(X,"民事法律行为")) :- inst(r("tx-g0682",0,0,(X,))).
mainHead(r("tx-g0682",0,0,(X,)),constitutiveRule,isA(X,"民事法律行为")) :- inst(r("tx-g0682",0,0,(X,))).
cand(isA(X,"民事法律行为")) :- inst(r("tx-g0682",0,0,(X,))).
body(r("tx-g0682",0,0,(X,)),isA(X,"有效的民事法律行为")) :- inst(r("tx-g0682",0,0,(X,))).

% tx-g0683[0.0] 分类（自动抽取自图的层级）：效力未定的民事法律行为 ⊑ 民事法律行为
inst(r("tx-g0683",0,0,(X,))) :- cand(isA(X,"效力未定的民事法律行为")).
constitutiveRule(r("tx-g0683",0,0,(X,)),isA(X,"民事法律行为")) :- inst(r("tx-g0683",0,0,(X,))).
mainHead(r("tx-g0683",0,0,(X,)),constitutiveRule,isA(X,"民事法律行为")) :- inst(r("tx-g0683",0,0,(X,))).
cand(isA(X,"民事法律行为")) :- inst(r("tx-g0683",0,0,(X,))).
body(r("tx-g0683",0,0,(X,)),isA(X,"效力未定的民事法律行为")) :- inst(r("tx-g0683",0,0,(X,))).

% tx-g0684[0.0] 分类（自动抽取自图的层级）：可撤销的民事法律行为 ⊑ 民事法律行为
inst(r("tx-g0684",0,0,(X,))) :- cand(isA(X,"可撤销的民事法律行为")).
constitutiveRule(r("tx-g0684",0,0,(X,)),isA(X,"民事法律行为")) :- inst(r("tx-g0684",0,0,(X,))).
mainHead(r("tx-g0684",0,0,(X,)),constitutiveRule,isA(X,"民事法律行为")) :- inst(r("tx-g0684",0,0,(X,))).
cand(isA(X,"民事法律行为")) :- inst(r("tx-g0684",0,0,(X,))).
body(r("tx-g0684",0,0,(X,)),isA(X,"可撤销的民事法律行为")) :- inst(r("tx-g0684",0,0,(X,))).

% tx-g0685[0.0] 分类（自动抽取自图的层级）：无效的民事法律行为 ⊑ 民事法律行为
inst(r("tx-g0685",0,0,(X,))) :- cand(isA(X,"无效的民事法律行为")).
constitutiveRule(r("tx-g0685",0,0,(X,)),isA(X,"民事法律行为")) :- inst(r("tx-g0685",0,0,(X,))).
mainHead(r("tx-g0685",0,0,(X,)),constitutiveRule,isA(X,"民事法律行为")) :- inst(r("tx-g0685",0,0,(X,))).
cand(isA(X,"民事法律行为")) :- inst(r("tx-g0685",0,0,(X,))).
body(r("tx-g0685",0,0,(X,)),isA(X,"无效的民事法律行为")) :- inst(r("tx-g0685",0,0,(X,))).

% tx-g0686[0.0] 分类（自动抽取自图的层级）：成立未生效的民事法律行为 ⊑ 民事法律行为
inst(r("tx-g0686",0,0,(X,))) :- cand(isA(X,"成立未生效的民事法律行为")).
constitutiveRule(r("tx-g0686",0,0,(X,)),isA(X,"民事法律行为")) :- inst(r("tx-g0686",0,0,(X,))).
mainHead(r("tx-g0686",0,0,(X,)),constitutiveRule,isA(X,"民事法律行为")) :- inst(r("tx-g0686",0,0,(X,))).
cand(isA(X,"民事法律行为")) :- inst(r("tx-g0686",0,0,(X,))).
body(r("tx-g0686",0,0,(X,)),isA(X,"成立未生效的民事法律行为")) :- inst(r("tx-g0686",0,0,(X,))).

% c20[0.0] 不满八周岁的未成年人为无民事行为能力人（第20条；npc）
inst(r("c20",0,0,(P,))) :- cand(minor(P)), cand(under8(P)).
constitutiveRule(r("c20",0,0,(P,)),noCapacity(P)) :- inst(r("c20",0,0,(P,))).
mainHead(r("c20",0,0,(P,)),constitutiveRule,noCapacity(P)) :- inst(r("c20",0,0,(P,))).
cand(noCapacity(P)) :- inst(r("c20",0,0,(P,))).
body(r("c20",0,0,(P,)),minor(P)) :- inst(r("c20",0,0,(P,))).
body(r("c20",0,0,(P,)),under8(P)) :- inst(r("c20",0,0,(P,))).

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

% tx-g1079[0.0] 分类（自动抽取自图的层级）：营利法人的权力机构 ⊑ 营利法人的机构
inst(r("tx-g1079",0,0,(X,))) :- cand(isA(X,"营利法人的权力机构")).
constitutiveRule(r("tx-g1079",0,0,(X,)),isA(X,"营利法人的机构")) :- inst(r("tx-g1079",0,0,(X,))).
mainHead(r("tx-g1079",0,0,(X,)),constitutiveRule,isA(X,"营利法人的机构")) :- inst(r("tx-g1079",0,0,(X,))).
cand(isA(X,"营利法人的机构")) :- inst(r("tx-g1079",0,0,(X,))).
body(r("tx-g1079",0,0,(X,)),isA(X,"营利法人的权力机构")) :- inst(r("tx-g1079",0,0,(X,))).

% tx-g1086[0.0] 分类（自动抽取自图的层级）：营利法人的执行机构 ⊑ 营利法人的机构
inst(r("tx-g1086",0,0,(X,))) :- cand(isA(X,"营利法人的执行机构")).
constitutiveRule(r("tx-g1086",0,0,(X,)),isA(X,"营利法人的机构")) :- inst(r("tx-g1086",0,0,(X,))).
mainHead(r("tx-g1086",0,0,(X,)),constitutiveRule,isA(X,"营利法人的机构")) :- inst(r("tx-g1086",0,0,(X,))).
cand(isA(X,"营利法人的机构")) :- inst(r("tx-g1086",0,0,(X,))).
body(r("tx-g1086",0,0,(X,)),isA(X,"营利法人的执行机构")) :- inst(r("tx-g1086",0,0,(X,))).

% tx-g1095[0.0] 分类（自动抽取自图的层级）：营利法人的监督机构 ⊑ 营利法人的机构
inst(r("tx-g1095",0,0,(X,))) :- cand(isA(X,"营利法人的监督机构")).
constitutiveRule(r("tx-g1095",0,0,(X,)),isA(X,"营利法人的机构")) :- inst(r("tx-g1095",0,0,(X,))).
mainHead(r("tx-g1095",0,0,(X,)),constitutiveRule,isA(X,"营利法人的机构")) :- inst(r("tx-g1095",0,0,(X,))).
cand(isA(X,"营利法人的机构")) :- inst(r("tx-g1095",0,0,(X,))).
body(r("tx-g1095",0,0,(X,)),isA(X,"营利法人的监督机构")) :- inst(r("tx-g1095",0,0,(X,))).

% tx-g1236[0.0] 分类（自动抽取自图的层级）：组织机构的变更 ⊑ 法人的变更
inst(r("tx-g1236",0,0,(X,))) :- cand(isA(X,"组织机构的变更")).
constitutiveRule(r("tx-g1236",0,0,(X,)),isA(X,"法人的变更")) :- inst(r("tx-g1236",0,0,(X,))).
mainHead(r("tx-g1236",0,0,(X,)),constitutiveRule,isA(X,"法人的变更")) :- inst(r("tx-g1236",0,0,(X,))).
cand(isA(X,"法人的变更")) :- inst(r("tx-g1236",0,0,(X,))).
body(r("tx-g1236",0,0,(X,)),isA(X,"组织机构的变更")) :- inst(r("tx-g1236",0,0,(X,))).

% tx-g1247[0.0] 分类（自动抽取自图的层级）：法人的组织性质变更 ⊑ 法人的变更
inst(r("tx-g1247",0,0,(X,))) :- cand(isA(X,"法人的组织性质变更")).
constitutiveRule(r("tx-g1247",0,0,(X,)),isA(X,"法人的变更")) :- inst(r("tx-g1247",0,0,(X,))).
mainHead(r("tx-g1247",0,0,(X,)),constitutiveRule,isA(X,"法人的变更")) :- inst(r("tx-g1247",0,0,(X,))).
cand(isA(X,"法人的变更")) :- inst(r("tx-g1247",0,0,(X,))).
body(r("tx-g1247",0,0,(X,)),isA(X,"法人的组织性质变更")) :- inst(r("tx-g1247",0,0,(X,))).

% tx-g1249[0.0] 分类（自动抽取自图的层级）：其他事项的变更 ⊑ 法人的变更
inst(r("tx-g1249",0,0,(X,))) :- cand(isA(X,"其他事项的变更")).
constitutiveRule(r("tx-g1249",0,0,(X,)),isA(X,"法人的变更")) :- inst(r("tx-g1249",0,0,(X,))).
mainHead(r("tx-g1249",0,0,(X,)),constitutiveRule,isA(X,"法人的变更")) :- inst(r("tx-g1249",0,0,(X,))).
cand(isA(X,"法人的变更")) :- inst(r("tx-g1249",0,0,(X,))).
body(r("tx-g1249",0,0,(X,)),isA(X,"其他事项的变更")) :- inst(r("tx-g1249",0,0,(X,))).

% tx-g1446[0.0] 分类（自动抽取自图的层级）：口头形式 ⊑ 意思表示的形式
inst(r("tx-g1446",0,0,(X,))) :- cand(isA(X,"口头形式")).
constitutiveRule(r("tx-g1446",0,0,(X,)),isA(X,"意思表示的形式")) :- inst(r("tx-g1446",0,0,(X,))).
mainHead(r("tx-g1446",0,0,(X,)),constitutiveRule,isA(X,"意思表示的形式")) :- inst(r("tx-g1446",0,0,(X,))).
cand(isA(X,"意思表示的形式")) :- inst(r("tx-g1446",0,0,(X,))).
body(r("tx-g1446",0,0,(X,)),isA(X,"口头形式")) :- inst(r("tx-g1446",0,0,(X,))).

% tx-g1449[0.0] 分类（自动抽取自图的层级）：书面形式 ⊑ 意思表示的形式
inst(r("tx-g1449",0,0,(X,))) :- cand(isA(X,"书面形式")).
constitutiveRule(r("tx-g1449",0,0,(X,)),isA(X,"意思表示的形式")) :- inst(r("tx-g1449",0,0,(X,))).
mainHead(r("tx-g1449",0,0,(X,)),constitutiveRule,isA(X,"意思表示的形式")) :- inst(r("tx-g1449",0,0,(X,))).
cand(isA(X,"意思表示的形式")) :- inst(r("tx-g1449",0,0,(X,))).
body(r("tx-g1449",0,0,(X,)),isA(X,"书面形式")) :- inst(r("tx-g1449",0,0,(X,))).

% tx-g1451[0.0] 分类（自动抽取自图的层级）：默示形式 ⊑ 意思表示的形式
inst(r("tx-g1451",0,0,(X,))) :- cand(isA(X,"默示形式")).
constitutiveRule(r("tx-g1451",0,0,(X,)),isA(X,"意思表示的形式")) :- inst(r("tx-g1451",0,0,(X,))).
mainHead(r("tx-g1451",0,0,(X,)),constitutiveRule,isA(X,"意思表示的形式")) :- inst(r("tx-g1451",0,0,(X,))).
cand(isA(X,"意思表示的形式")) :- inst(r("tx-g1451",0,0,(X,))).
body(r("tx-g1451",0,0,(X,)),isA(X,"默示形式")) :- inst(r("tx-g1451",0,0,(X,))).

% c-valid-default[0.0] 无无效、效力待定、确定不生效事由的，民事法律行为有效（第143条的推定）（第143条；doctrine）
inst(r("c-valid-default",0,0,(P,X,))) :- cand(actOf(X,P)).
constitutiveRule(r("c-valid-default",0,0,(P,X,)),valid(X)) :- inst(r("c-valid-default",0,0,(P,X,))).
mainHead(r("c-valid-default",0,0,(P,X,)),constitutiveRule,valid(X)) :- inst(r("c-valid-default",0,0,(P,X,))).
cand(valid(X)) :- inst(r("c-valid-default",0,0,(P,X,))).
body(r("c-valid-default",0,0,(P,X,)),actOf(X,P)) :- inst(r("c-valid-default",0,0,(P,X,))).
inst(x("c-valid-default",0,0,0,(P,X,))) :- inst(r("c-valid-default",0,0,(P,X,))), cand(void(X)).
constitutiveRule(x("c-valid-default",0,0,0,(P,X,)),non(valid(X))) :- inst(x("c-valid-default",0,0,0,(P,X,))).
body(x("c-valid-default",0,0,0,(P,X,)),actOf(X,P)) :- inst(x("c-valid-default",0,0,0,(P,X,))).
body(x("c-valid-default",0,0,0,(P,X,)),void(X)) :- inst(x("c-valid-default",0,0,0,(P,X,))).
superior(x("c-valid-default",0,0,0,(P,X,)),r("c-valid-default",0,0,(P,X,))) :- inst(x("c-valid-default",0,0,0,(P,X,))).
exc(x("c-valid-default",0,0,0,(P,X,)),r("c-valid-default",0,0,(P,X,)),constitutiveRule,valid(X)) :- inst(x("c-valid-default",0,0,0,(P,X,))).
inst(x("c-valid-default",0,0,1,(P,X,))) :- inst(r("c-valid-default",0,0,(P,X,))), cand(pendingValidity(X)).
constitutiveRule(x("c-valid-default",0,0,1,(P,X,)),non(valid(X))) :- inst(x("c-valid-default",0,0,1,(P,X,))).
body(x("c-valid-default",0,0,1,(P,X,)),actOf(X,P)) :- inst(x("c-valid-default",0,0,1,(P,X,))).
body(x("c-valid-default",0,0,1,(P,X,)),pendingValidity(X)) :- inst(x("c-valid-default",0,0,1,(P,X,))).
superior(x("c-valid-default",0,0,1,(P,X,)),r("c-valid-default",0,0,(P,X,))) :- inst(x("c-valid-default",0,0,1,(P,X,))).
exc(x("c-valid-default",0,0,1,(P,X,)),r("c-valid-default",0,0,(P,X,)),constitutiveRule,valid(X)) :- inst(x("c-valid-default",0,0,1,(P,X,))).
inst(x("c-valid-default",0,0,2,(P,X,))) :- inst(r("c-valid-default",0,0,(P,X,))), cand(ineffective(X)).
constitutiveRule(x("c-valid-default",0,0,2,(P,X,)),non(valid(X))) :- inst(x("c-valid-default",0,0,2,(P,X,))).
body(x("c-valid-default",0,0,2,(P,X,)),actOf(X,P)) :- inst(x("c-valid-default",0,0,2,(P,X,))).
body(x("c-valid-default",0,0,2,(P,X,)),ineffective(X)) :- inst(x("c-valid-default",0,0,2,(P,X,))).
superior(x("c-valid-default",0,0,2,(P,X,)),r("c-valid-default",0,0,(P,X,))) :- inst(x("c-valid-default",0,0,2,(P,X,))).
exc(x("c-valid-default",0,0,2,(P,X,)),r("c-valid-default",0,0,(P,X,)),constitutiveRule,valid(X)) :- inst(x("c-valid-default",0,0,2,(P,X,))).

% c153-2[0.0] 违背公序良俗的无效（第153条第2款；npc）
inst(r("c153-2",0,0,(X,))) :- cand(violatesPublicOrder(X)).
constitutiveRule(r("c153-2",0,0,(X,)),void(X)) :- inst(r("c153-2",0,0,(X,))).
mainHead(r("c153-2",0,0,(X,)),constitutiveRule,void(X)) :- inst(r("c153-2",0,0,(X,))).
cand(void(X)) :- inst(r("c153-2",0,0,(X,))).
body(r("c153-2",0,0,(X,)),violatesPublicOrder(X)) :- inst(r("c153-2",0,0,(X,))).

% c-void-not-valid[0.0] 无效行为不是有效行为（第155条；doctrine）
inst(r("c-void-not-valid",0,0,(X,))) :- cand(void(X)).
constitutiveRule(r("c-void-not-valid",0,0,(X,)),non(valid(X))) :- inst(r("c-void-not-valid",0,0,(X,))).
mainHead(r("c-void-not-valid",0,0,(X,)),constitutiveRule,non(valid(X))) :- inst(r("c-void-not-valid",0,0,(X,))).
cand(valid(X)) :- inst(r("c-void-not-valid",0,0,(X,))).
body(r("c-void-not-valid",0,0,(X,)),void(X)) :- inst(r("c-void-not-valid",0,0,(X,))).

% c155[0.0] 无效的或者被撤销的民事法律行为自始没有法律约束力（第155条；npc）
inst(r("c155",0,0,(X,))) :- cand(void(X)).
constitutiveRule(r("c155",0,0,(X,)),noBindingForceAbInitio(X)) :- inst(r("c155",0,0,(X,))).
mainHead(r("c155",0,0,(X,)),constitutiveRule,noBindingForceAbInitio(X)) :- inst(r("c155",0,0,(X,))).
cand(noBindingForceAbInitio(X)) :- inst(r("c155",0,0,(X,))).
body(r("c155",0,0,(X,)),void(X)) :- inst(r("c155",0,0,(X,))).
% c155[1.0] 无效的或者被撤销的民事法律行为自始没有法律约束力（第155条；npc）
inst(r("c155",1,0,(X,))) :- cand(revoked(X)).
constitutiveRule(r("c155",1,0,(X,)),noBindingForceAbInitio(X)) :- inst(r("c155",1,0,(X,))).
mainHead(r("c155",1,0,(X,)),constitutiveRule,noBindingForceAbInitio(X)) :- inst(r("c155",1,0,(X,))).
cand(noBindingForceAbInitio(X)) :- inst(r("c155",1,0,(X,))).
body(r("c155",1,0,(X,)),revoked(X)) :- inst(r("c155",1,0,(X,))).

% c144[0.0] 无民事行为能力人实施的民事法律行为无效（第144条；npc）
inst(r("c144",0,0,(P,X,))) :- cand(actOf(X,P)), cand(noCapacity(P)).
constitutiveRule(r("c144",0,0,(P,X,)),void(X)) :- inst(r("c144",0,0,(P,X,))).
mainHead(r("c144",0,0,(P,X,)),constitutiveRule,void(X)) :- inst(r("c144",0,0,(P,X,))).
cand(void(X)) :- inst(r("c144",0,0,(P,X,))).
body(r("c144",0,0,(P,X,)),actOf(X,P)) :- inst(r("c144",0,0,(P,X,))).
body(r("c144",0,0,(P,X,)),noCapacity(P)) :- inst(r("c144",0,0,(P,X,))).

% c146[0.0] 以虚假的意思表示实施的民事法律行为无效（第146条第1款；npc）
inst(r("c146",0,0,(X,))) :- cand(shamIntent(X)).
constitutiveRule(r("c146",0,0,(X,)),void(X)) :- inst(r("c146",0,0,(X,))).
mainHead(r("c146",0,0,(X,)),constitutiveRule,void(X)) :- inst(r("c146",0,0,(X,))).
cand(void(X)) :- inst(r("c146",0,0,(X,))).
body(r("c146",0,0,(X,)),shamIntent(X)) :- inst(r("c146",0,0,(X,))).

% c146-hidden[0.0] 被隐藏的行为的效力，依照有关法律规定处理（不因通谋虚伪而当然无效）（第146条第2款；npc）
inst(r("c146-hidden",0,0,(X,Y,))) :- cand(concealedBy(Y,X)), cand(shamIntent(X)).
constitutiveRule(r("c146-hidden",0,0,(X,Y,)),validityByApplicableLaw(Y)) :- inst(r("c146-hidden",0,0,(X,Y,))).
mainHead(r("c146-hidden",0,0,(X,Y,)),constitutiveRule,validityByApplicableLaw(Y)) :- inst(r("c146-hidden",0,0,(X,Y,))).
cand(validityByApplicableLaw(Y)) :- inst(r("c146-hidden",0,0,(X,Y,))).
body(r("c146-hidden",0,0,(X,Y,)),concealedBy(Y,X)) :- inst(r("c146-hidden",0,0,(X,Y,))).
body(r("c146-hidden",0,0,(X,Y,)),shamIntent(X)) :- inst(r("c146-hidden",0,0,(X,Y,))).

% c153-1[0.0] 违反法律、行政法规的强制性规定的无效；但该规定不导致无效的除外（第153条第1款；npc）
inst(r("c153-1",0,0,(P,X,))) :- cand(actOf(X,P)), cand(violatesMandatoryProvision(X)).
constitutiveRule(r("c153-1",0,0,(P,X,)),void(X)) :- inst(r("c153-1",0,0,(P,X,))).
mainHead(r("c153-1",0,0,(P,X,)),constitutiveRule,void(X)) :- inst(r("c153-1",0,0,(P,X,))).
cand(void(X)) :- inst(r("c153-1",0,0,(P,X,))).
body(r("c153-1",0,0,(P,X,)),actOf(X,P)) :- inst(r("c153-1",0,0,(P,X,))).
body(r("c153-1",0,0,(P,X,)),violatesMandatoryProvision(X)) :- inst(r("c153-1",0,0,(P,X,))).
inst(x("c153-1",0,0,0,(P,X,))) :- inst(r("c153-1",0,0,(P,X,))), cand(provisionNotInvalidating(X)).
constitutiveRule(x("c153-1",0,0,0,(P,X,)),non(void(X))) :- inst(x("c153-1",0,0,0,(P,X,))).
body(x("c153-1",0,0,0,(P,X,)),actOf(X,P)) :- inst(x("c153-1",0,0,0,(P,X,))).
body(x("c153-1",0,0,0,(P,X,)),violatesMandatoryProvision(X)) :- inst(x("c153-1",0,0,0,(P,X,))).
body(x("c153-1",0,0,0,(P,X,)),provisionNotInvalidating(X)) :- inst(x("c153-1",0,0,0,(P,X,))).
superior(x("c153-1",0,0,0,(P,X,)),r("c153-1",0,0,(P,X,))) :- inst(x("c153-1",0,0,0,(P,X,))).
exc(x("c153-1",0,0,0,(P,X,)),r("c153-1",0,0,(P,X,)),constitutiveRule,void(X)) :- inst(x("c153-1",0,0,0,(P,X,))).

% c154[0.0] 恶意串通，损害他人合法权益的无效（第154条；npc）
inst(r("c154",0,0,(X,))) :- cand(maliciousCollusion(X)), cand(harmsOthersRights(X)).
constitutiveRule(r("c154",0,0,(X,)),void(X)) :- inst(r("c154",0,0,(X,))).
mainHead(r("c154",0,0,(X,)),constitutiveRule,void(X)) :- inst(r("c154",0,0,(X,))).
cand(void(X)) :- inst(r("c154",0,0,(X,))).
body(r("c154",0,0,(X,)),maliciousCollusion(X)) :- inst(r("c154",0,0,(X,))).
body(r("c154",0,0,(X,)),harmsOthersRights(X)) :- inst(r("c154",0,0,(X,))).

% c157[0.0] 因该行为取得的财产应当返还；不能返还的折价补偿（第157条；npc）
inst(r("c157",0,0,(P,X,))) :- cand(void(X)), cand(obtainedPropertyUnder(P,X)).
prescriptiveRule(r("c157",0,0,(P,X,)),returnOrCompensateValue(P,X)) :- inst(r("c157",0,0,(P,X,))).
mainHead(r("c157",0,0,(P,X,)),prescriptiveRule,returnOrCompensateValue(P,X)) :- inst(r("c157",0,0,(P,X,))).
cand(returnOrCompensateValue(P,X)) :- inst(r("c157",0,0,(P,X,))).
body(r("c157",0,0,(P,X,)),void(X)) :- inst(r("c157",0,0,(P,X,))).
body(r("c157",0,0,(P,X,)),obtainedPropertyUnder(P,X)) :- inst(r("c157",0,0,(P,X,))).
% c157[1.0] 因该行为取得的财产应当返还；不能返还的折价补偿（第157条；npc）
inst(r("c157",1,0,(P,X,))) :- cand(revoked(X)), cand(obtainedPropertyUnder(P,X)).
prescriptiveRule(r("c157",1,0,(P,X,)),returnOrCompensateValue(P,X)) :- inst(r("c157",1,0,(P,X,))).
mainHead(r("c157",1,0,(P,X,)),prescriptiveRule,returnOrCompensateValue(P,X)) :- inst(r("c157",1,0,(P,X,))).
cand(returnOrCompensateValue(P,X)) :- inst(r("c157",1,0,(P,X,))).
body(r("c157",1,0,(P,X,)),revoked(X)) :- inst(r("c157",1,0,(P,X,))).
body(r("c157",1,0,(P,X,)),obtainedPropertyUnder(P,X)) :- inst(r("c157",1,0,(P,X,))).
% c157[2.0] 因该行为取得的财产应当返还；不能返还的折价补偿（第157条；npc）
inst(r("c157",2,0,(P,X,))) :- cand(ineffective(X)), cand(obtainedPropertyUnder(P,X)).
prescriptiveRule(r("c157",2,0,(P,X,)),returnOrCompensateValue(P,X)) :- inst(r("c157",2,0,(P,X,))).
mainHead(r("c157",2,0,(P,X,)),prescriptiveRule,returnOrCompensateValue(P,X)) :- inst(r("c157",2,0,(P,X,))).
cand(returnOrCompensateValue(P,X)) :- inst(r("c157",2,0,(P,X,))).
body(r("c157",2,0,(P,X,)),ineffective(X)) :- inst(r("c157",2,0,(P,X,))).
body(r("c157",2,0,(P,X,)),obtainedPropertyUnder(P,X)) :- inst(r("c157",2,0,(P,X,))).

% c-revocable-valid[0.0] 可撤销的行为在被撤销前有效（第147条；doctrine）
inst(r("c-revocable-valid",0,0,(P,Q,X,))) :- cand(revocationGround(P,X)), cand(actOf(X,Q)).
constitutiveRule(r("c-revocable-valid",0,0,(P,Q,X,)),valid(X)) :- inst(r("c-revocable-valid",0,0,(P,Q,X,))).
mainHead(r("c-revocable-valid",0,0,(P,Q,X,)),constitutiveRule,valid(X)) :- inst(r("c-revocable-valid",0,0,(P,Q,X,))).
cand(valid(X)) :- inst(r("c-revocable-valid",0,0,(P,Q,X,))).
body(r("c-revocable-valid",0,0,(P,Q,X,)),revocationGround(P,X)) :- inst(r("c-revocable-valid",0,0,(P,Q,X,))).
body(r("c-revocable-valid",0,0,(P,Q,X,)),actOf(X,Q)) :- inst(r("c-revocable-valid",0,0,(P,Q,X,))).
inst(x("c-revocable-valid",0,0,0,(P,Q,X,))) :- inst(r("c-revocable-valid",0,0,(P,Q,X,))), cand(revoked(X)).
constitutiveRule(x("c-revocable-valid",0,0,0,(P,Q,X,)),non(valid(X))) :- inst(x("c-revocable-valid",0,0,0,(P,Q,X,))).
body(x("c-revocable-valid",0,0,0,(P,Q,X,)),revocationGround(P,X)) :- inst(x("c-revocable-valid",0,0,0,(P,Q,X,))).
body(x("c-revocable-valid",0,0,0,(P,Q,X,)),actOf(X,Q)) :- inst(x("c-revocable-valid",0,0,0,(P,Q,X,))).
body(x("c-revocable-valid",0,0,0,(P,Q,X,)),revoked(X)) :- inst(x("c-revocable-valid",0,0,0,(P,Q,X,))).
superior(x("c-revocable-valid",0,0,0,(P,Q,X,)),r("c-revocable-valid",0,0,(P,Q,X,))) :- inst(x("c-revocable-valid",0,0,0,(P,Q,X,))).
exc(x("c-revocable-valid",0,0,0,(P,Q,X,)),r("c-revocable-valid",0,0,(P,Q,X,)),constitutiveRule,valid(X)) :- inst(x("c-revocable-valid",0,0,0,(P,Q,X,))).
inst(x("c-revocable-valid",0,0,1,(P,Q,X,))) :- inst(r("c-revocable-valid",0,0,(P,Q,X,))), cand(void(X)).
constitutiveRule(x("c-revocable-valid",0,0,1,(P,Q,X,)),non(valid(X))) :- inst(x("c-revocable-valid",0,0,1,(P,Q,X,))).
body(x("c-revocable-valid",0,0,1,(P,Q,X,)),revocationGround(P,X)) :- inst(x("c-revocable-valid",0,0,1,(P,Q,X,))).
body(x("c-revocable-valid",0,0,1,(P,Q,X,)),actOf(X,Q)) :- inst(x("c-revocable-valid",0,0,1,(P,Q,X,))).
body(x("c-revocable-valid",0,0,1,(P,Q,X,)),void(X)) :- inst(x("c-revocable-valid",0,0,1,(P,Q,X,))).
superior(x("c-revocable-valid",0,0,1,(P,Q,X,)),r("c-revocable-valid",0,0,(P,Q,X,))) :- inst(x("c-revocable-valid",0,0,1,(P,Q,X,))).
exc(x("c-revocable-valid",0,0,1,(P,Q,X,)),r("c-revocable-valid",0,0,(P,Q,X,)),constitutiveRule,valid(X)) :- inst(x("c-revocable-valid",0,0,1,(P,Q,X,))).

% c-revocation-right[0.0] 有撤销事由的，享有撤销权（形成权，须向法院或仲裁机构请求）（第147条、第148条、第149条、第150条、第151条；doctrine）
inst(r("c-revocation-right",0,0,(P,X,))) :- cand(revocationGround(P,X)).
constitutiveRule(r("c-revocation-right",0,0,(P,X,)),revocationRight(P,X)) :- inst(r("c-revocation-right",0,0,(P,X,))).
mainHead(r("c-revocation-right",0,0,(P,X,)),constitutiveRule,revocationRight(P,X)) :- inst(r("c-revocation-right",0,0,(P,X,))).
cand(revocationRight(P,X)) :- inst(r("c-revocation-right",0,0,(P,X,))).
body(r("c-revocation-right",0,0,(P,X,)),revocationGround(P,X)) :- inst(r("c-revocation-right",0,0,(P,X,))).

% c147[0.0] 基于重大误解实施的，行为人有权请求撤销（第147条；npc）
inst(r("c147",0,0,(P,X,))) :- cand(majorMisunderstanding(P,X)).
constitutiveRule(r("c147",0,0,(P,X,)),revocationGround(P,X)) :- inst(r("c147",0,0,(P,X,))).
mainHead(r("c147",0,0,(P,X,)),constitutiveRule,revocationGround(P,X)) :- inst(r("c147",0,0,(P,X,))).
cand(revocationGround(P,X)) :- inst(r("c147",0,0,(P,X,))).
body(r("c147",0,0,(P,X,)),majorMisunderstanding(P,X)) :- inst(r("c147",0,0,(P,X,))).

% c148[0.0] 一方欺诈的，受欺诈方有权请求撤销（第148条；npc）
inst(r("c148",0,0,(P,X,))) :- cand(deceivedByCounterparty(P,X)).
constitutiveRule(r("c148",0,0,(P,X,)),revocationGround(P,X)) :- inst(r("c148",0,0,(P,X,))).
mainHead(r("c148",0,0,(P,X,)),constitutiveRule,revocationGround(P,X)) :- inst(r("c148",0,0,(P,X,))).
cand(revocationGround(P,X)) :- inst(r("c148",0,0,(P,X,))).
body(r("c148",0,0,(P,X,)),deceivedByCounterparty(P,X)) :- inst(r("c148",0,0,(P,X,))).

% c149[0.0] 第三人欺诈，对方知道或应当知道的，受欺诈方有权请求撤销（第149条；npc）
inst(r("c149",0,0,(P,X,))) :- cand(deceivedByThirdParty(P,X)), cand(counterpartyKnewOrShouldKnowFraud(X)).
constitutiveRule(r("c149",0,0,(P,X,)),revocationGround(P,X)) :- inst(r("c149",0,0,(P,X,))).
mainHead(r("c149",0,0,(P,X,)),constitutiveRule,revocationGround(P,X)) :- inst(r("c149",0,0,(P,X,))).
cand(revocationGround(P,X)) :- inst(r("c149",0,0,(P,X,))).
body(r("c149",0,0,(P,X,)),deceivedByThirdParty(P,X)) :- inst(r("c149",0,0,(P,X,))).
body(r("c149",0,0,(P,X,)),counterpartyKnewOrShouldKnowFraud(X)) :- inst(r("c149",0,0,(P,X,))).

% c150[0.0] 一方或者第三人胁迫的，受胁迫方有权请求撤销（第三人胁迫不问相对人是否知情）（第150条；npc）
inst(r("c150",0,0,(P,X,))) :- cand(coercedByCounterparty(P,X)).
constitutiveRule(r("c150",0,0,(P,X,)),revocationGround(P,X)) :- inst(r("c150",0,0,(P,X,))).
mainHead(r("c150",0,0,(P,X,)),constitutiveRule,revocationGround(P,X)) :- inst(r("c150",0,0,(P,X,))).
cand(revocationGround(P,X)) :- inst(r("c150",0,0,(P,X,))).
body(r("c150",0,0,(P,X,)),coercedByCounterparty(P,X)) :- inst(r("c150",0,0,(P,X,))).
% c150[0.1] 一方或者第三人胁迫的，受胁迫方有权请求撤销（第三人胁迫不问相对人是否知情）（第150条；npc）
inst(r("c150",0,1,(P,X,))) :- cand(coercedByCounterparty(P,X)).
constitutiveRule(r("c150",0,1,(P,X,)),duressCase(P,X)) :- inst(r("c150",0,1,(P,X,))).
mainHead(r("c150",0,1,(P,X,)),constitutiveRule,duressCase(P,X)) :- inst(r("c150",0,1,(P,X,))).
cand(duressCase(P,X)) :- inst(r("c150",0,1,(P,X,))).
body(r("c150",0,1,(P,X,)),coercedByCounterparty(P,X)) :- inst(r("c150",0,1,(P,X,))).
% c150[1.0] 一方或者第三人胁迫的，受胁迫方有权请求撤销（第三人胁迫不问相对人是否知情）（第150条；npc）
inst(r("c150",1,0,(P,X,))) :- cand(coercedByThirdParty(P,X)).
constitutiveRule(r("c150",1,0,(P,X,)),revocationGround(P,X)) :- inst(r("c150",1,0,(P,X,))).
mainHead(r("c150",1,0,(P,X,)),constitutiveRule,revocationGround(P,X)) :- inst(r("c150",1,0,(P,X,))).
cand(revocationGround(P,X)) :- inst(r("c150",1,0,(P,X,))).
body(r("c150",1,0,(P,X,)),coercedByThirdParty(P,X)) :- inst(r("c150",1,0,(P,X,))).
% c150[1.1] 一方或者第三人胁迫的，受胁迫方有权请求撤销（第三人胁迫不问相对人是否知情）（第150条；npc）
inst(r("c150",1,1,(P,X,))) :- cand(coercedByThirdParty(P,X)).
constitutiveRule(r("c150",1,1,(P,X,)),duressCase(P,X)) :- inst(r("c150",1,1,(P,X,))).
mainHead(r("c150",1,1,(P,X,)),constitutiveRule,duressCase(P,X)) :- inst(r("c150",1,1,(P,X,))).
cand(duressCase(P,X)) :- inst(r("c150",1,1,(P,X,))).
body(r("c150",1,1,(P,X,)),coercedByThirdParty(P,X)) :- inst(r("c150",1,1,(P,X,))).

% c151[0.0] 利用对方危困状态、缺乏判断能力等致显失公平的，受损害方有权请求撤销（第151条；npc）
inst(r("c151",0,0,(P,X,))) :- cand(exploitedDistressOrInexperience(P,X)), cand(grosslyUnfairAtFormation(X)).
constitutiveRule(r("c151",0,0,(P,X,)),revocationGround(P,X)) :- inst(r("c151",0,0,(P,X,))).
mainHead(r("c151",0,0,(P,X,)),constitutiveRule,revocationGround(P,X)) :- inst(r("c151",0,0,(P,X,))).
cand(revocationGround(P,X)) :- inst(r("c151",0,0,(P,X,))).
body(r("c151",0,0,(P,X,)),exploitedDistressOrInexperience(P,X)) :- inst(r("c151",0,0,(P,X,))).
body(r("c151",0,0,(P,X,)),grosslyUnfairAtFormation(X)) :- inst(r("c151",0,0,(P,X,))).

% c-revoke-against[0.0] 撤销权针对的是撤销权人与相对人之间的民事法律行为，只能向该行为的相对人主张（实施欺诈、胁迫的第三人不是撤销对象）（第148条、第149条、第
inst(r("c-revoke-against",0,0,(P,Q,X,))) :- cand(revocationRight(P,X)), cand(counterpartyOf(Q,X)).
constitutiveRule(r("c-revoke-against",0,0,(P,Q,X,)),revokeAgainst(P,Q,X)) :- inst(r("c-revoke-against",0,0,(P,Q,X,))).
mainHead(r("c-revoke-against",0,0,(P,Q,X,)),constitutiveRule,revokeAgainst(P,Q,X)) :- inst(r("c-revoke-against",0,0,(P,Q,X,))).
cand(revokeAgainst(P,Q,X)) :- inst(r("c-revoke-against",0,0,(P,Q,X,))).
body(r("c-revoke-against",0,0,(P,Q,X,)),revocationRight(P,X)) :- inst(r("c-revoke-against",0,0,(P,Q,X,))).
body(r("c-revoke-against",0,0,(P,Q,X,)),counterpartyOf(Q,X)) :- inst(r("c-revoke-against",0,0,(P,Q,X,))).

% c-revoked[0.0] 撤销权人在除斥期间内行使撤销权的，行为被撤销（第147条、第155条；doctrine）
inst(r("c-revoked",0,0,(P,X,))) :- cand(revocationRight(P,X)), cand(exercisesRevocation(P,X)).
constitutiveRule(r("c-revoked",0,0,(P,X,)),revoked(X)) :- inst(r("c-revoked",0,0,(P,X,))).
mainHead(r("c-revoked",0,0,(P,X,)),constitutiveRule,revoked(X)) :- inst(r("c-revoked",0,0,(P,X,))).
cand(revoked(X)) :- inst(r("c-revoked",0,0,(P,X,))).
body(r("c-revoked",0,0,(P,X,)),revocationRight(P,X)) :- inst(r("c-revoked",0,0,(P,X,))).
body(r("c-revoked",0,0,(P,X,)),exercisesRevocation(P,X)) :- inst(r("c-revoked",0,0,(P,X,))).

% c152-1-1[0.0] 自知道或应当知道撤销事由之日起一年内没有行使的，撤销权消灭（第152条第1款；npc）
inst(r("c152-1-1",0,0,(P,X,))) :- cand(revocationGround(P,X)), cand(oneYearSinceKnewGround(P,X)).
constitutiveRule(r("c152-1-1",0,0,(P,X,)),non(revocationRight(P,X))) :- inst(r("c152-1-1",0,0,(P,X,))).
mainHead(r("c152-1-1",0,0,(P,X,)),constitutiveRule,non(revocationRight(P,X))) :- inst(r("c152-1-1",0,0,(P,X,))).
cand(revocationRight(P,X)) :- inst(r("c152-1-1",0,0,(P,X,))).
body(r("c152-1-1",0,0,(P,X,)),revocationGround(P,X)) :- inst(r("c152-1-1",0,0,(P,X,))).
body(r("c152-1-1",0,0,(P,X,)),oneYearSinceKnewGround(P,X)) :- inst(r("c152-1-1",0,0,(P,X,))).
inst(x("c152-1-1",0,0,0,(P,X,))) :- inst(r("c152-1-1",0,0,(P,X,))), cand(majorMisunderstanding(P,X)).
constitutiveRule(x("c152-1-1",0,0,0,(P,X,)),revocationRight(P,X)) :- inst(x("c152-1-1",0,0,0,(P,X,))).
body(x("c152-1-1",0,0,0,(P,X,)),revocationGround(P,X)) :- inst(x("c152-1-1",0,0,0,(P,X,))).
body(x("c152-1-1",0,0,0,(P,X,)),oneYearSinceKnewGround(P,X)) :- inst(x("c152-1-1",0,0,0,(P,X,))).
body(x("c152-1-1",0,0,0,(P,X,)),majorMisunderstanding(P,X)) :- inst(x("c152-1-1",0,0,0,(P,X,))).
superior(x("c152-1-1",0,0,0,(P,X,)),r("c152-1-1",0,0,(P,X,))) :- inst(x("c152-1-1",0,0,0,(P,X,))).
exc(x("c152-1-1",0,0,0,(P,X,)),r("c152-1-1",0,0,(P,X,)),constitutiveRule,non(revocationRight(P,X))) :- inst(x("c152-1-1",0,0,0,(P,X,))).
inst(x("c152-1-1",0,0,1,(P,X,))) :- inst(r("c152-1-1",0,0,(P,X,))), cand(duressCase(P,X)).
constitutiveRule(x("c152-1-1",0,0,1,(P,X,)),revocationRight(P,X)) :- inst(x("c152-1-1",0,0,1,(P,X,))).
body(x("c152-1-1",0,0,1,(P,X,)),revocationGround(P,X)) :- inst(x("c152-1-1",0,0,1,(P,X,))).
body(x("c152-1-1",0,0,1,(P,X,)),oneYearSinceKnewGround(P,X)) :- inst(x("c152-1-1",0,0,1,(P,X,))).
body(x("c152-1-1",0,0,1,(P,X,)),duressCase(P,X)) :- inst(x("c152-1-1",0,0,1,(P,X,))).
superior(x("c152-1-1",0,0,1,(P,X,)),r("c152-1-1",0,0,(P,X,))) :- inst(x("c152-1-1",0,0,1,(P,X,))).
exc(x("c152-1-1",0,0,1,(P,X,)),r("c152-1-1",0,0,(P,X,)),constitutiveRule,non(revocationRight(P,X))) :- inst(x("c152-1-1",0,0,1,(P,X,))).

% c152-1-1m[0.0] 重大误解的当事人自知道或应当知道撤销事由之日起九十日内没有行使的，撤销权消灭（第152条第1款；npc）
inst(r("c152-1-1m",0,0,(P,X,))) :- cand(majorMisunderstanding(P,X)), cand(ninetyDaysSinceKnewGround(P,X)).
constitutiveRule(r("c152-1-1m",0,0,(P,X,)),non(revocationRight(P,X))) :- inst(r("c152-1-1m",0,0,(P,X,))).
mainHead(r("c152-1-1m",0,0,(P,X,)),constitutiveRule,non(revocationRight(P,X))) :- inst(r("c152-1-1m",0,0,(P,X,))).
cand(revocationRight(P,X)) :- inst(r("c152-1-1m",0,0,(P,X,))).
body(r("c152-1-1m",0,0,(P,X,)),majorMisunderstanding(P,X)) :- inst(r("c152-1-1m",0,0,(P,X,))).
body(r("c152-1-1m",0,0,(P,X,)),ninetyDaysSinceKnewGround(P,X)) :- inst(r("c152-1-1m",0,0,(P,X,))).

% c152-1-2[0.0] 受胁迫，自胁迫行为终止之日起一年内没有行使的，撤销权消灭（第152条第1款；npc）
inst(r("c152-1-2",0,0,(P,X,))) :- cand(duressCase(P,X)), cand(oneYearSinceDuressEnded(P,X)).
constitutiveRule(r("c152-1-2",0,0,(P,X,)),non(revocationRight(P,X))) :- inst(r("c152-1-2",0,0,(P,X,))).
mainHead(r("c152-1-2",0,0,(P,X,)),constitutiveRule,non(revocationRight(P,X))) :- inst(r("c152-1-2",0,0,(P,X,))).
cand(revocationRight(P,X)) :- inst(r("c152-1-2",0,0,(P,X,))).
body(r("c152-1-2",0,0,(P,X,)),duressCase(P,X)) :- inst(r("c152-1-2",0,0,(P,X,))).
body(r("c152-1-2",0,0,(P,X,)),oneYearSinceDuressEnded(P,X)) :- inst(r("c152-1-2",0,0,(P,X,))).

% c152-1-3[0.0] 知道撤销事由后明确表示或者以自己的行为表明放弃撤销权的，撤销权消灭（第152条第1款；npc）
inst(r("c152-1-3",0,0,(P,X,))) :- cand(revocationGround(P,X)), cand(waivedRevocation(P,X)).
constitutiveRule(r("c152-1-3",0,0,(P,X,)),non(revocationRight(P,X))) :- inst(r("c152-1-3",0,0,(P,X,))).
mainHead(r("c152-1-3",0,0,(P,X,)),constitutiveRule,non(revocationRight(P,X))) :- inst(r("c152-1-3",0,0,(P,X,))).
cand(revocationRight(P,X)) :- inst(r("c152-1-3",0,0,(P,X,))).
body(r("c152-1-3",0,0,(P,X,)),revocationGround(P,X)) :- inst(r("c152-1-3",0,0,(P,X,))).
body(r("c152-1-3",0,0,(P,X,)),waivedRevocation(P,X)) :- inst(r("c152-1-3",0,0,(P,X,))).

% c152-2[0.0] 自民事法律行为发生之日起五年内没有行使的，撤销权消灭（最长期间）（第152条第2款；npc）
inst(r("c152-2",0,0,(P,X,))) :- cand(revocationGround(P,X)), cand(fiveYearsSinceAct(X)).
constitutiveRule(r("c152-2",0,0,(P,X,)),non(revocationRight(P,X))) :- inst(r("c152-2",0,0,(P,X,))).
mainHead(r("c152-2",0,0,(P,X,)),constitutiveRule,non(revocationRight(P,X))) :- inst(r("c152-2",0,0,(P,X,))).
cand(revocationRight(P,X)) :- inst(r("c152-2",0,0,(P,X,))).
body(r("c152-2",0,0,(P,X,)),revocationGround(P,X)) :- inst(r("c152-2",0,0,(P,X,))).
body(r("c152-2",0,0,(P,X,)),fiveYearsSinceAct(X)) :- inst(r("c152-2",0,0,(P,X,))).

% c145-pure[0.0] 限制民事行为能力人实施的纯获利益或与其年龄、智力相适应的行为有效（第145条第1款；npc）
inst(r("c145-pure",0,0,(P,X,))) :- cand(actOf(X,P)), cand(limitedCapacity(P)), cand(pureBenefit(X)).
constitutiveRule(r("c145-pure",0,0,(P,X,)),valid(X)) :- inst(r("c145-pure",0,0,(P,X,))).
mainHead(r("c145-pure",0,0,(P,X,)),constitutiveRule,valid(X)) :- inst(r("c145-pure",0,0,(P,X,))).
cand(valid(X)) :- inst(r("c145-pure",0,0,(P,X,))).
body(r("c145-pure",0,0,(P,X,)),actOf(X,P)) :- inst(r("c145-pure",0,0,(P,X,))).
body(r("c145-pure",0,0,(P,X,)),limitedCapacity(P)) :- inst(r("c145-pure",0,0,(P,X,))).
body(r("c145-pure",0,0,(P,X,)),pureBenefit(X)) :- inst(r("c145-pure",0,0,(P,X,))).
% c145-pure[1.0] 限制民事行为能力人实施的纯获利益或与其年龄、智力相适应的行为有效（第145条第1款；npc）
inst(r("c145-pure",1,0,(P,X,))) :- cand(actOf(X,P)), cand(limitedCapacity(P)), cand(ageAppropriate(X)).
constitutiveRule(r("c145-pure",1,0,(P,X,)),valid(X)) :- inst(r("c145-pure",1,0,(P,X,))).
mainHead(r("c145-pure",1,0,(P,X,)),constitutiveRule,valid(X)) :- inst(r("c145-pure",1,0,(P,X,))).
cand(valid(X)) :- inst(r("c145-pure",1,0,(P,X,))).
body(r("c145-pure",1,0,(P,X,)),actOf(X,P)) :- inst(r("c145-pure",1,0,(P,X,))).
body(r("c145-pure",1,0,(P,X,)),limitedCapacity(P)) :- inst(r("c145-pure",1,0,(P,X,))).
body(r("c145-pure",1,0,(P,X,)),ageAppropriate(X)) :- inst(r("c145-pure",1,0,(P,X,))).

% c145-consent[0.0] 其他行为经法定代理人同意或者追认后有效（第145条第1款；npc）
inst(r("c145-consent",0,0,(P,X,))) :- cand(actOf(X,P)), cand(limitedCapacity(P)), cand(guardianConsents(X)).
constitutiveRule(r("c145-consent",0,0,(P,X,)),valid(X)) :- inst(r("c145-consent",0,0,(P,X,))).
mainHead(r("c145-consent",0,0,(P,X,)),constitutiveRule,valid(X)) :- inst(r("c145-consent",0,0,(P,X,))).
cand(valid(X)) :- inst(r("c145-consent",0,0,(P,X,))).
body(r("c145-consent",0,0,(P,X,)),actOf(X,P)) :- inst(r("c145-consent",0,0,(P,X,))).
body(r("c145-consent",0,0,(P,X,)),limitedCapacity(P)) :- inst(r("c145-consent",0,0,(P,X,))).
body(r("c145-consent",0,0,(P,X,)),guardianConsents(X)) :- inst(r("c145-consent",0,0,(P,X,))).
% c145-consent[1.0] 其他行为经法定代理人同意或者追认后有效（第145条第1款；npc）
inst(r("c145-consent",1,0,(P,X,))) :- cand(actOf(X,P)), cand(limitedCapacity(P)), cand(guardianRatifies(X)).
constitutiveRule(r("c145-consent",1,0,(P,X,)),valid(X)) :- inst(r("c145-consent",1,0,(P,X,))).
mainHead(r("c145-consent",1,0,(P,X,)),constitutiveRule,valid(X)) :- inst(r("c145-consent",1,0,(P,X,))).
cand(valid(X)) :- inst(r("c145-consent",1,0,(P,X,))).
body(r("c145-consent",1,0,(P,X,)),actOf(X,P)) :- inst(r("c145-consent",1,0,(P,X,))).
body(r("c145-consent",1,0,(P,X,)),limitedCapacity(P)) :- inst(r("c145-consent",1,0,(P,X,))).
body(r("c145-consent",1,0,(P,X,)),guardianRatifies(X)) :- inst(r("c145-consent",1,0,(P,X,))).

% c145-pending[0.0] 同意或追认前效力待定（第145条第1款；npc）
inst(r("c145-pending",0,0,(P,X,))) :- cand(actOf(X,P)), cand(limitedCapacity(P)).
constitutiveRule(r("c145-pending",0,0,(P,X,)),pendingValidity(X)) :- inst(r("c145-pending",0,0,(P,X,))).
mainHead(r("c145-pending",0,0,(P,X,)),constitutiveRule,pendingValidity(X)) :- inst(r("c145-pending",0,0,(P,X,))).
cand(pendingValidity(X)) :- inst(r("c145-pending",0,0,(P,X,))).
body(r("c145-pending",0,0,(P,X,)),actOf(X,P)) :- inst(r("c145-pending",0,0,(P,X,))).
body(r("c145-pending",0,0,(P,X,)),limitedCapacity(P)) :- inst(r("c145-pending",0,0,(P,X,))).
inst(x("c145-pending",0,0,0,(P,X,))) :- inst(r("c145-pending",0,0,(P,X,))), cand(pureBenefit(X)).
constitutiveRule(x("c145-pending",0,0,0,(P,X,)),non(pendingValidity(X))) :- inst(x("c145-pending",0,0,0,(P,X,))).
body(x("c145-pending",0,0,0,(P,X,)),actOf(X,P)) :- inst(x("c145-pending",0,0,0,(P,X,))).
body(x("c145-pending",0,0,0,(P,X,)),limitedCapacity(P)) :- inst(x("c145-pending",0,0,0,(P,X,))).
body(x("c145-pending",0,0,0,(P,X,)),pureBenefit(X)) :- inst(x("c145-pending",0,0,0,(P,X,))).
superior(x("c145-pending",0,0,0,(P,X,)),r("c145-pending",0,0,(P,X,))) :- inst(x("c145-pending",0,0,0,(P,X,))).
exc(x("c145-pending",0,0,0,(P,X,)),r("c145-pending",0,0,(P,X,)),constitutiveRule,pendingValidity(X)) :- inst(x("c145-pending",0,0,0,(P,X,))).
inst(x("c145-pending",0,0,1,(P,X,))) :- inst(r("c145-pending",0,0,(P,X,))), cand(ageAppropriate(X)).
constitutiveRule(x("c145-pending",0,0,1,(P,X,)),non(pendingValidity(X))) :- inst(x("c145-pending",0,0,1,(P,X,))).
body(x("c145-pending",0,0,1,(P,X,)),actOf(X,P)) :- inst(x("c145-pending",0,0,1,(P,X,))).
body(x("c145-pending",0,0,1,(P,X,)),limitedCapacity(P)) :- inst(x("c145-pending",0,0,1,(P,X,))).
body(x("c145-pending",0,0,1,(P,X,)),ageAppropriate(X)) :- inst(x("c145-pending",0,0,1,(P,X,))).
superior(x("c145-pending",0,0,1,(P,X,)),r("c145-pending",0,0,(P,X,))) :- inst(x("c145-pending",0,0,1,(P,X,))).
exc(x("c145-pending",0,0,1,(P,X,)),r("c145-pending",0,0,(P,X,)),constitutiveRule,pendingValidity(X)) :- inst(x("c145-pending",0,0,1,(P,X,))).
inst(x("c145-pending",0,0,2,(P,X,))) :- inst(r("c145-pending",0,0,(P,X,))), cand(guardianConsents(X)).
constitutiveRule(x("c145-pending",0,0,2,(P,X,)),non(pendingValidity(X))) :- inst(x("c145-pending",0,0,2,(P,X,))).
body(x("c145-pending",0,0,2,(P,X,)),actOf(X,P)) :- inst(x("c145-pending",0,0,2,(P,X,))).
body(x("c145-pending",0,0,2,(P,X,)),limitedCapacity(P)) :- inst(x("c145-pending",0,0,2,(P,X,))).
body(x("c145-pending",0,0,2,(P,X,)),guardianConsents(X)) :- inst(x("c145-pending",0,0,2,(P,X,))).
superior(x("c145-pending",0,0,2,(P,X,)),r("c145-pending",0,0,(P,X,))) :- inst(x("c145-pending",0,0,2,(P,X,))).
exc(x("c145-pending",0,0,2,(P,X,)),r("c145-pending",0,0,(P,X,)),constitutiveRule,pendingValidity(X)) :- inst(x("c145-pending",0,0,2,(P,X,))).
inst(x("c145-pending",0,0,3,(P,X,))) :- inst(r("c145-pending",0,0,(P,X,))), cand(guardianRatifies(X)).
constitutiveRule(x("c145-pending",0,0,3,(P,X,)),non(pendingValidity(X))) :- inst(x("c145-pending",0,0,3,(P,X,))).
body(x("c145-pending",0,0,3,(P,X,)),actOf(X,P)) :- inst(x("c145-pending",0,0,3,(P,X,))).
body(x("c145-pending",0,0,3,(P,X,)),limitedCapacity(P)) :- inst(x("c145-pending",0,0,3,(P,X,))).
body(x("c145-pending",0,0,3,(P,X,)),guardianRatifies(X)) :- inst(x("c145-pending",0,0,3,(P,X,))).
superior(x("c145-pending",0,0,3,(P,X,)),r("c145-pending",0,0,(P,X,))) :- inst(x("c145-pending",0,0,3,(P,X,))).
exc(x("c145-pending",0,0,3,(P,X,)),r("c145-pending",0,0,(P,X,)),constitutiveRule,pendingValidity(X)) :- inst(x("c145-pending",0,0,3,(P,X,))).
inst(x("c145-pending",0,0,4,(P,X,))) :- inst(r("c145-pending",0,0,(P,X,))), cand(ratificationRefused(X)).
constitutiveRule(x("c145-pending",0,0,4,(P,X,)),non(pendingValidity(X))) :- inst(x("c145-pending",0,0,4,(P,X,))).
body(x("c145-pending",0,0,4,(P,X,)),actOf(X,P)) :- inst(x("c145-pending",0,0,4,(P,X,))).
body(x("c145-pending",0,0,4,(P,X,)),limitedCapacity(P)) :- inst(x("c145-pending",0,0,4,(P,X,))).
body(x("c145-pending",0,0,4,(P,X,)),ratificationRefused(X)) :- inst(x("c145-pending",0,0,4,(P,X,))).
superior(x("c145-pending",0,0,4,(P,X,)),r("c145-pending",0,0,(P,X,))) :- inst(x("c145-pending",0,0,4,(P,X,))).
exc(x("c145-pending",0,0,4,(P,X,)),r("c145-pending",0,0,(P,X,)),constitutiveRule,pendingValidity(X)) :- inst(x("c145-pending",0,0,4,(P,X,))).

% c145-refused[0.0] 拒绝追认的，确定不发生效力（第145条第1款；doctrine）
inst(r("c145-refused",0,0,(P,X,))) :- cand(actOf(X,P)), cand(limitedCapacity(P)), cand(ratificationRefused(X)).
constitutiveRule(r("c145-refused",0,0,(P,X,)),ineffective(X)) :- inst(r("c145-refused",0,0,(P,X,))).
mainHead(r("c145-refused",0,0,(P,X,)),constitutiveRule,ineffective(X)) :- inst(r("c145-refused",0,0,(P,X,))).
cand(ineffective(X)) :- inst(r("c145-refused",0,0,(P,X,))).
body(r("c145-refused",0,0,(P,X,)),actOf(X,P)) :- inst(r("c145-refused",0,0,(P,X,))).
body(r("c145-refused",0,0,(P,X,)),limitedCapacity(P)) :- inst(r("c145-refused",0,0,(P,X,))).
body(r("c145-refused",0,0,(P,X,)),ratificationRefused(X)) :- inst(r("c145-refused",0,0,(P,X,))).
inst(x("c145-refused",0,0,0,(P,X,))) :- inst(r("c145-refused",0,0,(P,X,))), cand(pureBenefit(X)).
constitutiveRule(x("c145-refused",0,0,0,(P,X,)),non(ineffective(X))) :- inst(x("c145-refused",0,0,0,(P,X,))).
body(x("c145-refused",0,0,0,(P,X,)),actOf(X,P)) :- inst(x("c145-refused",0,0,0,(P,X,))).
body(x("c145-refused",0,0,0,(P,X,)),limitedCapacity(P)) :- inst(x("c145-refused",0,0,0,(P,X,))).
body(x("c145-refused",0,0,0,(P,X,)),ratificationRefused(X)) :- inst(x("c145-refused",0,0,0,(P,X,))).
body(x("c145-refused",0,0,0,(P,X,)),pureBenefit(X)) :- inst(x("c145-refused",0,0,0,(P,X,))).
superior(x("c145-refused",0,0,0,(P,X,)),r("c145-refused",0,0,(P,X,))) :- inst(x("c145-refused",0,0,0,(P,X,))).
exc(x("c145-refused",0,0,0,(P,X,)),r("c145-refused",0,0,(P,X,)),constitutiveRule,ineffective(X)) :- inst(x("c145-refused",0,0,0,(P,X,))).
inst(x("c145-refused",0,0,1,(P,X,))) :- inst(r("c145-refused",0,0,(P,X,))), cand(ageAppropriate(X)).
constitutiveRule(x("c145-refused",0,0,1,(P,X,)),non(ineffective(X))) :- inst(x("c145-refused",0,0,1,(P,X,))).
body(x("c145-refused",0,0,1,(P,X,)),actOf(X,P)) :- inst(x("c145-refused",0,0,1,(P,X,))).
body(x("c145-refused",0,0,1,(P,X,)),limitedCapacity(P)) :- inst(x("c145-refused",0,0,1,(P,X,))).
body(x("c145-refused",0,0,1,(P,X,)),ratificationRefused(X)) :- inst(x("c145-refused",0,0,1,(P,X,))).
body(x("c145-refused",0,0,1,(P,X,)),ageAppropriate(X)) :- inst(x("c145-refused",0,0,1,(P,X,))).
superior(x("c145-refused",0,0,1,(P,X,)),r("c145-refused",0,0,(P,X,))) :- inst(x("c145-refused",0,0,1,(P,X,))).
exc(x("c145-refused",0,0,1,(P,X,)),r("c145-refused",0,0,(P,X,)),constitutiveRule,ineffective(X)) :- inst(x("c145-refused",0,0,1,(P,X,))).
% c145-refused[0.1] 拒绝追认的，确定不发生效力（第145条第1款；doctrine）
inst(r("c145-refused",0,1,(P,X,))) :- cand(actOf(X,P)), cand(limitedCapacity(P)), cand(ratificationRefused(X)).
constitutiveRule(r("c145-refused",0,1,(P,X,)),non(valid(X))) :- inst(r("c145-refused",0,1,(P,X,))).
mainHead(r("c145-refused",0,1,(P,X,)),constitutiveRule,non(valid(X))) :- inst(r("c145-refused",0,1,(P,X,))).
cand(valid(X)) :- inst(r("c145-refused",0,1,(P,X,))).
body(r("c145-refused",0,1,(P,X,)),actOf(X,P)) :- inst(r("c145-refused",0,1,(P,X,))).
body(r("c145-refused",0,1,(P,X,)),limitedCapacity(P)) :- inst(r("c145-refused",0,1,(P,X,))).
body(r("c145-refused",0,1,(P,X,)),ratificationRefused(X)) :- inst(r("c145-refused",0,1,(P,X,))).
inst(x("c145-refused",0,1,0,(P,X,))) :- inst(r("c145-refused",0,1,(P,X,))), cand(pureBenefit(X)).
constitutiveRule(x("c145-refused",0,1,0,(P,X,)),valid(X)) :- inst(x("c145-refused",0,1,0,(P,X,))).
body(x("c145-refused",0,1,0,(P,X,)),actOf(X,P)) :- inst(x("c145-refused",0,1,0,(P,X,))).
body(x("c145-refused",0,1,0,(P,X,)),limitedCapacity(P)) :- inst(x("c145-refused",0,1,0,(P,X,))).
body(x("c145-refused",0,1,0,(P,X,)),ratificationRefused(X)) :- inst(x("c145-refused",0,1,0,(P,X,))).
body(x("c145-refused",0,1,0,(P,X,)),pureBenefit(X)) :- inst(x("c145-refused",0,1,0,(P,X,))).
superior(x("c145-refused",0,1,0,(P,X,)),r("c145-refused",0,1,(P,X,))) :- inst(x("c145-refused",0,1,0,(P,X,))).
exc(x("c145-refused",0,1,0,(P,X,)),r("c145-refused",0,1,(P,X,)),constitutiveRule,non(valid(X))) :- inst(x("c145-refused",0,1,0,(P,X,))).
inst(x("c145-refused",0,1,1,(P,X,))) :- inst(r("c145-refused",0,1,(P,X,))), cand(ageAppropriate(X)).
constitutiveRule(x("c145-refused",0,1,1,(P,X,)),valid(X)) :- inst(x("c145-refused",0,1,1,(P,X,))).
body(x("c145-refused",0,1,1,(P,X,)),actOf(X,P)) :- inst(x("c145-refused",0,1,1,(P,X,))).
body(x("c145-refused",0,1,1,(P,X,)),limitedCapacity(P)) :- inst(x("c145-refused",0,1,1,(P,X,))).
body(x("c145-refused",0,1,1,(P,X,)),ratificationRefused(X)) :- inst(x("c145-refused",0,1,1,(P,X,))).
body(x("c145-refused",0,1,1,(P,X,)),ageAppropriate(X)) :- inst(x("c145-refused",0,1,1,(P,X,))).
superior(x("c145-refused",0,1,1,(P,X,)),r("c145-refused",0,1,(P,X,))) :- inst(x("c145-refused",0,1,1,(P,X,))).
exc(x("c145-refused",0,1,1,(P,X,)),r("c145-refused",0,1,(P,X,)),constitutiveRule,non(valid(X))) :- inst(x("c145-refused",0,1,1,(P,X,))).

% c145-deemed-refusal[0.0] 法定代理人收到催告三十日内未作表示的，视为拒绝追认（第145条第2款；npc）
inst(r("c145-deemed-refusal",0,0,(X,))) :- cand(demandedRatification(X)), cand(noAnswerWithin30Days(X)).
constitutiveRule(r("c145-deemed-refusal",0,0,(X,)),ratificationRefused(X)) :- inst(r("c145-deemed-refusal",0,0,(X,))).
mainHead(r("c145-deemed-refusal",0,0,(X,)),constitutiveRule,ratificationRefused(X)) :- inst(r("c145-deemed-refusal",0,0,(X,))).
cand(ratificationRefused(X)) :- inst(r("c145-deemed-refusal",0,0,(X,))).
body(r("c145-deemed-refusal",0,0,(X,)),demandedRatification(X)) :- inst(r("c145-deemed-refusal",0,0,(X,))).
body(r("c145-deemed-refusal",0,0,(X,)),noAnswerWithin30Days(X)) :- inst(r("c145-deemed-refusal",0,0,(X,))).
inst(x("c145-deemed-refusal",0,0,0,(X,))) :- inst(r("c145-deemed-refusal",0,0,(X,))), cand(guardianRatifies(X)).
constitutiveRule(x("c145-deemed-refusal",0,0,0,(X,)),non(ratificationRefused(X))) :- inst(x("c145-deemed-refusal",0,0,0,(X,))).
body(x("c145-deemed-refusal",0,0,0,(X,)),demandedRatification(X)) :- inst(x("c145-deemed-refusal",0,0,0,(X,))).
body(x("c145-deemed-refusal",0,0,0,(X,)),noAnswerWithin30Days(X)) :- inst(x("c145-deemed-refusal",0,0,0,(X,))).
body(x("c145-deemed-refusal",0,0,0,(X,)),guardianRatifies(X)) :- inst(x("c145-deemed-refusal",0,0,0,(X,))).
superior(x("c145-deemed-refusal",0,0,0,(X,)),r("c145-deemed-refusal",0,0,(X,))) :- inst(x("c145-deemed-refusal",0,0,0,(X,))).
exc(x("c145-deemed-refusal",0,0,0,(X,)),r("c145-deemed-refusal",0,0,(X,)),constitutiveRule,ratificationRefused(X)) :- inst(x("c145-deemed-refusal",0,0,0,(X,))).

% c145-revoke[0.0] 追认前，善意相对人有撤销的权利（第145条第2款；npc）
inst(r("c145-revoke",0,0,(C,X,))) :- cand(pendingValidity(X)), cand(counterpartyOf(C,X)), cand(inGoodFaith(C,X)).
constitutiveRule(r("c145-revoke",0,0,(C,X,)),revokeRight(C,X)) :- inst(r("c145-revoke",0,0,(C,X,))).
mainHead(r("c145-revoke",0,0,(C,X,)),constitutiveRule,revokeRight(C,X)) :- inst(r("c145-revoke",0,0,(C,X,))).
cand(revokeRight(C,X)) :- inst(r("c145-revoke",0,0,(C,X,))).
body(r("c145-revoke",0,0,(C,X,)),pendingValidity(X)) :- inst(r("c145-revoke",0,0,(C,X,))).
body(r("c145-revoke",0,0,(C,X,)),counterpartyOf(C,X)) :- inst(r("c145-revoke",0,0,(C,X,))).
body(r("c145-revoke",0,0,(C,X,)),inGoodFaith(C,X)) :- inst(r("c145-revoke",0,0,(C,X,))).

% tx-g1812[0.0] 分类（自动抽取自图的层级）：追认的形成权 ⊑ 被代理人的追认权和拒绝权
inst(r("tx-g1812",0,0,(X,))) :- cand(isA(X,"追认的形成权")).
constitutiveRule(r("tx-g1812",0,0,(X,)),isA(X,"被代理人的追认权和拒绝权")) :- inst(r("tx-g1812",0,0,(X,))).
mainHead(r("tx-g1812",0,0,(X,)),constitutiveRule,isA(X,"被代理人的追认权和拒绝权")) :- inst(r("tx-g1812",0,0,(X,))).
cand(isA(X,"被代理人的追认权和拒绝权")) :- inst(r("tx-g1812",0,0,(X,))).
body(r("tx-g1812",0,0,(X,)),isA(X,"追认的形成权")) :- inst(r("tx-g1812",0,0,(X,))).

% tx-g1814[0.0] 分类（自动抽取自图的层级）：拒绝的形成权 ⊑ 被代理人的追认权和拒绝权
inst(r("tx-g1814",0,0,(X,))) :- cand(isA(X,"拒绝的形成权")).
constitutiveRule(r("tx-g1814",0,0,(X,)),isA(X,"被代理人的追认权和拒绝权")) :- inst(r("tx-g1814",0,0,(X,))).
mainHead(r("tx-g1814",0,0,(X,)),constitutiveRule,isA(X,"被代理人的追认权和拒绝权")) :- inst(r("tx-g1814",0,0,(X,))).
cand(isA(X,"被代理人的追认权和拒绝权")) :- inst(r("tx-g1814",0,0,(X,))).
body(r("tx-g1814",0,0,(X,)),isA(X,"拒绝的形成权")) :- inst(r("tx-g1814",0,0,(X,))).

% tx-g1861[0.0] 分类（自动抽取自图的层级）：委托代理的终止 ⊑ 代理终止
inst(r("tx-g1861",0,0,(X,))) :- cand(isA(X,"委托代理的终止")).
constitutiveRule(r("tx-g1861",0,0,(X,)),isA(X,"代理终止")) :- inst(r("tx-g1861",0,0,(X,))).
mainHead(r("tx-g1861",0,0,(X,)),constitutiveRule,isA(X,"代理终止")) :- inst(r("tx-g1861",0,0,(X,))).
cand(isA(X,"代理终止")) :- inst(r("tx-g1861",0,0,(X,))).
body(r("tx-g1861",0,0,(X,)),isA(X,"委托代理的终止")) :- inst(r("tx-g1861",0,0,(X,))).

% tx-g1881[0.0] 分类（自动抽取自图的层级）：法定代理的终止 ⊑ 代理终止
inst(r("tx-g1881",0,0,(X,))) :- cand(isA(X,"法定代理的终止")).
constitutiveRule(r("tx-g1881",0,0,(X,)),isA(X,"代理终止")) :- inst(r("tx-g1881",0,0,(X,))).
mainHead(r("tx-g1881",0,0,(X,)),constitutiveRule,isA(X,"代理终止")) :- inst(r("tx-g1881",0,0,(X,))).
cand(isA(X,"代理终止")) :- inst(r("tx-g1881",0,0,(X,))).
body(r("tx-g1881",0,0,(X,)),isA(X,"法定代理的终止")) :- inst(r("tx-g1881",0,0,(X,))).

% c192-1[0.0] 诉讼时效期间届满的，义务人可以提出不履行义务的抗辩（抗辩权发生主义）（第192条第1款；npc）
inst(r("c192-1",0,0,(C,D,))) :- cand(limitationExpired(C)), cand(obligorOf(D,C)).
constitutiveRule(r("c192-1",0,0,(C,D,)),limitationDefense(D,C)) :- inst(r("c192-1",0,0,(C,D,))).
mainHead(r("c192-1",0,0,(C,D,)),constitutiveRule,limitationDefense(D,C)) :- inst(r("c192-1",0,0,(C,D,))).
cand(limitationDefense(D,C)) :- inst(r("c192-1",0,0,(C,D,))).
body(r("c192-1",0,0,(C,D,)),limitationExpired(C)) :- inst(r("c192-1",0,0,(C,D,))).
body(r("c192-1",0,0,(C,D,)),obligorOf(D,C)) :- inst(r("c192-1",0,0,(C,D,))).

% c192-2a[0.0] 届满后义务人同意履行的，不得以诉讼时效期间届满为由抗辩（第192条第2款；npc）
inst(r("c192-2a",0,0,(C,D,))) :- cand(obligorOf(D,C)), cand(agreedToPerformAfterExpiry(D,C)).
constitutiveRule(r("c192-2a",0,0,(C,D,)),non(limitationDefense(D,C))) :- inst(r("c192-2a",0,0,(C,D,))).
mainHead(r("c192-2a",0,0,(C,D,)),constitutiveRule,non(limitationDefense(D,C))) :- inst(r("c192-2a",0,0,(C,D,))).
cand(limitationDefense(D,C)) :- inst(r("c192-2a",0,0,(C,D,))).
body(r("c192-2a",0,0,(C,D,)),obligorOf(D,C)) :- inst(r("c192-2a",0,0,(C,D,))).
body(r("c192-2a",0,0,(C,D,)),agreedToPerformAfterExpiry(D,C)) :- inst(r("c192-2a",0,0,(C,D,))).

% c192-2b[0.0] 届满后义务人已经自愿履行的，不得请求返还（第192条第2款；npc）
inst(r("c192-2b",0,0,(C,D,))) :- cand(obligorOf(D,C)), cand(limitationExpired(C)), cand(voluntarilyPerformed(D,C)).
constitutiveRule(r("c192-2b",0,0,(C,D,)),non(restitutionClaim(D,C))) :- inst(r("c192-2b",0,0,(C,D,))).
mainHead(r("c192-2b",0,0,(C,D,)),constitutiveRule,non(restitutionClaim(D,C))) :- inst(r("c192-2b",0,0,(C,D,))).
cand(restitutionClaim(D,C)) :- inst(r("c192-2b",0,0,(C,D,))).
body(r("c192-2b",0,0,(C,D,)),obligorOf(D,C)) :- inst(r("c192-2b",0,0,(C,D,))).
body(r("c192-2b",0,0,(C,D,)),limitationExpired(C)) :- inst(r("c192-2b",0,0,(C,D,))).
body(r("c192-2b",0,0,(C,D,)),voluntarilyPerformed(D,C)) :- inst(r("c192-2b",0,0,(C,D,))).

% c193[0.0] 人民法院不得主动适用诉讼时效的规定（第193条；npc）
inst(r("c193",0,0,(C,J,))) :- cand(claim(C)), cand(courtHears(J,C)).
prescriptiveRule(r("c193",0,0,(C,J,)),non(applyLimitationExOfficio(J,C))) :- inst(r("c193",0,0,(C,J,))).
mainHead(r("c193",0,0,(C,J,)),prescriptiveRule,non(applyLimitationExOfficio(J,C))) :- inst(r("c193",0,0,(C,J,))).
cand(applyLimitationExOfficio(J,C)) :- inst(r("c193",0,0,(C,J,))).
body(r("c193",0,0,(C,J,)),claim(C)) :- inst(r("c193",0,0,(C,J,))).
body(r("c193",0,0,(C,J,)),courtHears(J,C)) :- inst(r("c193",0,0,(C,J,))).

% c196[0.0] 停止侵害、排除妨碍、消除危险，不动产及登记动产物权人请求返还，抚养费赡养费扶养费等不适用诉讼时效（第196条；npc）
inst(r("c196",0,0,(C,))) :- cand(claim(C)), cand(seeksCessationOrRemoval(C)).
constitutiveRule(r("c196",0,0,(C,)),exemptFromLimitation(C)) :- inst(r("c196",0,0,(C,))).
mainHead(r("c196",0,0,(C,)),constitutiveRule,exemptFromLimitation(C)) :- inst(r("c196",0,0,(C,))).
cand(exemptFromLimitation(C)) :- inst(r("c196",0,0,(C,))).
body(r("c196",0,0,(C,)),claim(C)) :- inst(r("c196",0,0,(C,))).
body(r("c196",0,0,(C,)),seeksCessationOrRemoval(C)) :- inst(r("c196",0,0,(C,))).
% c196[1.0] 停止侵害、排除妨碍、消除危险，不动产及登记动产物权人请求返还，抚养费赡养费扶养费等不适用诉讼时效（第196条；npc）
inst(r("c196",1,0,(C,))) :- cand(claim(C)), cand(returnOfImmovableOrRegisteredMovable(C)).
constitutiveRule(r("c196",1,0,(C,)),exemptFromLimitation(C)) :- inst(r("c196",1,0,(C,))).
mainHead(r("c196",1,0,(C,)),constitutiveRule,exemptFromLimitation(C)) :- inst(r("c196",1,0,(C,))).
cand(exemptFromLimitation(C)) :- inst(r("c196",1,0,(C,))).
body(r("c196",1,0,(C,)),claim(C)) :- inst(r("c196",1,0,(C,))).
body(r("c196",1,0,(C,)),returnOfImmovableOrRegisteredMovable(C)) :- inst(r("c196",1,0,(C,))).
% c196[2.0] 停止侵害、排除妨碍、消除危险，不动产及登记动产物权人请求返还，抚养费赡养费扶养费等不适用诉讼时效（第196条；npc）
inst(r("c196",2,0,(C,))) :- cand(claim(C)), cand(supportOrMaintenancePayment(C)).
constitutiveRule(r("c196",2,0,(C,)),exemptFromLimitation(C)) :- inst(r("c196",2,0,(C,))).
mainHead(r("c196",2,0,(C,)),constitutiveRule,exemptFromLimitation(C)) :- inst(r("c196",2,0,(C,))).
cand(exemptFromLimitation(C)) :- inst(r("c196",2,0,(C,))).
body(r("c196",2,0,(C,)),claim(C)) :- inst(r("c196",2,0,(C,))).
body(r("c196",2,0,(C,)),supportOrMaintenancePayment(C)) :- inst(r("c196",2,0,(C,))).
% c196[3.0] 停止侵害、排除妨碍、消除危险，不动产及登记动产物权人请求返还，抚养费赡养费扶养费等不适用诉讼时效（第196条；npc）
inst(r("c196",3,0,(C,))) :- cand(claim(C)), cand(statutorilyExempt(C)).
constitutiveRule(r("c196",3,0,(C,)),exemptFromLimitation(C)) :- inst(r("c196",3,0,(C,))).
mainHead(r("c196",3,0,(C,)),constitutiveRule,exemptFromLimitation(C)) :- inst(r("c196",3,0,(C,))).
cand(exemptFromLimitation(C)) :- inst(r("c196",3,0,(C,))).
body(r("c196",3,0,(C,)),claim(C)) :- inst(r("c196",3,0,(C,))).
body(r("c196",3,0,(C,)),statutorilyExempt(C)) :- inst(r("c196",3,0,(C,))).

% c188-20y[0.0] 自权利受到损害之日起超过二十年的，人民法院不予保护；有特殊情况的可以延长（第188条第2款；npc）
inst(r("c188-20y",0,0,(C,))) :- cand(claim(C)), cand(twentyYearsSinceDamage(C)).
constitutiveRule(r("c188-20y",0,0,(C,)),limitationExpired(C)) :- inst(r("c188-20y",0,0,(C,))).
mainHead(r("c188-20y",0,0,(C,)),constitutiveRule,limitationExpired(C)) :- inst(r("c188-20y",0,0,(C,))).
cand(limitationExpired(C)) :- inst(r("c188-20y",0,0,(C,))).
body(r("c188-20y",0,0,(C,)),claim(C)) :- inst(r("c188-20y",0,0,(C,))).
body(r("c188-20y",0,0,(C,)),twentyYearsSinceDamage(C)) :- inst(r("c188-20y",0,0,(C,))).
inst(x("c188-20y",0,0,0,(C,))) :- inst(r("c188-20y",0,0,(C,))), cand(courtExtends(C)).
constitutiveRule(x("c188-20y",0,0,0,(C,)),non(limitationExpired(C))) :- inst(x("c188-20y",0,0,0,(C,))).
body(x("c188-20y",0,0,0,(C,)),claim(C)) :- inst(x("c188-20y",0,0,0,(C,))).
body(x("c188-20y",0,0,0,(C,)),twentyYearsSinceDamage(C)) :- inst(x("c188-20y",0,0,0,(C,))).
body(x("c188-20y",0,0,0,(C,)),courtExtends(C)) :- inst(x("c188-20y",0,0,0,(C,))).
superior(x("c188-20y",0,0,0,(C,)),r("c188-20y",0,0,(C,))) :- inst(x("c188-20y",0,0,0,(C,))).
exc(x("c188-20y",0,0,0,(C,)),r("c188-20y",0,0,(C,)),constitutiveRule,limitationExpired(C)) :- inst(x("c188-20y",0,0,0,(C,))).
inst(x("c188-20y",0,0,1,(C,))) :- inst(r("c188-20y",0,0,(C,))), cand(exemptFromLimitation(C)).
constitutiveRule(x("c188-20y",0,0,1,(C,)),non(limitationExpired(C))) :- inst(x("c188-20y",0,0,1,(C,))).
body(x("c188-20y",0,0,1,(C,)),claim(C)) :- inst(x("c188-20y",0,0,1,(C,))).
body(x("c188-20y",0,0,1,(C,)),twentyYearsSinceDamage(C)) :- inst(x("c188-20y",0,0,1,(C,))).
body(x("c188-20y",0,0,1,(C,)),exemptFromLimitation(C)) :- inst(x("c188-20y",0,0,1,(C,))).
superior(x("c188-20y",0,0,1,(C,)),r("c188-20y",0,0,(C,))) :- inst(x("c188-20y",0,0,1,(C,))).
exc(x("c188-20y",0,0,1,(C,)),r("c188-20y",0,0,(C,)),constitutiveRule,limitationExpired(C)) :- inst(x("c188-20y",0,0,1,(C,))).
% c188-20y[0.1] 自权利受到损害之日起超过二十年的，人民法院不予保护；有特殊情况的可以延长（第188条第2款；npc）
inst(r("c188-20y",0,1,(C,))) :- cand(claim(C)), cand(twentyYearsSinceDamage(C)).
constitutiveRule(r("c188-20y",0,1,(C,)),notProtectedByCourt(C)) :- inst(r("c188-20y",0,1,(C,))).
mainHead(r("c188-20y",0,1,(C,)),constitutiveRule,notProtectedByCourt(C)) :- inst(r("c188-20y",0,1,(C,))).
cand(notProtectedByCourt(C)) :- inst(r("c188-20y",0,1,(C,))).
body(r("c188-20y",0,1,(C,)),claim(C)) :- inst(r("c188-20y",0,1,(C,))).
body(r("c188-20y",0,1,(C,)),twentyYearsSinceDamage(C)) :- inst(r("c188-20y",0,1,(C,))).
inst(x("c188-20y",0,1,0,(C,))) :- inst(r("c188-20y",0,1,(C,))), cand(courtExtends(C)).
constitutiveRule(x("c188-20y",0,1,0,(C,)),non(notProtectedByCourt(C))) :- inst(x("c188-20y",0,1,0,(C,))).
body(x("c188-20y",0,1,0,(C,)),claim(C)) :- inst(x("c188-20y",0,1,0,(C,))).
body(x("c188-20y",0,1,0,(C,)),twentyYearsSinceDamage(C)) :- inst(x("c188-20y",0,1,0,(C,))).
body(x("c188-20y",0,1,0,(C,)),courtExtends(C)) :- inst(x("c188-20y",0,1,0,(C,))).
superior(x("c188-20y",0,1,0,(C,)),r("c188-20y",0,1,(C,))) :- inst(x("c188-20y",0,1,0,(C,))).
exc(x("c188-20y",0,1,0,(C,)),r("c188-20y",0,1,(C,)),constitutiveRule,notProtectedByCourt(C)) :- inst(x("c188-20y",0,1,0,(C,))).
inst(x("c188-20y",0,1,1,(C,))) :- inst(r("c188-20y",0,1,(C,))), cand(exemptFromLimitation(C)).
constitutiveRule(x("c188-20y",0,1,1,(C,)),non(notProtectedByCourt(C))) :- inst(x("c188-20y",0,1,1,(C,))).
body(x("c188-20y",0,1,1,(C,)),claim(C)) :- inst(x("c188-20y",0,1,1,(C,))).
body(x("c188-20y",0,1,1,(C,)),twentyYearsSinceDamage(C)) :- inst(x("c188-20y",0,1,1,(C,))).
body(x("c188-20y",0,1,1,(C,)),exemptFromLimitation(C)) :- inst(x("c188-20y",0,1,1,(C,))).
superior(x("c188-20y",0,1,1,(C,)),r("c188-20y",0,1,(C,))) :- inst(x("c188-20y",0,1,1,(C,))).
exc(x("c188-20y",0,1,1,(C,)),r("c188-20y",0,1,(C,)),constitutiveRule,notProtectedByCourt(C)) :- inst(x("c188-20y",0,1,1,(C,))).

% c188-run[0.0] 自知道或应当知道权利受损害及义务人之日起满三年，诉讼时效期间届满（第188条第2款；npc）
inst(r("c188-run",0,0,(C,))) :- cand(claim(C)), cand(threeYearsSinceKnew(C)).
constitutiveRule(r("c188-run",0,0,(C,)),limitationExpired(C)) :- inst(r("c188-run",0,0,(C,))).
mainHead(r("c188-run",0,0,(C,)),constitutiveRule,limitationExpired(C)) :- inst(r("c188-run",0,0,(C,))).
cand(limitationExpired(C)) :- inst(r("c188-run",0,0,(C,))).
body(r("c188-run",0,0,(C,)),claim(C)) :- inst(r("c188-run",0,0,(C,))).
body(r("c188-run",0,0,(C,)),threeYearsSinceKnew(C)) :- inst(r("c188-run",0,0,(C,))).
inst(x("c188-run",0,0,0,(C,))) :- inst(r("c188-run",0,0,(C,))), cand(limitationInterrupted(C)).
constitutiveRule(x("c188-run",0,0,0,(C,)),non(limitationExpired(C))) :- inst(x("c188-run",0,0,0,(C,))).
body(x("c188-run",0,0,0,(C,)),claim(C)) :- inst(x("c188-run",0,0,0,(C,))).
body(x("c188-run",0,0,0,(C,)),threeYearsSinceKnew(C)) :- inst(x("c188-run",0,0,0,(C,))).
body(x("c188-run",0,0,0,(C,)),limitationInterrupted(C)) :- inst(x("c188-run",0,0,0,(C,))).
superior(x("c188-run",0,0,0,(C,)),r("c188-run",0,0,(C,))) :- inst(x("c188-run",0,0,0,(C,))).
exc(x("c188-run",0,0,0,(C,)),r("c188-run",0,0,(C,)),constitutiveRule,limitationExpired(C)) :- inst(x("c188-run",0,0,0,(C,))).
inst(x("c188-run",0,0,1,(C,))) :- inst(r("c188-run",0,0,(C,))), cand(limitationSuspended(C)).
constitutiveRule(x("c188-run",0,0,1,(C,)),non(limitationExpired(C))) :- inst(x("c188-run",0,0,1,(C,))).
body(x("c188-run",0,0,1,(C,)),claim(C)) :- inst(x("c188-run",0,0,1,(C,))).
body(x("c188-run",0,0,1,(C,)),threeYearsSinceKnew(C)) :- inst(x("c188-run",0,0,1,(C,))).
body(x("c188-run",0,0,1,(C,)),limitationSuspended(C)) :- inst(x("c188-run",0,0,1,(C,))).
superior(x("c188-run",0,0,1,(C,)),r("c188-run",0,0,(C,))) :- inst(x("c188-run",0,0,1,(C,))).
exc(x("c188-run",0,0,1,(C,)),r("c188-run",0,0,(C,)),constitutiveRule,limitationExpired(C)) :- inst(x("c188-run",0,0,1,(C,))).
inst(x("c188-run",0,0,2,(C,))) :- inst(r("c188-run",0,0,(C,))), cand(exemptFromLimitation(C)).
constitutiveRule(x("c188-run",0,0,2,(C,)),non(limitationExpired(C))) :- inst(x("c188-run",0,0,2,(C,))).
body(x("c188-run",0,0,2,(C,)),claim(C)) :- inst(x("c188-run",0,0,2,(C,))).
body(x("c188-run",0,0,2,(C,)),threeYearsSinceKnew(C)) :- inst(x("c188-run",0,0,2,(C,))).
body(x("c188-run",0,0,2,(C,)),exemptFromLimitation(C)) :- inst(x("c188-run",0,0,2,(C,))).
superior(x("c188-run",0,0,2,(C,)),r("c188-run",0,0,(C,))) :- inst(x("c188-run",0,0,2,(C,))).
exc(x("c188-run",0,0,2,(C,)),r("c188-run",0,0,(C,)),constitutiveRule,limitationExpired(C)) :- inst(x("c188-run",0,0,2,(C,))).

% c194[0.0] 最后六个月内因法定障碍不能行使请求权的，诉讼时效中止（第194条第1款；npc）
inst(r("c194",0,0,(C,))) :- cand(claim(C)), cand(withinLastSixMonths(C)), cand(forceMajeure(C)).
constitutiveRule(r("c194",0,0,(C,)),limitationSuspended(C)) :- inst(r("c194",0,0,(C,))).
mainHead(r("c194",0,0,(C,)),constitutiveRule,limitationSuspended(C)) :- inst(r("c194",0,0,(C,))).
cand(limitationSuspended(C)) :- inst(r("c194",0,0,(C,))).
body(r("c194",0,0,(C,)),claim(C)) :- inst(r("c194",0,0,(C,))).
body(r("c194",0,0,(C,)),withinLastSixMonths(C)) :- inst(r("c194",0,0,(C,))).
body(r("c194",0,0,(C,)),forceMajeure(C)) :- inst(r("c194",0,0,(C,))).
% c194[1.0] 最后六个月内因法定障碍不能行使请求权的，诉讼时效中止（第194条第1款；npc）
inst(r("c194",1,0,(C,))) :- cand(claim(C)), cand(withinLastSixMonths(C)), cand(incapableClaimantWithoutAgent(C)).
constitutiveRule(r("c194",1,0,(C,)),limitationSuspended(C)) :- inst(r("c194",1,0,(C,))).
mainHead(r("c194",1,0,(C,)),constitutiveRule,limitationSuspended(C)) :- inst(r("c194",1,0,(C,))).
cand(limitationSuspended(C)) :- inst(r("c194",1,0,(C,))).
body(r("c194",1,0,(C,)),claim(C)) :- inst(r("c194",1,0,(C,))).
body(r("c194",1,0,(C,)),withinLastSixMonths(C)) :- inst(r("c194",1,0,(C,))).
body(r("c194",1,0,(C,)),incapableClaimantWithoutAgent(C)) :- inst(r("c194",1,0,(C,))).
% c194[2.0] 最后六个月内因法定障碍不能行使请求权的，诉讼时效中止（第194条第1款；npc）
inst(r("c194",2,0,(C,))) :- cand(claim(C)), cand(withinLastSixMonths(C)), cand(heirOrAdministratorUndetermined(C)).
constitutiveRule(r("c194",2,0,(C,)),limitationSuspended(C)) :- inst(r("c194",2,0,(C,))).
mainHead(r("c194",2,0,(C,)),constitutiveRule,limitationSuspended(C)) :- inst(r("c194",2,0,(C,))).
cand(limitationSuspended(C)) :- inst(r("c194",2,0,(C,))).
body(r("c194",2,0,(C,)),claim(C)) :- inst(r("c194",2,0,(C,))).
body(r("c194",2,0,(C,)),withinLastSixMonths(C)) :- inst(r("c194",2,0,(C,))).
body(r("c194",2,0,(C,)),heirOrAdministratorUndetermined(C)) :- inst(r("c194",2,0,(C,))).
% c194[3.0] 最后六个月内因法定障碍不能行使请求权的，诉讼时效中止（第194条第1款；npc）
inst(r("c194",3,0,(C,))) :- cand(claim(C)), cand(withinLastSixMonths(C)), cand(claimantControlledByObligor(C)).
constitutiveRule(r("c194",3,0,(C,)),limitationSuspended(C)) :- inst(r("c194",3,0,(C,))).
mainHead(r("c194",3,0,(C,)),constitutiveRule,limitationSuspended(C)) :- inst(r("c194",3,0,(C,))).
cand(limitationSuspended(C)) :- inst(r("c194",3,0,(C,))).
body(r("c194",3,0,(C,)),claim(C)) :- inst(r("c194",3,0,(C,))).
body(r("c194",3,0,(C,)),withinLastSixMonths(C)) :- inst(r("c194",3,0,(C,))).
body(r("c194",3,0,(C,)),claimantControlledByObligor(C)) :- inst(r("c194",3,0,(C,))).
% c194[4.0] 最后六个月内因法定障碍不能行使请求权的，诉讼时效中止（第194条第1款；npc）
inst(r("c194",4,0,(C,))) :- cand(claim(C)), cand(withinLastSixMonths(C)), cand(otherObstacle(C)).
constitutiveRule(r("c194",4,0,(C,)),limitationSuspended(C)) :- inst(r("c194",4,0,(C,))).
mainHead(r("c194",4,0,(C,)),constitutiveRule,limitationSuspended(C)) :- inst(r("c194",4,0,(C,))).
cand(limitationSuspended(C)) :- inst(r("c194",4,0,(C,))).
body(r("c194",4,0,(C,)),claim(C)) :- inst(r("c194",4,0,(C,))).
body(r("c194",4,0,(C,)),withinLastSixMonths(C)) :- inst(r("c194",4,0,(C,))).
body(r("c194",4,0,(C,)),otherObstacle(C)) :- inst(r("c194",4,0,(C,))).

% c195[0.0] 权利人请求履行、义务人同意履行、起诉或申请仲裁等，诉讼时效中断、重新计算（第195条；npc）
inst(r("c195",0,0,(C,))) :- cand(claim(C)), cand(creditorDemandsPerformance(C)).
constitutiveRule(r("c195",0,0,(C,)),limitationInterrupted(C)) :- inst(r("c195",0,0,(C,))).
mainHead(r("c195",0,0,(C,)),constitutiveRule,limitationInterrupted(C)) :- inst(r("c195",0,0,(C,))).
cand(limitationInterrupted(C)) :- inst(r("c195",0,0,(C,))).
body(r("c195",0,0,(C,)),claim(C)) :- inst(r("c195",0,0,(C,))).
body(r("c195",0,0,(C,)),creditorDemandsPerformance(C)) :- inst(r("c195",0,0,(C,))).
% c195[1.0] 权利人请求履行、义务人同意履行、起诉或申请仲裁等，诉讼时效中断、重新计算（第195条；npc）
inst(r("c195",1,0,(C,))) :- cand(claim(C)), cand(obligorAgreesToPerform(C)).
constitutiveRule(r("c195",1,0,(C,)),limitationInterrupted(C)) :- inst(r("c195",1,0,(C,))).
mainHead(r("c195",1,0,(C,)),constitutiveRule,limitationInterrupted(C)) :- inst(r("c195",1,0,(C,))).
cand(limitationInterrupted(C)) :- inst(r("c195",1,0,(C,))).
body(r("c195",1,0,(C,)),claim(C)) :- inst(r("c195",1,0,(C,))).
body(r("c195",1,0,(C,)),obligorAgreesToPerform(C)) :- inst(r("c195",1,0,(C,))).
% c195[2.0] 权利人请求履行、义务人同意履行、起诉或申请仲裁等，诉讼时效中断、重新计算（第195条；npc）
inst(r("c195",2,0,(C,))) :- cand(claim(C)), cand(suitOrArbitrationFiled(C)).
constitutiveRule(r("c195",2,0,(C,)),limitationInterrupted(C)) :- inst(r("c195",2,0,(C,))).
mainHead(r("c195",2,0,(C,)),constitutiveRule,limitationInterrupted(C)) :- inst(r("c195",2,0,(C,))).
cand(limitationInterrupted(C)) :- inst(r("c195",2,0,(C,))).
body(r("c195",2,0,(C,)),claim(C)) :- inst(r("c195",2,0,(C,))).
body(r("c195",2,0,(C,)),suitOrArbitrationFiled(C)) :- inst(r("c195",2,0,(C,))).
% c195[3.0] 权利人请求履行、义务人同意履行、起诉或申请仲裁等，诉讼时效中断、重新计算（第195条；npc）
inst(r("c195",3,0,(C,))) :- cand(claim(C)), cand(equivalentProceeding(C)).
constitutiveRule(r("c195",3,0,(C,)),limitationInterrupted(C)) :- inst(r("c195",3,0,(C,))).
mainHead(r("c195",3,0,(C,)),constitutiveRule,limitationInterrupted(C)) :- inst(r("c195",3,0,(C,))).
cand(limitationInterrupted(C)) :- inst(r("c195",3,0,(C,))).
body(r("c195",3,0,(C,)),claim(C)) :- inst(r("c195",3,0,(C,))).
body(r("c195",3,0,(C,)),equivalentProceeding(C)) :- inst(r("c195",3,0,(C,))).

% tx-g2094[0.0] 分类（自动抽取自图的层级）：平等保护原则 ⊑ 物权法的基本原则
inst(r("tx-g2094",0,0,(X,))) :- cand(isA(X,"平等保护原则")).
constitutiveRule(r("tx-g2094",0,0,(X,)),isA(X,"物权法的基本原则")) :- inst(r("tx-g2094",0,0,(X,))).
mainHead(r("tx-g2094",0,0,(X,)),constitutiveRule,isA(X,"物权法的基本原则")) :- inst(r("tx-g2094",0,0,(X,))).
cand(isA(X,"物权法的基本原则")) :- inst(r("tx-g2094",0,0,(X,))).
body(r("tx-g2094",0,0,(X,)),isA(X,"平等保护原则")) :- inst(r("tx-g2094",0,0,(X,))).

% tx-g2102[0.0] 分类（自动抽取自图的层级）：物权客体特定原则 ⊑ 物权法的基本原则
inst(r("tx-g2102",0,0,(X,))) :- cand(isA(X,"物权客体特定原则")).
constitutiveRule(r("tx-g2102",0,0,(X,)),isA(X,"物权法的基本原则")) :- inst(r("tx-g2102",0,0,(X,))).
mainHead(r("tx-g2102",0,0,(X,)),constitutiveRule,isA(X,"物权法的基本原则")) :- inst(r("tx-g2102",0,0,(X,))).
cand(isA(X,"物权法的基本原则")) :- inst(r("tx-g2102",0,0,(X,))).
body(r("tx-g2102",0,0,(X,)),isA(X,"物权客体特定原则")) :- inst(r("tx-g2102",0,0,(X,))).

% tx-g2108[0.0] 分类（自动抽取自图的层级）：物权法定原则 ⊑ 物权法的基本原则
inst(r("tx-g2108",0,0,(X,))) :- cand(isA(X,"物权法定原则")).
constitutiveRule(r("tx-g2108",0,0,(X,)),isA(X,"物权法的基本原则")) :- inst(r("tx-g2108",0,0,(X,))).
mainHead(r("tx-g2108",0,0,(X,)),constitutiveRule,isA(X,"物权法的基本原则")) :- inst(r("tx-g2108",0,0,(X,))).
cand(isA(X,"物权法的基本原则")) :- inst(r("tx-g2108",0,0,(X,))).
body(r("tx-g2108",0,0,(X,)),isA(X,"物权法定原则")) :- inst(r("tx-g2108",0,0,(X,))).

% tx-g2250[0.0] 分类（自动抽取自图的层级）：简易交付 ⊑ 观念交付
inst(r("tx-g2250",0,0,(X,))) :- cand(isA(X,"简易交付")).
constitutiveRule(r("tx-g2250",0,0,(X,)),isA(X,"观念交付")) :- inst(r("tx-g2250",0,0,(X,))).
mainHead(r("tx-g2250",0,0,(X,)),constitutiveRule,isA(X,"观念交付")) :- inst(r("tx-g2250",0,0,(X,))).
cand(isA(X,"观念交付")) :- inst(r("tx-g2250",0,0,(X,))).
body(r("tx-g2250",0,0,(X,)),isA(X,"简易交付")) :- inst(r("tx-g2250",0,0,(X,))).

% tx-g2255[0.0] 分类（自动抽取自图的层级）：指示交付 ⊑ 观念交付
inst(r("tx-g2255",0,0,(X,))) :- cand(isA(X,"指示交付")).
constitutiveRule(r("tx-g2255",0,0,(X,)),isA(X,"观念交付")) :- inst(r("tx-g2255",0,0,(X,))).
mainHead(r("tx-g2255",0,0,(X,)),constitutiveRule,isA(X,"观念交付")) :- inst(r("tx-g2255",0,0,(X,))).
cand(isA(X,"观念交付")) :- inst(r("tx-g2255",0,0,(X,))).
body(r("tx-g2255",0,0,(X,)),isA(X,"指示交付")) :- inst(r("tx-g2255",0,0,(X,))).

% tx-g2314[0.0] 分类（自动抽取自图的层级）：首次登记 ⊑ 变动登记
inst(r("tx-g2314",0,0,(X,))) :- cand(isA(X,"首次登记")).
constitutiveRule(r("tx-g2314",0,0,(X,)),isA(X,"变动登记")) :- inst(r("tx-g2314",0,0,(X,))).
mainHead(r("tx-g2314",0,0,(X,)),constitutiveRule,isA(X,"变动登记")) :- inst(r("tx-g2314",0,0,(X,))).
cand(isA(X,"变动登记")) :- inst(r("tx-g2314",0,0,(X,))).
body(r("tx-g2314",0,0,(X,)),isA(X,"首次登记")) :- inst(r("tx-g2314",0,0,(X,))).

% tx-g2316[0.0] 分类（自动抽取自图的层级）：变更登记 ⊑ 变动登记
inst(r("tx-g2316",0,0,(X,))) :- cand(isA(X,"变更登记")).
constitutiveRule(r("tx-g2316",0,0,(X,)),isA(X,"变动登记")) :- inst(r("tx-g2316",0,0,(X,))).
mainHead(r("tx-g2316",0,0,(X,)),constitutiveRule,isA(X,"变动登记")) :- inst(r("tx-g2316",0,0,(X,))).
cand(isA(X,"变动登记")) :- inst(r("tx-g2316",0,0,(X,))).
body(r("tx-g2316",0,0,(X,)),isA(X,"变更登记")) :- inst(r("tx-g2316",0,0,(X,))).

% tx-g2318[0.0] 分类（自动抽取自图的层级）：转移登记 ⊑ 变动登记
inst(r("tx-g2318",0,0,(X,))) :- cand(isA(X,"转移登记")).
constitutiveRule(r("tx-g2318",0,0,(X,)),isA(X,"变动登记")) :- inst(r("tx-g2318",0,0,(X,))).
mainHead(r("tx-g2318",0,0,(X,)),constitutiveRule,isA(X,"变动登记")) :- inst(r("tx-g2318",0,0,(X,))).
cand(isA(X,"变动登记")) :- inst(r("tx-g2318",0,0,(X,))).
body(r("tx-g2318",0,0,(X,)),isA(X,"转移登记")) :- inst(r("tx-g2318",0,0,(X,))).

% tx-g2320[0.0] 分类（自动抽取自图的层级）：注销登记 ⊑ 变动登记
inst(r("tx-g2320",0,0,(X,))) :- cand(isA(X,"注销登记")).
constitutiveRule(r("tx-g2320",0,0,(X,)),isA(X,"变动登记")) :- inst(r("tx-g2320",0,0,(X,))).
mainHead(r("tx-g2320",0,0,(X,)),constitutiveRule,isA(X,"变动登记")) :- inst(r("tx-g2320",0,0,(X,))).
cand(isA(X,"变动登记")) :- inst(r("tx-g2320",0,0,(X,))).
body(r("tx-g2320",0,0,(X,)),isA(X,"注销登记")) :- inst(r("tx-g2320",0,0,(X,))).

% tx-g2443[0.0] 分类（自动抽取自图的层级）：积极权能 ⊑ 权能
inst(r("tx-g2443",0,0,(X,))) :- cand(isA(X,"积极权能")).
constitutiveRule(r("tx-g2443",0,0,(X,)),isA(X,"权能")) :- inst(r("tx-g2443",0,0,(X,))).
mainHead(r("tx-g2443",0,0,(X,)),constitutiveRule,isA(X,"权能")) :- inst(r("tx-g2443",0,0,(X,))).
cand(isA(X,"权能")) :- inst(r("tx-g2443",0,0,(X,))).
body(r("tx-g2443",0,0,(X,)),isA(X,"积极权能")) :- inst(r("tx-g2443",0,0,(X,))).

% tx-g2448[0.0] 分类（自动抽取自图的层级）：消极权能 ⊑ 权能
inst(r("tx-g2448",0,0,(X,))) :- cand(isA(X,"消极权能")).
constitutiveRule(r("tx-g2448",0,0,(X,)),isA(X,"权能")) :- inst(r("tx-g2448",0,0,(X,))).
mainHead(r("tx-g2448",0,0,(X,)),constitutiveRule,isA(X,"权能")) :- inst(r("tx-g2448",0,0,(X,))).
cand(isA(X,"权能")) :- inst(r("tx-g2448",0,0,(X,))).
body(r("tx-g2448",0,0,(X,)),isA(X,"消极权能")) :- inst(r("tx-g2448",0,0,(X,))).

% tx-g2492[0.0] 分类（自动抽取自图的层级）：动产与不动产的附合 ⊑ 附合
inst(r("tx-g2492",0,0,(X,))) :- cand(isA(X,"动产与不动产的附合")).
constitutiveRule(r("tx-g2492",0,0,(X,)),isA(X,"附合")) :- inst(r("tx-g2492",0,0,(X,))).
mainHead(r("tx-g2492",0,0,(X,)),constitutiveRule,isA(X,"附合")) :- inst(r("tx-g2492",0,0,(X,))).
cand(isA(X,"附合")) :- inst(r("tx-g2492",0,0,(X,))).
body(r("tx-g2492",0,0,(X,)),isA(X,"动产与不动产的附合")) :- inst(r("tx-g2492",0,0,(X,))).

% tx-g2494[0.0] 分类（自动抽取自图的层级）：动产与动产的附合 ⊑ 附合
inst(r("tx-g2494",0,0,(X,))) :- cand(isA(X,"动产与动产的附合")).
constitutiveRule(r("tx-g2494",0,0,(X,)),isA(X,"附合")) :- inst(r("tx-g2494",0,0,(X,))).
mainHead(r("tx-g2494",0,0,(X,)),constitutiveRule,isA(X,"附合")) :- inst(r("tx-g2494",0,0,(X,))).
cand(isA(X,"附合")) :- inst(r("tx-g2494",0,0,(X,))).
body(r("tx-g2494",0,0,(X,)),isA(X,"动产与动产的附合")) :- inst(r("tx-g2494",0,0,(X,))).

% tx-g2509[0.0] 分类（自动抽取自图的层级）：不动产与不动产的附合 ⊑ 附合
inst(r("tx-g2509",0,0,(X,))) :- cand(isA(X,"不动产与不动产的附合")).
constitutiveRule(r("tx-g2509",0,0,(X,)),isA(X,"附合")) :- inst(r("tx-g2509",0,0,(X,))).
mainHead(r("tx-g2509",0,0,(X,)),constitutiveRule,isA(X,"附合")) :- inst(r("tx-g2509",0,0,(X,))).
cand(isA(X,"附合")) :- inst(r("tx-g2509",0,0,(X,))).
body(r("tx-g2509",0,0,(X,)),isA(X,"不动产与不动产的附合")) :- inst(r("tx-g2509",0,0,(X,))).

% tx-g2607[0.0] 分类（自动抽取自图的层级）：两种有偿回复 ⊑ 原则上无偿回复
inst(r("tx-g2607",0,0,(X,))) :- cand(isA(X,"两种有偿回复")).
constitutiveRule(r("tx-g2607",0,0,(X,)),isA(X,"原则上无偿回复")) :- inst(r("tx-g2607",0,0,(X,))).
mainHead(r("tx-g2607",0,0,(X,)),constitutiveRule,isA(X,"原则上无偿回复")) :- inst(r("tx-g2607",0,0,(X,))).
cand(isA(X,"原则上无偿回复")) :- inst(r("tx-g2607",0,0,(X,))).
body(r("tx-g2607",0,0,(X,)),isA(X,"两种有偿回复")) :- inst(r("tx-g2607",0,0,(X,))).

% tx-g2610[0.0] 分类（自动抽取自图的层级）：除此之外都是无偿回复 ⊑ 原则上无偿回复
inst(r("tx-g2610",0,0,(X,))) :- cand(isA(X,"除此之外都是无偿回复")).
constitutiveRule(r("tx-g2610",0,0,(X,)),isA(X,"原则上无偿回复")) :- inst(r("tx-g2610",0,0,(X,))).
mainHead(r("tx-g2610",0,0,(X,)),constitutiveRule,isA(X,"原则上无偿回复")) :- inst(r("tx-g2610",0,0,(X,))).
cand(isA(X,"原则上无偿回复")) :- inst(r("tx-g2610",0,0,(X,))).
body(r("tx-g2610",0,0,(X,)),isA(X,"除此之外都是无偿回复")) :- inst(r("tx-g2610",0,0,(X,))).

% tx-g2757[0.0] 分类（自动抽取自图的层级）：按份共有 ⊑ 共有
inst(r("tx-g2757",0,0,(X,))) :- cand(isA(X,"按份共有")).
constitutiveRule(r("tx-g2757",0,0,(X,)),isA(X,"共有")) :- inst(r("tx-g2757",0,0,(X,))).
mainHead(r("tx-g2757",0,0,(X,)),constitutiveRule,isA(X,"共有")) :- inst(r("tx-g2757",0,0,(X,))).
cand(isA(X,"共有")) :- inst(r("tx-g2757",0,0,(X,))).
body(r("tx-g2757",0,0,(X,)),isA(X,"按份共有")) :- inst(r("tx-g2757",0,0,(X,))).

% tx-g2824[0.0] 分类（自动抽取自图的层级）：共同共有 ⊑ 共有
inst(r("tx-g2824",0,0,(X,))) :- cand(isA(X,"共同共有")).
constitutiveRule(r("tx-g2824",0,0,(X,)),isA(X,"共有")) :- inst(r("tx-g2824",0,0,(X,))).
mainHead(r("tx-g2824",0,0,(X,)),constitutiveRule,isA(X,"共有")) :- inst(r("tx-g2824",0,0,(X,))).
cand(isA(X,"共有")) :- inst(r("tx-g2824",0,0,(X,))).
body(r("tx-g2824",0,0,(X,)),isA(X,"共同共有")) :- inst(r("tx-g2824",0,0,(X,))).

% tx-g2775[0.0] 分类（自动抽取自图的层级）：分割请求权 ⊑ 分割请求权和转让权
inst(r("tx-g2775",0,0,(X,))) :- cand(isA(X,"分割请求权")).
constitutiveRule(r("tx-g2775",0,0,(X,)),isA(X,"分割请求权和转让权")) :- inst(r("tx-g2775",0,0,(X,))).
mainHead(r("tx-g2775",0,0,(X,)),constitutiveRule,isA(X,"分割请求权和转让权")) :- inst(r("tx-g2775",0,0,(X,))).
cand(isA(X,"分割请求权和转让权")) :- inst(r("tx-g2775",0,0,(X,))).
body(r("tx-g2775",0,0,(X,)),isA(X,"分割请求权")) :- inst(r("tx-g2775",0,0,(X,))).

% tx-g2781[0.0] 分类（自动抽取自图的层级）：份额转让权 ⊑ 分割请求权和转让权
inst(r("tx-g2781",0,0,(X,))) :- cand(isA(X,"份额转让权")).
constitutiveRule(r("tx-g2781",0,0,(X,)),isA(X,"分割请求权和转让权")) :- inst(r("tx-g2781",0,0,(X,))).
mainHead(r("tx-g2781",0,0,(X,)),constitutiveRule,isA(X,"分割请求权和转让权")) :- inst(r("tx-g2781",0,0,(X,))).
cand(isA(X,"分割请求权和转让权")) :- inst(r("tx-g2781",0,0,(X,))).
body(r("tx-g2781",0,0,(X,)),isA(X,"份额转让权")) :- inst(r("tx-g2781",0,0,(X,))).

% tx-g2898[0.0] 分类（自动抽取自图的层级）：用益物权 ⊑ 海域使用权
inst(r("tx-g2898",0,0,(X,))) :- cand(isA(X,"用益物权")).
constitutiveRule(r("tx-g2898",0,0,(X,)),isA(X,"海域使用权")) :- inst(r("tx-g2898",0,0,(X,))).
mainHead(r("tx-g2898",0,0,(X,)),constitutiveRule,isA(X,"海域使用权")) :- inst(r("tx-g2898",0,0,(X,))).
cand(isA(X,"海域使用权")) :- inst(r("tx-g2898",0,0,(X,))).
body(r("tx-g2898",0,0,(X,)),isA(X,"用益物权")) :- inst(r("tx-g2898",0,0,(X,))).

% tx-g2899[0.0] 分类（自动抽取自图的层级）：可以设立抵押权 ⊑ 海域使用权
inst(r("tx-g2899",0,0,(X,))) :- cand(isA(X,"可以设立抵押权")).
constitutiveRule(r("tx-g2899",0,0,(X,)),isA(X,"海域使用权")) :- inst(r("tx-g2899",0,0,(X,))).
mainHead(r("tx-g2899",0,0,(X,)),constitutiveRule,isA(X,"海域使用权")) :- inst(r("tx-g2899",0,0,(X,))).
cand(isA(X,"海域使用权")) :- inst(r("tx-g2899",0,0,(X,))).
body(r("tx-g2899",0,0,(X,)),isA(X,"可以设立抵押权")) :- inst(r("tx-g2899",0,0,(X,))).

% c374[0.0] 地役权自地役权合同生效时设立（第374条；npc）
inst(r("c374",0,0,(A,B,K,L,))) :- cand(easementContract(K,A,B,L)), cand(valid(K)).
constitutiveRule(r("c374",0,0,(A,B,K,L,)),easementEstablished(K)) :- inst(r("c374",0,0,(A,B,K,L,))).
mainHead(r("c374",0,0,(A,B,K,L,)),constitutiveRule,easementEstablished(K)) :- inst(r("c374",0,0,(A,B,K,L,))).
cand(easementEstablished(K)) :- inst(r("c374",0,0,(A,B,K,L,))).
body(r("c374",0,0,(A,B,K,L,)),easementContract(K,A,B,L)) :- inst(r("c374",0,0,(A,B,K,L,))).
body(r("c374",0,0,(A,B,K,L,)),valid(K)) :- inst(r("c374",0,0,(A,B,K,L,))).

% c374-oppose[0.0] 未经登记，不得对抗善意第三人（第374条；npc）
inst(r("c374-oppose",0,0,(A,B,K,L,Y,))) :- cand(easementContract(K,A,B,L)), cand(easementEstablished(K)), cand(acquirerOfServientLand(Y,L)), cand(inGoodFaith(Y,L)).
constitutiveRule(r("c374-oppose",0,0,(A,B,K,L,Y,)),non(easementOpposableTo(K,Y))) :- inst(r("c374-oppose",0,0,(A,B,K,L,Y,))).
mainHead(r("c374-oppose",0,0,(A,B,K,L,Y,)),constitutiveRule,non(easementOpposableTo(K,Y))) :- inst(r("c374-oppose",0,0,(A,B,K,L,Y,))).
cand(easementOpposableTo(K,Y)) :- inst(r("c374-oppose",0,0,(A,B,K,L,Y,))).
body(r("c374-oppose",0,0,(A,B,K,L,Y,)),easementContract(K,A,B,L)) :- inst(r("c374-oppose",0,0,(A,B,K,L,Y,))).
body(r("c374-oppose",0,0,(A,B,K,L,Y,)),easementEstablished(K)) :- inst(r("c374-oppose",0,0,(A,B,K,L,Y,))).
body(r("c374-oppose",0,0,(A,B,K,L,Y,)),acquirerOfServientLand(Y,L)) :- inst(r("c374-oppose",0,0,(A,B,K,L,Y,))).
body(r("c374-oppose",0,0,(A,B,K,L,Y,)),inGoodFaith(Y,L)) :- inst(r("c374-oppose",0,0,(A,B,K,L,Y,))).
inst(x("c374-oppose",0,0,0,(A,B,K,L,Y,))) :- inst(r("c374-oppose",0,0,(A,B,K,L,Y,))), cand(easementRegistered(K)).
constitutiveRule(x("c374-oppose",0,0,0,(A,B,K,L,Y,)),easementOpposableTo(K,Y)) :- inst(x("c374-oppose",0,0,0,(A,B,K,L,Y,))).
body(x("c374-oppose",0,0,0,(A,B,K,L,Y,)),easementContract(K,A,B,L)) :- inst(x("c374-oppose",0,0,0,(A,B,K,L,Y,))).
body(x("c374-oppose",0,0,0,(A,B,K,L,Y,)),easementEstablished(K)) :- inst(x("c374-oppose",0,0,0,(A,B,K,L,Y,))).
body(x("c374-oppose",0,0,0,(A,B,K,L,Y,)),acquirerOfServientLand(Y,L)) :- inst(x("c374-oppose",0,0,0,(A,B,K,L,Y,))).
body(x("c374-oppose",0,0,0,(A,B,K,L,Y,)),inGoodFaith(Y,L)) :- inst(x("c374-oppose",0,0,0,(A,B,K,L,Y,))).
body(x("c374-oppose",0,0,0,(A,B,K,L,Y,)),easementRegistered(K)) :- inst(x("c374-oppose",0,0,0,(A,B,K,L,Y,))).
superior(x("c374-oppose",0,0,0,(A,B,K,L,Y,)),r("c374-oppose",0,0,(A,B,K,L,Y,))) :- inst(x("c374-oppose",0,0,0,(A,B,K,L,Y,))).
exc(x("c374-oppose",0,0,0,(A,B,K,L,Y,)),r("c374-oppose",0,0,(A,B,K,L,Y,)),constitutiveRule,non(easementOpposableTo(K,Y))) :- inst(x("c374-oppose",0,0,0,(A,B,K,L,Y,))).

% c374-oppose-def[0.0] 地役权对供役地受让人有约束力（第383条）（第374条；doctrine）
inst(r("c374-oppose-def",0,0,(A,B,K,L,Y,))) :- cand(easementContract(K,A,B,L)), cand(easementEstablished(K)), cand(acquirerOfServientLand(Y,L)).
constitutiveRule(r("c374-oppose-def",0,0,(A,B,K,L,Y,)),easementOpposableTo(K,Y)) :- inst(r("c374-oppose-def",0,0,(A,B,K,L,Y,))).
mainHead(r("c374-oppose-def",0,0,(A,B,K,L,Y,)),constitutiveRule,easementOpposableTo(K,Y)) :- inst(r("c374-oppose-def",0,0,(A,B,K,L,Y,))).
cand(easementOpposableTo(K,Y)) :- inst(r("c374-oppose-def",0,0,(A,B,K,L,Y,))).
body(r("c374-oppose-def",0,0,(A,B,K,L,Y,)),easementContract(K,A,B,L)) :- inst(r("c374-oppose-def",0,0,(A,B,K,L,Y,))).
body(r("c374-oppose-def",0,0,(A,B,K,L,Y,)),easementEstablished(K)) :- inst(r("c374-oppose-def",0,0,(A,B,K,L,Y,))).
body(r("c374-oppose-def",0,0,(A,B,K,L,Y,)),acquirerOfServientLand(Y,L)) :- inst(r("c374-oppose-def",0,0,(A,B,K,L,Y,))).

% c380-for[0.0] 地役权不得单独转让（第380条；npc）
inst(r("c380-for",0,0,(A,K,))) :- cand(easementEstablished(K)), cand(easementHolder(A,K)).
prescriptiveRule(r("c380-for",0,0,(A,K,)),non(transferEasementSeparately(A,K))) :- inst(r("c380-for",0,0,(A,K,))).
mainHead(r("c380-for",0,0,(A,K,)),prescriptiveRule,non(transferEasementSeparately(A,K))) :- inst(r("c380-for",0,0,(A,K,))).
cand(transferEasementSeparately(A,K)) :- inst(r("c380-for",0,0,(A,K,))).
body(r("c380-for",0,0,(A,K,)),easementEstablished(K)) :- inst(r("c380-for",0,0,(A,K,))).
body(r("c380-for",0,0,(A,K,)),easementHolder(A,K)) :- inst(r("c380-for",0,0,(A,K,))).

% c380-follow[0.0] 需役地上的用益物权转让的，地役权一并转让，但是合同另有约定的除外（第380条；npc）
inst(r("c380-follow",0,0,(K,Y,))) :- cand(easementEstablished(K)), cand(dominantLandRightTransferred(K,Y)).
constitutiveRule(r("c380-follow",0,0,(K,Y,)),easementTransfersTo(K,Y)) :- inst(r("c380-follow",0,0,(K,Y,))).
mainHead(r("c380-follow",0,0,(K,Y,)),constitutiveRule,easementTransfersTo(K,Y)) :- inst(r("c380-follow",0,0,(K,Y,))).
cand(easementTransfersTo(K,Y)) :- inst(r("c380-follow",0,0,(K,Y,))).
body(r("c380-follow",0,0,(K,Y,)),easementEstablished(K)) :- inst(r("c380-follow",0,0,(K,Y,))).
body(r("c380-follow",0,0,(K,Y,)),dominantLandRightTransferred(K,Y)) :- inst(r("c380-follow",0,0,(K,Y,))).
inst(x("c380-follow",0,0,0,(K,Y,))) :- inst(r("c380-follow",0,0,(K,Y,))), cand(contractProvidesOtherwise(K)).
constitutiveRule(x("c380-follow",0,0,0,(K,Y,)),non(easementTransfersTo(K,Y))) :- inst(x("c380-follow",0,0,0,(K,Y,))).
body(x("c380-follow",0,0,0,(K,Y,)),easementEstablished(K)) :- inst(x("c380-follow",0,0,0,(K,Y,))).
body(x("c380-follow",0,0,0,(K,Y,)),dominantLandRightTransferred(K,Y)) :- inst(x("c380-follow",0,0,0,(K,Y,))).
body(x("c380-follow",0,0,0,(K,Y,)),contractProvidesOtherwise(K)) :- inst(x("c380-follow",0,0,0,(K,Y,))).
superior(x("c380-follow",0,0,0,(K,Y,)),r("c380-follow",0,0,(K,Y,))) :- inst(x("c380-follow",0,0,0,(K,Y,))).
exc(x("c380-follow",0,0,0,(K,Y,)),r("c380-follow",0,0,(K,Y,)),constitutiveRule,easementTransfersTo(K,Y)) :- inst(x("c380-follow",0,0,0,(K,Y,))).

% c381-for[0.0] 地役权不得单独抵押（第381条；npc）
inst(r("c381-for",0,0,(A,K,))) :- cand(easementEstablished(K)), cand(easementHolder(A,K)).
prescriptiveRule(r("c381-for",0,0,(A,K,)),non(mortgageEasementSeparately(A,K))) :- inst(r("c381-for",0,0,(A,K,))).
mainHead(r("c381-for",0,0,(A,K,)),prescriptiveRule,non(mortgageEasementSeparately(A,K))) :- inst(r("c381-for",0,0,(A,K,))).
cand(mortgageEasementSeparately(A,K)) :- inst(r("c381-for",0,0,(A,K,))).
body(r("c381-for",0,0,(A,K,)),easementEstablished(K)) :- inst(r("c381-for",0,0,(A,K,))).
body(r("c381-for",0,0,(A,K,)),easementHolder(A,K)) :- inst(r("c381-for",0,0,(A,K,))).

% c381-follow[0.0] 需役地上的用益物权抵押的，实现抵押权时地役权一并转让（第381条；npc）
inst(r("c381-follow",0,0,(K,Y,))) :- cand(easementEstablished(K)), cand(dominantLandRightMortgageRealized(K,Y)).
constitutiveRule(r("c381-follow",0,0,(K,Y,)),easementTransfersTo(K,Y)) :- inst(r("c381-follow",0,0,(K,Y,))).
mainHead(r("c381-follow",0,0,(K,Y,)),constitutiveRule,easementTransfersTo(K,Y)) :- inst(r("c381-follow",0,0,(K,Y,))).
cand(easementTransfersTo(K,Y)) :- inst(r("c381-follow",0,0,(K,Y,))).
body(r("c381-follow",0,0,(K,Y,)),easementEstablished(K)) :- inst(r("c381-follow",0,0,(K,Y,))).
body(r("c381-follow",0,0,(K,Y,)),dominantLandRightMortgageRealized(K,Y)) :- inst(r("c381-follow",0,0,(K,Y,))).

% c407-for[0.0] 抵押权不得与债权分离而单独转让或者作为其他债权的担保（第407条；npc）
inst(r("c407-for",0,0,(B,K,M,T,))) :- cand(mortgageContract(K,M,B,T)), cand(mortgageEstablished(K)).
prescriptiveRule(r("c407-for",0,0,(B,K,M,T,)),non(transferMortgageSeparately(B,K))) :- inst(r("c407-for",0,0,(B,K,M,T,))).
mainHead(r("c407-for",0,0,(B,K,M,T,)),prescriptiveRule,non(transferMortgageSeparately(B,K))) :- inst(r("c407-for",0,0,(B,K,M,T,))).
cand(transferMortgageSeparately(B,K)) :- inst(r("c407-for",0,0,(B,K,M,T,))).
body(r("c407-for",0,0,(B,K,M,T,)),mortgageContract(K,M,B,T)) :- inst(r("c407-for",0,0,(B,K,M,T,))).
body(r("c407-for",0,0,(B,K,M,T,)),mortgageEstablished(K)) :- inst(r("c407-for",0,0,(B,K,M,T,))).

% c407-follow[0.0] 债权转让的，担保该债权的抵押权一并转让；法律另有规定或当事人另有约定的除外（第407条；npc）
inst(r("c407-follow",0,0,(B,K,M,T,Y,Z,))) :- cand(mortgageContract(K,M,B,T)), cand(mortgageEstablished(K)), cand(securedClaim(Z,K)), cand(claimAssigned(Z,B,Y)).
constitutiveRule(r("c407-follow",0,0,(B,K,M,T,Y,Z,)),mortgageTransfersTo(K,Y)) :- inst(r("c407-follow",0,0,(B,K,M,T,Y,Z,))).
mainHead(r("c407-follow",0,0,(B,K,M,T,Y,Z,)),constitutiveRule,mortgageTransfersTo(K,Y)) :- inst(r("c407-follow",0,0,(B,K,M,T,Y,Z,))).
cand(mortgageTransfersTo(K,Y)) :- inst(r("c407-follow",0,0,(B,K,M,T,Y,Z,))).
body(r("c407-follow",0,0,(B,K,M,T,Y,Z,)),mortgageContract(K,M,B,T)) :- inst(r("c407-follow",0,0,(B,K,M,T,Y,Z,))).
body(r("c407-follow",0,0,(B,K,M,T,Y,Z,)),mortgageEstablished(K)) :- inst(r("c407-follow",0,0,(B,K,M,T,Y,Z,))).
body(r("c407-follow",0,0,(B,K,M,T,Y,Z,)),securedClaim(Z,K)) :- inst(r("c407-follow",0,0,(B,K,M,T,Y,Z,))).
body(r("c407-follow",0,0,(B,K,M,T,Y,Z,)),claimAssigned(Z,B,Y)) :- inst(r("c407-follow",0,0,(B,K,M,T,Y,Z,))).
inst(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,))) :- inst(r("c407-follow",0,0,(B,K,M,T,Y,Z,))), cand(agreedMortgageNotFollow(K)).
constitutiveRule(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,)),non(mortgageTransfersTo(K,Y))) :- inst(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,))).
body(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,)),mortgageContract(K,M,B,T)) :- inst(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,))).
body(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,)),mortgageEstablished(K)) :- inst(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,))).
body(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,)),securedClaim(Z,K)) :- inst(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,))).
body(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,)),claimAssigned(Z,B,Y)) :- inst(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,))).
body(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,)),agreedMortgageNotFollow(K)) :- inst(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,))).
superior(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,)),r("c407-follow",0,0,(B,K,M,T,Y,Z,))) :- inst(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,))).
exc(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,)),r("c407-follow",0,0,(B,K,M,T,Y,Z,)),constitutiveRule,mortgageTransfersTo(K,Y)) :- inst(x("c407-follow",0,0,0,(B,K,M,T,Y,Z,))).

% tx-g3230[0.0] 分类（自动抽取自图的层级）：法定担保物权 ⊑ 担保物权
inst(r("tx-g3230",0,0,(X,))) :- cand(isA(X,"法定担保物权")).
constitutiveRule(r("tx-g3230",0,0,(X,)),isA(X,"担保物权")) :- inst(r("tx-g3230",0,0,(X,))).
mainHead(r("tx-g3230",0,0,(X,)),constitutiveRule,isA(X,"担保物权")) :- inst(r("tx-g3230",0,0,(X,))).
cand(isA(X,"担保物权")) :- inst(r("tx-g3230",0,0,(X,))).
body(r("tx-g3230",0,0,(X,)),isA(X,"法定担保物权")) :- inst(r("tx-g3230",0,0,(X,))).

% tx-g3231[0.0] 分类（自动抽取自图的层级）：约定担保物权 ⊑ 担保物权
inst(r("tx-g3231",0,0,(X,))) :- cand(isA(X,"约定担保物权")).
constitutiveRule(r("tx-g3231",0,0,(X,)),isA(X,"担保物权")) :- inst(r("tx-g3231",0,0,(X,))).
mainHead(r("tx-g3231",0,0,(X,)),constitutiveRule,isA(X,"担保物权")) :- inst(r("tx-g3231",0,0,(X,))).
cand(isA(X,"担保物权")) :- inst(r("tx-g3231",0,0,(X,))).
body(r("tx-g3231",0,0,(X,)),isA(X,"约定担保物权")) :- inst(r("tx-g3231",0,0,(X,))).

% tx-g3233[0.0] 分类（自动抽取自图的层级）：动产担保物权 ⊑ 担保物权
inst(r("tx-g3233",0,0,(X,))) :- cand(isA(X,"动产担保物权")).
constitutiveRule(r("tx-g3233",0,0,(X,)),isA(X,"担保物权")) :- inst(r("tx-g3233",0,0,(X,))).
mainHead(r("tx-g3233",0,0,(X,)),constitutiveRule,isA(X,"担保物权")) :- inst(r("tx-g3233",0,0,(X,))).
cand(isA(X,"担保物权")) :- inst(r("tx-g3233",0,0,(X,))).
body(r("tx-g3233",0,0,(X,)),isA(X,"动产担保物权")) :- inst(r("tx-g3233",0,0,(X,))).

% tx-g3234[0.0] 分类（自动抽取自图的层级）：不动产担保物权 ⊑ 担保物权
inst(r("tx-g3234",0,0,(X,))) :- cand(isA(X,"不动产担保物权")).
constitutiveRule(r("tx-g3234",0,0,(X,)),isA(X,"担保物权")) :- inst(r("tx-g3234",0,0,(X,))).
mainHead(r("tx-g3234",0,0,(X,)),constitutiveRule,isA(X,"担保物权")) :- inst(r("tx-g3234",0,0,(X,))).
cand(isA(X,"担保物权")) :- inst(r("tx-g3234",0,0,(X,))).
body(r("tx-g3234",0,0,(X,)),isA(X,"不动产担保物权")) :- inst(r("tx-g3234",0,0,(X,))).

% tx-g3235[0.0] 分类（自动抽取自图的层级）：权利担保物权 ⊑ 担保物权
inst(r("tx-g3235",0,0,(X,))) :- cand(isA(X,"权利担保物权")).
constitutiveRule(r("tx-g3235",0,0,(X,)),isA(X,"担保物权")) :- inst(r("tx-g3235",0,0,(X,))).
mainHead(r("tx-g3235",0,0,(X,)),constitutiveRule,isA(X,"担保物权")) :- inst(r("tx-g3235",0,0,(X,))).
cand(isA(X,"担保物权")) :- inst(r("tx-g3235",0,0,(X,))).
body(r("tx-g3235",0,0,(X,)),isA(X,"权利担保物权")) :- inst(r("tx-g3235",0,0,(X,))).

% c-oppose-default[0.0] 已设立的抵押权可以对抗取得抵押财产的第三人（追及效力）（第403条、第406条第1款；doctrine）
inst(r("c-oppose-default",0,0,(B,K,M,T,Y,))) :- cand(mortgageContract(K,M,B,T)), cand(mortgageEstablished(K)), cand(thirdPartyAcquirer(Y,T)).
constitutiveRule(r("c-oppose-default",0,0,(B,K,M,T,Y,)),mortgageOpposableTo(K,Y)) :- inst(r("c-oppose-default",0,0,(B,K,M,T,Y,))).
mainHead(r("c-oppose-default",0,0,(B,K,M,T,Y,)),constitutiveRule,mortgageOpposableTo(K,Y)) :- inst(r("c-oppose-default",0,0,(B,K,M,T,Y,))).
cand(mortgageOpposableTo(K,Y)) :- inst(r("c-oppose-default",0,0,(B,K,M,T,Y,))).
body(r("c-oppose-default",0,0,(B,K,M,T,Y,)),mortgageContract(K,M,B,T)) :- inst(r("c-oppose-default",0,0,(B,K,M,T,Y,))).
body(r("c-oppose-default",0,0,(B,K,M,T,Y,)),mortgageEstablished(K)) :- inst(r("c-oppose-default",0,0,(B,K,M,T,Y,))).
body(r("c-oppose-default",0,0,(B,K,M,T,Y,)),thirdPartyAcquirer(Y,T)) :- inst(r("c-oppose-default",0,0,(B,K,M,T,Y,))).

% c395[0.0] 债务人或第三人有权处分的、法律未禁止抵押的财产可以抵押（第395条第1款；npc）
inst(r("c395",0,0,(B,K,M,T,))) :- cand(mortgageContract(K,M,B,T)), cand(hasDisposalPower(M,T)).
constitutiveRule(r("c395",0,0,(B,K,M,T,)),mortgageObjectOk(K)) :- inst(r("c395",0,0,(B,K,M,T,))).
mainHead(r("c395",0,0,(B,K,M,T,)),constitutiveRule,mortgageObjectOk(K)) :- inst(r("c395",0,0,(B,K,M,T,))).
cand(mortgageObjectOk(K)) :- inst(r("c395",0,0,(B,K,M,T,))).
body(r("c395",0,0,(B,K,M,T,)),mortgageContract(K,M,B,T)) :- inst(r("c395",0,0,(B,K,M,T,))).
body(r("c395",0,0,(B,K,M,T,)),hasDisposalPower(M,T)) :- inst(r("c395",0,0,(B,K,M,T,))).
inst(x("c395",0,0,0,(B,K,M,T,))) :- inst(r("c395",0,0,(B,K,M,T,))), cand(nonMortgageable(T)).
constitutiveRule(x("c395",0,0,0,(B,K,M,T,)),non(mortgageObjectOk(K))) :- inst(x("c395",0,0,0,(B,K,M,T,))).
body(x("c395",0,0,0,(B,K,M,T,)),mortgageContract(K,M,B,T)) :- inst(x("c395",0,0,0,(B,K,M,T,))).
body(x("c395",0,0,0,(B,K,M,T,)),hasDisposalPower(M,T)) :- inst(x("c395",0,0,0,(B,K,M,T,))).
body(x("c395",0,0,0,(B,K,M,T,)),nonMortgageable(T)) :- inst(x("c395",0,0,0,(B,K,M,T,))).
superior(x("c395",0,0,0,(B,K,M,T,)),r("c395",0,0,(B,K,M,T,))) :- inst(x("c395",0,0,0,(B,K,M,T,))).
exc(x("c395",0,0,0,(B,K,M,T,)),r("c395",0,0,(B,K,M,T,)),constitutiveRule,mortgageObjectOk(K)) :- inst(x("c395",0,0,0,(B,K,M,T,))).

% c399[0.0] 土地所有权、集体土地使用权（法律另有规定除外）、公益设施、权属争议、被查封扣押监管的财产不得抵押（第399条；npc）
inst(r("c399",0,0,(T,))) :- cand(landOwnership(T)).
constitutiveRule(r("c399",0,0,(T,)),nonMortgageable(T)) :- inst(r("c399",0,0,(T,))).
mainHead(r("c399",0,0,(T,)),constitutiveRule,nonMortgageable(T)) :- inst(r("c399",0,0,(T,))).
cand(nonMortgageable(T)) :- inst(r("c399",0,0,(T,))).
body(r("c399",0,0,(T,)),landOwnership(T)) :- inst(r("c399",0,0,(T,))).
% c399[1.0] 土地所有权、集体土地使用权（法律另有规定除外）、公益设施、权属争议、被查封扣押监管的财产不得抵押（第399条；npc）
inst(r("c399",1,0,(T,))) :- cand(collectiveLandUseRight(T)).
constitutiveRule(r("c399",1,0,(T,)),nonMortgageable(T)) :- inst(r("c399",1,0,(T,))).
mainHead(r("c399",1,0,(T,)),constitutiveRule,nonMortgageable(T)) :- inst(r("c399",1,0,(T,))).
cand(nonMortgageable(T)) :- inst(r("c399",1,0,(T,))).
body(r("c399",1,0,(T,)),collectiveLandUseRight(T)) :- inst(r("c399",1,0,(T,))).
inst(x("c399",1,0,0,(T,))) :- inst(r("c399",1,0,(T,))), cand(lawPermitsMortgage(T)).
constitutiveRule(x("c399",1,0,0,(T,)),non(nonMortgageable(T))) :- inst(x("c399",1,0,0,(T,))).
body(x("c399",1,0,0,(T,)),collectiveLandUseRight(T)) :- inst(x("c399",1,0,0,(T,))).
body(x("c399",1,0,0,(T,)),lawPermitsMortgage(T)) :- inst(x("c399",1,0,0,(T,))).
superior(x("c399",1,0,0,(T,)),r("c399",1,0,(T,))) :- inst(x("c399",1,0,0,(T,))).
exc(x("c399",1,0,0,(T,)),r("c399",1,0,(T,)),constitutiveRule,nonMortgageable(T)) :- inst(x("c399",1,0,0,(T,))).
% c399[2.0] 土地所有权、集体土地使用权（法律另有规定除外）、公益设施、权属争议、被查封扣押监管的财产不得抵押（第399条；npc）
inst(r("c399",2,0,(T,))) :- cand(publicWelfareFacility(T)).
constitutiveRule(r("c399",2,0,(T,)),nonMortgageable(T)) :- inst(r("c399",2,0,(T,))).
mainHead(r("c399",2,0,(T,)),constitutiveRule,nonMortgageable(T)) :- inst(r("c399",2,0,(T,))).
cand(nonMortgageable(T)) :- inst(r("c399",2,0,(T,))).
body(r("c399",2,0,(T,)),publicWelfareFacility(T)) :- inst(r("c399",2,0,(T,))).
% c399[3.0] 土地所有权、集体土地使用权（法律另有规定除外）、公益设施、权属争议、被查封扣押监管的财产不得抵押（第399条；npc）
inst(r("c399",3,0,(T,))) :- cand(disputedOwnership(T)).
constitutiveRule(r("c399",3,0,(T,)),nonMortgageable(T)) :- inst(r("c399",3,0,(T,))).
mainHead(r("c399",3,0,(T,)),constitutiveRule,nonMortgageable(T)) :- inst(r("c399",3,0,(T,))).
cand(nonMortgageable(T)) :- inst(r("c399",3,0,(T,))).
body(r("c399",3,0,(T,)),disputedOwnership(T)) :- inst(r("c399",3,0,(T,))).
% c399[4.0] 土地所有权、集体土地使用权（法律另有规定除外）、公益设施、权属争议、被查封扣押监管的财产不得抵押（第399条；npc）
inst(r("c399",4,0,(T,))) :- cand(seizedOrSupervised(T)).
constitutiveRule(r("c399",4,0,(T,)),nonMortgageable(T)) :- inst(r("c399",4,0,(T,))).
mainHead(r("c399",4,0,(T,)),constitutiveRule,nonMortgageable(T)) :- inst(r("c399",4,0,(T,))).
cand(nonMortgageable(T)) :- inst(r("c399",4,0,(T,))).
body(r("c399",4,0,(T,)),seizedOrSupervised(T)) :- inst(r("c399",4,0,(T,))).
% c399[5.0] 土地所有权、集体土地使用权（法律另有规定除外）、公益设施、权属争议、被查封扣押监管的财产不得抵押（第399条；npc）
inst(r("c399",5,0,(T,))) :- cand(mortgageBannedByLaw(T)).
constitutiveRule(r("c399",5,0,(T,)),nonMortgageable(T)) :- inst(r("c399",5,0,(T,))).
mainHead(r("c399",5,0,(T,)),constitutiveRule,nonMortgageable(T)) :- inst(r("c399",5,0,(T,))).
cand(nonMortgageable(T)) :- inst(r("c399",5,0,(T,))).
body(r("c399",5,0,(T,)),mortgageBannedByLaw(T)) :- inst(r("c399",5,0,(T,))).

% c402-type[0.0] 以建筑物、建设用地使用权、海域使用权、正在建造的建筑物抵押的，应当办理抵押登记（第402条；npc）
inst(r("c402-type",0,0,(T,))) :- cand(building(T)).
constitutiveRule(r("c402-type",0,0,(T,)),registrationConstitutive(T)) :- inst(r("c402-type",0,0,(T,))).
mainHead(r("c402-type",0,0,(T,)),constitutiveRule,registrationConstitutive(T)) :- inst(r("c402-type",0,0,(T,))).
cand(registrationConstitutive(T)) :- inst(r("c402-type",0,0,(T,))).
body(r("c402-type",0,0,(T,)),building(T)) :- inst(r("c402-type",0,0,(T,))).
% c402-type[1.0] 以建筑物、建设用地使用权、海域使用权、正在建造的建筑物抵押的，应当办理抵押登记（第402条；npc）
inst(r("c402-type",1,0,(T,))) :- cand(constructionLandUseRight(T)).
constitutiveRule(r("c402-type",1,0,(T,)),registrationConstitutive(T)) :- inst(r("c402-type",1,0,(T,))).
mainHead(r("c402-type",1,0,(T,)),constitutiveRule,registrationConstitutive(T)) :- inst(r("c402-type",1,0,(T,))).
cand(registrationConstitutive(T)) :- inst(r("c402-type",1,0,(T,))).
body(r("c402-type",1,0,(T,)),constructionLandUseRight(T)) :- inst(r("c402-type",1,0,(T,))).
% c402-type[2.0] 以建筑物、建设用地使用权、海域使用权、正在建造的建筑物抵押的，应当办理抵押登记（第402条；npc）
inst(r("c402-type",2,0,(T,))) :- cand(seaAreaUseRight(T)).
constitutiveRule(r("c402-type",2,0,(T,)),registrationConstitutive(T)) :- inst(r("c402-type",2,0,(T,))).
mainHead(r("c402-type",2,0,(T,)),constitutiveRule,registrationConstitutive(T)) :- inst(r("c402-type",2,0,(T,))).
cand(registrationConstitutive(T)) :- inst(r("c402-type",2,0,(T,))).
body(r("c402-type",2,0,(T,)),seaAreaUseRight(T)) :- inst(r("c402-type",2,0,(T,))).
% c402-type[3.0] 以建筑物、建设用地使用权、海域使用权、正在建造的建筑物抵押的，应当办理抵押登记（第402条；npc）
inst(r("c402-type",3,0,(T,))) :- cand(buildingUnderConstruction(T)).
constitutiveRule(r("c402-type",3,0,(T,)),registrationConstitutive(T)) :- inst(r("c402-type",3,0,(T,))).
mainHead(r("c402-type",3,0,(T,)),constitutiveRule,registrationConstitutive(T)) :- inst(r("c402-type",3,0,(T,))).
cand(registrationConstitutive(T)) :- inst(r("c402-type",3,0,(T,))).
body(r("c402-type",3,0,(T,)),buildingUnderConstruction(T)) :- inst(r("c402-type",3,0,(T,))).

% c402[0.0] 不动产抵押：抵押权自登记时设立（第402条；npc）
inst(r("c402",0,0,(B,K,M,T,))) :- cand(mortgageContract(K,M,B,T)), cand(mortgageObjectOk(K)), cand(registrationConstitutive(T)), cand(valid(K)), cand(mortgageRegistered(K)).
constitutiveRule(r("c402",0,0,(B,K,M,T,)),mortgageEstablished(K)) :- inst(r("c402",0,0,(B,K,M,T,))).
mainHead(r("c402",0,0,(B,K,M,T,)),constitutiveRule,mortgageEstablished(K)) :- inst(r("c402",0,0,(B,K,M,T,))).
cand(mortgageEstablished(K)) :- inst(r("c402",0,0,(B,K,M,T,))).
body(r("c402",0,0,(B,K,M,T,)),mortgageContract(K,M,B,T)) :- inst(r("c402",0,0,(B,K,M,T,))).
body(r("c402",0,0,(B,K,M,T,)),mortgageObjectOk(K)) :- inst(r("c402",0,0,(B,K,M,T,))).
body(r("c402",0,0,(B,K,M,T,)),registrationConstitutive(T)) :- inst(r("c402",0,0,(B,K,M,T,))).
body(r("c402",0,0,(B,K,M,T,)),valid(K)) :- inst(r("c402",0,0,(B,K,M,T,))).
body(r("c402",0,0,(B,K,M,T,)),mortgageRegistered(K)) :- inst(r("c402",0,0,(B,K,M,T,))).

% c402-noreg[0.0] 应当登记而未登记的，抵押权不设立（抵押合同效力不受影响，第215条）（第402条；npc）
inst(r("c402-noreg",0,0,(B,K,M,T,))) :- cand(mortgageContract(K,M,B,T)), cand(registrationConstitutive(T)).
constitutiveRule(r("c402-noreg",0,0,(B,K,M,T,)),non(mortgageEstablished(K))) :- inst(r("c402-noreg",0,0,(B,K,M,T,))).
mainHead(r("c402-noreg",0,0,(B,K,M,T,)),constitutiveRule,non(mortgageEstablished(K))) :- inst(r("c402-noreg",0,0,(B,K,M,T,))).
cand(mortgageEstablished(K)) :- inst(r("c402-noreg",0,0,(B,K,M,T,))).
body(r("c402-noreg",0,0,(B,K,M,T,)),mortgageContract(K,M,B,T)) :- inst(r("c402-noreg",0,0,(B,K,M,T,))).
body(r("c402-noreg",0,0,(B,K,M,T,)),registrationConstitutive(T)) :- inst(r("c402-noreg",0,0,(B,K,M,T,))).
inst(x("c402-noreg",0,0,0,(B,K,M,T,))) :- inst(r("c402-noreg",0,0,(B,K,M,T,))), cand(mortgageRegistered(K)).
constitutiveRule(x("c402-noreg",0,0,0,(B,K,M,T,)),mortgageEstablished(K)) :- inst(x("c402-noreg",0,0,0,(B,K,M,T,))).
body(x("c402-noreg",0,0,0,(B,K,M,T,)),mortgageContract(K,M,B,T)) :- inst(x("c402-noreg",0,0,0,(B,K,M,T,))).
body(x("c402-noreg",0,0,0,(B,K,M,T,)),registrationConstitutive(T)) :- inst(x("c402-noreg",0,0,0,(B,K,M,T,))).
body(x("c402-noreg",0,0,0,(B,K,M,T,)),mortgageRegistered(K)) :- inst(x("c402-noreg",0,0,0,(B,K,M,T,))).
superior(x("c402-noreg",0,0,0,(B,K,M,T,)),r("c402-noreg",0,0,(B,K,M,T,))) :- inst(x("c402-noreg",0,0,0,(B,K,M,T,))).
exc(x("c402-noreg",0,0,0,(B,K,M,T,)),r("c402-noreg",0,0,(B,K,M,T,)),constitutiveRule,non(mortgageEstablished(K))) :- inst(x("c402-noreg",0,0,0,(B,K,M,T,))).

% c403[0.0] 动产抵押：抵押权自抵押合同生效时设立（第403条；npc）
inst(r("c403",0,0,(B,K,M,T,))) :- cand(mortgageContract(K,M,B,T)), cand(mortgageObjectOk(K)), cand(movable(T)), cand(valid(K)).
constitutiveRule(r("c403",0,0,(B,K,M,T,)),mortgageEstablished(K)) :- inst(r("c403",0,0,(B,K,M,T,))).
mainHead(r("c403",0,0,(B,K,M,T,)),constitutiveRule,mortgageEstablished(K)) :- inst(r("c403",0,0,(B,K,M,T,))).
cand(mortgageEstablished(K)) :- inst(r("c403",0,0,(B,K,M,T,))).
body(r("c403",0,0,(B,K,M,T,)),mortgageContract(K,M,B,T)) :- inst(r("c403",0,0,(B,K,M,T,))).
body(r("c403",0,0,(B,K,M,T,)),mortgageObjectOk(K)) :- inst(r("c403",0,0,(B,K,M,T,))).
body(r("c403",0,0,(B,K,M,T,)),movable(T)) :- inst(r("c403",0,0,(B,K,M,T,))).
body(r("c403",0,0,(B,K,M,T,)),valid(K)) :- inst(r("c403",0,0,(B,K,M,T,))).

% c403-oppose[0.0] 动产抵押未经登记，不得对抗善意第三人（第403条；npc）
inst(r("c403-oppose",0,0,(B,K,M,T,Y,))) :- cand(mortgageContract(K,M,B,T)), cand(movable(T)), cand(thirdPartyAcquirer(Y,T)), cand(inGoodFaith(Y,T)).
constitutiveRule(r("c403-oppose",0,0,(B,K,M,T,Y,)),non(mortgageOpposableTo(K,Y))) :- inst(r("c403-oppose",0,0,(B,K,M,T,Y,))).
mainHead(r("c403-oppose",0,0,(B,K,M,T,Y,)),constitutiveRule,non(mortgageOpposableTo(K,Y))) :- inst(r("c403-oppose",0,0,(B,K,M,T,Y,))).
cand(mortgageOpposableTo(K,Y)) :- inst(r("c403-oppose",0,0,(B,K,M,T,Y,))).
body(r("c403-oppose",0,0,(B,K,M,T,Y,)),mortgageContract(K,M,B,T)) :- inst(r("c403-oppose",0,0,(B,K,M,T,Y,))).
body(r("c403-oppose",0,0,(B,K,M,T,Y,)),movable(T)) :- inst(r("c403-oppose",0,0,(B,K,M,T,Y,))).
body(r("c403-oppose",0,0,(B,K,M,T,Y,)),thirdPartyAcquirer(Y,T)) :- inst(r("c403-oppose",0,0,(B,K,M,T,Y,))).
body(r("c403-oppose",0,0,(B,K,M,T,Y,)),inGoodFaith(Y,T)) :- inst(r("c403-oppose",0,0,(B,K,M,T,Y,))).
inst(x("c403-oppose",0,0,0,(B,K,M,T,Y,))) :- inst(r("c403-oppose",0,0,(B,K,M,T,Y,))), cand(mortgageRegistered(K)).
constitutiveRule(x("c403-oppose",0,0,0,(B,K,M,T,Y,)),mortgageOpposableTo(K,Y)) :- inst(x("c403-oppose",0,0,0,(B,K,M,T,Y,))).
body(x("c403-oppose",0,0,0,(B,K,M,T,Y,)),mortgageContract(K,M,B,T)) :- inst(x("c403-oppose",0,0,0,(B,K,M,T,Y,))).
body(x("c403-oppose",0,0,0,(B,K,M,T,Y,)),movable(T)) :- inst(x("c403-oppose",0,0,0,(B,K,M,T,Y,))).
body(x("c403-oppose",0,0,0,(B,K,M,T,Y,)),thirdPartyAcquirer(Y,T)) :- inst(x("c403-oppose",0,0,0,(B,K,M,T,Y,))).
body(x("c403-oppose",0,0,0,(B,K,M,T,Y,)),inGoodFaith(Y,T)) :- inst(x("c403-oppose",0,0,0,(B,K,M,T,Y,))).
body(x("c403-oppose",0,0,0,(B,K,M,T,Y,)),mortgageRegistered(K)) :- inst(x("c403-oppose",0,0,0,(B,K,M,T,Y,))).
superior(x("c403-oppose",0,0,0,(B,K,M,T,Y,)),r("c403-oppose",0,0,(B,K,M,T,Y,))) :- inst(x("c403-oppose",0,0,0,(B,K,M,T,Y,))).
exc(x("c403-oppose",0,0,0,(B,K,M,T,Y,)),r("c403-oppose",0,0,(B,K,M,T,Y,)),constitutiveRule,non(mortgageOpposableTo(K,Y))) :- inst(x("c403-oppose",0,0,0,(B,K,M,T,Y,))).

% c404[0.0] 动产抵押（不论是否登记）不得对抗正常经营活动中已支付合理价款并取得抵押财产的买受人（第404条；npc）
inst(r("c404",0,0,(B,K,M,T,Y,))) :- cand(mortgageContract(K,M,B,T)), cand(movable(T)), cand(thirdPartyAcquirer(Y,T)), cand(ordinaryCourseBuyer(Y,T)), cand(paidReasonablePrice(Y,T)), cand(acquiredProperty(Y,T)).
constitutiveRule(r("c404",0,0,(B,K,M,T,Y,)),non(mortgageOpposableTo(K,Y))) :- inst(r("c404",0,0,(B,K,M,T,Y,))).
mainHead(r("c404",0,0,(B,K,M,T,Y,)),constitutiveRule,non(mortgageOpposableTo(K,Y))) :- inst(r("c404",0,0,(B,K,M,T,Y,))).
cand(mortgageOpposableTo(K,Y)) :- inst(r("c404",0,0,(B,K,M,T,Y,))).
body(r("c404",0,0,(B,K,M,T,Y,)),mortgageContract(K,M,B,T)) :- inst(r("c404",0,0,(B,K,M,T,Y,))).
body(r("c404",0,0,(B,K,M,T,Y,)),movable(T)) :- inst(r("c404",0,0,(B,K,M,T,Y,))).
body(r("c404",0,0,(B,K,M,T,Y,)),thirdPartyAcquirer(Y,T)) :- inst(r("c404",0,0,(B,K,M,T,Y,))).
body(r("c404",0,0,(B,K,M,T,Y,)),ordinaryCourseBuyer(Y,T)) :- inst(r("c404",0,0,(B,K,M,T,Y,))).
body(r("c404",0,0,(B,K,M,T,Y,)),paidReasonablePrice(Y,T)) :- inst(r("c404",0,0,(B,K,M,T,Y,))).
body(r("c404",0,0,(B,K,M,T,Y,)),acquiredProperty(Y,T)) :- inst(r("c404",0,0,(B,K,M,T,Y,))).

% c401[0.0] 流押条款：只能依法就抵押财产优先受偿（第401条；npc）
inst(r("c401",0,0,(B,K,M,T,))) :- cand(mortgageContract(K,M,B,T)), cand(forfeitureClauseBeforeMaturity(K)).
constitutiveRule(r("c401",0,0,(B,K,M,T,)),non(forfeitureEffective(K))) :- inst(r("c401",0,0,(B,K,M,T,))).
mainHead(r("c401",0,0,(B,K,M,T,)),constitutiveRule,non(forfeitureEffective(K))) :- inst(r("c401",0,0,(B,K,M,T,))).
cand(forfeitureEffective(K)) :- inst(r("c401",0,0,(B,K,M,T,))).
body(r("c401",0,0,(B,K,M,T,)),mortgageContract(K,M,B,T)) :- inst(r("c401",0,0,(B,K,M,T,))).
body(r("c401",0,0,(B,K,M,T,)),forfeitureClauseBeforeMaturity(K)) :- inst(r("c401",0,0,(B,K,M,T,))).
% c401[0.1] 流押条款：只能依法就抵押财产优先受偿（第401条；npc）
inst(r("c401",0,1,(B,K,M,T,))) :- cand(mortgageContract(K,M,B,T)), cand(forfeitureClauseBeforeMaturity(K)).
constitutiveRule(r("c401",0,1,(B,K,M,T,)),priorityPaymentOnly(K)) :- inst(r("c401",0,1,(B,K,M,T,))).
mainHead(r("c401",0,1,(B,K,M,T,)),constitutiveRule,priorityPaymentOnly(K)) :- inst(r("c401",0,1,(B,K,M,T,))).
cand(priorityPaymentOnly(K)) :- inst(r("c401",0,1,(B,K,M,T,))).
body(r("c401",0,1,(B,K,M,T,)),mortgageContract(K,M,B,T)) :- inst(r("c401",0,1,(B,K,M,T,))).
body(r("c401",0,1,(B,K,M,T,)),forfeitureClauseBeforeMaturity(K)) :- inst(r("c401",0,1,(B,K,M,T,))).

% tx-g3320[0.0] 分类（自动抽取自图的层级）：抵押人的权利和义务 ⊑ 当事人的权利和义务
inst(r("tx-g3320",0,0,(X,))) :- cand(isA(X,"抵押人的权利和义务")).
constitutiveRule(r("tx-g3320",0,0,(X,)),isA(X,"当事人的权利和义务")) :- inst(r("tx-g3320",0,0,(X,))).
mainHead(r("tx-g3320",0,0,(X,)),constitutiveRule,isA(X,"当事人的权利和义务")) :- inst(r("tx-g3320",0,0,(X,))).
cand(isA(X,"当事人的权利和义务")) :- inst(r("tx-g3320",0,0,(X,))).
body(r("tx-g3320",0,0,(X,)),isA(X,"抵押人的权利和义务")) :- inst(r("tx-g3320",0,0,(X,))).

% tx-g3326[0.0] 分类（自动抽取自图的层级）：抵押权人的权利和义务 ⊑ 当事人的权利和义务
inst(r("tx-g3326",0,0,(X,))) :- cand(isA(X,"抵押权人的权利和义务")).
constitutiveRule(r("tx-g3326",0,0,(X,)),isA(X,"当事人的权利和义务")) :- inst(r("tx-g3326",0,0,(X,))).
mainHead(r("tx-g3326",0,0,(X,)),constitutiveRule,isA(X,"当事人的权利和义务")) :- inst(r("tx-g3326",0,0,(X,))).
cand(isA(X,"当事人的权利和义务")) :- inst(r("tx-g3326",0,0,(X,))).
body(r("tx-g3326",0,0,(X,)),isA(X,"抵押权人的权利和义务")) :- inst(r("tx-g3326",0,0,(X,))).

% c405[0.0] 抵押权设立前已出租并转移占有的，原租赁关系不受抵押权影响（第405条；npc）
inst(r("c405",0,0,(B,K,L,M,T,))) :- cand(mortgageContract(K,M,B,T)), cand(leaseOf(L,T)), cand(leasedAndPossessedBeforeMortgage(L,K)).
constitutiveRule(r("c405",0,0,(B,K,L,M,T,)),leaseUnaffectedByMortgage(L,K)) :- inst(r("c405",0,0,(B,K,L,M,T,))).
mainHead(r("c405",0,0,(B,K,L,M,T,)),constitutiveRule,leaseUnaffectedByMortgage(L,K)) :- inst(r("c405",0,0,(B,K,L,M,T,))).
cand(leaseUnaffectedByMortgage(L,K)) :- inst(r("c405",0,0,(B,K,L,M,T,))).
body(r("c405",0,0,(B,K,L,M,T,)),mortgageContract(K,M,B,T)) :- inst(r("c405",0,0,(B,K,L,M,T,))).
body(r("c405",0,0,(B,K,L,M,T,)),leaseOf(L,T)) :- inst(r("c405",0,0,(B,K,L,M,T,))).
body(r("c405",0,0,(B,K,L,M,T,)),leasedAndPossessedBeforeMortgage(L,K)) :- inst(r("c405",0,0,(B,K,L,M,T,))).

% c406-perm[0.0] 抵押期间，抵押人可以转让抵押财产；当事人另有约定的，按照其约定（第406条第1款；npc）
inst(r("c406-perm",0,0,(B,K,M,T,))) :- cand(mortgageContract(K,M,B,T)), cand(mortgageEstablished(K)).
permissiveRule(r("c406-perm",0,0,(B,K,M,T,)),transferMortgagedProperty(M,T)) :- inst(r("c406-perm",0,0,(B,K,M,T,))).
mainHead(r("c406-perm",0,0,(B,K,M,T,)),permissiveRule,transferMortgagedProperty(M,T)) :- inst(r("c406-perm",0,0,(B,K,M,T,))).
cand(transferMortgagedProperty(M,T)) :- inst(r("c406-perm",0,0,(B,K,M,T,))).
body(r("c406-perm",0,0,(B,K,M,T,)),mortgageContract(K,M,B,T)) :- inst(r("c406-perm",0,0,(B,K,M,T,))).
body(r("c406-perm",0,0,(B,K,M,T,)),mortgageEstablished(K)) :- inst(r("c406-perm",0,0,(B,K,M,T,))).
inst(x("c406-perm",0,0,0,(B,K,M,T,))) :- inst(r("c406-perm",0,0,(B,K,M,T,))), cand(agreedNoTransfer(K)).
prescriptiveRule(x("c406-perm",0,0,0,(B,K,M,T,)),non(transferMortgagedProperty(M,T))) :- inst(x("c406-perm",0,0,0,(B,K,M,T,))).
body(x("c406-perm",0,0,0,(B,K,M,T,)),mortgageContract(K,M,B,T)) :- inst(x("c406-perm",0,0,0,(B,K,M,T,))).
body(x("c406-perm",0,0,0,(B,K,M,T,)),mortgageEstablished(K)) :- inst(x("c406-perm",0,0,0,(B,K,M,T,))).
body(x("c406-perm",0,0,0,(B,K,M,T,)),agreedNoTransfer(K)) :- inst(x("c406-perm",0,0,0,(B,K,M,T,))).
superior(x("c406-perm",0,0,0,(B,K,M,T,)),r("c406-perm",0,0,(B,K,M,T,))) :- inst(x("c406-perm",0,0,0,(B,K,M,T,))).
exc(x("c406-perm",0,0,0,(B,K,M,T,)),r("c406-perm",0,0,(B,K,M,T,)),permissiveRule,transferMortgagedProperty(M,T)) :- inst(x("c406-perm",0,0,0,(B,K,M,T,))).

% c406-early[0.0] 能够证明转让可能损害抵押权的，可以请求以转让价款提前清偿或者提存（第406条第2款；npc）
inst(r("c406-early",0,0,(B,K,M,T,Y,))) :- cand(mortgageContract(K,M,B,T)), cand(transfersProperty(M,T,Y)), cand(transferMayHarmMortgage(K)).
constitutiveRule(r("c406-early",0,0,(B,K,M,T,Y,)),demandEarlyPaymentOrEscrow(B,M,K)) :- inst(r("c406-early",0,0,(B,K,M,T,Y,))).
mainHead(r("c406-early",0,0,(B,K,M,T,Y,)),constitutiveRule,demandEarlyPaymentOrEscrow(B,M,K)) :- inst(r("c406-early",0,0,(B,K,M,T,Y,))).
cand(demandEarlyPaymentOrEscrow(B,M,K)) :- inst(r("c406-early",0,0,(B,K,M,T,Y,))).
body(r("c406-early",0,0,(B,K,M,T,Y,)),mortgageContract(K,M,B,T)) :- inst(r("c406-early",0,0,(B,K,M,T,Y,))).
body(r("c406-early",0,0,(B,K,M,T,Y,)),transfersProperty(M,T,Y)) :- inst(r("c406-early",0,0,(B,K,M,T,Y,))).
body(r("c406-early",0,0,(B,K,M,T,Y,)),transferMayHarmMortgage(K)) :- inst(r("c406-early",0,0,(B,K,M,T,Y,))).

% c406-notify[0.0] 抵押人转让抵押财产的，应当及时通知抵押权人（第406条第2款；npc）
inst(r("c406-notify",0,0,(B,K,M,T,Y,))) :- cand(mortgageContract(K,M,B,T)), cand(mortgageEstablished(K)), cand(transfersProperty(M,T,Y)).
prescriptiveRule(r("c406-notify",0,0,(B,K,M,T,Y,)),notifyMortgagee(M,B,T)) :- inst(r("c406-notify",0,0,(B,K,M,T,Y,))).
mainHead(r("c406-notify",0,0,(B,K,M,T,Y,)),prescriptiveRule,notifyMortgagee(M,B,T)) :- inst(r("c406-notify",0,0,(B,K,M,T,Y,))).
cand(notifyMortgagee(M,B,T)) :- inst(r("c406-notify",0,0,(B,K,M,T,Y,))).
body(r("c406-notify",0,0,(B,K,M,T,Y,)),mortgageContract(K,M,B,T)) :- inst(r("c406-notify",0,0,(B,K,M,T,Y,))).
body(r("c406-notify",0,0,(B,K,M,T,Y,)),mortgageEstablished(K)) :- inst(r("c406-notify",0,0,(B,K,M,T,Y,))).
body(r("c406-notify",0,0,(B,K,M,T,Y,)),transfersProperty(M,T,Y)) :- inst(r("c406-notify",0,0,(B,K,M,T,Y,))).

% c420-in[0.0] 一定期间内连续发生的债权，在最高债权额限度内受担保（第420条第1款；npc）
inst(r("c420-in",0,0,(K,Z,))) :- cand(maxAmountMortgage(K)), cand(claimArisesInPeriod(Z,K)).
constitutiveRule(r("c420-in",0,0,(K,Z,)),securedClaim(Z,K)) :- inst(r("c420-in",0,0,(K,Z,))).
mainHead(r("c420-in",0,0,(K,Z,)),constitutiveRule,securedClaim(Z,K)) :- inst(r("c420-in",0,0,(K,Z,))).
cand(securedClaim(Z,K)) :- inst(r("c420-in",0,0,(K,Z,))).
body(r("c420-in",0,0,(K,Z,)),maxAmountMortgage(K)) :- inst(r("c420-in",0,0,(K,Z,))).
body(r("c420-in",0,0,(K,Z,)),claimArisesInPeriod(Z,K)) :- inst(r("c420-in",0,0,(K,Z,))).
inst(x("c420-in",0,0,0,(K,Z,))) :- inst(r("c420-in",0,0,(K,Z,))), cand(arisesAfterDetermination(Z,K)).
constitutiveRule(x("c420-in",0,0,0,(K,Z,)),non(securedClaim(Z,K))) :- inst(x("c420-in",0,0,0,(K,Z,))).
body(x("c420-in",0,0,0,(K,Z,)),maxAmountMortgage(K)) :- inst(x("c420-in",0,0,0,(K,Z,))).
body(x("c420-in",0,0,0,(K,Z,)),claimArisesInPeriod(Z,K)) :- inst(x("c420-in",0,0,0,(K,Z,))).
body(x("c420-in",0,0,0,(K,Z,)),arisesAfterDetermination(Z,K)) :- inst(x("c420-in",0,0,0,(K,Z,))).
superior(x("c420-in",0,0,0,(K,Z,)),r("c420-in",0,0,(K,Z,))) :- inst(x("c420-in",0,0,0,(K,Z,))).
exc(x("c420-in",0,0,0,(K,Z,)),r("c420-in",0,0,(K,Z,)),constitutiveRule,securedClaim(Z,K)) :- inst(x("c420-in",0,0,0,(K,Z,))).

% c420-pre[0.0] 设立前已存在的债权，经当事人同意可以转入最高额抵押担保范围（第420条第2款；npc）
inst(r("c420-pre",0,0,(K,Z,))) :- cand(maxAmountMortgage(K)), cand(preExistingClaim(Z,K)), cand(partiesAgreeToInclude(Z,K)).
constitutiveRule(r("c420-pre",0,0,(K,Z,)),securedClaim(Z,K)) :- inst(r("c420-pre",0,0,(K,Z,))).
mainHead(r("c420-pre",0,0,(K,Z,)),constitutiveRule,securedClaim(Z,K)) :- inst(r("c420-pre",0,0,(K,Z,))).
cand(securedClaim(Z,K)) :- inst(r("c420-pre",0,0,(K,Z,))).
body(r("c420-pre",0,0,(K,Z,)),maxAmountMortgage(K)) :- inst(r("c420-pre",0,0,(K,Z,))).
body(r("c420-pre",0,0,(K,Z,)),preExistingClaim(Z,K)) :- inst(r("c420-pre",0,0,(K,Z,))).
body(r("c420-pre",0,0,(K,Z,)),partiesAgreeToInclude(Z,K)) :- inst(r("c420-pre",0,0,(K,Z,))).

% c423[0.0] 约定期间届满、无约定满二年请求确定、不可能发生新债权、知道查封扣押、破产解散等，债权确定（第423条；npc）
inst(r("c423",0,0,(K,))) :- cand(maxAmountMortgage(K)), cand(agreedDeterminationPeriodExpired(K)).
constitutiveRule(r("c423",0,0,(K,)),securedClaimsDetermined(K)) :- inst(r("c423",0,0,(K,))).
mainHead(r("c423",0,0,(K,)),constitutiveRule,securedClaimsDetermined(K)) :- inst(r("c423",0,0,(K,))).
cand(securedClaimsDetermined(K)) :- inst(r("c423",0,0,(K,))).
body(r("c423",0,0,(K,)),maxAmountMortgage(K)) :- inst(r("c423",0,0,(K,))).
body(r("c423",0,0,(K,)),agreedDeterminationPeriodExpired(K)) :- inst(r("c423",0,0,(K,))).
% c423[1.0] 约定期间届满、无约定满二年请求确定、不可能发生新债权、知道查封扣押、破产解散等，债权确定（第423条；npc）
inst(r("c423",1,0,(K,))) :- cand(maxAmountMortgage(K)), cand(noAgreedPeriod(K)), cand(twoYearsSinceEstablished(K)), cand(determinationRequested(K)).
constitutiveRule(r("c423",1,0,(K,)),securedClaimsDetermined(K)) :- inst(r("c423",1,0,(K,))).
mainHead(r("c423",1,0,(K,)),constitutiveRule,securedClaimsDetermined(K)) :- inst(r("c423",1,0,(K,))).
cand(securedClaimsDetermined(K)) :- inst(r("c423",1,0,(K,))).
body(r("c423",1,0,(K,)),maxAmountMortgage(K)) :- inst(r("c423",1,0,(K,))).
body(r("c423",1,0,(K,)),noAgreedPeriod(K)) :- inst(r("c423",1,0,(K,))).
body(r("c423",1,0,(K,)),twoYearsSinceEstablished(K)) :- inst(r("c423",1,0,(K,))).
body(r("c423",1,0,(K,)),determinationRequested(K)) :- inst(r("c423",1,0,(K,))).
% c423[2.0] 约定期间届满、无约定满二年请求确定、不可能发生新债权、知道查封扣押、破产解散等，债权确定（第423条；npc）
inst(r("c423",2,0,(K,))) :- cand(maxAmountMortgage(K)), cand(noNewClaimPossible(K)).
constitutiveRule(r("c423",2,0,(K,)),securedClaimsDetermined(K)) :- inst(r("c423",2,0,(K,))).
mainHead(r("c423",2,0,(K,)),constitutiveRule,securedClaimsDetermined(K)) :- inst(r("c423",2,0,(K,))).
cand(securedClaimsDetermined(K)) :- inst(r("c423",2,0,(K,))).
body(r("c423",2,0,(K,)),maxAmountMortgage(K)) :- inst(r("c423",2,0,(K,))).
body(r("c423",2,0,(K,)),noNewClaimPossible(K)) :- inst(r("c423",2,0,(K,))).
% c423[3.0] 约定期间届满、无约定满二年请求确定、不可能发生新债权、知道查封扣押、破产解散等，债权确定（第423条；npc）
inst(r("c423",3,0,(K,))) :- cand(maxAmountMortgage(K)), cand(mortgageeKnowsSeizure(K)).
constitutiveRule(r("c423",3,0,(K,)),securedClaimsDetermined(K)) :- inst(r("c423",3,0,(K,))).
mainHead(r("c423",3,0,(K,)),constitutiveRule,securedClaimsDetermined(K)) :- inst(r("c423",3,0,(K,))).
cand(securedClaimsDetermined(K)) :- inst(r("c423",3,0,(K,))).
body(r("c423",3,0,(K,)),maxAmountMortgage(K)) :- inst(r("c423",3,0,(K,))).
body(r("c423",3,0,(K,)),mortgageeKnowsSeizure(K)) :- inst(r("c423",3,0,(K,))).
% c423[4.0] 约定期间届满、无约定满二年请求确定、不可能发生新债权、知道查封扣押、破产解散等，债权确定（第423条；npc）
inst(r("c423",4,0,(K,))) :- cand(maxAmountMortgage(K)), cand(debtorOrMortgagorBankruptOrDissolved(K)).
constitutiveRule(r("c423",4,0,(K,)),securedClaimsDetermined(K)) :- inst(r("c423",4,0,(K,))).
mainHead(r("c423",4,0,(K,)),constitutiveRule,securedClaimsDetermined(K)) :- inst(r("c423",4,0,(K,))).
cand(securedClaimsDetermined(K)) :- inst(r("c423",4,0,(K,))).
body(r("c423",4,0,(K,)),maxAmountMortgage(K)) :- inst(r("c423",4,0,(K,))).
body(r("c423",4,0,(K,)),debtorOrMortgagorBankruptOrDissolved(K)) :- inst(r("c423",4,0,(K,))).

% c423-after[0.0] 债权确定后发生的债权不再受最高额抵押担保（第423条；doctrine）
inst(r("c423-after",0,0,(K,Z,))) :- cand(securedClaimsDetermined(K)), cand(arisesAfterDetermination(Z,K)).
constitutiveRule(r("c423-after",0,0,(K,Z,)),non(securedClaim(Z,K))) :- inst(r("c423-after",0,0,(K,Z,))).
mainHead(r("c423-after",0,0,(K,Z,)),constitutiveRule,non(securedClaim(Z,K))) :- inst(r("c423-after",0,0,(K,Z,))).
cand(securedClaim(Z,K)) :- inst(r("c423-after",0,0,(K,Z,))).
body(r("c423-after",0,0,(K,Z,)),securedClaimsDetermined(K)) :- inst(r("c423-after",0,0,(K,Z,))).
body(r("c423-after",0,0,(K,Z,)),arisesAfterDetermination(Z,K)) :- inst(r("c423-after",0,0,(K,Z,))).

% c421[0.0] 最高额抵押担保的债权确定前，部分债权转让的，最高额抵押权不得转让；当事人另有约定的除外（第421条；npc）
inst(r("c421",0,0,(B,K,Y,Z,))) :- cand(maxAmountMortgage(K)), cand(securedClaim(Z,K)), cand(claimAssigned(Z,B,Y)).
constitutiveRule(r("c421",0,0,(B,K,Y,Z,)),non(mortgageTransfersTo(K,Y))) :- inst(r("c421",0,0,(B,K,Y,Z,))).
mainHead(r("c421",0,0,(B,K,Y,Z,)),constitutiveRule,non(mortgageTransfersTo(K,Y))) :- inst(r("c421",0,0,(B,K,Y,Z,))).
cand(mortgageTransfersTo(K,Y)) :- inst(r("c421",0,0,(B,K,Y,Z,))).
body(r("c421",0,0,(B,K,Y,Z,)),maxAmountMortgage(K)) :- inst(r("c421",0,0,(B,K,Y,Z,))).
body(r("c421",0,0,(B,K,Y,Z,)),securedClaim(Z,K)) :- inst(r("c421",0,0,(B,K,Y,Z,))).
body(r("c421",0,0,(B,K,Y,Z,)),claimAssigned(Z,B,Y)) :- inst(r("c421",0,0,(B,K,Y,Z,))).
inst(x("c421",0,0,0,(B,K,Y,Z,))) :- inst(r("c421",0,0,(B,K,Y,Z,))), cand(securedClaimsDetermined(K)).
constitutiveRule(x("c421",0,0,0,(B,K,Y,Z,)),mortgageTransfersTo(K,Y)) :- inst(x("c421",0,0,0,(B,K,Y,Z,))).
body(x("c421",0,0,0,(B,K,Y,Z,)),maxAmountMortgage(K)) :- inst(x("c421",0,0,0,(B,K,Y,Z,))).
body(x("c421",0,0,0,(B,K,Y,Z,)),securedClaim(Z,K)) :- inst(x("c421",0,0,0,(B,K,Y,Z,))).
body(x("c421",0,0,0,(B,K,Y,Z,)),claimAssigned(Z,B,Y)) :- inst(x("c421",0,0,0,(B,K,Y,Z,))).
body(x("c421",0,0,0,(B,K,Y,Z,)),securedClaimsDetermined(K)) :- inst(x("c421",0,0,0,(B,K,Y,Z,))).
superior(x("c421",0,0,0,(B,K,Y,Z,)),r("c421",0,0,(B,K,Y,Z,))) :- inst(x("c421",0,0,0,(B,K,Y,Z,))).
exc(x("c421",0,0,0,(B,K,Y,Z,)),r("c421",0,0,(B,K,Y,Z,)),constitutiveRule,non(mortgageTransfersTo(K,Y))) :- inst(x("c421",0,0,0,(B,K,Y,Z,))).
inst(x("c421",0,0,1,(B,K,Y,Z,))) :- inst(r("c421",0,0,(B,K,Y,Z,))), cand(agreedMortgageFollows(K)).
constitutiveRule(x("c421",0,0,1,(B,K,Y,Z,)),mortgageTransfersTo(K,Y)) :- inst(x("c421",0,0,1,(B,K,Y,Z,))).
body(x("c421",0,0,1,(B,K,Y,Z,)),maxAmountMortgage(K)) :- inst(x("c421",0,0,1,(B,K,Y,Z,))).
body(x("c421",0,0,1,(B,K,Y,Z,)),securedClaim(Z,K)) :- inst(x("c421",0,0,1,(B,K,Y,Z,))).
body(x("c421",0,0,1,(B,K,Y,Z,)),claimAssigned(Z,B,Y)) :- inst(x("c421",0,0,1,(B,K,Y,Z,))).
body(x("c421",0,0,1,(B,K,Y,Z,)),agreedMortgageFollows(K)) :- inst(x("c421",0,0,1,(B,K,Y,Z,))).
superior(x("c421",0,0,1,(B,K,Y,Z,)),r("c421",0,0,(B,K,Y,Z,))) :- inst(x("c421",0,0,1,(B,K,Y,Z,))).
exc(x("c421",0,0,1,(B,K,Y,Z,)),r("c421",0,0,(B,K,Y,Z,)),constitutiveRule,non(mortgageTransfersTo(K,Y))) :- inst(x("c421",0,0,1,(B,K,Y,Z,))).

% c428[0.0] 履行期届满前约定不履行时质押财产归债权人所有的，只能依法就质押财产优先受偿（第428条；npc）
inst(r("c428",0,0,(B,K,M,T,))) :- cand(pledgeContract(K,M,B,T)), cand(forfeitureClauseBeforeMaturity(K)).
constitutiveRule(r("c428",0,0,(B,K,M,T,)),non(forfeitureEffective(K))) :- inst(r("c428",0,0,(B,K,M,T,))).
mainHead(r("c428",0,0,(B,K,M,T,)),constitutiveRule,non(forfeitureEffective(K))) :- inst(r("c428",0,0,(B,K,M,T,))).
cand(forfeitureEffective(K)) :- inst(r("c428",0,0,(B,K,M,T,))).
body(r("c428",0,0,(B,K,M,T,)),pledgeContract(K,M,B,T)) :- inst(r("c428",0,0,(B,K,M,T,))).
body(r("c428",0,0,(B,K,M,T,)),forfeitureClauseBeforeMaturity(K)) :- inst(r("c428",0,0,(B,K,M,T,))).
% c428[0.1] 履行期届满前约定不履行时质押财产归债权人所有的，只能依法就质押财产优先受偿（第428条；npc）
inst(r("c428",0,1,(B,K,M,T,))) :- cand(pledgeContract(K,M,B,T)), cand(forfeitureClauseBeforeMaturity(K)).
constitutiveRule(r("c428",0,1,(B,K,M,T,)),priorityPaymentOnly(K)) :- inst(r("c428",0,1,(B,K,M,T,))).
mainHead(r("c428",0,1,(B,K,M,T,)),constitutiveRule,priorityPaymentOnly(K)) :- inst(r("c428",0,1,(B,K,M,T,))).
cand(priorityPaymentOnly(K)) :- inst(r("c428",0,1,(B,K,M,T,))).
body(r("c428",0,1,(B,K,M,T,)),pledgeContract(K,M,B,T)) :- inst(r("c428",0,1,(B,K,M,T,))).
body(r("c428",0,1,(B,K,M,T,)),forfeitureClauseBeforeMaturity(K)) :- inst(r("c428",0,1,(B,K,M,T,))).

% c456[0.0] 同一动产上已设立抵押权或者质权，该动产又被留置的，留置权人优先受偿（第456条；npc）
inst(r("c456",0,0,(C,K,T,Z,))) :- cand(lienRight(C,T,Z)), cand(sameCollateralSecurity(K,T)).
constitutiveRule(r("c456",0,0,(C,K,T,Z,)),lienRanksFirst(T,K)) :- inst(r("c456",0,0,(C,K,T,Z,))).
mainHead(r("c456",0,0,(C,K,T,Z,)),constitutiveRule,lienRanksFirst(T,K)) :- inst(r("c456",0,0,(C,K,T,Z,))).
cand(lienRanksFirst(T,K)) :- inst(r("c456",0,0,(C,K,T,Z,))).
body(r("c456",0,0,(C,K,T,Z,)),lienRight(C,T,Z)) :- inst(r("c456",0,0,(C,K,T,Z,))).
body(r("c456",0,0,(C,K,T,Z,)),sameCollateralSecurity(K,T)) :- inst(r("c456",0,0,(C,K,T,Z,))).

% c447[0.0] 债务人不履行到期债务，债权人可以留置已经合法占有的债务人的动产；动产应当与债权属于同一法律关系，企业之间留置的除外（第448条）（第447条
inst(r("c447",0,0,(C,D,T,Z,))) :- cand(creditorOf(C,D,Z)), cand(debtMatured(Z)), cand(unpaid(Z)), cand(lawfullyPossesses(C,T)), cand(movable(T)), cand(belongsTo(T,D)), cand(sameLegalRelation(T,Z)).
constitutiveRule(r("c447",0,0,(C,D,T,Z,)),lienRight(C,T,Z)) :- inst(r("c447",0,0,(C,D,T,Z,))).
mainHead(r("c447",0,0,(C,D,T,Z,)),constitutiveRule,lienRight(C,T,Z)) :- inst(r("c447",0,0,(C,D,T,Z,))).
cand(lienRight(C,T,Z)) :- inst(r("c447",0,0,(C,D,T,Z,))).
body(r("c447",0,0,(C,D,T,Z,)),creditorOf(C,D,Z)) :- inst(r("c447",0,0,(C,D,T,Z,))).
body(r("c447",0,0,(C,D,T,Z,)),debtMatured(Z)) :- inst(r("c447",0,0,(C,D,T,Z,))).
body(r("c447",0,0,(C,D,T,Z,)),unpaid(Z)) :- inst(r("c447",0,0,(C,D,T,Z,))).
body(r("c447",0,0,(C,D,T,Z,)),lawfullyPossesses(C,T)) :- inst(r("c447",0,0,(C,D,T,Z,))).
body(r("c447",0,0,(C,D,T,Z,)),movable(T)) :- inst(r("c447",0,0,(C,D,T,Z,))).
body(r("c447",0,0,(C,D,T,Z,)),belongsTo(T,D)) :- inst(r("c447",0,0,(C,D,T,Z,))).
body(r("c447",0,0,(C,D,T,Z,)),sameLegalRelation(T,Z)) :- inst(r("c447",0,0,(C,D,T,Z,))).
% c447[1.0] 债务人不履行到期债务，债权人可以留置已经合法占有的债务人的动产；动产应当与债权属于同一法律关系，企业之间留置的除外（第448条）（第447条
inst(r("c447",1,0,(C,D,T,Z,))) :- cand(creditorOf(C,D,Z)), cand(debtMatured(Z)), cand(unpaid(Z)), cand(lawfullyPossesses(C,T)), cand(movable(T)), cand(belongsTo(T,D)), cand(betweenEnterprises(C,D)).
constitutiveRule(r("c447",1,0,(C,D,T,Z,)),lienRight(C,T,Z)) :- inst(r("c447",1,0,(C,D,T,Z,))).
mainHead(r("c447",1,0,(C,D,T,Z,)),constitutiveRule,lienRight(C,T,Z)) :- inst(r("c447",1,0,(C,D,T,Z,))).
cand(lienRight(C,T,Z)) :- inst(r("c447",1,0,(C,D,T,Z,))).
body(r("c447",1,0,(C,D,T,Z,)),creditorOf(C,D,Z)) :- inst(r("c447",1,0,(C,D,T,Z,))).
body(r("c447",1,0,(C,D,T,Z,)),debtMatured(Z)) :- inst(r("c447",1,0,(C,D,T,Z,))).
body(r("c447",1,0,(C,D,T,Z,)),unpaid(Z)) :- inst(r("c447",1,0,(C,D,T,Z,))).
body(r("c447",1,0,(C,D,T,Z,)),lawfullyPossesses(C,T)) :- inst(r("c447",1,0,(C,D,T,Z,))).
body(r("c447",1,0,(C,D,T,Z,)),movable(T)) :- inst(r("c447",1,0,(C,D,T,Z,))).
body(r("c447",1,0,(C,D,T,Z,)),belongsTo(T,D)) :- inst(r("c447",1,0,(C,D,T,Z,))).
body(r("c447",1,0,(C,D,T,Z,)),betweenEnterprises(C,D)) :- inst(r("c447",1,0,(C,D,T,Z,))).

% c447-priority[0.0] 留置权人有权就该动产优先受偿（第447条第1款；npc）
inst(r("c447-priority",0,0,(C,T,Z,))) :- cand(lienRight(C,T,Z)).
constitutiveRule(r("c447-priority",0,0,(C,T,Z,)),priorityFromLien(C,T)) :- inst(r("c447-priority",0,0,(C,T,Z,))).
mainHead(r("c447-priority",0,0,(C,T,Z,)),constitutiveRule,priorityFromLien(C,T)) :- inst(r("c447-priority",0,0,(C,T,Z,))).
cand(priorityFromLien(C,T)) :- inst(r("c447-priority",0,0,(C,T,Z,))).
body(r("c447-priority",0,0,(C,T,Z,)),lienRight(C,T,Z)) :- inst(r("c447-priority",0,0,(C,T,Z,))).

% c449[0.0] 法律规定或者当事人约定不得留置的动产，不得留置（第449条；npc）
inst(r("c449",0,0,(C,D,T,Z,))) :- cand(creditorOf(C,D,Z)), cand(lawfullyPossesses(C,T)), cand(lienExcludedByLaw(T)).
constitutiveRule(r("c449",0,0,(C,D,T,Z,)),non(lienRight(C,T,Z))) :- inst(r("c449",0,0,(C,D,T,Z,))).
mainHead(r("c449",0,0,(C,D,T,Z,)),constitutiveRule,non(lienRight(C,T,Z))) :- inst(r("c449",0,0,(C,D,T,Z,))).
cand(lienRight(C,T,Z)) :- inst(r("c449",0,0,(C,D,T,Z,))).
body(r("c449",0,0,(C,D,T,Z,)),creditorOf(C,D,Z)) :- inst(r("c449",0,0,(C,D,T,Z,))).
body(r("c449",0,0,(C,D,T,Z,)),lawfullyPossesses(C,T)) :- inst(r("c449",0,0,(C,D,T,Z,))).
body(r("c449",0,0,(C,D,T,Z,)),lienExcludedByLaw(T)) :- inst(r("c449",0,0,(C,D,T,Z,))).
% c449[1.0] 法律规定或者当事人约定不得留置的动产，不得留置（第449条；npc）
inst(r("c449",1,0,(C,D,T,Z,))) :- cand(creditorOf(C,D,Z)), cand(lawfullyPossesses(C,T)), cand(lienExcludedByAgreement(T)).
constitutiveRule(r("c449",1,0,(C,D,T,Z,)),non(lienRight(C,T,Z))) :- inst(r("c449",1,0,(C,D,T,Z,))).
mainHead(r("c449",1,0,(C,D,T,Z,)),constitutiveRule,non(lienRight(C,T,Z))) :- inst(r("c449",1,0,(C,D,T,Z,))).
cand(lienRight(C,T,Z)) :- inst(r("c449",1,0,(C,D,T,Z,))).
body(r("c449",1,0,(C,D,T,Z,)),creditorOf(C,D,Z)) :- inst(r("c449",1,0,(C,D,T,Z,))).
body(r("c449",1,0,(C,D,T,Z,)),lawfullyPossesses(C,T)) :- inst(r("c449",1,0,(C,D,T,Z,))).
body(r("c449",1,0,(C,D,T,Z,)),lienExcludedByAgreement(T)) :- inst(r("c449",1,0,(C,D,T,Z,))).

% c414-1[0.0] 均已登记的，按登记先后确定清偿顺序（第414条第1款；npc）
inst(r("c414-1",0,0,(K1,K2,))) :- cand(sameCollateral(K1,K2)), cand(mortgageRegistered(K1)), cand(mortgageRegistered(K2)), cand(registeredEarlier(K1,K2)).
constitutiveRule(r("c414-1",0,0,(K1,K2,)),ranksBefore(K1,K2)) :- inst(r("c414-1",0,0,(K1,K2,))).
mainHead(r("c414-1",0,0,(K1,K2,)),constitutiveRule,ranksBefore(K1,K2)) :- inst(r("c414-1",0,0,(K1,K2,))).
cand(ranksBefore(K1,K2)) :- inst(r("c414-1",0,0,(K1,K2,))).
body(r("c414-1",0,0,(K1,K2,)),sameCollateral(K1,K2)) :- inst(r("c414-1",0,0,(K1,K2,))).
body(r("c414-1",0,0,(K1,K2,)),mortgageRegistered(K1)) :- inst(r("c414-1",0,0,(K1,K2,))).
body(r("c414-1",0,0,(K1,K2,)),mortgageRegistered(K2)) :- inst(r("c414-1",0,0,(K1,K2,))).
body(r("c414-1",0,0,(K1,K2,)),registeredEarlier(K1,K2)) :- inst(r("c414-1",0,0,(K1,K2,))).

% c414-2[0.0] 已登记的先于未登记的受偿（第414条第1款；npc）
inst(r("c414-2",0,0,(K1,K2,))) :- cand(sameCollateral(K1,K2)), cand(mortgageRegistered(K1)), cand(mortgageEstablished(K2)).
constitutiveRule(r("c414-2",0,0,(K1,K2,)),ranksBefore(K1,K2)) :- inst(r("c414-2",0,0,(K1,K2,))).
mainHead(r("c414-2",0,0,(K1,K2,)),constitutiveRule,ranksBefore(K1,K2)) :- inst(r("c414-2",0,0,(K1,K2,))).
cand(ranksBefore(K1,K2)) :- inst(r("c414-2",0,0,(K1,K2,))).
body(r("c414-2",0,0,(K1,K2,)),sameCollateral(K1,K2)) :- inst(r("c414-2",0,0,(K1,K2,))).
body(r("c414-2",0,0,(K1,K2,)),mortgageRegistered(K1)) :- inst(r("c414-2",0,0,(K1,K2,))).
body(r("c414-2",0,0,(K1,K2,)),mortgageEstablished(K2)) :- inst(r("c414-2",0,0,(K1,K2,))).
inst(x("c414-2",0,0,0,(K1,K2,))) :- inst(r("c414-2",0,0,(K1,K2,))), cand(mortgageRegistered(K2)).
constitutiveRule(x("c414-2",0,0,0,(K1,K2,)),non(ranksBefore(K1,K2))) :- inst(x("c414-2",0,0,0,(K1,K2,))).
body(x("c414-2",0,0,0,(K1,K2,)),sameCollateral(K1,K2)) :- inst(x("c414-2",0,0,0,(K1,K2,))).
body(x("c414-2",0,0,0,(K1,K2,)),mortgageRegistered(K1)) :- inst(x("c414-2",0,0,0,(K1,K2,))).
body(x("c414-2",0,0,0,(K1,K2,)),mortgageEstablished(K2)) :- inst(x("c414-2",0,0,0,(K1,K2,))).
body(x("c414-2",0,0,0,(K1,K2,)),mortgageRegistered(K2)) :- inst(x("c414-2",0,0,0,(K1,K2,))).
superior(x("c414-2",0,0,0,(K1,K2,)),r("c414-2",0,0,(K1,K2,))) :- inst(x("c414-2",0,0,0,(K1,K2,))).
exc(x("c414-2",0,0,0,(K1,K2,)),r("c414-2",0,0,(K1,K2,)),constitutiveRule,ranksBefore(K1,K2)) :- inst(x("c414-2",0,0,0,(K1,K2,))).

% c414-3[0.0] 均未登记的，按债权比例清偿（第414条第1款；npc）
inst(r("c414-3",0,0,(K1,K2,))) :- cand(sameCollateral(K1,K2)), cand(mortgageEstablished(K1)), cand(mortgageEstablished(K2)).
constitutiveRule(r("c414-3",0,0,(K1,K2,)),paidProRata(K1,K2)) :- inst(r("c414-3",0,0,(K1,K2,))).
mainHead(r("c414-3",0,0,(K1,K2,)),constitutiveRule,paidProRata(K1,K2)) :- inst(r("c414-3",0,0,(K1,K2,))).
cand(paidProRata(K1,K2)) :- inst(r("c414-3",0,0,(K1,K2,))).
body(r("c414-3",0,0,(K1,K2,)),sameCollateral(K1,K2)) :- inst(r("c414-3",0,0,(K1,K2,))).
body(r("c414-3",0,0,(K1,K2,)),mortgageEstablished(K1)) :- inst(r("c414-3",0,0,(K1,K2,))).
body(r("c414-3",0,0,(K1,K2,)),mortgageEstablished(K2)) :- inst(r("c414-3",0,0,(K1,K2,))).
inst(x("c414-3",0,0,0,(K1,K2,))) :- inst(r("c414-3",0,0,(K1,K2,))), cand(mortgageRegistered(K1)).
constitutiveRule(x("c414-3",0,0,0,(K1,K2,)),non(paidProRata(K1,K2))) :- inst(x("c414-3",0,0,0,(K1,K2,))).
body(x("c414-3",0,0,0,(K1,K2,)),sameCollateral(K1,K2)) :- inst(x("c414-3",0,0,0,(K1,K2,))).
body(x("c414-3",0,0,0,(K1,K2,)),mortgageEstablished(K1)) :- inst(x("c414-3",0,0,0,(K1,K2,))).
body(x("c414-3",0,0,0,(K1,K2,)),mortgageEstablished(K2)) :- inst(x("c414-3",0,0,0,(K1,K2,))).
body(x("c414-3",0,0,0,(K1,K2,)),mortgageRegistered(K1)) :- inst(x("c414-3",0,0,0,(K1,K2,))).
superior(x("c414-3",0,0,0,(K1,K2,)),r("c414-3",0,0,(K1,K2,))) :- inst(x("c414-3",0,0,0,(K1,K2,))).
exc(x("c414-3",0,0,0,(K1,K2,)),r("c414-3",0,0,(K1,K2,)),constitutiveRule,paidProRata(K1,K2)) :- inst(x("c414-3",0,0,0,(K1,K2,))).
inst(x("c414-3",0,0,1,(K1,K2,))) :- inst(r("c414-3",0,0,(K1,K2,))), cand(mortgageRegistered(K2)).
constitutiveRule(x("c414-3",0,0,1,(K1,K2,)),non(paidProRata(K1,K2))) :- inst(x("c414-3",0,0,1,(K1,K2,))).
body(x("c414-3",0,0,1,(K1,K2,)),sameCollateral(K1,K2)) :- inst(x("c414-3",0,0,1,(K1,K2,))).
body(x("c414-3",0,0,1,(K1,K2,)),mortgageEstablished(K1)) :- inst(x("c414-3",0,0,1,(K1,K2,))).
body(x("c414-3",0,0,1,(K1,K2,)),mortgageEstablished(K2)) :- inst(x("c414-3",0,0,1,(K1,K2,))).
body(x("c414-3",0,0,1,(K1,K2,)),mortgageRegistered(K2)) :- inst(x("c414-3",0,0,1,(K1,K2,))).
superior(x("c414-3",0,0,1,(K1,K2,)),r("c414-3",0,0,(K1,K2,))) :- inst(x("c414-3",0,0,1,(K1,K2,))).
exc(x("c414-3",0,0,1,(K1,K2,)),r("c414-3",0,0,(K1,K2,)),constitutiveRule,paidProRata(K1,K2)) :- inst(x("c414-3",0,0,1,(K1,K2,))).

% c415[0.0] 同一财产既抵押又出质的，按登记、交付的时间先后确定清偿顺序（第415条；npc）
inst(r("c415",0,0,(K1,K2,))) :- cand(sameCollateral(K1,K2)), cand(mortgageVsPledge(K1,K2)), cand(perfectedEarlier(K1,K2)).
constitutiveRule(r("c415",0,0,(K1,K2,)),ranksBefore(K1,K2)) :- inst(r("c415",0,0,(K1,K2,))).
mainHead(r("c415",0,0,(K1,K2,)),constitutiveRule,ranksBefore(K1,K2)) :- inst(r("c415",0,0,(K1,K2,))).
cand(ranksBefore(K1,K2)) :- inst(r("c415",0,0,(K1,K2,))).
body(r("c415",0,0,(K1,K2,)),sameCollateral(K1,K2)) :- inst(r("c415",0,0,(K1,K2,))).
body(r("c415",0,0,(K1,K2,)),mortgageVsPledge(K1,K2)) :- inst(r("c415",0,0,(K1,K2,))).
body(r("c415",0,0,(K1,K2,)),perfectedEarlier(K1,K2)) :- inst(r("c415",0,0,(K1,K2,))).

% tx-g3589[0.0] 分类（自动抽取自图的层级）：按份共同保证 ⊑ 共同保证
inst(r("tx-g3589",0,0,(X,))) :- cand(isA(X,"按份共同保证")).
constitutiveRule(r("tx-g3589",0,0,(X,)),isA(X,"共同保证")) :- inst(r("tx-g3589",0,0,(X,))).
mainHead(r("tx-g3589",0,0,(X,)),constitutiveRule,isA(X,"共同保证")) :- inst(r("tx-g3589",0,0,(X,))).
cand(isA(X,"共同保证")) :- inst(r("tx-g3589",0,0,(X,))).
body(r("tx-g3589",0,0,(X,)),isA(X,"按份共同保证")) :- inst(r("tx-g3589",0,0,(X,))).

% tx-g3593[0.0] 分类（自动抽取自图的层级）：连带共同保证 ⊑ 共同保证
inst(r("tx-g3593",0,0,(X,))) :- cand(isA(X,"连带共同保证")).
constitutiveRule(r("tx-g3593",0,0,(X,)),isA(X,"共同保证")) :- inst(r("tx-g3593",0,0,(X,))).
mainHead(r("tx-g3593",0,0,(X,)),constitutiveRule,isA(X,"共同保证")) :- inst(r("tx-g3593",0,0,(X,))).
cand(isA(X,"共同保证")) :- inst(r("tx-g3593",0,0,(X,))).
body(r("tx-g3593",0,0,(X,)),isA(X,"连带共同保证")) :- inst(r("tx-g3593",0,0,(X,))).

% tx-g3653[0.0] 分类（自动抽取自图的层级）：建设用地使用权 ⊑ 具有排他性的物权
inst(r("tx-g3653",0,0,(X,))) :- cand(isA(X,"建设用地使用权")).
constitutiveRule(r("tx-g3653",0,0,(X,)),isA(X,"具有排他性的物权")) :- inst(r("tx-g3653",0,0,(X,))).
mainHead(r("tx-g3653",0,0,(X,)),constitutiveRule,isA(X,"具有排他性的物权")) :- inst(r("tx-g3653",0,0,(X,))).
cand(isA(X,"具有排他性的物权")) :- inst(r("tx-g3653",0,0,(X,))).
body(r("tx-g3653",0,0,(X,)),isA(X,"建设用地使用权")) :- inst(r("tx-g3653",0,0,(X,))).

% tx-g3654[0.0] 分类（自动抽取自图的层级）：所有权 ⊑ 具有排他性的物权
inst(r("tx-g3654",0,0,(X,))) :- cand(isA(X,"所有权")).
constitutiveRule(r("tx-g3654",0,0,(X,)),isA(X,"具有排他性的物权")) :- inst(r("tx-g3654",0,0,(X,))).
mainHead(r("tx-g3654",0,0,(X,)),constitutiveRule,isA(X,"具有排他性的物权")) :- inst(r("tx-g3654",0,0,(X,))).
cand(isA(X,"具有排他性的物权")) :- inst(r("tx-g3654",0,0,(X,))).
body(r("tx-g3654",0,0,(X,)),isA(X,"所有权")) :- inst(r("tx-g3654",0,0,(X,))).

% tx-g3694[0.0] 分类（自动抽取自图的层级）：请求权能 ⊑ 债权的权能
inst(r("tx-g3694",0,0,(X,))) :- cand(isA(X,"请求权能")).
constitutiveRule(r("tx-g3694",0,0,(X,)),isA(X,"债权的权能")) :- inst(r("tx-g3694",0,0,(X,))).
mainHead(r("tx-g3694",0,0,(X,)),constitutiveRule,isA(X,"债权的权能")) :- inst(r("tx-g3694",0,0,(X,))).
cand(isA(X,"债权的权能")) :- inst(r("tx-g3694",0,0,(X,))).
body(r("tx-g3694",0,0,(X,)),isA(X,"请求权能")) :- inst(r("tx-g3694",0,0,(X,))).

% tx-g3696[0.0] 分类（自动抽取自图的层级）：保持受领权能 ⊑ 债权的权能
inst(r("tx-g3696",0,0,(X,))) :- cand(isA(X,"保持受领权能")).
constitutiveRule(r("tx-g3696",0,0,(X,)),isA(X,"债权的权能")) :- inst(r("tx-g3696",0,0,(X,))).
mainHead(r("tx-g3696",0,0,(X,)),constitutiveRule,isA(X,"债权的权能")) :- inst(r("tx-g3696",0,0,(X,))).
cand(isA(X,"债权的权能")) :- inst(r("tx-g3696",0,0,(X,))).
body(r("tx-g3696",0,0,(X,)),isA(X,"保持受领权能")) :- inst(r("tx-g3696",0,0,(X,))).

% tx-g3698[0.0] 分类（自动抽取自图的层级）：保全权能 ⊑ 债权的权能
inst(r("tx-g3698",0,0,(X,))) :- cand(isA(X,"保全权能")).
constitutiveRule(r("tx-g3698",0,0,(X,)),isA(X,"债权的权能")) :- inst(r("tx-g3698",0,0,(X,))).
mainHead(r("tx-g3698",0,0,(X,)),constitutiveRule,isA(X,"债权的权能")) :- inst(r("tx-g3698",0,0,(X,))).
cand(isA(X,"债权的权能")) :- inst(r("tx-g3698",0,0,(X,))).
body(r("tx-g3698",0,0,(X,)),isA(X,"保全权能")) :- inst(r("tx-g3698",0,0,(X,))).

% tx-g3700[0.0] 分类（自动抽取自图的层级）：处分权能 ⊑ 债权的权能
inst(r("tx-g3700",0,0,(X,))) :- cand(isA(X,"处分权能")).
constitutiveRule(r("tx-g3700",0,0,(X,)),isA(X,"债权的权能")) :- inst(r("tx-g3700",0,0,(X,))).
mainHead(r("tx-g3700",0,0,(X,)),constitutiveRule,isA(X,"债权的权能")) :- inst(r("tx-g3700",0,0,(X,))).
cand(isA(X,"债权的权能")) :- inst(r("tx-g3700",0,0,(X,))).
body(r("tx-g3700",0,0,(X,)),isA(X,"处分权能")) :- inst(r("tx-g3700",0,0,(X,))).

% tx-g3715[0.0] 分类（自动抽取自图的层级）：主给付义务 ⊑ 给付义务
inst(r("tx-g3715",0,0,(X,))) :- cand(isA(X,"主给付义务")).
constitutiveRule(r("tx-g3715",0,0,(X,)),isA(X,"给付义务")) :- inst(r("tx-g3715",0,0,(X,))).
mainHead(r("tx-g3715",0,0,(X,)),constitutiveRule,isA(X,"给付义务")) :- inst(r("tx-g3715",0,0,(X,))).
cand(isA(X,"给付义务")) :- inst(r("tx-g3715",0,0,(X,))).
body(r("tx-g3715",0,0,(X,)),isA(X,"主给付义务")) :- inst(r("tx-g3715",0,0,(X,))).

% tx-g3718[0.0] 分类（自动抽取自图的层级）：从给付义务 ⊑ 给付义务
inst(r("tx-g3718",0,0,(X,))) :- cand(isA(X,"从给付义务")).
constitutiveRule(r("tx-g3718",0,0,(X,)),isA(X,"给付义务")) :- inst(r("tx-g3718",0,0,(X,))).
mainHead(r("tx-g3718",0,0,(X,)),constitutiveRule,isA(X,"给付义务")) :- inst(r("tx-g3718",0,0,(X,))).
cand(isA(X,"给付义务")) :- inst(r("tx-g3718",0,0,(X,))).
body(r("tx-g3718",0,0,(X,)),isA(X,"从给付义务")) :- inst(r("tx-g3718",0,0,(X,))).

% tx-g3804[0.0] 分类（自动抽取自图的层级）：从属性 ⊑ 特性
inst(r("tx-g3804",0,0,(X,))) :- cand(isA(X,"从属性")).
constitutiveRule(r("tx-g3804",0,0,(X,)),isA(X,"特性")) :- inst(r("tx-g3804",0,0,(X,))).
mainHead(r("tx-g3804",0,0,(X,)),constitutiveRule,isA(X,"特性")) :- inst(r("tx-g3804",0,0,(X,))).
cand(isA(X,"特性")) :- inst(r("tx-g3804",0,0,(X,))).
body(r("tx-g3804",0,0,(X,)),isA(X,"从属性")) :- inst(r("tx-g3804",0,0,(X,))).

% tx-g3806[0.0] 分类（自动抽取自图的层级）：补充性 ⊑ 特性
inst(r("tx-g3806",0,0,(X,))) :- cand(isA(X,"补充性")).
constitutiveRule(r("tx-g3806",0,0,(X,)),isA(X,"特性")) :- inst(r("tx-g3806",0,0,(X,))).
mainHead(r("tx-g3806",0,0,(X,)),constitutiveRule,isA(X,"特性")) :- inst(r("tx-g3806",0,0,(X,))).
cand(isA(X,"特性")) :- inst(r("tx-g3806",0,0,(X,))).
body(r("tx-g3806",0,0,(X,)),isA(X,"补充性")) :- inst(r("tx-g3806",0,0,(X,))).

% tx-g3808[0.0] 分类（自动抽取自图的层级）：相对独立性 ⊑ 特性
inst(r("tx-g3808",0,0,(X,))) :- cand(isA(X,"相对独立性")).
constitutiveRule(r("tx-g3808",0,0,(X,)),isA(X,"特性")) :- inst(r("tx-g3808",0,0,(X,))).
mainHead(r("tx-g3808",0,0,(X,)),constitutiveRule,isA(X,"特性")) :- inst(r("tx-g3808",0,0,(X,))).
cand(isA(X,"特性")) :- inst(r("tx-g3808",0,0,(X,))).
body(r("tx-g3808",0,0,(X,)),isA(X,"相对独立性")) :- inst(r("tx-g3808",0,0,(X,))).

% tx-g3810[0.0] 分类（自动抽取自图的层级）：明确的目的性 ⊑ 特性
inst(r("tx-g3810",0,0,(X,))) :- cand(isA(X,"明确的目的性")).
constitutiveRule(r("tx-g3810",0,0,(X,)),isA(X,"特性")) :- inst(r("tx-g3810",0,0,(X,))).
mainHead(r("tx-g3810",0,0,(X,)),constitutiveRule,isA(X,"特性")) :- inst(r("tx-g3810",0,0,(X,))).
cand(isA(X,"特性")) :- inst(r("tx-g3810",0,0,(X,))).
body(r("tx-g3810",0,0,(X,)),isA(X,"明确的目的性")) :- inst(r("tx-g3810",0,0,(X,))).

% c476[0.0] 要约可以撤销；明示不可撤销或受要约人有理由信赖并已做合理准备的除外（第476条；npc）
inst(r("c476",0,0,(A,O,))) :- cand(offer(O,A)).
constitutiveRule(r("c476",0,0,(A,O,)),revokeOffer(A,O)) :- inst(r("c476",0,0,(A,O,))).
mainHead(r("c476",0,0,(A,O,)),constitutiveRule,revokeOffer(A,O)) :- inst(r("c476",0,0,(A,O,))).
cand(revokeOffer(A,O)) :- inst(r("c476",0,0,(A,O,))).
body(r("c476",0,0,(A,O,)),offer(O,A)) :- inst(r("c476",0,0,(A,O,))).
inst(x("c476",0,0,0,(A,O,))) :- inst(r("c476",0,0,(A,O,))), cand(statedIrrevocable(O)).
constitutiveRule(x("c476",0,0,0,(A,O,)),non(revokeOffer(A,O))) :- inst(x("c476",0,0,0,(A,O,))).
body(x("c476",0,0,0,(A,O,)),offer(O,A)) :- inst(x("c476",0,0,0,(A,O,))).
body(x("c476",0,0,0,(A,O,)),statedIrrevocable(O)) :- inst(x("c476",0,0,0,(A,O,))).
superior(x("c476",0,0,0,(A,O,)),r("c476",0,0,(A,O,))) :- inst(x("c476",0,0,0,(A,O,))).
exc(x("c476",0,0,0,(A,O,)),r("c476",0,0,(A,O,)),constitutiveRule,revokeOffer(A,O)) :- inst(x("c476",0,0,0,(A,O,))).
inst(x("c476",0,0,1,(A,O,))) :- inst(r("c476",0,0,(A,O,))), cand(offereeReliedAndPrepared(O)).
constitutiveRule(x("c476",0,0,1,(A,O,)),non(revokeOffer(A,O))) :- inst(x("c476",0,0,1,(A,O,))).
body(x("c476",0,0,1,(A,O,)),offer(O,A)) :- inst(x("c476",0,0,1,(A,O,))).
body(x("c476",0,0,1,(A,O,)),offereeReliedAndPrepared(O)) :- inst(x("c476",0,0,1,(A,O,))).
superior(x("c476",0,0,1,(A,O,)),r("c476",0,0,(A,O,))) :- inst(x("c476",0,0,1,(A,O,))).
exc(x("c476",0,0,1,(A,O,)),r("c476",0,0,(A,O,)),constitutiveRule,revokeOffer(A,O)) :- inst(x("c476",0,0,1,(A,O,))).

% c525[0.0] 没有先后履行顺序的，一方在对方履行之前有权拒绝其履行请求（第525条；npc）
inst(r("c525",0,0,(A,B,K,))) :- cand(mutualDebts(K,A,B)), cand(noPerformanceOrder(K)).
constitutiveRule(r("c525",0,0,(A,B,K,)),simultaneousPerformanceDefense(A,K)) :- inst(r("c525",0,0,(A,B,K,))).
mainHead(r("c525",0,0,(A,B,K,)),constitutiveRule,simultaneousPerformanceDefense(A,K)) :- inst(r("c525",0,0,(A,B,K,))).
cand(simultaneousPerformanceDefense(A,K)) :- inst(r("c525",0,0,(A,B,K,))).
body(r("c525",0,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(r("c525",0,0,(A,B,K,))).
body(r("c525",0,0,(A,B,K,)),noPerformanceOrder(K)) :- inst(r("c525",0,0,(A,B,K,))).
inst(x("c525",0,0,0,(A,B,K,))) :- inst(r("c525",0,0,(A,B,K,))), cand(performed(B,K)).
constitutiveRule(x("c525",0,0,0,(A,B,K,)),non(simultaneousPerformanceDefense(A,K))) :- inst(x("c525",0,0,0,(A,B,K,))).
body(x("c525",0,0,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(x("c525",0,0,0,(A,B,K,))).
body(x("c525",0,0,0,(A,B,K,)),noPerformanceOrder(K)) :- inst(x("c525",0,0,0,(A,B,K,))).
body(x("c525",0,0,0,(A,B,K,)),performed(B,K)) :- inst(x("c525",0,0,0,(A,B,K,))).
superior(x("c525",0,0,0,(A,B,K,)),r("c525",0,0,(A,B,K,))) :- inst(x("c525",0,0,0,(A,B,K,))).
exc(x("c525",0,0,0,(A,B,K,)),r("c525",0,0,(A,B,K,)),constitutiveRule,simultaneousPerformanceDefense(A,K)) :- inst(x("c525",0,0,0,(A,B,K,))).

% c526[0.0] 应当先履行的一方未履行的，后履行一方有权拒绝其履行请求（第526条；npc）
inst(r("c526",0,0,(A,B,K,))) :- cand(mutualDebts(K,A,B)), cand(performsFirst(B,K)).
constitutiveRule(r("c526",0,0,(A,B,K,)),subsequentPerformanceDefense(A,K)) :- inst(r("c526",0,0,(A,B,K,))).
mainHead(r("c526",0,0,(A,B,K,)),constitutiveRule,subsequentPerformanceDefense(A,K)) :- inst(r("c526",0,0,(A,B,K,))).
cand(subsequentPerformanceDefense(A,K)) :- inst(r("c526",0,0,(A,B,K,))).
body(r("c526",0,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(r("c526",0,0,(A,B,K,))).
body(r("c526",0,0,(A,B,K,)),performsFirst(B,K)) :- inst(r("c526",0,0,(A,B,K,))).
inst(x("c526",0,0,0,(A,B,K,))) :- inst(r("c526",0,0,(A,B,K,))), cand(performed(B,K)).
constitutiveRule(x("c526",0,0,0,(A,B,K,)),non(subsequentPerformanceDefense(A,K))) :- inst(x("c526",0,0,0,(A,B,K,))).
body(x("c526",0,0,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(x("c526",0,0,0,(A,B,K,))).
body(x("c526",0,0,0,(A,B,K,)),performsFirst(B,K)) :- inst(x("c526",0,0,0,(A,B,K,))).
body(x("c526",0,0,0,(A,B,K,)),performed(B,K)) :- inst(x("c526",0,0,0,(A,B,K,))).
superior(x("c526",0,0,0,(A,B,K,)),r("c526",0,0,(A,B,K,))) :- inst(x("c526",0,0,0,(A,B,K,))).
exc(x("c526",0,0,0,(A,B,K,)),r("c526",0,0,(A,B,K,)),constitutiveRule,subsequentPerformanceDefense(A,K)) :- inst(x("c526",0,0,0,(A,B,K,))).

% c527[0.0] 先履行一方有确切证据证明对方经营状况严重恶化等情形的，可以中止履行（第527条第1款；npc）
inst(r("c527",0,0,(A,B,K,))) :- cand(mutualDebts(K,A,B)), cand(performsFirst(A,K)), cand(conclusiveEvidence(A,K)), cand(businessSeverelyDeteriorated(B)).
constitutiveRule(r("c527",0,0,(A,B,K,)),insecurityDefense(A,K)) :- inst(r("c527",0,0,(A,B,K,))).
mainHead(r("c527",0,0,(A,B,K,)),constitutiveRule,insecurityDefense(A,K)) :- inst(r("c527",0,0,(A,B,K,))).
cand(insecurityDefense(A,K)) :- inst(r("c527",0,0,(A,B,K,))).
body(r("c527",0,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(r("c527",0,0,(A,B,K,))).
body(r("c527",0,0,(A,B,K,)),performsFirst(A,K)) :- inst(r("c527",0,0,(A,B,K,))).
body(r("c527",0,0,(A,B,K,)),conclusiveEvidence(A,K)) :- inst(r("c527",0,0,(A,B,K,))).
body(r("c527",0,0,(A,B,K,)),businessSeverelyDeteriorated(B)) :- inst(r("c527",0,0,(A,B,K,))).
% c527[1.0] 先履行一方有确切证据证明对方经营状况严重恶化等情形的，可以中止履行（第527条第1款；npc）
inst(r("c527",1,0,(A,B,K,))) :- cand(mutualDebts(K,A,B)), cand(performsFirst(A,K)), cand(conclusiveEvidence(A,K)), cand(assetsTransferredToEvadeDebt(B)).
constitutiveRule(r("c527",1,0,(A,B,K,)),insecurityDefense(A,K)) :- inst(r("c527",1,0,(A,B,K,))).
mainHead(r("c527",1,0,(A,B,K,)),constitutiveRule,insecurityDefense(A,K)) :- inst(r("c527",1,0,(A,B,K,))).
cand(insecurityDefense(A,K)) :- inst(r("c527",1,0,(A,B,K,))).
body(r("c527",1,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(r("c527",1,0,(A,B,K,))).
body(r("c527",1,0,(A,B,K,)),performsFirst(A,K)) :- inst(r("c527",1,0,(A,B,K,))).
body(r("c527",1,0,(A,B,K,)),conclusiveEvidence(A,K)) :- inst(r("c527",1,0,(A,B,K,))).
body(r("c527",1,0,(A,B,K,)),assetsTransferredToEvadeDebt(B)) :- inst(r("c527",1,0,(A,B,K,))).
% c527[2.0] 先履行一方有确切证据证明对方经营状况严重恶化等情形的，可以中止履行（第527条第1款；npc）
inst(r("c527",2,0,(A,B,K,))) :- cand(mutualDebts(K,A,B)), cand(performsFirst(A,K)), cand(conclusiveEvidence(A,K)), cand(lostCommercialCredibility(B)).
constitutiveRule(r("c527",2,0,(A,B,K,)),insecurityDefense(A,K)) :- inst(r("c527",2,0,(A,B,K,))).
mainHead(r("c527",2,0,(A,B,K,)),constitutiveRule,insecurityDefense(A,K)) :- inst(r("c527",2,0,(A,B,K,))).
cand(insecurityDefense(A,K)) :- inst(r("c527",2,0,(A,B,K,))).
body(r("c527",2,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(r("c527",2,0,(A,B,K,))).
body(r("c527",2,0,(A,B,K,)),performsFirst(A,K)) :- inst(r("c527",2,0,(A,B,K,))).
body(r("c527",2,0,(A,B,K,)),conclusiveEvidence(A,K)) :- inst(r("c527",2,0,(A,B,K,))).
body(r("c527",2,0,(A,B,K,)),lostCommercialCredibility(B)) :- inst(r("c527",2,0,(A,B,K,))).
% c527[3.0] 先履行一方有确切证据证明对方经营状况严重恶化等情形的，可以中止履行（第527条第1款；npc）
inst(r("c527",3,0,(A,B,K,))) :- cand(mutualDebts(K,A,B)), cand(performsFirst(A,K)), cand(conclusiveEvidence(A,K)), cand(mayLoseAbilityToPerform(B)).
constitutiveRule(r("c527",3,0,(A,B,K,)),insecurityDefense(A,K)) :- inst(r("c527",3,0,(A,B,K,))).
mainHead(r("c527",3,0,(A,B,K,)),constitutiveRule,insecurityDefense(A,K)) :- inst(r("c527",3,0,(A,B,K,))).
cand(insecurityDefense(A,K)) :- inst(r("c527",3,0,(A,B,K,))).
body(r("c527",3,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(r("c527",3,0,(A,B,K,))).
body(r("c527",3,0,(A,B,K,)),performsFirst(A,K)) :- inst(r("c527",3,0,(A,B,K,))).
body(r("c527",3,0,(A,B,K,)),conclusiveEvidence(A,K)) :- inst(r("c527",3,0,(A,B,K,))).
body(r("c527",3,0,(A,B,K,)),mayLoseAbilityToPerform(B)) :- inst(r("c527",3,0,(A,B,K,))).

% c527-2[0.0] 没有确切证据中止履行的，应当承担违约责任（第527条第2款；npc）
inst(r("c527-2",0,0,(A,B,K,))) :- cand(mutualDebts(K,A,B)), cand(suspendsPerformance(A,K)).
constitutiveRule(r("c527-2",0,0,(A,B,K,)),liableForBreach(A,K)) :- inst(r("c527-2",0,0,(A,B,K,))).
mainHead(r("c527-2",0,0,(A,B,K,)),constitutiveRule,liableForBreach(A,K)) :- inst(r("c527-2",0,0,(A,B,K,))).
cand(liableForBreach(A,K)) :- inst(r("c527-2",0,0,(A,B,K,))).
body(r("c527-2",0,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(r("c527-2",0,0,(A,B,K,))).
body(r("c527-2",0,0,(A,B,K,)),suspendsPerformance(A,K)) :- inst(r("c527-2",0,0,(A,B,K,))).
inst(x("c527-2",0,0,0,(A,B,K,))) :- inst(r("c527-2",0,0,(A,B,K,))), cand(conclusiveEvidence(A,K)).
constitutiveRule(x("c527-2",0,0,0,(A,B,K,)),non(liableForBreach(A,K))) :- inst(x("c527-2",0,0,0,(A,B,K,))).
body(x("c527-2",0,0,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(x("c527-2",0,0,0,(A,B,K,))).
body(x("c527-2",0,0,0,(A,B,K,)),suspendsPerformance(A,K)) :- inst(x("c527-2",0,0,0,(A,B,K,))).
body(x("c527-2",0,0,0,(A,B,K,)),conclusiveEvidence(A,K)) :- inst(x("c527-2",0,0,0,(A,B,K,))).
superior(x("c527-2",0,0,0,(A,B,K,)),r("c527-2",0,0,(A,B,K,))) :- inst(x("c527-2",0,0,0,(A,B,K,))).
exc(x("c527-2",0,0,0,(A,B,K,)),r("c527-2",0,0,(A,B,K,)),constitutiveRule,liableForBreach(A,K)) :- inst(x("c527-2",0,0,0,(A,B,K,))).

% c528-notify[0.0] 依法中止履行的，应当及时通知对方（第528条；npc）
inst(r("c528-notify",0,0,(A,K,))) :- cand(insecurityDefense(A,K)), cand(suspendsPerformance(A,K)).
prescriptiveRule(r("c528-notify",0,0,(A,K,)),notifyCounterparty(A,K)) :- inst(r("c528-notify",0,0,(A,K,))).
mainHead(r("c528-notify",0,0,(A,K,)),prescriptiveRule,notifyCounterparty(A,K)) :- inst(r("c528-notify",0,0,(A,K,))).
cand(notifyCounterparty(A,K)) :- inst(r("c528-notify",0,0,(A,K,))).
body(r("c528-notify",0,0,(A,K,)),insecurityDefense(A,K)) :- inst(r("c528-notify",0,0,(A,K,))).
body(r("c528-notify",0,0,(A,K,)),suspendsPerformance(A,K)) :- inst(r("c528-notify",0,0,(A,K,))).

% c528-resume[0.0] 对方提供适当担保的，应当恢复履行（第528条；npc）
inst(r("c528-resume",0,0,(A,B,K,))) :- cand(mutualDebts(K,A,B)), cand(performsFirst(A,K)), cand(conclusiveEvidence(A,K)), cand(adequateSecurityProvided(B,K)).
constitutiveRule(r("c528-resume",0,0,(A,B,K,)),non(insecurityDefense(A,K))) :- inst(r("c528-resume",0,0,(A,B,K,))).
mainHead(r("c528-resume",0,0,(A,B,K,)),constitutiveRule,non(insecurityDefense(A,K))) :- inst(r("c528-resume",0,0,(A,B,K,))).
cand(insecurityDefense(A,K)) :- inst(r("c528-resume",0,0,(A,B,K,))).
body(r("c528-resume",0,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(r("c528-resume",0,0,(A,B,K,))).
body(r("c528-resume",0,0,(A,B,K,)),performsFirst(A,K)) :- inst(r("c528-resume",0,0,(A,B,K,))).
body(r("c528-resume",0,0,(A,B,K,)),conclusiveEvidence(A,K)) :- inst(r("c528-resume",0,0,(A,B,K,))).
body(r("c528-resume",0,0,(A,B,K,)),adequateSecurityProvided(B,K)) :- inst(r("c528-resume",0,0,(A,B,K,))).

% c528-term[0.0] 对方在合理期限内未恢复履行能力且未提供适当担保的，可以解除合同并请求违约责任（第528条；npc）
inst(r("c528-term",0,0,(A,B,K,))) :- cand(insecurityDefense(A,K)), cand(mutualDebts(K,A,B)), cand(noRecoveryWithinReasonableTime(B,K)).
constitutiveRule(r("c528-term",0,0,(A,B,K,)),terminationRight(A,K)) :- inst(r("c528-term",0,0,(A,B,K,))).
mainHead(r("c528-term",0,0,(A,B,K,)),constitutiveRule,terminationRight(A,K)) :- inst(r("c528-term",0,0,(A,B,K,))).
cand(terminationRight(A,K)) :- inst(r("c528-term",0,0,(A,B,K,))).
body(r("c528-term",0,0,(A,B,K,)),insecurityDefense(A,K)) :- inst(r("c528-term",0,0,(A,B,K,))).
body(r("c528-term",0,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(r("c528-term",0,0,(A,B,K,))).
body(r("c528-term",0,0,(A,B,K,)),noRecoveryWithinReasonableTime(B,K)) :- inst(r("c528-term",0,0,(A,B,K,))).
inst(x("c528-term",0,0,0,(A,B,K,))) :- inst(r("c528-term",0,0,(A,B,K,))), cand(adequateSecurityProvided(B,K)).
constitutiveRule(x("c528-term",0,0,0,(A,B,K,)),non(terminationRight(A,K))) :- inst(x("c528-term",0,0,0,(A,B,K,))).
body(x("c528-term",0,0,0,(A,B,K,)),insecurityDefense(A,K)) :- inst(x("c528-term",0,0,0,(A,B,K,))).
body(x("c528-term",0,0,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(x("c528-term",0,0,0,(A,B,K,))).
body(x("c528-term",0,0,0,(A,B,K,)),noRecoveryWithinReasonableTime(B,K)) :- inst(x("c528-term",0,0,0,(A,B,K,))).
body(x("c528-term",0,0,0,(A,B,K,)),adequateSecurityProvided(B,K)) :- inst(x("c528-term",0,0,0,(A,B,K,))).
superior(x("c528-term",0,0,0,(A,B,K,)),r("c528-term",0,0,(A,B,K,))) :- inst(x("c528-term",0,0,0,(A,B,K,))).
exc(x("c528-term",0,0,0,(A,B,K,)),r("c528-term",0,0,(A,B,K,)),constitutiveRule,terminationRight(A,K)) :- inst(x("c528-term",0,0,0,(A,B,K,))).
% c528-term[0.1] 对方在合理期限内未恢复履行能力且未提供适当担保的，可以解除合同并请求违约责任（第528条；npc）
inst(r("c528-term",0,1,(A,B,K,))) :- cand(insecurityDefense(A,K)), cand(mutualDebts(K,A,B)), cand(noRecoveryWithinReasonableTime(B,K)).
constitutiveRule(r("c528-term",0,1,(A,B,K,)),liableForBreach(B,K)) :- inst(r("c528-term",0,1,(A,B,K,))).
mainHead(r("c528-term",0,1,(A,B,K,)),constitutiveRule,liableForBreach(B,K)) :- inst(r("c528-term",0,1,(A,B,K,))).
cand(liableForBreach(B,K)) :- inst(r("c528-term",0,1,(A,B,K,))).
body(r("c528-term",0,1,(A,B,K,)),insecurityDefense(A,K)) :- inst(r("c528-term",0,1,(A,B,K,))).
body(r("c528-term",0,1,(A,B,K,)),mutualDebts(K,A,B)) :- inst(r("c528-term",0,1,(A,B,K,))).
body(r("c528-term",0,1,(A,B,K,)),noRecoveryWithinReasonableTime(B,K)) :- inst(r("c528-term",0,1,(A,B,K,))).
inst(x("c528-term",0,1,0,(A,B,K,))) :- inst(r("c528-term",0,1,(A,B,K,))), cand(adequateSecurityProvided(B,K)).
constitutiveRule(x("c528-term",0,1,0,(A,B,K,)),non(liableForBreach(B,K))) :- inst(x("c528-term",0,1,0,(A,B,K,))).
body(x("c528-term",0,1,0,(A,B,K,)),insecurityDefense(A,K)) :- inst(x("c528-term",0,1,0,(A,B,K,))).
body(x("c528-term",0,1,0,(A,B,K,)),mutualDebts(K,A,B)) :- inst(x("c528-term",0,1,0,(A,B,K,))).
body(x("c528-term",0,1,0,(A,B,K,)),noRecoveryWithinReasonableTime(B,K)) :- inst(x("c528-term",0,1,0,(A,B,K,))).
body(x("c528-term",0,1,0,(A,B,K,)),adequateSecurityProvided(B,K)) :- inst(x("c528-term",0,1,0,(A,B,K,))).
superior(x("c528-term",0,1,0,(A,B,K,)),r("c528-term",0,1,(A,B,K,))) :- inst(x("c528-term",0,1,0,(A,B,K,))).
exc(x("c528-term",0,1,0,(A,B,K,)),r("c528-term",0,1,(A,B,K,)),constitutiveRule,liableForBreach(B,K)) :- inst(x("c528-term",0,1,0,(A,B,K,))).

% c547[0.0] 受让人取得与债权有关的从权利（专属于债权人自身的除外；不因未办理转移登记或未转移占有而受影响）（第547条；npc）
inst(r("c547",0,0,(R,Y,Z,))) :- cand(assignmentEffective(Z,Y)), cand(accessoryRightOf(R,Z)).
constitutiveRule(r("c547",0,0,(R,Y,Z,)),acquiresAccessoryRight(Y,R)) :- inst(r("c547",0,0,(R,Y,Z,))).
mainHead(r("c547",0,0,(R,Y,Z,)),constitutiveRule,acquiresAccessoryRight(Y,R)) :- inst(r("c547",0,0,(R,Y,Z,))).
cand(acquiresAccessoryRight(Y,R)) :- inst(r("c547",0,0,(R,Y,Z,))).
body(r("c547",0,0,(R,Y,Z,)),assignmentEffective(Z,Y)) :- inst(r("c547",0,0,(R,Y,Z,))).
body(r("c547",0,0,(R,Y,Z,)),accessoryRightOf(R,Z)) :- inst(r("c547",0,0,(R,Y,Z,))).
inst(x("c547",0,0,0,(R,Y,Z,))) :- inst(r("c547",0,0,(R,Y,Z,))), cand(personalToCreditor(R)).
constitutiveRule(x("c547",0,0,0,(R,Y,Z,)),non(acquiresAccessoryRight(Y,R))) :- inst(x("c547",0,0,0,(R,Y,Z,))).
body(x("c547",0,0,0,(R,Y,Z,)),assignmentEffective(Z,Y)) :- inst(x("c547",0,0,0,(R,Y,Z,))).
body(x("c547",0,0,0,(R,Y,Z,)),accessoryRightOf(R,Z)) :- inst(x("c547",0,0,0,(R,Y,Z,))).
body(x("c547",0,0,0,(R,Y,Z,)),personalToCreditor(R)) :- inst(x("c547",0,0,0,(R,Y,Z,))).
superior(x("c547",0,0,0,(R,Y,Z,)),r("c547",0,0,(R,Y,Z,))) :- inst(x("c547",0,0,0,(R,Y,Z,))).
exc(x("c547",0,0,0,(R,Y,Z,)),r("c547",0,0,(R,Y,Z,)),constitutiveRule,acquiresAccessoryRight(Y,R)) :- inst(x("c547",0,0,0,(R,Y,Z,))).

% c545[0.0] 债权人可以将债权转让给第三人（性质、约定、法律不得转让的除外）（第545条第1款；npc）
inst(r("c545",0,0,(A,Y,Z,))) :- cand(claimAssigned(Z,A,Y)).
constitutiveRule(r("c545",0,0,(A,Y,Z,)),assignmentEffective(Z,Y)) :- inst(r("c545",0,0,(A,Y,Z,))).
mainHead(r("c545",0,0,(A,Y,Z,)),constitutiveRule,assignmentEffective(Z,Y)) :- inst(r("c545",0,0,(A,Y,Z,))).
cand(assignmentEffective(Z,Y)) :- inst(r("c545",0,0,(A,Y,Z,))).
body(r("c545",0,0,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(r("c545",0,0,(A,Y,Z,))).
inst(x("c545",0,0,0,(A,Y,Z,))) :- inst(r("c545",0,0,(A,Y,Z,))), cand(nonAssignableByNature(Z)).
constitutiveRule(x("c545",0,0,0,(A,Y,Z,)),non(assignmentEffective(Z,Y))) :- inst(x("c545",0,0,0,(A,Y,Z,))).
body(x("c545",0,0,0,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(x("c545",0,0,0,(A,Y,Z,))).
body(x("c545",0,0,0,(A,Y,Z,)),nonAssignableByNature(Z)) :- inst(x("c545",0,0,0,(A,Y,Z,))).
superior(x("c545",0,0,0,(A,Y,Z,)),r("c545",0,0,(A,Y,Z,))) :- inst(x("c545",0,0,0,(A,Y,Z,))).
exc(x("c545",0,0,0,(A,Y,Z,)),r("c545",0,0,(A,Y,Z,)),constitutiveRule,assignmentEffective(Z,Y)) :- inst(x("c545",0,0,0,(A,Y,Z,))).
inst(x("c545",0,0,1,(A,Y,Z,))) :- inst(r("c545",0,0,(A,Y,Z,))), cand(nonAssignableByLaw(Z)).
constitutiveRule(x("c545",0,0,1,(A,Y,Z,)),non(assignmentEffective(Z,Y))) :- inst(x("c545",0,0,1,(A,Y,Z,))).
body(x("c545",0,0,1,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(x("c545",0,0,1,(A,Y,Z,))).
body(x("c545",0,0,1,(A,Y,Z,)),nonAssignableByLaw(Z)) :- inst(x("c545",0,0,1,(A,Y,Z,))).
superior(x("c545",0,0,1,(A,Y,Z,)),r("c545",0,0,(A,Y,Z,))) :- inst(x("c545",0,0,1,(A,Y,Z,))).
exc(x("c545",0,0,1,(A,Y,Z,)),r("c545",0,0,(A,Y,Z,)),constitutiveRule,assignmentEffective(Z,Y)) :- inst(x("c545",0,0,1,(A,Y,Z,))).
inst(x("c545",0,0,2,(A,Y,Z,))) :- inst(r("c545",0,0,(A,Y,Z,))), cand(agreedNonAssignable(Z)).
constitutiveRule(x("c545",0,0,2,(A,Y,Z,)),non(assignmentEffective(Z,Y))) :- inst(x("c545",0,0,2,(A,Y,Z,))).
body(x("c545",0,0,2,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(x("c545",0,0,2,(A,Y,Z,))).
body(x("c545",0,0,2,(A,Y,Z,)),agreedNonAssignable(Z)) :- inst(x("c545",0,0,2,(A,Y,Z,))).
superior(x("c545",0,0,2,(A,Y,Z,)),r("c545",0,0,(A,Y,Z,))) :- inst(x("c545",0,0,2,(A,Y,Z,))).
exc(x("c545",0,0,2,(A,Y,Z,)),r("c545",0,0,(A,Y,Z,)),constitutiveRule,assignmentEffective(Z,Y)) :- inst(x("c545",0,0,2,(A,Y,Z,))).

% c545-2-money[0.0] 约定金钱债权不得转让的，不得对抗第三人（第545条第2款；npc）
inst(r("c545-2-money",0,0,(A,Y,Z,))) :- cand(claimAssigned(Z,A,Y)), cand(agreedNonAssignable(Z)), cand(monetaryClaim(Z)).
constitutiveRule(r("c545-2-money",0,0,(A,Y,Z,)),assignmentEffective(Z,Y)) :- inst(r("c545-2-money",0,0,(A,Y,Z,))).
mainHead(r("c545-2-money",0,0,(A,Y,Z,)),constitutiveRule,assignmentEffective(Z,Y)) :- inst(r("c545-2-money",0,0,(A,Y,Z,))).
cand(assignmentEffective(Z,Y)) :- inst(r("c545-2-money",0,0,(A,Y,Z,))).
body(r("c545-2-money",0,0,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(r("c545-2-money",0,0,(A,Y,Z,))).
body(r("c545-2-money",0,0,(A,Y,Z,)),agreedNonAssignable(Z)) :- inst(r("c545-2-money",0,0,(A,Y,Z,))).
body(r("c545-2-money",0,0,(A,Y,Z,)),monetaryClaim(Z)) :- inst(r("c545-2-money",0,0,(A,Y,Z,))).
inst(x("c545-2-money",0,0,0,(A,Y,Z,))) :- inst(r("c545-2-money",0,0,(A,Y,Z,))), cand(nonAssignableByNature(Z)).
constitutiveRule(x("c545-2-money",0,0,0,(A,Y,Z,)),non(assignmentEffective(Z,Y))) :- inst(x("c545-2-money",0,0,0,(A,Y,Z,))).
body(x("c545-2-money",0,0,0,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(x("c545-2-money",0,0,0,(A,Y,Z,))).
body(x("c545-2-money",0,0,0,(A,Y,Z,)),agreedNonAssignable(Z)) :- inst(x("c545-2-money",0,0,0,(A,Y,Z,))).
body(x("c545-2-money",0,0,0,(A,Y,Z,)),monetaryClaim(Z)) :- inst(x("c545-2-money",0,0,0,(A,Y,Z,))).
body(x("c545-2-money",0,0,0,(A,Y,Z,)),nonAssignableByNature(Z)) :- inst(x("c545-2-money",0,0,0,(A,Y,Z,))).
superior(x("c545-2-money",0,0,0,(A,Y,Z,)),r("c545-2-money",0,0,(A,Y,Z,))) :- inst(x("c545-2-money",0,0,0,(A,Y,Z,))).
exc(x("c545-2-money",0,0,0,(A,Y,Z,)),r("c545-2-money",0,0,(A,Y,Z,)),constitutiveRule,assignmentEffective(Z,Y)) :- inst(x("c545-2-money",0,0,0,(A,Y,Z,))).
inst(x("c545-2-money",0,0,1,(A,Y,Z,))) :- inst(r("c545-2-money",0,0,(A,Y,Z,))), cand(nonAssignableByLaw(Z)).
constitutiveRule(x("c545-2-money",0,0,1,(A,Y,Z,)),non(assignmentEffective(Z,Y))) :- inst(x("c545-2-money",0,0,1,(A,Y,Z,))).
body(x("c545-2-money",0,0,1,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(x("c545-2-money",0,0,1,(A,Y,Z,))).
body(x("c545-2-money",0,0,1,(A,Y,Z,)),agreedNonAssignable(Z)) :- inst(x("c545-2-money",0,0,1,(A,Y,Z,))).
body(x("c545-2-money",0,0,1,(A,Y,Z,)),monetaryClaim(Z)) :- inst(x("c545-2-money",0,0,1,(A,Y,Z,))).
body(x("c545-2-money",0,0,1,(A,Y,Z,)),nonAssignableByLaw(Z)) :- inst(x("c545-2-money",0,0,1,(A,Y,Z,))).
superior(x("c545-2-money",0,0,1,(A,Y,Z,)),r("c545-2-money",0,0,(A,Y,Z,))) :- inst(x("c545-2-money",0,0,1,(A,Y,Z,))).
exc(x("c545-2-money",0,0,1,(A,Y,Z,)),r("c545-2-money",0,0,(A,Y,Z,)),constitutiveRule,assignmentEffective(Z,Y)) :- inst(x("c545-2-money",0,0,1,(A,Y,Z,))).

% c545-2-goodfaith[0.0] 约定非金钱债权不得转让的，不得对抗善意第三人（第545条第2款；npc）
inst(r("c545-2-goodfaith",0,0,(A,Y,Z,))) :- cand(claimAssigned(Z,A,Y)), cand(agreedNonAssignable(Z)), cand(inGoodFaith(Y,Z)).
constitutiveRule(r("c545-2-goodfaith",0,0,(A,Y,Z,)),assignmentEffective(Z,Y)) :- inst(r("c545-2-goodfaith",0,0,(A,Y,Z,))).
mainHead(r("c545-2-goodfaith",0,0,(A,Y,Z,)),constitutiveRule,assignmentEffective(Z,Y)) :- inst(r("c545-2-goodfaith",0,0,(A,Y,Z,))).
cand(assignmentEffective(Z,Y)) :- inst(r("c545-2-goodfaith",0,0,(A,Y,Z,))).
body(r("c545-2-goodfaith",0,0,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(r("c545-2-goodfaith",0,0,(A,Y,Z,))).
body(r("c545-2-goodfaith",0,0,(A,Y,Z,)),agreedNonAssignable(Z)) :- inst(r("c545-2-goodfaith",0,0,(A,Y,Z,))).
body(r("c545-2-goodfaith",0,0,(A,Y,Z,)),inGoodFaith(Y,Z)) :- inst(r("c545-2-goodfaith",0,0,(A,Y,Z,))).
inst(x("c545-2-goodfaith",0,0,0,(A,Y,Z,))) :- inst(r("c545-2-goodfaith",0,0,(A,Y,Z,))), cand(monetaryClaim(Z)).
constitutiveRule(x("c545-2-goodfaith",0,0,0,(A,Y,Z,)),non(assignmentEffective(Z,Y))) :- inst(x("c545-2-goodfaith",0,0,0,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,0,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(x("c545-2-goodfaith",0,0,0,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,0,(A,Y,Z,)),agreedNonAssignable(Z)) :- inst(x("c545-2-goodfaith",0,0,0,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,0,(A,Y,Z,)),inGoodFaith(Y,Z)) :- inst(x("c545-2-goodfaith",0,0,0,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,0,(A,Y,Z,)),monetaryClaim(Z)) :- inst(x("c545-2-goodfaith",0,0,0,(A,Y,Z,))).
superior(x("c545-2-goodfaith",0,0,0,(A,Y,Z,)),r("c545-2-goodfaith",0,0,(A,Y,Z,))) :- inst(x("c545-2-goodfaith",0,0,0,(A,Y,Z,))).
exc(x("c545-2-goodfaith",0,0,0,(A,Y,Z,)),r("c545-2-goodfaith",0,0,(A,Y,Z,)),constitutiveRule,assignmentEffective(Z,Y)) :- inst(x("c545-2-goodfaith",0,0,0,(A,Y,Z,))).
inst(x("c545-2-goodfaith",0,0,1,(A,Y,Z,))) :- inst(r("c545-2-goodfaith",0,0,(A,Y,Z,))), cand(nonAssignableByNature(Z)).
constitutiveRule(x("c545-2-goodfaith",0,0,1,(A,Y,Z,)),non(assignmentEffective(Z,Y))) :- inst(x("c545-2-goodfaith",0,0,1,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,1,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(x("c545-2-goodfaith",0,0,1,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,1,(A,Y,Z,)),agreedNonAssignable(Z)) :- inst(x("c545-2-goodfaith",0,0,1,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,1,(A,Y,Z,)),inGoodFaith(Y,Z)) :- inst(x("c545-2-goodfaith",0,0,1,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,1,(A,Y,Z,)),nonAssignableByNature(Z)) :- inst(x("c545-2-goodfaith",0,0,1,(A,Y,Z,))).
superior(x("c545-2-goodfaith",0,0,1,(A,Y,Z,)),r("c545-2-goodfaith",0,0,(A,Y,Z,))) :- inst(x("c545-2-goodfaith",0,0,1,(A,Y,Z,))).
exc(x("c545-2-goodfaith",0,0,1,(A,Y,Z,)),r("c545-2-goodfaith",0,0,(A,Y,Z,)),constitutiveRule,assignmentEffective(Z,Y)) :- inst(x("c545-2-goodfaith",0,0,1,(A,Y,Z,))).
inst(x("c545-2-goodfaith",0,0,2,(A,Y,Z,))) :- inst(r("c545-2-goodfaith",0,0,(A,Y,Z,))), cand(nonAssignableByLaw(Z)).
constitutiveRule(x("c545-2-goodfaith",0,0,2,(A,Y,Z,)),non(assignmentEffective(Z,Y))) :- inst(x("c545-2-goodfaith",0,0,2,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,2,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(x("c545-2-goodfaith",0,0,2,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,2,(A,Y,Z,)),agreedNonAssignable(Z)) :- inst(x("c545-2-goodfaith",0,0,2,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,2,(A,Y,Z,)),inGoodFaith(Y,Z)) :- inst(x("c545-2-goodfaith",0,0,2,(A,Y,Z,))).
body(x("c545-2-goodfaith",0,0,2,(A,Y,Z,)),nonAssignableByLaw(Z)) :- inst(x("c545-2-goodfaith",0,0,2,(A,Y,Z,))).
superior(x("c545-2-goodfaith",0,0,2,(A,Y,Z,)),r("c545-2-goodfaith",0,0,(A,Y,Z,))) :- inst(x("c545-2-goodfaith",0,0,2,(A,Y,Z,))).
exc(x("c545-2-goodfaith",0,0,2,(A,Y,Z,)),r("c545-2-goodfaith",0,0,(A,Y,Z,)),constitutiveRule,assignmentEffective(Z,Y)) :- inst(x("c545-2-goodfaith",0,0,2,(A,Y,Z,))).

% c546[0.0] 债权人转让债权，未通知债务人的，该转让对债务人不发生效力（第546条第1款；npc）
inst(r("c546",0,0,(A,Y,Z,))) :- cand(assignmentEffective(Z,Y)), cand(claimAssigned(Z,A,Y)).
constitutiveRule(r("c546",0,0,(A,Y,Z,)),non(bindsDebtor(Z,Y))) :- inst(r("c546",0,0,(A,Y,Z,))).
mainHead(r("c546",0,0,(A,Y,Z,)),constitutiveRule,non(bindsDebtor(Z,Y))) :- inst(r("c546",0,0,(A,Y,Z,))).
cand(bindsDebtor(Z,Y)) :- inst(r("c546",0,0,(A,Y,Z,))).
body(r("c546",0,0,(A,Y,Z,)),assignmentEffective(Z,Y)) :- inst(r("c546",0,0,(A,Y,Z,))).
body(r("c546",0,0,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(r("c546",0,0,(A,Y,Z,))).
inst(x("c546",0,0,0,(A,Y,Z,))) :- inst(r("c546",0,0,(A,Y,Z,))), cand(debtorNotified(Z)).
constitutiveRule(x("c546",0,0,0,(A,Y,Z,)),bindsDebtor(Z,Y)) :- inst(x("c546",0,0,0,(A,Y,Z,))).
body(x("c546",0,0,0,(A,Y,Z,)),assignmentEffective(Z,Y)) :- inst(x("c546",0,0,0,(A,Y,Z,))).
body(x("c546",0,0,0,(A,Y,Z,)),claimAssigned(Z,A,Y)) :- inst(x("c546",0,0,0,(A,Y,Z,))).
body(x("c546",0,0,0,(A,Y,Z,)),debtorNotified(Z)) :- inst(x("c546",0,0,0,(A,Y,Z,))).
superior(x("c546",0,0,0,(A,Y,Z,)),r("c546",0,0,(A,Y,Z,))) :- inst(x("c546",0,0,0,(A,Y,Z,))).
exc(x("c546",0,0,0,(A,Y,Z,)),r("c546",0,0,(A,Y,Z,)),constitutiveRule,non(bindsDebtor(Z,Y))) :- inst(x("c546",0,0,0,(A,Y,Z,))).

% c546-def[0.0] 通知债务人后，转让对债务人发生效力（第546条第1款；npc）
inst(r("c546-def",0,0,(Y,Z,))) :- cand(assignmentEffective(Z,Y)), cand(debtorNotified(Z)).
constitutiveRule(r("c546-def",0,0,(Y,Z,)),bindsDebtor(Z,Y)) :- inst(r("c546-def",0,0,(Y,Z,))).
mainHead(r("c546-def",0,0,(Y,Z,)),constitutiveRule,bindsDebtor(Z,Y)) :- inst(r("c546-def",0,0,(Y,Z,))).
cand(bindsDebtor(Z,Y)) :- inst(r("c546-def",0,0,(Y,Z,))).
body(r("c546-def",0,0,(Y,Z,)),assignmentEffective(Z,Y)) :- inst(r("c546-def",0,0,(Y,Z,))).
body(r("c546-def",0,0,(Y,Z,)),debtorNotified(Z)) :- inst(r("c546-def",0,0,(Y,Z,))).

% tx-g4477[0.0] 分类（自动抽取自图的层级）：免责的债务承担 ⊑ 债务承担
inst(r("tx-g4477",0,0,(X,))) :- cand(isA(X,"免责的债务承担")).
constitutiveRule(r("tx-g4477",0,0,(X,)),isA(X,"债务承担")) :- inst(r("tx-g4477",0,0,(X,))).
mainHead(r("tx-g4477",0,0,(X,)),constitutiveRule,isA(X,"债务承担")) :- inst(r("tx-g4477",0,0,(X,))).
cand(isA(X,"债务承担")) :- inst(r("tx-g4477",0,0,(X,))).
body(r("tx-g4477",0,0,(X,)),isA(X,"免责的债务承担")) :- inst(r("tx-g4477",0,0,(X,))).

% tx-g4496[0.0] 分类（自动抽取自图的层级）：并存的债务承担 ⊑ 债务承担
inst(r("tx-g4496",0,0,(X,))) :- cand(isA(X,"并存的债务承担")).
constitutiveRule(r("tx-g4496",0,0,(X,)),isA(X,"债务承担")) :- inst(r("tx-g4496",0,0,(X,))).
mainHead(r("tx-g4496",0,0,(X,)),constitutiveRule,isA(X,"债务承担")) :- inst(r("tx-g4496",0,0,(X,))).
cand(isA(X,"债务承担")) :- inst(r("tx-g4496",0,0,(X,))).
body(r("tx-g4496",0,0,(X,)),isA(X,"并存的债务承担")) :- inst(r("tx-g4496",0,0,(X,))).

% c551[0.0] 债务人将债务转移给第三人的，应当经债权人同意（第551条；npc）
inst(r("c551",0,0,(D,T,Z,))) :- cand(debtTransfer(Z,D,T)).
constitutiveRule(r("c551",0,0,(D,T,Z,)),non(debtTransferEffective(Z))) :- inst(r("c551",0,0,(D,T,Z,))).
mainHead(r("c551",0,0,(D,T,Z,)),constitutiveRule,non(debtTransferEffective(Z))) :- inst(r("c551",0,0,(D,T,Z,))).
cand(debtTransferEffective(Z)) :- inst(r("c551",0,0,(D,T,Z,))).
body(r("c551",0,0,(D,T,Z,)),debtTransfer(Z,D,T)) :- inst(r("c551",0,0,(D,T,Z,))).
inst(x("c551",0,0,0,(D,T,Z,))) :- inst(r("c551",0,0,(D,T,Z,))), cand(creditorConsents(Z)).
constitutiveRule(x("c551",0,0,0,(D,T,Z,)),debtTransferEffective(Z)) :- inst(x("c551",0,0,0,(D,T,Z,))).
body(x("c551",0,0,0,(D,T,Z,)),debtTransfer(Z,D,T)) :- inst(x("c551",0,0,0,(D,T,Z,))).
body(x("c551",0,0,0,(D,T,Z,)),creditorConsents(Z)) :- inst(x("c551",0,0,0,(D,T,Z,))).
superior(x("c551",0,0,0,(D,T,Z,)),r("c551",0,0,(D,T,Z,))) :- inst(x("c551",0,0,0,(D,T,Z,))).
exc(x("c551",0,0,0,(D,T,Z,)),r("c551",0,0,(D,T,Z,)),constitutiveRule,non(debtTransferEffective(Z))) :- inst(x("c551",0,0,0,(D,T,Z,))).

% c551-ok[0.0] 经债权人同意的，债务转移有效（第551条第1款；npc）
inst(r("c551-ok",0,0,(D,T,Z,))) :- cand(debtTransfer(Z,D,T)), cand(creditorConsents(Z)).
constitutiveRule(r("c551-ok",0,0,(D,T,Z,)),debtTransferEffective(Z)) :- inst(r("c551-ok",0,0,(D,T,Z,))).
mainHead(r("c551-ok",0,0,(D,T,Z,)),constitutiveRule,debtTransferEffective(Z)) :- inst(r("c551-ok",0,0,(D,T,Z,))).
cand(debtTransferEffective(Z)) :- inst(r("c551-ok",0,0,(D,T,Z,))).
body(r("c551-ok",0,0,(D,T,Z,)),debtTransfer(Z,D,T)) :- inst(r("c551-ok",0,0,(D,T,Z,))).
body(r("c551-ok",0,0,(D,T,Z,)),creditorConsents(Z)) :- inst(r("c551-ok",0,0,(D,T,Z,))).

% c551-2[0.0] 催告后债权人未作表示的，视为不同意（第551条第2款；npc）
inst(r("c551-2",0,0,(D,T,Z,))) :- cand(debtTransfer(Z,D,T)), cand(demandedConsent(Z)), cand(creditorSilent(Z)).
constitutiveRule(r("c551-2",0,0,(D,T,Z,)),non(creditorConsents(Z))) :- inst(r("c551-2",0,0,(D,T,Z,))).
mainHead(r("c551-2",0,0,(D,T,Z,)),constitutiveRule,non(creditorConsents(Z))) :- inst(r("c551-2",0,0,(D,T,Z,))).
cand(creditorConsents(Z)) :- inst(r("c551-2",0,0,(D,T,Z,))).
body(r("c551-2",0,0,(D,T,Z,)),debtTransfer(Z,D,T)) :- inst(r("c551-2",0,0,(D,T,Z,))).
body(r("c551-2",0,0,(D,T,Z,)),demandedConsent(Z)) :- inst(r("c551-2",0,0,(D,T,Z,))).
body(r("c551-2",0,0,(D,T,Z,)),creditorSilent(Z)) :- inst(r("c551-2",0,0,(D,T,Z,))).

% tx-g4593[0.0] 分类（自动抽取自图的层级）：约定解除 ⊑ 单方解除
inst(r("tx-g4593",0,0,(X,))) :- cand(isA(X,"约定解除")).
constitutiveRule(r("tx-g4593",0,0,(X,)),isA(X,"单方解除")) :- inst(r("tx-g4593",0,0,(X,))).
mainHead(r("tx-g4593",0,0,(X,)),constitutiveRule,isA(X,"单方解除")) :- inst(r("tx-g4593",0,0,(X,))).
cand(isA(X,"单方解除")) :- inst(r("tx-g4593",0,0,(X,))).
body(r("tx-g4593",0,0,(X,)),isA(X,"约定解除")) :- inst(r("tx-g4593",0,0,(X,))).

% tx-g4596[0.0] 分类（自动抽取自图的层级）：法定解除 ⊑ 单方解除
inst(r("tx-g4596",0,0,(X,))) :- cand(isA(X,"法定解除")).
constitutiveRule(r("tx-g4596",0,0,(X,)),isA(X,"单方解除")) :- inst(r("tx-g4596",0,0,(X,))).
mainHead(r("tx-g4596",0,0,(X,)),constitutiveRule,isA(X,"单方解除")) :- inst(r("tx-g4596",0,0,(X,))).
cand(isA(X,"单方解除")) :- inst(r("tx-g4596",0,0,(X,))).
body(r("tx-g4596",0,0,(X,)),isA(X,"法定解除")) :- inst(r("tx-g4596",0,0,(X,))).

% c585-3[0.0] 就迟延履行约定违约金的，违约方支付违约金后，还应当履行债务（第585条第3款；npc）
inst(r("c585-3",0,0,(A,K,))) :- cand(liquidatedDamagesForDelay(K)), cand(breachingParty(A,K)), cand(paidLD(A,K)).
prescriptiveRule(r("c585-3",0,0,(A,K,)),stillPerform(A,K)) :- inst(r("c585-3",0,0,(A,K,))).
mainHead(r("c585-3",0,0,(A,K,)),prescriptiveRule,stillPerform(A,K)) :- inst(r("c585-3",0,0,(A,K,))).
cand(stillPerform(A,K)) :- inst(r("c585-3",0,0,(A,K,))).
body(r("c585-3",0,0,(A,K,)),liquidatedDamagesForDelay(K)) :- inst(r("c585-3",0,0,(A,K,))).
body(r("c585-3",0,0,(A,K,)),breachingParty(A,K)) :- inst(r("c585-3",0,0,(A,K,))).
body(r("c585-3",0,0,(A,K,)),paidLD(A,K)) :- inst(r("c585-3",0,0,(A,K,))).

% c585-reduce[0.0] 约定的违约金过分高于造成的损失的，可以根据当事人的请求予以适当减少（第585条第2款；npc）
inst(r("c585-reduce",0,0,(K,))) :- cand(liquidatedDamages(K)), cand(excessivelyHigherThanLoss(K)), cand(partyRequestsAdjustment(K)).
constitutiveRule(r("c585-reduce",0,0,(K,)),courtMayReduceLD(K)) :- inst(r("c585-reduce",0,0,(K,))).
mainHead(r("c585-reduce",0,0,(K,)),constitutiveRule,courtMayReduceLD(K)) :- inst(r("c585-reduce",0,0,(K,))).
cand(courtMayReduceLD(K)) :- inst(r("c585-reduce",0,0,(K,))).
body(r("c585-reduce",0,0,(K,)),liquidatedDamages(K)) :- inst(r("c585-reduce",0,0,(K,))).
body(r("c585-reduce",0,0,(K,)),excessivelyHigherThanLoss(K)) :- inst(r("c585-reduce",0,0,(K,))).
body(r("c585-reduce",0,0,(K,)),partyRequestsAdjustment(K)) :- inst(r("c585-reduce",0,0,(K,))).

% c585-increase[0.0] 约定的违约金低于造成的损失的，可以根据当事人的请求予以增加（第585条第2款；npc）
inst(r("c585-increase",0,0,(K,))) :- cand(liquidatedDamages(K)), cand(lowerThanLoss(K)), cand(partyRequestsAdjustment(K)).
constitutiveRule(r("c585-increase",0,0,(K,)),courtMayIncreaseLD(K)) :- inst(r("c585-increase",0,0,(K,))).
mainHead(r("c585-increase",0,0,(K,)),constitutiveRule,courtMayIncreaseLD(K)) :- inst(r("c585-increase",0,0,(K,))).
cand(courtMayIncreaseLD(K)) :- inst(r("c585-increase",0,0,(K,))).
body(r("c585-increase",0,0,(K,)),liquidatedDamages(K)) :- inst(r("c585-increase",0,0,(K,))).
body(r("c585-increase",0,0,(K,)),lowerThanLoss(K)) :- inst(r("c585-increase",0,0,(K,))).
body(r("c585-increase",0,0,(K,)),partyRequestsAdjustment(K)) :- inst(r("c585-increase",0,0,(K,))).

% c586[0.0] 定金合同自实际交付定金时成立（实践合同）（第586条第1款；npc）
inst(r("c586",0,0,(K,))) :- cand(depositAgreed(K)), cand(depositActuallyPaid(K)).
constitutiveRule(r("c586",0,0,(K,)),depositContractFormed(K)) :- inst(r("c586",0,0,(K,))).
mainHead(r("c586",0,0,(K,)),constitutiveRule,depositContractFormed(K)) :- inst(r("c586",0,0,(K,))).
cand(depositContractFormed(K)) :- inst(r("c586",0,0,(K,))).
body(r("c586",0,0,(K,)),depositAgreed(K)) :- inst(r("c586",0,0,(K,))).
body(r("c586",0,0,(K,)),depositActuallyPaid(K)) :- inst(r("c586",0,0,(K,))).

% c586-cap[0.0] 定金不得超过主合同标的额的百分之二十，超过部分不产生定金的效力（第586条第2款；npc）
inst(r("c586-cap",0,0,(K,))) :- cand(depositContractFormed(K)), cand(exceeds20PercentOfSubject(K)).
constitutiveRule(r("c586-cap",0,0,(K,)),excessNotDeposit(K)) :- inst(r("c586-cap",0,0,(K,))).
mainHead(r("c586-cap",0,0,(K,)),constitutiveRule,excessNotDeposit(K)) :- inst(r("c586-cap",0,0,(K,))).
cand(excessNotDeposit(K)) :- inst(r("c586-cap",0,0,(K,))).
body(r("c586-cap",0,0,(K,)),depositContractFormed(K)) :- inst(r("c586-cap",0,0,(K,))).
body(r("c586-cap",0,0,(K,)),exceeds20PercentOfSubject(K)) :- inst(r("c586-cap",0,0,(K,))).

% c587-payer[0.0] 给付定金的一方根本违约的，无权请求返还定金（第587条；npc）
inst(r("c587-payer",0,0,(A,K,))) :- cand(depositContractFormed(K)), cand(depositPayer(A,K)), cand(breachFrustratesPurpose(A,K)).
constitutiveRule(r("c587-payer",0,0,(A,K,)),non(depositRefundClaim(A,K))) :- inst(r("c587-payer",0,0,(A,K,))).
mainHead(r("c587-payer",0,0,(A,K,)),constitutiveRule,non(depositRefundClaim(A,K))) :- inst(r("c587-payer",0,0,(A,K,))).
cand(depositRefundClaim(A,K)) :- inst(r("c587-payer",0,0,(A,K,))).
body(r("c587-payer",0,0,(A,K,)),depositContractFormed(K)) :- inst(r("c587-payer",0,0,(A,K,))).
body(r("c587-payer",0,0,(A,K,)),depositPayer(A,K)) :- inst(r("c587-payer",0,0,(A,K,))).
body(r("c587-payer",0,0,(A,K,)),breachFrustratesPurpose(A,K)) :- inst(r("c587-payer",0,0,(A,K,))).

% c587-receiver[0.0] 收受定金的一方根本违约的，应当双倍返还定金（第587条；npc）
inst(r("c587-receiver",0,0,(A,B,K,))) :- cand(depositContractFormed(K)), cand(depositReceiver(B,K)), cand(depositPayer(A,K)), cand(breachFrustratesPurpose(B,K)).
prescriptiveRule(r("c587-receiver",0,0,(A,B,K,)),returnDoubleDeposit(B,A,K)) :- inst(r("c587-receiver",0,0,(A,B,K,))).
mainHead(r("c587-receiver",0,0,(A,B,K,)),prescriptiveRule,returnDoubleDeposit(B,A,K)) :- inst(r("c587-receiver",0,0,(A,B,K,))).
cand(returnDoubleDeposit(B,A,K)) :- inst(r("c587-receiver",0,0,(A,B,K,))).
body(r("c587-receiver",0,0,(A,B,K,)),depositContractFormed(K)) :- inst(r("c587-receiver",0,0,(A,B,K,))).
body(r("c587-receiver",0,0,(A,B,K,)),depositReceiver(B,K)) :- inst(r("c587-receiver",0,0,(A,B,K,))).
body(r("c587-receiver",0,0,(A,B,K,)),depositPayer(A,K)) :- inst(r("c587-receiver",0,0,(A,B,K,))).
body(r("c587-receiver",0,0,(A,B,K,)),breachFrustratesPurpose(B,K)) :- inst(r("c587-receiver",0,0,(A,B,K,))).

% c588-choice[0.0] 既约定违约金又约定定金的，对方可以选择适用违约金或者定金条款（第588条第1款；npc）
inst(r("c588-choice",0,0,(A,K,))) :- cand(liquidatedDamages(K)), cand(depositContractFormed(K)), cand(nonBreachingParty(A,K)).
constitutiveRule(r("c588-choice",0,0,(A,K,)),chooseLDOrDeposit(A,K)) :- inst(r("c588-choice",0,0,(A,K,))).
mainHead(r("c588-choice",0,0,(A,K,)),constitutiveRule,chooseLDOrDeposit(A,K)) :- inst(r("c588-choice",0,0,(A,K,))).
cand(chooseLDOrDeposit(A,K)) :- inst(r("c588-choice",0,0,(A,K,))).
body(r("c588-choice",0,0,(A,K,)),liquidatedDamages(K)) :- inst(r("c588-choice",0,0,(A,K,))).
body(r("c588-choice",0,0,(A,K,)),depositContractFormed(K)) :- inst(r("c588-choice",0,0,(A,K,))).
body(r("c588-choice",0,0,(A,K,)),nonBreachingParty(A,K)) :- inst(r("c588-choice",0,0,(A,K,))).

% c588-nocumul[0.0] 违约金与定金不能并用（第588条“选择适用”）（第588条第1款；doctrine）
inst(r("c588-nocumul",0,0,(A,K,))) :- cand(liquidatedDamages(K)), cand(depositContractFormed(K)), cand(nonBreachingParty(A,K)).
prescriptiveRule(r("c588-nocumul",0,0,(A,K,)),non(claimBothLDAndDeposit(A,K))) :- inst(r("c588-nocumul",0,0,(A,K,))).
mainHead(r("c588-nocumul",0,0,(A,K,)),prescriptiveRule,non(claimBothLDAndDeposit(A,K))) :- inst(r("c588-nocumul",0,0,(A,K,))).
cand(claimBothLDAndDeposit(A,K)) :- inst(r("c588-nocumul",0,0,(A,K,))).
body(r("c588-nocumul",0,0,(A,K,)),liquidatedDamages(K)) :- inst(r("c588-nocumul",0,0,(A,K,))).
body(r("c588-nocumul",0,0,(A,K,)),depositContractFormed(K)) :- inst(r("c588-nocumul",0,0,(A,K,))).
body(r("c588-nocumul",0,0,(A,K,)),nonBreachingParty(A,K)) :- inst(r("c588-nocumul",0,0,(A,K,))).

% tx-g4889[0.0] 分类（自动抽取自图的层级）：权利瑕疵担保 ⊑ 瑕疵担保
inst(r("tx-g4889",0,0,(X,))) :- cand(isA(X,"权利瑕疵担保")).
constitutiveRule(r("tx-g4889",0,0,(X,)),isA(X,"瑕疵担保")) :- inst(r("tx-g4889",0,0,(X,))).
mainHead(r("tx-g4889",0,0,(X,)),constitutiveRule,isA(X,"瑕疵担保")) :- inst(r("tx-g4889",0,0,(X,))).
cand(isA(X,"瑕疵担保")) :- inst(r("tx-g4889",0,0,(X,))).
body(r("tx-g4889",0,0,(X,)),isA(X,"权利瑕疵担保")) :- inst(r("tx-g4889",0,0,(X,))).

% tx-g4897[0.0] 分类（自动抽取自图的层级）：质量瑕疵担保 ⊑ 瑕疵担保
inst(r("tx-g4897",0,0,(X,))) :- cand(isA(X,"质量瑕疵担保")).
constitutiveRule(r("tx-g4897",0,0,(X,)),isA(X,"瑕疵担保")) :- inst(r("tx-g4897",0,0,(X,))).
mainHead(r("tx-g4897",0,0,(X,)),constitutiveRule,isA(X,"瑕疵担保")) :- inst(r("tx-g4897",0,0,(X,))).
cand(isA(X,"瑕疵担保")) :- inst(r("tx-g4897",0,0,(X,))).
body(r("tx-g4897",0,0,(X,)),isA(X,"质量瑕疵担保")) :- inst(r("tx-g4897",0,0,(X,))).

% c604-before[0.0] 标的物风险在交付之前由出卖人承担（第604条；npc）
inst(r("c604-before",0,0,(B,K,S,T,))) :- cand(sale(K,S,B,T)).
constitutiveRule(r("c604-before",0,0,(B,K,S,T,)),non(riskOnBuyer(K))) :- inst(r("c604-before",0,0,(B,K,S,T,))).
mainHead(r("c604-before",0,0,(B,K,S,T,)),constitutiveRule,non(riskOnBuyer(K))) :- inst(r("c604-before",0,0,(B,K,S,T,))).
cand(riskOnBuyer(K)) :- inst(r("c604-before",0,0,(B,K,S,T,))).
body(r("c604-before",0,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(r("c604-before",0,0,(B,K,S,T,))).
inst(x("c604-before",0,0,0,(B,K,S,T,))) :- inst(r("c604-before",0,0,(B,K,S,T,))), cand(delivered(K)).
constitutiveRule(x("c604-before",0,0,0,(B,K,S,T,)),riskOnBuyer(K)) :- inst(x("c604-before",0,0,0,(B,K,S,T,))).
body(x("c604-before",0,0,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(x("c604-before",0,0,0,(B,K,S,T,))).
body(x("c604-before",0,0,0,(B,K,S,T,)),delivered(K)) :- inst(x("c604-before",0,0,0,(B,K,S,T,))).
superior(x("c604-before",0,0,0,(B,K,S,T,)),r("c604-before",0,0,(B,K,S,T,))) :- inst(x("c604-before",0,0,0,(B,K,S,T,))).
exc(x("c604-before",0,0,0,(B,K,S,T,)),r("c604-before",0,0,(B,K,S,T,)),constitutiveRule,non(riskOnBuyer(K))) :- inst(x("c604-before",0,0,0,(B,K,S,T,))).

% c604-after[0.0] 交付之后由买受人承担（第604条；npc）
inst(r("c604-after",0,0,(B,K,S,T,))) :- cand(sale(K,S,B,T)), cand(delivered(K)).
constitutiveRule(r("c604-after",0,0,(B,K,S,T,)),riskOnBuyer(K)) :- inst(r("c604-after",0,0,(B,K,S,T,))).
mainHead(r("c604-after",0,0,(B,K,S,T,)),constitutiveRule,riskOnBuyer(K)) :- inst(r("c604-after",0,0,(B,K,S,T,))).
cand(riskOnBuyer(K)) :- inst(r("c604-after",0,0,(B,K,S,T,))).
body(r("c604-after",0,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(r("c604-after",0,0,(B,K,S,T,))).
body(r("c604-after",0,0,(B,K,S,T,)),delivered(K)) :- inst(r("c604-after",0,0,(B,K,S,T,))).

% c605[0.0] 因买受人原因致使标的物未按约定期限交付的，买受人自违反约定时起承担风险（第605条；npc）
inst(r("c605",0,0,(B,K,S,T,))) :- cand(sale(K,S,B,T)), cand(buyerCausedDeliveryDelay(K)).
constitutiveRule(r("c605",0,0,(B,K,S,T,)),riskOnBuyer(K)) :- inst(r("c605",0,0,(B,K,S,T,))).
mainHead(r("c605",0,0,(B,K,S,T,)),constitutiveRule,riskOnBuyer(K)) :- inst(r("c605",0,0,(B,K,S,T,))).
cand(riskOnBuyer(K)) :- inst(r("c605",0,0,(B,K,S,T,))).
body(r("c605",0,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(r("c605",0,0,(B,K,S,T,))).
body(r("c605",0,0,(B,K,S,T,)),buyerCausedDeliveryDelay(K)) :- inst(r("c605",0,0,(B,K,S,T,))).

% c607-1[0.0] 按约定运送至买受人指定地点并交付承运人后，风险由买受人承担（第607条第1款；npc）
inst(r("c607-1",0,0,(B,K,S,T,))) :- cand(sale(K,S,B,T)), cand(carriageToBuyerDesignatedPlace(K)), cand(handedToCarrier(K)).
constitutiveRule(r("c607-1",0,0,(B,K,S,T,)),riskOnBuyer(K)) :- inst(r("c607-1",0,0,(B,K,S,T,))).
mainHead(r("c607-1",0,0,(B,K,S,T,)),constitutiveRule,riskOnBuyer(K)) :- inst(r("c607-1",0,0,(B,K,S,T,))).
cand(riskOnBuyer(K)) :- inst(r("c607-1",0,0,(B,K,S,T,))).
body(r("c607-1",0,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(r("c607-1",0,0,(B,K,S,T,))).
body(r("c607-1",0,0,(B,K,S,T,)),carriageToBuyerDesignatedPlace(K)) :- inst(r("c607-1",0,0,(B,K,S,T,))).
body(r("c607-1",0,0,(B,K,S,T,)),handedToCarrier(K)) :- inst(r("c607-1",0,0,(B,K,S,T,))).

% c607-2[0.0] 没有约定交付地点、需要运输的，交付给第一承运人后风险由买受人承担（第607条第2款；npc）
inst(r("c607-2",0,0,(B,K,S,T,))) :- cand(sale(K,S,B,T)), cand(noAgreedDeliveryPlace(K)), cand(needsCarriage(K)), cand(handedToFirstCarrier(K)).
constitutiveRule(r("c607-2",0,0,(B,K,S,T,)),riskOnBuyer(K)) :- inst(r("c607-2",0,0,(B,K,S,T,))).
mainHead(r("c607-2",0,0,(B,K,S,T,)),constitutiveRule,riskOnBuyer(K)) :- inst(r("c607-2",0,0,(B,K,S,T,))).
cand(riskOnBuyer(K)) :- inst(r("c607-2",0,0,(B,K,S,T,))).
body(r("c607-2",0,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(r("c607-2",0,0,(B,K,S,T,))).
body(r("c607-2",0,0,(B,K,S,T,)),noAgreedDeliveryPlace(K)) :- inst(r("c607-2",0,0,(B,K,S,T,))).
body(r("c607-2",0,0,(B,K,S,T,)),needsCarriage(K)) :- inst(r("c607-2",0,0,(B,K,S,T,))).
body(r("c607-2",0,0,(B,K,S,T,)),handedToFirstCarrier(K)) :- inst(r("c607-2",0,0,(B,K,S,T,))).

% c608[0.0] 置于交付地点，买受人违反约定没有收取的，风险自违反约定时起由买受人承担（第608条；npc）
inst(r("c608",0,0,(B,K,S,T,))) :- cand(sale(K,S,B,T)), cand(placedAtDeliveryPoint(K)), cand(buyerFailedToCollect(K)).
constitutiveRule(r("c608",0,0,(B,K,S,T,)),riskOnBuyer(K)) :- inst(r("c608",0,0,(B,K,S,T,))).
mainHead(r("c608",0,0,(B,K,S,T,)),constitutiveRule,riskOnBuyer(K)) :- inst(r("c608",0,0,(B,K,S,T,))).
cand(riskOnBuyer(K)) :- inst(r("c608",0,0,(B,K,S,T,))).
body(r("c608",0,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(r("c608",0,0,(B,K,S,T,))).
body(r("c608",0,0,(B,K,S,T,)),placedAtDeliveryPoint(K)) :- inst(r("c608",0,0,(B,K,S,T,))).
body(r("c608",0,0,(B,K,S,T,)),buyerFailedToCollect(K)) :- inst(r("c608",0,0,(B,K,S,T,))).

% c610[0.0] 因质量不符致不能实现合同目的，买受人拒收或解除合同的，风险由出卖人承担（第610条；npc）
inst(r("c610",0,0,(B,K,S,T,))) :- cand(sale(K,S,B,T)), cand(qualityDefectFrustratesPurpose(K)), cand(buyerRejectsGoods(K)).
constitutiveRule(r("c610",0,0,(B,K,S,T,)),non(riskOnBuyer(K))) :- inst(r("c610",0,0,(B,K,S,T,))).
mainHead(r("c610",0,0,(B,K,S,T,)),constitutiveRule,non(riskOnBuyer(K))) :- inst(r("c610",0,0,(B,K,S,T,))).
cand(riskOnBuyer(K)) :- inst(r("c610",0,0,(B,K,S,T,))).
body(r("c610",0,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(r("c610",0,0,(B,K,S,T,))).
body(r("c610",0,0,(B,K,S,T,)),qualityDefectFrustratesPurpose(K)) :- inst(r("c610",0,0,(B,K,S,T,))).
body(r("c610",0,0,(B,K,S,T,)),buyerRejectsGoods(K)) :- inst(r("c610",0,0,(B,K,S,T,))).
% c610[1.0] 因质量不符致不能实现合同目的，买受人拒收或解除合同的，风险由出卖人承担（第610条；npc）
inst(r("c610",1,0,(B,K,S,T,))) :- cand(sale(K,S,B,T)), cand(qualityDefectFrustratesPurpose(K)), cand(buyerTerminates(K)).
constitutiveRule(r("c610",1,0,(B,K,S,T,)),non(riskOnBuyer(K))) :- inst(r("c610",1,0,(B,K,S,T,))).
mainHead(r("c610",1,0,(B,K,S,T,)),constitutiveRule,non(riskOnBuyer(K))) :- inst(r("c610",1,0,(B,K,S,T,))).
cand(riskOnBuyer(K)) :- inst(r("c610",1,0,(B,K,S,T,))).
body(r("c610",1,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(r("c610",1,0,(B,K,S,T,))).
body(r("c610",1,0,(B,K,S,T,)),qualityDefectFrustratesPurpose(K)) :- inst(r("c610",1,0,(B,K,S,T,))).
body(r("c610",1,0,(B,K,S,T,)),buyerTerminates(K)) :- inst(r("c610",1,0,(B,K,S,T,))).

% c604-agreed[0.0] 当事人另有约定的除外（第604条；npc）
inst(r("c604-agreed",0,0,(B,K,S,T,))) :- cand(sale(K,S,B,T)), cand(riskAgreedOnSeller(K)).
constitutiveRule(r("c604-agreed",0,0,(B,K,S,T,)),non(riskOnBuyer(K))) :- inst(r("c604-agreed",0,0,(B,K,S,T,))).
mainHead(r("c604-agreed",0,0,(B,K,S,T,)),constitutiveRule,non(riskOnBuyer(K))) :- inst(r("c604-agreed",0,0,(B,K,S,T,))).
cand(riskOnBuyer(K)) :- inst(r("c604-agreed",0,0,(B,K,S,T,))).
body(r("c604-agreed",0,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(r("c604-agreed",0,0,(B,K,S,T,))).
body(r("c604-agreed",0,0,(B,K,S,T,)),riskAgreedOnSeller(K)) :- inst(r("c604-agreed",0,0,(B,K,S,T,))).

% c226-delivery[0.0] 买受人已经占有标的物的（如借用、租赁中买下），买卖合同生效时视为交付（简易交付），风险随之转移（第226条、第604条；doctrine）
inst(r("c226-delivery",0,0,(B,K,S,T,))) :- cand(sale(K,S,B,T)), cand(buyerAlreadyPossesses(B,T)).
constitutiveRule(r("c226-delivery",0,0,(B,K,S,T,)),delivered(K)) :- inst(r("c226-delivery",0,0,(B,K,S,T,))).
mainHead(r("c226-delivery",0,0,(B,K,S,T,)),constitutiveRule,delivered(K)) :- inst(r("c226-delivery",0,0,(B,K,S,T,))).
cand(delivered(K)) :- inst(r("c226-delivery",0,0,(B,K,S,T,))).
body(r("c226-delivery",0,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(r("c226-delivery",0,0,(B,K,S,T,))).
body(r("c226-delivery",0,0,(B,K,S,T,)),buyerAlreadyPossesses(B,T)) :- inst(r("c226-delivery",0,0,(B,K,S,T,))).

% c604-price[0.0] 风险由买受人承担的，标的物意外毁损灭失后，买受人仍须支付价款（第604条；doctrine）
inst(r("c604-price",0,0,(B,K,S,T,))) :- cand(sale(K,S,B,T)), cand(riskOnBuyer(K)), cand(goodsPerished(K)).
prescriptiveRule(r("c604-price",0,0,(B,K,S,T,)),payPrice(B,S,K)) :- inst(r("c604-price",0,0,(B,K,S,T,))).
mainHead(r("c604-price",0,0,(B,K,S,T,)),prescriptiveRule,payPrice(B,S,K)) :- inst(r("c604-price",0,0,(B,K,S,T,))).
cand(payPrice(B,S,K)) :- inst(r("c604-price",0,0,(B,K,S,T,))).
body(r("c604-price",0,0,(B,K,S,T,)),sale(K,S,B,T)) :- inst(r("c604-price",0,0,(B,K,S,T,))).
body(r("c604-price",0,0,(B,K,S,T,)),riskOnBuyer(K)) :- inst(r("c604-price",0,0,(B,K,S,T,))).
body(r("c604-price",0,0,(B,K,S,T,)),goodsPerished(K)) :- inst(r("c604-price",0,0,(B,K,S,T,))).

% tx-g5143[0.0] 分类（自动抽取自图的层级）：提供真实情况的义务 ⊑ 借款人的主要义务
inst(r("tx-g5143",0,0,(X,))) :- cand(isA(X,"提供真实情况的义务")).
constitutiveRule(r("tx-g5143",0,0,(X,)),isA(X,"借款人的主要义务")) :- inst(r("tx-g5143",0,0,(X,))).
mainHead(r("tx-g5143",0,0,(X,)),constitutiveRule,isA(X,"借款人的主要义务")) :- inst(r("tx-g5143",0,0,(X,))).
cand(isA(X,"借款人的主要义务")) :- inst(r("tx-g5143",0,0,(X,))).
body(r("tx-g5143",0,0,(X,)),isA(X,"提供真实情况的义务")) :- inst(r("tx-g5143",0,0,(X,))).

% tx-g5149[0.0] 分类（自动抽取自图的层级）：按期支付利息的义务 ⊑ 借款人的主要义务
inst(r("tx-g5149",0,0,(X,))) :- cand(isA(X,"按期支付利息的义务")).
constitutiveRule(r("tx-g5149",0,0,(X,)),isA(X,"借款人的主要义务")) :- inst(r("tx-g5149",0,0,(X,))).
mainHead(r("tx-g5149",0,0,(X,)),constitutiveRule,isA(X,"借款人的主要义务")) :- inst(r("tx-g5149",0,0,(X,))).
cand(isA(X,"借款人的主要义务")) :- inst(r("tx-g5149",0,0,(X,))).
body(r("tx-g5149",0,0,(X,)),isA(X,"按期支付利息的义务")) :- inst(r("tx-g5149",0,0,(X,))).

% tx-g5151[0.0] 分类（自动抽取自图的层级）：按期返还借款的义务 ⊑ 借款人的主要义务
inst(r("tx-g5151",0,0,(X,))) :- cand(isA(X,"按期返还借款的义务")).
constitutiveRule(r("tx-g5151",0,0,(X,)),isA(X,"借款人的主要义务")) :- inst(r("tx-g5151",0,0,(X,))).
mainHead(r("tx-g5151",0,0,(X,)),constitutiveRule,isA(X,"借款人的主要义务")) :- inst(r("tx-g5151",0,0,(X,))).
cand(isA(X,"借款人的主要义务")) :- inst(r("tx-g5151",0,0,(X,))).
body(r("tx-g5151",0,0,(X,)),isA(X,"按期返还借款的义务")) :- inst(r("tx-g5151",0,0,(X,))).

% tx-g5287[0.0] 分类（自动抽取自图的层级）：适租义务 ⊑ 出租人的义务
inst(r("tx-g5287",0,0,(X,))) :- cand(isA(X,"适租义务")).
constitutiveRule(r("tx-g5287",0,0,(X,)),isA(X,"出租人的义务")) :- inst(r("tx-g5287",0,0,(X,))).
mainHead(r("tx-g5287",0,0,(X,)),constitutiveRule,isA(X,"出租人的义务")) :- inst(r("tx-g5287",0,0,(X,))).
cand(isA(X,"出租人的义务")) :- inst(r("tx-g5287",0,0,(X,))).
body(r("tx-g5287",0,0,(X,)),isA(X,"适租义务")) :- inst(r("tx-g5287",0,0,(X,))).

% tx-g5289[0.0] 分类（自动抽取自图的层级）：瑕疵担保义务 ⊑ 出租人的义务
inst(r("tx-g5289",0,0,(X,))) :- cand(isA(X,"瑕疵担保义务")).
constitutiveRule(r("tx-g5289",0,0,(X,)),isA(X,"出租人的义务")) :- inst(r("tx-g5289",0,0,(X,))).
mainHead(r("tx-g5289",0,0,(X,)),constitutiveRule,isA(X,"出租人的义务")) :- inst(r("tx-g5289",0,0,(X,))).
cand(isA(X,"出租人的义务")) :- inst(r("tx-g5289",0,0,(X,))).
body(r("tx-g5289",0,0,(X,)),isA(X,"瑕疵担保义务")) :- inst(r("tx-g5289",0,0,(X,))).

% tx-g5291[0.0] 分类（自动抽取自图的层级）：维修义务 ⊑ 出租人的义务
inst(r("tx-g5291",0,0,(X,))) :- cand(isA(X,"维修义务")).
constitutiveRule(r("tx-g5291",0,0,(X,)),isA(X,"出租人的义务")) :- inst(r("tx-g5291",0,0,(X,))).
mainHead(r("tx-g5291",0,0,(X,)),constitutiveRule,isA(X,"出租人的义务")) :- inst(r("tx-g5291",0,0,(X,))).
cand(isA(X,"出租人的义务")) :- inst(r("tx-g5291",0,0,(X,))).
body(r("tx-g5291",0,0,(X,)),isA(X,"维修义务")) :- inst(r("tx-g5291",0,0,(X,))).

% c725[0.0] 承租人依约占有期间租赁物所有权变动的，不影响租赁合同的效力（第725条；npc）
inst(r("c725",0,0,(L,T,))) :- cand(leaseOf(L,T)), cand(tenantPossessesUnderLease(L)), cand(ownershipChanged(T)).
constitutiveRule(r("c725",0,0,(L,T,)),leaseBindsNewOwner(L)) :- inst(r("c725",0,0,(L,T,))).
mainHead(r("c725",0,0,(L,T,)),constitutiveRule,leaseBindsNewOwner(L)) :- inst(r("c725",0,0,(L,T,))).
cand(leaseBindsNewOwner(L)) :- inst(r("c725",0,0,(L,T,))).
body(r("c725",0,0,(L,T,)),leaseOf(L,T)) :- inst(r("c725",0,0,(L,T,))).
body(r("c725",0,0,(L,T,)),tenantPossessesUnderLease(L)) :- inst(r("c725",0,0,(L,T,))).
body(r("c725",0,0,(L,T,)),ownershipChanged(T)) :- inst(r("c725",0,0,(L,T,))).

% tx-g5323[0.0] 分类（自动抽取自图的层级）：合法转租 ⊑ 转租
inst(r("tx-g5323",0,0,(X,))) :- cand(isA(X,"合法转租")).
constitutiveRule(r("tx-g5323",0,0,(X,)),isA(X,"转租")) :- inst(r("tx-g5323",0,0,(X,))).
mainHead(r("tx-g5323",0,0,(X,)),constitutiveRule,isA(X,"转租")) :- inst(r("tx-g5323",0,0,(X,))).
cand(isA(X,"转租")) :- inst(r("tx-g5323",0,0,(X,))).
body(r("tx-g5323",0,0,(X,)),isA(X,"合法转租")) :- inst(r("tx-g5323",0,0,(X,))).

% tx-g5328[0.0] 分类（自动抽取自图的层级）：非法转租 ⊑ 转租
inst(r("tx-g5328",0,0,(X,))) :- cand(isA(X,"非法转租")).
constitutiveRule(r("tx-g5328",0,0,(X,)),isA(X,"转租")) :- inst(r("tx-g5328",0,0,(X,))).
mainHead(r("tx-g5328",0,0,(X,)),constitutiveRule,isA(X,"转租")) :- inst(r("tx-g5328",0,0,(X,))).
cand(isA(X,"转租")) :- inst(r("tx-g5328",0,0,(X,))).
body(r("tx-g5328",0,0,(X,)),isA(X,"非法转租")) :- inst(r("tx-g5328",0,0,(X,))).

% c726[0.0] 出租人出卖租赁房屋的，承租人享有以同等条件优先购买的权利；按份共有人行使优先购买权或出卖给近亲属的除外（第726条第1款；npc）
inst(r("c726",0,0,(L,T,Te,Y,))) :- cand(leaseOf(L,T)), cand(houseLease(L)), cand(tenantOf(Te,L)), cand(landlordSells(T,Y)).
constitutiveRule(r("c726",0,0,(L,T,Te,Y,)),preemptionRight(Te,T)) :- inst(r("c726",0,0,(L,T,Te,Y,))).
mainHead(r("c726",0,0,(L,T,Te,Y,)),constitutiveRule,preemptionRight(Te,T)) :- inst(r("c726",0,0,(L,T,Te,Y,))).
cand(preemptionRight(Te,T)) :- inst(r("c726",0,0,(L,T,Te,Y,))).
body(r("c726",0,0,(L,T,Te,Y,)),leaseOf(L,T)) :- inst(r("c726",0,0,(L,T,Te,Y,))).
body(r("c726",0,0,(L,T,Te,Y,)),houseLease(L)) :- inst(r("c726",0,0,(L,T,Te,Y,))).
body(r("c726",0,0,(L,T,Te,Y,)),tenantOf(Te,L)) :- inst(r("c726",0,0,(L,T,Te,Y,))).
body(r("c726",0,0,(L,T,Te,Y,)),landlordSells(T,Y)) :- inst(r("c726",0,0,(L,T,Te,Y,))).
inst(x("c726",0,0,0,(L,T,Te,Y,))) :- inst(r("c726",0,0,(L,T,Te,Y,))), cand(coOwnerExercisesPreemption(T)).
constitutiveRule(x("c726",0,0,0,(L,T,Te,Y,)),non(preemptionRight(Te,T))) :- inst(x("c726",0,0,0,(L,T,Te,Y,))).
body(x("c726",0,0,0,(L,T,Te,Y,)),leaseOf(L,T)) :- inst(x("c726",0,0,0,(L,T,Te,Y,))).
body(x("c726",0,0,0,(L,T,Te,Y,)),houseLease(L)) :- inst(x("c726",0,0,0,(L,T,Te,Y,))).
body(x("c726",0,0,0,(L,T,Te,Y,)),tenantOf(Te,L)) :- inst(x("c726",0,0,0,(L,T,Te,Y,))).
body(x("c726",0,0,0,(L,T,Te,Y,)),landlordSells(T,Y)) :- inst(x("c726",0,0,0,(L,T,Te,Y,))).
body(x("c726",0,0,0,(L,T,Te,Y,)),coOwnerExercisesPreemption(T)) :- inst(x("c726",0,0,0,(L,T,Te,Y,))).
superior(x("c726",0,0,0,(L,T,Te,Y,)),r("c726",0,0,(L,T,Te,Y,))) :- inst(x("c726",0,0,0,(L,T,Te,Y,))).
exc(x("c726",0,0,0,(L,T,Te,Y,)),r("c726",0,0,(L,T,Te,Y,)),constitutiveRule,preemptionRight(Te,T)) :- inst(x("c726",0,0,0,(L,T,Te,Y,))).
inst(x("c726",0,0,1,(L,T,Te,Y,))) :- inst(r("c726",0,0,(L,T,Te,Y,))), cand(saleToCloseRelative(T,Y)).
constitutiveRule(x("c726",0,0,1,(L,T,Te,Y,)),non(preemptionRight(Te,T))) :- inst(x("c726",0,0,1,(L,T,Te,Y,))).
body(x("c726",0,0,1,(L,T,Te,Y,)),leaseOf(L,T)) :- inst(x("c726",0,0,1,(L,T,Te,Y,))).
body(x("c726",0,0,1,(L,T,Te,Y,)),houseLease(L)) :- inst(x("c726",0,0,1,(L,T,Te,Y,))).
body(x("c726",0,0,1,(L,T,Te,Y,)),tenantOf(Te,L)) :- inst(x("c726",0,0,1,(L,T,Te,Y,))).
body(x("c726",0,0,1,(L,T,Te,Y,)),landlordSells(T,Y)) :- inst(x("c726",0,0,1,(L,T,Te,Y,))).
body(x("c726",0,0,1,(L,T,Te,Y,)),saleToCloseRelative(T,Y)) :- inst(x("c726",0,0,1,(L,T,Te,Y,))).
superior(x("c726",0,0,1,(L,T,Te,Y,)),r("c726",0,0,(L,T,Te,Y,))) :- inst(x("c726",0,0,1,(L,T,Te,Y,))).
exc(x("c726",0,0,1,(L,T,Te,Y,)),r("c726",0,0,(L,T,Te,Y,)),constitutiveRule,preemptionRight(Te,T)) :- inst(x("c726",0,0,1,(L,T,Te,Y,))).

% c726-notify[0.0] 出租人应当在出卖之前的合理期限内通知承租人（第726条第1款；npc）
inst(r("c726-notify",0,0,(L,O,T,Te,Y,))) :- cand(leaseOf(L,T)), cand(houseLease(L)), cand(tenantOf(Te,L)), cand(landlordOf(O,L)), cand(landlordSells(T,Y)).
prescriptiveRule(r("c726-notify",0,0,(L,O,T,Te,Y,)),notifyTenantBeforeSale(O,Te,T)) :- inst(r("c726-notify",0,0,(L,O,T,Te,Y,))).
mainHead(r("c726-notify",0,0,(L,O,T,Te,Y,)),prescriptiveRule,notifyTenantBeforeSale(O,Te,T)) :- inst(r("c726-notify",0,0,(L,O,T,Te,Y,))).
cand(notifyTenantBeforeSale(O,Te,T)) :- inst(r("c726-notify",0,0,(L,O,T,Te,Y,))).
body(r("c726-notify",0,0,(L,O,T,Te,Y,)),leaseOf(L,T)) :- inst(r("c726-notify",0,0,(L,O,T,Te,Y,))).
body(r("c726-notify",0,0,(L,O,T,Te,Y,)),houseLease(L)) :- inst(r("c726-notify",0,0,(L,O,T,Te,Y,))).
body(r("c726-notify",0,0,(L,O,T,Te,Y,)),tenantOf(Te,L)) :- inst(r("c726-notify",0,0,(L,O,T,Te,Y,))).
body(r("c726-notify",0,0,(L,O,T,Te,Y,)),landlordOf(O,L)) :- inst(r("c726-notify",0,0,(L,O,T,Te,Y,))).
body(r("c726-notify",0,0,(L,O,T,Te,Y,)),landlordSells(T,Y)) :- inst(r("c726-notify",0,0,(L,O,T,Te,Y,))).

% c726-2[0.0] 出租人履行通知义务后，承租人在十五日内未明确表示购买的，视为放弃优先购买权（第726条第2款；npc）
inst(r("c726-2",0,0,(L,T,Te,))) :- cand(tenantOf(Te,L)), cand(leaseOf(L,T)), cand(tenantNotifiedOfSale(Te,T)), cand(noAnswerWithin15Days(Te,T)).
constitutiveRule(r("c726-2",0,0,(L,T,Te,)),non(preemptionRight(Te,T))) :- inst(r("c726-2",0,0,(L,T,Te,))).
mainHead(r("c726-2",0,0,(L,T,Te,)),constitutiveRule,non(preemptionRight(Te,T))) :- inst(r("c726-2",0,0,(L,T,Te,))).
cand(preemptionRight(Te,T)) :- inst(r("c726-2",0,0,(L,T,Te,))).
body(r("c726-2",0,0,(L,T,Te,)),tenantOf(Te,L)) :- inst(r("c726-2",0,0,(L,T,Te,))).
body(r("c726-2",0,0,(L,T,Te,)),leaseOf(L,T)) :- inst(r("c726-2",0,0,(L,T,Te,))).
body(r("c726-2",0,0,(L,T,Te,)),tenantNotifiedOfSale(Te,T)) :- inst(r("c726-2",0,0,(L,T,Te,))).
body(r("c726-2",0,0,(L,T,Te,)),noAnswerWithin15Days(Te,T)) :- inst(r("c726-2",0,0,(L,T,Te,))).

% tx-g5372[0.0] 分类（自动抽取自图的层级）：交付租赁物的义务 ⊑ 出租人的义务
inst(r("tx-g5372",0,0,(X,))) :- cand(isA(X,"交付租赁物的义务")).
constitutiveRule(r("tx-g5372",0,0,(X,)),isA(X,"出租人的义务")) :- inst(r("tx-g5372",0,0,(X,))).
mainHead(r("tx-g5372",0,0,(X,)),constitutiveRule,isA(X,"出租人的义务")) :- inst(r("tx-g5372",0,0,(X,))).
cand(isA(X,"出租人的义务")) :- inst(r("tx-g5372",0,0,(X,))).
body(r("tx-g5372",0,0,(X,)),isA(X,"交付租赁物的义务")) :- inst(r("tx-g5372",0,0,(X,))).

% tx-g5374[0.0] 分类（自动抽取自图的层级）：向出卖人付款的义务 ⊑ 出租人的义务
inst(r("tx-g5374",0,0,(X,))) :- cand(isA(X,"向出卖人付款的义务")).
constitutiveRule(r("tx-g5374",0,0,(X,)),isA(X,"出租人的义务")) :- inst(r("tx-g5374",0,0,(X,))).
mainHead(r("tx-g5374",0,0,(X,)),constitutiveRule,isA(X,"出租人的义务")) :- inst(r("tx-g5374",0,0,(X,))).
cand(isA(X,"出租人的义务")) :- inst(r("tx-g5374",0,0,(X,))).
body(r("tx-g5374",0,0,(X,)),isA(X,"向出卖人付款的义务")) :- inst(r("tx-g5374",0,0,(X,))).

% tx-g5553[0.0] 分类（自动抽取自图的层级）：客运合同 ⊑ 运输合同
inst(r("tx-g5553",0,0,(X,))) :- cand(isA(X,"客运合同")).
constitutiveRule(r("tx-g5553",0,0,(X,)),isA(X,"运输合同")) :- inst(r("tx-g5553",0,0,(X,))).
mainHead(r("tx-g5553",0,0,(X,)),constitutiveRule,isA(X,"运输合同")) :- inst(r("tx-g5553",0,0,(X,))).
cand(isA(X,"运输合同")) :- inst(r("tx-g5553",0,0,(X,))).
body(r("tx-g5553",0,0,(X,)),isA(X,"客运合同")) :- inst(r("tx-g5553",0,0,(X,))).

% tx-g5575[0.0] 分类（自动抽取自图的层级）：货运合同 ⊑ 运输合同
inst(r("tx-g5575",0,0,(X,))) :- cand(isA(X,"货运合同")).
constitutiveRule(r("tx-g5575",0,0,(X,)),isA(X,"运输合同")) :- inst(r("tx-g5575",0,0,(X,))).
mainHead(r("tx-g5575",0,0,(X,)),constitutiveRule,isA(X,"运输合同")) :- inst(r("tx-g5575",0,0,(X,))).
cand(isA(X,"运输合同")) :- inst(r("tx-g5575",0,0,(X,))).
body(r("tx-g5575",0,0,(X,)),isA(X,"货运合同")) :- inst(r("tx-g5575",0,0,(X,))).

% tx-g5598[0.0] 分类（自动抽取自图的层级）：多式联运合同 ⊑ 运输合同
inst(r("tx-g5598",0,0,(X,))) :- cand(isA(X,"多式联运合同")).
constitutiveRule(r("tx-g5598",0,0,(X,)),isA(X,"运输合同")) :- inst(r("tx-g5598",0,0,(X,))).
mainHead(r("tx-g5598",0,0,(X,)),constitutiveRule,isA(X,"运输合同")) :- inst(r("tx-g5598",0,0,(X,))).
cand(isA(X,"运输合同")) :- inst(r("tx-g5598",0,0,(X,))).
body(r("tx-g5598",0,0,(X,)),isA(X,"多式联运合同")) :- inst(r("tx-g5598",0,0,(X,))).

% tx-g5611[0.0] 分类（自动抽取自图的层级）：委托开发合同 ⊑ 技术开发合同
inst(r("tx-g5611",0,0,(X,))) :- cand(isA(X,"委托开发合同")).
constitutiveRule(r("tx-g5611",0,0,(X,)),isA(X,"技术开发合同")) :- inst(r("tx-g5611",0,0,(X,))).
mainHead(r("tx-g5611",0,0,(X,)),constitutiveRule,isA(X,"技术开发合同")) :- inst(r("tx-g5611",0,0,(X,))).
cand(isA(X,"技术开发合同")) :- inst(r("tx-g5611",0,0,(X,))).
body(r("tx-g5611",0,0,(X,)),isA(X,"委托开发合同")) :- inst(r("tx-g5611",0,0,(X,))).

% tx-g5622[0.0] 分类（自动抽取自图的层级）：合作开发合同 ⊑ 技术开发合同
inst(r("tx-g5622",0,0,(X,))) :- cand(isA(X,"合作开发合同")).
constitutiveRule(r("tx-g5622",0,0,(X,)),isA(X,"技术开发合同")) :- inst(r("tx-g5622",0,0,(X,))).
mainHead(r("tx-g5622",0,0,(X,)),constitutiveRule,isA(X,"技术开发合同")) :- inst(r("tx-g5622",0,0,(X,))).
cand(isA(X,"技术开发合同")) :- inst(r("tx-g5622",0,0,(X,))).
body(r("tx-g5622",0,0,(X,)),isA(X,"合作开发合同")) :- inst(r("tx-g5622",0,0,(X,))).

% tx-g5693[0.0] 分类（自动抽取自图的层级）：告知义务 ⊑ 寄存人的主要义务
inst(r("tx-g5693",0,0,(X,))) :- cand(isA(X,"告知义务")).
constitutiveRule(r("tx-g5693",0,0,(X,)),isA(X,"寄存人的主要义务")) :- inst(r("tx-g5693",0,0,(X,))).
mainHead(r("tx-g5693",0,0,(X,)),constitutiveRule,isA(X,"寄存人的主要义务")) :- inst(r("tx-g5693",0,0,(X,))).
cand(isA(X,"寄存人的主要义务")) :- inst(r("tx-g5693",0,0,(X,))).
body(r("tx-g5693",0,0,(X,)),isA(X,"告知义务")) :- inst(r("tx-g5693",0,0,(X,))).

% tx-g5696[0.0] 分类（自动抽取自图的层级）：声明义务 ⊑ 寄存人的主要义务
inst(r("tx-g5696",0,0,(X,))) :- cand(isA(X,"声明义务")).
constitutiveRule(r("tx-g5696",0,0,(X,)),isA(X,"寄存人的主要义务")) :- inst(r("tx-g5696",0,0,(X,))).
mainHead(r("tx-g5696",0,0,(X,)),constitutiveRule,isA(X,"寄存人的主要义务")) :- inst(r("tx-g5696",0,0,(X,))).
cand(isA(X,"寄存人的主要义务")) :- inst(r("tx-g5696",0,0,(X,))).
body(r("tx-g5696",0,0,(X,)),isA(X,"声明义务")) :- inst(r("tx-g5696",0,0,(X,))).

% tx-g5717[0.0] 分类（自动抽取自图的层级）：妥善保管仓储物的义务 ⊑ 保管人的主要义务
inst(r("tx-g5717",0,0,(X,))) :- cand(isA(X,"妥善保管仓储物的义务")).
constitutiveRule(r("tx-g5717",0,0,(X,)),isA(X,"保管人的主要义务")) :- inst(r("tx-g5717",0,0,(X,))).
mainHead(r("tx-g5717",0,0,(X,)),constitutiveRule,isA(X,"保管人的主要义务")) :- inst(r("tx-g5717",0,0,(X,))).
cand(isA(X,"保管人的主要义务")) :- inst(r("tx-g5717",0,0,(X,))).
body(r("tx-g5717",0,0,(X,)),isA(X,"妥善保管仓储物的义务")) :- inst(r("tx-g5717",0,0,(X,))).

% tx-g5719[0.0] 分类（自动抽取自图的层级）：接受检查的义务 ⊑ 保管人的主要义务
inst(r("tx-g5719",0,0,(X,))) :- cand(isA(X,"接受检查的义务")).
constitutiveRule(r("tx-g5719",0,0,(X,)),isA(X,"保管人的主要义务")) :- inst(r("tx-g5719",0,0,(X,))).
mainHead(r("tx-g5719",0,0,(X,)),constitutiveRule,isA(X,"保管人的主要义务")) :- inst(r("tx-g5719",0,0,(X,))).
cand(isA(X,"保管人的主要义务")) :- inst(r("tx-g5719",0,0,(X,))).
body(r("tx-g5719",0,0,(X,)),isA(X,"接受检查的义务")) :- inst(r("tx-g5719",0,0,(X,))).

% tx-g5721[0.0] 分类（自动抽取自图的层级）：危险通知义务 ⊑ 保管人的主要义务
inst(r("tx-g5721",0,0,(X,))) :- cand(isA(X,"危险通知义务")).
constitutiveRule(r("tx-g5721",0,0,(X,)),isA(X,"保管人的主要义务")) :- inst(r("tx-g5721",0,0,(X,))).
mainHead(r("tx-g5721",0,0,(X,)),constitutiveRule,isA(X,"保管人的主要义务")) :- inst(r("tx-g5721",0,0,(X,))).
cand(isA(X,"保管人的主要义务")) :- inst(r("tx-g5721",0,0,(X,))).
body(r("tx-g5721",0,0,(X,)),isA(X,"危险通知义务")) :- inst(r("tx-g5721",0,0,(X,))).

% tx-g5723[0.0] 分类（自动抽取自图的层级）：返还仓储物的义务 ⊑ 保管人的主要义务
inst(r("tx-g5723",0,0,(X,))) :- cand(isA(X,"返还仓储物的义务")).
constitutiveRule(r("tx-g5723",0,0,(X,)),isA(X,"保管人的主要义务")) :- inst(r("tx-g5723",0,0,(X,))).
mainHead(r("tx-g5723",0,0,(X,)),constitutiveRule,isA(X,"保管人的主要义务")) :- inst(r("tx-g5723",0,0,(X,))).
cand(isA(X,"保管人的主要义务")) :- inst(r("tx-g5723",0,0,(X,))).
body(r("tx-g5723",0,0,(X,)),isA(X,"返还仓储物的义务")) :- inst(r("tx-g5723",0,0,(X,))).

% tx-g5725[0.0] 分类（自动抽取自图的层级）：交付仓储物的义务 ⊑ 存货人的主要义务
inst(r("tx-g5725",0,0,(X,))) :- cand(isA(X,"交付仓储物的义务")).
constitutiveRule(r("tx-g5725",0,0,(X,)),isA(X,"存货人的主要义务")) :- inst(r("tx-g5725",0,0,(X,))).
mainHead(r("tx-g5725",0,0,(X,)),constitutiveRule,isA(X,"存货人的主要义务")) :- inst(r("tx-g5725",0,0,(X,))).
cand(isA(X,"存货人的主要义务")) :- inst(r("tx-g5725",0,0,(X,))).
body(r("tx-g5725",0,0,(X,)),isA(X,"交付仓储物的义务")) :- inst(r("tx-g5725",0,0,(X,))).

% tx-g5729[0.0] 分类（自动抽取自图的层级）：提取仓储物的义务 ⊑ 存货人的主要义务
inst(r("tx-g5729",0,0,(X,))) :- cand(isA(X,"提取仓储物的义务")).
constitutiveRule(r("tx-g5729",0,0,(X,)),isA(X,"存货人的主要义务")) :- inst(r("tx-g5729",0,0,(X,))).
mainHead(r("tx-g5729",0,0,(X,)),constitutiveRule,isA(X,"存货人的主要义务")) :- inst(r("tx-g5729",0,0,(X,))).
cand(isA(X,"存货人的主要义务")) :- inst(r("tx-g5729",0,0,(X,))).
body(r("tx-g5729",0,0,(X,)),isA(X,"提取仓储物的义务")) :- inst(r("tx-g5729",0,0,(X,))).

% tx-g5749[0.0] 分类（自动抽取自图的层级）：亲自处理委托事务 ⊑ 受托人的义务
inst(r("tx-g5749",0,0,(X,))) :- cand(isA(X,"亲自处理委托事务")).
constitutiveRule(r("tx-g5749",0,0,(X,)),isA(X,"受托人的义务")) :- inst(r("tx-g5749",0,0,(X,))).
mainHead(r("tx-g5749",0,0,(X,)),constitutiveRule,isA(X,"受托人的义务")) :- inst(r("tx-g5749",0,0,(X,))).
cand(isA(X,"受托人的义务")) :- inst(r("tx-g5749",0,0,(X,))).
body(r("tx-g5749",0,0,(X,)),isA(X,"亲自处理委托事务")) :- inst(r("tx-g5749",0,0,(X,))).

% tx-g5750[0.0] 分类（自动抽取自图的层级）：报告的义务 ⊑ 受托人的义务
inst(r("tx-g5750",0,0,(X,))) :- cand(isA(X,"报告的义务")).
constitutiveRule(r("tx-g5750",0,0,(X,)),isA(X,"受托人的义务")) :- inst(r("tx-g5750",0,0,(X,))).
mainHead(r("tx-g5750",0,0,(X,)),constitutiveRule,isA(X,"受托人的义务")) :- inst(r("tx-g5750",0,0,(X,))).
cand(isA(X,"受托人的义务")) :- inst(r("tx-g5750",0,0,(X,))).
body(r("tx-g5750",0,0,(X,)),isA(X,"报告的义务")) :- inst(r("tx-g5750",0,0,(X,))).

% tx-g5916[0.0] 分类（自动抽取自图的层级）：保管合同 ⊑ 实践性合同
inst(r("tx-g5916",0,0,(X,))) :- cand(isA(X,"保管合同")).
constitutiveRule(r("tx-g5916",0,0,(X,)),isA(X,"实践性合同")) :- inst(r("tx-g5916",0,0,(X,))).
mainHead(r("tx-g5916",0,0,(X,)),constitutiveRule,isA(X,"实践性合同")) :- inst(r("tx-g5916",0,0,(X,))).
cand(isA(X,"实践性合同")) :- inst(r("tx-g5916",0,0,(X,))).
body(r("tx-g5916",0,0,(X,)),isA(X,"保管合同")) :- inst(r("tx-g5916",0,0,(X,))).

% tx-g5917[0.0] 分类（自动抽取自图的层级）：自然人借款合同 ⊑ 实践性合同
inst(r("tx-g5917",0,0,(X,))) :- cand(isA(X,"自然人借款合同")).
constitutiveRule(r("tx-g5917",0,0,(X,)),isA(X,"实践性合同")) :- inst(r("tx-g5917",0,0,(X,))).
mainHead(r("tx-g5917",0,0,(X,)),constitutiveRule,isA(X,"实践性合同")) :- inst(r("tx-g5917",0,0,(X,))).
cand(isA(X,"实践性合同")) :- inst(r("tx-g5917",0,0,(X,))).
body(r("tx-g5917",0,0,(X,)),isA(X,"自然人借款合同")) :- inst(r("tx-g5917",0,0,(X,))).

% tx-g5918[0.0] 分类（自动抽取自图的层级）：借用合同 ⊑ 实践性合同
inst(r("tx-g5918",0,0,(X,))) :- cand(isA(X,"借用合同")).
constitutiveRule(r("tx-g5918",0,0,(X,)),isA(X,"实践性合同")) :- inst(r("tx-g5918",0,0,(X,))).
mainHead(r("tx-g5918",0,0,(X,)),constitutiveRule,isA(X,"实践性合同")) :- inst(r("tx-g5918",0,0,(X,))).
cand(isA(X,"实践性合同")) :- inst(r("tx-g5918",0,0,(X,))).
body(r("tx-g5918",0,0,(X,)),isA(X,"借用合同")) :- inst(r("tx-g5918",0,0,(X,))).

% tx-g5919[0.0] 分类（自动抽取自图的层级）：定金合同 ⊑ 实践性合同
inst(r("tx-g5919",0,0,(X,))) :- cand(isA(X,"定金合同")).
constitutiveRule(r("tx-g5919",0,0,(X,)),isA(X,"实践性合同")) :- inst(r("tx-g5919",0,0,(X,))).
mainHead(r("tx-g5919",0,0,(X,)),constitutiveRule,isA(X,"实践性合同")) :- inst(r("tx-g5919",0,0,(X,))).
cand(isA(X,"实践性合同")) :- inst(r("tx-g5919",0,0,(X,))).
body(r("tx-g5919",0,0,(X,)),isA(X,"定金合同")) :- inst(r("tx-g5919",0,0,(X,))).

% tx-g5921[0.0] 分类（自动抽取自图的层级）：合伙合同 ⊑ 不定期合同
inst(r("tx-g5921",0,0,(X,))) :- cand(isA(X,"合伙合同")).
constitutiveRule(r("tx-g5921",0,0,(X,)),isA(X,"不定期合同")) :- inst(r("tx-g5921",0,0,(X,))).
mainHead(r("tx-g5921",0,0,(X,)),constitutiveRule,isA(X,"不定期合同")) :- inst(r("tx-g5921",0,0,(X,))).
cand(isA(X,"不定期合同")) :- inst(r("tx-g5921",0,0,(X,))).
body(r("tx-g5921",0,0,(X,)),isA(X,"合伙合同")) :- inst(r("tx-g5921",0,0,(X,))).

% tx-g5922[0.0] 分类（自动抽取自图的层级）：物业服务合同 ⊑ 不定期合同
inst(r("tx-g5922",0,0,(X,))) :- cand(isA(X,"物业服务合同")).
constitutiveRule(r("tx-g5922",0,0,(X,)),isA(X,"不定期合同")) :- inst(r("tx-g5922",0,0,(X,))).
mainHead(r("tx-g5922",0,0,(X,)),constitutiveRule,isA(X,"不定期合同")) :- inst(r("tx-g5922",0,0,(X,))).
cand(isA(X,"不定期合同")) :- inst(r("tx-g5922",0,0,(X,))).
body(r("tx-g5922",0,0,(X,)),isA(X,"物业服务合同")) :- inst(r("tx-g5922",0,0,(X,))).

% tx-g5923[0.0] 分类（自动抽取自图的层级）：租赁合同 ⊑ 不定期合同
inst(r("tx-g5923",0,0,(X,))) :- cand(isA(X,"租赁合同")).
constitutiveRule(r("tx-g5923",0,0,(X,)),isA(X,"不定期合同")) :- inst(r("tx-g5923",0,0,(X,))).
mainHead(r("tx-g5923",0,0,(X,)),constitutiveRule,isA(X,"不定期合同")) :- inst(r("tx-g5923",0,0,(X,))).
cand(isA(X,"不定期合同")) :- inst(r("tx-g5923",0,0,(X,))).
body(r("tx-g5923",0,0,(X,)),isA(X,"租赁合同")) :- inst(r("tx-g5923",0,0,(X,))).

% tx-g5924[0.0] 分类（自动抽取自图的层级）：肖像许可使用合同 ⊑ 不定期合同
inst(r("tx-g5924",0,0,(X,))) :- cand(isA(X,"肖像许可使用合同")).
constitutiveRule(r("tx-g5924",0,0,(X,)),isA(X,"不定期合同")) :- inst(r("tx-g5924",0,0,(X,))).
mainHead(r("tx-g5924",0,0,(X,)),constitutiveRule,isA(X,"不定期合同")) :- inst(r("tx-g5924",0,0,(X,))).
cand(isA(X,"不定期合同")) :- inst(r("tx-g5924",0,0,(X,))).
body(r("tx-g5924",0,0,(X,)),isA(X,"肖像许可使用合同")) :- inst(r("tx-g5924",0,0,(X,))).

% tx-g5963[0.0] 分类（自动抽取自图的层级）：适当管理义务 ⊑ 管理人的义务
inst(r("tx-g5963",0,0,(X,))) :- cand(isA(X,"适当管理义务")).
constitutiveRule(r("tx-g5963",0,0,(X,)),isA(X,"管理人的义务")) :- inst(r("tx-g5963",0,0,(X,))).
mainHead(r("tx-g5963",0,0,(X,)),constitutiveRule,isA(X,"管理人的义务")) :- inst(r("tx-g5963",0,0,(X,))).
cand(isA(X,"管理人的义务")) :- inst(r("tx-g5963",0,0,(X,))).
body(r("tx-g5963",0,0,(X,)),isA(X,"适当管理义务")) :- inst(r("tx-g5963",0,0,(X,))).

% tx-g5966[0.0] 分类（自动抽取自图的层级）：通知义务 ⊑ 管理人的义务
inst(r("tx-g5966",0,0,(X,))) :- cand(isA(X,"通知义务")).
constitutiveRule(r("tx-g5966",0,0,(X,)),isA(X,"管理人的义务")) :- inst(r("tx-g5966",0,0,(X,))).
mainHead(r("tx-g5966",0,0,(X,)),constitutiveRule,isA(X,"管理人的义务")) :- inst(r("tx-g5966",0,0,(X,))).
cand(isA(X,"管理人的义务")) :- inst(r("tx-g5966",0,0,(X,))).
body(r("tx-g5966",0,0,(X,)),isA(X,"通知义务")) :- inst(r("tx-g5966",0,0,(X,))).

% tx-g5969[0.0] 分类（自动抽取自图的层级）：报告及计算义务 ⊑ 管理人的义务
inst(r("tx-g5969",0,0,(X,))) :- cand(isA(X,"报告及计算义务")).
constitutiveRule(r("tx-g5969",0,0,(X,)),isA(X,"管理人的义务")) :- inst(r("tx-g5969",0,0,(X,))).
mainHead(r("tx-g5969",0,0,(X,)),constitutiveRule,isA(X,"管理人的义务")) :- inst(r("tx-g5969",0,0,(X,))).
cand(isA(X,"管理人的义务")) :- inst(r("tx-g5969",0,0,(X,))).
body(r("tx-g5969",0,0,(X,)),isA(X,"报告及计算义务")) :- inst(r("tx-g5969",0,0,(X,))).

% tx-g6005[0.0] 分类（自动抽取自图的层级）：没有法律上的根据 ⊑ 获益没有合法根据
inst(r("tx-g6005",0,0,(X,))) :- cand(isA(X,"没有法律上的根据")).
constitutiveRule(r("tx-g6005",0,0,(X,)),isA(X,"获益没有合法根据")) :- inst(r("tx-g6005",0,0,(X,))).
mainHead(r("tx-g6005",0,0,(X,)),constitutiveRule,isA(X,"获益没有合法根据")) :- inst(r("tx-g6005",0,0,(X,))).
cand(isA(X,"获益没有合法根据")) :- inst(r("tx-g6005",0,0,(X,))).
body(r("tx-g6005",0,0,(X,)),isA(X,"没有法律上的根据")) :- inst(r("tx-g6005",0,0,(X,))).

% tx-g6006[0.0] 分类（自动抽取自图的层级）：没有合同上的根据 ⊑ 获益没有合法根据
inst(r("tx-g6006",0,0,(X,))) :- cand(isA(X,"没有合同上的根据")).
constitutiveRule(r("tx-g6006",0,0,(X,)),isA(X,"获益没有合法根据")) :- inst(r("tx-g6006",0,0,(X,))).
mainHead(r("tx-g6006",0,0,(X,)),constitutiveRule,isA(X,"获益没有合法根据")) :- inst(r("tx-g6006",0,0,(X,))).
cand(isA(X,"获益没有合法根据")) :- inst(r("tx-g6006",0,0,(X,))).
body(r("tx-g6006",0,0,(X,)),isA(X,"没有合同上的根据")) :- inst(r("tx-g6006",0,0,(X,))).

% tx-g6110[0.0] 分类（自动抽取自图的层级）：人身的人格权 ⊑ 具体人格权
inst(r("tx-g6110",0,0,(X,))) :- cand(isA(X,"人身的人格权")).
constitutiveRule(r("tx-g6110",0,0,(X,)),isA(X,"具体人格权")) :- inst(r("tx-g6110",0,0,(X,))).
mainHead(r("tx-g6110",0,0,(X,)),constitutiveRule,isA(X,"具体人格权")) :- inst(r("tx-g6110",0,0,(X,))).
cand(isA(X,"具体人格权")) :- inst(r("tx-g6110",0,0,(X,))).
body(r("tx-g6110",0,0,(X,)),isA(X,"人身的人格权")) :- inst(r("tx-g6110",0,0,(X,))).

% tx-g6184[0.0] 分类（自动抽取自图的层级）：精神的人格权 ⊑ 具体人格权
inst(r("tx-g6184",0,0,(X,))) :- cand(isA(X,"精神的人格权")).
constitutiveRule(r("tx-g6184",0,0,(X,)),isA(X,"具体人格权")) :- inst(r("tx-g6184",0,0,(X,))).
mainHead(r("tx-g6184",0,0,(X,)),constitutiveRule,isA(X,"具体人格权")) :- inst(r("tx-g6184",0,0,(X,))).
cand(isA(X,"具体人格权")) :- inst(r("tx-g6184",0,0,(X,))).
body(r("tx-g6184",0,0,(X,)),isA(X,"精神的人格权")) :- inst(r("tx-g6184",0,0,(X,))).

% tx-g6111[0.0] 分类（自动抽取自图的层级）：生命权 ⊑ 人身的人格权
inst(r("tx-g6111",0,0,(X,))) :- cand(isA(X,"生命权")).
constitutiveRule(r("tx-g6111",0,0,(X,)),isA(X,"人身的人格权")) :- inst(r("tx-g6111",0,0,(X,))).
mainHead(r("tx-g6111",0,0,(X,)),constitutiveRule,isA(X,"人身的人格权")) :- inst(r("tx-g6111",0,0,(X,))).
cand(isA(X,"人身的人格权")) :- inst(r("tx-g6111",0,0,(X,))).
body(r("tx-g6111",0,0,(X,)),isA(X,"生命权")) :- inst(r("tx-g6111",0,0,(X,))).

% tx-g6121[0.0] 分类（自动抽取自图的层级）：身体权 ⊑ 人身的人格权
inst(r("tx-g6121",0,0,(X,))) :- cand(isA(X,"身体权")).
constitutiveRule(r("tx-g6121",0,0,(X,)),isA(X,"人身的人格权")) :- inst(r("tx-g6121",0,0,(X,))).
mainHead(r("tx-g6121",0,0,(X,)),constitutiveRule,isA(X,"人身的人格权")) :- inst(r("tx-g6121",0,0,(X,))).
cand(isA(X,"人身的人格权")) :- inst(r("tx-g6121",0,0,(X,))).
body(r("tx-g6121",0,0,(X,)),isA(X,"身体权")) :- inst(r("tx-g6121",0,0,(X,))).

% tx-g6157[0.0] 分类（自动抽取自图的层级）：健康权 ⊑ 人身的人格权
inst(r("tx-g6157",0,0,(X,))) :- cand(isA(X,"健康权")).
constitutiveRule(r("tx-g6157",0,0,(X,)),isA(X,"人身的人格权")) :- inst(r("tx-g6157",0,0,(X,))).
mainHead(r("tx-g6157",0,0,(X,)),constitutiveRule,isA(X,"人身的人格权")) :- inst(r("tx-g6157",0,0,(X,))).
cand(isA(X,"人身的人格权")) :- inst(r("tx-g6157",0,0,(X,))).
body(r("tx-g6157",0,0,(X,)),isA(X,"健康权")) :- inst(r("tx-g6157",0,0,(X,))).

% tx-g6185[0.0] 分类（自动抽取自图的层级）：姓名权和名称权 ⊑ 精神的人格权
inst(r("tx-g6185",0,0,(X,))) :- cand(isA(X,"姓名权和名称权")).
constitutiveRule(r("tx-g6185",0,0,(X,)),isA(X,"精神的人格权")) :- inst(r("tx-g6185",0,0,(X,))).
mainHead(r("tx-g6185",0,0,(X,)),constitutiveRule,isA(X,"精神的人格权")) :- inst(r("tx-g6185",0,0,(X,))).
cand(isA(X,"精神的人格权")) :- inst(r("tx-g6185",0,0,(X,))).
body(r("tx-g6185",0,0,(X,)),isA(X,"姓名权和名称权")) :- inst(r("tx-g6185",0,0,(X,))).

% tx-g6227[0.0] 分类（自动抽取自图的层级）：肖像权 ⊑ 精神的人格权
inst(r("tx-g6227",0,0,(X,))) :- cand(isA(X,"肖像权")).
constitutiveRule(r("tx-g6227",0,0,(X,)),isA(X,"精神的人格权")) :- inst(r("tx-g6227",0,0,(X,))).
mainHead(r("tx-g6227",0,0,(X,)),constitutiveRule,isA(X,"精神的人格权")) :- inst(r("tx-g6227",0,0,(X,))).
cand(isA(X,"精神的人格权")) :- inst(r("tx-g6227",0,0,(X,))).
body(r("tx-g6227",0,0,(X,)),isA(X,"肖像权")) :- inst(r("tx-g6227",0,0,(X,))).

% tx-g6276[0.0] 分类（自动抽取自图的层级）：名誉权和荣誉权 ⊑ 精神的人格权
inst(r("tx-g6276",0,0,(X,))) :- cand(isA(X,"名誉权和荣誉权")).
constitutiveRule(r("tx-g6276",0,0,(X,)),isA(X,"精神的人格权")) :- inst(r("tx-g6276",0,0,(X,))).
mainHead(r("tx-g6276",0,0,(X,)),constitutiveRule,isA(X,"精神的人格权")) :- inst(r("tx-g6276",0,0,(X,))).
cand(isA(X,"精神的人格权")) :- inst(r("tx-g6276",0,0,(X,))).
body(r("tx-g6276",0,0,(X,)),isA(X,"名誉权和荣誉权")) :- inst(r("tx-g6276",0,0,(X,))).

% tx-g6302[0.0] 分类（自动抽取自图的层级）：正当新闻报道不构成侵权 ⊑ 新闻报道侵权
inst(r("tx-g6302",0,0,(X,))) :- cand(isA(X,"正当新闻报道不构成侵权")).
constitutiveRule(r("tx-g6302",0,0,(X,)),isA(X,"新闻报道侵权")) :- inst(r("tx-g6302",0,0,(X,))).
mainHead(r("tx-g6302",0,0,(X,)),constitutiveRule,isA(X,"新闻报道侵权")) :- inst(r("tx-g6302",0,0,(X,))).
cand(isA(X,"新闻报道侵权")) :- inst(r("tx-g6302",0,0,(X,))).
body(r("tx-g6302",0,0,(X,)),isA(X,"正当新闻报道不构成侵权")) :- inst(r("tx-g6302",0,0,(X,))).

% tx-g6303[0.0] 分类（自动抽取自图的层级）：不正当新闻报道构成侵权 ⊑ 新闻报道侵权
inst(r("tx-g6303",0,0,(X,))) :- cand(isA(X,"不正当新闻报道构成侵权")).
constitutiveRule(r("tx-g6303",0,0,(X,)),isA(X,"新闻报道侵权")) :- inst(r("tx-g6303",0,0,(X,))).
mainHead(r("tx-g6303",0,0,(X,)),constitutiveRule,isA(X,"新闻报道侵权")) :- inst(r("tx-g6303",0,0,(X,))).
cand(isA(X,"新闻报道侵权")) :- inst(r("tx-g6303",0,0,(X,))).
body(r("tx-g6303",0,0,(X,)),isA(X,"不正当新闻报道构成侵权")) :- inst(r("tx-g6303",0,0,(X,))).

% c1062[0.0] 婚姻关系存续期间所得的工资、经营投资收益、知识产权收益、继承或受赠的财产等为夫妻共同财产（第1062条第1款；npc）
inst(r("c1062",0,0,(T,))) :- cand(acquiredDuringMarriage(T)), cand(wagesOrRemuneration(T)).
constitutiveRule(r("c1062",0,0,(T,)),communityProperty(T)) :- inst(r("c1062",0,0,(T,))).
mainHead(r("c1062",0,0,(T,)),constitutiveRule,communityProperty(T)) :- inst(r("c1062",0,0,(T,))).
cand(communityProperty(T)) :- inst(r("c1062",0,0,(T,))).
body(r("c1062",0,0,(T,)),acquiredDuringMarriage(T)) :- inst(r("c1062",0,0,(T,))).
body(r("c1062",0,0,(T,)),wagesOrRemuneration(T)) :- inst(r("c1062",0,0,(T,))).
% c1062[1.0] 婚姻关系存续期间所得的工资、经营投资收益、知识产权收益、继承或受赠的财产等为夫妻共同财产（第1062条第1款；npc）
inst(r("c1062",1,0,(T,))) :- cand(acquiredDuringMarriage(T)), cand(businessOrInvestmentIncome(T)).
constitutiveRule(r("c1062",1,0,(T,)),communityProperty(T)) :- inst(r("c1062",1,0,(T,))).
mainHead(r("c1062",1,0,(T,)),constitutiveRule,communityProperty(T)) :- inst(r("c1062",1,0,(T,))).
cand(communityProperty(T)) :- inst(r("c1062",1,0,(T,))).
body(r("c1062",1,0,(T,)),acquiredDuringMarriage(T)) :- inst(r("c1062",1,0,(T,))).
body(r("c1062",1,0,(T,)),businessOrInvestmentIncome(T)) :- inst(r("c1062",1,0,(T,))).
% c1062[2.0] 婚姻关系存续期间所得的工资、经营投资收益、知识产权收益、继承或受赠的财产等为夫妻共同财产（第1062条第1款；npc）
inst(r("c1062",2,0,(T,))) :- cand(acquiredDuringMarriage(T)), cand(ipIncome(T)).
constitutiveRule(r("c1062",2,0,(T,)),communityProperty(T)) :- inst(r("c1062",2,0,(T,))).
mainHead(r("c1062",2,0,(T,)),constitutiveRule,communityProperty(T)) :- inst(r("c1062",2,0,(T,))).
cand(communityProperty(T)) :- inst(r("c1062",2,0,(T,))).
body(r("c1062",2,0,(T,)),acquiredDuringMarriage(T)) :- inst(r("c1062",2,0,(T,))).
body(r("c1062",2,0,(T,)),ipIncome(T)) :- inst(r("c1062",2,0,(T,))).
% c1062[3.0] 婚姻关系存续期间所得的工资、经营投资收益、知识产权收益、继承或受赠的财产等为夫妻共同财产（第1062条第1款；npc）
inst(r("c1062",3,0,(T,))) :- cand(acquiredDuringMarriage(T)), cand(inheritedOrGifted(T)).
constitutiveRule(r("c1062",3,0,(T,)),communityProperty(T)) :- inst(r("c1062",3,0,(T,))).
mainHead(r("c1062",3,0,(T,)),constitutiveRule,communityProperty(T)) :- inst(r("c1062",3,0,(T,))).
cand(communityProperty(T)) :- inst(r("c1062",3,0,(T,))).
body(r("c1062",3,0,(T,)),acquiredDuringMarriage(T)) :- inst(r("c1062",3,0,(T,))).
body(r("c1062",3,0,(T,)),inheritedOrGifted(T)) :- inst(r("c1062",3,0,(T,))).
% c1062[4.0] 婚姻关系存续期间所得的工资、经营投资收益、知识产权收益、继承或受赠的财产等为夫妻共同财产（第1062条第1款；npc）
inst(r("c1062",4,0,(T,))) :- cand(acquiredDuringMarriage(T)), cand(otherCommonProperty(T)).
constitutiveRule(r("c1062",4,0,(T,)),communityProperty(T)) :- inst(r("c1062",4,0,(T,))).
mainHead(r("c1062",4,0,(T,)),constitutiveRule,communityProperty(T)) :- inst(r("c1062",4,0,(T,))).
cand(communityProperty(T)) :- inst(r("c1062",4,0,(T,))).
body(r("c1062",4,0,(T,)),acquiredDuringMarriage(T)) :- inst(r("c1062",4,0,(T,))).
body(r("c1062",4,0,(T,)),otherCommonProperty(T)) :- inst(r("c1062",4,0,(T,))).

% c1063[0.0] 婚前财产、人身损害赔偿或补偿、遗嘱或赠与合同中确定只归一方的财产、一方专用生活用品为个人财产（第1063条；npc）
inst(r("c1063",0,0,(T,))) :- cand(premaritalProperty(T)).
constitutiveRule(r("c1063",0,0,(T,)),separateProperty(T)) :- inst(r("c1063",0,0,(T,))).
mainHead(r("c1063",0,0,(T,)),constitutiveRule,separateProperty(T)) :- inst(r("c1063",0,0,(T,))).
cand(separateProperty(T)) :- inst(r("c1063",0,0,(T,))).
body(r("c1063",0,0,(T,)),premaritalProperty(T)) :- inst(r("c1063",0,0,(T,))).
% c1063[0.1] 婚前财产、人身损害赔偿或补偿、遗嘱或赠与合同中确定只归一方的财产、一方专用生活用品为个人财产（第1063条；npc）
inst(r("c1063",0,1,(T,))) :- cand(premaritalProperty(T)).
constitutiveRule(r("c1063",0,1,(T,)),non(communityProperty(T))) :- inst(r("c1063",0,1,(T,))).
mainHead(r("c1063",0,1,(T,)),constitutiveRule,non(communityProperty(T))) :- inst(r("c1063",0,1,(T,))).
cand(communityProperty(T)) :- inst(r("c1063",0,1,(T,))).
body(r("c1063",0,1,(T,)),premaritalProperty(T)) :- inst(r("c1063",0,1,(T,))).
% c1063[1.0] 婚前财产、人身损害赔偿或补偿、遗嘱或赠与合同中确定只归一方的财产、一方专用生活用品为个人财产（第1063条；npc）
inst(r("c1063",1,0,(T,))) :- cand(personalInjuryCompensation(T)).
constitutiveRule(r("c1063",1,0,(T,)),separateProperty(T)) :- inst(r("c1063",1,0,(T,))).
mainHead(r("c1063",1,0,(T,)),constitutiveRule,separateProperty(T)) :- inst(r("c1063",1,0,(T,))).
cand(separateProperty(T)) :- inst(r("c1063",1,0,(T,))).
body(r("c1063",1,0,(T,)),personalInjuryCompensation(T)) :- inst(r("c1063",1,0,(T,))).
% c1063[1.1] 婚前财产、人身损害赔偿或补偿、遗嘱或赠与合同中确定只归一方的财产、一方专用生活用品为个人财产（第1063条；npc）
inst(r("c1063",1,1,(T,))) :- cand(personalInjuryCompensation(T)).
constitutiveRule(r("c1063",1,1,(T,)),non(communityProperty(T))) :- inst(r("c1063",1,1,(T,))).
mainHead(r("c1063",1,1,(T,)),constitutiveRule,non(communityProperty(T))) :- inst(r("c1063",1,1,(T,))).
cand(communityProperty(T)) :- inst(r("c1063",1,1,(T,))).
body(r("c1063",1,1,(T,)),personalInjuryCompensation(T)) :- inst(r("c1063",1,1,(T,))).
% c1063[2.0] 婚前财产、人身损害赔偿或补偿、遗嘱或赠与合同中确定只归一方的财产、一方专用生活用品为个人财产（第1063条；npc）
inst(r("c1063",2,0,(T,))) :- cand(designatedSolelyToOneSpouse(T)).
constitutiveRule(r("c1063",2,0,(T,)),separateProperty(T)) :- inst(r("c1063",2,0,(T,))).
mainHead(r("c1063",2,0,(T,)),constitutiveRule,separateProperty(T)) :- inst(r("c1063",2,0,(T,))).
cand(separateProperty(T)) :- inst(r("c1063",2,0,(T,))).
body(r("c1063",2,0,(T,)),designatedSolelyToOneSpouse(T)) :- inst(r("c1063",2,0,(T,))).
% c1063[2.1] 婚前财产、人身损害赔偿或补偿、遗嘱或赠与合同中确定只归一方的财产、一方专用生活用品为个人财产（第1063条；npc）
inst(r("c1063",2,1,(T,))) :- cand(designatedSolelyToOneSpouse(T)).
constitutiveRule(r("c1063",2,1,(T,)),non(communityProperty(T))) :- inst(r("c1063",2,1,(T,))).
mainHead(r("c1063",2,1,(T,)),constitutiveRule,non(communityProperty(T))) :- inst(r("c1063",2,1,(T,))).
cand(communityProperty(T)) :- inst(r("c1063",2,1,(T,))).
body(r("c1063",2,1,(T,)),designatedSolelyToOneSpouse(T)) :- inst(r("c1063",2,1,(T,))).
% c1063[3.0] 婚前财产、人身损害赔偿或补偿、遗嘱或赠与合同中确定只归一方的财产、一方专用生活用品为个人财产（第1063条；npc）
inst(r("c1063",3,0,(T,))) :- cand(personalUseItem(T)).
constitutiveRule(r("c1063",3,0,(T,)),separateProperty(T)) :- inst(r("c1063",3,0,(T,))).
mainHead(r("c1063",3,0,(T,)),constitutiveRule,separateProperty(T)) :- inst(r("c1063",3,0,(T,))).
cand(separateProperty(T)) :- inst(r("c1063",3,0,(T,))).
body(r("c1063",3,0,(T,)),personalUseItem(T)) :- inst(r("c1063",3,0,(T,))).
% c1063[3.1] 婚前财产、人身损害赔偿或补偿、遗嘱或赠与合同中确定只归一方的财产、一方专用生活用品为个人财产（第1063条；npc）
inst(r("c1063",3,1,(T,))) :- cand(personalUseItem(T)).
constitutiveRule(r("c1063",3,1,(T,)),non(communityProperty(T))) :- inst(r("c1063",3,1,(T,))).
mainHead(r("c1063",3,1,(T,)),constitutiveRule,non(communityProperty(T))) :- inst(r("c1063",3,1,(T,))).
cand(communityProperty(T)) :- inst(r("c1063",3,1,(T,))).
body(r("c1063",3,1,(T,)),personalUseItem(T)) :- inst(r("c1063",3,1,(T,))).
% c1063[4.0] 婚前财产、人身损害赔偿或补偿、遗嘱或赠与合同中确定只归一方的财产、一方专用生活用品为个人财产（第1063条；npc）
inst(r("c1063",4,0,(T,))) :- cand(otherSeparateProperty(T)).
constitutiveRule(r("c1063",4,0,(T,)),separateProperty(T)) :- inst(r("c1063",4,0,(T,))).
mainHead(r("c1063",4,0,(T,)),constitutiveRule,separateProperty(T)) :- inst(r("c1063",4,0,(T,))).
cand(separateProperty(T)) :- inst(r("c1063",4,0,(T,))).
body(r("c1063",4,0,(T,)),otherSeparateProperty(T)) :- inst(r("c1063",4,0,(T,))).
% c1063[4.1] 婚前财产、人身损害赔偿或补偿、遗嘱或赠与合同中确定只归一方的财产、一方专用生活用品为个人财产（第1063条；npc）
inst(r("c1063",4,1,(T,))) :- cand(otherSeparateProperty(T)).
constitutiveRule(r("c1063",4,1,(T,)),non(communityProperty(T))) :- inst(r("c1063",4,1,(T,))).
mainHead(r("c1063",4,1,(T,)),constitutiveRule,non(communityProperty(T))) :- inst(r("c1063",4,1,(T,))).
cand(communityProperty(T)) :- inst(r("c1063",4,1,(T,))).
body(r("c1063",4,1,(T,)),otherSeparateProperty(T)) :- inst(r("c1063",4,1,(T,))).

% tx-g6625[0.0] 分类（自动抽取自图的层级）：一方的婚前财产 ⊑ 夫妻个人特有财产
inst(r("tx-g6625",0,0,(X,))) :- cand(isA(X,"一方的婚前财产")).
constitutiveRule(r("tx-g6625",0,0,(X,)),isA(X,"夫妻个人特有财产")) :- inst(r("tx-g6625",0,0,(X,))).
mainHead(r("tx-g6625",0,0,(X,)),constitutiveRule,isA(X,"夫妻个人特有财产")) :- inst(r("tx-g6625",0,0,(X,))).
cand(isA(X,"夫妻个人特有财产")) :- inst(r("tx-g6625",0,0,(X,))).
body(r("tx-g6625",0,0,(X,)),isA(X,"一方的婚前财产")) :- inst(r("tx-g6625",0,0,(X,))).

% tx-g6629[0.0] 分类（自动抽取自图的层级）：其他应当归一方的财产 ⊑ 夫妻个人特有财产
inst(r("tx-g6629",0,0,(X,))) :- cand(isA(X,"其他应当归一方的财产")).
constitutiveRule(r("tx-g6629",0,0,(X,)),isA(X,"夫妻个人特有财产")) :- inst(r("tx-g6629",0,0,(X,))).
mainHead(r("tx-g6629",0,0,(X,)),constitutiveRule,isA(X,"夫妻个人特有财产")) :- inst(r("tx-g6629",0,0,(X,))).
cand(isA(X,"夫妻个人特有财产")) :- inst(r("tx-g6629",0,0,(X,))).
body(r("tx-g6629",0,0,(X,)),isA(X,"其他应当归一方的财产")) :- inst(r("tx-g6629",0,0,(X,))).

% tx-g6710[0.0] 分类（自动抽取自图的层级）：登记离婚 ⊑ 离婚
inst(r("tx-g6710",0,0,(X,))) :- cand(isA(X,"登记离婚")).
constitutiveRule(r("tx-g6710",0,0,(X,)),isA(X,"离婚")) :- inst(r("tx-g6710",0,0,(X,))).
mainHead(r("tx-g6710",0,0,(X,)),constitutiveRule,isA(X,"离婚")) :- inst(r("tx-g6710",0,0,(X,))).
cand(isA(X,"离婚")) :- inst(r("tx-g6710",0,0,(X,))).
body(r("tx-g6710",0,0,(X,)),isA(X,"登记离婚")) :- inst(r("tx-g6710",0,0,(X,))).

% tx-g6724[0.0] 分类（自动抽取自图的层级）：诉讼离婚 ⊑ 离婚
inst(r("tx-g6724",0,0,(X,))) :- cand(isA(X,"诉讼离婚")).
constitutiveRule(r("tx-g6724",0,0,(X,)),isA(X,"离婚")) :- inst(r("tx-g6724",0,0,(X,))).
mainHead(r("tx-g6724",0,0,(X,)),constitutiveRule,isA(X,"离婚")) :- inst(r("tx-g6724",0,0,(X,))).
cand(isA(X,"离婚")) :- inst(r("tx-g6724",0,0,(X,))).
body(r("tx-g6724",0,0,(X,)),isA(X,"诉讼离婚")) :- inst(r("tx-g6724",0,0,(X,))).

% tx-g6746[0.0] 分类（自动抽取自图的层级）：对军人婚姻的特殊保护 ⊑ 诉讼离婚的特殊保护
inst(r("tx-g6746",0,0,(X,))) :- cand(isA(X,"对军人婚姻的特殊保护")).
constitutiveRule(r("tx-g6746",0,0,(X,)),isA(X,"诉讼离婚的特殊保护")) :- inst(r("tx-g6746",0,0,(X,))).
mainHead(r("tx-g6746",0,0,(X,)),constitutiveRule,isA(X,"诉讼离婚的特殊保护")) :- inst(r("tx-g6746",0,0,(X,))).
cand(isA(X,"诉讼离婚的特殊保护")) :- inst(r("tx-g6746",0,0,(X,))).
body(r("tx-g6746",0,0,(X,)),isA(X,"对军人婚姻的特殊保护")) :- inst(r("tx-g6746",0,0,(X,))).

% tx-g6748[0.0] 分类（自动抽取自图的层级）：对女方的特殊保护 ⊑ 诉讼离婚的特殊保护
inst(r("tx-g6748",0,0,(X,))) :- cand(isA(X,"对女方的特殊保护")).
constitutiveRule(r("tx-g6748",0,0,(X,)),isA(X,"诉讼离婚的特殊保护")) :- inst(r("tx-g6748",0,0,(X,))).
mainHead(r("tx-g6748",0,0,(X,)),constitutiveRule,isA(X,"诉讼离婚的特殊保护")) :- inst(r("tx-g6748",0,0,(X,))).
cand(isA(X,"诉讼离婚的特殊保护")) :- inst(r("tx-g6748",0,0,(X,))).
body(r("tx-g6748",0,0,(X,)),isA(X,"对女方的特殊保护")) :- inst(r("tx-g6748",0,0,(X,))).

% c1064-joint[0.0] 共同签名或一方事后追认等共同意思表示所负的债务，属于夫妻共同债务（第1064条第1款；npc）
inst(r("c1064-joint",0,0,(Z,))) :- cand(debtOf(Z)), cand(bothSigned(Z)).
constitutiveRule(r("c1064-joint",0,0,(Z,)),jointMaritalDebt(Z)) :- inst(r("c1064-joint",0,0,(Z,))).
mainHead(r("c1064-joint",0,0,(Z,)),constitutiveRule,jointMaritalDebt(Z)) :- inst(r("c1064-joint",0,0,(Z,))).
cand(jointMaritalDebt(Z)) :- inst(r("c1064-joint",0,0,(Z,))).
body(r("c1064-joint",0,0,(Z,)),debtOf(Z)) :- inst(r("c1064-joint",0,0,(Z,))).
body(r("c1064-joint",0,0,(Z,)),bothSigned(Z)) :- inst(r("c1064-joint",0,0,(Z,))).
% c1064-joint[1.0] 共同签名或一方事后追认等共同意思表示所负的债务，属于夫妻共同债务（第1064条第1款；npc）
inst(r("c1064-joint",1,0,(Z,))) :- cand(debtOf(Z)), cand(spouseRatified(Z)).
constitutiveRule(r("c1064-joint",1,0,(Z,)),jointMaritalDebt(Z)) :- inst(r("c1064-joint",1,0,(Z,))).
mainHead(r("c1064-joint",1,0,(Z,)),constitutiveRule,jointMaritalDebt(Z)) :- inst(r("c1064-joint",1,0,(Z,))).
cand(jointMaritalDebt(Z)) :- inst(r("c1064-joint",1,0,(Z,))).
body(r("c1064-joint",1,0,(Z,)),debtOf(Z)) :- inst(r("c1064-joint",1,0,(Z,))).
body(r("c1064-joint",1,0,(Z,)),spouseRatified(Z)) :- inst(r("c1064-joint",1,0,(Z,))).

% c1064-daily[0.0] 一方在婚姻关系存续期间以个人名义为家庭日常生活需要所负的债务，属于夫妻共同债务（第1064条第1款；npc）
inst(r("c1064-daily",0,0,(Z,))) :- cand(debtOf(Z)), cand(incurredDuringMarriage(Z)), cand(inOwnName(Z)), cand(forDailyHouseholdNeeds(Z)).
constitutiveRule(r("c1064-daily",0,0,(Z,)),jointMaritalDebt(Z)) :- inst(r("c1064-daily",0,0,(Z,))).
mainHead(r("c1064-daily",0,0,(Z,)),constitutiveRule,jointMaritalDebt(Z)) :- inst(r("c1064-daily",0,0,(Z,))).
cand(jointMaritalDebt(Z)) :- inst(r("c1064-daily",0,0,(Z,))).
body(r("c1064-daily",0,0,(Z,)),debtOf(Z)) :- inst(r("c1064-daily",0,0,(Z,))).
body(r("c1064-daily",0,0,(Z,)),incurredDuringMarriage(Z)) :- inst(r("c1064-daily",0,0,(Z,))).
body(r("c1064-daily",0,0,(Z,)),inOwnName(Z)) :- inst(r("c1064-daily",0,0,(Z,))).
body(r("c1064-daily",0,0,(Z,)),forDailyHouseholdNeeds(Z)) :- inst(r("c1064-daily",0,0,(Z,))).

% c1064-2[0.0] 超出家庭日常生活需要所负的债务，不属于夫妻共同债务；但债权人能证明用于共同生活、共同生产经营或基于共同意思表示的除外（第1064条第2款；n
inst(r("c1064-2",0,0,(Z,))) :- cand(debtOf(Z)), cand(incurredDuringMarriage(Z)), cand(inOwnName(Z)), cand(exceedsDailyNeeds(Z)).
constitutiveRule(r("c1064-2",0,0,(Z,)),non(jointMaritalDebt(Z))) :- inst(r("c1064-2",0,0,(Z,))).
mainHead(r("c1064-2",0,0,(Z,)),constitutiveRule,non(jointMaritalDebt(Z))) :- inst(r("c1064-2",0,0,(Z,))).
cand(jointMaritalDebt(Z)) :- inst(r("c1064-2",0,0,(Z,))).
body(r("c1064-2",0,0,(Z,)),debtOf(Z)) :- inst(r("c1064-2",0,0,(Z,))).
body(r("c1064-2",0,0,(Z,)),incurredDuringMarriage(Z)) :- inst(r("c1064-2",0,0,(Z,))).
body(r("c1064-2",0,0,(Z,)),inOwnName(Z)) :- inst(r("c1064-2",0,0,(Z,))).
body(r("c1064-2",0,0,(Z,)),exceedsDailyNeeds(Z)) :- inst(r("c1064-2",0,0,(Z,))).
inst(x("c1064-2",0,0,0,(Z,))) :- inst(r("c1064-2",0,0,(Z,))), cand(bothSigned(Z)).
constitutiveRule(x("c1064-2",0,0,0,(Z,)),jointMaritalDebt(Z)) :- inst(x("c1064-2",0,0,0,(Z,))).
body(x("c1064-2",0,0,0,(Z,)),debtOf(Z)) :- inst(x("c1064-2",0,0,0,(Z,))).
body(x("c1064-2",0,0,0,(Z,)),incurredDuringMarriage(Z)) :- inst(x("c1064-2",0,0,0,(Z,))).
body(x("c1064-2",0,0,0,(Z,)),inOwnName(Z)) :- inst(x("c1064-2",0,0,0,(Z,))).
body(x("c1064-2",0,0,0,(Z,)),exceedsDailyNeeds(Z)) :- inst(x("c1064-2",0,0,0,(Z,))).
body(x("c1064-2",0,0,0,(Z,)),bothSigned(Z)) :- inst(x("c1064-2",0,0,0,(Z,))).
superior(x("c1064-2",0,0,0,(Z,)),r("c1064-2",0,0,(Z,))) :- inst(x("c1064-2",0,0,0,(Z,))).
exc(x("c1064-2",0,0,0,(Z,)),r("c1064-2",0,0,(Z,)),constitutiveRule,non(jointMaritalDebt(Z))) :- inst(x("c1064-2",0,0,0,(Z,))).
inst(x("c1064-2",0,0,1,(Z,))) :- inst(r("c1064-2",0,0,(Z,))), cand(spouseRatified(Z)).
constitutiveRule(x("c1064-2",0,0,1,(Z,)),jointMaritalDebt(Z)) :- inst(x("c1064-2",0,0,1,(Z,))).
body(x("c1064-2",0,0,1,(Z,)),debtOf(Z)) :- inst(x("c1064-2",0,0,1,(Z,))).
body(x("c1064-2",0,0,1,(Z,)),incurredDuringMarriage(Z)) :- inst(x("c1064-2",0,0,1,(Z,))).
body(x("c1064-2",0,0,1,(Z,)),inOwnName(Z)) :- inst(x("c1064-2",0,0,1,(Z,))).
body(x("c1064-2",0,0,1,(Z,)),exceedsDailyNeeds(Z)) :- inst(x("c1064-2",0,0,1,(Z,))).
body(x("c1064-2",0,0,1,(Z,)),spouseRatified(Z)) :- inst(x("c1064-2",0,0,1,(Z,))).
superior(x("c1064-2",0,0,1,(Z,)),r("c1064-2",0,0,(Z,))) :- inst(x("c1064-2",0,0,1,(Z,))).
exc(x("c1064-2",0,0,1,(Z,)),r("c1064-2",0,0,(Z,)),constitutiveRule,non(jointMaritalDebt(Z))) :- inst(x("c1064-2",0,0,1,(Z,))).
inst(x("c1064-2",0,0,2,(Z,))) :- inst(r("c1064-2",0,0,(Z,))), cand(creditorProvesCommonUse(Z)).
constitutiveRule(x("c1064-2",0,0,2,(Z,)),jointMaritalDebt(Z)) :- inst(x("c1064-2",0,0,2,(Z,))).
body(x("c1064-2",0,0,2,(Z,)),debtOf(Z)) :- inst(x("c1064-2",0,0,2,(Z,))).
body(x("c1064-2",0,0,2,(Z,)),incurredDuringMarriage(Z)) :- inst(x("c1064-2",0,0,2,(Z,))).
body(x("c1064-2",0,0,2,(Z,)),inOwnName(Z)) :- inst(x("c1064-2",0,0,2,(Z,))).
body(x("c1064-2",0,0,2,(Z,)),exceedsDailyNeeds(Z)) :- inst(x("c1064-2",0,0,2,(Z,))).
body(x("c1064-2",0,0,2,(Z,)),creditorProvesCommonUse(Z)) :- inst(x("c1064-2",0,0,2,(Z,))).
superior(x("c1064-2",0,0,2,(Z,)),r("c1064-2",0,0,(Z,))) :- inst(x("c1064-2",0,0,2,(Z,))).
exc(x("c1064-2",0,0,2,(Z,)),r("c1064-2",0,0,(Z,)),constitutiveRule,non(jointMaritalDebt(Z))) :- inst(x("c1064-2",0,0,2,(Z,))).

% c1064-2-proof[0.0] 债权人能够证明用于夫妻共同生活、共同生产经营或基于共同意思表示的，属于共同债务（第1064条第2款；npc）
inst(r("c1064-2-proof",0,0,(Z,))) :- cand(debtOf(Z)), cand(creditorProvesCommonUse(Z)).
constitutiveRule(r("c1064-2-proof",0,0,(Z,)),jointMaritalDebt(Z)) :- inst(r("c1064-2-proof",0,0,(Z,))).
mainHead(r("c1064-2-proof",0,0,(Z,)),constitutiveRule,jointMaritalDebt(Z)) :- inst(r("c1064-2-proof",0,0,(Z,))).
cand(jointMaritalDebt(Z)) :- inst(r("c1064-2-proof",0,0,(Z,))).
body(r("c1064-2-proof",0,0,(Z,)),debtOf(Z)) :- inst(r("c1064-2-proof",0,0,(Z,))).
body(r("c1064-2-proof",0,0,(Z,)),creditorProvesCommonUse(Z)) :- inst(r("c1064-2-proof",0,0,(Z,))).

% tx-g6830[0.0] 分类（自动抽取自图的层级）：其他重大过错 ⊑ 法定过错
inst(r("tx-g6830",0,0,(X,))) :- cand(isA(X,"其他重大过错")).
constitutiveRule(r("tx-g6830",0,0,(X,)),isA(X,"法定过错")) :- inst(r("tx-g6830",0,0,(X,))).
mainHead(r("tx-g6830",0,0,(X,)),constitutiveRule,isA(X,"法定过错")) :- inst(r("tx-g6830",0,0,(X,))).
cand(isA(X,"法定过错")) :- inst(r("tx-g6830",0,0,(X,))).
body(r("tx-g6830",0,0,(X,)),isA(X,"其他重大过错")) :- inst(r("tx-g6830",0,0,(X,))).

% tx-g6850[0.0] 分类（自动抽取自图的层级）：被收养人的条件 ⊑ 收养关系成立的实质条件
inst(r("tx-g6850",0,0,(X,))) :- cand(isA(X,"被收养人的条件")).
constitutiveRule(r("tx-g6850",0,0,(X,)),isA(X,"收养关系成立的实质条件")) :- inst(r("tx-g6850",0,0,(X,))).
mainHead(r("tx-g6850",0,0,(X,)),constitutiveRule,isA(X,"收养关系成立的实质条件")) :- inst(r("tx-g6850",0,0,(X,))).
cand(isA(X,"收养关系成立的实质条件")) :- inst(r("tx-g6850",0,0,(X,))).
body(r("tx-g6850",0,0,(X,)),isA(X,"被收养人的条件")) :- inst(r("tx-g6850",0,0,(X,))).

% tx-g6855[0.0] 分类（自动抽取自图的层级）：送养人的条件 ⊑ 收养关系成立的实质条件
inst(r("tx-g6855",0,0,(X,))) :- cand(isA(X,"送养人的条件")).
constitutiveRule(r("tx-g6855",0,0,(X,)),isA(X,"收养关系成立的实质条件")) :- inst(r("tx-g6855",0,0,(X,))).
mainHead(r("tx-g6855",0,0,(X,)),constitutiveRule,isA(X,"收养关系成立的实质条件")) :- inst(r("tx-g6855",0,0,(X,))).
cand(isA(X,"收养关系成立的实质条件")) :- inst(r("tx-g6855",0,0,(X,))).
body(r("tx-g6855",0,0,(X,)),isA(X,"送养人的条件")) :- inst(r("tx-g6855",0,0,(X,))).

% tx-g6862[0.0] 分类（自动抽取自图的层级）：收养人的条件 ⊑ 收养关系成立的实质条件
inst(r("tx-g6862",0,0,(X,))) :- cand(isA(X,"收养人的条件")).
constitutiveRule(r("tx-g6862",0,0,(X,)),isA(X,"收养关系成立的实质条件")) :- inst(r("tx-g6862",0,0,(X,))).
mainHead(r("tx-g6862",0,0,(X,)),constitutiveRule,isA(X,"收养关系成立的实质条件")) :- inst(r("tx-g6862",0,0,(X,))).
cand(isA(X,"收养关系成立的实质条件")) :- inst(r("tx-g6862",0,0,(X,))).
body(r("tx-g6862",0,0,(X,)),isA(X,"收养人的条件")) :- inst(r("tx-g6862",0,0,(X,))).

% c1125[0.0] 故意杀害被继承人、为争夺遗产杀害其他继承人、遗弃或严重虐待、伪造篡改隐匿销毁遗嘱、欺诈胁迫影响遗嘱等，丧失继承权（第1125条第1款；npc
inst(r("c1125",0,0,(D,H,))) :- cand(heirCandidate(H,D)), cand(killedDeceased(H,D)).
constitutiveRule(r("c1125",0,0,(D,H,)),disinherited(H,D)) :- inst(r("c1125",0,0,(D,H,))).
mainHead(r("c1125",0,0,(D,H,)),constitutiveRule,disinherited(H,D)) :- inst(r("c1125",0,0,(D,H,))).
cand(disinherited(H,D)) :- inst(r("c1125",0,0,(D,H,))).
body(r("c1125",0,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c1125",0,0,(D,H,))).
body(r("c1125",0,0,(D,H,)),killedDeceased(H,D)) :- inst(r("c1125",0,0,(D,H,))).
% c1125[1.0] 故意杀害被继承人、为争夺遗产杀害其他继承人、遗弃或严重虐待、伪造篡改隐匿销毁遗嘱、欺诈胁迫影响遗嘱等，丧失继承权（第1125条第1款；npc
inst(r("c1125",1,0,(D,H,))) :- cand(heirCandidate(H,D)), cand(killedCoHeirForEstate(H,D)).
constitutiveRule(r("c1125",1,0,(D,H,)),disinherited(H,D)) :- inst(r("c1125",1,0,(D,H,))).
mainHead(r("c1125",1,0,(D,H,)),constitutiveRule,disinherited(H,D)) :- inst(r("c1125",1,0,(D,H,))).
cand(disinherited(H,D)) :- inst(r("c1125",1,0,(D,H,))).
body(r("c1125",1,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c1125",1,0,(D,H,))).
body(r("c1125",1,0,(D,H,)),killedCoHeirForEstate(H,D)) :- inst(r("c1125",1,0,(D,H,))).
% c1125[2.0] 故意杀害被继承人、为争夺遗产杀害其他继承人、遗弃或严重虐待、伪造篡改隐匿销毁遗嘱、欺诈胁迫影响遗嘱等，丧失继承权（第1125条第1款；npc
inst(r("c1125",2,0,(D,H,))) :- cand(heirCandidate(H,D)), cand(abandonedOrSeriouslyAbused(H,D)).
constitutiveRule(r("c1125",2,0,(D,H,)),disinherited(H,D)) :- inst(r("c1125",2,0,(D,H,))).
mainHead(r("c1125",2,0,(D,H,)),constitutiveRule,disinherited(H,D)) :- inst(r("c1125",2,0,(D,H,))).
cand(disinherited(H,D)) :- inst(r("c1125",2,0,(D,H,))).
body(r("c1125",2,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c1125",2,0,(D,H,))).
body(r("c1125",2,0,(D,H,)),abandonedOrSeriouslyAbused(H,D)) :- inst(r("c1125",2,0,(D,H,))).
% c1125[3.0] 故意杀害被继承人、为争夺遗产杀害其他继承人、遗弃或严重虐待、伪造篡改隐匿销毁遗嘱、欺诈胁迫影响遗嘱等，丧失继承权（第1125条第1款；npc
inst(r("c1125",3,0,(D,H,))) :- cand(heirCandidate(H,D)), cand(forgedOrDestroyedWillSeriously(H,D)).
constitutiveRule(r("c1125",3,0,(D,H,)),disinherited(H,D)) :- inst(r("c1125",3,0,(D,H,))).
mainHead(r("c1125",3,0,(D,H,)),constitutiveRule,disinherited(H,D)) :- inst(r("c1125",3,0,(D,H,))).
cand(disinherited(H,D)) :- inst(r("c1125",3,0,(D,H,))).
body(r("c1125",3,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c1125",3,0,(D,H,))).
body(r("c1125",3,0,(D,H,)),forgedOrDestroyedWillSeriously(H,D)) :- inst(r("c1125",3,0,(D,H,))).
% c1125[4.0] 故意杀害被继承人、为争夺遗产杀害其他继承人、遗弃或严重虐待、伪造篡改隐匿销毁遗嘱、欺诈胁迫影响遗嘱等，丧失继承权（第1125条第1款；npc
inst(r("c1125",4,0,(D,H,))) :- cand(heirCandidate(H,D)), cand(coercedWillSeriously(H,D)).
constitutiveRule(r("c1125",4,0,(D,H,)),disinherited(H,D)) :- inst(r("c1125",4,0,(D,H,))).
mainHead(r("c1125",4,0,(D,H,)),constitutiveRule,disinherited(H,D)) :- inst(r("c1125",4,0,(D,H,))).
cand(disinherited(H,D)) :- inst(r("c1125",4,0,(D,H,))).
body(r("c1125",4,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c1125",4,0,(D,H,))).
body(r("c1125",4,0,(D,H,)),coercedWillSeriously(H,D)) :- inst(r("c1125",4,0,(D,H,))).

% c1125-2[0.0] 有第三至五项行为，确有悔改表现，被继承人表示宽恕或在遗嘱中将其列为继承人的，不丧失继承权（第一、二项不可宽恕）（第1125条第2款；npc）
inst(r("c1125-2",0,0,(D,H,))) :- cand(heirCandidate(H,D)), cand(abandonedOrSeriouslyAbused(H,D)), cand(repented(H,D)), cand(forgivenByDeceased(H,D)).
constitutiveRule(r("c1125-2",0,0,(D,H,)),non(disinherited(H,D))) :- inst(r("c1125-2",0,0,(D,H,))).
mainHead(r("c1125-2",0,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(r("c1125-2",0,0,(D,H,))).
cand(disinherited(H,D)) :- inst(r("c1125-2",0,0,(D,H,))).
body(r("c1125-2",0,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c1125-2",0,0,(D,H,))).
body(r("c1125-2",0,0,(D,H,)),abandonedOrSeriouslyAbused(H,D)) :- inst(r("c1125-2",0,0,(D,H,))).
body(r("c1125-2",0,0,(D,H,)),repented(H,D)) :- inst(r("c1125-2",0,0,(D,H,))).
body(r("c1125-2",0,0,(D,H,)),forgivenByDeceased(H,D)) :- inst(r("c1125-2",0,0,(D,H,))).
inst(x("c1125-2",0,0,0,(D,H,))) :- inst(r("c1125-2",0,0,(D,H,))), cand(killedDeceased(H,D)).
constitutiveRule(x("c1125-2",0,0,0,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",0,0,0,(D,H,))).
body(x("c1125-2",0,0,0,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",0,0,0,(D,H,))).
body(x("c1125-2",0,0,0,(D,H,)),abandonedOrSeriouslyAbused(H,D)) :- inst(x("c1125-2",0,0,0,(D,H,))).
body(x("c1125-2",0,0,0,(D,H,)),repented(H,D)) :- inst(x("c1125-2",0,0,0,(D,H,))).
body(x("c1125-2",0,0,0,(D,H,)),forgivenByDeceased(H,D)) :- inst(x("c1125-2",0,0,0,(D,H,))).
body(x("c1125-2",0,0,0,(D,H,)),killedDeceased(H,D)) :- inst(x("c1125-2",0,0,0,(D,H,))).
superior(x("c1125-2",0,0,0,(D,H,)),r("c1125-2",0,0,(D,H,))) :- inst(x("c1125-2",0,0,0,(D,H,))).
exc(x("c1125-2",0,0,0,(D,H,)),r("c1125-2",0,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",0,0,0,(D,H,))).
inst(x("c1125-2",0,0,1,(D,H,))) :- inst(r("c1125-2",0,0,(D,H,))), cand(killedCoHeirForEstate(H,D)).
constitutiveRule(x("c1125-2",0,0,1,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",0,0,1,(D,H,))).
body(x("c1125-2",0,0,1,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",0,0,1,(D,H,))).
body(x("c1125-2",0,0,1,(D,H,)),abandonedOrSeriouslyAbused(H,D)) :- inst(x("c1125-2",0,0,1,(D,H,))).
body(x("c1125-2",0,0,1,(D,H,)),repented(H,D)) :- inst(x("c1125-2",0,0,1,(D,H,))).
body(x("c1125-2",0,0,1,(D,H,)),forgivenByDeceased(H,D)) :- inst(x("c1125-2",0,0,1,(D,H,))).
body(x("c1125-2",0,0,1,(D,H,)),killedCoHeirForEstate(H,D)) :- inst(x("c1125-2",0,0,1,(D,H,))).
superior(x("c1125-2",0,0,1,(D,H,)),r("c1125-2",0,0,(D,H,))) :- inst(x("c1125-2",0,0,1,(D,H,))).
exc(x("c1125-2",0,0,1,(D,H,)),r("c1125-2",0,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",0,0,1,(D,H,))).
% c1125-2[1.0] 有第三至五项行为，确有悔改表现，被继承人表示宽恕或在遗嘱中将其列为继承人的，不丧失继承权（第一、二项不可宽恕）（第1125条第2款；npc）
inst(r("c1125-2",1,0,(D,H,))) :- cand(heirCandidate(H,D)), cand(abandonedOrSeriouslyAbused(H,D)), cand(repented(H,D)), cand(namedInLaterWill(H,D)).
constitutiveRule(r("c1125-2",1,0,(D,H,)),non(disinherited(H,D))) :- inst(r("c1125-2",1,0,(D,H,))).
mainHead(r("c1125-2",1,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(r("c1125-2",1,0,(D,H,))).
cand(disinherited(H,D)) :- inst(r("c1125-2",1,0,(D,H,))).
body(r("c1125-2",1,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c1125-2",1,0,(D,H,))).
body(r("c1125-2",1,0,(D,H,)),abandonedOrSeriouslyAbused(H,D)) :- inst(r("c1125-2",1,0,(D,H,))).
body(r("c1125-2",1,0,(D,H,)),repented(H,D)) :- inst(r("c1125-2",1,0,(D,H,))).
body(r("c1125-2",1,0,(D,H,)),namedInLaterWill(H,D)) :- inst(r("c1125-2",1,0,(D,H,))).
inst(x("c1125-2",1,0,0,(D,H,))) :- inst(r("c1125-2",1,0,(D,H,))), cand(killedDeceased(H,D)).
constitutiveRule(x("c1125-2",1,0,0,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",1,0,0,(D,H,))).
body(x("c1125-2",1,0,0,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",1,0,0,(D,H,))).
body(x("c1125-2",1,0,0,(D,H,)),abandonedOrSeriouslyAbused(H,D)) :- inst(x("c1125-2",1,0,0,(D,H,))).
body(x("c1125-2",1,0,0,(D,H,)),repented(H,D)) :- inst(x("c1125-2",1,0,0,(D,H,))).
body(x("c1125-2",1,0,0,(D,H,)),namedInLaterWill(H,D)) :- inst(x("c1125-2",1,0,0,(D,H,))).
body(x("c1125-2",1,0,0,(D,H,)),killedDeceased(H,D)) :- inst(x("c1125-2",1,0,0,(D,H,))).
superior(x("c1125-2",1,0,0,(D,H,)),r("c1125-2",1,0,(D,H,))) :- inst(x("c1125-2",1,0,0,(D,H,))).
exc(x("c1125-2",1,0,0,(D,H,)),r("c1125-2",1,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",1,0,0,(D,H,))).
inst(x("c1125-2",1,0,1,(D,H,))) :- inst(r("c1125-2",1,0,(D,H,))), cand(killedCoHeirForEstate(H,D)).
constitutiveRule(x("c1125-2",1,0,1,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",1,0,1,(D,H,))).
body(x("c1125-2",1,0,1,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",1,0,1,(D,H,))).
body(x("c1125-2",1,0,1,(D,H,)),abandonedOrSeriouslyAbused(H,D)) :- inst(x("c1125-2",1,0,1,(D,H,))).
body(x("c1125-2",1,0,1,(D,H,)),repented(H,D)) :- inst(x("c1125-2",1,0,1,(D,H,))).
body(x("c1125-2",1,0,1,(D,H,)),namedInLaterWill(H,D)) :- inst(x("c1125-2",1,0,1,(D,H,))).
body(x("c1125-2",1,0,1,(D,H,)),killedCoHeirForEstate(H,D)) :- inst(x("c1125-2",1,0,1,(D,H,))).
superior(x("c1125-2",1,0,1,(D,H,)),r("c1125-2",1,0,(D,H,))) :- inst(x("c1125-2",1,0,1,(D,H,))).
exc(x("c1125-2",1,0,1,(D,H,)),r("c1125-2",1,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",1,0,1,(D,H,))).
% c1125-2[2.0] 有第三至五项行为，确有悔改表现，被继承人表示宽恕或在遗嘱中将其列为继承人的，不丧失继承权（第一、二项不可宽恕）（第1125条第2款；npc）
inst(r("c1125-2",2,0,(D,H,))) :- cand(heirCandidate(H,D)), cand(forgedOrDestroyedWillSeriously(H,D)), cand(repented(H,D)), cand(forgivenByDeceased(H,D)).
constitutiveRule(r("c1125-2",2,0,(D,H,)),non(disinherited(H,D))) :- inst(r("c1125-2",2,0,(D,H,))).
mainHead(r("c1125-2",2,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(r("c1125-2",2,0,(D,H,))).
cand(disinherited(H,D)) :- inst(r("c1125-2",2,0,(D,H,))).
body(r("c1125-2",2,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c1125-2",2,0,(D,H,))).
body(r("c1125-2",2,0,(D,H,)),forgedOrDestroyedWillSeriously(H,D)) :- inst(r("c1125-2",2,0,(D,H,))).
body(r("c1125-2",2,0,(D,H,)),repented(H,D)) :- inst(r("c1125-2",2,0,(D,H,))).
body(r("c1125-2",2,0,(D,H,)),forgivenByDeceased(H,D)) :- inst(r("c1125-2",2,0,(D,H,))).
inst(x("c1125-2",2,0,0,(D,H,))) :- inst(r("c1125-2",2,0,(D,H,))), cand(killedDeceased(H,D)).
constitutiveRule(x("c1125-2",2,0,0,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",2,0,0,(D,H,))).
body(x("c1125-2",2,0,0,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",2,0,0,(D,H,))).
body(x("c1125-2",2,0,0,(D,H,)),forgedOrDestroyedWillSeriously(H,D)) :- inst(x("c1125-2",2,0,0,(D,H,))).
body(x("c1125-2",2,0,0,(D,H,)),repented(H,D)) :- inst(x("c1125-2",2,0,0,(D,H,))).
body(x("c1125-2",2,0,0,(D,H,)),forgivenByDeceased(H,D)) :- inst(x("c1125-2",2,0,0,(D,H,))).
body(x("c1125-2",2,0,0,(D,H,)),killedDeceased(H,D)) :- inst(x("c1125-2",2,0,0,(D,H,))).
superior(x("c1125-2",2,0,0,(D,H,)),r("c1125-2",2,0,(D,H,))) :- inst(x("c1125-2",2,0,0,(D,H,))).
exc(x("c1125-2",2,0,0,(D,H,)),r("c1125-2",2,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",2,0,0,(D,H,))).
inst(x("c1125-2",2,0,1,(D,H,))) :- inst(r("c1125-2",2,0,(D,H,))), cand(killedCoHeirForEstate(H,D)).
constitutiveRule(x("c1125-2",2,0,1,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",2,0,1,(D,H,))).
body(x("c1125-2",2,0,1,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",2,0,1,(D,H,))).
body(x("c1125-2",2,0,1,(D,H,)),forgedOrDestroyedWillSeriously(H,D)) :- inst(x("c1125-2",2,0,1,(D,H,))).
body(x("c1125-2",2,0,1,(D,H,)),repented(H,D)) :- inst(x("c1125-2",2,0,1,(D,H,))).
body(x("c1125-2",2,0,1,(D,H,)),forgivenByDeceased(H,D)) :- inst(x("c1125-2",2,0,1,(D,H,))).
body(x("c1125-2",2,0,1,(D,H,)),killedCoHeirForEstate(H,D)) :- inst(x("c1125-2",2,0,1,(D,H,))).
superior(x("c1125-2",2,0,1,(D,H,)),r("c1125-2",2,0,(D,H,))) :- inst(x("c1125-2",2,0,1,(D,H,))).
exc(x("c1125-2",2,0,1,(D,H,)),r("c1125-2",2,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",2,0,1,(D,H,))).
% c1125-2[3.0] 有第三至五项行为，确有悔改表现，被继承人表示宽恕或在遗嘱中将其列为继承人的，不丧失继承权（第一、二项不可宽恕）（第1125条第2款；npc）
inst(r("c1125-2",3,0,(D,H,))) :- cand(heirCandidate(H,D)), cand(forgedOrDestroyedWillSeriously(H,D)), cand(repented(H,D)), cand(namedInLaterWill(H,D)).
constitutiveRule(r("c1125-2",3,0,(D,H,)),non(disinherited(H,D))) :- inst(r("c1125-2",3,0,(D,H,))).
mainHead(r("c1125-2",3,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(r("c1125-2",3,0,(D,H,))).
cand(disinherited(H,D)) :- inst(r("c1125-2",3,0,(D,H,))).
body(r("c1125-2",3,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c1125-2",3,0,(D,H,))).
body(r("c1125-2",3,0,(D,H,)),forgedOrDestroyedWillSeriously(H,D)) :- inst(r("c1125-2",3,0,(D,H,))).
body(r("c1125-2",3,0,(D,H,)),repented(H,D)) :- inst(r("c1125-2",3,0,(D,H,))).
body(r("c1125-2",3,0,(D,H,)),namedInLaterWill(H,D)) :- inst(r("c1125-2",3,0,(D,H,))).
inst(x("c1125-2",3,0,0,(D,H,))) :- inst(r("c1125-2",3,0,(D,H,))), cand(killedDeceased(H,D)).
constitutiveRule(x("c1125-2",3,0,0,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",3,0,0,(D,H,))).
body(x("c1125-2",3,0,0,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",3,0,0,(D,H,))).
body(x("c1125-2",3,0,0,(D,H,)),forgedOrDestroyedWillSeriously(H,D)) :- inst(x("c1125-2",3,0,0,(D,H,))).
body(x("c1125-2",3,0,0,(D,H,)),repented(H,D)) :- inst(x("c1125-2",3,0,0,(D,H,))).
body(x("c1125-2",3,0,0,(D,H,)),namedInLaterWill(H,D)) :- inst(x("c1125-2",3,0,0,(D,H,))).
body(x("c1125-2",3,0,0,(D,H,)),killedDeceased(H,D)) :- inst(x("c1125-2",3,0,0,(D,H,))).
superior(x("c1125-2",3,0,0,(D,H,)),r("c1125-2",3,0,(D,H,))) :- inst(x("c1125-2",3,0,0,(D,H,))).
exc(x("c1125-2",3,0,0,(D,H,)),r("c1125-2",3,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",3,0,0,(D,H,))).
inst(x("c1125-2",3,0,1,(D,H,))) :- inst(r("c1125-2",3,0,(D,H,))), cand(killedCoHeirForEstate(H,D)).
constitutiveRule(x("c1125-2",3,0,1,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",3,0,1,(D,H,))).
body(x("c1125-2",3,0,1,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",3,0,1,(D,H,))).
body(x("c1125-2",3,0,1,(D,H,)),forgedOrDestroyedWillSeriously(H,D)) :- inst(x("c1125-2",3,0,1,(D,H,))).
body(x("c1125-2",3,0,1,(D,H,)),repented(H,D)) :- inst(x("c1125-2",3,0,1,(D,H,))).
body(x("c1125-2",3,0,1,(D,H,)),namedInLaterWill(H,D)) :- inst(x("c1125-2",3,0,1,(D,H,))).
body(x("c1125-2",3,0,1,(D,H,)),killedCoHeirForEstate(H,D)) :- inst(x("c1125-2",3,0,1,(D,H,))).
superior(x("c1125-2",3,0,1,(D,H,)),r("c1125-2",3,0,(D,H,))) :- inst(x("c1125-2",3,0,1,(D,H,))).
exc(x("c1125-2",3,0,1,(D,H,)),r("c1125-2",3,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",3,0,1,(D,H,))).
% c1125-2[4.0] 有第三至五项行为，确有悔改表现，被继承人表示宽恕或在遗嘱中将其列为继承人的，不丧失继承权（第一、二项不可宽恕）（第1125条第2款；npc）
inst(r("c1125-2",4,0,(D,H,))) :- cand(heirCandidate(H,D)), cand(coercedWillSeriously(H,D)), cand(repented(H,D)), cand(forgivenByDeceased(H,D)).
constitutiveRule(r("c1125-2",4,0,(D,H,)),non(disinherited(H,D))) :- inst(r("c1125-2",4,0,(D,H,))).
mainHead(r("c1125-2",4,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(r("c1125-2",4,0,(D,H,))).
cand(disinherited(H,D)) :- inst(r("c1125-2",4,0,(D,H,))).
body(r("c1125-2",4,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c1125-2",4,0,(D,H,))).
body(r("c1125-2",4,0,(D,H,)),coercedWillSeriously(H,D)) :- inst(r("c1125-2",4,0,(D,H,))).
body(r("c1125-2",4,0,(D,H,)),repented(H,D)) :- inst(r("c1125-2",4,0,(D,H,))).
body(r("c1125-2",4,0,(D,H,)),forgivenByDeceased(H,D)) :- inst(r("c1125-2",4,0,(D,H,))).
inst(x("c1125-2",4,0,0,(D,H,))) :- inst(r("c1125-2",4,0,(D,H,))), cand(killedDeceased(H,D)).
constitutiveRule(x("c1125-2",4,0,0,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",4,0,0,(D,H,))).
body(x("c1125-2",4,0,0,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",4,0,0,(D,H,))).
body(x("c1125-2",4,0,0,(D,H,)),coercedWillSeriously(H,D)) :- inst(x("c1125-2",4,0,0,(D,H,))).
body(x("c1125-2",4,0,0,(D,H,)),repented(H,D)) :- inst(x("c1125-2",4,0,0,(D,H,))).
body(x("c1125-2",4,0,0,(D,H,)),forgivenByDeceased(H,D)) :- inst(x("c1125-2",4,0,0,(D,H,))).
body(x("c1125-2",4,0,0,(D,H,)),killedDeceased(H,D)) :- inst(x("c1125-2",4,0,0,(D,H,))).
superior(x("c1125-2",4,0,0,(D,H,)),r("c1125-2",4,0,(D,H,))) :- inst(x("c1125-2",4,0,0,(D,H,))).
exc(x("c1125-2",4,0,0,(D,H,)),r("c1125-2",4,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",4,0,0,(D,H,))).
inst(x("c1125-2",4,0,1,(D,H,))) :- inst(r("c1125-2",4,0,(D,H,))), cand(killedCoHeirForEstate(H,D)).
constitutiveRule(x("c1125-2",4,0,1,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",4,0,1,(D,H,))).
body(x("c1125-2",4,0,1,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",4,0,1,(D,H,))).
body(x("c1125-2",4,0,1,(D,H,)),coercedWillSeriously(H,D)) :- inst(x("c1125-2",4,0,1,(D,H,))).
body(x("c1125-2",4,0,1,(D,H,)),repented(H,D)) :- inst(x("c1125-2",4,0,1,(D,H,))).
body(x("c1125-2",4,0,1,(D,H,)),forgivenByDeceased(H,D)) :- inst(x("c1125-2",4,0,1,(D,H,))).
body(x("c1125-2",4,0,1,(D,H,)),killedCoHeirForEstate(H,D)) :- inst(x("c1125-2",4,0,1,(D,H,))).
superior(x("c1125-2",4,0,1,(D,H,)),r("c1125-2",4,0,(D,H,))) :- inst(x("c1125-2",4,0,1,(D,H,))).
exc(x("c1125-2",4,0,1,(D,H,)),r("c1125-2",4,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",4,0,1,(D,H,))).
% c1125-2[5.0] 有第三至五项行为，确有悔改表现，被继承人表示宽恕或在遗嘱中将其列为继承人的，不丧失继承权（第一、二项不可宽恕）（第1125条第2款；npc）
inst(r("c1125-2",5,0,(D,H,))) :- cand(heirCandidate(H,D)), cand(coercedWillSeriously(H,D)), cand(repented(H,D)), cand(namedInLaterWill(H,D)).
constitutiveRule(r("c1125-2",5,0,(D,H,)),non(disinherited(H,D))) :- inst(r("c1125-2",5,0,(D,H,))).
mainHead(r("c1125-2",5,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(r("c1125-2",5,0,(D,H,))).
cand(disinherited(H,D)) :- inst(r("c1125-2",5,0,(D,H,))).
body(r("c1125-2",5,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c1125-2",5,0,(D,H,))).
body(r("c1125-2",5,0,(D,H,)),coercedWillSeriously(H,D)) :- inst(r("c1125-2",5,0,(D,H,))).
body(r("c1125-2",5,0,(D,H,)),repented(H,D)) :- inst(r("c1125-2",5,0,(D,H,))).
body(r("c1125-2",5,0,(D,H,)),namedInLaterWill(H,D)) :- inst(r("c1125-2",5,0,(D,H,))).
inst(x("c1125-2",5,0,0,(D,H,))) :- inst(r("c1125-2",5,0,(D,H,))), cand(killedDeceased(H,D)).
constitutiveRule(x("c1125-2",5,0,0,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",5,0,0,(D,H,))).
body(x("c1125-2",5,0,0,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",5,0,0,(D,H,))).
body(x("c1125-2",5,0,0,(D,H,)),coercedWillSeriously(H,D)) :- inst(x("c1125-2",5,0,0,(D,H,))).
body(x("c1125-2",5,0,0,(D,H,)),repented(H,D)) :- inst(x("c1125-2",5,0,0,(D,H,))).
body(x("c1125-2",5,0,0,(D,H,)),namedInLaterWill(H,D)) :- inst(x("c1125-2",5,0,0,(D,H,))).
body(x("c1125-2",5,0,0,(D,H,)),killedDeceased(H,D)) :- inst(x("c1125-2",5,0,0,(D,H,))).
superior(x("c1125-2",5,0,0,(D,H,)),r("c1125-2",5,0,(D,H,))) :- inst(x("c1125-2",5,0,0,(D,H,))).
exc(x("c1125-2",5,0,0,(D,H,)),r("c1125-2",5,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",5,0,0,(D,H,))).
inst(x("c1125-2",5,0,1,(D,H,))) :- inst(r("c1125-2",5,0,(D,H,))), cand(killedCoHeirForEstate(H,D)).
constitutiveRule(x("c1125-2",5,0,1,(D,H,)),disinherited(H,D)) :- inst(x("c1125-2",5,0,1,(D,H,))).
body(x("c1125-2",5,0,1,(D,H,)),heirCandidate(H,D)) :- inst(x("c1125-2",5,0,1,(D,H,))).
body(x("c1125-2",5,0,1,(D,H,)),coercedWillSeriously(H,D)) :- inst(x("c1125-2",5,0,1,(D,H,))).
body(x("c1125-2",5,0,1,(D,H,)),repented(H,D)) :- inst(x("c1125-2",5,0,1,(D,H,))).
body(x("c1125-2",5,0,1,(D,H,)),namedInLaterWill(H,D)) :- inst(x("c1125-2",5,0,1,(D,H,))).
body(x("c1125-2",5,0,1,(D,H,)),killedCoHeirForEstate(H,D)) :- inst(x("c1125-2",5,0,1,(D,H,))).
superior(x("c1125-2",5,0,1,(D,H,)),r("c1125-2",5,0,(D,H,))) :- inst(x("c1125-2",5,0,1,(D,H,))).
exc(x("c1125-2",5,0,1,(D,H,)),r("c1125-2",5,0,(D,H,)),constitutiveRule,non(disinherited(H,D))) :- inst(x("c1125-2",5,0,1,(D,H,))).

% c1123-intestate[0.0] 继承开始后，按照法定继承办理（第1123条；npc）
inst(r("c1123-intestate",0,0,(D,E,))) :- cand(estateOf(E,D)).
constitutiveRule(r("c1123-intestate",0,0,(D,E,)),byIntestacy(E)) :- inst(r("c1123-intestate",0,0,(D,E,))).
mainHead(r("c1123-intestate",0,0,(D,E,)),constitutiveRule,byIntestacy(E)) :- inst(r("c1123-intestate",0,0,(D,E,))).
cand(byIntestacy(E)) :- inst(r("c1123-intestate",0,0,(D,E,))).
body(r("c1123-intestate",0,0,(D,E,)),estateOf(E,D)) :- inst(r("c1123-intestate",0,0,(D,E,))).
inst(x("c1123-intestate",0,0,0,(D,E,))) :- inst(r("c1123-intestate",0,0,(D,E,))), cand(supportAgreementCovers(E)).
constitutiveRule(x("c1123-intestate",0,0,0,(D,E,)),non(byIntestacy(E))) :- inst(x("c1123-intestate",0,0,0,(D,E,))).
body(x("c1123-intestate",0,0,0,(D,E,)),estateOf(E,D)) :- inst(x("c1123-intestate",0,0,0,(D,E,))).
body(x("c1123-intestate",0,0,0,(D,E,)),supportAgreementCovers(E)) :- inst(x("c1123-intestate",0,0,0,(D,E,))).
superior(x("c1123-intestate",0,0,0,(D,E,)),r("c1123-intestate",0,0,(D,E,))) :- inst(x("c1123-intestate",0,0,0,(D,E,))).
exc(x("c1123-intestate",0,0,0,(D,E,)),r("c1123-intestate",0,0,(D,E,)),constitutiveRule,byIntestacy(E)) :- inst(x("c1123-intestate",0,0,0,(D,E,))).
inst(x("c1123-intestate",0,0,1,(D,E,))) :- inst(r("c1123-intestate",0,0,(D,E,))), cand(effectiveWillCovers(E)).
constitutiveRule(x("c1123-intestate",0,0,1,(D,E,)),non(byIntestacy(E))) :- inst(x("c1123-intestate",0,0,1,(D,E,))).
body(x("c1123-intestate",0,0,1,(D,E,)),estateOf(E,D)) :- inst(x("c1123-intestate",0,0,1,(D,E,))).
body(x("c1123-intestate",0,0,1,(D,E,)),effectiveWillCovers(E)) :- inst(x("c1123-intestate",0,0,1,(D,E,))).
superior(x("c1123-intestate",0,0,1,(D,E,)),r("c1123-intestate",0,0,(D,E,))) :- inst(x("c1123-intestate",0,0,1,(D,E,))).
exc(x("c1123-intestate",0,0,1,(D,E,)),r("c1123-intestate",0,0,(D,E,)),constitutiveRule,byIntestacy(E)) :- inst(x("c1123-intestate",0,0,1,(D,E,))).

% c1127-child[0.0] 子女包括婚生子女、非婚生子女、养子女和有扶养关系的继子女（第1127条第3款；npc）
inst(r("c1127-child",0,0,(C,D,))) :- cand(biologicalChild(C,D)).
constitutiveRule(r("c1127-child",0,0,(C,D,)),childOf(C,D)) :- inst(r("c1127-child",0,0,(C,D,))).
mainHead(r("c1127-child",0,0,(C,D,)),constitutiveRule,childOf(C,D)) :- inst(r("c1127-child",0,0,(C,D,))).
cand(childOf(C,D)) :- inst(r("c1127-child",0,0,(C,D,))).
body(r("c1127-child",0,0,(C,D,)),biologicalChild(C,D)) :- inst(r("c1127-child",0,0,(C,D,))).
% c1127-child[1.0] 子女包括婚生子女、非婚生子女、养子女和有扶养关系的继子女（第1127条第3款；npc）
inst(r("c1127-child",1,0,(C,D,))) :- cand(adoptedChild(C,D)).
constitutiveRule(r("c1127-child",1,0,(C,D,)),childOf(C,D)) :- inst(r("c1127-child",1,0,(C,D,))).
mainHead(r("c1127-child",1,0,(C,D,)),constitutiveRule,childOf(C,D)) :- inst(r("c1127-child",1,0,(C,D,))).
cand(childOf(C,D)) :- inst(r("c1127-child",1,0,(C,D,))).
body(r("c1127-child",1,0,(C,D,)),adoptedChild(C,D)) :- inst(r("c1127-child",1,0,(C,D,))).
% c1127-child[2.0] 子女包括婚生子女、非婚生子女、养子女和有扶养关系的继子女（第1127条第3款；npc）
inst(r("c1127-child",2,0,(C,D,))) :- cand(stepchildWithSupport(C,D)).
constitutiveRule(r("c1127-child",2,0,(C,D,)),childOf(C,D)) :- inst(r("c1127-child",2,0,(C,D,))).
mainHead(r("c1127-child",2,0,(C,D,)),constitutiveRule,childOf(C,D)) :- inst(r("c1127-child",2,0,(C,D,))).
cand(childOf(C,D)) :- inst(r("c1127-child",2,0,(C,D,))).
body(r("c1127-child",2,0,(C,D,)),stepchildWithSupport(C,D)) :- inst(r("c1127-child",2,0,(C,D,))).

% c1127-parent[0.0] 父母包括生父母、养父母和有扶养关系的继父母（第1127条第4款；npc）
inst(r("c1127-parent",0,0,(D,P,))) :- cand(biologicalParent(P,D)).
constitutiveRule(r("c1127-parent",0,0,(D,P,)),parentOf(P,D)) :- inst(r("c1127-parent",0,0,(D,P,))).
mainHead(r("c1127-parent",0,0,(D,P,)),constitutiveRule,parentOf(P,D)) :- inst(r("c1127-parent",0,0,(D,P,))).
cand(parentOf(P,D)) :- inst(r("c1127-parent",0,0,(D,P,))).
body(r("c1127-parent",0,0,(D,P,)),biologicalParent(P,D)) :- inst(r("c1127-parent",0,0,(D,P,))).
% c1127-parent[1.0] 父母包括生父母、养父母和有扶养关系的继父母（第1127条第4款；npc）
inst(r("c1127-parent",1,0,(D,P,))) :- cand(adoptiveParent(P,D)).
constitutiveRule(r("c1127-parent",1,0,(D,P,)),parentOf(P,D)) :- inst(r("c1127-parent",1,0,(D,P,))).
mainHead(r("c1127-parent",1,0,(D,P,)),constitutiveRule,parentOf(P,D)) :- inst(r("c1127-parent",1,0,(D,P,))).
cand(parentOf(P,D)) :- inst(r("c1127-parent",1,0,(D,P,))).
body(r("c1127-parent",1,0,(D,P,)),adoptiveParent(P,D)) :- inst(r("c1127-parent",1,0,(D,P,))).
% c1127-parent[2.0] 父母包括生父母、养父母和有扶养关系的继父母（第1127条第4款；npc）
inst(r("c1127-parent",2,0,(D,P,))) :- cand(stepparentWithSupport(P,D)).
constitutiveRule(r("c1127-parent",2,0,(D,P,)),parentOf(P,D)) :- inst(r("c1127-parent",2,0,(D,P,))).
mainHead(r("c1127-parent",2,0,(D,P,)),constitutiveRule,parentOf(P,D)) :- inst(r("c1127-parent",2,0,(D,P,))).
cand(parentOf(P,D)) :- inst(r("c1127-parent",2,0,(D,P,))).
body(r("c1127-parent",2,0,(D,P,)),stepparentWithSupport(P,D)) :- inst(r("c1127-parent",2,0,(D,P,))).

% c-heir-cand[0.0] 配偶、子女、父母、兄弟姐妹、祖父母、外祖父母为法定继承人（第1127条第1款；doctrine）
inst(r("c-heir-cand",0,0,(D,H,))) :- cand(firstOrderHeir(H,D)).
constitutiveRule(r("c-heir-cand",0,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c-heir-cand",0,0,(D,H,))).
mainHead(r("c-heir-cand",0,0,(D,H,)),constitutiveRule,heirCandidate(H,D)) :- inst(r("c-heir-cand",0,0,(D,H,))).
cand(heirCandidate(H,D)) :- inst(r("c-heir-cand",0,0,(D,H,))).
body(r("c-heir-cand",0,0,(D,H,)),firstOrderHeir(H,D)) :- inst(r("c-heir-cand",0,0,(D,H,))).
% c-heir-cand[1.0] 配偶、子女、父母、兄弟姐妹、祖父母、外祖父母为法定继承人（第1127条第1款；doctrine）
inst(r("c-heir-cand",1,0,(D,H,))) :- cand(secondOrderHeir(H,D)).
constitutiveRule(r("c-heir-cand",1,0,(D,H,)),heirCandidate(H,D)) :- inst(r("c-heir-cand",1,0,(D,H,))).
mainHead(r("c-heir-cand",1,0,(D,H,)),constitutiveRule,heirCandidate(H,D)) :- inst(r("c-heir-cand",1,0,(D,H,))).
cand(heirCandidate(H,D)) :- inst(r("c-heir-cand",1,0,(D,H,))).
body(r("c-heir-cand",1,0,(D,H,)),secondOrderHeir(H,D)) :- inst(r("c-heir-cand",1,0,(D,H,))).

% c1127-first[0.0] 第一顺序：配偶、子女、父母（第1127条第1款；npc）
inst(r("c1127-first",0,0,(D,H,))) :- cand(spouseOf(H,D)).
constitutiveRule(r("c1127-first",0,0,(D,H,)),firstOrderHeir(H,D)) :- inst(r("c1127-first",0,0,(D,H,))).
mainHead(r("c1127-first",0,0,(D,H,)),constitutiveRule,firstOrderHeir(H,D)) :- inst(r("c1127-first",0,0,(D,H,))).
cand(firstOrderHeir(H,D)) :- inst(r("c1127-first",0,0,(D,H,))).
body(r("c1127-first",0,0,(D,H,)),spouseOf(H,D)) :- inst(r("c1127-first",0,0,(D,H,))).
% c1127-first[1.0] 第一顺序：配偶、子女、父母（第1127条第1款；npc）
inst(r("c1127-first",1,0,(D,H,))) :- cand(childOf(H,D)).
constitutiveRule(r("c1127-first",1,0,(D,H,)),firstOrderHeir(H,D)) :- inst(r("c1127-first",1,0,(D,H,))).
mainHead(r("c1127-first",1,0,(D,H,)),constitutiveRule,firstOrderHeir(H,D)) :- inst(r("c1127-first",1,0,(D,H,))).
cand(firstOrderHeir(H,D)) :- inst(r("c1127-first",1,0,(D,H,))).
body(r("c1127-first",1,0,(D,H,)),childOf(H,D)) :- inst(r("c1127-first",1,0,(D,H,))).
% c1127-first[2.0] 第一顺序：配偶、子女、父母（第1127条第1款；npc）
inst(r("c1127-first",2,0,(D,H,))) :- cand(parentOf(H,D)).
constitutiveRule(r("c1127-first",2,0,(D,H,)),firstOrderHeir(H,D)) :- inst(r("c1127-first",2,0,(D,H,))).
mainHead(r("c1127-first",2,0,(D,H,)),constitutiveRule,firstOrderHeir(H,D)) :- inst(r("c1127-first",2,0,(D,H,))).
cand(firstOrderHeir(H,D)) :- inst(r("c1127-first",2,0,(D,H,))).
body(r("c1127-first",2,0,(D,H,)),parentOf(H,D)) :- inst(r("c1127-first",2,0,(D,H,))).

% c1129[0.0] 丧偶儿媳对公婆、丧偶女婿对岳父母尽了主要赡养义务的，作为第一顺序继承人（第1129条；npc）
inst(r("c1129",0,0,(D,H,))) :- cand(widowedInLaw(H,D)), cand(mainSupportDutyFulfilled(H,D)).
constitutiveRule(r("c1129",0,0,(D,H,)),firstOrderHeir(H,D)) :- inst(r("c1129",0,0,(D,H,))).
mainHead(r("c1129",0,0,(D,H,)),constitutiveRule,firstOrderHeir(H,D)) :- inst(r("c1129",0,0,(D,H,))).
cand(firstOrderHeir(H,D)) :- inst(r("c1129",0,0,(D,H,))).
body(r("c1129",0,0,(D,H,)),widowedInLaw(H,D)) :- inst(r("c1129",0,0,(D,H,))).
body(r("c1129",0,0,(D,H,)),mainSupportDutyFulfilled(H,D)) :- inst(r("c1129",0,0,(D,H,))).

% c1127-2-first[0.0] 继承开始后，由第一顺序继承人继承（第1127条第2款；npc）
inst(r("c1127-2-first",0,0,(D,E,H,))) :- cand(estateOf(E,D)), cand(byIntestacy(E)), cand(firstOrderHeir(H,D)).
constitutiveRule(r("c1127-2-first",0,0,(D,E,H,)),inheritsIntestate(H,E)) :- inst(r("c1127-2-first",0,0,(D,E,H,))).
mainHead(r("c1127-2-first",0,0,(D,E,H,)),constitutiveRule,inheritsIntestate(H,E)) :- inst(r("c1127-2-first",0,0,(D,E,H,))).
cand(inheritsIntestate(H,E)) :- inst(r("c1127-2-first",0,0,(D,E,H,))).
body(r("c1127-2-first",0,0,(D,E,H,)),estateOf(E,D)) :- inst(r("c1127-2-first",0,0,(D,E,H,))).
body(r("c1127-2-first",0,0,(D,E,H,)),byIntestacy(E)) :- inst(r("c1127-2-first",0,0,(D,E,H,))).
body(r("c1127-2-first",0,0,(D,E,H,)),firstOrderHeir(H,D)) :- inst(r("c1127-2-first",0,0,(D,E,H,))).
inst(x("c1127-2-first",0,0,0,(D,E,H,))) :- inst(r("c1127-2-first",0,0,(D,E,H,))), cand(predeceased(H,D)).
constitutiveRule(x("c1127-2-first",0,0,0,(D,E,H,)),non(inheritsIntestate(H,E))) :- inst(x("c1127-2-first",0,0,0,(D,E,H,))).
body(x("c1127-2-first",0,0,0,(D,E,H,)),estateOf(E,D)) :- inst(x("c1127-2-first",0,0,0,(D,E,H,))).
body(x("c1127-2-first",0,0,0,(D,E,H,)),byIntestacy(E)) :- inst(x("c1127-2-first",0,0,0,(D,E,H,))).
body(x("c1127-2-first",0,0,0,(D,E,H,)),firstOrderHeir(H,D)) :- inst(x("c1127-2-first",0,0,0,(D,E,H,))).
body(x("c1127-2-first",0,0,0,(D,E,H,)),predeceased(H,D)) :- inst(x("c1127-2-first",0,0,0,(D,E,H,))).
superior(x("c1127-2-first",0,0,0,(D,E,H,)),r("c1127-2-first",0,0,(D,E,H,))) :- inst(x("c1127-2-first",0,0,0,(D,E,H,))).
exc(x("c1127-2-first",0,0,0,(D,E,H,)),r("c1127-2-first",0,0,(D,E,H,)),constitutiveRule,inheritsIntestate(H,E)) :- inst(x("c1127-2-first",0,0,0,(D,E,H,))).
inst(x("c1127-2-first",0,0,1,(D,E,H,))) :- inst(r("c1127-2-first",0,0,(D,E,H,))), cand(disinherited(H,D)).
constitutiveRule(x("c1127-2-first",0,0,1,(D,E,H,)),non(inheritsIntestate(H,E))) :- inst(x("c1127-2-first",0,0,1,(D,E,H,))).
body(x("c1127-2-first",0,0,1,(D,E,H,)),estateOf(E,D)) :- inst(x("c1127-2-first",0,0,1,(D,E,H,))).
body(x("c1127-2-first",0,0,1,(D,E,H,)),byIntestacy(E)) :- inst(x("c1127-2-first",0,0,1,(D,E,H,))).
body(x("c1127-2-first",0,0,1,(D,E,H,)),firstOrderHeir(H,D)) :- inst(x("c1127-2-first",0,0,1,(D,E,H,))).
body(x("c1127-2-first",0,0,1,(D,E,H,)),disinherited(H,D)) :- inst(x("c1127-2-first",0,0,1,(D,E,H,))).
superior(x("c1127-2-first",0,0,1,(D,E,H,)),r("c1127-2-first",0,0,(D,E,H,))) :- inst(x("c1127-2-first",0,0,1,(D,E,H,))).
exc(x("c1127-2-first",0,0,1,(D,E,H,)),r("c1127-2-first",0,0,(D,E,H,)),constitutiveRule,inheritsIntestate(H,E)) :- inst(x("c1127-2-first",0,0,1,(D,E,H,))).
inst(x("c1127-2-first",0,0,2,(D,E,H,))) :- inst(r("c1127-2-first",0,0,(D,E,H,))), cand(renounced(H,D)).
constitutiveRule(x("c1127-2-first",0,0,2,(D,E,H,)),non(inheritsIntestate(H,E))) :- inst(x("c1127-2-first",0,0,2,(D,E,H,))).
body(x("c1127-2-first",0,0,2,(D,E,H,)),estateOf(E,D)) :- inst(x("c1127-2-first",0,0,2,(D,E,H,))).
body(x("c1127-2-first",0,0,2,(D,E,H,)),byIntestacy(E)) :- inst(x("c1127-2-first",0,0,2,(D,E,H,))).
body(x("c1127-2-first",0,0,2,(D,E,H,)),firstOrderHeir(H,D)) :- inst(x("c1127-2-first",0,0,2,(D,E,H,))).
body(x("c1127-2-first",0,0,2,(D,E,H,)),renounced(H,D)) :- inst(x("c1127-2-first",0,0,2,(D,E,H,))).
superior(x("c1127-2-first",0,0,2,(D,E,H,)),r("c1127-2-first",0,0,(D,E,H,))) :- inst(x("c1127-2-first",0,0,2,(D,E,H,))).
exc(x("c1127-2-first",0,0,2,(D,E,H,)),r("c1127-2-first",0,0,(D,E,H,)),constitutiveRule,inheritsIntestate(H,E)) :- inst(x("c1127-2-first",0,0,2,(D,E,H,))).
% c1127-2-first[0.1] 继承开始后，由第一顺序继承人继承（第1127条第2款；npc）
inst(r("c1127-2-first",0,1,(D,E,H,))) :- cand(estateOf(E,D)), cand(byIntestacy(E)), cand(firstOrderHeir(H,D)).
constitutiveRule(r("c1127-2-first",0,1,(D,E,H,)),firstOrderInherits(E)) :- inst(r("c1127-2-first",0,1,(D,E,H,))).
mainHead(r("c1127-2-first",0,1,(D,E,H,)),constitutiveRule,firstOrderInherits(E)) :- inst(r("c1127-2-first",0,1,(D,E,H,))).
cand(firstOrderInherits(E)) :- inst(r("c1127-2-first",0,1,(D,E,H,))).
body(r("c1127-2-first",0,1,(D,E,H,)),estateOf(E,D)) :- inst(r("c1127-2-first",0,1,(D,E,H,))).
body(r("c1127-2-first",0,1,(D,E,H,)),byIntestacy(E)) :- inst(r("c1127-2-first",0,1,(D,E,H,))).
body(r("c1127-2-first",0,1,(D,E,H,)),firstOrderHeir(H,D)) :- inst(r("c1127-2-first",0,1,(D,E,H,))).
inst(x("c1127-2-first",0,1,0,(D,E,H,))) :- inst(r("c1127-2-first",0,1,(D,E,H,))), cand(predeceased(H,D)).
constitutiveRule(x("c1127-2-first",0,1,0,(D,E,H,)),non(firstOrderInherits(E))) :- inst(x("c1127-2-first",0,1,0,(D,E,H,))).
body(x("c1127-2-first",0,1,0,(D,E,H,)),estateOf(E,D)) :- inst(x("c1127-2-first",0,1,0,(D,E,H,))).
body(x("c1127-2-first",0,1,0,(D,E,H,)),byIntestacy(E)) :- inst(x("c1127-2-first",0,1,0,(D,E,H,))).
body(x("c1127-2-first",0,1,0,(D,E,H,)),firstOrderHeir(H,D)) :- inst(x("c1127-2-first",0,1,0,(D,E,H,))).
body(x("c1127-2-first",0,1,0,(D,E,H,)),predeceased(H,D)) :- inst(x("c1127-2-first",0,1,0,(D,E,H,))).
superior(x("c1127-2-first",0,1,0,(D,E,H,)),r("c1127-2-first",0,1,(D,E,H,))) :- inst(x("c1127-2-first",0,1,0,(D,E,H,))).
exc(x("c1127-2-first",0,1,0,(D,E,H,)),r("c1127-2-first",0,1,(D,E,H,)),constitutiveRule,firstOrderInherits(E)) :- inst(x("c1127-2-first",0,1,0,(D,E,H,))).
inst(x("c1127-2-first",0,1,1,(D,E,H,))) :- inst(r("c1127-2-first",0,1,(D,E,H,))), cand(disinherited(H,D)).
constitutiveRule(x("c1127-2-first",0,1,1,(D,E,H,)),non(firstOrderInherits(E))) :- inst(x("c1127-2-first",0,1,1,(D,E,H,))).
body(x("c1127-2-first",0,1,1,(D,E,H,)),estateOf(E,D)) :- inst(x("c1127-2-first",0,1,1,(D,E,H,))).
body(x("c1127-2-first",0,1,1,(D,E,H,)),byIntestacy(E)) :- inst(x("c1127-2-first",0,1,1,(D,E,H,))).
body(x("c1127-2-first",0,1,1,(D,E,H,)),firstOrderHeir(H,D)) :- inst(x("c1127-2-first",0,1,1,(D,E,H,))).
body(x("c1127-2-first",0,1,1,(D,E,H,)),disinherited(H,D)) :- inst(x("c1127-2-first",0,1,1,(D,E,H,))).
superior(x("c1127-2-first",0,1,1,(D,E,H,)),r("c1127-2-first",0,1,(D,E,H,))) :- inst(x("c1127-2-first",0,1,1,(D,E,H,))).
exc(x("c1127-2-first",0,1,1,(D,E,H,)),r("c1127-2-first",0,1,(D,E,H,)),constitutiveRule,firstOrderInherits(E)) :- inst(x("c1127-2-first",0,1,1,(D,E,H,))).
inst(x("c1127-2-first",0,1,2,(D,E,H,))) :- inst(r("c1127-2-first",0,1,(D,E,H,))), cand(renounced(H,D)).
constitutiveRule(x("c1127-2-first",0,1,2,(D,E,H,)),non(firstOrderInherits(E))) :- inst(x("c1127-2-first",0,1,2,(D,E,H,))).
body(x("c1127-2-first",0,1,2,(D,E,H,)),estateOf(E,D)) :- inst(x("c1127-2-first",0,1,2,(D,E,H,))).
body(x("c1127-2-first",0,1,2,(D,E,H,)),byIntestacy(E)) :- inst(x("c1127-2-first",0,1,2,(D,E,H,))).
body(x("c1127-2-first",0,1,2,(D,E,H,)),firstOrderHeir(H,D)) :- inst(x("c1127-2-first",0,1,2,(D,E,H,))).
body(x("c1127-2-first",0,1,2,(D,E,H,)),renounced(H,D)) :- inst(x("c1127-2-first",0,1,2,(D,E,H,))).
superior(x("c1127-2-first",0,1,2,(D,E,H,)),r("c1127-2-first",0,1,(D,E,H,))) :- inst(x("c1127-2-first",0,1,2,(D,E,H,))).
exc(x("c1127-2-first",0,1,2,(D,E,H,)),r("c1127-2-first",0,1,(D,E,H,)),constitutiveRule,firstOrderInherits(E)) :- inst(x("c1127-2-first",0,1,2,(D,E,H,))).

% c1127-second[0.0] 第二顺序：兄弟姐妹、祖父母、外祖父母（第1127条第1款；npc）
inst(r("c1127-second",0,0,(D,H,))) :- cand(siblingOf(H,D)).
constitutiveRule(r("c1127-second",0,0,(D,H,)),secondOrderHeir(H,D)) :- inst(r("c1127-second",0,0,(D,H,))).
mainHead(r("c1127-second",0,0,(D,H,)),constitutiveRule,secondOrderHeir(H,D)) :- inst(r("c1127-second",0,0,(D,H,))).
cand(secondOrderHeir(H,D)) :- inst(r("c1127-second",0,0,(D,H,))).
body(r("c1127-second",0,0,(D,H,)),siblingOf(H,D)) :- inst(r("c1127-second",0,0,(D,H,))).
% c1127-second[1.0] 第二顺序：兄弟姐妹、祖父母、外祖父母（第1127条第1款；npc）
inst(r("c1127-second",1,0,(D,H,))) :- cand(grandparentOf(H,D)).
constitutiveRule(r("c1127-second",1,0,(D,H,)),secondOrderHeir(H,D)) :- inst(r("c1127-second",1,0,(D,H,))).
mainHead(r("c1127-second",1,0,(D,H,)),constitutiveRule,secondOrderHeir(H,D)) :- inst(r("c1127-second",1,0,(D,H,))).
cand(secondOrderHeir(H,D)) :- inst(r("c1127-second",1,0,(D,H,))).
body(r("c1127-second",1,0,(D,H,)),grandparentOf(H,D)) :- inst(r("c1127-second",1,0,(D,H,))).

% c1127-2-second[0.0] 没有第一顺序继承人继承的，由第二顺序继承人继承（第1127条第2款；npc）
inst(r("c1127-2-second",0,0,(D,E,H,))) :- cand(estateOf(E,D)), cand(byIntestacy(E)), cand(secondOrderHeir(H,D)).
constitutiveRule(r("c1127-2-second",0,0,(D,E,H,)),inheritsIntestate(H,E)) :- inst(r("c1127-2-second",0,0,(D,E,H,))).
mainHead(r("c1127-2-second",0,0,(D,E,H,)),constitutiveRule,inheritsIntestate(H,E)) :- inst(r("c1127-2-second",0,0,(D,E,H,))).
cand(inheritsIntestate(H,E)) :- inst(r("c1127-2-second",0,0,(D,E,H,))).
body(r("c1127-2-second",0,0,(D,E,H,)),estateOf(E,D)) :- inst(r("c1127-2-second",0,0,(D,E,H,))).
body(r("c1127-2-second",0,0,(D,E,H,)),byIntestacy(E)) :- inst(r("c1127-2-second",0,0,(D,E,H,))).
body(r("c1127-2-second",0,0,(D,E,H,)),secondOrderHeir(H,D)) :- inst(r("c1127-2-second",0,0,(D,E,H,))).
inst(x("c1127-2-second",0,0,0,(D,E,H,))) :- inst(r("c1127-2-second",0,0,(D,E,H,))), cand(predeceased(H,D)).
constitutiveRule(x("c1127-2-second",0,0,0,(D,E,H,)),non(inheritsIntestate(H,E))) :- inst(x("c1127-2-second",0,0,0,(D,E,H,))).
body(x("c1127-2-second",0,0,0,(D,E,H,)),estateOf(E,D)) :- inst(x("c1127-2-second",0,0,0,(D,E,H,))).
body(x("c1127-2-second",0,0,0,(D,E,H,)),byIntestacy(E)) :- inst(x("c1127-2-second",0,0,0,(D,E,H,))).
body(x("c1127-2-second",0,0,0,(D,E,H,)),secondOrderHeir(H,D)) :- inst(x("c1127-2-second",0,0,0,(D,E,H,))).
body(x("c1127-2-second",0,0,0,(D,E,H,)),predeceased(H,D)) :- inst(x("c1127-2-second",0,0,0,(D,E,H,))).
superior(x("c1127-2-second",0,0,0,(D,E,H,)),r("c1127-2-second",0,0,(D,E,H,))) :- inst(x("c1127-2-second",0,0,0,(D,E,H,))).
exc(x("c1127-2-second",0,0,0,(D,E,H,)),r("c1127-2-second",0,0,(D,E,H,)),constitutiveRule,inheritsIntestate(H,E)) :- inst(x("c1127-2-second",0,0,0,(D,E,H,))).
inst(x("c1127-2-second",0,0,1,(D,E,H,))) :- inst(r("c1127-2-second",0,0,(D,E,H,))), cand(disinherited(H,D)).
constitutiveRule(x("c1127-2-second",0,0,1,(D,E,H,)),non(inheritsIntestate(H,E))) :- inst(x("c1127-2-second",0,0,1,(D,E,H,))).
body(x("c1127-2-second",0,0,1,(D,E,H,)),estateOf(E,D)) :- inst(x("c1127-2-second",0,0,1,(D,E,H,))).
body(x("c1127-2-second",0,0,1,(D,E,H,)),byIntestacy(E)) :- inst(x("c1127-2-second",0,0,1,(D,E,H,))).
body(x("c1127-2-second",0,0,1,(D,E,H,)),secondOrderHeir(H,D)) :- inst(x("c1127-2-second",0,0,1,(D,E,H,))).
body(x("c1127-2-second",0,0,1,(D,E,H,)),disinherited(H,D)) :- inst(x("c1127-2-second",0,0,1,(D,E,H,))).
superior(x("c1127-2-second",0,0,1,(D,E,H,)),r("c1127-2-second",0,0,(D,E,H,))) :- inst(x("c1127-2-second",0,0,1,(D,E,H,))).
exc(x("c1127-2-second",0,0,1,(D,E,H,)),r("c1127-2-second",0,0,(D,E,H,)),constitutiveRule,inheritsIntestate(H,E)) :- inst(x("c1127-2-second",0,0,1,(D,E,H,))).
inst(x("c1127-2-second",0,0,2,(D,E,H,))) :- inst(r("c1127-2-second",0,0,(D,E,H,))), cand(renounced(H,D)).
constitutiveRule(x("c1127-2-second",0,0,2,(D,E,H,)),non(inheritsIntestate(H,E))) :- inst(x("c1127-2-second",0,0,2,(D,E,H,))).
body(x("c1127-2-second",0,0,2,(D,E,H,)),estateOf(E,D)) :- inst(x("c1127-2-second",0,0,2,(D,E,H,))).
body(x("c1127-2-second",0,0,2,(D,E,H,)),byIntestacy(E)) :- inst(x("c1127-2-second",0,0,2,(D,E,H,))).
body(x("c1127-2-second",0,0,2,(D,E,H,)),secondOrderHeir(H,D)) :- inst(x("c1127-2-second",0,0,2,(D,E,H,))).
body(x("c1127-2-second",0,0,2,(D,E,H,)),renounced(H,D)) :- inst(x("c1127-2-second",0,0,2,(D,E,H,))).
superior(x("c1127-2-second",0,0,2,(D,E,H,)),r("c1127-2-second",0,0,(D,E,H,))) :- inst(x("c1127-2-second",0,0,2,(D,E,H,))).
exc(x("c1127-2-second",0,0,2,(D,E,H,)),r("c1127-2-second",0,0,(D,E,H,)),constitutiveRule,inheritsIntestate(H,E)) :- inst(x("c1127-2-second",0,0,2,(D,E,H,))).
inst(x("c1127-2-second",0,0,3,(D,E,H,))) :- inst(r("c1127-2-second",0,0,(D,E,H,))), cand(firstOrderInherits(E)).
constitutiveRule(x("c1127-2-second",0,0,3,(D,E,H,)),non(inheritsIntestate(H,E))) :- inst(x("c1127-2-second",0,0,3,(D,E,H,))).
body(x("c1127-2-second",0,0,3,(D,E,H,)),estateOf(E,D)) :- inst(x("c1127-2-second",0,0,3,(D,E,H,))).
body(x("c1127-2-second",0,0,3,(D,E,H,)),byIntestacy(E)) :- inst(x("c1127-2-second",0,0,3,(D,E,H,))).
body(x("c1127-2-second",0,0,3,(D,E,H,)),secondOrderHeir(H,D)) :- inst(x("c1127-2-second",0,0,3,(D,E,H,))).
body(x("c1127-2-second",0,0,3,(D,E,H,)),firstOrderInherits(E)) :- inst(x("c1127-2-second",0,0,3,(D,E,H,))).
superior(x("c1127-2-second",0,0,3,(D,E,H,)),r("c1127-2-second",0,0,(D,E,H,))) :- inst(x("c1127-2-second",0,0,3,(D,E,H,))).
exc(x("c1127-2-second",0,0,3,(D,E,H,)),r("c1127-2-second",0,0,(D,E,H,)),constitutiveRule,inheritsIntestate(H,E)) :- inst(x("c1127-2-second",0,0,3,(D,E,H,))).

% c1128-1[0.0] 被继承人的子女先于被继承人死亡的，由子女的直系晚辈血亲代位继承（第1128条第1款；npc）
inst(r("c1128-1",0,0,(C,D,E,G,))) :- cand(estateOf(E,D)), cand(byIntestacy(E)), cand(childOf(C,D)), cand(predeceased(C,D)), cand(lineaDescendant(G,C)).
constitutiveRule(r("c1128-1",0,0,(C,D,E,G,)),inheritsBySubrogation(G,E)) :- inst(r("c1128-1",0,0,(C,D,E,G,))).
mainHead(r("c1128-1",0,0,(C,D,E,G,)),constitutiveRule,inheritsBySubrogation(G,E)) :- inst(r("c1128-1",0,0,(C,D,E,G,))).
cand(inheritsBySubrogation(G,E)) :- inst(r("c1128-1",0,0,(C,D,E,G,))).
body(r("c1128-1",0,0,(C,D,E,G,)),estateOf(E,D)) :- inst(r("c1128-1",0,0,(C,D,E,G,))).
body(r("c1128-1",0,0,(C,D,E,G,)),byIntestacy(E)) :- inst(r("c1128-1",0,0,(C,D,E,G,))).
body(r("c1128-1",0,0,(C,D,E,G,)),childOf(C,D)) :- inst(r("c1128-1",0,0,(C,D,E,G,))).
body(r("c1128-1",0,0,(C,D,E,G,)),predeceased(C,D)) :- inst(r("c1128-1",0,0,(C,D,E,G,))).
body(r("c1128-1",0,0,(C,D,E,G,)),lineaDescendant(G,C)) :- inst(r("c1128-1",0,0,(C,D,E,G,))).
inst(x("c1128-1",0,0,0,(C,D,E,G,))) :- inst(r("c1128-1",0,0,(C,D,E,G,))), cand(disinherited(C,D)).
constitutiveRule(x("c1128-1",0,0,0,(C,D,E,G,)),non(inheritsBySubrogation(G,E))) :- inst(x("c1128-1",0,0,0,(C,D,E,G,))).
body(x("c1128-1",0,0,0,(C,D,E,G,)),estateOf(E,D)) :- inst(x("c1128-1",0,0,0,(C,D,E,G,))).
body(x("c1128-1",0,0,0,(C,D,E,G,)),byIntestacy(E)) :- inst(x("c1128-1",0,0,0,(C,D,E,G,))).
body(x("c1128-1",0,0,0,(C,D,E,G,)),childOf(C,D)) :- inst(x("c1128-1",0,0,0,(C,D,E,G,))).
body(x("c1128-1",0,0,0,(C,D,E,G,)),predeceased(C,D)) :- inst(x("c1128-1",0,0,0,(C,D,E,G,))).
body(x("c1128-1",0,0,0,(C,D,E,G,)),lineaDescendant(G,C)) :- inst(x("c1128-1",0,0,0,(C,D,E,G,))).
body(x("c1128-1",0,0,0,(C,D,E,G,)),disinherited(C,D)) :- inst(x("c1128-1",0,0,0,(C,D,E,G,))).
superior(x("c1128-1",0,0,0,(C,D,E,G,)),r("c1128-1",0,0,(C,D,E,G,))) :- inst(x("c1128-1",0,0,0,(C,D,E,G,))).
exc(x("c1128-1",0,0,0,(C,D,E,G,)),r("c1128-1",0,0,(C,D,E,G,)),constitutiveRule,inheritsBySubrogation(G,E)) :- inst(x("c1128-1",0,0,0,(C,D,E,G,))).
% c1128-1[0.1] 被继承人的子女先于被继承人死亡的，由子女的直系晚辈血亲代位继承（第1128条第1款；npc）
inst(r("c1128-1",0,1,(C,D,E,G,))) :- cand(estateOf(E,D)), cand(byIntestacy(E)), cand(childOf(C,D)), cand(predeceased(C,D)), cand(lineaDescendant(G,C)).
constitutiveRule(r("c1128-1",0,1,(C,D,E,G,)),firstOrderInherits(E)) :- inst(r("c1128-1",0,1,(C,D,E,G,))).
mainHead(r("c1128-1",0,1,(C,D,E,G,)),constitutiveRule,firstOrderInherits(E)) :- inst(r("c1128-1",0,1,(C,D,E,G,))).
cand(firstOrderInherits(E)) :- inst(r("c1128-1",0,1,(C,D,E,G,))).
body(r("c1128-1",0,1,(C,D,E,G,)),estateOf(E,D)) :- inst(r("c1128-1",0,1,(C,D,E,G,))).
body(r("c1128-1",0,1,(C,D,E,G,)),byIntestacy(E)) :- inst(r("c1128-1",0,1,(C,D,E,G,))).
body(r("c1128-1",0,1,(C,D,E,G,)),childOf(C,D)) :- inst(r("c1128-1",0,1,(C,D,E,G,))).
body(r("c1128-1",0,1,(C,D,E,G,)),predeceased(C,D)) :- inst(r("c1128-1",0,1,(C,D,E,G,))).
body(r("c1128-1",0,1,(C,D,E,G,)),lineaDescendant(G,C)) :- inst(r("c1128-1",0,1,(C,D,E,G,))).
inst(x("c1128-1",0,1,0,(C,D,E,G,))) :- inst(r("c1128-1",0,1,(C,D,E,G,))), cand(disinherited(C,D)).
constitutiveRule(x("c1128-1",0,1,0,(C,D,E,G,)),non(firstOrderInherits(E))) :- inst(x("c1128-1",0,1,0,(C,D,E,G,))).
body(x("c1128-1",0,1,0,(C,D,E,G,)),estateOf(E,D)) :- inst(x("c1128-1",0,1,0,(C,D,E,G,))).
body(x("c1128-1",0,1,0,(C,D,E,G,)),byIntestacy(E)) :- inst(x("c1128-1",0,1,0,(C,D,E,G,))).
body(x("c1128-1",0,1,0,(C,D,E,G,)),childOf(C,D)) :- inst(x("c1128-1",0,1,0,(C,D,E,G,))).
body(x("c1128-1",0,1,0,(C,D,E,G,)),predeceased(C,D)) :- inst(x("c1128-1",0,1,0,(C,D,E,G,))).
body(x("c1128-1",0,1,0,(C,D,E,G,)),lineaDescendant(G,C)) :- inst(x("c1128-1",0,1,0,(C,D,E,G,))).
body(x("c1128-1",0,1,0,(C,D,E,G,)),disinherited(C,D)) :- inst(x("c1128-1",0,1,0,(C,D,E,G,))).
superior(x("c1128-1",0,1,0,(C,D,E,G,)),r("c1128-1",0,1,(C,D,E,G,))) :- inst(x("c1128-1",0,1,0,(C,D,E,G,))).
exc(x("c1128-1",0,1,0,(C,D,E,G,)),r("c1128-1",0,1,(C,D,E,G,)),constitutiveRule,firstOrderInherits(E)) :- inst(x("c1128-1",0,1,0,(C,D,E,G,))).

% c1128-2[0.0] 兄弟姐妹先于被继承人死亡的，由兄弟姐妹的子女代位继承（属第二顺序）（第1128条第2款；npc）
inst(r("c1128-2",0,0,(D,E,N,S,))) :- cand(estateOf(E,D)), cand(byIntestacy(E)), cand(siblingOf(S,D)), cand(predeceased(S,D)), cand(childOf(N,S)).
constitutiveRule(r("c1128-2",0,0,(D,E,N,S,)),inheritsBySubrogation(N,E)) :- inst(r("c1128-2",0,0,(D,E,N,S,))).
mainHead(r("c1128-2",0,0,(D,E,N,S,)),constitutiveRule,inheritsBySubrogation(N,E)) :- inst(r("c1128-2",0,0,(D,E,N,S,))).
cand(inheritsBySubrogation(N,E)) :- inst(r("c1128-2",0,0,(D,E,N,S,))).
body(r("c1128-2",0,0,(D,E,N,S,)),estateOf(E,D)) :- inst(r("c1128-2",0,0,(D,E,N,S,))).
body(r("c1128-2",0,0,(D,E,N,S,)),byIntestacy(E)) :- inst(r("c1128-2",0,0,(D,E,N,S,))).
body(r("c1128-2",0,0,(D,E,N,S,)),siblingOf(S,D)) :- inst(r("c1128-2",0,0,(D,E,N,S,))).
body(r("c1128-2",0,0,(D,E,N,S,)),predeceased(S,D)) :- inst(r("c1128-2",0,0,(D,E,N,S,))).
body(r("c1128-2",0,0,(D,E,N,S,)),childOf(N,S)) :- inst(r("c1128-2",0,0,(D,E,N,S,))).
inst(x("c1128-2",0,0,0,(D,E,N,S,))) :- inst(r("c1128-2",0,0,(D,E,N,S,))), cand(firstOrderInherits(E)).
constitutiveRule(x("c1128-2",0,0,0,(D,E,N,S,)),non(inheritsBySubrogation(N,E))) :- inst(x("c1128-2",0,0,0,(D,E,N,S,))).
body(x("c1128-2",0,0,0,(D,E,N,S,)),estateOf(E,D)) :- inst(x("c1128-2",0,0,0,(D,E,N,S,))).
body(x("c1128-2",0,0,0,(D,E,N,S,)),byIntestacy(E)) :- inst(x("c1128-2",0,0,0,(D,E,N,S,))).
body(x("c1128-2",0,0,0,(D,E,N,S,)),siblingOf(S,D)) :- inst(x("c1128-2",0,0,0,(D,E,N,S,))).
body(x("c1128-2",0,0,0,(D,E,N,S,)),predeceased(S,D)) :- inst(x("c1128-2",0,0,0,(D,E,N,S,))).
body(x("c1128-2",0,0,0,(D,E,N,S,)),childOf(N,S)) :- inst(x("c1128-2",0,0,0,(D,E,N,S,))).
body(x("c1128-2",0,0,0,(D,E,N,S,)),firstOrderInherits(E)) :- inst(x("c1128-2",0,0,0,(D,E,N,S,))).
superior(x("c1128-2",0,0,0,(D,E,N,S,)),r("c1128-2",0,0,(D,E,N,S,))) :- inst(x("c1128-2",0,0,0,(D,E,N,S,))).
exc(x("c1128-2",0,0,0,(D,E,N,S,)),r("c1128-2",0,0,(D,E,N,S,)),constitutiveRule,inheritsBySubrogation(N,E)) :- inst(x("c1128-2",0,0,0,(D,E,N,S,))).
inst(x("c1128-2",0,0,1,(D,E,N,S,))) :- inst(r("c1128-2",0,0,(D,E,N,S,))), cand(disinherited(S,D)).
constitutiveRule(x("c1128-2",0,0,1,(D,E,N,S,)),non(inheritsBySubrogation(N,E))) :- inst(x("c1128-2",0,0,1,(D,E,N,S,))).
body(x("c1128-2",0,0,1,(D,E,N,S,)),estateOf(E,D)) :- inst(x("c1128-2",0,0,1,(D,E,N,S,))).
body(x("c1128-2",0,0,1,(D,E,N,S,)),byIntestacy(E)) :- inst(x("c1128-2",0,0,1,(D,E,N,S,))).
body(x("c1128-2",0,0,1,(D,E,N,S,)),siblingOf(S,D)) :- inst(x("c1128-2",0,0,1,(D,E,N,S,))).
body(x("c1128-2",0,0,1,(D,E,N,S,)),predeceased(S,D)) :- inst(x("c1128-2",0,0,1,(D,E,N,S,))).
body(x("c1128-2",0,0,1,(D,E,N,S,)),childOf(N,S)) :- inst(x("c1128-2",0,0,1,(D,E,N,S,))).
body(x("c1128-2",0,0,1,(D,E,N,S,)),disinherited(S,D)) :- inst(x("c1128-2",0,0,1,(D,E,N,S,))).
superior(x("c1128-2",0,0,1,(D,E,N,S,)),r("c1128-2",0,0,(D,E,N,S,))) :- inst(x("c1128-2",0,0,1,(D,E,N,S,))).
exc(x("c1128-2",0,0,1,(D,E,N,S,)),r("c1128-2",0,0,(D,E,N,S,)),constitutiveRule,inheritsBySubrogation(N,E)) :- inst(x("c1128-2",0,0,1,(D,E,N,S,))).

% c1123-will[0.0] 有遗嘱的，按照遗嘱继承或者遗赠办理（第1123条；npc）
inst(r("c1123-will",0,0,(D,E,))) :- cand(estateOf(E,D)), cand(effectiveWillCovers(E)).
constitutiveRule(r("c1123-will",0,0,(D,E,)),byWill(E)) :- inst(r("c1123-will",0,0,(D,E,))).
mainHead(r("c1123-will",0,0,(D,E,)),constitutiveRule,byWill(E)) :- inst(r("c1123-will",0,0,(D,E,))).
cand(byWill(E)) :- inst(r("c1123-will",0,0,(D,E,))).
body(r("c1123-will",0,0,(D,E,)),estateOf(E,D)) :- inst(r("c1123-will",0,0,(D,E,))).
body(r("c1123-will",0,0,(D,E,)),effectiveWillCovers(E)) :- inst(r("c1123-will",0,0,(D,E,))).
inst(x("c1123-will",0,0,0,(D,E,))) :- inst(r("c1123-will",0,0,(D,E,))), cand(supportAgreementCovers(E)).
constitutiveRule(x("c1123-will",0,0,0,(D,E,)),non(byWill(E))) :- inst(x("c1123-will",0,0,0,(D,E,))).
body(x("c1123-will",0,0,0,(D,E,)),estateOf(E,D)) :- inst(x("c1123-will",0,0,0,(D,E,))).
body(x("c1123-will",0,0,0,(D,E,)),effectiveWillCovers(E)) :- inst(x("c1123-will",0,0,0,(D,E,))).
body(x("c1123-will",0,0,0,(D,E,)),supportAgreementCovers(E)) :- inst(x("c1123-will",0,0,0,(D,E,))).
superior(x("c1123-will",0,0,0,(D,E,)),r("c1123-will",0,0,(D,E,))) :- inst(x("c1123-will",0,0,0,(D,E,))).
exc(x("c1123-will",0,0,0,(D,E,)),r("c1123-will",0,0,(D,E,)),constitutiveRule,byWill(E)) :- inst(x("c1123-will",0,0,0,(D,E,))).

% c-will-effective[0.0] 有效且未被撤回的遗嘱就其处分的遗产适用遗嘱继承（第1123条、第1142条第3款、第1143条；doctrine）
inst(r("c-will-effective",0,0,(D,E,W,))) :- cand(willOf(W,D)), cand(willCoversEstate(W,E)).
constitutiveRule(r("c-will-effective",0,0,(D,E,W,)),effectiveWillCovers(E)) :- inst(r("c-will-effective",0,0,(D,E,W,))).
mainHead(r("c-will-effective",0,0,(D,E,W,)),constitutiveRule,effectiveWillCovers(E)) :- inst(r("c-will-effective",0,0,(D,E,W,))).
cand(effectiveWillCovers(E)) :- inst(r("c-will-effective",0,0,(D,E,W,))).
body(r("c-will-effective",0,0,(D,E,W,)),willOf(W,D)) :- inst(r("c-will-effective",0,0,(D,E,W,))).
body(r("c-will-effective",0,0,(D,E,W,)),willCoversEstate(W,E)) :- inst(r("c-will-effective",0,0,(D,E,W,))).
inst(x("c-will-effective",0,0,0,(D,E,W,))) :- inst(r("c-will-effective",0,0,(D,E,W,))), cand(willVoid(W)).
constitutiveRule(x("c-will-effective",0,0,0,(D,E,W,)),non(effectiveWillCovers(E))) :- inst(x("c-will-effective",0,0,0,(D,E,W,))).
body(x("c-will-effective",0,0,0,(D,E,W,)),willOf(W,D)) :- inst(x("c-will-effective",0,0,0,(D,E,W,))).
body(x("c-will-effective",0,0,0,(D,E,W,)),willCoversEstate(W,E)) :- inst(x("c-will-effective",0,0,0,(D,E,W,))).
body(x("c-will-effective",0,0,0,(D,E,W,)),willVoid(W)) :- inst(x("c-will-effective",0,0,0,(D,E,W,))).
superior(x("c-will-effective",0,0,0,(D,E,W,)),r("c-will-effective",0,0,(D,E,W,))) :- inst(x("c-will-effective",0,0,0,(D,E,W,))).
exc(x("c-will-effective",0,0,0,(D,E,W,)),r("c-will-effective",0,0,(D,E,W,)),constitutiveRule,effectiveWillCovers(E)) :- inst(x("c-will-effective",0,0,0,(D,E,W,))).
inst(x("c-will-effective",0,0,1,(D,E,W,))) :- inst(r("c-will-effective",0,0,(D,E,W,))), cand(supersededWill(W)).
constitutiveRule(x("c-will-effective",0,0,1,(D,E,W,)),non(effectiveWillCovers(E))) :- inst(x("c-will-effective",0,0,1,(D,E,W,))).
body(x("c-will-effective",0,0,1,(D,E,W,)),willOf(W,D)) :- inst(x("c-will-effective",0,0,1,(D,E,W,))).
body(x("c-will-effective",0,0,1,(D,E,W,)),willCoversEstate(W,E)) :- inst(x("c-will-effective",0,0,1,(D,E,W,))).
body(x("c-will-effective",0,0,1,(D,E,W,)),supersededWill(W)) :- inst(x("c-will-effective",0,0,1,(D,E,W,))).
superior(x("c-will-effective",0,0,1,(D,E,W,)),r("c-will-effective",0,0,(D,E,W,))) :- inst(x("c-will-effective",0,0,1,(D,E,W,))).
exc(x("c-will-effective",0,0,1,(D,E,W,)),r("c-will-effective",0,0,(D,E,W,)),constitutiveRule,effectiveWillCovers(E)) :- inst(x("c-will-effective",0,0,1,(D,E,W,))).

% c1143-1[0.0] 无民事行为能力人或者限制民事行为能力人所立的遗嘱无效（第1143条第1款；npc）
inst(r("c1143-1",0,0,(D,W,))) :- cand(willOf(W,D)), cand(noCapacity(D)).
constitutiveRule(r("c1143-1",0,0,(D,W,)),willVoid(W)) :- inst(r("c1143-1",0,0,(D,W,))).
mainHead(r("c1143-1",0,0,(D,W,)),constitutiveRule,willVoid(W)) :- inst(r("c1143-1",0,0,(D,W,))).
cand(willVoid(W)) :- inst(r("c1143-1",0,0,(D,W,))).
body(r("c1143-1",0,0,(D,W,)),willOf(W,D)) :- inst(r("c1143-1",0,0,(D,W,))).
body(r("c1143-1",0,0,(D,W,)),noCapacity(D)) :- inst(r("c1143-1",0,0,(D,W,))).
% c1143-1[1.0] 无民事行为能力人或者限制民事行为能力人所立的遗嘱无效（第1143条第1款；npc）
inst(r("c1143-1",1,0,(D,W,))) :- cand(willOf(W,D)), cand(limitedCapacity(D)).
constitutiveRule(r("c1143-1",1,0,(D,W,)),willVoid(W)) :- inst(r("c1143-1",1,0,(D,W,))).
mainHead(r("c1143-1",1,0,(D,W,)),constitutiveRule,willVoid(W)) :- inst(r("c1143-1",1,0,(D,W,))).
cand(willVoid(W)) :- inst(r("c1143-1",1,0,(D,W,))).
body(r("c1143-1",1,0,(D,W,)),willOf(W,D)) :- inst(r("c1143-1",1,0,(D,W,))).
body(r("c1143-1",1,0,(D,W,)),limitedCapacity(D)) :- inst(r("c1143-1",1,0,(D,W,))).

% c1143-2[0.0] 受欺诈、胁迫所立的遗嘱无效（第1143条第2款；npc）
inst(r("c1143-2",0,0,(D,W,))) :- cand(willOf(W,D)), cand(willByFraud(W)).
constitutiveRule(r("c1143-2",0,0,(D,W,)),willVoid(W)) :- inst(r("c1143-2",0,0,(D,W,))).
mainHead(r("c1143-2",0,0,(D,W,)),constitutiveRule,willVoid(W)) :- inst(r("c1143-2",0,0,(D,W,))).
cand(willVoid(W)) :- inst(r("c1143-2",0,0,(D,W,))).
body(r("c1143-2",0,0,(D,W,)),willOf(W,D)) :- inst(r("c1143-2",0,0,(D,W,))).
body(r("c1143-2",0,0,(D,W,)),willByFraud(W)) :- inst(r("c1143-2",0,0,(D,W,))).
% c1143-2[1.0] 受欺诈、胁迫所立的遗嘱无效（第1143条第2款；npc）
inst(r("c1143-2",1,0,(D,W,))) :- cand(willOf(W,D)), cand(willByDuress(W)).
constitutiveRule(r("c1143-2",1,0,(D,W,)),willVoid(W)) :- inst(r("c1143-2",1,0,(D,W,))).
mainHead(r("c1143-2",1,0,(D,W,)),constitutiveRule,willVoid(W)) :- inst(r("c1143-2",1,0,(D,W,))).
cand(willVoid(W)) :- inst(r("c1143-2",1,0,(D,W,))).
body(r("c1143-2",1,0,(D,W,)),willOf(W,D)) :- inst(r("c1143-2",1,0,(D,W,))).
body(r("c1143-2",1,0,(D,W,)),willByDuress(W)) :- inst(r("c1143-2",1,0,(D,W,))).

% c1143-3[0.0] 伪造的遗嘱无效（第1143条第3款；npc）
inst(r("c1143-3",0,0,(D,W,))) :- cand(willOf(W,D)), cand(forgedWill(W)).
constitutiveRule(r("c1143-3",0,0,(D,W,)),willVoid(W)) :- inst(r("c1143-3",0,0,(D,W,))).
mainHead(r("c1143-3",0,0,(D,W,)),constitutiveRule,willVoid(W)) :- inst(r("c1143-3",0,0,(D,W,))).
cand(willVoid(W)) :- inst(r("c1143-3",0,0,(D,W,))).
body(r("c1143-3",0,0,(D,W,)),willOf(W,D)) :- inst(r("c1143-3",0,0,(D,W,))).
body(r("c1143-3",0,0,(D,W,)),forgedWill(W)) :- inst(r("c1143-3",0,0,(D,W,))).

% c1142-2[0.0] 立遗嘱后实施与遗嘱内容相反的民事法律行为的，视为对遗嘱相关内容的撤回（第1142条第2款；npc）
inst(r("c1142-2",0,0,(D,W,))) :- cand(willOf(W,D)), cand(contraryActAfterWill(W)).
constitutiveRule(r("c1142-2",0,0,(D,W,)),supersededWill(W)) :- inst(r("c1142-2",0,0,(D,W,))).
mainHead(r("c1142-2",0,0,(D,W,)),constitutiveRule,supersededWill(W)) :- inst(r("c1142-2",0,0,(D,W,))).
cand(supersededWill(W)) :- inst(r("c1142-2",0,0,(D,W,))).
body(r("c1142-2",0,0,(D,W,)),willOf(W,D)) :- inst(r("c1142-2",0,0,(D,W,))).
body(r("c1142-2",0,0,(D,W,)),contraryActAfterWill(W)) :- inst(r("c1142-2",0,0,(D,W,))).

% c1142-3[0.0] 立有数份遗嘱，内容相抵触的，以最后的遗嘱为准（第1142条第3款；npc）
inst(r("c1142-3",0,0,(D,W1,W2,))) :- cand(willOf(W1,D)), cand(willOf(W2,D)), cand(conflictingWills(W1,W2)), cand(madeLater(W2,W1)).
constitutiveRule(r("c1142-3",0,0,(D,W1,W2,)),supersededWill(W1)) :- inst(r("c1142-3",0,0,(D,W1,W2,))).
mainHead(r("c1142-3",0,0,(D,W1,W2,)),constitutiveRule,supersededWill(W1)) :- inst(r("c1142-3",0,0,(D,W1,W2,))).
cand(supersededWill(W1)) :- inst(r("c1142-3",0,0,(D,W1,W2,))).
body(r("c1142-3",0,0,(D,W1,W2,)),willOf(W1,D)) :- inst(r("c1142-3",0,0,(D,W1,W2,))).
body(r("c1142-3",0,0,(D,W1,W2,)),willOf(W2,D)) :- inst(r("c1142-3",0,0,(D,W1,W2,))).
body(r("c1142-3",0,0,(D,W1,W2,)),conflictingWills(W1,W2)) :- inst(r("c1142-3",0,0,(D,W1,W2,))).
body(r("c1142-3",0,0,(D,W1,W2,)),madeLater(W2,W1)) :- inst(r("c1142-3",0,0,(D,W1,W2,))).
inst(x("c1142-3",0,0,0,(D,W1,W2,))) :- inst(r("c1142-3",0,0,(D,W1,W2,))), cand(willVoid(W2)).
constitutiveRule(x("c1142-3",0,0,0,(D,W1,W2,)),non(supersededWill(W1))) :- inst(x("c1142-3",0,0,0,(D,W1,W2,))).
body(x("c1142-3",0,0,0,(D,W1,W2,)),willOf(W1,D)) :- inst(x("c1142-3",0,0,0,(D,W1,W2,))).
body(x("c1142-3",0,0,0,(D,W1,W2,)),willOf(W2,D)) :- inst(x("c1142-3",0,0,0,(D,W1,W2,))).
body(x("c1142-3",0,0,0,(D,W1,W2,)),conflictingWills(W1,W2)) :- inst(x("c1142-3",0,0,0,(D,W1,W2,))).
body(x("c1142-3",0,0,0,(D,W1,W2,)),madeLater(W2,W1)) :- inst(x("c1142-3",0,0,0,(D,W1,W2,))).
body(x("c1142-3",0,0,0,(D,W1,W2,)),willVoid(W2)) :- inst(x("c1142-3",0,0,0,(D,W1,W2,))).
superior(x("c1142-3",0,0,0,(D,W1,W2,)),r("c1142-3",0,0,(D,W1,W2,))) :- inst(x("c1142-3",0,0,0,(D,W1,W2,))).
exc(x("c1142-3",0,0,0,(D,W1,W2,)),r("c1142-3",0,0,(D,W1,W2,)),constitutiveRule,supersededWill(W1)) :- inst(x("c1142-3",0,0,0,(D,W1,W2,))).

% c1123-agreement[0.0] 有遗赠扶养协议的，按照协议办理（效力最优先）（第1123条；npc）
inst(r("c1123-agreement",0,0,(D,E,))) :- cand(estateOf(E,D)), cand(supportAgreementCovers(E)).
constitutiveRule(r("c1123-agreement",0,0,(D,E,)),byAgreement(E)) :- inst(r("c1123-agreement",0,0,(D,E,))).
mainHead(r("c1123-agreement",0,0,(D,E,)),constitutiveRule,byAgreement(E)) :- inst(r("c1123-agreement",0,0,(D,E,))).
cand(byAgreement(E)) :- inst(r("c1123-agreement",0,0,(D,E,))).
body(r("c1123-agreement",0,0,(D,E,)),estateOf(E,D)) :- inst(r("c1123-agreement",0,0,(D,E,))).
body(r("c1123-agreement",0,0,(D,E,)),supportAgreementCovers(E)) :- inst(r("c1123-agreement",0,0,(D,E,))).

% tx-g7306[0.0] 分类（自动抽取自图的层级）：先遗嘱继承后法定继承原则 ⊑ 遗产分割的原则
inst(r("tx-g7306",0,0,(X,))) :- cand(isA(X,"先遗嘱继承后法定继承原则")).
constitutiveRule(r("tx-g7306",0,0,(X,)),isA(X,"遗产分割的原则")) :- inst(r("tx-g7306",0,0,(X,))).
mainHead(r("tx-g7306",0,0,(X,)),constitutiveRule,isA(X,"遗产分割的原则")) :- inst(r("tx-g7306",0,0,(X,))).
cand(isA(X,"遗产分割的原则")) :- inst(r("tx-g7306",0,0,(X,))).
body(r("tx-g7306",0,0,(X,)),isA(X,"先遗嘱继承后法定继承原则")) :- inst(r("tx-g7306",0,0,(X,))).

% tx-g7308[0.0] 分类（自动抽取自图的层级）：保留胎儿继承份额原则 ⊑ 遗产分割的原则
inst(r("tx-g7308",0,0,(X,))) :- cand(isA(X,"保留胎儿继承份额原则")).
constitutiveRule(r("tx-g7308",0,0,(X,)),isA(X,"遗产分割的原则")) :- inst(r("tx-g7308",0,0,(X,))).
mainHead(r("tx-g7308",0,0,(X,)),constitutiveRule,isA(X,"遗产分割的原则")) :- inst(r("tx-g7308",0,0,(X,))).
cand(isA(X,"遗产分割的原则")) :- inst(r("tx-g7308",0,0,(X,))).
body(r("tx-g7308",0,0,(X,)),isA(X,"保留胎儿继承份额原则")) :- inst(r("tx-g7308",0,0,(X,))).

% tx-g7316[0.0] 分类（自动抽取自图的层级）：物尽其用原则 ⊑ 遗产分割的原则
inst(r("tx-g7316",0,0,(X,))) :- cand(isA(X,"物尽其用原则")).
constitutiveRule(r("tx-g7316",0,0,(X,)),isA(X,"遗产分割的原则")) :- inst(r("tx-g7316",0,0,(X,))).
mainHead(r("tx-g7316",0,0,(X,)),constitutiveRule,isA(X,"遗产分割的原则")) :- inst(r("tx-g7316",0,0,(X,))).
cand(isA(X,"遗产分割的原则")) :- inst(r("tx-g7316",0,0,(X,))).
body(r("tx-g7316",0,0,(X,)),isA(X,"物尽其用原则")) :- inst(r("tx-g7316",0,0,(X,))).

% tx-g7344[0.0] 分类（自动抽取自图的层级）：限定继承原则 ⊑ 被继承人债务清偿的原则
inst(r("tx-g7344",0,0,(X,))) :- cand(isA(X,"限定继承原则")).
constitutiveRule(r("tx-g7344",0,0,(X,)),isA(X,"被继承人债务清偿的原则")) :- inst(r("tx-g7344",0,0,(X,))).
mainHead(r("tx-g7344",0,0,(X,)),constitutiveRule,isA(X,"被继承人债务清偿的原则")) :- inst(r("tx-g7344",0,0,(X,))).
cand(isA(X,"被继承人债务清偿的原则")) :- inst(r("tx-g7344",0,0,(X,))).
body(r("tx-g7344",0,0,(X,)),isA(X,"限定继承原则")) :- inst(r("tx-g7344",0,0,(X,))).

% tx-g7348[0.0] 分类（自动抽取自图的层级）：保留必留份原则 ⊑ 被继承人债务清偿的原则
inst(r("tx-g7348",0,0,(X,))) :- cand(isA(X,"保留必留份原则")).
constitutiveRule(r("tx-g7348",0,0,(X,)),isA(X,"被继承人债务清偿的原则")) :- inst(r("tx-g7348",0,0,(X,))).
mainHead(r("tx-g7348",0,0,(X,)),constitutiveRule,isA(X,"被继承人债务清偿的原则")) :- inst(r("tx-g7348",0,0,(X,))).
cand(isA(X,"被继承人债务清偿的原则")) :- inst(r("tx-g7348",0,0,(X,))).
body(r("tx-g7348",0,0,(X,)),isA(X,"保留必留份原则")) :- inst(r("tx-g7348",0,0,(X,))).

% tx-g7350[0.0] 分类（自动抽取自图的层级）：连带责任原则 ⊑ 被继承人债务清偿的原则
inst(r("tx-g7350",0,0,(X,))) :- cand(isA(X,"连带责任原则")).
constitutiveRule(r("tx-g7350",0,0,(X,)),isA(X,"被继承人债务清偿的原则")) :- inst(r("tx-g7350",0,0,(X,))).
mainHead(r("tx-g7350",0,0,(X,)),constitutiveRule,isA(X,"被继承人债务清偿的原则")) :- inst(r("tx-g7350",0,0,(X,))).
cand(isA(X,"被继承人债务清偿的原则")) :- inst(r("tx-g7350",0,0,(X,))).
body(r("tx-g7350",0,0,(X,)),isA(X,"连带责任原则")) :- inst(r("tx-g7350",0,0,(X,))).

% c-liable-obl[0.0] 承担侵权责任的，应当向被侵权人赔偿损失（第1165条第1款、第179条；doctrine）
inst(r("c-liable-obl",0,0,(A,V,X,))) :- cand(liable(A,V,X)).
prescriptiveRule(r("c-liable-obl",0,0,(A,V,X,)),compensate(A,V,X)) :- inst(r("c-liable-obl",0,0,(A,V,X,))).
mainHead(r("c-liable-obl",0,0,(A,V,X,)),prescriptiveRule,compensate(A,V,X)) :- inst(r("c-liable-obl",0,0,(A,V,X,))).
cand(compensate(A,V,X)) :- inst(r("c-liable-obl",0,0,(A,V,X,))).
body(r("c-liable-obl",0,0,(A,V,X,)),liable(A,V,X)) :- inst(r("c-liable-obl",0,0,(A,V,X,))).

% c1165-1[0.0] 行为人因过错侵害他人民事权益造成损害的，应当承担侵权责任（第1165条第1款；npc）
inst(r("c1165-1",0,0,(A,V,X,))) :- cand(harmfulAct(A,V,X)), cand(fault(A,X)), cand(damage(V,X)), cand(causation(X)).
constitutiveRule(r("c1165-1",0,0,(A,V,X,)),liable(A,V,X)) :- inst(r("c1165-1",0,0,(A,V,X,))).
mainHead(r("c1165-1",0,0,(A,V,X,)),constitutiveRule,liable(A,V,X)) :- inst(r("c1165-1",0,0,(A,V,X,))).
cand(liable(A,V,X)) :- inst(r("c1165-1",0,0,(A,V,X,))).
body(r("c1165-1",0,0,(A,V,X,)),harmfulAct(A,V,X)) :- inst(r("c1165-1",0,0,(A,V,X,))).
body(r("c1165-1",0,0,(A,V,X,)),fault(A,X)) :- inst(r("c1165-1",0,0,(A,V,X,))).
body(r("c1165-1",0,0,(A,V,X,)),damage(V,X)) :- inst(r("c1165-1",0,0,(A,V,X,))).
body(r("c1165-1",0,0,(A,V,X,)),causation(X)) :- inst(r("c1165-1",0,0,(A,V,X,))).

% c1165-2[0.0] 依法推定有过错，不能证明自己没有过错的，应当承担侵权责任（第1165条第2款；npc）
inst(r("c1165-2",0,0,(A,V,X,))) :- cand(harmfulAct(A,V,X)), cand(faultPresumedByLaw(X)), cand(damage(V,X)), cand(causation(X)).
constitutiveRule(r("c1165-2",0,0,(A,V,X,)),liable(A,V,X)) :- inst(r("c1165-2",0,0,(A,V,X,))).
mainHead(r("c1165-2",0,0,(A,V,X,)),constitutiveRule,liable(A,V,X)) :- inst(r("c1165-2",0,0,(A,V,X,))).
cand(liable(A,V,X)) :- inst(r("c1165-2",0,0,(A,V,X,))).
body(r("c1165-2",0,0,(A,V,X,)),harmfulAct(A,V,X)) :- inst(r("c1165-2",0,0,(A,V,X,))).
body(r("c1165-2",0,0,(A,V,X,)),faultPresumedByLaw(X)) :- inst(r("c1165-2",0,0,(A,V,X,))).
body(r("c1165-2",0,0,(A,V,X,)),damage(V,X)) :- inst(r("c1165-2",0,0,(A,V,X,))).
body(r("c1165-2",0,0,(A,V,X,)),causation(X)) :- inst(r("c1165-2",0,0,(A,V,X,))).
inst(x("c1165-2",0,0,0,(A,V,X,))) :- inst(r("c1165-2",0,0,(A,V,X,))), cand(provesNoFault(A,X)).
constitutiveRule(x("c1165-2",0,0,0,(A,V,X,)),non(liable(A,V,X))) :- inst(x("c1165-2",0,0,0,(A,V,X,))).
body(x("c1165-2",0,0,0,(A,V,X,)),harmfulAct(A,V,X)) :- inst(x("c1165-2",0,0,0,(A,V,X,))).
body(x("c1165-2",0,0,0,(A,V,X,)),faultPresumedByLaw(X)) :- inst(x("c1165-2",0,0,0,(A,V,X,))).
body(x("c1165-2",0,0,0,(A,V,X,)),damage(V,X)) :- inst(x("c1165-2",0,0,0,(A,V,X,))).
body(x("c1165-2",0,0,0,(A,V,X,)),causation(X)) :- inst(x("c1165-2",0,0,0,(A,V,X,))).
body(x("c1165-2",0,0,0,(A,V,X,)),provesNoFault(A,X)) :- inst(x("c1165-2",0,0,0,(A,V,X,))).
superior(x("c1165-2",0,0,0,(A,V,X,)),r("c1165-2",0,0,(A,V,X,))) :- inst(x("c1165-2",0,0,0,(A,V,X,))).
exc(x("c1165-2",0,0,0,(A,V,X,)),r("c1165-2",0,0,(A,V,X,)),constitutiveRule,liable(A,V,X)) :- inst(x("c1165-2",0,0,0,(A,V,X,))).

% tx-g7467[0.0] 分类（自动抽取自图的层级）：一般过失 ⊑ 过失
inst(r("tx-g7467",0,0,(X,))) :- cand(isA(X,"一般过失")).
constitutiveRule(r("tx-g7467",0,0,(X,)),isA(X,"过失")) :- inst(r("tx-g7467",0,0,(X,))).
mainHead(r("tx-g7467",0,0,(X,)),constitutiveRule,isA(X,"过失")) :- inst(r("tx-g7467",0,0,(X,))).
cand(isA(X,"过失")) :- inst(r("tx-g7467",0,0,(X,))).
body(r("tx-g7467",0,0,(X,)),isA(X,"一般过失")) :- inst(r("tx-g7467",0,0,(X,))).

% tx-g7470[0.0] 分类（自动抽取自图的层级）：重大过失 ⊑ 过失
inst(r("tx-g7470",0,0,(X,))) :- cand(isA(X,"重大过失")).
constitutiveRule(r("tx-g7470",0,0,(X,)),isA(X,"过失")) :- inst(r("tx-g7470",0,0,(X,))).
mainHead(r("tx-g7470",0,0,(X,)),constitutiveRule,isA(X,"过失")) :- inst(r("tx-g7470",0,0,(X,))).
cand(isA(X,"过失")) :- inst(r("tx-g7470",0,0,(X,))).
body(r("tx-g7470",0,0,(X,)),isA(X,"重大过失")) :- inst(r("tx-g7470",0,0,(X,))).

% c1188[0.0] 无民事行为能力人、限制民事行为能力人造成他人损害的，由监护人承担侵权责任（无过错责任）（第1188条第1款；npc）
inst(r("c1188",0,0,(G,V,W,X,))) :- cand(causesDamage(W,V,X)), cand(noCapacity(W)), cand(guardianOf(G,W)).
constitutiveRule(r("c1188",0,0,(G,V,W,X,)),liable(G,V,X)) :- inst(r("c1188",0,0,(G,V,W,X,))).
mainHead(r("c1188",0,0,(G,V,W,X,)),constitutiveRule,liable(G,V,X)) :- inst(r("c1188",0,0,(G,V,W,X,))).
cand(liable(G,V,X)) :- inst(r("c1188",0,0,(G,V,W,X,))).
body(r("c1188",0,0,(G,V,W,X,)),causesDamage(W,V,X)) :- inst(r("c1188",0,0,(G,V,W,X,))).
body(r("c1188",0,0,(G,V,W,X,)),noCapacity(W)) :- inst(r("c1188",0,0,(G,V,W,X,))).
body(r("c1188",0,0,(G,V,W,X,)),guardianOf(G,W)) :- inst(r("c1188",0,0,(G,V,W,X,))).
% c1188[1.0] 无民事行为能力人、限制民事行为能力人造成他人损害的，由监护人承担侵权责任（无过错责任）（第1188条第1款；npc）
inst(r("c1188",1,0,(G,V,W,X,))) :- cand(causesDamage(W,V,X)), cand(limitedCapacity(W)), cand(guardianOf(G,W)).
constitutiveRule(r("c1188",1,0,(G,V,W,X,)),liable(G,V,X)) :- inst(r("c1188",1,0,(G,V,W,X,))).
mainHead(r("c1188",1,0,(G,V,W,X,)),constitutiveRule,liable(G,V,X)) :- inst(r("c1188",1,0,(G,V,W,X,))).
cand(liable(G,V,X)) :- inst(r("c1188",1,0,(G,V,W,X,))).
body(r("c1188",1,0,(G,V,W,X,)),causesDamage(W,V,X)) :- inst(r("c1188",1,0,(G,V,W,X,))).
body(r("c1188",1,0,(G,V,W,X,)),limitedCapacity(W)) :- inst(r("c1188",1,0,(G,V,W,X,))).
body(r("c1188",1,0,(G,V,W,X,)),guardianOf(G,W)) :- inst(r("c1188",1,0,(G,V,W,X,))).

% c1188-reduce[0.0] 监护人尽到监护职责的，可以减轻其侵权责任（第1188条第1款；npc）
inst(r("c1188-reduce",0,0,(G,V,W,X,))) :- cand(liable(G,V,X)), cand(guardianOf(G,W)), cand(guardianDutyFulfilled(G,W)).
constitutiveRule(r("c1188-reduce",0,0,(G,V,W,X,)),liabilityMayBeReduced(G,X)) :- inst(r("c1188-reduce",0,0,(G,V,W,X,))).
mainHead(r("c1188-reduce",0,0,(G,V,W,X,)),constitutiveRule,liabilityMayBeReduced(G,X)) :- inst(r("c1188-reduce",0,0,(G,V,W,X,))).
cand(liabilityMayBeReduced(G,X)) :- inst(r("c1188-reduce",0,0,(G,V,W,X,))).
body(r("c1188-reduce",0,0,(G,V,W,X,)),liable(G,V,X)) :- inst(r("c1188-reduce",0,0,(G,V,W,X,))).
body(r("c1188-reduce",0,0,(G,V,W,X,)),guardianOf(G,W)) :- inst(r("c1188-reduce",0,0,(G,V,W,X,))).
body(r("c1188-reduce",0,0,(G,V,W,X,)),guardianDutyFulfilled(G,W)) :- inst(r("c1188-reduce",0,0,(G,V,W,X,))).

% c1188-2[0.0] 有财产的，从本人财产中支付赔偿费用；不足部分由监护人赔偿（第1188条第2款；npc）
inst(r("c1188-2",0,0,(G,V,W,X,))) :- cand(causesDamage(W,V,X)), cand(noCapacity(W)), cand(hasOwnProperty(W)), cand(guardianOf(G,W)).
constitutiveRule(r("c1188-2",0,0,(G,V,W,X,)),paidFromWardsProperty(W,X)) :- inst(r("c1188-2",0,0,(G,V,W,X,))).
mainHead(r("c1188-2",0,0,(G,V,W,X,)),constitutiveRule,paidFromWardsProperty(W,X)) :- inst(r("c1188-2",0,0,(G,V,W,X,))).
cand(paidFromWardsProperty(W,X)) :- inst(r("c1188-2",0,0,(G,V,W,X,))).
body(r("c1188-2",0,0,(G,V,W,X,)),causesDamage(W,V,X)) :- inst(r("c1188-2",0,0,(G,V,W,X,))).
body(r("c1188-2",0,0,(G,V,W,X,)),noCapacity(W)) :- inst(r("c1188-2",0,0,(G,V,W,X,))).
body(r("c1188-2",0,0,(G,V,W,X,)),hasOwnProperty(W)) :- inst(r("c1188-2",0,0,(G,V,W,X,))).
body(r("c1188-2",0,0,(G,V,W,X,)),guardianOf(G,W)) :- inst(r("c1188-2",0,0,(G,V,W,X,))).
% c1188-2[0.1] 有财产的，从本人财产中支付赔偿费用；不足部分由监护人赔偿（第1188条第2款；npc）
inst(r("c1188-2",0,1,(G,V,W,X,))) :- cand(causesDamage(W,V,X)), cand(noCapacity(W)), cand(hasOwnProperty(W)), cand(guardianOf(G,W)).
constitutiveRule(r("c1188-2",0,1,(G,V,W,X,)),guardianPaysShortfall(G,X)) :- inst(r("c1188-2",0,1,(G,V,W,X,))).
mainHead(r("c1188-2",0,1,(G,V,W,X,)),constitutiveRule,guardianPaysShortfall(G,X)) :- inst(r("c1188-2",0,1,(G,V,W,X,))).
cand(guardianPaysShortfall(G,X)) :- inst(r("c1188-2",0,1,(G,V,W,X,))).
body(r("c1188-2",0,1,(G,V,W,X,)),causesDamage(W,V,X)) :- inst(r("c1188-2",0,1,(G,V,W,X,))).
body(r("c1188-2",0,1,(G,V,W,X,)),noCapacity(W)) :- inst(r("c1188-2",0,1,(G,V,W,X,))).
body(r("c1188-2",0,1,(G,V,W,X,)),hasOwnProperty(W)) :- inst(r("c1188-2",0,1,(G,V,W,X,))).
body(r("c1188-2",0,1,(G,V,W,X,)),guardianOf(G,W)) :- inst(r("c1188-2",0,1,(G,V,W,X,))).
% c1188-2[1.0] 有财产的，从本人财产中支付赔偿费用；不足部分由监护人赔偿（第1188条第2款；npc）
inst(r("c1188-2",1,0,(G,V,W,X,))) :- cand(causesDamage(W,V,X)), cand(limitedCapacity(W)), cand(hasOwnProperty(W)), cand(guardianOf(G,W)).
constitutiveRule(r("c1188-2",1,0,(G,V,W,X,)),paidFromWardsProperty(W,X)) :- inst(r("c1188-2",1,0,(G,V,W,X,))).
mainHead(r("c1188-2",1,0,(G,V,W,X,)),constitutiveRule,paidFromWardsProperty(W,X)) :- inst(r("c1188-2",1,0,(G,V,W,X,))).
cand(paidFromWardsProperty(W,X)) :- inst(r("c1188-2",1,0,(G,V,W,X,))).
body(r("c1188-2",1,0,(G,V,W,X,)),causesDamage(W,V,X)) :- inst(r("c1188-2",1,0,(G,V,W,X,))).
body(r("c1188-2",1,0,(G,V,W,X,)),limitedCapacity(W)) :- inst(r("c1188-2",1,0,(G,V,W,X,))).
body(r("c1188-2",1,0,(G,V,W,X,)),hasOwnProperty(W)) :- inst(r("c1188-2",1,0,(G,V,W,X,))).
body(r("c1188-2",1,0,(G,V,W,X,)),guardianOf(G,W)) :- inst(r("c1188-2",1,0,(G,V,W,X,))).
% c1188-2[1.1] 有财产的，从本人财产中支付赔偿费用；不足部分由监护人赔偿（第1188条第2款；npc）
inst(r("c1188-2",1,1,(G,V,W,X,))) :- cand(causesDamage(W,V,X)), cand(limitedCapacity(W)), cand(hasOwnProperty(W)), cand(guardianOf(G,W)).
constitutiveRule(r("c1188-2",1,1,(G,V,W,X,)),guardianPaysShortfall(G,X)) :- inst(r("c1188-2",1,1,(G,V,W,X,))).
mainHead(r("c1188-2",1,1,(G,V,W,X,)),constitutiveRule,guardianPaysShortfall(G,X)) :- inst(r("c1188-2",1,1,(G,V,W,X,))).
cand(guardianPaysShortfall(G,X)) :- inst(r("c1188-2",1,1,(G,V,W,X,))).
body(r("c1188-2",1,1,(G,V,W,X,)),causesDamage(W,V,X)) :- inst(r("c1188-2",1,1,(G,V,W,X,))).
body(r("c1188-2",1,1,(G,V,W,X,)),limitedCapacity(W)) :- inst(r("c1188-2",1,1,(G,V,W,X,))).
body(r("c1188-2",1,1,(G,V,W,X,)),hasOwnProperty(W)) :- inst(r("c1188-2",1,1,(G,V,W,X,))).
body(r("c1188-2",1,1,(G,V,W,X,)),guardianOf(G,W)) :- inst(r("c1188-2",1,1,(G,V,W,X,))).

% tx-g7596[0.0] 分类（自动抽取自图的层级）：用人单位责任 ⊑ 用人者责任
inst(r("tx-g7596",0,0,(X,))) :- cand(isA(X,"用人单位责任")).
constitutiveRule(r("tx-g7596",0,0,(X,)),isA(X,"用人者责任")) :- inst(r("tx-g7596",0,0,(X,))).
mainHead(r("tx-g7596",0,0,(X,)),constitutiveRule,isA(X,"用人者责任")) :- inst(r("tx-g7596",0,0,(X,))).
cand(isA(X,"用人者责任")) :- inst(r("tx-g7596",0,0,(X,))).
body(r("tx-g7596",0,0,(X,)),isA(X,"用人单位责任")) :- inst(r("tx-g7596",0,0,(X,))).

% tx-g7611[0.0] 分类（自动抽取自图的层级）：个人劳务使用人责任 ⊑ 用人者责任
inst(r("tx-g7611",0,0,(X,))) :- cand(isA(X,"个人劳务使用人责任")).
constitutiveRule(r("tx-g7611",0,0,(X,)),isA(X,"用人者责任")) :- inst(r("tx-g7611",0,0,(X,))).
mainHead(r("tx-g7611",0,0,(X,)),constitutiveRule,isA(X,"用人者责任")) :- inst(r("tx-g7611",0,0,(X,))).
cand(isA(X,"用人者责任")) :- inst(r("tx-g7611",0,0,(X,))).
body(r("tx-g7611",0,0,(X,)),isA(X,"个人劳务使用人责任")) :- inst(r("tx-g7611",0,0,(X,))).

% c1191-1[0.0] 工作人员因执行工作任务造成他人损害的，由用人单位承担侵权责任（替代责任）（第1191条第1款；npc）
inst(r("c1191-1",0,0,(E,U,V,X,))) :- cand(employeeOf(E,U)), cand(performingDuties(E,X)), cand(causesDamage(E,V,X)).
constitutiveRule(r("c1191-1",0,0,(E,U,V,X,)),liable(U,V,X)) :- inst(r("c1191-1",0,0,(E,U,V,X,))).
mainHead(r("c1191-1",0,0,(E,U,V,X,)),constitutiveRule,liable(U,V,X)) :- inst(r("c1191-1",0,0,(E,U,V,X,))).
cand(liable(U,V,X)) :- inst(r("c1191-1",0,0,(E,U,V,X,))).
body(r("c1191-1",0,0,(E,U,V,X,)),employeeOf(E,U)) :- inst(r("c1191-1",0,0,(E,U,V,X,))).
body(r("c1191-1",0,0,(E,U,V,X,)),performingDuties(E,X)) :- inst(r("c1191-1",0,0,(E,U,V,X,))).
body(r("c1191-1",0,0,(E,U,V,X,)),causesDamage(E,V,X)) :- inst(r("c1191-1",0,0,(E,U,V,X,))).
inst(x("c1191-1",0,0,0,(E,U,V,X,))) :- inst(r("c1191-1",0,0,(E,U,V,X,))), cand(dispatchedWorker(E)).
constitutiveRule(x("c1191-1",0,0,0,(E,U,V,X,)),non(liable(U,V,X))) :- inst(x("c1191-1",0,0,0,(E,U,V,X,))).
body(x("c1191-1",0,0,0,(E,U,V,X,)),employeeOf(E,U)) :- inst(x("c1191-1",0,0,0,(E,U,V,X,))).
body(x("c1191-1",0,0,0,(E,U,V,X,)),performingDuties(E,X)) :- inst(x("c1191-1",0,0,0,(E,U,V,X,))).
body(x("c1191-1",0,0,0,(E,U,V,X,)),causesDamage(E,V,X)) :- inst(x("c1191-1",0,0,0,(E,U,V,X,))).
body(x("c1191-1",0,0,0,(E,U,V,X,)),dispatchedWorker(E)) :- inst(x("c1191-1",0,0,0,(E,U,V,X,))).
superior(x("c1191-1",0,0,0,(E,U,V,X,)),r("c1191-1",0,0,(E,U,V,X,))) :- inst(x("c1191-1",0,0,0,(E,U,V,X,))).
exc(x("c1191-1",0,0,0,(E,U,V,X,)),r("c1191-1",0,0,(E,U,V,X,)),constitutiveRule,liable(U,V,X)) :- inst(x("c1191-1",0,0,0,(E,U,V,X,))).
% c1191-1[0.1] 工作人员因执行工作任务造成他人损害的，由用人单位承担侵权责任（替代责任）（第1191条第1款；npc）
inst(r("c1191-1",0,1,(E,U,V,X,))) :- cand(employeeOf(E,U)), cand(performingDuties(E,X)), cand(causesDamage(E,V,X)).
constitutiveRule(r("c1191-1",0,1,(E,U,V,X,)),non(liable(E,V,X))) :- inst(r("c1191-1",0,1,(E,U,V,X,))).
mainHead(r("c1191-1",0,1,(E,U,V,X,)),constitutiveRule,non(liable(E,V,X))) :- inst(r("c1191-1",0,1,(E,U,V,X,))).
cand(liable(E,V,X)) :- inst(r("c1191-1",0,1,(E,U,V,X,))).
body(r("c1191-1",0,1,(E,U,V,X,)),employeeOf(E,U)) :- inst(r("c1191-1",0,1,(E,U,V,X,))).
body(r("c1191-1",0,1,(E,U,V,X,)),performingDuties(E,X)) :- inst(r("c1191-1",0,1,(E,U,V,X,))).
body(r("c1191-1",0,1,(E,U,V,X,)),causesDamage(E,V,X)) :- inst(r("c1191-1",0,1,(E,U,V,X,))).
inst(x("c1191-1",0,1,0,(E,U,V,X,))) :- inst(r("c1191-1",0,1,(E,U,V,X,))), cand(dispatchedWorker(E)).
constitutiveRule(x("c1191-1",0,1,0,(E,U,V,X,)),liable(E,V,X)) :- inst(x("c1191-1",0,1,0,(E,U,V,X,))).
body(x("c1191-1",0,1,0,(E,U,V,X,)),employeeOf(E,U)) :- inst(x("c1191-1",0,1,0,(E,U,V,X,))).
body(x("c1191-1",0,1,0,(E,U,V,X,)),performingDuties(E,X)) :- inst(x("c1191-1",0,1,0,(E,U,V,X,))).
body(x("c1191-1",0,1,0,(E,U,V,X,)),causesDamage(E,V,X)) :- inst(x("c1191-1",0,1,0,(E,U,V,X,))).
body(x("c1191-1",0,1,0,(E,U,V,X,)),dispatchedWorker(E)) :- inst(x("c1191-1",0,1,0,(E,U,V,X,))).
superior(x("c1191-1",0,1,0,(E,U,V,X,)),r("c1191-1",0,1,(E,U,V,X,))) :- inst(x("c1191-1",0,1,0,(E,U,V,X,))).
exc(x("c1191-1",0,1,0,(E,U,V,X,)),r("c1191-1",0,1,(E,U,V,X,)),constitutiveRule,non(liable(E,V,X))) :- inst(x("c1191-1",0,1,0,(E,U,V,X,))).

% c1191-recourse[0.0] 用人单位承担侵权责任后，可以向有故意或者重大过失的工作人员追偿（第1191条第1款；npc）
inst(r("c1191-recourse",0,0,(E,U,V,X,))) :- cand(employeeOf(E,U)), cand(performingDuties(E,X)), cand(liable(U,V,X)), cand(intentional(E,X)).
constitutiveRule(r("c1191-recourse",0,0,(E,U,V,X,)),recourse(U,E,X)) :- inst(r("c1191-recourse",0,0,(E,U,V,X,))).
mainHead(r("c1191-recourse",0,0,(E,U,V,X,)),constitutiveRule,recourse(U,E,X)) :- inst(r("c1191-recourse",0,0,(E,U,V,X,))).
cand(recourse(U,E,X)) :- inst(r("c1191-recourse",0,0,(E,U,V,X,))).
body(r("c1191-recourse",0,0,(E,U,V,X,)),employeeOf(E,U)) :- inst(r("c1191-recourse",0,0,(E,U,V,X,))).
body(r("c1191-recourse",0,0,(E,U,V,X,)),performingDuties(E,X)) :- inst(r("c1191-recourse",0,0,(E,U,V,X,))).
body(r("c1191-recourse",0,0,(E,U,V,X,)),liable(U,V,X)) :- inst(r("c1191-recourse",0,0,(E,U,V,X,))).
body(r("c1191-recourse",0,0,(E,U,V,X,)),intentional(E,X)) :- inst(r("c1191-recourse",0,0,(E,U,V,X,))).
% c1191-recourse[1.0] 用人单位承担侵权责任后，可以向有故意或者重大过失的工作人员追偿（第1191条第1款；npc）
inst(r("c1191-recourse",1,0,(E,U,V,X,))) :- cand(employeeOf(E,U)), cand(performingDuties(E,X)), cand(liable(U,V,X)), cand(grossNegligence(E,X)).
constitutiveRule(r("c1191-recourse",1,0,(E,U,V,X,)),recourse(U,E,X)) :- inst(r("c1191-recourse",1,0,(E,U,V,X,))).
mainHead(r("c1191-recourse",1,0,(E,U,V,X,)),constitutiveRule,recourse(U,E,X)) :- inst(r("c1191-recourse",1,0,(E,U,V,X,))).
cand(recourse(U,E,X)) :- inst(r("c1191-recourse",1,0,(E,U,V,X,))).
body(r("c1191-recourse",1,0,(E,U,V,X,)),employeeOf(E,U)) :- inst(r("c1191-recourse",1,0,(E,U,V,X,))).
body(r("c1191-recourse",1,0,(E,U,V,X,)),performingDuties(E,X)) :- inst(r("c1191-recourse",1,0,(E,U,V,X,))).
body(r("c1191-recourse",1,0,(E,U,V,X,)),liable(U,V,X)) :- inst(r("c1191-recourse",1,0,(E,U,V,X,))).
body(r("c1191-recourse",1,0,(E,U,V,X,)),grossNegligence(E,X)) :- inst(r("c1191-recourse",1,0,(E,U,V,X,))).

% c1191-2[0.0] 劳务派遣期间，由接受劳务派遣的用工单位承担侵权责任（第1191条第2款；npc）
inst(r("c1191-2",0,0,(E,H,V,X,))) :- cand(dispatchedWorker(E)), cand(hostEmployer(H,E)), cand(performingDuties(E,X)), cand(causesDamage(E,V,X)).
constitutiveRule(r("c1191-2",0,0,(E,H,V,X,)),liable(H,V,X)) :- inst(r("c1191-2",0,0,(E,H,V,X,))).
mainHead(r("c1191-2",0,0,(E,H,V,X,)),constitutiveRule,liable(H,V,X)) :- inst(r("c1191-2",0,0,(E,H,V,X,))).
cand(liable(H,V,X)) :- inst(r("c1191-2",0,0,(E,H,V,X,))).
body(r("c1191-2",0,0,(E,H,V,X,)),dispatchedWorker(E)) :- inst(r("c1191-2",0,0,(E,H,V,X,))).
body(r("c1191-2",0,0,(E,H,V,X,)),hostEmployer(H,E)) :- inst(r("c1191-2",0,0,(E,H,V,X,))).
body(r("c1191-2",0,0,(E,H,V,X,)),performingDuties(E,X)) :- inst(r("c1191-2",0,0,(E,H,V,X,))).
body(r("c1191-2",0,0,(E,H,V,X,)),causesDamage(E,V,X)) :- inst(r("c1191-2",0,0,(E,H,V,X,))).
% c1191-2[0.1] 劳务派遣期间，由接受劳务派遣的用工单位承担侵权责任（第1191条第2款；npc）
inst(r("c1191-2",0,1,(E,H,V,X,))) :- cand(dispatchedWorker(E)), cand(hostEmployer(H,E)), cand(performingDuties(E,X)), cand(causesDamage(E,V,X)).
constitutiveRule(r("c1191-2",0,1,(E,H,V,X,)),non(liable(E,V,X))) :- inst(r("c1191-2",0,1,(E,H,V,X,))).
mainHead(r("c1191-2",0,1,(E,H,V,X,)),constitutiveRule,non(liable(E,V,X))) :- inst(r("c1191-2",0,1,(E,H,V,X,))).
cand(liable(E,V,X)) :- inst(r("c1191-2",0,1,(E,H,V,X,))).
body(r("c1191-2",0,1,(E,H,V,X,)),dispatchedWorker(E)) :- inst(r("c1191-2",0,1,(E,H,V,X,))).
body(r("c1191-2",0,1,(E,H,V,X,)),hostEmployer(H,E)) :- inst(r("c1191-2",0,1,(E,H,V,X,))).
body(r("c1191-2",0,1,(E,H,V,X,)),performingDuties(E,X)) :- inst(r("c1191-2",0,1,(E,H,V,X,))).
body(r("c1191-2",0,1,(E,H,V,X,)),causesDamage(E,V,X)) :- inst(r("c1191-2",0,1,(E,H,V,X,))).

% c1191-2b[0.0] 劳务派遣单位有过错的，承担相应的责任（第1191条第2款；npc）
inst(r("c1191-2b",0,0,(Dp,E,V,X,))) :- cand(dispatchedWorker(E)), cand(dispatchAgency(Dp,E)), cand(performingDuties(E,X)), cand(causesDamage(E,V,X)), cand(fault(Dp,X)).
constitutiveRule(r("c1191-2b",0,0,(Dp,E,V,X,)),correspondingLiability(Dp,V,X)) :- inst(r("c1191-2b",0,0,(Dp,E,V,X,))).
mainHead(r("c1191-2b",0,0,(Dp,E,V,X,)),constitutiveRule,correspondingLiability(Dp,V,X)) :- inst(r("c1191-2b",0,0,(Dp,E,V,X,))).
cand(correspondingLiability(Dp,V,X)) :- inst(r("c1191-2b",0,0,(Dp,E,V,X,))).
body(r("c1191-2b",0,0,(Dp,E,V,X,)),dispatchedWorker(E)) :- inst(r("c1191-2b",0,0,(Dp,E,V,X,))).
body(r("c1191-2b",0,0,(Dp,E,V,X,)),dispatchAgency(Dp,E)) :- inst(r("c1191-2b",0,0,(Dp,E,V,X,))).
body(r("c1191-2b",0,0,(Dp,E,V,X,)),performingDuties(E,X)) :- inst(r("c1191-2b",0,0,(Dp,E,V,X,))).
body(r("c1191-2b",0,0,(Dp,E,V,X,)),causesDamage(E,V,X)) :- inst(r("c1191-2b",0,0,(Dp,E,V,X,))).
body(r("c1191-2b",0,0,(Dp,E,V,X,)),fault(Dp,X)) :- inst(r("c1191-2b",0,0,(Dp,E,V,X,))).

% c1199[0.0] 无民事行为能力人在教育机构受到人身损害的，教育机构承担责任；能证明尽到教育、管理职责的除外（过错推定）（第1199条；npc）
inst(r("c1199",0,0,(S,V,X,))) :- cand(noCapacity(V)), cand(injuredAtSchool(V,S,X)).
constitutiveRule(r("c1199",0,0,(S,V,X,)),liable(S,V,X)) :- inst(r("c1199",0,0,(S,V,X,))).
mainHead(r("c1199",0,0,(S,V,X,)),constitutiveRule,liable(S,V,X)) :- inst(r("c1199",0,0,(S,V,X,))).
cand(liable(S,V,X)) :- inst(r("c1199",0,0,(S,V,X,))).
body(r("c1199",0,0,(S,V,X,)),noCapacity(V)) :- inst(r("c1199",0,0,(S,V,X,))).
body(r("c1199",0,0,(S,V,X,)),injuredAtSchool(V,S,X)) :- inst(r("c1199",0,0,(S,V,X,))).
inst(x("c1199",0,0,0,(S,V,X,))) :- inst(r("c1199",0,0,(S,V,X,))), cand(injuredByOutsider(X)).
constitutiveRule(x("c1199",0,0,0,(S,V,X,)),non(liable(S,V,X))) :- inst(x("c1199",0,0,0,(S,V,X,))).
body(x("c1199",0,0,0,(S,V,X,)),noCapacity(V)) :- inst(x("c1199",0,0,0,(S,V,X,))).
body(x("c1199",0,0,0,(S,V,X,)),injuredAtSchool(V,S,X)) :- inst(x("c1199",0,0,0,(S,V,X,))).
body(x("c1199",0,0,0,(S,V,X,)),injuredByOutsider(X)) :- inst(x("c1199",0,0,0,(S,V,X,))).
superior(x("c1199",0,0,0,(S,V,X,)),r("c1199",0,0,(S,V,X,))) :- inst(x("c1199",0,0,0,(S,V,X,))).
exc(x("c1199",0,0,0,(S,V,X,)),r("c1199",0,0,(S,V,X,)),constitutiveRule,liable(S,V,X)) :- inst(x("c1199",0,0,0,(S,V,X,))).
inst(x("c1199",0,0,1,(S,V,X,))) :- inst(r("c1199",0,0,(S,V,X,))), cand(provesDutyFulfilled(S,X)).
constitutiveRule(x("c1199",0,0,1,(S,V,X,)),non(liable(S,V,X))) :- inst(x("c1199",0,0,1,(S,V,X,))).
body(x("c1199",0,0,1,(S,V,X,)),noCapacity(V)) :- inst(x("c1199",0,0,1,(S,V,X,))).
body(x("c1199",0,0,1,(S,V,X,)),injuredAtSchool(V,S,X)) :- inst(x("c1199",0,0,1,(S,V,X,))).
body(x("c1199",0,0,1,(S,V,X,)),provesDutyFulfilled(S,X)) :- inst(x("c1199",0,0,1,(S,V,X,))).
superior(x("c1199",0,0,1,(S,V,X,)),r("c1199",0,0,(S,V,X,))) :- inst(x("c1199",0,0,1,(S,V,X,))).
exc(x("c1199",0,0,1,(S,V,X,)),r("c1199",0,0,(S,V,X,)),constitutiveRule,liable(S,V,X)) :- inst(x("c1199",0,0,1,(S,V,X,))).

% c1200[0.0] 限制民事行为能力人受到人身损害，教育机构未尽到教育、管理职责的，承担责任（过错责任，受害人举证）（第1200条；npc）
inst(r("c1200",0,0,(S,V,X,))) :- cand(limitedCapacity(V)), cand(injuredAtSchool(V,S,X)), cand(schoolFailedDuty(S,X)).
constitutiveRule(r("c1200",0,0,(S,V,X,)),liable(S,V,X)) :- inst(r("c1200",0,0,(S,V,X,))).
mainHead(r("c1200",0,0,(S,V,X,)),constitutiveRule,liable(S,V,X)) :- inst(r("c1200",0,0,(S,V,X,))).
cand(liable(S,V,X)) :- inst(r("c1200",0,0,(S,V,X,))).
body(r("c1200",0,0,(S,V,X,)),limitedCapacity(V)) :- inst(r("c1200",0,0,(S,V,X,))).
body(r("c1200",0,0,(S,V,X,)),injuredAtSchool(V,S,X)) :- inst(r("c1200",0,0,(S,V,X,))).
body(r("c1200",0,0,(S,V,X,)),schoolFailedDuty(S,X)) :- inst(r("c1200",0,0,(S,V,X,))).
inst(x("c1200",0,0,0,(S,V,X,))) :- inst(r("c1200",0,0,(S,V,X,))), cand(injuredByOutsider(X)).
constitutiveRule(x("c1200",0,0,0,(S,V,X,)),non(liable(S,V,X))) :- inst(x("c1200",0,0,0,(S,V,X,))).
body(x("c1200",0,0,0,(S,V,X,)),limitedCapacity(V)) :- inst(x("c1200",0,0,0,(S,V,X,))).
body(x("c1200",0,0,0,(S,V,X,)),injuredAtSchool(V,S,X)) :- inst(x("c1200",0,0,0,(S,V,X,))).
body(x("c1200",0,0,0,(S,V,X,)),schoolFailedDuty(S,X)) :- inst(x("c1200",0,0,0,(S,V,X,))).
body(x("c1200",0,0,0,(S,V,X,)),injuredByOutsider(X)) :- inst(x("c1200",0,0,0,(S,V,X,))).
superior(x("c1200",0,0,0,(S,V,X,)),r("c1200",0,0,(S,V,X,))) :- inst(x("c1200",0,0,0,(S,V,X,))).
exc(x("c1200",0,0,0,(S,V,X,)),r("c1200",0,0,(S,V,X,)),constitutiveRule,liable(S,V,X)) :- inst(x("c1200",0,0,0,(S,V,X,))).

% c1201[0.0] 受到教育机构以外的第三人人身损害的，由第三人承担侵权责任（第1201条；npc）
inst(r("c1201",0,0,(Q,S,V,X,))) :- cand(noCapacity(V)), cand(injuredAtSchool(V,S,X)), cand(injuredByOutsider(X)), cand(outsiderTortfeasor(Q,X)).
constitutiveRule(r("c1201",0,0,(Q,S,V,X,)),liable(Q,V,X)) :- inst(r("c1201",0,0,(Q,S,V,X,))).
mainHead(r("c1201",0,0,(Q,S,V,X,)),constitutiveRule,liable(Q,V,X)) :- inst(r("c1201",0,0,(Q,S,V,X,))).
cand(liable(Q,V,X)) :- inst(r("c1201",0,0,(Q,S,V,X,))).
body(r("c1201",0,0,(Q,S,V,X,)),noCapacity(V)) :- inst(r("c1201",0,0,(Q,S,V,X,))).
body(r("c1201",0,0,(Q,S,V,X,)),injuredAtSchool(V,S,X)) :- inst(r("c1201",0,0,(Q,S,V,X,))).
body(r("c1201",0,0,(Q,S,V,X,)),injuredByOutsider(X)) :- inst(r("c1201",0,0,(Q,S,V,X,))).
body(r("c1201",0,0,(Q,S,V,X,)),outsiderTortfeasor(Q,X)) :- inst(r("c1201",0,0,(Q,S,V,X,))).
% c1201[1.0] 受到教育机构以外的第三人人身损害的，由第三人承担侵权责任（第1201条；npc）
inst(r("c1201",1,0,(Q,S,V,X,))) :- cand(limitedCapacity(V)), cand(injuredAtSchool(V,S,X)), cand(injuredByOutsider(X)), cand(outsiderTortfeasor(Q,X)).
constitutiveRule(r("c1201",1,0,(Q,S,V,X,)),liable(Q,V,X)) :- inst(r("c1201",1,0,(Q,S,V,X,))).
mainHead(r("c1201",1,0,(Q,S,V,X,)),constitutiveRule,liable(Q,V,X)) :- inst(r("c1201",1,0,(Q,S,V,X,))).
cand(liable(Q,V,X)) :- inst(r("c1201",1,0,(Q,S,V,X,))).
body(r("c1201",1,0,(Q,S,V,X,)),limitedCapacity(V)) :- inst(r("c1201",1,0,(Q,S,V,X,))).
body(r("c1201",1,0,(Q,S,V,X,)),injuredAtSchool(V,S,X)) :- inst(r("c1201",1,0,(Q,S,V,X,))).
body(r("c1201",1,0,(Q,S,V,X,)),injuredByOutsider(X)) :- inst(r("c1201",1,0,(Q,S,V,X,))).
body(r("c1201",1,0,(Q,S,V,X,)),outsiderTortfeasor(Q,X)) :- inst(r("c1201",1,0,(Q,S,V,X,))).

% c1201-supp[0.0] 教育机构未尽到管理职责的，承担相应的补充责任，承担后可以向第三人追偿（第1201条；npc）
inst(r("c1201-supp",0,0,(S,V,X,))) :- cand(noCapacity(V)), cand(injuredAtSchool(V,S,X)), cand(injuredByOutsider(X)), cand(schoolFailedDuty(S,X)).
constitutiveRule(r("c1201-supp",0,0,(S,V,X,)),supplementaryLiability(S,V,X)) :- inst(r("c1201-supp",0,0,(S,V,X,))).
mainHead(r("c1201-supp",0,0,(S,V,X,)),constitutiveRule,supplementaryLiability(S,V,X)) :- inst(r("c1201-supp",0,0,(S,V,X,))).
cand(supplementaryLiability(S,V,X)) :- inst(r("c1201-supp",0,0,(S,V,X,))).
body(r("c1201-supp",0,0,(S,V,X,)),noCapacity(V)) :- inst(r("c1201-supp",0,0,(S,V,X,))).
body(r("c1201-supp",0,0,(S,V,X,)),injuredAtSchool(V,S,X)) :- inst(r("c1201-supp",0,0,(S,V,X,))).
body(r("c1201-supp",0,0,(S,V,X,)),injuredByOutsider(X)) :- inst(r("c1201-supp",0,0,(S,V,X,))).
body(r("c1201-supp",0,0,(S,V,X,)),schoolFailedDuty(S,X)) :- inst(r("c1201-supp",0,0,(S,V,X,))).
% c1201-supp[0.1] 教育机构未尽到管理职责的，承担相应的补充责任，承担后可以向第三人追偿（第1201条；npc）
inst(r("c1201-supp",0,1,(S,V,X,))) :- cand(noCapacity(V)), cand(injuredAtSchool(V,S,X)), cand(injuredByOutsider(X)), cand(schoolFailedDuty(S,X)).
constitutiveRule(r("c1201-supp",0,1,(S,V,X,)),non(liable(S,V,X))) :- inst(r("c1201-supp",0,1,(S,V,X,))).
mainHead(r("c1201-supp",0,1,(S,V,X,)),constitutiveRule,non(liable(S,V,X))) :- inst(r("c1201-supp",0,1,(S,V,X,))).
cand(liable(S,V,X)) :- inst(r("c1201-supp",0,1,(S,V,X,))).
body(r("c1201-supp",0,1,(S,V,X,)),noCapacity(V)) :- inst(r("c1201-supp",0,1,(S,V,X,))).
body(r("c1201-supp",0,1,(S,V,X,)),injuredAtSchool(V,S,X)) :- inst(r("c1201-supp",0,1,(S,V,X,))).
body(r("c1201-supp",0,1,(S,V,X,)),injuredByOutsider(X)) :- inst(r("c1201-supp",0,1,(S,V,X,))).
body(r("c1201-supp",0,1,(S,V,X,)),schoolFailedDuty(S,X)) :- inst(r("c1201-supp",0,1,(S,V,X,))).
% c1201-supp[1.0] 教育机构未尽到管理职责的，承担相应的补充责任，承担后可以向第三人追偿（第1201条；npc）
inst(r("c1201-supp",1,0,(S,V,X,))) :- cand(limitedCapacity(V)), cand(injuredAtSchool(V,S,X)), cand(injuredByOutsider(X)), cand(schoolFailedDuty(S,X)).
constitutiveRule(r("c1201-supp",1,0,(S,V,X,)),supplementaryLiability(S,V,X)) :- inst(r("c1201-supp",1,0,(S,V,X,))).
mainHead(r("c1201-supp",1,0,(S,V,X,)),constitutiveRule,supplementaryLiability(S,V,X)) :- inst(r("c1201-supp",1,0,(S,V,X,))).
cand(supplementaryLiability(S,V,X)) :- inst(r("c1201-supp",1,0,(S,V,X,))).
body(r("c1201-supp",1,0,(S,V,X,)),limitedCapacity(V)) :- inst(r("c1201-supp",1,0,(S,V,X,))).
body(r("c1201-supp",1,0,(S,V,X,)),injuredAtSchool(V,S,X)) :- inst(r("c1201-supp",1,0,(S,V,X,))).
body(r("c1201-supp",1,0,(S,V,X,)),injuredByOutsider(X)) :- inst(r("c1201-supp",1,0,(S,V,X,))).
body(r("c1201-supp",1,0,(S,V,X,)),schoolFailedDuty(S,X)) :- inst(r("c1201-supp",1,0,(S,V,X,))).
% c1201-supp[1.1] 教育机构未尽到管理职责的，承担相应的补充责任，承担后可以向第三人追偿（第1201条；npc）
inst(r("c1201-supp",1,1,(S,V,X,))) :- cand(limitedCapacity(V)), cand(injuredAtSchool(V,S,X)), cand(injuredByOutsider(X)), cand(schoolFailedDuty(S,X)).
constitutiveRule(r("c1201-supp",1,1,(S,V,X,)),non(liable(S,V,X))) :- inst(r("c1201-supp",1,1,(S,V,X,))).
mainHead(r("c1201-supp",1,1,(S,V,X,)),constitutiveRule,non(liable(S,V,X))) :- inst(r("c1201-supp",1,1,(S,V,X,))).
cand(liable(S,V,X)) :- inst(r("c1201-supp",1,1,(S,V,X,))).
body(r("c1201-supp",1,1,(S,V,X,)),limitedCapacity(V)) :- inst(r("c1201-supp",1,1,(S,V,X,))).
body(r("c1201-supp",1,1,(S,V,X,)),injuredAtSchool(V,S,X)) :- inst(r("c1201-supp",1,1,(S,V,X,))).
body(r("c1201-supp",1,1,(S,V,X,)),injuredByOutsider(X)) :- inst(r("c1201-supp",1,1,(S,V,X,))).
body(r("c1201-supp",1,1,(S,V,X,)),schoolFailedDuty(S,X)) :- inst(r("c1201-supp",1,1,(S,V,X,))).

% c1202[0.0] 因产品存在缺陷造成他人损害的，生产者应当承担侵权责任（无过错责任）（第1202条；npc）
inst(r("c1202",0,0,(M,Pr,V,X,))) :- cand(defectiveProduct(Pr)), cand(producer(M,Pr)), cand(damagedBy(V,X,Pr)).
constitutiveRule(r("c1202",0,0,(M,Pr,V,X,)),liable(M,V,X)) :- inst(r("c1202",0,0,(M,Pr,V,X,))).
mainHead(r("c1202",0,0,(M,Pr,V,X,)),constitutiveRule,liable(M,V,X)) :- inst(r("c1202",0,0,(M,Pr,V,X,))).
cand(liable(M,V,X)) :- inst(r("c1202",0,0,(M,Pr,V,X,))).
body(r("c1202",0,0,(M,Pr,V,X,)),defectiveProduct(Pr)) :- inst(r("c1202",0,0,(M,Pr,V,X,))).
body(r("c1202",0,0,(M,Pr,V,X,)),producer(M,Pr)) :- inst(r("c1202",0,0,(M,Pr,V,X,))).
body(r("c1202",0,0,(M,Pr,V,X,)),damagedBy(V,X,Pr)) :- inst(r("c1202",0,0,(M,Pr,V,X,))).

% c1203[0.0] 被侵权人可以向产品的生产者请求赔偿，也可以向产品的销售者请求赔偿（第1203条第1款；npc）
inst(r("c1203",0,0,(Pr,Se,V,X,))) :- cand(defectiveProduct(Pr)), cand(seller(Se,Pr)), cand(damagedBy(V,X,Pr)).
constitutiveRule(r("c1203",0,0,(Pr,Se,V,X,)),claimCompensationFrom(V,Se,X)) :- inst(r("c1203",0,0,(Pr,Se,V,X,))).
mainHead(r("c1203",0,0,(Pr,Se,V,X,)),constitutiveRule,claimCompensationFrom(V,Se,X)) :- inst(r("c1203",0,0,(Pr,Se,V,X,))).
cand(claimCompensationFrom(V,Se,X)) :- inst(r("c1203",0,0,(Pr,Se,V,X,))).
body(r("c1203",0,0,(Pr,Se,V,X,)),defectiveProduct(Pr)) :- inst(r("c1203",0,0,(Pr,Se,V,X,))).
body(r("c1203",0,0,(Pr,Se,V,X,)),seller(Se,Pr)) :- inst(r("c1203",0,0,(Pr,Se,V,X,))).
body(r("c1203",0,0,(Pr,Se,V,X,)),damagedBy(V,X,Pr)) :- inst(r("c1203",0,0,(Pr,Se,V,X,))).

% c1203-p[0.0] 被侵权人可以向产品的生产者请求赔偿（第1203条第1款；npc）
inst(r("c1203-p",0,0,(M,Pr,V,X,))) :- cand(defectiveProduct(Pr)), cand(producer(M,Pr)), cand(damagedBy(V,X,Pr)).
constitutiveRule(r("c1203-p",0,0,(M,Pr,V,X,)),claimCompensationFrom(V,M,X)) :- inst(r("c1203-p",0,0,(M,Pr,V,X,))).
mainHead(r("c1203-p",0,0,(M,Pr,V,X,)),constitutiveRule,claimCompensationFrom(V,M,X)) :- inst(r("c1203-p",0,0,(M,Pr,V,X,))).
cand(claimCompensationFrom(V,M,X)) :- inst(r("c1203-p",0,0,(M,Pr,V,X,))).
body(r("c1203-p",0,0,(M,Pr,V,X,)),defectiveProduct(Pr)) :- inst(r("c1203-p",0,0,(M,Pr,V,X,))).
body(r("c1203-p",0,0,(M,Pr,V,X,)),producer(M,Pr)) :- inst(r("c1203-p",0,0,(M,Pr,V,X,))).
body(r("c1203-p",0,0,(M,Pr,V,X,)),damagedBy(V,X,Pr)) :- inst(r("c1203-p",0,0,(M,Pr,V,X,))).

% c1203-2a[0.0] 产品缺陷由生产者造成的，销售者赔偿后有权向生产者追偿（第1203条第2款；npc）
inst(r("c1203-2a",0,0,(M,Pr,Se,X,))) :- cand(defectiveProduct(Pr)), cand(producer(M,Pr)), cand(seller(Se,Pr)), cand(defectCausedByProducer(Pr)), cand(paidVictim(Se,X)).
constitutiveRule(r("c1203-2a",0,0,(M,Pr,Se,X,)),recourse(Se,M,X)) :- inst(r("c1203-2a",0,0,(M,Pr,Se,X,))).
mainHead(r("c1203-2a",0,0,(M,Pr,Se,X,)),constitutiveRule,recourse(Se,M,X)) :- inst(r("c1203-2a",0,0,(M,Pr,Se,X,))).
cand(recourse(Se,M,X)) :- inst(r("c1203-2a",0,0,(M,Pr,Se,X,))).
body(r("c1203-2a",0,0,(M,Pr,Se,X,)),defectiveProduct(Pr)) :- inst(r("c1203-2a",0,0,(M,Pr,Se,X,))).
body(r("c1203-2a",0,0,(M,Pr,Se,X,)),producer(M,Pr)) :- inst(r("c1203-2a",0,0,(M,Pr,Se,X,))).
body(r("c1203-2a",0,0,(M,Pr,Se,X,)),seller(Se,Pr)) :- inst(r("c1203-2a",0,0,(M,Pr,Se,X,))).
body(r("c1203-2a",0,0,(M,Pr,Se,X,)),defectCausedByProducer(Pr)) :- inst(r("c1203-2a",0,0,(M,Pr,Se,X,))).
body(r("c1203-2a",0,0,(M,Pr,Se,X,)),paidVictim(Se,X)) :- inst(r("c1203-2a",0,0,(M,Pr,Se,X,))).

% c1203-2b[0.0] 因销售者的过错使产品存在缺陷的，生产者赔偿后有权向销售者追偿（第1203条第2款；npc）
inst(r("c1203-2b",0,0,(M,Pr,Se,X,))) :- cand(defectiveProduct(Pr)), cand(producer(M,Pr)), cand(seller(Se,Pr)), cand(defectCausedBySellerFault(Pr)), cand(paidVictim(M,X)).
constitutiveRule(r("c1203-2b",0,0,(M,Pr,Se,X,)),recourse(M,Se,X)) :- inst(r("c1203-2b",0,0,(M,Pr,Se,X,))).
mainHead(r("c1203-2b",0,0,(M,Pr,Se,X,)),constitutiveRule,recourse(M,Se,X)) :- inst(r("c1203-2b",0,0,(M,Pr,Se,X,))).
cand(recourse(M,Se,X)) :- inst(r("c1203-2b",0,0,(M,Pr,Se,X,))).
body(r("c1203-2b",0,0,(M,Pr,Se,X,)),defectiveProduct(Pr)) :- inst(r("c1203-2b",0,0,(M,Pr,Se,X,))).
body(r("c1203-2b",0,0,(M,Pr,Se,X,)),producer(M,Pr)) :- inst(r("c1203-2b",0,0,(M,Pr,Se,X,))).
body(r("c1203-2b",0,0,(M,Pr,Se,X,)),seller(Se,Pr)) :- inst(r("c1203-2b",0,0,(M,Pr,Se,X,))).
body(r("c1203-2b",0,0,(M,Pr,Se,X,)),defectCausedBySellerFault(Pr)) :- inst(r("c1203-2b",0,0,(M,Pr,Se,X,))).
body(r("c1203-2b",0,0,(M,Pr,Se,X,)),paidVictim(M,X)) :- inst(r("c1203-2b",0,0,(M,Pr,Se,X,))).

% tx-g7838[0.0] 分类（自动抽取自图的层级）：共同侵权 ⊑ 数人侵权
inst(r("tx-g7838",0,0,(X,))) :- cand(isA(X,"共同侵权")).
constitutiveRule(r("tx-g7838",0,0,(X,)),isA(X,"数人侵权")) :- inst(r("tx-g7838",0,0,(X,))).
mainHead(r("tx-g7838",0,0,(X,)),constitutiveRule,isA(X,"数人侵权")) :- inst(r("tx-g7838",0,0,(X,))).
cand(isA(X,"数人侵权")) :- inst(r("tx-g7838",0,0,(X,))).
body(r("tx-g7838",0,0,(X,)),isA(X,"共同侵权")) :- inst(r("tx-g7838",0,0,(X,))).

% tx-g7840[0.0] 分类（自动抽取自图的层级）：无意思联络的数人侵权 ⊑ 数人侵权
inst(r("tx-g7840",0,0,(X,))) :- cand(isA(X,"无意思联络的数人侵权")).
constitutiveRule(r("tx-g7840",0,0,(X,)),isA(X,"数人侵权")) :- inst(r("tx-g7840",0,0,(X,))).
mainHead(r("tx-g7840",0,0,(X,)),constitutiveRule,isA(X,"数人侵权")) :- inst(r("tx-g7840",0,0,(X,))).
cand(isA(X,"数人侵权")) :- inst(r("tx-g7840",0,0,(X,))).
body(r("tx-g7840",0,0,(X,)),isA(X,"无意思联络的数人侵权")) :- inst(r("tx-g7840",0,0,(X,))).

% c1245[0.0] 饲养的动物造成他人损害的，动物饲养人或者管理人应当承担侵权责任（无过错责任）（第1245条；npc）
inst(r("c1245",0,0,(An,K,V,X,))) :- cand(animalDamage(An,V,X)), cand(keeperOrManager(K,An)).
constitutiveRule(r("c1245",0,0,(An,K,V,X,)),liable(K,V,X)) :- inst(r("c1245",0,0,(An,K,V,X,))).
mainHead(r("c1245",0,0,(An,K,V,X,)),constitutiveRule,liable(K,V,X)) :- inst(r("c1245",0,0,(An,K,V,X,))).
cand(liable(K,V,X)) :- inst(r("c1245",0,0,(An,K,V,X,))).
body(r("c1245",0,0,(An,K,V,X,)),animalDamage(An,V,X)) :- inst(r("c1245",0,0,(An,K,V,X,))).
body(r("c1245",0,0,(An,K,V,X,)),keeperOrManager(K,An)) :- inst(r("c1245",0,0,(An,K,V,X,))).

% c1245-def[0.0] 能够证明损害是因被侵权人故意或者重大过失造成的，可以不承担或者减轻责任（第1245条；npc）
inst(r("c1245-def",0,0,(An,K,V,X,))) :- cand(animalDamage(An,V,X)), cand(keeperOrManager(K,An)), cand(victimIntent(V,X)).
constitutiveRule(r("c1245-def",0,0,(An,K,V,X,)),mayExemptOrReduce(K,X)) :- inst(r("c1245-def",0,0,(An,K,V,X,))).
mainHead(r("c1245-def",0,0,(An,K,V,X,)),constitutiveRule,mayExemptOrReduce(K,X)) :- inst(r("c1245-def",0,0,(An,K,V,X,))).
cand(mayExemptOrReduce(K,X)) :- inst(r("c1245-def",0,0,(An,K,V,X,))).
body(r("c1245-def",0,0,(An,K,V,X,)),animalDamage(An,V,X)) :- inst(r("c1245-def",0,0,(An,K,V,X,))).
body(r("c1245-def",0,0,(An,K,V,X,)),keeperOrManager(K,An)) :- inst(r("c1245-def",0,0,(An,K,V,X,))).
body(r("c1245-def",0,0,(An,K,V,X,)),victimIntent(V,X)) :- inst(r("c1245-def",0,0,(An,K,V,X,))).
% c1245-def[1.0] 能够证明损害是因被侵权人故意或者重大过失造成的，可以不承担或者减轻责任（第1245条；npc）
inst(r("c1245-def",1,0,(An,K,V,X,))) :- cand(animalDamage(An,V,X)), cand(keeperOrManager(K,An)), cand(victimGrossNegligence(V,X)).
constitutiveRule(r("c1245-def",1,0,(An,K,V,X,)),mayExemptOrReduce(K,X)) :- inst(r("c1245-def",1,0,(An,K,V,X,))).
mainHead(r("c1245-def",1,0,(An,K,V,X,)),constitutiveRule,mayExemptOrReduce(K,X)) :- inst(r("c1245-def",1,0,(An,K,V,X,))).
cand(mayExemptOrReduce(K,X)) :- inst(r("c1245-def",1,0,(An,K,V,X,))).
body(r("c1245-def",1,0,(An,K,V,X,)),animalDamage(An,V,X)) :- inst(r("c1245-def",1,0,(An,K,V,X,))).
body(r("c1245-def",1,0,(An,K,V,X,)),keeperOrManager(K,An)) :- inst(r("c1245-def",1,0,(An,K,V,X,))).
body(r("c1245-def",1,0,(An,K,V,X,)),victimGrossNegligence(V,X)) :- inst(r("c1245-def",1,0,(An,K,V,X,))).

% c1246[0.0] 违反管理规定未采取安全措施的，被侵权人重大过失不再减免责任（第1246条；npc）
inst(r("c1246",0,0,(An,K,V,X,))) :- cand(animalDamage(An,V,X)), cand(keeperOrManager(K,An)), cand(violatedRulesNoSafetyMeasures(K,An)).
constitutiveRule(r("c1246",0,0,(An,K,V,X,)),non(mayExemptOrReduce(K,X))) :- inst(r("c1246",0,0,(An,K,V,X,))).
mainHead(r("c1246",0,0,(An,K,V,X,)),constitutiveRule,non(mayExemptOrReduce(K,X))) :- inst(r("c1246",0,0,(An,K,V,X,))).
cand(mayExemptOrReduce(K,X)) :- inst(r("c1246",0,0,(An,K,V,X,))).
body(r("c1246",0,0,(An,K,V,X,)),animalDamage(An,V,X)) :- inst(r("c1246",0,0,(An,K,V,X,))).
body(r("c1246",0,0,(An,K,V,X,)),keeperOrManager(K,An)) :- inst(r("c1246",0,0,(An,K,V,X,))).
body(r("c1246",0,0,(An,K,V,X,)),violatedRulesNoSafetyMeasures(K,An)) :- inst(r("c1246",0,0,(An,K,V,X,))).
inst(x("c1246",0,0,0,(An,K,V,X,))) :- inst(r("c1246",0,0,(An,K,V,X,))), cand(victimIntent(V,X)).
constitutiveRule(x("c1246",0,0,0,(An,K,V,X,)),mayExemptOrReduce(K,X)) :- inst(x("c1246",0,0,0,(An,K,V,X,))).
body(x("c1246",0,0,0,(An,K,V,X,)),animalDamage(An,V,X)) :- inst(x("c1246",0,0,0,(An,K,V,X,))).
body(x("c1246",0,0,0,(An,K,V,X,)),keeperOrManager(K,An)) :- inst(x("c1246",0,0,0,(An,K,V,X,))).
body(x("c1246",0,0,0,(An,K,V,X,)),violatedRulesNoSafetyMeasures(K,An)) :- inst(x("c1246",0,0,0,(An,K,V,X,))).
body(x("c1246",0,0,0,(An,K,V,X,)),victimIntent(V,X)) :- inst(x("c1246",0,0,0,(An,K,V,X,))).
superior(x("c1246",0,0,0,(An,K,V,X,)),r("c1246",0,0,(An,K,V,X,))) :- inst(x("c1246",0,0,0,(An,K,V,X,))).
exc(x("c1246",0,0,0,(An,K,V,X,)),r("c1246",0,0,(An,K,V,X,)),constitutiveRule,non(mayExemptOrReduce(K,X))) :- inst(x("c1246",0,0,0,(An,K,V,X,))).

% c1246-reduce[0.0] 违反管理规定的，只有被侵权人故意才可以减轻责任（不能免除）（第1246条；npc）
inst(r("c1246-reduce",0,0,(An,K,V,X,))) :- cand(animalDamage(An,V,X)), cand(keeperOrManager(K,An)), cand(violatedRulesNoSafetyMeasures(K,An)), cand(victimIntent(V,X)).
constitutiveRule(r("c1246-reduce",0,0,(An,K,V,X,)),mayReduceOnly(K,X)) :- inst(r("c1246-reduce",0,0,(An,K,V,X,))).
mainHead(r("c1246-reduce",0,0,(An,K,V,X,)),constitutiveRule,mayReduceOnly(K,X)) :- inst(r("c1246-reduce",0,0,(An,K,V,X,))).
cand(mayReduceOnly(K,X)) :- inst(r("c1246-reduce",0,0,(An,K,V,X,))).
body(r("c1246-reduce",0,0,(An,K,V,X,)),animalDamage(An,V,X)) :- inst(r("c1246-reduce",0,0,(An,K,V,X,))).
body(r("c1246-reduce",0,0,(An,K,V,X,)),keeperOrManager(K,An)) :- inst(r("c1246-reduce",0,0,(An,K,V,X,))).
body(r("c1246-reduce",0,0,(An,K,V,X,)),violatedRulesNoSafetyMeasures(K,An)) :- inst(r("c1246-reduce",0,0,(An,K,V,X,))).
body(r("c1246-reduce",0,0,(An,K,V,X,)),victimIntent(V,X)) :- inst(r("c1246-reduce",0,0,(An,K,V,X,))).
% c1246-reduce[0.1] 违反管理规定的，只有被侵权人故意才可以减轻责任（不能免除）（第1246条；npc）
inst(r("c1246-reduce",0,1,(An,K,V,X,))) :- cand(animalDamage(An,V,X)), cand(keeperOrManager(K,An)), cand(violatedRulesNoSafetyMeasures(K,An)), cand(victimIntent(V,X)).
constitutiveRule(r("c1246-reduce",0,1,(An,K,V,X,)),non(mayExemptOrReduce(K,X))) :- inst(r("c1246-reduce",0,1,(An,K,V,X,))).
mainHead(r("c1246-reduce",0,1,(An,K,V,X,)),constitutiveRule,non(mayExemptOrReduce(K,X))) :- inst(r("c1246-reduce",0,1,(An,K,V,X,))).
cand(mayExemptOrReduce(K,X)) :- inst(r("c1246-reduce",0,1,(An,K,V,X,))).
body(r("c1246-reduce",0,1,(An,K,V,X,)),animalDamage(An,V,X)) :- inst(r("c1246-reduce",0,1,(An,K,V,X,))).
body(r("c1246-reduce",0,1,(An,K,V,X,)),keeperOrManager(K,An)) :- inst(r("c1246-reduce",0,1,(An,K,V,X,))).
body(r("c1246-reduce",0,1,(An,K,V,X,)),violatedRulesNoSafetyMeasures(K,An)) :- inst(r("c1246-reduce",0,1,(An,K,V,X,))).
body(r("c1246-reduce",0,1,(An,K,V,X,)),victimIntent(V,X)) :- inst(r("c1246-reduce",0,1,(An,K,V,X,))).

% c1247[0.0] 禁止饲养的烈性犬等危险动物造成他人损害的，应当承担侵权责任（无免责事由）（第1247条；npc）
inst(r("c1247",0,0,(An,K,V,X,))) :- cand(animalDamage(An,V,X)), cand(keeperOrManager(K,An)), cand(bannedDangerousAnimal(An)).
constitutiveRule(r("c1247",0,0,(An,K,V,X,)),non(mayExemptOrReduce(K,X))) :- inst(r("c1247",0,0,(An,K,V,X,))).
mainHead(r("c1247",0,0,(An,K,V,X,)),constitutiveRule,non(mayExemptOrReduce(K,X))) :- inst(r("c1247",0,0,(An,K,V,X,))).
cand(mayExemptOrReduce(K,X)) :- inst(r("c1247",0,0,(An,K,V,X,))).
body(r("c1247",0,0,(An,K,V,X,)),animalDamage(An,V,X)) :- inst(r("c1247",0,0,(An,K,V,X,))).
body(r("c1247",0,0,(An,K,V,X,)),keeperOrManager(K,An)) :- inst(r("c1247",0,0,(An,K,V,X,))).
body(r("c1247",0,0,(An,K,V,X,)),bannedDangerousAnimal(An)) :- inst(r("c1247",0,0,(An,K,V,X,))).
% c1247[0.1] 禁止饲养的烈性犬等危险动物造成他人损害的，应当承担侵权责任（无免责事由）（第1247条；npc）
inst(r("c1247",0,1,(An,K,V,X,))) :- cand(animalDamage(An,V,X)), cand(keeperOrManager(K,An)), cand(bannedDangerousAnimal(An)).
constitutiveRule(r("c1247",0,1,(An,K,V,X,)),non(mayReduceOnly(K,X))) :- inst(r("c1247",0,1,(An,K,V,X,))).
mainHead(r("c1247",0,1,(An,K,V,X,)),constitutiveRule,non(mayReduceOnly(K,X))) :- inst(r("c1247",0,1,(An,K,V,X,))).
cand(mayReduceOnly(K,X)) :- inst(r("c1247",0,1,(An,K,V,X,))).
body(r("c1247",0,1,(An,K,V,X,)),animalDamage(An,V,X)) :- inst(r("c1247",0,1,(An,K,V,X,))).
body(r("c1247",0,1,(An,K,V,X,)),keeperOrManager(K,An)) :- inst(r("c1247",0,1,(An,K,V,X,))).
body(r("c1247",0,1,(An,K,V,X,)),bannedDangerousAnimal(An)) :- inst(r("c1247",0,1,(An,K,V,X,))).

% c1253[0.0] 建筑物等及其搁置物、悬挂物脱落、坠落造成损害，所有人、管理人或者使用人不能证明自己没有过错的，应当承担侵权责任（第1253条；npc）
inst(r("c1253",0,0,(Bd,O,V,X,))) :- cand(fallingObjectFrom(Bd,V,X)), cand(ownerManagerOrUser(O,Bd)).
constitutiveRule(r("c1253",0,0,(Bd,O,V,X,)),liable(O,V,X)) :- inst(r("c1253",0,0,(Bd,O,V,X,))).
mainHead(r("c1253",0,0,(Bd,O,V,X,)),constitutiveRule,liable(O,V,X)) :- inst(r("c1253",0,0,(Bd,O,V,X,))).
cand(liable(O,V,X)) :- inst(r("c1253",0,0,(Bd,O,V,X,))).
body(r("c1253",0,0,(Bd,O,V,X,)),fallingObjectFrom(Bd,V,X)) :- inst(r("c1253",0,0,(Bd,O,V,X,))).
body(r("c1253",0,0,(Bd,O,V,X,)),ownerManagerOrUser(O,Bd)) :- inst(r("c1253",0,0,(Bd,O,V,X,))).
inst(x("c1253",0,0,0,(Bd,O,V,X,))) :- inst(r("c1253",0,0,(Bd,O,V,X,))), cand(provesNoFault(O,X)).
constitutiveRule(x("c1253",0,0,0,(Bd,O,V,X,)),non(liable(O,V,X))) :- inst(x("c1253",0,0,0,(Bd,O,V,X,))).
body(x("c1253",0,0,0,(Bd,O,V,X,)),fallingObjectFrom(Bd,V,X)) :- inst(x("c1253",0,0,0,(Bd,O,V,X,))).
body(x("c1253",0,0,0,(Bd,O,V,X,)),ownerManagerOrUser(O,Bd)) :- inst(x("c1253",0,0,0,(Bd,O,V,X,))).
body(x("c1253",0,0,0,(Bd,O,V,X,)),provesNoFault(O,X)) :- inst(x("c1253",0,0,0,(Bd,O,V,X,))).
superior(x("c1253",0,0,0,(Bd,O,V,X,)),r("c1253",0,0,(Bd,O,V,X,))) :- inst(x("c1253",0,0,0,(Bd,O,V,X,))).
exc(x("c1253",0,0,0,(Bd,O,V,X,)),r("c1253",0,0,(Bd,O,V,X,)),constitutiveRule,liable(O,V,X)) :- inst(x("c1253",0,0,0,(Bd,O,V,X,))).

% c1254-known[0.0] 从建筑物中抛掷物品或坠落物品造成他人损害的，由侵权人依法承担侵权责任（第1254条第1款；npc）
inst(r("c1254-known",0,0,(A,V,X,))) :- cand(objectThrownOrFell(X,V)), cand(identifiedTortfeasor(A,X)).
constitutiveRule(r("c1254-known",0,0,(A,V,X,)),liable(A,V,X)) :- inst(r("c1254-known",0,0,(A,V,X,))).
mainHead(r("c1254-known",0,0,(A,V,X,)),constitutiveRule,liable(A,V,X)) :- inst(r("c1254-known",0,0,(A,V,X,))).
cand(liable(A,V,X)) :- inst(r("c1254-known",0,0,(A,V,X,))).
body(r("c1254-known",0,0,(A,V,X,)),objectThrownOrFell(X,V)) :- inst(r("c1254-known",0,0,(A,V,X,))).
body(r("c1254-known",0,0,(A,V,X,)),identifiedTortfeasor(A,X)) :- inst(r("c1254-known",0,0,(A,V,X,))).

% c1254-unknown[0.0] 难以确定具体侵权人的，除能够证明自己不是侵权人的外，由可能加害的建筑物使用人给予补偿（第1254条第1款；npc）
inst(r("c1254-unknown",0,0,(U,V,X,))) :- cand(objectThrownOrFell(X,V)), cand(possibleBuildingUser(U,X)).
prescriptiveRule(r("c1254-unknown",0,0,(U,V,X,)),payCompensationShare(U,V,X)) :- inst(r("c1254-unknown",0,0,(U,V,X,))).
mainHead(r("c1254-unknown",0,0,(U,V,X,)),prescriptiveRule,payCompensationShare(U,V,X)) :- inst(r("c1254-unknown",0,0,(U,V,X,))).
cand(payCompensationShare(U,V,X)) :- inst(r("c1254-unknown",0,0,(U,V,X,))).
body(r("c1254-unknown",0,0,(U,V,X,)),objectThrownOrFell(X,V)) :- inst(r("c1254-unknown",0,0,(U,V,X,))).
body(r("c1254-unknown",0,0,(U,V,X,)),possibleBuildingUser(U,X)) :- inst(r("c1254-unknown",0,0,(U,V,X,))).
inst(x("c1254-unknown",0,0,0,(U,V,X,))) :- inst(r("c1254-unknown",0,0,(U,V,X,))), cand(tortfeasorIdentified(X)).
permissiveRule(x("c1254-unknown",0,0,0,(U,V,X,)),non(payCompensationShare(U,V,X))) :- inst(x("c1254-unknown",0,0,0,(U,V,X,))).
body(x("c1254-unknown",0,0,0,(U,V,X,)),objectThrownOrFell(X,V)) :- inst(x("c1254-unknown",0,0,0,(U,V,X,))).
body(x("c1254-unknown",0,0,0,(U,V,X,)),possibleBuildingUser(U,X)) :- inst(x("c1254-unknown",0,0,0,(U,V,X,))).
body(x("c1254-unknown",0,0,0,(U,V,X,)),tortfeasorIdentified(X)) :- inst(x("c1254-unknown",0,0,0,(U,V,X,))).
superior(x("c1254-unknown",0,0,0,(U,V,X,)),r("c1254-unknown",0,0,(U,V,X,))) :- inst(x("c1254-unknown",0,0,0,(U,V,X,))).
exc(x("c1254-unknown",0,0,0,(U,V,X,)),r("c1254-unknown",0,0,(U,V,X,)),prescriptiveRule,payCompensationShare(U,V,X)) :- inst(x("c1254-unknown",0,0,0,(U,V,X,))).
inst(x("c1254-unknown",0,0,1,(U,V,X,))) :- inst(r("c1254-unknown",0,0,(U,V,X,))), cand(provesNotTortfeasor(U,X)).
permissiveRule(x("c1254-unknown",0,0,1,(U,V,X,)),non(payCompensationShare(U,V,X))) :- inst(x("c1254-unknown",0,0,1,(U,V,X,))).
body(x("c1254-unknown",0,0,1,(U,V,X,)),objectThrownOrFell(X,V)) :- inst(x("c1254-unknown",0,0,1,(U,V,X,))).
body(x("c1254-unknown",0,0,1,(U,V,X,)),possibleBuildingUser(U,X)) :- inst(x("c1254-unknown",0,0,1,(U,V,X,))).
body(x("c1254-unknown",0,0,1,(U,V,X,)),provesNotTortfeasor(U,X)) :- inst(x("c1254-unknown",0,0,1,(U,V,X,))).
superior(x("c1254-unknown",0,0,1,(U,V,X,)),r("c1254-unknown",0,0,(U,V,X,))) :- inst(x("c1254-unknown",0,0,1,(U,V,X,))).
exc(x("c1254-unknown",0,0,1,(U,V,X,)),r("c1254-unknown",0,0,(U,V,X,)),prescriptiveRule,payCompensationShare(U,V,X)) :- inst(x("c1254-unknown",0,0,1,(U,V,X,))).

% c1254-known-flag[0.0] 已查明具体侵权人（第1254条第1款；doctrine）
inst(r("c1254-known-flag",0,0,(A,X,))) :- cand(identifiedTortfeasor(A,X)).
constitutiveRule(r("c1254-known-flag",0,0,(A,X,)),tortfeasorIdentified(X)) :- inst(r("c1254-known-flag",0,0,(A,X,))).
mainHead(r("c1254-known-flag",0,0,(A,X,)),constitutiveRule,tortfeasorIdentified(X)) :- inst(r("c1254-known-flag",0,0,(A,X,))).
cand(tortfeasorIdentified(X)) :- inst(r("c1254-known-flag",0,0,(A,X,))).
body(r("c1254-known-flag",0,0,(A,X,)),identifiedTortfeasor(A,X)) :- inst(r("c1254-known-flag",0,0,(A,X,))).

% c1254-2[0.0] 物业服务企业等建筑物管理人未采取必要的安全保障措施的，承担未履行安全保障义务的侵权责任（第1254条第2款；npc）
inst(r("c1254-2",0,0,(Pm,V,X,))) :- cand(objectThrownOrFell(X,V)), cand(buildingManager(Pm,X)), cand(noNecessarySafetyMeasures(Pm,X)).
constitutiveRule(r("c1254-2",0,0,(Pm,V,X,)),liable(Pm,V,X)) :- inst(r("c1254-2",0,0,(Pm,V,X,))).
mainHead(r("c1254-2",0,0,(Pm,V,X,)),constitutiveRule,liable(Pm,V,X)) :- inst(r("c1254-2",0,0,(Pm,V,X,))).
cand(liable(Pm,V,X)) :- inst(r("c1254-2",0,0,(Pm,V,X,))).
body(r("c1254-2",0,0,(Pm,V,X,)),objectThrownOrFell(X,V)) :- inst(r("c1254-2",0,0,(Pm,V,X,))).
body(r("c1254-2",0,0,(Pm,V,X,)),buildingManager(Pm,X)) :- inst(r("c1254-2",0,0,(Pm,V,X,))).
body(r("c1254-2",0,0,(Pm,V,X,)),noNecessarySafetyMeasures(Pm,X)) :- inst(r("c1254-2",0,0,(Pm,V,X,))).

% tx-g7946[0.0] 分类（自动抽取自图的层级）：堆放物倒塌的致害责任 ⊑ 物件致人损害的责任
inst(r("tx-g7946",0,0,(X,))) :- cand(isA(X,"堆放物倒塌的致害责任")).
constitutiveRule(r("tx-g7946",0,0,(X,)),isA(X,"物件致人损害的责任")) :- inst(r("tx-g7946",0,0,(X,))).
mainHead(r("tx-g7946",0,0,(X,)),constitutiveRule,isA(X,"物件致人损害的责任")) :- inst(r("tx-g7946",0,0,(X,))).
cand(isA(X,"物件致人损害的责任")) :- inst(r("tx-g7946",0,0,(X,))).
body(r("tx-g7946",0,0,(X,)),isA(X,"堆放物倒塌的致害责任")) :- inst(r("tx-g7946",0,0,(X,))).

% tx-g7948[0.0] 分类（自动抽取自图的层级）：妨碍通行物的致害责任 ⊑ 物件致人损害的责任
inst(r("tx-g7948",0,0,(X,))) :- cand(isA(X,"妨碍通行物的致害责任")).
constitutiveRule(r("tx-g7948",0,0,(X,)),isA(X,"物件致人损害的责任")) :- inst(r("tx-g7948",0,0,(X,))).
mainHead(r("tx-g7948",0,0,(X,)),constitutiveRule,isA(X,"物件致人损害的责任")) :- inst(r("tx-g7948",0,0,(X,))).
cand(isA(X,"物件致人损害的责任")) :- inst(r("tx-g7948",0,0,(X,))).
body(r("tx-g7948",0,0,(X,)),isA(X,"妨碍通行物的致害责任")) :- inst(r("tx-g7948",0,0,(X,))).

% tx-g7953[0.0] 分类（自动抽取自图的层级）：林木的致害责任 ⊑ 物件致人损害的责任
inst(r("tx-g7953",0,0,(X,))) :- cand(isA(X,"林木的致害责任")).
constitutiveRule(r("tx-g7953",0,0,(X,)),isA(X,"物件致人损害的责任")) :- inst(r("tx-g7953",0,0,(X,))).
mainHead(r("tx-g7953",0,0,(X,)),constitutiveRule,isA(X,"物件致人损害的责任")) :- inst(r("tx-g7953",0,0,(X,))).
cand(isA(X,"物件致人损害的责任")) :- inst(r("tx-g7953",0,0,(X,))).
body(r("tx-g7953",0,0,(X,)),isA(X,"林木的致害责任")) :- inst(r("tx-g7953",0,0,(X,))).

% tx-g7955[0.0] 分类（自动抽取自图的层级）：地下设施的致害责任 ⊑ 物件致人损害的责任
inst(r("tx-g7955",0,0,(X,))) :- cand(isA(X,"地下设施的致害责任")).
constitutiveRule(r("tx-g7955",0,0,(X,)),isA(X,"物件致人损害的责任")) :- inst(r("tx-g7955",0,0,(X,))).
mainHead(r("tx-g7955",0,0,(X,)),constitutiveRule,isA(X,"物件致人损害的责任")) :- inst(r("tx-g7955",0,0,(X,))).
cand(isA(X,"物件致人损害的责任")) :- inst(r("tx-g7955",0,0,(X,))).
body(r("tx-g7955",0,0,(X,)),isA(X,"地下设施的致害责任")) :- inst(r("tx-g7955",0,0,(X,))).

% tx-g7956[0.0] 分类（自动抽取自图的层级）：地面施工致人损害责任 ⊑ 地下设施的致害责任
inst(r("tx-g7956",0,0,(X,))) :- cand(isA(X,"地面施工致人损害责任")).
constitutiveRule(r("tx-g7956",0,0,(X,)),isA(X,"地下设施的致害责任")) :- inst(r("tx-g7956",0,0,(X,))).
mainHead(r("tx-g7956",0,0,(X,)),constitutiveRule,isA(X,"地下设施的致害责任")) :- inst(r("tx-g7956",0,0,(X,))).
cand(isA(X,"地下设施的致害责任")) :- inst(r("tx-g7956",0,0,(X,))).
body(r("tx-g7956",0,0,(X,)),isA(X,"地面施工致人损害责任")) :- inst(r("tx-g7956",0,0,(X,))).

% tx-g7961[0.0] 分类（自动抽取自图的层级）：地下设施致人损害责任 ⊑ 地下设施的致害责任
inst(r("tx-g7961",0,0,(X,))) :- cand(isA(X,"地下设施致人损害责任")).
constitutiveRule(r("tx-g7961",0,0,(X,)),isA(X,"地下设施的致害责任")) :- inst(r("tx-g7961",0,0,(X,))).
mainHead(r("tx-g7961",0,0,(X,)),constitutiveRule,isA(X,"地下设施的致害责任")) :- inst(r("tx-g7961",0,0,(X,))).
cand(isA(X,"地下设施的致害责任")) :- inst(r("tx-g7961",0,0,(X,))).
body(r("tx-g7961",0,0,(X,)),isA(X,"地下设施致人损害责任")) :- inst(r("tx-g7961",0,0,(X,))).

% tx-g8072[0.0] 分类（自动抽取自图的层级）：发表权 ⊑ 著作人身权
inst(r("tx-g8072",0,0,(X,))) :- cand(isA(X,"发表权")).
constitutiveRule(r("tx-g8072",0,0,(X,)),isA(X,"著作人身权")) :- inst(r("tx-g8072",0,0,(X,))).
mainHead(r("tx-g8072",0,0,(X,)),constitutiveRule,isA(X,"著作人身权")) :- inst(r("tx-g8072",0,0,(X,))).
cand(isA(X,"著作人身权")) :- inst(r("tx-g8072",0,0,(X,))).
body(r("tx-g8072",0,0,(X,)),isA(X,"发表权")) :- inst(r("tx-g8072",0,0,(X,))).

% tx-g8090[0.0] 分类（自动抽取自图的层级）：修改权 ⊑ 著作人身权
inst(r("tx-g8090",0,0,(X,))) :- cand(isA(X,"修改权")).
constitutiveRule(r("tx-g8090",0,0,(X,)),isA(X,"著作人身权")) :- inst(r("tx-g8090",0,0,(X,))).
mainHead(r("tx-g8090",0,0,(X,)),constitutiveRule,isA(X,"著作人身权")) :- inst(r("tx-g8090",0,0,(X,))).
cand(isA(X,"著作人身权")) :- inst(r("tx-g8090",0,0,(X,))).
body(r("tx-g8090",0,0,(X,)),isA(X,"修改权")) :- inst(r("tx-g8090",0,0,(X,))).

% tx-g8103[0.0] 分类（自动抽取自图的层级）：发行权 ⊑ 著作财产权
inst(r("tx-g8103",0,0,(X,))) :- cand(isA(X,"发行权")).
constitutiveRule(r("tx-g8103",0,0,(X,)),isA(X,"著作财产权")) :- inst(r("tx-g8103",0,0,(X,))).
mainHead(r("tx-g8103",0,0,(X,)),constitutiveRule,isA(X,"著作财产权")) :- inst(r("tx-g8103",0,0,(X,))).
cand(isA(X,"著作财产权")) :- inst(r("tx-g8103",0,0,(X,))).
body(r("tx-g8103",0,0,(X,)),isA(X,"发行权")) :- inst(r("tx-g8103",0,0,(X,))).

% tx-g8109[0.0] 分类（自动抽取自图的层级）：出租权 ⊑ 著作财产权
inst(r("tx-g8109",0,0,(X,))) :- cand(isA(X,"出租权")).
constitutiveRule(r("tx-g8109",0,0,(X,)),isA(X,"著作财产权")) :- inst(r("tx-g8109",0,0,(X,))).
mainHead(r("tx-g8109",0,0,(X,)),constitutiveRule,isA(X,"著作财产权")) :- inst(r("tx-g8109",0,0,(X,))).
cand(isA(X,"著作财产权")) :- inst(r("tx-g8109",0,0,(X,))).
body(r("tx-g8109",0,0,(X,)),isA(X,"出租权")) :- inst(r("tx-g8109",0,0,(X,))).

% tx-g8127[0.0] 分类（自动抽取自图的层级）：表演权 ⊑ 著作财产权
inst(r("tx-g8127",0,0,(X,))) :- cand(isA(X,"表演权")).
constitutiveRule(r("tx-g8127",0,0,(X,)),isA(X,"著作财产权")) :- inst(r("tx-g8127",0,0,(X,))).
mainHead(r("tx-g8127",0,0,(X,)),constitutiveRule,isA(X,"著作财产权")) :- inst(r("tx-g8127",0,0,(X,))).
cand(isA(X,"著作财产权")) :- inst(r("tx-g8127",0,0,(X,))).
body(r("tx-g8127",0,0,(X,)),isA(X,"表演权")) :- inst(r("tx-g8127",0,0,(X,))).

% tx-g8142[0.0] 分类（自动抽取自图的层级）：放映权 ⊑ 著作财产权
inst(r("tx-g8142",0,0,(X,))) :- cand(isA(X,"放映权")).
constitutiveRule(r("tx-g8142",0,0,(X,)),isA(X,"著作财产权")) :- inst(r("tx-g8142",0,0,(X,))).
mainHead(r("tx-g8142",0,0,(X,)),constitutiveRule,isA(X,"著作财产权")) :- inst(r("tx-g8142",0,0,(X,))).
cand(isA(X,"著作财产权")) :- inst(r("tx-g8142",0,0,(X,))).
body(r("tx-g8142",0,0,(X,)),isA(X,"放映权")) :- inst(r("tx-g8142",0,0,(X,))).

% tx-g8146[0.0] 分类（自动抽取自图的层级）：广播权 ⊑ 著作财产权
inst(r("tx-g8146",0,0,(X,))) :- cand(isA(X,"广播权")).
constitutiveRule(r("tx-g8146",0,0,(X,)),isA(X,"著作财产权")) :- inst(r("tx-g8146",0,0,(X,))).
mainHead(r("tx-g8146",0,0,(X,)),constitutiveRule,isA(X,"著作财产权")) :- inst(r("tx-g8146",0,0,(X,))).
cand(isA(X,"著作财产权")) :- inst(r("tx-g8146",0,0,(X,))).
body(r("tx-g8146",0,0,(X,)),isA(X,"广播权")) :- inst(r("tx-g8146",0,0,(X,))).

% tx-g8148[0.0] 分类（自动抽取自图的层级）：信息网络传播权 ⊑ 著作财产权
inst(r("tx-g8148",0,0,(X,))) :- cand(isA(X,"信息网络传播权")).
constitutiveRule(r("tx-g8148",0,0,(X,)),isA(X,"著作财产权")) :- inst(r("tx-g8148",0,0,(X,))).
mainHead(r("tx-g8148",0,0,(X,)),constitutiveRule,isA(X,"著作财产权")) :- inst(r("tx-g8148",0,0,(X,))).
cand(isA(X,"著作财产权")) :- inst(r("tx-g8148",0,0,(X,))).
body(r("tx-g8148",0,0,(X,)),isA(X,"信息网络传播权")) :- inst(r("tx-g8148",0,0,(X,))).

% tx-g8157[0.0] 分类（自动抽取自图的层级）：摄制权 ⊑ 著作财产权
inst(r("tx-g8157",0,0,(X,))) :- cand(isA(X,"摄制权")).
constitutiveRule(r("tx-g8157",0,0,(X,)),isA(X,"著作财产权")) :- inst(r("tx-g8157",0,0,(X,))).
mainHead(r("tx-g8157",0,0,(X,)),constitutiveRule,isA(X,"著作财产权")) :- inst(r("tx-g8157",0,0,(X,))).
cand(isA(X,"著作财产权")) :- inst(r("tx-g8157",0,0,(X,))).
body(r("tx-g8157",0,0,(X,)),isA(X,"摄制权")) :- inst(r("tx-g8157",0,0,(X,))).

% tx-g8159[0.0] 分类（自动抽取自图的层级）：改编权 ⊑ 著作财产权
inst(r("tx-g8159",0,0,(X,))) :- cand(isA(X,"改编权")).
constitutiveRule(r("tx-g8159",0,0,(X,)),isA(X,"著作财产权")) :- inst(r("tx-g8159",0,0,(X,))).
mainHead(r("tx-g8159",0,0,(X,)),constitutiveRule,isA(X,"著作财产权")) :- inst(r("tx-g8159",0,0,(X,))).
cand(isA(X,"著作财产权")) :- inst(r("tx-g8159",0,0,(X,))).
body(r("tx-g8159",0,0,(X,)),isA(X,"改编权")) :- inst(r("tx-g8159",0,0,(X,))).

% tx-g8163[0.0] 分类（自动抽取自图的层级）：翻译权 ⊑ 著作财产权
inst(r("tx-g8163",0,0,(X,))) :- cand(isA(X,"翻译权")).
constitutiveRule(r("tx-g8163",0,0,(X,)),isA(X,"著作财产权")) :- inst(r("tx-g8163",0,0,(X,))).
mainHead(r("tx-g8163",0,0,(X,)),constitutiveRule,isA(X,"著作财产权")) :- inst(r("tx-g8163",0,0,(X,))).
cand(isA(X,"著作财产权")) :- inst(r("tx-g8163",0,0,(X,))).
body(r("tx-g8163",0,0,(X,)),isA(X,"翻译权")) :- inst(r("tx-g8163",0,0,(X,))).

% tx-g8255[0.0] 分类（自动抽取自图的层级）：自己实施专利的权利 ⊑ 专利权人的权利
inst(r("tx-g8255",0,0,(X,))) :- cand(isA(X,"自己实施专利的权利")).
constitutiveRule(r("tx-g8255",0,0,(X,)),isA(X,"专利权人的权利")) :- inst(r("tx-g8255",0,0,(X,))).
mainHead(r("tx-g8255",0,0,(X,)),constitutiveRule,isA(X,"专利权人的权利")) :- inst(r("tx-g8255",0,0,(X,))).
cand(isA(X,"专利权人的权利")) :- inst(r("tx-g8255",0,0,(X,))).
body(r("tx-g8255",0,0,(X,)),isA(X,"自己实施专利的权利")) :- inst(r("tx-g8255",0,0,(X,))).

% tx-g8256[0.0] 分类（自动抽取自图的层级）：许可他人实施专利的权利 ⊑ 专利权人的权利
inst(r("tx-g8256",0,0,(X,))) :- cand(isA(X,"许可他人实施专利的权利")).
constitutiveRule(r("tx-g8256",0,0,(X,)),isA(X,"专利权人的权利")) :- inst(r("tx-g8256",0,0,(X,))).
mainHead(r("tx-g8256",0,0,(X,)),constitutiveRule,isA(X,"专利权人的权利")) :- inst(r("tx-g8256",0,0,(X,))).
cand(isA(X,"专利权人的权利")) :- inst(r("tx-g8256",0,0,(X,))).
body(r("tx-g8256",0,0,(X,)),isA(X,"许可他人实施专利的权利")) :- inst(r("tx-g8256",0,0,(X,))).

% tx-g8269[0.0] 分类（自动抽取自图的层级）：原始主体 ⊑ 商标权的主体
inst(r("tx-g8269",0,0,(X,))) :- cand(isA(X,"原始主体")).
constitutiveRule(r("tx-g8269",0,0,(X,)),isA(X,"商标权的主体")) :- inst(r("tx-g8269",0,0,(X,))).
mainHead(r("tx-g8269",0,0,(X,)),constitutiveRule,isA(X,"商标权的主体")) :- inst(r("tx-g8269",0,0,(X,))).
cand(isA(X,"商标权的主体")) :- inst(r("tx-g8269",0,0,(X,))).
body(r("tx-g8269",0,0,(X,)),isA(X,"原始主体")) :- inst(r("tx-g8269",0,0,(X,))).

% tx-g8271[0.0] 分类（自动抽取自图的层级）：继受主体 ⊑ 商标权的主体
inst(r("tx-g8271",0,0,(X,))) :- cand(isA(X,"继受主体")).
constitutiveRule(r("tx-g8271",0,0,(X,)),isA(X,"商标权的主体")) :- inst(r("tx-g8271",0,0,(X,))).
mainHead(r("tx-g8271",0,0,(X,)),constitutiveRule,isA(X,"商标权的主体")) :- inst(r("tx-g8271",0,0,(X,))).
cand(isA(X,"商标权的主体")) :- inst(r("tx-g8271",0,0,(X,))).
body(r("tx-g8271",0,0,(X,)),isA(X,"继受主体")) :- inst(r("tx-g8271",0,0,(X,))).

% —— Naf 的语义是“仅阻断宿主规则”：其他推出同一结论的规则实例优先于该例外 ——
superior(L2,XL) :- exc(XL,L,T,H), mainHead(L2,T,H), L2 != L.
% —— Override → superior ——
superior(r("c21-2",0,0,(P,)),r("c19",0,0,(P,))) :- inst(r("c21-2",0,0,(P,))), inst(r("c19",0,0,(P,))).
superior(r("c21-2",0,1,(P,)),r("c19",0,0,(P,))) :- inst(r("c21-2",0,1,(P,))), inst(r("c19",0,0,(P,))).
superior(r("c18-emancipated",0,0,(P,)),r("c19",0,0,(P,))) :- inst(r("c18-emancipated",0,0,(P,))), inst(r("c19",0,0,(P,))).
superior(r("c18-emancipated",0,1,(P,)),r("c19",0,0,(P,))) :- inst(r("c18-emancipated",0,1,(P,))), inst(r("c19",0,0,(P,))).
superior(r("c145-refused",0,0,(P,X,)),r("c145-consent",0,0,(P,X,))) :- inst(r("c145-refused",0,0,(P,X,))), inst(r("c145-consent",0,0,(P,X,))).
superior(r("c145-refused",0,0,(P,X,)),r("c145-consent",1,0,(P,X,))) :- inst(r("c145-refused",0,0,(P,X,))), inst(r("c145-consent",1,0,(P,X,))).
superior(r("c145-refused",0,1,(P,X,)),r("c145-consent",0,0,(P,X,))) :- inst(r("c145-refused",0,1,(P,X,))), inst(r("c145-consent",0,0,(P,X,))).
superior(r("c145-refused",0,1,(P,X,)),r("c145-consent",1,0,(P,X,))) :- inst(r("c145-refused",0,1,(P,X,))), inst(r("c145-consent",1,0,(P,X,))).
superior(r("c-void-not-valid",0,0,(X,)),r("c145-pure",0,0,(P,X,))) :- inst(r("c-void-not-valid",0,0,(X,))), inst(r("c145-pure",0,0,(P,X,))).
superior(r("c-void-not-valid",0,0,(X,)),r("c145-pure",1,0,(P,X,))) :- inst(r("c-void-not-valid",0,0,(X,))), inst(r("c145-pure",1,0,(P,X,))).
superior(r("c-void-not-valid",0,0,(X,)),r("c145-consent",0,0,(P,X,))) :- inst(r("c-void-not-valid",0,0,(X,))), inst(r("c145-consent",0,0,(P,X,))).
superior(r("c-void-not-valid",0,0,(X,)),r("c145-consent",1,0,(P,X,))) :- inst(r("c-void-not-valid",0,0,(X,))), inst(r("c145-consent",1,0,(P,X,))).
superior(r("c-void-not-valid",0,0,(X,)),r("c-revocable-valid",0,0,(P,Q,X,))) :- inst(r("c-void-not-valid",0,0,(X,))), inst(r("c-revocable-valid",0,0,(P,Q,X,))).
superior(r("c152-1-1",0,0,(P,X,)),r("c-revocation-right",0,0,(P,X,))) :- inst(r("c152-1-1",0,0,(P,X,))), inst(r("c-revocation-right",0,0,(P,X,))).
superior(r("c152-1-1m",0,0,(P,X,)),r("c-revocation-right",0,0,(P,X,))) :- inst(r("c152-1-1m",0,0,(P,X,))), inst(r("c-revocation-right",0,0,(P,X,))).
superior(r("c152-1-2",0,0,(P,X,)),r("c-revocation-right",0,0,(P,X,))) :- inst(r("c152-1-2",0,0,(P,X,))), inst(r("c-revocation-right",0,0,(P,X,))).
superior(r("c152-1-3",0,0,(P,X,)),r("c-revocation-right",0,0,(P,X,))) :- inst(r("c152-1-3",0,0,(P,X,))), inst(r("c-revocation-right",0,0,(P,X,))).
superior(r("c152-2",0,0,(P,X,)),r("c-revocation-right",0,0,(P,X,))) :- inst(r("c152-2",0,0,(P,X,))), inst(r("c-revocation-right",0,0,(P,X,))).
superior(r("c192-2a",0,0,(C,D,)),r("c192-1",0,0,(C,D,))) :- inst(r("c192-2a",0,0,(C,D,))), inst(r("c192-1",0,0,(C,D,))).
superior(r("c399",0,0,(T,)),r("c395",0,0,(B,K,M,T,))) :- inst(r("c399",0,0,(T,))), inst(r("c395",0,0,(B,K,M,T,))).
superior(r("c399",1,0,(T,)),r("c395",0,0,(B,K,M,T,))) :- inst(r("c399",1,0,(T,))), inst(r("c395",0,0,(B,K,M,T,))).
superior(r("c399",2,0,(T,)),r("c395",0,0,(B,K,M,T,))) :- inst(r("c399",2,0,(T,))), inst(r("c395",0,0,(B,K,M,T,))).
superior(r("c399",3,0,(T,)),r("c395",0,0,(B,K,M,T,))) :- inst(r("c399",3,0,(T,))), inst(r("c395",0,0,(B,K,M,T,))).
superior(r("c399",4,0,(T,)),r("c395",0,0,(B,K,M,T,))) :- inst(r("c399",4,0,(T,))), inst(r("c395",0,0,(B,K,M,T,))).
superior(r("c399",5,0,(T,)),r("c395",0,0,(B,K,M,T,))) :- inst(r("c399",5,0,(T,))), inst(r("c395",0,0,(B,K,M,T,))).
superior(r("c402-noreg",0,0,(B,K,M,T,)),r("c403",0,0,(B,K,M,T,))) :- inst(r("c402-noreg",0,0,(B,K,M,T,))), inst(r("c403",0,0,(B,K,M,T,))).
superior(r("c403-oppose",0,0,(B,K,M,T,Y,)),r("c-oppose-default",0,0,(B,K,M,T,Y,))) :- inst(r("c403-oppose",0,0,(B,K,M,T,Y,))), inst(r("c-oppose-default",0,0,(B,K,M,T,Y,))).
superior(r("c404",0,0,(B,K,M,T,Y,)),r("c-oppose-default",0,0,(B,K,M,T,Y,))) :- inst(r("c404",0,0,(B,K,M,T,Y,))), inst(r("c-oppose-default",0,0,(B,K,M,T,Y,))).
superior(r("c423-after",0,0,(K,Z,)),r("c420-in",0,0,(K,Z,))) :- inst(r("c423-after",0,0,(K,Z,))), inst(r("c420-in",0,0,(K,Z,))).
superior(r("c421",0,0,(B,K,Y,Z,)),r("c407-follow",0,0,(B,K,M,T,Y,Z,))) :- inst(r("c421",0,0,(B,K,Y,Z,))), inst(r("c407-follow",0,0,(B,K,M,T,Y,Z,))).
superior(r("c449",0,0,(C,D,T,Z,)),r("c447",0,0,(C,D,T,Z,))) :- inst(r("c449",0,0,(C,D,T,Z,))), inst(r("c447",0,0,(C,D,T,Z,))).
superior(r("c449",0,0,(C,D,T,Z,)),r("c447",1,0,(C,D,T,Z,))) :- inst(r("c449",0,0,(C,D,T,Z,))), inst(r("c447",1,0,(C,D,T,Z,))).
superior(r("c449",1,0,(C,D,T,Z,)),r("c447",0,0,(C,D,T,Z,))) :- inst(r("c449",1,0,(C,D,T,Z,))), inst(r("c447",0,0,(C,D,T,Z,))).
superior(r("c449",1,0,(C,D,T,Z,)),r("c447",1,0,(C,D,T,Z,))) :- inst(r("c449",1,0,(C,D,T,Z,))), inst(r("c447",1,0,(C,D,T,Z,))).
superior(r("c374-oppose",0,0,(A,B,K,L,Y,)),r("c374-oppose-def",0,0,(A,B,K,L,Y,))) :- inst(r("c374-oppose",0,0,(A,B,K,L,Y,))), inst(r("c374-oppose-def",0,0,(A,B,K,L,Y,))).
superior(r("c528-resume",0,0,(A,B,K,)),r("c527",0,0,(A,B,K,))) :- inst(r("c528-resume",0,0,(A,B,K,))), inst(r("c527",0,0,(A,B,K,))).
superior(r("c528-resume",0,0,(A,B,K,)),r("c527",1,0,(A,B,K,))) :- inst(r("c528-resume",0,0,(A,B,K,))), inst(r("c527",1,0,(A,B,K,))).
superior(r("c528-resume",0,0,(A,B,K,)),r("c527",2,0,(A,B,K,))) :- inst(r("c528-resume",0,0,(A,B,K,))), inst(r("c527",2,0,(A,B,K,))).
superior(r("c528-resume",0,0,(A,B,K,)),r("c527",3,0,(A,B,K,))) :- inst(r("c528-resume",0,0,(A,B,K,))), inst(r("c527",3,0,(A,B,K,))).
superior(r("c551",0,0,(D,T,Z,)),r("c551-ok",0,0,(D,T,Z,))) :- inst(r("c551",0,0,(D,T,Z,))), inst(r("c551-ok",0,0,(D,T,Z,))).
superior(r("c551-2",0,0,(D,T,Z,)),r("c551-ok",0,0,(D,T,Z,))) :- inst(r("c551-2",0,0,(D,T,Z,))), inst(r("c551-ok",0,0,(D,T,Z,))).
superior(r("c546",0,0,(A,Y,Z,)),r("c546-def",0,0,(Y,Z,))) :- inst(r("c546",0,0,(A,Y,Z,))), inst(r("c546-def",0,0,(Y,Z,))).
superior(r("c605",0,0,(B,K,S,T,)),r("c604-before",0,0,(B,K,S,T,))) :- inst(r("c605",0,0,(B,K,S,T,))), inst(r("c604-before",0,0,(B,K,S,T,))).
superior(r("c607-1",0,0,(B,K,S,T,)),r("c604-before",0,0,(B,K,S,T,))) :- inst(r("c607-1",0,0,(B,K,S,T,))), inst(r("c604-before",0,0,(B,K,S,T,))).
superior(r("c607-2",0,0,(B,K,S,T,)),r("c604-before",0,0,(B,K,S,T,))) :- inst(r("c607-2",0,0,(B,K,S,T,))), inst(r("c604-before",0,0,(B,K,S,T,))).
superior(r("c608",0,0,(B,K,S,T,)),r("c604-before",0,0,(B,K,S,T,))) :- inst(r("c608",0,0,(B,K,S,T,))), inst(r("c604-before",0,0,(B,K,S,T,))).
superior(r("c610",0,0,(B,K,S,T,)),r("c604-after",0,0,(B,K,S,T,))) :- inst(r("c610",0,0,(B,K,S,T,))), inst(r("c604-after",0,0,(B,K,S,T,))).
superior(r("c610",1,0,(B,K,S,T,)),r("c604-after",0,0,(B,K,S,T,))) :- inst(r("c610",1,0,(B,K,S,T,))), inst(r("c604-after",0,0,(B,K,S,T,))).
superior(r("c610",0,0,(B,K,S,T,)),r("c605",0,0,(B,K,S,T,))) :- inst(r("c610",0,0,(B,K,S,T,))), inst(r("c605",0,0,(B,K,S,T,))).
superior(r("c610",1,0,(B,K,S,T,)),r("c605",0,0,(B,K,S,T,))) :- inst(r("c610",1,0,(B,K,S,T,))), inst(r("c605",0,0,(B,K,S,T,))).
superior(r("c610",0,0,(B,K,S,T,)),r("c607-1",0,0,(B,K,S,T,))) :- inst(r("c610",0,0,(B,K,S,T,))), inst(r("c607-1",0,0,(B,K,S,T,))).
superior(r("c610",1,0,(B,K,S,T,)),r("c607-1",0,0,(B,K,S,T,))) :- inst(r("c610",1,0,(B,K,S,T,))), inst(r("c607-1",0,0,(B,K,S,T,))).
superior(r("c610",0,0,(B,K,S,T,)),r("c607-2",0,0,(B,K,S,T,))) :- inst(r("c610",0,0,(B,K,S,T,))), inst(r("c607-2",0,0,(B,K,S,T,))).
superior(r("c610",1,0,(B,K,S,T,)),r("c607-2",0,0,(B,K,S,T,))) :- inst(r("c610",1,0,(B,K,S,T,))), inst(r("c607-2",0,0,(B,K,S,T,))).
superior(r("c610",0,0,(B,K,S,T,)),r("c608",0,0,(B,K,S,T,))) :- inst(r("c610",0,0,(B,K,S,T,))), inst(r("c608",0,0,(B,K,S,T,))).
superior(r("c610",1,0,(B,K,S,T,)),r("c608",0,0,(B,K,S,T,))) :- inst(r("c610",1,0,(B,K,S,T,))), inst(r("c608",0,0,(B,K,S,T,))).
superior(r("c604-agreed",0,0,(B,K,S,T,)),r("c604-after",0,0,(B,K,S,T,))) :- inst(r("c604-agreed",0,0,(B,K,S,T,))), inst(r("c604-after",0,0,(B,K,S,T,))).
superior(r("c726-2",0,0,(L,T,Te,)),r("c726",0,0,(L,T,Te,Y,))) :- inst(r("c726-2",0,0,(L,T,Te,))), inst(r("c726",0,0,(L,T,Te,Y,))).
superior(r("c1063",0,0,(T,)),r("c1062",0,0,(T,))) :- inst(r("c1063",0,0,(T,))), inst(r("c1062",0,0,(T,))).
superior(r("c1063",0,0,(T,)),r("c1062",1,0,(T,))) :- inst(r("c1063",0,0,(T,))), inst(r("c1062",1,0,(T,))).
superior(r("c1063",0,0,(T,)),r("c1062",2,0,(T,))) :- inst(r("c1063",0,0,(T,))), inst(r("c1062",2,0,(T,))).
superior(r("c1063",0,0,(T,)),r("c1062",3,0,(T,))) :- inst(r("c1063",0,0,(T,))), inst(r("c1062",3,0,(T,))).
superior(r("c1063",0,0,(T,)),r("c1062",4,0,(T,))) :- inst(r("c1063",0,0,(T,))), inst(r("c1062",4,0,(T,))).
superior(r("c1063",0,1,(T,)),r("c1062",0,0,(T,))) :- inst(r("c1063",0,1,(T,))), inst(r("c1062",0,0,(T,))).
superior(r("c1063",0,1,(T,)),r("c1062",1,0,(T,))) :- inst(r("c1063",0,1,(T,))), inst(r("c1062",1,0,(T,))).
superior(r("c1063",0,1,(T,)),r("c1062",2,0,(T,))) :- inst(r("c1063",0,1,(T,))), inst(r("c1062",2,0,(T,))).
superior(r("c1063",0,1,(T,)),r("c1062",3,0,(T,))) :- inst(r("c1063",0,1,(T,))), inst(r("c1062",3,0,(T,))).
superior(r("c1063",0,1,(T,)),r("c1062",4,0,(T,))) :- inst(r("c1063",0,1,(T,))), inst(r("c1062",4,0,(T,))).
superior(r("c1063",1,0,(T,)),r("c1062",0,0,(T,))) :- inst(r("c1063",1,0,(T,))), inst(r("c1062",0,0,(T,))).
superior(r("c1063",1,0,(T,)),r("c1062",1,0,(T,))) :- inst(r("c1063",1,0,(T,))), inst(r("c1062",1,0,(T,))).
superior(r("c1063",1,0,(T,)),r("c1062",2,0,(T,))) :- inst(r("c1063",1,0,(T,))), inst(r("c1062",2,0,(T,))).
superior(r("c1063",1,0,(T,)),r("c1062",3,0,(T,))) :- inst(r("c1063",1,0,(T,))), inst(r("c1062",3,0,(T,))).
superior(r("c1063",1,0,(T,)),r("c1062",4,0,(T,))) :- inst(r("c1063",1,0,(T,))), inst(r("c1062",4,0,(T,))).
superior(r("c1063",1,1,(T,)),r("c1062",0,0,(T,))) :- inst(r("c1063",1,1,(T,))), inst(r("c1062",0,0,(T,))).
superior(r("c1063",1,1,(T,)),r("c1062",1,0,(T,))) :- inst(r("c1063",1,1,(T,))), inst(r("c1062",1,0,(T,))).
superior(r("c1063",1,1,(T,)),r("c1062",2,0,(T,))) :- inst(r("c1063",1,1,(T,))), inst(r("c1062",2,0,(T,))).
superior(r("c1063",1,1,(T,)),r("c1062",3,0,(T,))) :- inst(r("c1063",1,1,(T,))), inst(r("c1062",3,0,(T,))).
superior(r("c1063",1,1,(T,)),r("c1062",4,0,(T,))) :- inst(r("c1063",1,1,(T,))), inst(r("c1062",4,0,(T,))).
superior(r("c1063",2,0,(T,)),r("c1062",0,0,(T,))) :- inst(r("c1063",2,0,(T,))), inst(r("c1062",0,0,(T,))).
superior(r("c1063",2,0,(T,)),r("c1062",1,0,(T,))) :- inst(r("c1063",2,0,(T,))), inst(r("c1062",1,0,(T,))).
superior(r("c1063",2,0,(T,)),r("c1062",2,0,(T,))) :- inst(r("c1063",2,0,(T,))), inst(r("c1062",2,0,(T,))).
superior(r("c1063",2,0,(T,)),r("c1062",3,0,(T,))) :- inst(r("c1063",2,0,(T,))), inst(r("c1062",3,0,(T,))).
superior(r("c1063",2,0,(T,)),r("c1062",4,0,(T,))) :- inst(r("c1063",2,0,(T,))), inst(r("c1062",4,0,(T,))).
superior(r("c1063",2,1,(T,)),r("c1062",0,0,(T,))) :- inst(r("c1063",2,1,(T,))), inst(r("c1062",0,0,(T,))).
superior(r("c1063",2,1,(T,)),r("c1062",1,0,(T,))) :- inst(r("c1063",2,1,(T,))), inst(r("c1062",1,0,(T,))).
superior(r("c1063",2,1,(T,)),r("c1062",2,0,(T,))) :- inst(r("c1063",2,1,(T,))), inst(r("c1062",2,0,(T,))).
superior(r("c1063",2,1,(T,)),r("c1062",3,0,(T,))) :- inst(r("c1063",2,1,(T,))), inst(r("c1062",3,0,(T,))).
superior(r("c1063",2,1,(T,)),r("c1062",4,0,(T,))) :- inst(r("c1063",2,1,(T,))), inst(r("c1062",4,0,(T,))).
superior(r("c1063",3,0,(T,)),r("c1062",0,0,(T,))) :- inst(r("c1063",3,0,(T,))), inst(r("c1062",0,0,(T,))).
superior(r("c1063",3,0,(T,)),r("c1062",1,0,(T,))) :- inst(r("c1063",3,0,(T,))), inst(r("c1062",1,0,(T,))).
superior(r("c1063",3,0,(T,)),r("c1062",2,0,(T,))) :- inst(r("c1063",3,0,(T,))), inst(r("c1062",2,0,(T,))).
superior(r("c1063",3,0,(T,)),r("c1062",3,0,(T,))) :- inst(r("c1063",3,0,(T,))), inst(r("c1062",3,0,(T,))).
superior(r("c1063",3,0,(T,)),r("c1062",4,0,(T,))) :- inst(r("c1063",3,0,(T,))), inst(r("c1062",4,0,(T,))).
superior(r("c1063",3,1,(T,)),r("c1062",0,0,(T,))) :- inst(r("c1063",3,1,(T,))), inst(r("c1062",0,0,(T,))).
superior(r("c1063",3,1,(T,)),r("c1062",1,0,(T,))) :- inst(r("c1063",3,1,(T,))), inst(r("c1062",1,0,(T,))).
superior(r("c1063",3,1,(T,)),r("c1062",2,0,(T,))) :- inst(r("c1063",3,1,(T,))), inst(r("c1062",2,0,(T,))).
superior(r("c1063",3,1,(T,)),r("c1062",3,0,(T,))) :- inst(r("c1063",3,1,(T,))), inst(r("c1062",3,0,(T,))).
superior(r("c1063",3,1,(T,)),r("c1062",4,0,(T,))) :- inst(r("c1063",3,1,(T,))), inst(r("c1062",4,0,(T,))).
superior(r("c1063",4,0,(T,)),r("c1062",0,0,(T,))) :- inst(r("c1063",4,0,(T,))), inst(r("c1062",0,0,(T,))).
superior(r("c1063",4,0,(T,)),r("c1062",1,0,(T,))) :- inst(r("c1063",4,0,(T,))), inst(r("c1062",1,0,(T,))).
superior(r("c1063",4,0,(T,)),r("c1062",2,0,(T,))) :- inst(r("c1063",4,0,(T,))), inst(r("c1062",2,0,(T,))).
superior(r("c1063",4,0,(T,)),r("c1062",3,0,(T,))) :- inst(r("c1063",4,0,(T,))), inst(r("c1062",3,0,(T,))).
superior(r("c1063",4,0,(T,)),r("c1062",4,0,(T,))) :- inst(r("c1063",4,0,(T,))), inst(r("c1062",4,0,(T,))).
superior(r("c1063",4,1,(T,)),r("c1062",0,0,(T,))) :- inst(r("c1063",4,1,(T,))), inst(r("c1062",0,0,(T,))).
superior(r("c1063",4,1,(T,)),r("c1062",1,0,(T,))) :- inst(r("c1063",4,1,(T,))), inst(r("c1062",1,0,(T,))).
superior(r("c1063",4,1,(T,)),r("c1062",2,0,(T,))) :- inst(r("c1063",4,1,(T,))), inst(r("c1062",2,0,(T,))).
superior(r("c1063",4,1,(T,)),r("c1062",3,0,(T,))) :- inst(r("c1063",4,1,(T,))), inst(r("c1062",3,0,(T,))).
superior(r("c1063",4,1,(T,)),r("c1062",4,0,(T,))) :- inst(r("c1063",4,1,(T,))), inst(r("c1062",4,0,(T,))).
superior(r("c1064-2-proof",0,0,(Z,)),r("c1064-2",0,0,(Z,))) :- inst(r("c1064-2-proof",0,0,(Z,))), inst(r("c1064-2",0,0,(Z,))).
superior(r("c1125-2",0,0,(D,H,)),r("c1125",0,0,(D,H,))) :- inst(r("c1125-2",0,0,(D,H,))), inst(r("c1125",0,0,(D,H,))).
superior(r("c1125-2",0,0,(D,H,)),r("c1125",1,0,(D,H,))) :- inst(r("c1125-2",0,0,(D,H,))), inst(r("c1125",1,0,(D,H,))).
superior(r("c1125-2",0,0,(D,H,)),r("c1125",2,0,(D,H,))) :- inst(r("c1125-2",0,0,(D,H,))), inst(r("c1125",2,0,(D,H,))).
superior(r("c1125-2",0,0,(D,H,)),r("c1125",3,0,(D,H,))) :- inst(r("c1125-2",0,0,(D,H,))), inst(r("c1125",3,0,(D,H,))).
superior(r("c1125-2",0,0,(D,H,)),r("c1125",4,0,(D,H,))) :- inst(r("c1125-2",0,0,(D,H,))), inst(r("c1125",4,0,(D,H,))).
superior(r("c1125-2",1,0,(D,H,)),r("c1125",0,0,(D,H,))) :- inst(r("c1125-2",1,0,(D,H,))), inst(r("c1125",0,0,(D,H,))).
superior(r("c1125-2",1,0,(D,H,)),r("c1125",1,0,(D,H,))) :- inst(r("c1125-2",1,0,(D,H,))), inst(r("c1125",1,0,(D,H,))).
superior(r("c1125-2",1,0,(D,H,)),r("c1125",2,0,(D,H,))) :- inst(r("c1125-2",1,0,(D,H,))), inst(r("c1125",2,0,(D,H,))).
superior(r("c1125-2",1,0,(D,H,)),r("c1125",3,0,(D,H,))) :- inst(r("c1125-2",1,0,(D,H,))), inst(r("c1125",3,0,(D,H,))).
superior(r("c1125-2",1,0,(D,H,)),r("c1125",4,0,(D,H,))) :- inst(r("c1125-2",1,0,(D,H,))), inst(r("c1125",4,0,(D,H,))).
superior(r("c1125-2",2,0,(D,H,)),r("c1125",0,0,(D,H,))) :- inst(r("c1125-2",2,0,(D,H,))), inst(r("c1125",0,0,(D,H,))).
superior(r("c1125-2",2,0,(D,H,)),r("c1125",1,0,(D,H,))) :- inst(r("c1125-2",2,0,(D,H,))), inst(r("c1125",1,0,(D,H,))).
superior(r("c1125-2",2,0,(D,H,)),r("c1125",2,0,(D,H,))) :- inst(r("c1125-2",2,0,(D,H,))), inst(r("c1125",2,0,(D,H,))).
superior(r("c1125-2",2,0,(D,H,)),r("c1125",3,0,(D,H,))) :- inst(r("c1125-2",2,0,(D,H,))), inst(r("c1125",3,0,(D,H,))).
superior(r("c1125-2",2,0,(D,H,)),r("c1125",4,0,(D,H,))) :- inst(r("c1125-2",2,0,(D,H,))), inst(r("c1125",4,0,(D,H,))).
superior(r("c1125-2",3,0,(D,H,)),r("c1125",0,0,(D,H,))) :- inst(r("c1125-2",3,0,(D,H,))), inst(r("c1125",0,0,(D,H,))).
superior(r("c1125-2",3,0,(D,H,)),r("c1125",1,0,(D,H,))) :- inst(r("c1125-2",3,0,(D,H,))), inst(r("c1125",1,0,(D,H,))).
superior(r("c1125-2",3,0,(D,H,)),r("c1125",2,0,(D,H,))) :- inst(r("c1125-2",3,0,(D,H,))), inst(r("c1125",2,0,(D,H,))).
superior(r("c1125-2",3,0,(D,H,)),r("c1125",3,0,(D,H,))) :- inst(r("c1125-2",3,0,(D,H,))), inst(r("c1125",3,0,(D,H,))).
superior(r("c1125-2",3,0,(D,H,)),r("c1125",4,0,(D,H,))) :- inst(r("c1125-2",3,0,(D,H,))), inst(r("c1125",4,0,(D,H,))).
superior(r("c1125-2",4,0,(D,H,)),r("c1125",0,0,(D,H,))) :- inst(r("c1125-2",4,0,(D,H,))), inst(r("c1125",0,0,(D,H,))).
superior(r("c1125-2",4,0,(D,H,)),r("c1125",1,0,(D,H,))) :- inst(r("c1125-2",4,0,(D,H,))), inst(r("c1125",1,0,(D,H,))).
superior(r("c1125-2",4,0,(D,H,)),r("c1125",2,0,(D,H,))) :- inst(r("c1125-2",4,0,(D,H,))), inst(r("c1125",2,0,(D,H,))).
superior(r("c1125-2",4,0,(D,H,)),r("c1125",3,0,(D,H,))) :- inst(r("c1125-2",4,0,(D,H,))), inst(r("c1125",3,0,(D,H,))).
superior(r("c1125-2",4,0,(D,H,)),r("c1125",4,0,(D,H,))) :- inst(r("c1125-2",4,0,(D,H,))), inst(r("c1125",4,0,(D,H,))).
superior(r("c1125-2",5,0,(D,H,)),r("c1125",0,0,(D,H,))) :- inst(r("c1125-2",5,0,(D,H,))), inst(r("c1125",0,0,(D,H,))).
superior(r("c1125-2",5,0,(D,H,)),r("c1125",1,0,(D,H,))) :- inst(r("c1125-2",5,0,(D,H,))), inst(r("c1125",1,0,(D,H,))).
superior(r("c1125-2",5,0,(D,H,)),r("c1125",2,0,(D,H,))) :- inst(r("c1125-2",5,0,(D,H,))), inst(r("c1125",2,0,(D,H,))).
superior(r("c1125-2",5,0,(D,H,)),r("c1125",3,0,(D,H,))) :- inst(r("c1125-2",5,0,(D,H,))), inst(r("c1125",3,0,(D,H,))).
superior(r("c1125-2",5,0,(D,H,)),r("c1125",4,0,(D,H,))) :- inst(r("c1125-2",5,0,(D,H,))), inst(r("c1125",4,0,(D,H,))).
superior(r("c1201-supp",0,0,(S,V,X,)),r("c1199",0,0,(S,V,X,))) :- inst(r("c1201-supp",0,0,(S,V,X,))), inst(r("c1199",0,0,(S,V,X,))).
superior(r("c1201-supp",0,1,(S,V,X,)),r("c1199",0,0,(S,V,X,))) :- inst(r("c1201-supp",0,1,(S,V,X,))), inst(r("c1199",0,0,(S,V,X,))).
superior(r("c1201-supp",1,0,(S,V,X,)),r("c1199",0,0,(S,V,X,))) :- inst(r("c1201-supp",1,0,(S,V,X,))), inst(r("c1199",0,0,(S,V,X,))).
superior(r("c1201-supp",1,1,(S,V,X,)),r("c1199",0,0,(S,V,X,))) :- inst(r("c1201-supp",1,1,(S,V,X,))), inst(r("c1199",0,0,(S,V,X,))).
superior(r("c1201-supp",0,0,(S,V,X,)),r("c1200",0,0,(S,V,X,))) :- inst(r("c1201-supp",0,0,(S,V,X,))), inst(r("c1200",0,0,(S,V,X,))).
superior(r("c1201-supp",0,1,(S,V,X,)),r("c1200",0,0,(S,V,X,))) :- inst(r("c1201-supp",0,1,(S,V,X,))), inst(r("c1200",0,0,(S,V,X,))).
superior(r("c1201-supp",1,0,(S,V,X,)),r("c1200",0,0,(S,V,X,))) :- inst(r("c1201-supp",1,0,(S,V,X,))), inst(r("c1200",0,0,(S,V,X,))).
superior(r("c1201-supp",1,1,(S,V,X,)),r("c1200",0,0,(S,V,X,))) :- inst(r("c1201-supp",1,1,(S,V,X,))), inst(r("c1200",0,0,(S,V,X,))).
superior(r("c1191-1",0,0,(E,U,V,X,)),r("c1165-1",0,0,(A,V,X,))) :- inst(r("c1191-1",0,0,(E,U,V,X,))), inst(r("c1165-1",0,0,(A,V,X,))).
superior(r("c1191-1",0,1,(E,U,V,X,)),r("c1165-1",0,0,(A,V,X,))) :- inst(r("c1191-1",0,1,(E,U,V,X,))), inst(r("c1165-1",0,0,(A,V,X,))).
superior(r("c1191-2",0,0,(E,H,V,X,)),r("c1165-1",0,0,(A,V,X,))) :- inst(r("c1191-2",0,0,(E,H,V,X,))), inst(r("c1165-1",0,0,(A,V,X,))).
superior(r("c1191-2",0,1,(E,H,V,X,)),r("c1165-1",0,0,(A,V,X,))) :- inst(r("c1191-2",0,1,(E,H,V,X,))), inst(r("c1165-1",0,0,(A,V,X,))).
superior(r("c1246",0,0,(An,K,V,X,)),r("c1245-def",0,0,(An,K,V,X,))) :- inst(r("c1246",0,0,(An,K,V,X,))), inst(r("c1245-def",0,0,(An,K,V,X,))).
superior(r("c1246",0,0,(An,K,V,X,)),r("c1245-def",1,0,(An,K,V,X,))) :- inst(r("c1246",0,0,(An,K,V,X,))), inst(r("c1245-def",1,0,(An,K,V,X,))).
superior(r("c1246-reduce",0,0,(An,K,V,X,)),r("c1245-def",0,0,(An,K,V,X,))) :- inst(r("c1246-reduce",0,0,(An,K,V,X,))), inst(r("c1245-def",0,0,(An,K,V,X,))).
superior(r("c1246-reduce",0,0,(An,K,V,X,)),r("c1245-def",1,0,(An,K,V,X,))) :- inst(r("c1246-reduce",0,0,(An,K,V,X,))), inst(r("c1245-def",1,0,(An,K,V,X,))).
superior(r("c1246-reduce",0,1,(An,K,V,X,)),r("c1245-def",0,0,(An,K,V,X,))) :- inst(r("c1246-reduce",0,1,(An,K,V,X,))), inst(r("c1245-def",0,0,(An,K,V,X,))).
superior(r("c1246-reduce",0,1,(An,K,V,X,)),r("c1245-def",1,0,(An,K,V,X,))) :- inst(r("c1246-reduce",0,1,(An,K,V,X,))), inst(r("c1245-def",1,0,(An,K,V,X,))).
superior(r("c1247",0,0,(An,K,V,X,)),r("c1245-def",0,0,(An,K,V,X,))) :- inst(r("c1247",0,0,(An,K,V,X,))), inst(r("c1245-def",0,0,(An,K,V,X,))).
superior(r("c1247",0,0,(An,K,V,X,)),r("c1245-def",1,0,(An,K,V,X,))) :- inst(r("c1247",0,0,(An,K,V,X,))), inst(r("c1245-def",1,0,(An,K,V,X,))).
superior(r("c1247",0,1,(An,K,V,X,)),r("c1245-def",0,0,(An,K,V,X,))) :- inst(r("c1247",0,1,(An,K,V,X,))), inst(r("c1245-def",0,0,(An,K,V,X,))).
superior(r("c1247",0,1,(An,K,V,X,)),r("c1245-def",1,0,(An,K,V,X,))) :- inst(r("c1247",0,1,(An,K,V,X,))), inst(r("c1245-def",1,0,(An,K,V,X,))).
superior(r("c1247",0,0,(An,K,V,X,)),r("c1246-reduce",0,0,(An,K,V,X,))) :- inst(r("c1247",0,0,(An,K,V,X,))), inst(r("c1246-reduce",0,0,(An,K,V,X,))).
superior(r("c1247",0,0,(An,K,V,X,)),r("c1246-reduce",0,1,(An,K,V,X,))) :- inst(r("c1247",0,0,(An,K,V,X,))), inst(r("c1246-reduce",0,1,(An,K,V,X,))).
superior(r("c1247",0,1,(An,K,V,X,)),r("c1246-reduce",0,0,(An,K,V,X,))) :- inst(r("c1247",0,1,(An,K,V,X,))), inst(r("c1246-reduce",0,0,(An,K,V,X,))).
superior(r("c1247",0,1,(An,K,V,X,)),r("c1246-reduce",0,1,(An,K,V,X,))) :- inst(r("c1247",0,1,(An,K,V,X,))), inst(r("c1246-reduce",0,1,(An,K,V,X,))).
superior(r("c1123-agreement",0,0,(D,E,)),r("c1123-will",0,0,(D,E,))) :- inst(r("c1123-agreement",0,0,(D,E,))), inst(r("c1123-will",0,0,(D,E,))).
