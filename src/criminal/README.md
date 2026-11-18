# 刑法导图 → LegalRuleML → Defeasible Deontic Logic

把 `data/criminal/criminal_graph.itmz`（原名 刑法v2.1.itmz，iThoughts 思维导图，9828 个节点，约 31 万字）转成 **OASIS LegalRuleML 1.0**，输出在 `graph/criminal/`，用法与民法部分（`src/`、`graph/civil/`）相同：两层结构，可以用 clingo 执行，并给出推理链。

```sh
python3 src/criminal/pdf2txt.py path/to/xingfa.pdf      # 刑法 PDF → data/criminal/criminal_law_pdf.txt（民法典同款格式）
python3 src/criminal/criminal_code.py --build --fetch   # PDF + 维基文库 + 6laws 三方逐条比对 → data/criminal/criminal_law_2023.txt
python3 src/criminal/itmz_parse.py          # 导图 → graph/criminal/graph_nodes.json
python3 src/criminal/itmz2markdown.py       # 导图 → data/criminal/criminal_graph.markdown（格式同民法图谱）
python3 src/criminal/crim2lrml.py           # → graph/criminal/criminal_graph.lrml + criminal_graph_index.json；锚点校验、引文核对、XSD 校验
python3 src/extract_rule_layer.py --src graph/criminal/criminal_graph.lrml --out graph/criminal/criminal_rules.lrml
python3 src/lrml2ddl.py --lrml graph/criminal/criminal_graph.lrml -o graph/criminal/criminal_rules.lp
python3 src/criminal/run_cases.py [age-3 -v]   # 30 个案例 / 69 条预期结论；-v 打印推理链（需 clingo 和 engine/ddl_engine）
```

## 结果

| 项目 | 数量 |
|---|---|
| 结构层 | 9828 个节点（总则：罪/责/刑 12 章；分则：10 类罪）；251 个法源（《刑法》条/款 246、司法解释 1、其他 4）；170 条 isA 分类规则 |
| 规则层 | 93 条规则、6 个模块，52 条显式优先关系 |
| 校验 | XSD 通过；锚点全部通过；规则引用的条文由程序从《刑法》文本截取 |
| 案例 | 30 个案例、69 条预期结论全部通过 |

规则层的 6 个模块：

1. 刑事责任年龄与能力（第17、17条之一、18、19条）
2. 正当防卫、特别防卫与防卫过当、紧急避险（第20、21条）
3. 预备、未遂、中止，从犯、胁从犯、教唆犯（第22–29条）
4. 累犯、自首与坦白、立功、缓刑、假释（第65–81条）
5. 追诉时效及其延长（第87–89条）
6. 分则常见罪名：盗窃、诈骗、抢夺、抢劫（含转化型抢劫、携带凶器抢夺）、侵占、敲诈勒索、职务侵占与贪污的区分、受贿、行贿（被勒索的例外）、故意杀人、故意伤害、交通肇事（逃逸致死）、危险驾驶

多跳示例 `age-3`：15 岁盗窃后为抗拒抓捕当场打人致重伤 → 先构成盗窃罪 → 依第269条转化为抢劫 → 依司法解释（法释〔2006〕1号第10条），已满十四不满十六周岁的人不按转化型抢劫处理 → 以故意伤害罪定罪（第17条第2款）。抢劫罪、盗窃罪都不再定。

## 建模约定

- 用 `constitutes(P,X,C)`（符合构成要件）、`responsible(P,X,C)`（负刑事责任）、`convicted(P,X,C)`（定罪）把“构成”和“责任”分开表示。这样年龄、精神状态、正当防卫等阻却事由可以作为可废止规则的例外，统一处理。
- 量刑用 LegalRuleML 的道义算子，承担者是人民法院（`court`）：
  - 应当 → `Obligation`
  - 可以 → `Permission`
  - 不得（例如累犯不适用缓刑）→ `Prohibition`
- 锚点采用“节点编号 + 关键词”。导图改动导致编号错位时，生成程序会报错。

## 《刑法》文本来源

原文文件是 `data/criminal/criminal_law_2023.txt`，格式与民法的 `data/civil/civil_code_20200528.txt` 相同：编/章/节标题，每条以“第X条　”（或“第X条之一　”）开头，一款一行，项单独成行。`criminal_code.py` 按条/款读取它，`crim2lrml.py` 从这里逐字截取 `lrml:LegalSource` 的原文，就像民法从民法典文本截取一样。

这个文件由三个独立文本逐条比对生成：

| 来源 | 说明 |
|---|---|
| PDF | 《中华人民共和国刑法（2024 版）》，北京市京师律师事务所整理，含修正案（十二）。`pdf2txt.py` 去掉页眉页脚、水印、编者加的【罪名】标题和抽取造成的空格/断行，PDF 自身的文字不改 |
| 维基文库 | 「中华人民共和国刑法 (2023年)」，自标校对度 50% |
| 6laws.net | 「中华人民共和国刑法」，含修正案（十二） |

- 正文与分款分别按三方多数决定：三方一致 470 条；按多数采用 32 条；三方互不相同的 3 条（第199、308条之一、452条）人工裁决。逐条差异见 `data/criminal/reconcile_report.md`。
- 三个来源各有错误，单独用哪一个都不可靠：PDF 第190条是 1998 年修改前的旧文本、第389条漏“济”、第334条之一漏“违”；维基文库第397条重复了一段、第263条漏“公私”；6laws 第308条之一把“报道”写成“道报”。
- 编章节结构、修正说明和附件取自 PDF；已删去的第199条按维基文库保留“（删去）”占位。
- 第三方网页的原始缓存（`data/criminal/raw/`）不放进仓库，`--fetch` 会重新下载。重新下载后如果出现表外的三方互不相同，程序会停下来要求人工裁决。

正式发表前，建议再与官方印本或 flk.npc.gov.cn 核对一遍。

## 用 JEC-QA 测试之前

- **数据**：JEC-QA（CAIL2020 司法考试赛道）需要在 jecqa.thunlp.org 填写申请（姓名、学校邮箱、用途）。许可为 CC BY-NC-ND 4.0，不得再分发数据本身。拿到数据后，把路径交给评测脚本即可。
- **法律版本**：JEC-QA 的题目来自 2009 年前后至 2017 年的司法考试，适用当时的法律。对于第17条第3款（2021 年新增，12–14 周岁）、第17条之一（2011 年新增）、贪污受贿数额标准（2016 年调整）等，答案会随法律版本变化。评测时应按题目年份选择 LegalRuleML 的时间语境（`TemporalCharacteristics`），或者先剔除受修法影响的题。
- **事实抽取**：民法 Q214 的实验表明，瓶颈在于把题干翻译成事实谓词。评测时应该把事实抽取单独评估。
