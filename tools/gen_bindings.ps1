param(
    [string]$MaaIncludeDir = "./include"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path "$MaaIncludeDir/MaaFramework/MaaAPI.h")) {
    Write-Host "错误: 未找到 $MaaIncludeDir/MaaFramework/MaaAPI.h，请先下载并放置 MaaFramework 头文件！" -ForegroundColor Red
    exit 1
}

New-Item -ItemType Directory -Force -Path "src/ffi" | Out-Null

Write-Host "正在生成 maa_core FFI 绑定..." -ForegroundColor Cyan
cjbind -p maa.ffi `
       --auto-cstring `
       -o src/ffi/maa_core.cj `
       "$MaaIncludeDir/MaaFramework/MaaAPI.h" `
       -- -I"$MaaIncludeDir"

Write-Host "正在生成 maa_toolkit FFI 绑定..." -ForegroundColor Cyan
cjbind -p maa.ffi `
       --auto-cstring `
       -o src/ffi/maa_toolkit.cj `
       "$MaaIncludeDir/MaaFramework/MaaToolkitAPI.h" `
       -- -I"$MaaIncludeDir"

Write-Host "FFI 代码生成完成！输出目录: src/ffi/" -ForegroundColor Green
