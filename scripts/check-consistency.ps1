param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$rootPath = (Resolve-Path $Root).Path

function Count-Files($Pattern) {
  @(Get-ChildItem -Path $rootPath -Recurse -File -Include $Pattern -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -notmatch "[\\/](node_modules|\.git|dist|build|coverage)[\\/]" }).Count
}

Write-Output "Consistency check: $rootPath"

$designPath = Join-Path $rootPath "DESIGN.md"
if (Test-Path $designPath) {
  Write-Output "+ DESIGN.md found"
} else {
  Write-Output "! DESIGN.md not found. For UI projects, copy templates/design-system-lite.md to DESIGN.md."
}

$componentDirs = @(
  "components",
  "src/components",
  "app/components",
  "src/ui",
  "src/shared"
)

$foundDirs = @()
foreach ($dir in $componentDirs) {
  $path = Join-Path $rootPath $dir
  if (Test-Path $path) { $foundDirs += $dir }
}

if ($foundDirs.Count -gt 0) {
  Write-Output "+ Component/style roots: $($foundDirs -join ', ')"
} else {
  Write-Output "! No common component root found. This can be OK for small projects."
}

$cssCount = Count-Files "*.css"
$tsxCount = Count-Files "*.tsx"
$jsxCount = Count-Files "*.jsx"
$vueCount = Count-Files "*.vue"

Write-Output "File counts: css=$cssCount tsx=$tsxCount jsx=$jsxCount vue=$vueCount"

$hexMatches = @()
$styleFiles = Get-ChildItem -Path $rootPath -Recurse -File -Include *.css,*.scss,*.tsx,*.jsx,*.vue -ErrorAction SilentlyContinue |
  Where-Object { $_.FullName -notmatch "[\\/](node_modules|\.git|dist|build|coverage)[\\/]" }

foreach ($file in $styleFiles) {
  $matches = Select-String -Path $file.FullName -Pattern "#[0-9a-fA-F]{3,8}" -AllMatches -ErrorAction SilentlyContinue
  foreach ($match in $matches) {
    foreach ($m in $match.Matches) {
      $hexMatches += [PSCustomObject]@{ File = $file.FullName; Color = $m.Value }
    }
  }
}

$uniqueHex = @($hexMatches | Select-Object -ExpandProperty Color -Unique)
if ($uniqueHex.Count -gt 12) {
  Write-Output "! Many raw hex colors found ($($uniqueHex.Count)). Consider moving colors into DESIGN.md or design tokens."
} else {
  Write-Output "+ Raw hex color count: $($uniqueHex.Count)"
}

Write-Output "Done. Review warnings manually; this script is advisory."
