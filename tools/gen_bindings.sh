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

echo "正在生成 maa_core FFI 绑定..."
cjbind -p maa.ffi \
       --auto-cstring \
       -o src/ffi/maa_core.cj \
       "${MAA_INCLUDE_DIR}/MaaFramework/MaaAPI.h" \
       -- -I"${MAA_INCLUDE_DIR}"

echo "正在生成 maa_toolkit FFI 绑定..."
TOOLKIT_HEADER="${MAA_INCLUDE_DIR}/MaaToolkit/MaaToolkitAPI.h"
if [ ! -f "${TOOLKIT_HEADER}" ]; then
    TOOLKIT_HEADER="${MAA_INCLUDE_DIR}/MaaFramework/MaaToolkitAPI.h"
fi
cjbind -p maa.ffi \
       --auto-cstring \
       -o src/ffi/maa_toolkit.cj \
       "${TOOLKIT_HEADER}" \
       -- -I"${MAA_INCLUDE_DIR}"
echo "FFI 代码生成完成！输出目录: src/ffi/"
