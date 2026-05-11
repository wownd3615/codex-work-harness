param(
  [Parameter(Mandatory = $true)]
  [string]$ProjectPath,

  [string]$HarnessRoot = ".",

  [switch]$IncludeSkill
)

$ErrorActionPreference = "Stop"
$sourceRoot = (Resolve-Path $HarnessRoot).Path
$targetRoot = (Resolve-Path $ProjectPath).Path

$items = @("AGENTS.md", "harness", "templates", "scripts")

foreach ($item in $items) {
  $source = Join-Path $sourceRoot $item
  $target = Join-Path $targetRoot $item

  if (!(Test-Path $source)) {
    throw "Missing source item: $source"
  }

  if (Test-Path $target) {
    $backup = "$target.bak-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Move-Item -LiteralPath $target -Destination $backup
    Write-Output "Existing $item moved to $backup"
  }

  Copy-Item -LiteralPath $source -Destination $target -Recurse -Force
  Write-Output "Applied: $item"
}

if ($IncludeSkill) {
  $skillScript = Join-Path $sourceRoot "scripts/install-skill.ps1"
  powershell -ExecutionPolicy Bypass -File $skillScript -Root $sourceRoot
}

Write-Output "Codex Work Harness applied to: $targetRoot"

