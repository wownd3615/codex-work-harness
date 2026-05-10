param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$rootPath = (Resolve-Path $Root).Path
$source = Join-Path $rootPath "skills/codex-work-harness"
$targetRoot = Join-Path $env:USERPROFILE ".codex/skills"
$target = Join-Path $targetRoot "codex-work-harness"

if (!(Test-Path $source)) {
  throw "Skill source not found: $source"
}

New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null

if (Test-Path $target) {
  Remove-Item -Recurse -Force -LiteralPath $target
}

Copy-Item -Recurse -LiteralPath $source -Destination $target
Write-Output "Installed: $target"
