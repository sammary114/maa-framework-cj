param(
    [string]$Version = "latest",
    [string]$TargetDir = "./deps",
    [switch]$Mirror
)

$ErrorActionPreference = "Stop"

Write-Host "=== MaaFramework Dependency Fetcher ===" -ForegroundColor Cyan

# 1. Check OS and Architecture
$arch = if ([System.Environment]::Is64BitOperatingSystem) {
    if ([System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture -eq [System.Runtime.InteropServices.Architecture]::Arm64) {
        "aarch64"
    } else {
        "x86_64"
    }
} else {
    Write-Error "32-bit OS is not supported!"
}

$os = "win"

# 2. Get Release Tag
if ($Version -eq "latest") {
    Write-Host "Querying latest MaaFramework release..." -ForegroundColor Gray
    try {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $releaseInfo = Invoke-RestMethod -Uri "https://api.github.com/repos/MaaXYZ/MaaFramework/releases/latest" -Headers @{ "User-Agent" = "PowerShell" }
        $tag = $releaseInfo.tag_name
    } catch {
        Write-Warning "Failed to query GitHub API, falling back to v5.13.0"
        $tag = "v5.13.0"
    }
} else {
    $tag = if ($Version.StartsWith("v")) { $Version } else { "v$Version" }
}

$cleanVer = $tag.TrimStart("v")
$assetName = "MAA-$os-$arch-v$cleanVer.zip"
Write-Host "Target version: $tag ($assetName)" -ForegroundColor Green

# 3. Construct Download URLs (with multiple fast mirror fallbacks)
$rawUrl = "https://github.com/MaaXYZ/MaaFramework/releases/download/$tag/$assetName"
$urls = @(
    "https://ghfast.top/$rawUrl",
    "https://ghproxy.net/$rawUrl",
    $rawUrl
)

if (-not $Mirror) {
    # If not explicitly mirror-only, rawUrl is included at end of list
}

# 4. Download Asset
$tempZip = Join-Path $env:TEMP $assetName
if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
}

$downloadSuccess = $false
foreach ($url in $urls) {
    Write-Host "Attempting download from: $url ..." -ForegroundColor Cyan
    try {
        if (Get-Command curl.exe -ErrorAction SilentlyContinue) {
            & curl.exe -fSL --connect-timeout 10 -o $tempZip $url
            if ($LASTEXITCODE -eq 0 -and (Test-Path $tempZip) -and (Get-Item $tempZip).Length -gt 1000000) {
                $downloadSuccess = $true
                break
            }
        } else {
            Invoke-WebRequest -Uri $url -OutFile $tempZip -UseBasicParsing -TimeoutSec 60
            if ((Test-Path $tempZip) -and (Get-Item $tempZip).Length -gt 1000000) {
                $downloadSuccess = $true
                break
            }
        }
    } catch {
        Write-Warning "Failed from $url, trying next mirror..."
    }
}

if (-not $downloadSuccess) {
    Write-Error "Failed to download $assetName from all mirrors!"
    exit 1
}

# 5. Extract
Write-Host "Extracting to $TargetDir ..." -ForegroundColor Cyan
Expand-Archive -Path $tempZip -DestinationPath $TargetDir -Force
Remove-Item -Path $tempZip -Force -ErrorAction SilentlyContinue

Write-Host "MaaFramework dependencies are ready!" -ForegroundColor Green
Write-Host "  Header path: $TargetDir/include" -ForegroundColor Gray
Write-Host "  Binary path: $TargetDir/bin" -ForegroundColor Gray
