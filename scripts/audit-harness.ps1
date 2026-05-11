param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$rootPath = (Resolve-Path $Root).Path
$score = 0
$notes = @()

function Add-Score($Points, $Message) {
  $script:score += $Points
  $script:notes += "+$Points $Message"
}

function Add-Miss($Message) {
  $script:notes += "+0 $Message"
}

function Test-File($RelativePath) {
  Test-Path (Join-Path $rootPath $RelativePath)
}

$required = @(
  "AGENTS.md",
  "harness/00-start-here.md",
  "harness/workflow/22-task-card.md",
  "harness/core/73-operational-guardrails.md",
  "harness/coding/43-code-quality-gates.md",
  "harness/domains/56-security-hardening.md",
  "harness/domains/58-consistency-system.md",
  "harness/domains/59-visual-design.md",
  "templates/design-system-lite.md",
  "templates/task-card-lite.md",
  "templates/security-review-lite.md",
  "templates/threat-model-lite.md",
  "templates/ui-ux-review-lite.md",
  "scripts/check-harness.ps1",
  "scripts/check-consistency.ps1",
  "scripts/check-security.ps1",
  "scripts/apply-to-project.ps1",
  "scripts/install-skill.ps1",
  "scripts/snapshot.ps1"
)

$missing = @($required | Where-Object { !(Test-File $_) })
if ($missing.Count -eq 0) { Add-Score 20 "required harness files exist" } else { Add-Miss "missing: $($missing -join ', ')" }

$agentsPath = Join-Path $rootPath "AGENTS.md"
$agentsBytes = (Get-Item $agentsPath).Length
if ($agentsBytes -le 4096) { Add-Score 15 "AGENTS.md is compact ($agentsBytes bytes)" } else { Add-Miss "AGENTS.md is large ($agentsBytes bytes)" }

$startText = Get-Content -Raw (Join-Path $rootPath "harness/00-start-here.md")
if ($startText -match "22-task-card" -and $startText -match "AGENTS.md") { Add-Score 10 "router supports selective loading" } else { Add-Miss "router needs clearer selective loading" }

$skillPath = Join-Path $rootPath "skills/codex-work-harness/SKILL.md"
if (Test-Path $skillPath) {
  $skillText = Get-Content -Raw $skillPath
  if ($skillText -match "task-card.md" -and $skillText -match "operational-guardrails.md" -and $skillText -match "consistency-system.md" -and $skillText -match "security-hardening.md" -and $skillText -match "visual-design.md") {
    Add-Score 10 "skill references new workflow layers"
  } else {
    Add-Miss "skill references are incomplete"
  }
} else {
  Add-Score 10 "local skill source is optional in applied projects"
}

if ((Test-File "harness/coding/45-safety-backups.md") -and (Test-File "examples/codex-config/.codex/rules/safety.rules") -and (Test-File "scripts/check-security.ps1")) {
  Add-Score 15 "backup docs, security scan, and optional safety rules exist"
} else {
  Add-Miss "backup docs or optional safety rule examples missing"
}

if ((Test-File "harness/domains/55-security-business-ux.md") -and (Test-File "harness/domains/56-security-hardening.md") -and (Test-File "harness/domains/58-consistency-system.md") -and (Test-File "harness/domains/59-visual-design.md") -and (Test-File "harness/workflow/12-project-intake.md")) {
  Add-Score 10 "security, business, UX, consistency, and intake gates exist"
} else {
  Add-Miss "security/business/UX/consistency or intake gate missing"
}

if (Test-File "harness/domains/57-cad-lsp.md") { Add-Score 10 "CAD LSP domain rules exist" } else { Add-Miss "CAD LSP rules missing" }

$legacyMatches = @()
$legacyPatterns = @(
  ("b" + "kit"),
  ("25-" + "pdca"),
  ("pdca" + "-status"),
  ("/sta" + "rter"),
  ("/dyn" + "amic"),
  ("/enter" + "prise")
)
foreach ($pattern in $legacyPatterns) {
  $found = rg -n -i --glob "!docs/research/**" --glob "!.git/**" $pattern $rootPath 2>$null
  if ($found) { $legacyMatches += $pattern }
}
if ($legacyMatches.Count -eq 0) { Add-Score 10 "legacy naming scan is clean" } else { Add-Miss "legacy terms found: $($legacyMatches -join ', ')" }

Write-Output "Harness audit score: $score / 100"
$notes | ForEach-Object { Write-Output $_ }

if ($score -lt 90) { exit 1 }
