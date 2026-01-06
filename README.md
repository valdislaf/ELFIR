ELFIR (v0) — Minimal Compiler + Runtime (Linux x86-64)

ELFIR is an experimental micro-language and compiler that translates `*.elfir` source into NASM assembly, then links to a native ELF executable for Linux x86-64 (SysV ABI). The v0 goal is maximum simplicity and determinism:

- exactly one numeric type: signed i64
- no libc, only Linux syscalls
- a small, explicit runtime

## v0 Entry Points

Exactly one entry point must be defined:

- `main()` returns an i64 exit code. No automatic printing.
- `main_i64()` returns an i64 that is printed to stdout, then exits with code 0.

Defining both is a compile-time error.

## Repository Contents

- `elfirc.cpp` — ELFIR v0 compiler (`*.elfir` → `out.asm`)
- `runtime.asm` — minimal syscall-based runtime:
  - `rt_exit`
  - `rt_write`
  - `rt_print_i64` (prints signed i64 + newline)
- `main_i64.elfir` — example ELFIR program
- `hello.asm` — NASM + libc `puts` (PIE-friendly) example
- `add.asm` — syscall-only demo with `_start` (no CRT)
- `no_includes.cpp` / `no_includes.s` — reference output from a Windows toolchain (MSYS2)
- `instruction.txt`, `instruction2.txt`, `learning.txt` — personal notes and command snippets

## Requirements

- Ubuntu / WSL (Linux x86-64)
- `g++` (C++20)
- `nasm`
- `ld` (binutils)

Install dependencies:

```bash
sudo apt update
sudo apt install -y build-essential nasm binutils
```

## Quick Start

1) Build the compiler

```bash
g++ -std=c++20 -O2 -Wall -Wextra -pedantic elfirc.cpp -o elfirc
```

2) Compile ELFIR → ASM

```bash
./elfirc main_i64.elfir out.asm
```

3) Assemble + link with runtime

```bash
nasm -felf64 out.asm -o out.o
nasm -felf64 runtime.asm -o runtime.o
ld out.o runtime.o -o prog
```

4) Run

```bash
./prog
```

Expected output:

```
10
```

## Example ELFIR Program

```elfir
fn main_i64() {
    auto x = 3 + 7 * 2;
    ret -x;
}
```

## ELFIR v0 Semantics

- `auto` declares a variable (always signed i64).
- `ret <expr>;` returns the expression value in `rax`.
- Operators: `+`, `-`, `*`, `/` with standard precedence and left associativity.
- Unary minus is supported: `-x` is parsed as `0 - x`.
- `()` can be used to group expressions.
- Numeric literals are decimal digits only; a leading `-` is parsed as unary minus.

There are no unsigned types, no implicit casts, and no multiple integer sizes in v0.

## Design Goals

- single integer type (i64) — no signed/unsigned confusion
- strict, explicit entry point rules
- predictable code generation
- minimal runtime
- no hidden behavior

## Planned Extensions (Ideas)

- `print <expr>;` inside function bodies
- multiple functions and function calls
