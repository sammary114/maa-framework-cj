param(
    [switch]$VerboseOutput
)

$ErrorActionPreference = "Continue"

Write-Host "`n============================================================" -ForegroundColor Cyan
Write-Host "   MaaFramework Cangjie (maa-framework-cj) Environment Check " -ForegroundColor Cyan
Write-Host "============================================================`n" -ForegroundColor Cyan

$allPass = $true
$warnings = $false

# 1. Check Cangjie Compiler & Package Manager (cjc / cjpm)
Write-Host "[1/5] Checking Cangjie Compiler & Package Manager (cjc / cjpm)..." -ForegroundColor Yellow
$cjcFound = $false
$cjpmFound = $false

if (Get-Command cjc.exe -ErrorAction SilentlyContinue) {
    $cjcVer = & cjc.exe --version 2>&1 | Select-Object -First 1
    Write-Host "  [PASS] cjc ready (PATH): $cjcVer" -ForegroundColor Green
    $cjcFound = $true
} elseif (Test-Path "$env:USERPROFILE\.cjv\bin\cjc.exe") {
    $cjcVer = & "$env:USERPROFILE\.cjv\bin\cjc.exe" --version 2>&1 | Select-Object -First 1
    Write-Host "  [PASS] cjc ready (cjv): $cjcVer" -ForegroundColor Green
    $cjcFound = $true
} else {
    Write-Host "  [FAIL] cjc compiler not found!" -ForegroundColor Red
    Write-Host "         Solution: Install Cangjie SDK LTS 1.0.5+ or use cjv (https://cangjie-lang.cn/)" -ForegroundColor Gray
    $allPass = $false
}

if (Get-Command cjpm.exe -ErrorAction SilentlyContinue) {
    $cjpmVer = & cjpm.exe --version 2>&1 | Select-Object -First 1
    Write-Host "  [PASS] cjpm ready (PATH): $cjpmVer" -ForegroundColor Green
    $cjpmFound = $true
} elseif (Test-Path "$env:USERPROFILE\.cjv\bin\cjpm.exe") {
    $cjpmVer = & "$env:USERPROFILE\.cjv\bin\cjpm.exe" --version 2>&1 | Select-Object -First 1
    Write-Host "  [PASS] cjpm ready (cjv): $cjpmVer" -ForegroundColor Green
    $cjpmFound = $true
} else {
    Write-Host "  [FAIL] cjpm package manager not found!" -ForegroundColor Red
    $allPass = $false
}

# 2. Check cjbind (FFI Generator)
Write-Host "`n[2/5] Checking cjbind FFI generator..." -ForegroundColor Yellow
if (Get-Command cjbind -ErrorAction SilentlyContinue) {
    $cjbindVer = & cjbind --version 2>&1 | Select-Object -First 1
    Write-Host "  [PASS] cjbind installed (PATH): $cjbindVer" -ForegroundColor Green
} elseif (Test-Path "$env:USERPROFILE\.cjpm\bin\cjbind.exe") {
    $cjbindVer = & "$env:USERPROFILE\.cjpm\bin\cjbind.exe" --version 2>&1 | Select-Object -First 1
    Write-Host "  [PASS] cjbind installed (~/.cjpm/bin): $cjbindVer" -ForegroundColor Green
} else {
    Write-Host "  [WARN] cjbind not found (only required if regenerating FFI bindings)" -ForegroundColor DarkYellow
    Write-Host "         Install command: irm https://cjbind.zxilly.dev/install.ps1 | iex" -ForegroundColor Gray
    $warnings = $true
}

# 3. Check MaaFramework C Headers (deps/include)
Write-Host "`n[3/5] Checking MaaFramework C headers..." -ForegroundColor Yellow
$coreHeader = "./deps/include/MaaFramework/MaaAPI.h"
$tkHeader = "./deps/include/MaaToolkit/MaaToolkitAPI.h"

if ((Test-Path $coreHeader) -and (Test-Path $tkHeader)) {
    Write-Host "  [PASS] C headers ready ($coreHeader)" -ForegroundColor Green
} else {
    Write-Host "  [WARN] MaaFramework C headers not found in deps/include" -ForegroundColor DarkYellow
    Write-Host "         Solution: Run ./tools/fetch_maafw.ps1 to download dependencies" -ForegroundColor Gray
    $warnings = $true
}

# 4. Check MaaFramework Runtime Binaries (deps/bin)
Write-Host "`n[4/5] Checking MaaFramework runtime DLLs..." -ForegroundColor Yellow
$coreDll = "./deps/bin/MaaFramework.dll"
$tkDll = "./deps/bin/MaaToolkit.dll"

if ((Test-Path $coreDll) -and (Test-Path $tkDll)) {
    Write-Host "  [PASS] Runtime DLLs ready ($coreDll, $tkDll)" -ForegroundColor Green
} else {
    Write-Host "  [WARN] Runtime DLLs not found in deps/bin (required for running tests/apps)" -ForegroundColor DarkYellow
    Write-Host "         Solution: Run ./tools/fetch_maafw.ps1 to download dependencies" -ForegroundColor Gray
    $warnings = $true
}

# 5. Check PATH Configuration
Write-Host "`n[5/5] Checking runtime dynamic library PATH..." -ForegroundColor Yellow
$currentPath = $env:PATH
$depsBinPath = (Resolve-Path "./deps/bin" -ErrorAction SilentlyContinue)

if ($depsBinPath -and ($currentPath -like "*$($depsBinPath.Path)*")) {
    Write-Host "  [PASS] PATH contains deps\bin directory" -ForegroundColor Green
} else {
    Write-Host "  [INFO] Current terminal PATH does not include deps\bin (set before running tests/apps):" -ForegroundColor Gray
    Write-Host "         PowerShell: `$env:PATH = `"`$PWD\deps\bin;`$env:PATH`"" -ForegroundColor Cyan
}

# Summary
Write-Host "`n============================================================" -ForegroundColor Cyan
if ($allPass -and -not $warnings) {
    Write-Host "   Environment check: ALL PASSED! Ready to build and run.   " -ForegroundColor Green
} elseif ($allPass) {
    Write-Host "   Environment check: Compiler ready. See above for optional tips." -ForegroundColor Yellow
} else {
    Write-Host "   Environment check: Blocking prerequisites missing. Please fix above." -ForegroundColor Red
}
Write-Host "============================================================`n" -ForegroundColor Cyan
