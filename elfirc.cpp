#include <memory>
#include <cctype>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>

struct Error : std::runtime_error {
    using std::runtime_error::runtime_error;
};

enum class TokKind {
    End,
    Ident,
    Number,

    KwFn,
    KwAuto,
    KwRet,

    LParen, RParen,
    LBrace, RBrace,
    Semicolon,
    Equal,
    Plus,
};

struct Tok {
    TokKind kind{};
    std::string text;
    int64_t number = 0;
    size_t pos = 0;
};

class Lexer {
public:
    explicit Lexer(std::string src) : s_(std::move(src)) {}

    Tok next() {
        skip_ws();

        Tok t;
        t.pos = i_;

        if (i_ >= s_.size()) {
            t.kind = TokKind::End;
            return t;
        }

        char c = s_[i_];

        // identifiers / keywords
        if (std::isalpha((unsigned char)c) || c == '_') {
            size_t start = i_;
            while (i_ < s_.size()) {
                char ch = s_[i_];
                if (std::isalnum((unsigned char)ch) || ch == '_') i_++;
                else break;
            }
            t.text = s_.substr(start, i_ - start);
            if (t.text == "fn") t.kind = TokKind::KwFn;
            else if (t.text == "auto") t.kind = TokKind::KwAuto;
            else if (t.text == "ret") t.kind = TokKind::KwRet;
            else t.kind = TokKind::Ident;
            return t;
        }

        // numbers (only decimal, optional leading minus NOT supported in v0)
        if (std::isdigit((unsigned char)c)) {
            size_t start = i_;
            while (i_ < s_.size() && std::isdigit((unsigned char)s_[i_])) i_++;
            t.text = s_.substr(start, i_ - start);
            // parse to int64
            try {
                long long v = std::stoll(t.text);
                t.number = (int64_t)v;
            } catch (...) {
                throw Error("Number literal out of range at position " + std::to_string(start));
            }
            t.kind = TokKind::Number;
            return t;
        }

        // single-char tokens
        i_++;
        switch (c) {
            case '(': t.kind = TokKind::LParen; return t;
            case ')': t.kind = TokKind::RParen; return t;
            case '{': t.kind = TokKind::LBrace; return t;
            case '}': t.kind = TokKind::RBrace; return t;
            case ';': t.kind = TokKind::Semicolon; return t;
            case '=': t.kind = TokKind::Equal; return t;
            case '+': t.kind = TokKind::Plus; return t;
            default:
                throw Error(std::string("Unexpected character '") + c + "' at position " + std::to_string(t.pos));
        }
    }

private:
    void skip_ws() {
        while (i_ < s_.size()) {
            char c = s_[i_];
            if (std::isspace((unsigned char)c)) { i_++; continue; }
            // v0: no comments. (Можно добавить позже.)
            break;
        }
    }

    std::string s_;
    size_t i_ = 0;
};

// AST (минимально)
struct Expr {
    enum class Kind { Num, Var, Add } kind;
    int64_t num = 0;
    std::string var;
    std::unique_ptr<Expr> lhs, rhs;

    static std::unique_ptr<Expr> makeNum(int64_t v) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Num; e->num = v; return e;
    }
    static std::unique_ptr<Expr> makeVar(std::string n) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Var; e->var = std::move(n); return e;
    }
    static std::unique_ptr<Expr> makeAdd(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Add; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
};

struct Stmt {
    enum class Kind { AutoAssign, Ret } kind;
    std::string name;             // for AutoAssign
    std::unique_ptr<Expr> expr;   // for both
};

struct Func {
    std::string name;
    std::vector<Stmt> body;
};

class Parser {
public:
    explicit Parser(Lexer lex) : lex_(std::move(lex)) { cur_ = lex_.next(); }

    std::vector<Func> parseProgram() {
        std::vector<Func> funcs;
        while (cur_.kind != TokKind::End) {
            funcs.push_back(parseFunction());
        }
        return funcs;
    }

private:
    Func parseFunction() {
        expect(TokKind::KwFn, "Expected 'fn'");
        std::string fname = expectIdent("Expected function name after 'fn'");
        expect(TokKind::LParen, "Expected '(' after function name");
        expect(TokKind::RParen, "Expected ')' after '(' (v0: no parameters)");
        expect(TokKind::LBrace, "Expected '{' to start function body");

        Func f;
        f.name = fname;

        while (cur_.kind != TokKind::RBrace) {
            if (cur_.kind == TokKind::End) {
                throw Error("Unexpected end of file: missing '}'");
            }
            f.body.push_back(parseStmt());
        }
        expect(TokKind::RBrace, "Expected '}' at end of function");
        return f;
    }

