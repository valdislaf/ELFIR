ELFIR Language Specification (v0)

This document defines the ELFIR language syntax and semantics as implemented by `elfirc.cpp`.
There is no bytecode format; the compiler emits x86-64 NASM assembly.

1) Lexical

- Source is UTF-8 text; only ASCII keywords/symbols are used.
- Whitespace is ignored. There are no comments in v0.
- Identifiers: `[A-Za-z_][A-Za-z0-9_]*`.
- Keywords:
  fn, auto, ret, i64, d64, str, void, u8, u16, u32, u64, ptr, if, else, elseif,
  while, for, break, continue, null, extern
- Builtin function names (not keywords):
  print, print_i64, print_d64, print_str, print_hex,
  sqrt, pow, min, max, abs, sin, cos, tan, pi,
  byte_add, volatile_load, volatile_store,
  barrier_full, barrier_load, barrier_store,
  in8, in16, in32, out8, out16, out32,
  asm0, asm1

Literals:
- Integer literal (decimal): digits only, e.g. `123`.
- Integer literal (hex): `0x` or `0X` + hex digits, `_` separators allowed, e.g. `0xFFFF_FFF0`.
- Float literal: digits with optional `.` and optional exponent `e|E[+|-]digits`.
- String literal: double quotes with escapes `\\`, `\"`, `\n`, `\t`.

2) Types

Numeric:
- Signed: `i64` (64-bit).
- Unsigned: `u8`, `u16`, `u32`, `u64` (8/16/32/64-bit).
- Float: `d64` (IEEE-754 double).

Pointers:
- `ptr<T>` where `T` in {u8,u16,u32,u64,i64,d64}. Pointer size is 64-bit.
- `null` is a literal used in pointer context.

Strings:
- `str` is a (ptr,len) string.

Void:
- `void` for no return.

Sizes:
- u8:1, u16:2, u32:4, u64/i64/d64:8 bytes.

3) Grammar (informal)

program    := (function | extern_fn)*
function   := ("void" "fn" | "fn") [ret_type] ident "(" params? ")" "{" stmt* "}"
extern_fn  := "extern" ("void" "fn" | "fn") [ret_type] ident "(" params? ")" ";"
ret_type   := type
params     := param ("," param)*
param      := type ident
type       := i64 | d64 | str | u8 | u16 | u32 | u64 | ptr "<" base_type ">"
base_type  := i64 | d64 | u8 | u16 | u32 | u64

stmt :=
  "auto" ident "=" expr ";"
| type ident "=" expr ";"
| ident assign_op expr ";"
| "*" expr "=" expr ";"
| "volatile_store" "(" expr "," expr ")" ";"
| "asm0" "(" string ")" ";"
| "asm1" "(" string "," expr ")" ";"
| "barrier_full" "(" ")" ";"
| "barrier_load" "(" ")" ";"
| "barrier_store" "(" ")" ";"
| "ret" [expr] ";"
| "print" "(" expr ("," expr)* ")" ";"
| "print_i64" "(" expr ")" ";"
| "print_d64" "(" expr ")" ";"
| "print_str" "(" expr ")" ";"
| "print_hex" "(" expr ")" ";"
| "if" "(" expr ")" block ("elseif" "(" expr ")" block)* ["else" block]
| "while" "(" expr ")" block
| "for" "(" init (","|";") cond (","|";") step ")" block
| "break" ";"
| "continue" ";"
| expr ";"  (only allowed for void calls)

block := "{" stmt* "}"
init  := "auto" ident "=" expr | type ident "=" expr
cond  := expr
step  := ident assign_op expr
assign_op := "=" | "+=" | "-=" | "*=" | "/="

expr precedence (highest to lowest):
  unary:   "!" "-" "~" "*" "&"
  mul:     "*" "/" "%"
  add:     "+" "-"
  shift:   "<<" ">>"
  bitand:  "&"
  bitxor:  "^"
  bitor:   "|"
  cmp:     "==" "!=" "<" "<=" ">" ">="
  land:    "&&"
  lor:     "||"

