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

# Locate cjbind executable
$cjbindCmd = "cjbind"
if (-not (Get-Command "cjbind" -ErrorAction SilentlyContinue)) {
    $userCjbind = Join-Path $env:USERPROFILE ".cjpm\bin\cjbind.exe"
    if (Test-Path $userCjbind) {
        $cjbindCmd = $userCjbind
    } else {
        Write-Host "Error: cjbind not found in PATH or $userCjbind" -ForegroundColor Red
        Write-Host "Please install cjbind first (e.g. irm https://cjbind.zxilly.dev/install.ps1 | iex)" -ForegroundColor Yellow
        exit 1
    }
}

# Detect optional system clang include directories (for stdint.h on Windows)
$extraClangArgs = @()
$candPaths = @(
    "$env:ProgramFiles\Huawei\DevEco Studio\sdk\default\openharmony\native\llvm\lib\clang\*\include",
    "$env:ProgramFiles\LLVM\lib\clang\*\include",
    "${env:ProgramFiles(x86)}\LLVM\lib\clang\*\include"
)
foreach ($cand in $candPaths) {
    $found = Resolve-Path $cand -ErrorAction SilentlyContinue
    if ($found) {
        $extraClangArgs += "-I$($found.Path)"
        break
    }
}

New-Item -ItemType Directory -Force -Path "src/ffi" | Out-Null

$toolkitHeader = if (Test-Path "$MaaIncludeDir/MaaToolkit/MaaToolkitAPI.h") {
    "$MaaIncludeDir/MaaToolkit/MaaToolkitAPI.h"
} else {
    "$MaaIncludeDir/MaaFramework/MaaToolkitAPI.h"
}

Write-Host "Generating unified maa.ffi bindings (MaaAPI + MaaToolkitAPI)..." -ForegroundColor Cyan
& $cjbindCmd -p maa.ffi `
       --auto-cstring `
       --make-func-wrapper `
       --func-wrapper-suffix "_wrap" `
       -o src/ffi/maa_ffi.cj `
       "$MaaIncludeDir/MaaFramework/MaaAPI.h" `
       "$toolkitHeader" `
       -- -I"$MaaIncludeDir" @extraClangArgs
Write-Host "FFI generation completed! Output: src/ffi/maa_ffi.cj" -ForegroundColor Green
