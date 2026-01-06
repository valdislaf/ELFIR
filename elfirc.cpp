#include <memory>
#include <cctype>
#include <cstdint>
#include <cstdlib>
#include <cstring>
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
    Comma,
    Equal,
    Star,
    Slash,
    Plus,
    Minus,
    EqEq,
    NotEq,
    Lt,
    Le,
    Gt,
    Ge,
};

struct Tok {
    TokKind kind{};
    std::string text;
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

        // numbers (integer or float literal)
        if (std::isdigit((unsigned char)c) || (c == '.' && i_ + 1 < s_.size() && std::isdigit((unsigned char)s_[i_ + 1]))) {
            size_t start = i_;
            while (i_ < s_.size() && std::isdigit((unsigned char)s_[i_])) i_++;
            if (i_ < s_.size() && s_[i_] == '.') {
                i_++;
                while (i_ < s_.size() && std::isdigit((unsigned char)s_[i_])) i_++;
            }
            if (i_ < s_.size() && (s_[i_] == 'e' || s_[i_] == 'E')) {
                size_t expPos = i_;
                i_++;
                if (i_ < s_.size() && (s_[i_] == '+' || s_[i_] == '-')) i_++;
                size_t expDigits = i_;
                while (i_ < s_.size() && std::isdigit((unsigned char)s_[i_])) i_++;
                if (expDigits == i_) {
                    throw Error("Invalid exponent at position " + std::to_string(expPos));
                }
            }
            t.text = s_.substr(start, i_ - start);
            t.kind = TokKind::Number;
            return t;
        }

