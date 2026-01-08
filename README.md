ELFIR (v0.1) — Minimal Compiler + Runtime (Linux x86-64)

ELFIR is an experimental micro-language and compiler that translates `*.elfir` source into NASM assembly, then links to a native ELF executable for Linux x86-64 (SysV ABI). The v0 goal is maximum simplicity and determinism:

- `main_i64` is integer-only (i64/u*), `main_d64` is d64-only; `main` allows both with explicit types
- no libc, only Linux syscalls
- a small, explicit runtime

## v0.1 Entry Points

Exactly one entry point must be defined:

- `main()` returns an i64 exit code. No automatic printing.
- `main_i64()` returns an i64 that is printed to stdout, then exits with code 0.
- `main_d64()` returns a d64 that is printed to stdout (hybrid fixed/scientific), then exits with code 0.

Defining more than one is a compile-time error.

## Repository Contents

- `elfirc.cpp` — ELFIR v0 compiler (`*.elfir` → `out.asm`)
- `runtime.asm` — minimal syscall-based runtime:
  - `rt_exit`
- `rt_write`
- `rt_print_i64` (prints signed i64 + newline)
- `rt_print_u64` (prints unsigned u64 + newline)
- `rt_print_hex_u64` (prints unsigned u64 in hex + newline)
- `rt_print_f64` (prints d64 in hybrid fixed/scientific + newline)
- `rt_str_concat` (concatenates two strings, returns new string)
- `rt_str_copy` (copies a string into a new buffer)
- `rt_str_free` (frees a dynamic string buffer)
- `test.elfir` — main example program (used by `Makefile`)
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
./elfirc test.elfir out.asm
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
... (see current behavior in test.elfir)
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
- `i64/u8/u16/u32/u64 x = <expr>;`, `d64 x = <expr>;`, and `str x = "..."` declare typed variables (required in `main` for numeric).
- Functions:
  - `fn i64/u8/u16/u32/u64 foo(...)`, `fn d64 foo(...)`, `fn str foo(...)` are typed functions.
  - `fn foo(...) { ... }` or `void fn foo(...) { ... }` are void functions.
  - Parameters are typed (`i64`, `u8/u16/u32/u64`, `d64`, `str`) and passed by value.
  - `ret <expr>;` is required in non-void functions; `ret;` is allowed in void functions.
- `print_i64(<expr>);` prints i64, `print_d64(<expr>);` prints d64, `print_hex(<expr>);` prints unsigned hex with `0x` prefix, `print_str(<str>);` prints a string.
- `print(<expr or "str">, ...);` prints each argument in order (string literal/str var or integer/d64 expression).
- `print_i64/print_d64/print_str` do not add a newline; use `\n` inside strings when needed.
- `print_i64` is only allowed in `main`/`main_i64`; `print_d64` only in `main`/`main_d64`.
- `print_hex` is allowed in `main`/`main_i64` and only accepts unsigned expressions.
- Function calls: `foo(a, b)` can be used in expressions; `foo(...);` is allowed for void functions.
- `ret <expr>;` returns the expression value in `rax` (i64), `xmm0` (d64), or `rax`+`rdx` (str).
- `ret;` returns from void functions.
- `if (<expr>) { ... } [elseif (<expr>) { ... }]* [else { ... }]` with numeric conditions (nonzero is true).
- `while (<expr>) { ... }` repeats while condition is nonzero.
- `for (<init>, <cond>, <step>) { ... }` or `for (<init>; <cond>; <step>) { ... }` with commas or semicolons; `<init>` is `auto` or integer/d64 declaration.
- `break;` exits the nearest loop, `continue;` jumps to the next iteration.
- `<name> = <expr>;` assigns to an existing variable (str assignment is allowed for literals/str vars).
- `<name> += <expr>;`, `<name> -= <expr>;`, `<name> *= <expr>;`, `<name> /= <expr>;` for numeric types; `str` supports `=` and `+=` only.
- Operators: `+`, `-`, `*`, `/`, `%`, `<<`, `>>`, `&`, `^`, `|`, `~` with standard precedence and left associativity.
- `%` is remainder for integers (signed/unsigned) / fmod-style remainder (d64).
- Bitwise ops are integer-only; `>>` is arithmetic for i64 and logical for u*.
- Comparisons: `==`, `!=`, `<`, `<=`, `>`, `>=` (lower precedence than arithmetic).
- Builtins: `sqrt(x)`, `pow(x, y)`, `min(x, y)`, `max(x, y)`, `abs(x)`, `sin(x)`, `cos(x)`, `tan(x)`.
- Unary minus is supported: `-x` is parsed as `0 - x`.
- `()` can be used to group expressions.
- Integer literals: decimal digits only (default i64). Hex literals: `0x...` (default u64, `_` separators allowed). A leading `-` is parsed as unary minus.
- Explicit integer casts: `i64(x)`, `u8(x)`, `u16(x)`, `u32(x)`, `u64(x)` with wrap semantics (mod 2^N for u*).
- Signed/unsigned mixing is a type error; implicit widening is allowed only among unsigned types.
- Floating literals (d64 mode): digits with optional `.` and optional exponent `e|E[+|-]digits`.
- d64 output format: fixed within [1e-17, 1e18), otherwise scientific; trailing zeros trimmed (at least one digit after the dot).
- String literals support escapes: `\\`, `\"`, `\n`, `\t`.
- `str` supports `=` and `+=` (concatenation). No comparisons or numeric formatting yet.
- `+=` allocates a new buffer at runtime; reassignment frees the old dynamic buffer. Dynamic strings are freed on `ret`.
- Comparison result: `0/1` for integer expressions, `0.0/1.0` in d64 expressions.
- i64 `sqrt`: integer result (truncates toward zero). Negative input yields `0`.
- i64 `pow`: integer exponent. Negative exponent yields `0`.
- d64 `min/max`: if either operand is NaN, result is NaN. `inf` compares greater than all finite values.
- `abs(x)` returns the absolute value of `x`.
- d64 only: `sin`, `cos`, `tan`, `pi` (calling them in i64 mode is a compile-time error).

Unsigned types are explicit; there are no implicit signed/unsigned casts.

## Design Goals

- explicit signed/unsigned separation with narrow integer sizes
- strict, explicit entry point rules
- predictable code generation
- minimal runtime
- no hidden behavior

## Planned Extensions (Ideas)

- `print <expr>;` inside function bodies
- multiple functions and function calls
