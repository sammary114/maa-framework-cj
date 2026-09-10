#!/usr/bin/env bash
set -euo pipefail

echo ""
echo "============================================================"
echo "   MaaFramework Cangjie (maa-framework-cj) 环境自检工具   "
echo "============================================================"
echo ""

ALL_PASS=true
WARNINGS=false

# 1. 检查 cjc / cjpm
echo "[1/5] 检查仓颉编译器与包管理器 (cjc / cjpm)..."
if command -v cjc >/dev/null 2>&1; then
    echo "  [PASS] cjc 已就绪 (PATH): $(cjc --version | head -n 1)"
elif [ -f "${HOME}/.cjv/bin/cjc" ]; then
    echo "  [PASS] cjc 已就绪 (cjv): $(${HOME}/.cjv/bin/cjc --version | head -n 1)"
else
    echo "  [FAIL] 未检测到 cjc 编译器！"
    echo "         解决办法: 请安装仓颉 SDK 1.0.5+ 或使用 cjv 安装 (https://cangjie-lang.cn/)"
    ALL_PASS=false
fi

if command -v cjpm >/dev/null 2>&1; then
    echo "  [PASS] cjpm 已就绪 (PATH): $(cjpm --version | head -n 1)"
elif [ -f "${HOME}/.cjv/bin/cjpm" ]; then
    echo "  [PASS] cjpm 已就绪 (cjv): $(${HOME}/.cjv/bin/cjpm --version | head -n 1)"
else
    echo "  [FAIL] 未检测到 cjpm 包管理器！"
    ALL_PASS=false
fi

# 2. 检查 cjbind
echo ""
echo "[2/5] 检查 cjbind 代码生成工具..."
if command -v cjbind >/dev/null 2>&1; then
    echo "  [PASS] cjbind 已安装 (PATH): $(cjbind --version | head -n 1)"
elif [ -f "${HOME}/.cjpm/bin/cjbind" ]; then
    echo "  [PASS] cjbind 已安装 (~/.cjpm/bin): $(${HOME}/.cjpm/bin/cjbind --version | head -n 1)"
else
    echo "  [WARN] 未检测到 cjbind 工具 (日常作为库调用不受影响，若需重新生成 FFI 绑定则必需)"
    echo "         安装命令: curl -fsSL https://cjbind.zxilly.dev/install.sh | bash"
    WARNINGS=true
fi

# 3. 检查 MaaFramework 头文件
echo ""
echo "[3/5] 检查 MaaFramework C 头文件依赖..."
CORE_HEADER="./deps/include/MaaFramework/MaaAPI.h"
TK_HEADER="./deps/include/MaaToolkit/MaaToolkitAPI.h"

if [ -f "${CORE_HEADER}" ] && [ -f "${TK_HEADER}" ]; then
    echo "  [PASS] C 头文件就绪 (${CORE_HEADER})"
else
    echo "  [WARN] 未找到 MaaFramework C 头文件！"
    echo "         解决办法: 运行 ./tools/fetch_maafw.sh 一键拉取依赖"
    WARNINGS=true
fi

# 4. 检查 MaaFramework 动态库
echo ""
echo "[4/5] 检查 MaaFramework 运行时动态库..."
if [ -d "./deps/bin" ] || [ -d "./deps/lib" ]; then
    echo "  [PASS] 运行时动态库目录就绪 (./deps/bin 或 ./deps/lib)"
else
    echo "  [WARN] 未找到运行时动态库 (运行测试或应用程序需要)"
    echo "         解决办法: 运行 ./tools/fetch_maafw.sh 一键拉取依赖"
    WARNINGS=true
fi

# 5. 检查 LD_LIBRARY_PATH
echo ""
echo "[5/5] 检查当前 LD_LIBRARY_PATH 动态库加载配置..."
CURRENT_LD="${LD_LIBRARY_PATH:-}"
DEPS_PATH="$(pwd)/deps/bin:$(pwd)/deps/lib"

if [[ "${CURRENT_LD}" == *"${DEPS_PATH}"* ]]; then
    echo "  [PASS] LD_LIBRARY_PATH 已包含 deps 目录"
else
    echo "  [INFO] 当前终端未配置 LD_LIBRARY_PATH (运行 cjpm test 前需设置):"
    echo "         Bash: export LD_LIBRARY_PATH=\"\$(pwd)/deps/bin:\$(pwd)/deps/lib:\${LD_LIBRARY_PATH:-}\""
fi

echo ""
echo "============================================================"
if [ "${ALL_PASS}" = "true" ] && [ "${WARNINGS}" = "false" ]; then
    echo "   环境自检完成: 全部通过！可直接编译和运行本工程。   "
elif [ "${ALL_PASS}" = "true" ]; then
    echo "   环境自检完成: 核心编译器就绪，可根据提示补充依赖。   "
else
    echo "   环境自检完成: 发现阻塞性环境缺失，请按上方提示修复。 "
fi
echo "============================================================"
echo ""
