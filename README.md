ELFIR (v0.1) — Minimal Compiler + Runtime (Linux x86-64)

ELFIR is an experimental micro-language and compiler that translates `*.elfir` source into NASM assembly, then links to a native ELF executable for Linux x86-64 (SysV ABI). The v0 goal is maximum simplicity and determinism:

- exactly one numeric type per entrypoint (i64 or d64)
- no libc, only Linux syscalls
- a small, explicit runtime

## v0.1 Entry Points

Exactly one entry point must be defined:

- `main()` returns an i64 exit code. No automatic printing.
- `main_i64()` returns an i64 that is printed to stdout, then exits with code 0.
- `main_d64()` returns a d64 that is printed to stdout in scientific notation, then exits with code 0.

Defining more than one is a compile-time error.

## Repository Contents

- `elfirc.cpp` — ELFIR v0 compiler (`*.elfir` → `out.asm`)
- `runtime.asm` — minimal syscall-based runtime:
  - `rt_exit`
  - `rt_write`
  - `rt_print_i64` (prints signed i64 + newline)
  - `rt_print_f64` (prints d64 in scientific notation + newline)
- `main_i64.elfir` — example ELFIR program
- `main_d64.elfir` — example ELFIR program (d64 mode)
- `main_d64_big.elfir` — d64 example (`1e100`)
- `main_d64_small.elfir` — d64 example (`-1e-100`)
- `main_d64_nan.elfir` — d64 example (`0.0/0.0`)
- `main_d64_inf.elfir` — d64 example (`1.0/0.0`)
- `main_i64_cmp.elfir` — i64 comparison example
- `main_d64_cmp.elfir` — d64 comparison example
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
make clean && make
```

Or build manually:

```bash
g++ -std=c++20 -O2 -Wall -Wextra -pedantic elfirc.cpp -o elfirc
./elfirc test.elfir out.asm
nasm -felf64 out.asm -o out.o
nasm -felf64 runtime.asm -o runtime.o
ld out.o runtime.o -o prog
./prog
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

## Example ELFIR Program (i64)

```elfir
fn main_i64() {
    auto x = 3 + 7 * 2;
    ret -x;
}
```

## Example ELFIR Program (d64)

```elfir
fn main_d64() {
    auto x = 1.5;
    auto y = 2.25;
    print_d64(x);
    ret x + y;
}
```

## ELFIR v0.1 Semantics

- `auto` declares a variable (i64 in `main_i64`, d64 in `main_d64`). `auto` is not allowed in `main`.
- `i64 x = <expr>;` and `d64 x = <expr>;` declare typed variables (required in `main`).
- `print_i64(<expr>);` prints i64, `print_d64(<expr>);` prints d64, `print_str("...");` prints a string literal.
- `print_i64/print_d64/print_str` do not add a newline; use `\n` inside strings when needed.
- `print_i64` is only allowed in `main`/`main_i64`; `print_d64` only in `main`/`main_d64`.
- `ret <expr>;` returns the expression value in `rax` (i64) or `xmm0` (d64).
- Operators: `+`, `-`, `*`, `/`, `%` with standard precedence and left associativity.
- `%` is remainder (i64) / fmod-style remainder (d64).
- Comparisons: `==`, `!=`, `<`, `<=`, `>`, `>=` (lower precedence than arithmetic).
- Builtins: `sqrt(x)`, `pow(x, y)`, `min(x, y)`, `max(x, y)`, `abs(x)`, `sin(x)`, `cos(x)`, `tan(x)`.
- Unary minus is supported: `-x` is parsed as `0 - x`.
- `()` can be used to group expressions.
- Integer literals: decimal digits only; a leading `-` is parsed as unary minus.
- Floating literals (d64 mode): digits with optional `.` and optional exponent `e|E[+|-]digits`.
- d64 output format: scientific notation with trailing zeros trimmed (at least one digit after the dot).
- String literals support escapes: `\\`, `\"`, `\n`, `\t`.
- Comparison result: `0/1` in i64 mode, `0.0/1.0` in d64 mode.
- i64 `sqrt`: integer result (truncates toward zero). Negative input yields `0`.
- i64 `pow`: integer exponent. Negative exponent yields `0`.
- d64 `min/max`: if either operand is NaN, result is NaN. `inf` compares greater than all finite values.
- `abs(x)` returns the absolute value of `x`.
- d64 only: `sin`, `cos`, `tan`, `pi` (calling them in i64 mode is a compile-time error).

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
