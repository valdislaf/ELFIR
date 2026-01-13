g++ -O2 -S -masm=intel -fno-exceptions -fno-rtti no_includes.cpp
g++ -c no_includes.s -o no_includes.o
g++ no_includes.o -o no_includes.exe
no_includes.exe
pause
