param(
    [string]$MaaIncludeDir = ""
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($MaaIncludeDir)) {
    if (Test-Path "./deps/include/MaaFramework/MaaAPI.h") {
        $MaaIncludeDir = "./deps/include"
    } elseif (Test-Path "./include/MaaFramework/MaaAPI.h") {
        $MaaIncludeDir = "./include"
    } else {
        Write-Host "Error: MaaFramework headers not found!" -ForegroundColor Red
        Write-Host "Please run ./tools/fetch_maafw.ps1 first, or place headers in ./deps/include or ./include." -ForegroundColor Yellow
        exit 1
    }
}

New-Item -ItemType Directory -Force -Path "src/ffi" | Out-Null

Write-Host "Generating maa_core FFI bindings..." -ForegroundColor Cyan
cjbind -p maa.ffi `
       --auto-cstring `
       -o src/ffi/maa_core.cj `
       "$MaaIncludeDir/MaaFramework/MaaAPI.h" `
       -- -I"$MaaIncludeDir"

Write-Host "Generating maa_toolkit FFI bindings..." -ForegroundColor Cyan
$toolkitHeader = if (Test-Path "$MaaIncludeDir/MaaToolkit/MaaToolkitAPI.h") {
    "$MaaIncludeDir/MaaToolkit/MaaToolkitAPI.h"
} else {
    "$MaaIncludeDir/MaaFramework/MaaToolkitAPI.h"
}
cjbind -p maa.ffi `
       --auto-cstring `
       -o src/ffi/maa_toolkit.cj `
       "$toolkitHeader" `
       -- -I"$MaaIncludeDir"
Write-Host "FFI generation completed! Output directory: src/ffi/" -ForegroundColor Green