        // operators and punctuators
        i_++;
        switch (c) {
            case '(': t.kind = TokKind::LParen; return t;
            case ')': t.kind = TokKind::RParen; return t;
            case '{': t.kind = TokKind::LBrace; return t;
            case '}': t.kind = TokKind::RBrace; return t;
            case ';': t.kind = TokKind::Semicolon; return t;
            case ',': t.kind = TokKind::Comma; return t;
            case '=':
                if (i_ < s_.size() && s_[i_] == '=') { i_++; t.kind = TokKind::EqEq; return t; }
                t.kind = TokKind::Equal; return t;
            case '*': t.kind = TokKind::Star;  return t;
            case '/': t.kind = TokKind::Slash; return t;
            case '+': t.kind = TokKind::Plus; return t;
            case '-': t.kind = TokKind::Minus; return t;
            case '!':
                if (i_ < s_.size() && s_[i_] == '=') { i_++; t.kind = TokKind::NotEq; return t; }
                throw Error(std::string("Unexpected character '") + c + "' at position " + std::to_string(t.pos));
            case '<':
                if (i_ < s_.size() && s_[i_] == '=') { i_++; t.kind = TokKind::Le; return t; }
                t.kind = TokKind::Lt; return t;
            case '>':
                if (i_ < s_.size() && s_[i_] == '=') { i_++; t.kind = TokKind::Ge; return t; }
                t.kind = TokKind::Gt; return t;
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
    enum class Kind { Num, Var, Add, Sub, Mul, Div, Cmp, And, Sqrt, Pow } kind;
    enum class CmpOp { Eq, Ne, Lt, Le, Gt, Ge } cmpOp;
    std::string numText;
    std::string var;
    std::unique_ptr<Expr> lhs, rhs;

    static std::unique_ptr<Expr> makeNum(std::string v) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Num; e->numText = std::move(v); return e;
    }
    static std::unique_ptr<Expr> makeVar(std::string n) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Var; e->var = std::move(n); return e;
    }
    static std::unique_ptr<Expr> makeMul(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Mul; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeDiv(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Div; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeAdd(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Add; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeSub(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Sub; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeCmp(CmpOp op, std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Cmp; e->cmpOp = op; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeAnd(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::And; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeSqrt(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Sqrt; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makePow(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Pow; e->lhs = std::move(a); e->rhs = std::move(b); return e;
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
            auto e = parseComparison();
            expect(TokKind::Semicolon, "Expected ';' after assignment");
            Stmt st;
            st.kind = Stmt::Kind::AutoAssign;
            st.name = var;
            st.expr = std::move(e);
            return st;
        }

        if (cur_.kind == TokKind::KwRet) {
            advance();
            auto e = parseComparison();
            expect(TokKind::Semicolon, "Expected ';' after ret expression");
            Stmt st;
            st.kind = Stmt::Kind::Ret;
            st.expr = std::move(e);
            return st;
        }

        throw Error("Expected statement ('auto' or 'ret') at position " + std::to_string(cur_.pos));
    }

    // primary := number | ident | '(' expr ')'
    std::unique_ptr<Expr> parsePrimary() {
        if (cur_.kind == TokKind::Number) {
            std::string v = cur_.text;
            advance();
            return Expr::makeNum(std::move(v));
        }
        if (cur_.kind == TokKind::Ident) {
            std::string n = cur_.text;
            advance();
            if (cur_.kind == TokKind::LParen) {
                advance();
                if (n == "sqrt") {
                    auto a = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after sqrt argument");
                    return Expr::makeSqrt(std::move(a));
                }
                if (n == "pow") {
                    auto a = parseComparison();
                    expect(TokKind::Comma, "Expected ',' after pow base");
                    auto b = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after pow exponent");
                    return Expr::makePow(std::move(a), std::move(b));
                }
                throw Error("Unknown function '" + n + "'");
            }
            return Expr::makeVar(n);
        }
        if (cur_.kind == TokKind::LParen) {
            advance();
            auto e = parseComparison();
            expect(TokKind::RParen, "Expected ')'");
            return e;
        }
        throw Error("Expected number, identifier, or '(' at position " + std::to_string(cur_.pos));
    }

    // unary := '-' unary | primary
    std::unique_ptr<Expr> parseUnary() {
        if (cur_.kind == TokKind::Minus) {
            advance();
            auto rhs = parseUnary();
            return Expr::makeSub(Expr::makeNum("0"), std::move(rhs));
        }
        return parsePrimary();
    }

    // term := unary { (*|/) unary }
    std::unique_ptr<Expr> parseTerm() {
        auto left = parseUnary();
        while (cur_.kind == TokKind::Star || cur_.kind == TokKind::Slash) {
            TokKind op = cur_.kind;
            advance();
            auto right = parseUnary();
            if (op == TokKind::Star) left = Expr::makeMul(std::move(left), std::move(right));
            else                    left = Expr::makeDiv(std::move(left), std::move(right));
        }
        return left;
    }

    // expr := term { (+|-) term }
    std::unique_ptr<Expr> parseExpr() {
        auto left = parseTerm();
        while (cur_.kind == TokKind::Plus || cur_.kind == TokKind::Minus) {
            TokKind op = cur_.kind;
            advance();
            auto right = parseTerm();
            if (op == TokKind::Plus) left = Expr::makeAdd(std::move(left), std::move(right));
            else                    left = Expr::makeSub(std::move(left), std::move(right));
        }
        return left;
    }

    static std::unique_ptr<Expr> cloneExpr(const std::unique_ptr<Expr>& e) {
        if (!e) return nullptr;
        auto out = std::make_unique<Expr>();
        out->kind = e->kind;
        out->cmpOp = e->cmpOp;
        out->numText = e->numText;
        out->var = e->var;
        out->lhs = cloneExpr(e->lhs);
        out->rhs = cloneExpr(e->rhs);
        return out;
    }

    static bool isCmpTok(TokKind k) {
        return k == TokKind::EqEq || k == TokKind::NotEq || k == TokKind::Lt ||
               k == TokKind::Le || k == TokKind::Gt || k == TokKind::Ge;
    }

    static Expr::CmpOp tokToCmpOp(TokKind k) {
        switch (k) {
            case TokKind::EqEq: return Expr::CmpOp::Eq;
            case TokKind::NotEq: return Expr::CmpOp::Ne;
            case TokKind::Lt: return Expr::CmpOp::Lt;
            case TokKind::Le: return Expr::CmpOp::Le;
            case TokKind::Gt: return Expr::CmpOp::Gt;
            case TokKind::Ge: return Expr::CmpOp::Ge;
            default: break;
        }
        throw Error("Internal: invalid comparison operator");
    }

    // comparison := expr ( (==|!=|<|<=|>|>=) expr )*
    std::unique_ptr<Expr> parseComparison() {
        auto left = parseExpr();
        if (!isCmpTok(cur_.kind)) return left;

        auto op = tokToCmpOp(cur_.kind);
        advance();
        auto right = parseExpr();
        auto result = Expr::makeCmp(op, std::move(left), cloneExpr(right));
        auto prev = std::move(right);

        while (isCmpTok(cur_.kind)) {
            op = tokToCmpOp(cur_.kind);
            advance();
            auto next = parseExpr();
            auto cmp = Expr::makeCmp(op, cloneExpr(prev), cloneExpr(next));
            result = Expr::makeAnd(std::move(result), std::move(cmp));
            prev = std::move(next);
        }

        return result;
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

enum class Mode { I64, D64 };

static int64_t parseI64Literal(const std::string& text) {
    if (text.find_first_of(".eE") != std::string::npos) {
        throw Error("Expected integer literal, got '" + text + "'");
    }
    try {
        long long v = std::stoll(text);
        return (int64_t)v;
    } catch (...) {
        throw Error("Number literal out of range: '" + text + "'");
    }
}

static double parseF64Literal(const std::string& text) {
    const char* start = text.c_str();
    char* end = nullptr;
    double v = std::strtod(start, &end);
    if (end != start + text.size()) {
        throw Error("Invalid floating literal: '" + text + "'");
    }
    return v;
}

static uint64_t f64ToBits(double v) {
    uint64_t bits = 0;
    std::memcpy(&bits, &v, sizeof(bits));
    return bits;
}

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

static void emitExprI64(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId) {
    using K = Expr::Kind;
    switch (e.kind) {
        case K::Num:
            out << "    mov  rax, " << parseI64Literal(e.numText) << "\n";
            return;
        case K::Var: {
            int slot = cg.getSlot(e.var);
            out << "    mov  rax, [rbp-" << CodegenCtx::slotDisp(slot) << "]\n";
            return;
        }
        case K::Mul:
            emitExprI64(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprI64(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    imul rax, rcx\n"; // rax = rhs * lhs
            return;
        case K::Div:
            emitExprI64(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprI64(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";        // rcx = lhs, rax = rhs
            out << "    xchg rax, rcx\n";   // rax = lhs, rcx = rhs (divisor)
            out << "    cqo\n";             // sign-extend rax -> rdx:rax
            out << "    idiv rcx\n";        // rax = lhs / rhs, rdx = lhs % rhs
            return;
        case K::Add:
            // Evaluate lhs into rax, push, evaluate rhs into rax, pop rcx, add rax, rcx
            emitExprI64(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprI64(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    add  rax, rcx\n";
            return;
        case K::Sub:
            // Evaluate lhs into rax, push, evaluate rhs into rax, pop rcx, compute (lhs - rhs) into rax
            emitExprI64(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprI64(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";        // rcx = lhs, rax = rhs
            out << "    sub  rcx, rax\n";   // rcx = lhs - rhs
            out << "    mov  rax, rcx\n";   // rax = result
            return;
        case K::Cmp: {
            emitExprI64(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprI64(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    cmp  rcx, rax\n";
            switch (e.cmpOp) {
                case Expr::CmpOp::Eq: out << "    sete al\n"; break;
                case Expr::CmpOp::Ne: out << "    setne al\n"; break;
                case Expr::CmpOp::Lt: out << "    setl al\n"; break;
                case Expr::CmpOp::Le: out << "    setle al\n"; break;
                case Expr::CmpOp::Gt: out << "    setg al\n"; break;
                case Expr::CmpOp::Ge: out << "    setge al\n"; break;
            }
            out << "    movzx eax, al\n";
            return;
        }
        case K::And:
            emitExprI64(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprI64(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    and  rax, rcx\n";
            return;
        case K::Sqrt: {
            int id = labelId++;
            emitExprI64(out, cg, *e.lhs, labelId);
            out << "    cmp  rax, 0\n";
            out << "    jl   .isqrt_neg_" << id << "\n";
            out << "    cvtsi2sd xmm0, rax\n";
            out << "    sqrtsd xmm0, xmm0\n";
            out << "    cvttsd2si rax, xmm0\n";
            out << "    jmp  .isqrt_done_" << id << "\n";
            out << ".isqrt_neg_" << id << ":\n";
            out << "    xor  eax, eax\n";
            out << ".isqrt_done_" << id << ":\n";
            return;
        }
        case K::Pow: {
            int id = labelId++;
            emitExprI64(out, cg, *e.lhs, labelId);
            out << "    mov  r8, rax\n";
            emitExprI64(out, cg, *e.rhs, labelId);
            out << "    mov  r9, rax\n";
            out << "    mov  rax, 1\n";
            out << "    cmp  r9, 0\n";
            out << "    jl   .ipow_neg_" << id << "\n";
            out << "    je   .ipow_done_" << id << "\n";
            out << ".ipow_loop_" << id << ":\n";
            out << "    test r9, 1\n";
            out << "    jz   .ipow_skip_" << id << "\n";
            out << "    imul rax, r8\n";
            out << ".ipow_skip_" << id << ":\n";
            out << "    imul r8, r8\n";
            out << "    shr  r9, 1\n";
            out << "    jne  .ipow_loop_" << id << "\n";
            out << "    jmp  .ipow_done_" << id << "\n";
            out << ".ipow_neg_" << id << ":\n";
            out << "    xor  eax, eax\n";
            out << ".ipow_done_" << id << ":\n";
            return;
        }

    }
    throw Error("Internal: unknown expr kind");
}

static void emitExprD64(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId) {
    using K = Expr::Kind;
    switch (e.kind) {
        case K::Num: {
            uint64_t bits = f64ToBits(parseF64Literal(e.numText));
            out << "    mov  rax, 0x" << std::hex << bits << std::dec << "\n";
            out << "    movq xmm0, rax\n";
            return;
        }
        case K::Var: {
            int slot = cg.getSlot(e.var);
            out << "    movsd xmm0, [rbp-" << CodegenCtx::slotDisp(slot) << "]\n";
            return;
        }
        case K::Mul:
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
            emitExprD64(out, cg, *e.rhs, labelId);
            out << "    movsd xmm1, [rsp]\n";
            out << "    add  rsp, 8\n";
            out << "    mulsd xmm0, xmm1\n";
            return;
        case K::Div:
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
            emitExprD64(out, cg, *e.rhs, labelId);
            out << "    movsd xmm1, [rsp]\n";
            out << "    add  rsp, 8\n";
            out << "    divsd xmm1, xmm0\n";
            out << "    movapd xmm0, xmm1\n";
            return;
        case K::Add:
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
            emitExprD64(out, cg, *e.rhs, labelId);
            out << "    movsd xmm1, [rsp]\n";
            out << "    add  rsp, 8\n";
            out << "    addsd xmm0, xmm1\n";
            return;
        case K::Sub:
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
            emitExprD64(out, cg, *e.rhs, labelId);
            out << "    movsd xmm1, [rsp]\n";
            out << "    add  rsp, 8\n";
            out << "    subsd xmm1, xmm0\n";
            out << "    movapd xmm0, xmm1\n";
            return;
        case K::Cmp: {
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
            emitExprD64(out, cg, *e.rhs, labelId);
            out << "    movsd xmm1, [rsp]\n";
            out << "    add  rsp, 8\n";
            out << "    ucomisd xmm1, xmm0\n";
            switch (e.cmpOp) {
                case Expr::CmpOp::Eq:
                    out << "    sete al\n";
                    out << "    setnp dl\n";
                    out << "    and  al, dl\n";
                    break;
                case Expr::CmpOp::Ne:
                    out << "    setne al\n";
                    out << "    setp dl\n";
                    out << "    or   al, dl\n";
                    break;
                case Expr::CmpOp::Lt:
                    out << "    setb al\n";
                    out << "    setnp dl\n";
                    out << "    and  al, dl\n";
                    break;
                case Expr::CmpOp::Le:
                    out << "    setbe al\n";
                    out << "    setnp dl\n";
                    out << "    and  al, dl\n";
                    break;
                case Expr::CmpOp::Gt:
                    out << "    seta al\n";
                    out << "    setnp dl\n";
                    out << "    and  al, dl\n";
                    break;
                case Expr::CmpOp::Ge:
                    out << "    setae al\n";
                    out << "    setnp dl\n";
                    out << "    and  al, dl\n";
                    break;
            }
            out << "    movzx eax, al\n";
            out << "    cvtsi2sd xmm0, eax\n";
            return;
        }
        case K::And:
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
            emitExprD64(out, cg, *e.rhs, labelId);
            out << "    movsd xmm1, [rsp]\n";
            out << "    add  rsp, 8\n";
            out << "    mulsd xmm0, xmm1\n";
            return;
        case K::Sqrt:
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sqrtsd xmm0, xmm0\n";
            return;
        case K::Pow:
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 16\n";
            out << "    movsd [rsp], xmm0\n";
            emitExprD64(out, cg, *e.rhs, labelId);
            out << "    movsd [rsp+8], xmm0\n";
            out << "    fld  qword [rsp+8]\n";
            out << "    fld  qword [rsp]\n";
            out << "    fyl2x\n";
            out << "    fld  st0\n";
            out << "    frndint\n";
            out << "    fsub st1, st0\n";
            out << "    fxch st1\n";
            out << "    f2xm1\n";
            out << "    fld1\n";
            out << "    faddp st1, st0\n";
            out << "    fscale\n";
            out << "    fstp st1\n";
            out << "    fstp qword [rsp]\n";
            out << "    movsd xmm0, [rsp]\n";
            out << "    add  rsp, 16\n";
            return;
    }
    throw Error("Internal: unknown expr kind");
}

static std::string genFunctionAsm(const Func& f, Mode mode) {
    // v0: generate body for entrypoint only
    CodegenCtx cg;
    bool hasRet = false;

    // First pass: allocate slots on first encounter of auto
    // Second pass: emit with known slots (but we can allocate during emit too since we emit sequentially)
    // We'll do sequential allocation.

    std::ostringstream body;

    int labelId = 0;
    for (const auto& st : f.body) {
        if (st.kind == Stmt::Kind::AutoAssign) {
            int slot = cg.allocSlot(st.name);
            if (mode == Mode::D64) {
                emitExprD64(body, cg, *st.expr, labelId);
                body << "    movsd [rbp-" << CodegenCtx::slotDisp(slot) << "], xmm0\n";
            } else {
                emitExprI64(body, cg, *st.expr, labelId);
                body << "    mov  [rbp-" << CodegenCtx::slotDisp(slot) << "], rax\n";
            }
        } else { // Ret
            if (mode == Mode::D64) {
                emitExprD64(body, cg, *st.expr, labelId);
            } else {
                emitExprI64(body, cg, *st.expr, labelId);
            }
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

enum class EntryKind { Main, MainI64, MainD64 };

static std::string genOutAsm(const Func& entry, EntryKind kind) {
    std::ostringstream out;
    const bool isMainI64 = (kind == EntryKind::MainI64);
    const bool isMainD64 = (kind == EntryKind::MainD64);
    const Mode mode = isMainD64 ? Mode::D64 : Mode::I64;

    out << "global _start\n";
    out << "global " << entry.name << "\n\n";

    out << "extern rt_exit\n";
    if (isMainI64) out << "extern rt_print_i64\n";
    if (isMainD64) out << "extern rt_print_f64\n";
    out << "\nsection .text\n\n";

    out << genFunctionAsm(entry, mode) << "\n";

    out << "_start:\n";
    out << "    and  rsp, -16\n";
    out << "    call " << entry.name << "\n";

    if (isMainD64) {
        out << "    call rt_print_f64\n";
        out << "    xor  edi, edi\n";
        out << "    jmp  rt_exit\n";
    } else if (isMainI64) {
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
        int mainD64Idx = -1;

		for (int i = 0; i < (int)funcs.size(); ++i) {
			if (funcs[i].name == "main") mainIdx = i;
			else if (funcs[i].name == "main_i64") mainI64Idx = i;
            else if (funcs[i].name == "main_d64") mainD64Idx = i;
		}

        const int count = (mainIdx != -1) + (mainI64Idx != -1) + (mainD64Idx != -1);
		if (count > 1) {
			throw Error("Multiple entrypoints: only one of 'main', 'main_i64', 'main_d64' is allowed.");
		}
		if (count == 0) {
			throw Error("Missing entrypoint: define one of 'fn main() { ... }', 'fn main_i64() { ... }', or 'fn main_d64() { ... }'.");
		}

        EntryKind kind = EntryKind::Main;
        int entryIdx = mainIdx;
        if (mainI64Idx != -1) {
            kind = EntryKind::MainI64;
            entryIdx = mainI64Idx;
        } else if (mainD64Idx != -1) {
            kind = EntryKind::MainD64;
            entryIdx = mainD64Idx;
        }

		const Func& entry = funcs[entryIdx];

        std::string asmText = genOutAsm(entry, kind);
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
