param(
  [Parameter(Mandatory = $true)]
  [string]$Path
)

$ErrorActionPreference = "Stop"
$filePath = (Resolve-Path $Path).Path
$bytes = [System.IO.File]::ReadAllBytes($filePath)

$encoding = "ANSI/Unknown"
if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
  $encoding = "UTF-8 with BOM"
} elseif ($bytes.Length -ge 2 -and $bytes[0] -eq 0xFF -and $bytes[1] -eq 0xFE) {
  $encoding = "UTF-16 LE"
} elseif ($bytes.Length -ge 2 -and $bytes[0] -eq 0xFE -and $bytes[1] -eq 0xFF) {
  $encoding = "UTF-16 BE"
} else {
  try {
    $utf8 = [System.Text.UTF8Encoding]::new($false, $true)
    $null = $utf8.GetString($bytes)
    $encoding = "UTF-8 without BOM or ASCII"
  } catch {
    $encoding = "ANSI/CP949 likely"
  }
}

$hasHighBytes = $bytes | Where-Object { $_ -ge 0x80 } | Select-Object -First 1

Write-Output "File: $filePath"
Write-Output "Detected: $encoding"
if ($hasHighBytes -ne $null) {
  Write-Output "Non-ASCII bytes: yes"
} else {
  Write-Output "Non-ASCII bytes: no"
}

if ($encoding -like "UTF-8*") {
  Write-Output "Warning: Some CAD LSP loaders may fail or break Korean text with UTF-8. Confirm target CAD encoding."
}

