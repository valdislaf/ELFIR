ELFIR (v0) — Minimal Compiler + Runtime (Linux x86-64)

ELFIR is an experimental v0 micro-language and compiler that translates *.elfir source files into NASM assembly, which is then linked into a native ELF executable for Linux x86-64 (SysV ABI).

The main idea of v0 is maximum simplicity and determinism:

exactly one numeric type: signed i64

no libc, only Linux syscalls

a very small, explicit runtime

v0 Entry Points

ELFIR v0 supports exactly one entry point per program:

main()
Returns an i64 value used as the process exit code. No automatic printing.

main_i64()
Returns an i64 value that is automatically printed to stdout, then the program exits with code 0.

⚠️ Exactly one entry point must be defined:
either main or main_i64.
Defining both is a compile-time error.

Repository Contents

elfirc.cpp — ELFIR v0 compiler
Translates *.elfir → out.asm

runtime.asm — Minimal syscall-based runtime:

rt_exit

rt_write

rt_print_i64 (prints signed i64 + newline)

main_i64.elfir — Example ELFIR program

Requirements
Ubuntu / WSL

g++ (C++20)

nasm

ld (binutils)

Install dependencies:

sudo apt update
sudo apt install -y build-essential nasm binutils

Quick Start
1) Build the compiler
g++ -std=c++20 -O2 -Wall -Wextra -pedantic elfirc.cpp -o elfirc

2) Compile ELFIR → ASM
./elfirc main_i64.elfir out.asm

3) Assemble + link with runtime
nasm -felf64 out.asm -o out.o
nasm -felf64 runtime.asm -o runtime.o
ld out.o runtime.o -o prog

4) Run
./prog


Expected output:

10

Example ELFIR Program
fn main_i64() {
    auto x = 3 + 7;
    ret x;
}

ELFIR v0 Semantics

auto
Declares a variable.
In v0 all variables are implicitly signed i64.

ret <expr>;
Returns the value of the expression (placed in rax).

+
Signed i64 addition (hardware wrap-around semantics).

There are no unsigned types, no implicit casts, and no multiple integer sizes in v0.

Design Goals

single integer type (i64) — no signed/unsigned confusion

strict, explicit entry point rules

predictable code generation

minimal runtime

no hidden behavior

Planned Extensions (Ideas)

negative numeric literals (-7)

print <expr>; inside function bodies

parentheses in expressions

multiple functions and function calls# ELFIR
