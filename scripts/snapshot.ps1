param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$rootPath = (Resolve-Path $Root).Path
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$snapshotRoot = Join-Path $rootPath ".codex-snapshots"
$target = Join-Path $snapshotRoot $timestamp

New-Item -ItemType Directory -Force -Path $target | Out-Null

$excludeDirs = @(
  ".git",
  ".codex-snapshots",
  "node_modules",
  "dist",
  "build",
  ".next",
  "out",
  "coverage"
)

Get-ChildItem -LiteralPath $rootPath -Force | Where-Object {
  $excludeDirs -notcontains $_.Name
} | ForEach-Object {
  Copy-Item -LiteralPath $_.FullName -Destination $target -Recurse -Force
}

Write-Output "Snapshot created: $target"
