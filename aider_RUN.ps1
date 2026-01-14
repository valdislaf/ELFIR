# aider_RUN.ps1
Set-StrictMode -Version Latest

# Активируем venv
. .\venv\Scripts\Activate.ps1

# Запуск aider с моделью Vertex Gemini
aider --model vertex_ai/gemini-2.5-flash --no-stream test_freestanding.elfir runtime_freestanding.asm test_dbg.elfir

/stream false
pause
