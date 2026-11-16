#!/bin/sh
# 获取 Governatori 的 Defeasible Deontic Logic（ASP/clingo 实现），固定到验证过的版本，并修补上游的 unsafe 变量错误。
# 上游仓库未声明许可证，故不随项目分发，只在本地拉取。
set -e
cd "$(dirname "$0")"
REV=679c638c2fddf97e1ee624cc528e84be6fd02d95
if [ ! -d ddl_engine ]; then
  git clone -q https://github.com/gvdgdo/Defeasible-Deontic-Logic.git ddl_engine
fi
cd ddl_engine
git checkout -q "$REV"
git checkout -q -- Deontic/deontic.asp
# clingo 5.8 拒绝 deontic.asp 第33–36行（obligationRebutted 的头部变量只出现在条件文字里）。
# 按该处注释的本意（被攻击规则 discarded 或 defeated 即被反驳）改成普通体文字。
patch -s -p1 < ../ddl_deontic_unsafe_fix.patch
echo "DDL engine ready at $(pwd) (rev ${REV%${REV#???????}}, patched)"