    Stmt parseStmt() {
        if (cur_.kind == TokKind::KwAuto) {
            advance();
            std::string var = expectIdent("Expected identifier after 'auto'");
            expect(TokKind::Equal, "Expected '=' after variable name");
            auto e = parseExpr();
            expect(TokKind::Semicolon, "Expected ';' after assignment");
            Stmt st;
            st.kind = Stmt::Kind::AutoAssign;
            st.name = var;
            st.expr = std::move(e);
            return st;
        }

        if (cur_.kind == TokKind::KwRet) {
            advance();
            auto e = parseExpr();
            expect(TokKind::Semicolon, "Expected ';' after ret expression");
            Stmt st;
            st.kind = Stmt::Kind::Ret;
            st.expr = std::move(e);
            return st;
        }

        throw Error("Expected statement ('auto' or 'ret') at position " + std::to_string(cur_.pos));
    }

    // expr := term { + term }
    std::unique_ptr<Expr> parseExpr() {
        auto left = parseTerm();
        while (cur_.kind == TokKind::Plus) {
            advance();
            auto right = parseTerm();
            left = Expr::makeAdd(std::move(left), std::move(right));
        }
        return left;
    }

    // term := number | ident
    std::unique_ptr<Expr> parseTerm() {
        if (cur_.kind == TokKind::Number) {
            int64_t v = cur_.number;
            advance();
            return Expr::makeNum(v);
        }
        if (cur_.kind == TokKind::Ident) {
            std::string n = cur_.text;
            advance();
            return Expr::makeVar(n);
        }
        throw Error("Expected number or identifier at position " + std::to_string(cur_.pos));
    }

    void advance() { cur_ = lex_.next(); }

    void expect(TokKind k, const char* msg) {
        if (cur_.kind != k) throw Error(std::string(msg) + " at position " + std::to_string(cur_.pos));
        advance();
    }

    std::string expectIdent(const char* msg) {
        if (cur_.kind != TokKind::Ident) throw Error(std::string(msg) + " at position " + std::to_string(cur_.pos));
        std::string s = cur_.text;
        advance();
        return s;
    }

    Lexer lex_;
    Tok cur_;
};

struct CodegenCtx {
    std::unordered_map<std::string, int> varToSlot; // slot index: 1 => [rbp-8], 2 => [rbp-16], ...
    int nextSlot = 1;
    int maxSlotUsed = 0;

    int allocSlot(const std::string& name) {
        if (varToSlot.contains(name)) {
            throw Error("Variable '" + name + "' already declared");
        }
        int slot = nextSlot++;
        varToSlot[name] = slot;
        if (slot > maxSlotUsed) maxSlotUsed = slot;
        return slot;
    }

    int getSlot(const std::string& name) const {
        auto it = varToSlot.find(name);
        if (it == varToSlot.end()) throw Error("Unknown variable '" + name + "'");
        return it->second;
    }

    static int slotDisp(int slot) { return slot * 8; } // [rbp-8*slot]
};

static std::string readFile(const std::string& path) {
    std::ifstream in(path, std::ios::binary);
    if (!in) throw Error("Cannot open input file: " + path);
    std::ostringstream ss;
    ss << in.rdbuf();
    return ss.str();
}

static void writeFile(const std::string& path, const std::string& content) {
    std::ofstream out(path, std::ios::binary);
    if (!out) throw Error("Cannot write output file: " + path);
    out << content;
}

static void emitExpr(std::ostringstream& out, CodegenCtx& cg, const Expr& e) {
    using K = Expr::Kind;
    switch (e.kind) {
        case K::Num:
            out << "    mov  rax, " << e.num << "\n";
            return;
        case K::Var: {
            int slot = cg.getSlot(e.var);
            out << "    mov  rax, [rbp-" << CodegenCtx::slotDisp(slot) << "]\n";
            return;
        }
        case K::Add:
            // Evaluate lhs into rax, push, evaluate rhs into rax, pop rcx, add rax, rcx
            emitExpr(out, cg, *e.lhs);
            out << "    push rax\n";
            emitExpr(out, cg, *e.rhs);
            out << "    pop  rcx\n";
            out << "    add  rax, rcx\n";
            return;
    }
    throw Error("Internal: unknown expr kind");
}

