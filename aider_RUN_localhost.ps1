# aider_RUN_localhost.ps1
Set-StrictMode -Version Latest

. .\venv\Scripts\Activate.ps1

$env:OPENAI_API_BASE = "http://localhost:1234/v1"
$env:OPENAI_API_KEY  = "lm-studio"
$env:LITELLM_FORCE_NON_STREAMING = "true"
$env:LITELLM_STREAMING = "false"



$files = @(
  "test_freestanding.elfir",
  "test_dbg.elfir",
  "runtime_freestanding.asm",
  "runtime.asm",
  "elfirc.cpp",
  "boot.asm",
  "uefi_entry.asm",
  "uefi_loader.c",
  "linker.ld",
  "Makefile",
  "qemu-xhci-device-usb-kbd.sh",
  "LANGUAGE_SPEC.md",
  "README.md",
  "test.elfir"
) | Where-Object { Test-Path $_ }


# =======================================
$models = Invoke-RestMethod `
  -Uri "http://localhost:1234/v1/models" `
  -Headers @{ Authorization = "Bearer $env:OPENAI_API_KEY" }

$modelId = ($models.data | Where-Object { $_.id -match "qwen|coder" } | Select-Object -First 1).id
if (-not $modelId) { $modelId = $models.data[0].id }

Write-Host "Using modelId: $modelId"
aider `
  --model openai/qwen2.5-coder-32b-instruct `
  --openai-api-base http://localhost:1234/v1 `
  --openai-api-key lm-studio `
  --no-auto-commits `
  --no-git `
  --edit-format diff `
  @files

Read-Host "Press Enter to exit"