Primary:
- number | string | ident | "(" expr ")" | cast | call | null
- cast: type "(" expr ")"
- call: ident "(" args? ")"

4) Semantics

Entry points:
- Hosted mode (default): exactly one of `fn main()`, `fn main_i64()`, `fn main_d64()`.
- `main` returns i64 and is used as exit code (no automatic printing).
- `main_i64` returns i64 and is printed to stdout.
- `main_d64` returns d64 and is printed to stdout (hybrid format).
- Freestanding mode (`--freestanding`): entrypoint is `fn _start()` (void, no automatic printing or exit).
- Entrypoints cannot have parameters.

auto:
- `auto` is i64 in `main_i64`, d64 in `main_d64`.
- `auto` is not allowed in `main` or `_start`.

Integer literals:
- Decimal literals default to i64 unless context requires u*.
- Hex literals default to u64.
- Implicit narrowing is allowed only for unsigned literals when the value fits.
- No implicit signed/unsigned conversions.

Casts:
- Integer casts: i64/u8/u16/u32/u64, wrap for u* (mod 2^N).
- ptr<T>(u64) is allowed. u64(ptr) is allowed.
- Casting d64 is not supported.

Pointers:
- `&var` allowed only on local numeric variables.
- `*p` loads; `*p = v;` stores.
- `p + n` / `p - n` scale by sizeof(T).
- `byte_add(p, n)` adds raw bytes.
- `null` may be assigned to any pointer, and compared with ==/!=.

Volatile / barriers:
- `volatile_load(p)` / `volatile_store(p, v)` emit real memory ops for integer pointers.
- `barrier_full/load/store` map to `mfence/lfence/sfence`.

Port I/O:
- `in8/16/32(u16 port)`; `out8/16/32(u16 port, u8/u16/u32 value)`.

Mini-asm:
- `asm0("cli"|"sti"|"hlt"|"nop"|"pause")`.
- `asm1("lidt", ptr<u8>)` emits `lidt [rax]` with address in `rax`.

Strings:
- `str` is (ptr,len). Literals are static. Dynamic concatenation allocates.
- `str` supports `=` and `+=` only.
- Owned strings use negative length internally; owned buffers are freed on `ret`.

Printing:
- `print_i64` is allowed in mixed/i64 code; `print_d64` in mixed/d64 code.
- `print_hex` accepts only unsigned expressions.

Functions:
- Non-void functions must contain at least one `ret <expr>;` (compile-time error otherwise).
- `for` init is limited to `auto` or an explicit type declaration (no assignments).
- `extern fn` declares a function signature without a body; it must be provided by linked objects.

Comparisons / logic:
- Integer comparisons return 0/1 (i64).
- d64 comparisons return 0.0/1.0 (d64).
- Pointer comparisons only allow == and !=, and require same element type (or null).
- Logical operators `&&`, `||`, `!` are integer-only and return 0/1 (no short-circuit).

5) ABI / Code Generation

Calling convention (custom stack-based):
- Args pushed right-to-left.
- For ptr/u64/i64/u32/u16/u8: 8 bytes on stack (zero-extended for unsigned).
- For d64: 8 bytes on stack.
- For str: push len (8) then ptr (8).
- Callee reads args from `[rbp+16]` upward and stores into local slots.
- Return values:
  - i64/u*: rax
  - d64: xmm0
  - str: rax=ptr, rdx=len (negative length means owned)
  - ptr<T>: rax

Registers:
- rax used as primary integer result/temporary.
- xmm0 used for d64 results.

6) Runtime / Output

- `rt_print_i64`, `rt_print_u64`, `rt_print_f64` for main entry output.
- `print` family uses raw-print routines (`rt_print_*_raw`).
- d64 printing: fixed within [1e-17,1e18), scientific otherwise; trimmed zeros.

7) Limitations (v0)

- No arrays or structs.
- No comments.
- No global variables.
- No bounds checks or pointer safety.
- No d64 in volatile_load/store.
- Privileged instructions (in/out/cli/sti/hlt/lidt) are not safe in user-space.