static std::string genFunctionAsm(const Func& f) {
    // v0: generate body for entrypoint only
    CodegenCtx cg;
    bool hasRet = false;

    // First pass: allocate slots on first encounter of auto
    // Second pass: emit with known slots (but we can allocate during emit too since we emit sequentially)
    // We'll do sequential allocation.

    std::ostringstream body;

    for (const auto& st : f.body) {
        if (st.kind == Stmt::Kind::AutoAssign) {
            int slot = cg.allocSlot(st.name);
            emitExpr(body, cg, *st.expr);
            body << "    mov  [rbp-" << CodegenCtx::slotDisp(slot) << "], rax\n";
        } else { // Ret
            emitExpr(body, cg, *st.expr);
            hasRet = true;
            body << "    leave\n";
            body << "    ret\n";
        }
    }

    if (!hasRet) {
        throw Error("Function '" + f.name + "' must contain 'ret <expr>;' in v0");
    }

    // stack size: maxSlotUsed*8, round up to 16 for alignment (after push rbp)
    int localBytes = cg.maxSlotUsed * 8;
    int rounded = (localBytes + 15) / 16 * 16; // 0,16,32,...

    std::ostringstream out;
    out << f.name << ":\n";
    out << "    push rbp\n";
    out << "    mov  rbp, rsp\n";
    if (rounded > 0) out << "    sub  rsp, " << rounded << "\n";
    out << body.str();
    return out.str();
}

static std::string genOutAsm(const Func& entry, bool isMainI64) {
    std::ostringstream out;

    out << "global _start\n";
    out << "global " << entry.name << "\n\n";

    out << "extern rt_exit\n";
    if (isMainI64) out << "extern rt_print_i64\n";
    out << "\nsection .text\n\n";

    out << genFunctionAsm(entry) << "\n";

    out << "_start:\n";
    out << "    and  rsp, -16\n";
    out << "    call " << entry.name << "\n";

    if (isMainI64) {
        out << "    mov  rdi, rax\n";
        out << "    call rt_print_i64\n";
        out << "    xor  edi, edi\n";
        out << "    jmp  rt_exit\n";
    } else {
        out << "    mov  rdi, rax\n";
        out << "    jmp  rt_exit\n";
    }

    return out.str();
}

int main(int argc, char** argv) {
    try {
        if (argc < 2) {
            std::cerr << "Usage: " << argv[0] << " <input.elfir> [out.asm]\n";
            return 2;
        }
        std::string inPath = argv[1];
        std::string outPath = (argc >= 3) ? argv[2] : "out.asm";

        std::string src = readFile(inPath);

        Parser p{Lexer(src)};
        auto funcs = p.parseProgram();

        int mainIdx = -1;
		int mainI64Idx = -1;

		for (int i = 0; i < (int)funcs.size(); ++i) {
			if (funcs[i].name == "main") mainIdx = i;
			else if (funcs[i].name == "main_i64") mainI64Idx = i;
		}

		if (mainIdx != -1 && mainI64Idx != -1) {
			throw Error("Multiple entrypoints: both 'main' and 'main_i64' are defined (v0 requires exactly one).");
		}
		if (mainIdx == -1 && mainI64Idx == -1) {
			throw Error("Missing entrypoint: define either 'fn main() { ... }' or 'fn main_i64() { ... }'.");
		}

		const bool isMainI64 = (mainI64Idx != -1);
		const Func& entry = funcs[ isMainI64 ? mainI64Idx : mainIdx ];


        std::string asmText = genOutAsm(entry, isMainI64);
        writeFile(outPath, asmText);

        std::cerr << "OK: generated " << outPath
                  << " (entrypoint: " << entry.name << ")\n";
        return 0;
    } catch (const Error& e) {
        std::cerr << "elfirc error: " << e.what() << "\n";
        return 1;
    } catch (const std::exception& e) {
        std::cerr << "fatal: " << e.what() << "\n";
        return 1;
    }
}
