#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-latest}"
TARGET_DIR="${2:-./deps}"
USE_MIRROR="${3:-false}"

echo "=== MaaFramework 依赖拉取工具 ==="

# 1. 确定 OS 与架构
UNAME_S=$(uname -s)
UNAME_M=$(uname -m)

case "${UNAME_S}" in
    Linux*)
        OS="linux"
        ;;
    Darwin*)
        OS="macos"
        ;;
    *)
        echo "不支持的操作系统: ${UNAME_S}" >&2
        exit 1
        ;;
esac

case "${UNAME_M}" in
    x86_64|amd64)
        ARCH="x86_64"
        ;;
    aarch64|arm64)
        ARCH="aarch64"
        ;;
    *)
        echo "不支持的 CPU 架构: ${UNAME_M}" >&2
        exit 1
        ;;
esac

# 2. 获取版本信息
if [ "${VERSION}" = "latest" ]; then
    echo "正在查询 MaaFramework 最新版本..."
    TAG=$(curl -sSL https://api.github.com/repos/MaaXYZ/MaaFramework/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' || true)
    if [ -z "${TAG}" ]; then
        echo "查询 GitHub API 失败，使用默认版本 v5.13.0"
        TAG="v5.13.0"
    fi
else
    if [[ "${VERSION}" == v* ]]; then
        TAG="${VERSION}"
    else
        TAG="v${VERSION}"
    fi
fi

CLEAN_VER="${TAG#v}"
ASSET_NAME="MAA-${OS}-${ARCH}-v${CLEAN_VER}.zip"
echo "目标版本: ${TAG} (${ASSET_NAME})"

BASE_URL="https://github.com/MaaXYZ/MaaFramework/releases/download/${TAG}/${ASSET_NAME}"
if [ "${USE_MIRROR}" = "true" ] || [ "${USE_MIRROR}" = "1" ]; then
    DOWNLOAD_URL="https://ghproxy.net/${BASE_URL}"
else
    DOWNLOAD_URL="${BASE_URL}"
fi

TMP_ZIP="/tmp/${ASSET_NAME}"
mkdir -p "${TARGET_DIR}"

echo "正在下载: ${DOWNLOAD_URL} ..."
if ! curl -fL -o "${TMP_ZIP}" "${DOWNLOAD_URL}"; then
    if [ "${USE_MIRROR}" != "true" ] && [ "${USE_MIRROR}" != "1" ]; then
        echo "直连下载失败，尝试使用镜像源重试..."
        curl -fL -o "${TMP_ZIP}" "https://ghproxy.net/${BASE_URL}"
    else
        echo "下载失败！" >&2
        exit 1
    fi
fi

echo "正在解压到 ${TARGET_DIR} ..."
if command -v unzip >/dev/null 2>&1; then
    unzip -o -q "${TMP_ZIP}" -d "${TARGET_DIR}"
elif command -v 7z >/dev/null 2>&1; then
    7z x -y -o"${TARGET_DIR}" "${TMP_ZIP}" >/dev/null
else
    echo "未找到 unzip 或 7z 解压工具，请手动解压 ${TMP_ZIP} 到 ${TARGET_DIR}" >&2
    exit 1
fi
rm -f "${TMP_ZIP}"

echo "MaaFramework 依赖准备就绪！"
echo "  头文件路径: ${TARGET_DIR}/include"
echo "  动态库路径: ${TARGET_DIR}/bin 或 ${TARGET_DIR}/lib"
