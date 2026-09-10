#!/usr/bin/env bash
set -euo pipefail

MAA_INCLUDE_DIR="${1:-}"

if [ -z "${MAA_INCLUDE_DIR}" ]; then
    if [ -f "./deps/include/MaaFramework/MaaAPI.h" ]; then
        MAA_INCLUDE_DIR="./deps/include"
    elif [ -f "./include/MaaFramework/MaaAPI.h" ]; then
        MAA_INCLUDE_DIR="./include"
    else
        echo "错误: 未找到 MaaFramework 头文件！" >&2
        echo "请先运行 ./tools/fetch_maafw.sh 拉取依赖，或手动将头文件放置在 ./deps/include 或 ./include 中。" >&2
        exit 1
    fi
fi

mkdir -p src/ffi

TOOLKIT_HEADER="${MAA_INCLUDE_DIR}/MaaToolkit/MaaToolkitAPI.h"
if [ ! -f "${TOOLKIT_HEADER}" ]; then
    TOOLKIT_HEADER="${MAA_INCLUDE_DIR}/MaaFramework/MaaToolkitAPI.h"
fi

echo "正在生成统一 maa.ffi 绑定 (MaaAPI + MaaToolkitAPI)..."
cjbind -p maa.ffi \
       --auto-cstring \
       --make-func-wrapper \
       --func-wrapper-suffix "_wrap" \
       -o src/ffi/maa_ffi.cj \
       "${MAA_INCLUDE_DIR}/MaaFramework/MaaAPI.h" \
       "${TOOLKIT_HEADER}" \
       -- -I"${MAA_INCLUDE_DIR}"
echo "FFI 代码生成完成！输出: src/ffi/maa_ffi.cj"
