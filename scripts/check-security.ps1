param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$rootPath = (Resolve-Path $Root).Path

$skip = "[\\/](\.git|node_modules|dist|build|coverage|\.codex-snapshots)[\\/]"
$files = Get-ChildItem -Path $rootPath -Recurse -File -ErrorAction SilentlyContinue |
  Where-Object { $_.FullName -notmatch $skip }

Write-Output "Security check: $rootPath"

$secretPatterns = @(
  @{ Name = "AWS access key"; Pattern = "AKIA[0-9A-Z]{16}" },
  @{ Name = "GitHub token"; Pattern = "gh[pousr]_[A-Za-z0-9_]{20,}" },
  @{ Name = "OpenAI key"; Pattern = "sk-[A-Za-z0-9_-]{20,}" },
  @{ Name = "Private key"; Pattern = "-----BEGIN (RSA |EC |OPENSSH |DSA )?PRIVATE KEY-----" },
  @{ Name = "Generic assignment"; Pattern = "(?i)(api[_-]?key|secret|token|password)\s*[:=]\s*['""][^'""]{8,}['""]" }
)

$secretFindings = @()
foreach ($file in $files) {
  if ($file.Extension -match "\.(png|jpg|jpeg|gif|ico|pdf|zip|7z|exe|dll)$") { continue }
  foreach ($rule in $secretPatterns) {
    $matches = Select-String -Path $file.FullName -Pattern $rule.Pattern -AllMatches -ErrorAction SilentlyContinue
    foreach ($match in $matches) {
      $relative = Resolve-Path -Relative $file.FullName
      $secretFindings += "$($relative):$($match.LineNumber) $($rule.Name)"
    }
  }
}

if ($secretFindings.Count -gt 0) {
  Write-Output "! Possible secrets found:"
  $secretFindings | Select-Object -First 50 | ForEach-Object { Write-Output "  $_" }
  if ($secretFindings.Count -gt 50) { Write-Output "  ...and more" }
} else {
  Write-Output "+ No obvious secrets found by basic patterns"
}

$envFiles = @($files | Where-Object { $_.Name -match "^\.env($|\.)" -and $_.Name -notmatch "\.example$|\.sample$|\.template$" })
if ($envFiles.Count -gt 0) {
  Write-Output "! Non-example .env files found:"
  $envFiles | ForEach-Object { Write-Output "  $($_.FullName.Replace($rootPath, '.'))" }
} else {
  Write-Output "+ No non-example .env files found"
}

$packageFiles = @("package-lock.json", "pnpm-lock.yaml", "yarn.lock", "requirements.txt", "pyproject.toml", "Pipfile.lock", "Cargo.lock", "packages.lock.json")
$foundPackageFiles = @()
foreach ($name in $packageFiles) {
  $foundPackageFiles += @($files | Where-Object { $_.Name -eq $name })
}

if ($foundPackageFiles.Count -gt 0) {
  Write-Output "+ Dependency files found:"
  $foundPackageFiles | ForEach-Object { Write-Output "  $($_.FullName.Replace($rootPath, '.'))" }
  Write-Output "  Run the ecosystem audit tool when available."
} else {
  Write-Output "! No common dependency manifest/lock files found"
}

Write-Output "Done. This is an advisory scan, not a full security audit."
