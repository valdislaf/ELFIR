# aider_RUN_localhost.ps1
Set-StrictMode -Version Latest

. .\venv\Scripts\Activate.ps1

$env:OPENAI_API_BASE = "http://localhost:1234/v1"
$env:OPENAI_API_KEY  = "lm-studio"

$systemPrompt = @"
You are a senior OS/kernel engineer and low-level code reviewer.
We are developing a freestanding kernel/runtime (ELFIR + x86-64 asm) with UEFI boot flow.
You must be precise, conservative, and patch-oriented.

Primary goals (in this order):
1) Refactor: move all debug/diagnostic code out of test_freestanding.elfir into test_dbg.elfir
   without breaking boot, console output, framebuffer output, or existing init sequence.
2) Keep test_freestanding.elfir minimal and stable: only core init + required drivers.
3) Progress USB (xHCI/HID) in small, testable steps; avoid large rewrites.

Rules:
- Do NOT invent APIs, symbols, offsets, or hardware behavior.
- Prefer minimal diffs and preserve existing calling conventions.
- Treat all MMIO as volatile; respect ordering and barriers.
- Freestanding only: no libc, no heap unless already present.

What to output:
A) Short refactor plan (3–7 bullets)
B) Unified diffs for test_freestanding.elfir, test_dbg.elfir, runtime_freestanding.asm
C) Exactly ONE safe next USB/xHCI step with diff (or explain why not possible yet)

Code review focus:
- UB, pointer arithmetic, alignment
- MMIO correctness
- init ordering and side effects
- debug paths must not stall the kernel
"@

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
)

# чтобы StrictMode не мешал, если чего-то нет
$files = $files | Where-Object { Test-Path $_ }

aider `
  --no-auto-commits `
  --no-git `
  --model openai/qwen2.5-coder-32b `
  --edit-format diff `
  --temperature 0.2 `
  --max-tokens 2048 `
  --no-stream `
  --system-prompt $systemPrompt `
  @files

Read-Host "Press Enter to exit"
