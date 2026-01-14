param(
  [Parameter(Mandatory=$true, Position=0)]
  [string]$Prompt,

  [string]$ApiBase = "http://127.0.0.1:1234/v1",
  [string]$Model   = "qwen2.5-coder-32b-instruct",
  [switch]$Smart,

  # сколько файлов максимум подтягивать в контекст
  [int]$MaxFiles = 80,

  # максимальный размер одного файла в символах (чтобы не убить контекст)
  [int]$MaxCharsPerFile = 8000,

  # что включать в контекст
  [switch]$UseGitDiff,
  [switch]$UseGitLs,

  # режим: просто ответ или "дай патч"
  [ValidateSet("answer","patch")]
  [string]$Mode = "answer"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
function Get-ProjectMapShort {
  param([int]$MaxLines = 800)

  $root = (Get-Location).Path
  $exclude = "\\(bin|obj|\.git|node_modules|venv|\.venv|dist|build)\\"

  $lines = New-Object System.Collections.Generic.List[string]

  # 1) важные файлы-кандидаты (ищем по фильтрам)
  $importantGlobs = @(
  "test_freestanding.elfir",
  "test_dbg.elfir",
  "runtime_freestanding.asm"#,
  #"runtime.asm",
 # "elfirc.cpp",
 # "boot.asm",
 # "uefi_entry.asm",
 # "uefi_loader.c",
 # "linker.ld",
 # "Makefile",
 # "qemu-xhci-device-usb-kbd.sh",
 # "LANGUAGE_SPEC.md",
 # "README.md",
 # "test.elfir"
  )

  $lines.Add("== IMPORTANT CANDIDATES ==") | Out-Null

  foreach ($g in $importantGlobs) {
    $found = Get-ChildItem -Path $root -Recurse -File -Filter $g -ErrorAction SilentlyContinue |
      Where-Object { $_.FullName -notmatch $exclude } |
      ForEach-Object { $_.FullName.Substring($root.Length).TrimStart("\") } |
      Sort-Object -Unique

    foreach ($f in ($found | Select-Object -First 50)) {
      $lines.Add($f) | Out-Null
      if ($lines.Count -ge $MaxLines) { break }
    }
    if ($lines.Count -ge $MaxLines) { break }
  }

  if ($lines.Count -ge $MaxLines) {
    return ($lines | Select-Object -First $MaxLines) -join "`n"
  }

  # 2) верхнеуровневые папки (короткая карта структуры)
  $lines.Add("") | Out-Null
  $lines.Add("== TOP DIRS ==") | Out-Null

  $topDirs = Get-ChildItem -Path $root -Directory -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -notmatch $exclude } |
    ForEach-Object { $_.Name } |
    Sort-Object -Unique

  foreach ($d in $topDirs) {
    $lines.Add($d + "\") | Out-Null
    if ($lines.Count -ge $MaxLines) { break }
  }

  return ($lines | Select-Object -First $MaxLines) -join "`n"
}

function Get-ProjectContext {
  param(
    [int]$MaxFiles,
    [int]$MaxCharsPerFile,
    [switch]$UseGitDiff,
    [string[]]$OnlyFiles
  )

  $root = (Get-Location).Path
  $sb = New-Object System.Text.StringBuilder

  $null = $sb.AppendLine("PROJECT_ROOT: $root")
  $null = $sb.AppendLine("TIME: $(Get-Date -Format s)")
  $null = $sb.AppendLine("")

  if (Test-Path (Join-Path $root ".git")) {
    $null = $sb.AppendLine("== GIT STATUS ==")
    $null = $sb.AppendLine((git status --porcelain 2>$null) -join "`n")
    $null = $sb.AppendLine("")
    if ($UseGitDiff) {
      $null = $sb.AppendLine("== GIT DIFF ==")
      $null = $sb.AppendLine((git diff 2>$null) -join "`n")
      $null = $sb.AppendLine("")
    }
  }

  $files = @()
  if ($OnlyFiles -and $OnlyFiles.Count -gt 0) {
    $files = $OnlyFiles
  } else {
    # fallback: всё как раньше (но лучше не использовать без Smart)
    $files = Get-ProjectFileList | Select-Object -First $MaxFiles
  }

  $files = $files | Select-Object -First $MaxFiles

  $null = $sb.AppendLine("== FILES INCLUDED ($($files.Count)) ==")
  $null = $sb.AppendLine(($files -join "`n"))
  $null = $sb.AppendLine("")

  foreach ($rel in $files) {
    $path = Join-Path $root $rel
    if (-not (Test-Path $path)) { continue }

    # только текстовые файлы (страховка)
    $ext = [IO.Path]::GetExtension($path).ToLowerInvariant()
    $allowedExt = @(".elfir",".asm",".inc",".c",".h",".cpp",".hpp",".txt",".md",".json",".yml",".yaml",".ps1",".cmake",".mk")
    if (($allowedExt -notcontains $ext) -and ($rel -ne "CMakeLists.txt")) { continue }

    $text = Get-Content -LiteralPath $path -Raw -ErrorAction SilentlyContinue
    if (-not $text) { continue }

    if ($text.Length -gt $MaxCharsPerFile) {
      $text = $text.Substring(0, $MaxCharsPerFile) + "`n...[TRUNCATED]..."
    }

    $null = $sb.AppendLine("== FILE: $rel ==")
    $null = $sb.AppendLine($text)
    $null = $sb.AppendLine("")
  }

  return $sb.ToString()
}

function Invoke-LmChat {
  param(
    [string]$ApiBase,
    [string]$Model,
    [string]$System,
    [string]$User
  )

  # 1) payload
  $payload = @{
    model = $Model
    temperature = 0.2
    messages = @(
      @{ role = "system"; content = $System },
      @{ role = "user";   content = $User }
    )
  }

  # 2) Надёжная сериализация для Windows PowerShell 5.1
  Add-Type -AssemblyName System.Web.Extensions | Out-Null
  $ser = New-Object System.Web.Script.Serialization.JavaScriptSerializer
  # увеличим лимит (по умолчанию маленький)
  $ser.MaxJsonLength = 2147483647

  $json = $ser.Serialize($payload)

  # (опционально) лог запроса для отладки
  Set-Content -LiteralPath ".\lcx_last_request.json" -Value $json -Encoding UTF8

  # 3) отправка как UTF-8 bytes
  $bytes = [System.Text.Encoding]::UTF8.GetBytes($json)

  $resp = Invoke-RestMethod `
    -Uri "$ApiBase/chat/completions" `
    -Method Post `
    -ContentType "application/json; charset=utf-8" `
    -Body $bytes

  return $resp.choices[0].message.content
}

# ---- main ----

# 1) system prompt (ДОЛЖЕН быть всегда)
if ($Mode -eq "patch") {
  $system = @"
Ты — локальный code assistant. Дай ответ ТОЛЬКО в формате unified diff (git patch).
Никаких пояснений, только diff. Если нужно изменить несколько файлов — включай их все.
"@
} else {
  $system = "Ты — локальный code assistant. Отвечай конкретно и по делу, с командами/кодом."
}

# 2) получить контекст (обычный или Smart)
if ($Smart) {
	
	$map = Get-ProjectMapShort -MaxLines 700


  $sys1 = "Ты помощник по коду. Выбери файлы, которые нужно прочитать, чтобы ответить. Верни ТОЛЬКО список путей, по одному на строку, без пояснений."
  $usr1 = @"
ЗАДАЧА:
$Prompt

КАРТА ПРОЕКТА:
$map
"@


  $pick = Invoke-LmChat -ApiBase $ApiBase -Model $Model -System $sys1 -User $usr1
  $picked = $pick -split "`r?`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ -and ($_ -notmatch '^\s*#') }

  # ограничим количество файлов
  $picked = $picked | Select-Object -First 12

  $ctx = Get-ProjectContext -MaxFiles 12 -MaxCharsPerFile $MaxCharsPerFile -UseGitDiff:$UseGitDiff -OnlyFiles $picked
} else {
  # старый режим
  $ctx = Get-ProjectContext -MaxFiles $MaxFiles -MaxCharsPerFile $MaxCharsPerFile -UseGitDiff:$UseGitDiff -OnlyFiles $null
}

# 3) user prompt (общий)
$user = @"
ЗАДАЧА:
$Prompt

КОНТЕКСТ ПРОЕКТА:
$ctx
"@

# 4) вызов модели
$out = Invoke-LmChat -ApiBase $ApiBase -Model $Model -System $system -User $user
$out
