# aider_ping_ultraclean.ps1
Set-StrictMode -Version Latest
. .\venv\Scripts\Activate.ps1



# LM Studio health-check: /models + короткий chat/completions
$apiBase      = "http://127.0.0.1:1234/v1"
$timeoutSec   = 10

# В LM Studio id обычно БЕЗ "openai/"
$modelIdBare  = "qwen2.5-coder-32b-instruct"
$authHeader   = "Bearer lm-studio"   # для LM Studio может быть любая строка

function Fail($msg) {
  Write-Error $msg
  exit 1
}

# 1) /models
try {
  $models = Invoke-RestMethod -Uri "$apiBase/models" -Method Get -TimeoutSec $timeoutSec -Headers @{
    Authorization = $authHeader
  } -ErrorAction Stop
} catch {
  Fail "API недоступен: $($_.Exception.Message)`nПроверь LM Studio Server и адрес $apiBase"
}

if (-not $models.data) {
  Fail "API ответил, но models.data пустой/нет ожидаемой структуры."
}

$ids = @()
if ($models.data -is [System.Array]) {
  $ids = $models.data | ForEach-Object { $_.id } | Where-Object { $_ }
} elseif ($models.data.id) {
  $ids = ,$models.data.id
}

if (-not ($ids -contains $modelIdBare)) {
  Write-Warning "Доступные модели: $($ids -join ', ')"
  Fail "Целевая модель '$modelIdBare' не найдена в /models."
}

Write-Host "OK: модель найдена в /models: $modelIdBare"

# 2) /chat/completions (самый показательный тест)
$body = @{
  model = $modelIdBare
  messages = @(
    @{ role = "system"; content = "You are a test assistant." }
    @{ role = "user"; content = "Reply with OK only." }
  )
  temperature = 0
  max_tokens  = 5
  stream      = $false
} | ConvertTo-Json -Depth 6

try {
  $resp = Invoke-RestMethod -Method Post -Uri "$apiBase/chat/completions" -TimeoutSec 60 -Headers @{
    Authorization = $authHeader
    "Content-Type" = "application/json"
  } -Body $body -ErrorAction Stop
} catch {
  Fail "chat/completions упал: $($_.Exception.Message)`nЭто уже проблема инференса/контекста/VRAM/модели, а не PS-скрипта."
}

$out = $resp.choices[0].message.content
Write-Host "OK: chat/completions ответил: '$out'"






$emptyEnv = ".\empty.env"
"" | Set-Content -Encoding ASCII $emptyEnv

# Временные файлы истории, чтобы не подхватывать старые простыни
$tmpChat = ".\_aider_chat_tmp.md"
$tmpIn   = ".\_aider_input_tmp"
"" | Set-Content -Encoding UTF8 $tmpChat
"" | Set-Content -Encoding UTF8 $tmpIn

aider -v `
  --env-file $emptyEnv `
  --chat-history-file $tmpChat `
  --input-history-file $tmpIn `
  --no-restore-chat-history `
  --max-chat-history-tokens 200 `
  --openai-api-base "http://127.0.0.1:1234/v1" `
  --openai-api-key  "lm-studio" `
  --no-stream `
  --no-git `
  --no-auto-commits `
  --no-show-model-warnings `
  --model "openai/qwen2.5-coder-32b-instruct" `
  --message "OK"

Read-Host "Press Enter to exit"
