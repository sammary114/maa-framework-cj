#!/usr/bin/env bash
set -euo pipefail

MAA_INCLUDE_DIR="${1:-./include}"

if [ ! -f "${MAA_INCLUDE_DIR}/MaaFramework/MaaAPI.h" ]; then
    echo "错误: 未找到 ${MAA_INCLUDE_DIR}/MaaFramework/MaaAPI.h，请先下载并放置 MaaFramework 头文件！" >&2
    exit 1
fi

mkdir -p src/ffi

echo "正在生成 maa_core FFI 绑定..."
cjbind -p maa.ffi \
       --auto-cstring \
       -o src/ffi/maa_core.cj \
       "${MAA_INCLUDE_DIR}/MaaFramework/MaaAPI.h" \
       -- -I"${MAA_INCLUDE_DIR}"

echo "正在生成 maa_toolkit FFI 绑定..."
cjbind -p maa.ffi \
       --auto-cstring \
       -o src/ffi/maa_toolkit.cj \
       "${MAA_INCLUDE_DIR}/MaaFramework/MaaToolkitAPI.h" \
       -- -I"${MAA_INCLUDE_DIR}"

echo "FFI 代码生成完成！输出目录: src/ffi/"
