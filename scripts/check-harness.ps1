param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$rootPath = (Resolve-Path $Root).Path

$required = @(
  "AGENTS.md",
  "harness/00-start-here.md",
  "harness/core/05-truthfulness.md",
  "harness/core/38-beginner-explanation.md",
  "harness/core/73-operational-guardrails.md",
  "harness/core/80-done-checklist.md",
  "harness/workflow/12-project-intake.md",
  "harness/workflow/22-task-card.md",
  "harness/workflow/25-planning-cycle.md",
  "harness/coding/40-code-rules.md",
  "harness/coding/42-comment-rules.md",
  "harness/coding/45-safety-backups.md",
  "harness/domains/57-cad-lsp.md",
  "scripts/apply-to-project.ps1",
  "scripts/audit-harness.ps1",
  "scripts/install-skill.ps1",
  "scripts/snapshot.ps1"
)

$missing = @()
foreach ($item in $required) {
  $path = Join-Path $rootPath $item
  if (!(Test-Path $path)) { $missing += $item }
}

if ($missing.Count -gt 0) {
  Write-Output "Missing harness files:"
  $missing | ForEach-Object { Write-Output "- $_" }
  exit 1
}

$status = Join-Path $rootPath "docs/.work-status.json"
if (!(Test-Path $status)) {
  Write-Output "Work status file not found. This is OK for quick fixes."
} else {
  Write-Output "Work status file found."
}

Write-Output "Harness OK: $rootPath"

