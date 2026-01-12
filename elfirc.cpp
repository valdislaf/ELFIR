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
    String,

    KwFn,
    KwAuto,
    KwRet,
    KwI64,
    KwD64,
    KwStr,
    KwVoid,
    KwU8,
    KwU16,
    KwU32,
    KwU64,
    KwPtr,
    KwNull,
    KwIf,
    KwElse,
    KwElseIf,
    KwWhile,
    KwFor,
    KwBreak,
    KwContinue,
    KwExtern,

    LParen, RParen,
    LBrace, RBrace,
    Semicolon,
    Comma,
    Equal,
    PlusEq,
    MinusEq,
    StarEq,
    SlashEq,
    Star,
    Slash,
    Percent,
    Plus,
    Minus,
    EqEq,
    NotEq,
    Lt,
    Le,
    Gt,
    Ge,
    Amp,
    Pipe,
    AndAnd,
    OrOr,
    Caret,
    Tilde,
    Bang,
    Shl,
    Shr,
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
            else if (t.text == "i64") t.kind = TokKind::KwI64;
            else if (t.text == "d64") t.kind = TokKind::KwD64;
            else if (t.text == "str") t.kind = TokKind::KwStr;
            else if (t.text == "void") t.kind = TokKind::KwVoid;
            else if (t.text == "u8") t.kind = TokKind::KwU8;
            else if (t.text == "u16") t.kind = TokKind::KwU16;
            else if (t.text == "u32") t.kind = TokKind::KwU32;
            else if (t.text == "u64") t.kind = TokKind::KwU64;
            else if (t.text == "ptr") t.kind = TokKind::KwPtr;
            else if (t.text == "null") t.kind = TokKind::KwNull;
            else if (t.text == "if") t.kind = TokKind::KwIf;
            else if (t.text == "else") t.kind = TokKind::KwElse;
            else if (t.text == "elseif") t.kind = TokKind::KwElseIf;
            else if (t.text == "while") t.kind = TokKind::KwWhile;
            else if (t.text == "for") t.kind = TokKind::KwFor;
            else if (t.text == "break") t.kind = TokKind::KwBreak;
            else if (t.text == "continue") t.kind = TokKind::KwContinue;
            else if (t.text == "extern") t.kind = TokKind::KwExtern;
            else t.kind = TokKind::Ident;
            return t;
        }

        // numbers (integer, hex, or float literal)
        if (std::isdigit((unsigned char)c) || (c == '.' && i_ + 1 < s_.size() && std::isdigit((unsigned char)s_[i_ + 1]))) {
            size_t start = i_;
            if (c == '0' && i_ + 1 < s_.size() && (s_[i_ + 1] == 'x' || s_[i_ + 1] == 'X')) {
                i_ += 2;
                size_t digits = i_;
                while (i_ < s_.size()) {
                    char ch = s_[i_];
                    if (std::isxdigit((unsigned char)ch) || ch == '_') {
                        i_++;
                    } else {
                        break;
                    }
                }
                if (digits == i_) {
                    throw Error("Invalid hex literal at position " + std::to_string(start));
                }
                t.text = s_.substr(start, i_ - start);
                t.kind = TokKind::Number;
                return t;
            }
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

        // string literal
        if (c == '"') {
            i_++;
            std::string out;
            while (i_ < s_.size()) {
                char ch = s_[i_++];
                if (ch == '"') {
                    t.text = std::move(out);
                    t.kind = TokKind::String;
                    return t;
                }
                if (ch == '\\') {
                    if (i_ >= s_.size()) {
                        throw Error("Unterminated escape sequence at position " + std::to_string(t.pos));
                    }
                    char esc = s_[i_++];
                    switch (esc) {
                        case 'n': out.push_back('\n'); break;
                        case 't': out.push_back('\t'); break;
                        case '"': out.push_back('"'); break;
                        case '\\': out.push_back('\\'); break;
                        default:
                            throw Error("Unsupported escape sequence at position " + std::to_string(t.pos));
                    }
                } else {
                    out.push_back(ch);
                }
            }
            throw Error("Unterminated string literal at position " + std::to_string(t.pos));
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
            case '*':
                if (i_ < s_.size() && s_[i_] == '=') { i_++; t.kind = TokKind::StarEq; return t; }
                t.kind = TokKind::Star;  return t;
            case '/':
                if (i_ < s_.size() && s_[i_] == '=') { i_++; t.kind = TokKind::SlashEq; return t; }
                t.kind = TokKind::Slash; return t;
            case '%': t.kind = TokKind::Percent; return t;
            case '+':
                if (i_ < s_.size() && s_[i_] == '=') { i_++; t.kind = TokKind::PlusEq; return t; }
                t.kind = TokKind::Plus; return t;
            case '-':
                if (i_ < s_.size() && s_[i_] == '=') { i_++; t.kind = TokKind::MinusEq; return t; }
                t.kind = TokKind::Minus; return t;
            case '!':
                if (i_ < s_.size() && s_[i_] == '=') { i_++; t.kind = TokKind::NotEq; return t; }
                t.kind = TokKind::Bang; return t;
            case '<':
                if (i_ < s_.size() && s_[i_] == '=') { i_++; t.kind = TokKind::Le; return t; }
                if (i_ < s_.size() && s_[i_] == '<') { i_++; t.kind = TokKind::Shl; return t; }
                t.kind = TokKind::Lt; return t;
            case '>':
                if (i_ < s_.size() && s_[i_] == '=') { i_++; t.kind = TokKind::Ge; return t; }
                if (i_ < s_.size() && s_[i_] == '>') { i_++; t.kind = TokKind::Shr; return t; }
                t.kind = TokKind::Gt; return t;
            case '&':
                if (i_ < s_.size() && s_[i_] == '&') { i_++; t.kind = TokKind::AndAnd; return t; }
                t.kind = TokKind::Amp; return t;
            case '|':
                if (i_ < s_.size() && s_[i_] == '|') { i_++; t.kind = TokKind::OrOr; return t; }
                t.kind = TokKind::Pipe; return t;
            case '^': t.kind = TokKind::Caret; return t;
            case '~': t.kind = TokKind::Tilde; return t;
            default:
                throw Error(std::string("Unexpected character '") + c + "' at position " + std::to_string(t.pos));
        }
    }

private:
    void skip_ws() {
        while (i_ < s_.size()) {
            char c = s_[i_];
            if (std::isspace((unsigned char)c)) { i_++; continue; }
            if (c == '/' && i_ + 1 < s_.size()) {
                char n = s_[i_ + 1];
                if (n == '/') {
                    i_ += 2;
                    while (i_ < s_.size() && s_[i_] != '\n') i_++;
                    continue;
                }
                if (n == '*') {
                    size_t start = i_;
                    i_ += 2;
                    while (i_ + 1 < s_.size()) {
                        if (s_[i_] == '*' && s_[i_ + 1] == '/') {
                            i_ += 2;
                            break;
                        }
                        i_++;
                    }
                    if (i_ >= s_.size()) {
                        throw Error("Unterminated block comment at position " + std::to_string(start));
                    }
                    continue;
                }
            }
            break;
        }
    }

    std::string s_;
    size_t i_ = 0;
};

enum class Type { I64, D64, Str, Void, U8, U16, U32, U64, PtrU8, PtrU16, PtrU32, PtrU64, PtrI64, PtrD64 };
enum class Mode { I64Only, D64Only, Mixed };

static Type makePtrType(Type base);

// AST (минимально)
struct Expr {
    enum class Kind {
        Num,
        Str,
        Var,
        Call,
        Cast,
        AddrOf,
        Deref,
        PtrAddBytes,
        Null,
        VolatileLoad,
        In8,
        In16,
        In32,
        Add,
        Sub,
        Mul,
        Div,
        Mod,
        Shl,
        Shr,
        BitAnd,
        BitXor,
        BitOr,
        BitNot,
        Cmp,
        And,
        LogAnd,
        LogOr,
        Not,
        Sqrt,
        Pow,
        Min,
        Max,
        Abs,
        Sin,
        Cos,
        Tan
    } kind;
    enum class CmpOp { Eq, Ne, Lt, Le, Gt, Ge } cmpOp;
    Type castType = Type::I64;
    std::string numText;
    std::string strText;
    std::string var;
    std::string callName;
    std::vector<std::unique_ptr<Expr>> callArgs;
    std::unique_ptr<Expr> lhs, rhs;

    static std::unique_ptr<Expr> makeNum(std::string v) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Num; e->numText = std::move(v); return e;
    }
    static std::unique_ptr<Expr> makeStr(std::string v) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Str; e->strText = std::move(v); return e;
    }
    static std::unique_ptr<Expr> makeVar(std::string n) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Var; e->var = std::move(n); return e;
    }
    static std::unique_ptr<Expr> makeCall(std::string n, std::vector<std::unique_ptr<Expr>> args) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Call; e->callName = std::move(n); e->callArgs = std::move(args); return e;
    }
    static std::unique_ptr<Expr> makeCast(Type t, std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Cast; e->castType = t; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makeAddrOf(std::string n) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::AddrOf; e->var = std::move(n); return e;
    }
    static std::unique_ptr<Expr> makeDeref(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Deref; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makePtrAddBytes(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::PtrAddBytes; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeVolatileLoad(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::VolatileLoad; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makeIn8(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::In8; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makeIn16(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::In16; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makeIn32(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::In32; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makeNull() {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Null; return e;
    }
    static std::unique_ptr<Expr> makeMul(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Mul; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeDiv(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Div; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeMod(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Mod; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeShl(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Shl; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeShr(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Shr; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeBitAnd(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::BitAnd; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeBitXor(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::BitXor; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeBitOr(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::BitOr; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeBitNot(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::BitNot; e->lhs = std::move(a); return e;
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
    static std::unique_ptr<Expr> makeLogAnd(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::LogAnd; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeLogOr(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::LogOr; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeNot(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Not; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makeSqrt(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Sqrt; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makePow(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Pow; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeMin(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Min; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeMax(std::unique_ptr<Expr> a, std::unique_ptr<Expr> b) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Max; e->lhs = std::move(a); e->rhs = std::move(b); return e;
    }
    static std::unique_ptr<Expr> makeAbs(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Abs; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makeSin(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Sin; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makeCos(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Cos; e->lhs = std::move(a); return e;
    }
    static std::unique_ptr<Expr> makeTan(std::unique_ptr<Expr> a) {
        auto e = std::make_unique<Expr>();
        e->kind = Kind::Tan; e->lhs = std::move(a); return e;
    }
};

struct Stmt {
    struct IfBranch {
        std::unique_ptr<Expr> cond;
        std::vector<Stmt> body;
    };
    enum class AssignOp { Eq, AddEq, SubEq, MulEq, DivEq };
    enum class Kind { AutoAssign, TypedAssign, Assign, PtrStore, VolatileStore, Out8, Out16, Out32, Asm0, Asm1, BarrierFull, BarrierLoad, BarrierStore, Ret, PrintI64, PrintD64, PrintStr, PrintHex, PrintList, ExprStmt, If, While, For, Break, Continue } kind;
    Type declType = Type::I64;    // for TypedAssign
    std::string name;             // for AutoAssign
    std::unique_ptr<Expr> expr;   // for both
    std::unique_ptr<Expr> ptrExpr; // for PtrStore/VolatileStore
    std::unique_ptr<Expr> expr2;  // for Out*/Asm1
    std::vector<std::unique_ptr<Expr>> exprs; // for PrintList
    std::vector<IfBranch> ifBranches;
    std::unique_ptr<Expr> cond;
    std::vector<Stmt> body;
    std::unique_ptr<Stmt> init;
    std::unique_ptr<Stmt> step;
    AssignOp assignOp = AssignOp::Eq;
};

struct Param {
    Type type = Type::I64;
    std::string name;
};

struct Func {
    std::string name;
    Type retType = Type::Void;
    std::vector<Param> params;
    std::vector<Stmt> body;
    bool isExtern = false;
};

class Parser {
public:
    explicit Parser(Lexer lex) : lex_(std::move(lex)) {
        cur_ = lex_.next();
        next_ = lex_.next();
    }

    std::vector<Func> parseProgram() {
        std::vector<Func> funcs;
        while (cur_.kind != TokKind::End) {
            if (cur_.kind == TokKind::KwExtern) {
                funcs.push_back(parseExternFunction());
            } else {
                funcs.push_back(parseFunction());
            }
        }
        return funcs;
    }

private:
    Func parseExternFunction() {
        expect(TokKind::KwExtern, "Expected 'extern'");
        Type retType = Type::Void;
        if (cur_.kind == TokKind::KwVoid) {
            advance();
            expect(TokKind::KwFn, "Expected 'fn' after 'extern void'");
        } else {
            expect(TokKind::KwFn, "Expected 'fn' after 'extern'");
        }
        if (isTypeStart(cur_.kind)) {
            retType = parseType(true);
        }
        std::string fname = expectIdent("Expected function name after 'fn'");
        expect(TokKind::LParen, "Expected '(' after function name");
        std::vector<Param> params;
        if (cur_.kind != TokKind::RParen) {
            params.push_back(parseParam());
            while (cur_.kind == TokKind::Comma) {
                advance();
                params.push_back(parseParam());
            }
        }
        expect(TokKind::RParen, "Expected ')' after function parameters");
        expect(TokKind::Semicolon, "Expected ';' after extern declaration");
        Func f;
        f.name = fname;
        f.retType = retType;
        f.params = std::move(params);
        f.isExtern = true;
        return f;
    }

    Func parseFunction() {
        Type retType = Type::Void;
        if (cur_.kind == TokKind::KwVoid) {
            advance();
            expect(TokKind::KwFn, "Expected 'fn' after 'void'");
        } else {
            expect(TokKind::KwFn, "Expected 'fn'");
        }
        if (isTypeStart(cur_.kind)) {
            retType = parseType(true);
        }
        std::string fname = expectIdent("Expected function name after 'fn'");
        expect(TokKind::LParen, "Expected '(' after function name");
        std::vector<Param> params;
        if (cur_.kind != TokKind::RParen) {
            params.push_back(parseParam());
            while (cur_.kind == TokKind::Comma) {
                advance();
                params.push_back(parseParam());
            }
        }
        expect(TokKind::RParen, "Expected ')' after function parameters");
        expect(TokKind::LBrace, "Expected '{' to start function body");

        Func f;
        f.name = fname;
        f.retType = retType;
        f.params = std::move(params);

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
        if (cur_.kind == TokKind::KwIf) {
            return parseIfStmt();
        }
        if (cur_.kind == TokKind::KwWhile) {
            return parseWhileStmt();
        }
        if (cur_.kind == TokKind::KwFor) {
            return parseForStmt();
        }
        if (cur_.kind == TokKind::KwBreak) {
            advance();
            expect(TokKind::Semicolon, "Expected ';' after break");
            Stmt st;
            st.kind = Stmt::Kind::Break;
            return st;
        }
        if (cur_.kind == TokKind::KwContinue) {
            advance();
            expect(TokKind::Semicolon, "Expected ';' after continue");
            Stmt st;
            st.kind = Stmt::Kind::Continue;
            return st;
        }
        if (cur_.kind == TokKind::Ident && (cur_.text == "out8" || cur_.text == "out16" || cur_.text == "out32")) {
            std::string name = cur_.text;
            advance();
            expect(TokKind::LParen, "Expected '(' after out");
            auto p = parseComparison();
            expect(TokKind::Comma, "Expected ',' after out port");
            auto v = parseComparison();
            expect(TokKind::RParen, "Expected ')' after out args");
            expect(TokKind::Semicolon, "Expected ';' after out");
            Stmt st;
            if (name == "out8") st.kind = Stmt::Kind::Out8;
            else if (name == "out16") st.kind = Stmt::Kind::Out16;
            else st.kind = Stmt::Kind::Out32;
            st.expr = std::move(p);
            st.expr2 = std::move(v);
            return st;
        }
        if (cur_.kind == TokKind::Ident && cur_.text == "asm0") {
            advance();
            expect(TokKind::LParen, "Expected '(' after asm0");
            if (cur_.kind != TokKind::String) {
                throw Error("Expected string literal in asm0 at position " + std::to_string(cur_.pos));
            }
            std::string text = cur_.text;
            advance();
            expect(TokKind::RParen, "Expected ')' after asm0");
            expect(TokKind::Semicolon, "Expected ';' after asm0");
            Stmt st;
            st.kind = Stmt::Kind::Asm0;
            st.name = std::move(text);
            return st;
        }
        if (cur_.kind == TokKind::Ident && cur_.text == "asm1") {
            advance();
            expect(TokKind::LParen, "Expected '(' after asm1");
            if (cur_.kind != TokKind::String) {
                throw Error("Expected string literal in asm1 at position " + std::to_string(cur_.pos));
            }
            std::string text = cur_.text;
            advance();
            expect(TokKind::Comma, "Expected ',' after asm1 mnemonic");
            auto a = parseComparison();
            expect(TokKind::RParen, "Expected ')' after asm1");
            expect(TokKind::Semicolon, "Expected ';' after asm1");
            Stmt st;
            st.kind = Stmt::Kind::Asm1;
            st.name = std::move(text);
            st.expr = std::move(a);
            return st;
        }
        if (cur_.kind == TokKind::Ident && cur_.text == "volatile_store") {
            advance();
            expect(TokKind::LParen, "Expected '(' after volatile_store");
            auto p = parseComparison();
            expect(TokKind::Comma, "Expected ',' after volatile_store ptr");
            auto v = parseComparison();
            expect(TokKind::RParen, "Expected ')' after volatile_store args");
            expect(TokKind::Semicolon, "Expected ';' after volatile_store");
            Stmt st;
            st.kind = Stmt::Kind::VolatileStore;
            st.ptrExpr = std::move(p);
            st.expr = std::move(v);
            return st;
        }
        if (cur_.kind == TokKind::Ident &&
            (cur_.text == "barrier_full" || cur_.text == "barrier_load" || cur_.text == "barrier_store")) {
            std::string name = cur_.text;
            advance();
            expect(TokKind::LParen, "Expected '(' after barrier");
            expect(TokKind::RParen, "Expected ')' after barrier");
            expect(TokKind::Semicolon, "Expected ';' after barrier");
            Stmt st;
            if (name == "barrier_full") st.kind = Stmt::Kind::BarrierFull;
            else if (name == "barrier_load") st.kind = Stmt::Kind::BarrierLoad;
            else st.kind = Stmt::Kind::BarrierStore;
            return st;
        }
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

        if (cur_.kind == TokKind::Star) {
            advance();
            auto ptrExpr = parseUnary();
            expect(TokKind::Equal, "Expected '=' after pointer dereference");
            auto e = parseComparison();
            expect(TokKind::Semicolon, "Expected ';' after assignment");
            Stmt st;
            st.kind = Stmt::Kind::PtrStore;
            st.ptrExpr = std::move(ptrExpr);
            st.expr = std::move(e);
            return st;
        }

    if (isTypeStart(cur_.kind) && cur_.kind != TokKind::KwVoid) {
            Type t = parseType(false);
            std::string var = expectIdent("Expected identifier after type");
            expect(TokKind::Equal, "Expected '=' after variable name");
            auto e = parseComparison();
            expect(TokKind::Semicolon, "Expected ';' after assignment");
            Stmt st;
            st.kind = Stmt::Kind::TypedAssign;
            st.declType = t;
            st.name = var;
            st.expr = std::move(e);
            return st;
        }

    if (cur_.kind == TokKind::Ident && cur_.text == "print") {
        advance();
        expect(TokKind::LParen, "Expected '(' after print");
        if (cur_.kind == TokKind::RParen) {
            throw Error("print expects at least one argument");
        }
        Stmt st;
        st.kind = Stmt::Kind::PrintList;
        st.exprs.push_back(parseComparison());
        while (cur_.kind == TokKind::Comma) {
            advance();
            st.exprs.push_back(parseComparison());
        }
        expect(TokKind::RParen, "Expected ')' after print arguments");
        expect(TokKind::Semicolon, "Expected ';' after print");
        return st;
    }

    if (cur_.kind == TokKind::Ident && (cur_.text == "print_i64" || cur_.text == "print_d64" || cur_.text == "print_hex")) {
        bool isI64 = (cur_.text == "print_i64");
        bool isHex = (cur_.text == "print_hex");
        advance();
        expect(TokKind::LParen, "Expected '(' after print");
        auto e = parseComparison();
        expect(TokKind::RParen, "Expected ')' after print argument");
        expect(TokKind::Semicolon, "Expected ';' after print");
        Stmt st;
        st.kind = isHex ? Stmt::Kind::PrintHex : (isI64 ? Stmt::Kind::PrintI64 : Stmt::Kind::PrintD64);
        st.expr = std::move(e);
        return st;
    }
    if (cur_.kind == TokKind::Ident && cur_.text == "print_str") {
        advance();
        expect(TokKind::LParen, "Expected '(' after print_str");
        auto e = parseComparison();
        expect(TokKind::RParen, "Expected ')' after print_str argument");
        expect(TokKind::Semicolon, "Expected ';' after print_str");
        Stmt st;
        st.kind = Stmt::Kind::PrintStr;
        st.expr = std::move(e);
        return st;
    }
    if (cur_.kind == TokKind::Ident && next_.kind == TokKind::LParen) {
        auto e = parseComparison();
        expect(TokKind::Semicolon, "Expected ';' after call");
        Stmt st;
        st.kind = Stmt::Kind::ExprStmt;
        st.expr = std::move(e);
        return st;
    }
    if (cur_.kind == TokKind::Ident) {
        return parseAssignStmt(true);
    }

        if (cur_.kind == TokKind::KwRet) {
            advance();
            Stmt st;
            st.kind = Stmt::Kind::Ret;
            if (cur_.kind == TokKind::Semicolon) {
                advance();
                return st;
            }
            auto e = parseComparison();
            expect(TokKind::Semicolon, "Expected ';' after ret expression");
            st.expr = std::move(e);
            return st;
        }

        throw Error("Expected statement ('auto', 'ret', 'print', 'if', 'while', or 'for') at position " + std::to_string(cur_.pos));
    }

    std::vector<Stmt> parseBlock() {
        expect(TokKind::LBrace, "Expected '{' to start block");
        std::vector<Stmt> body;
        while (cur_.kind != TokKind::RBrace) {
            if (cur_.kind == TokKind::End) {
                throw Error("Unexpected end of file: missing '}'");
            }
            body.push_back(parseStmt());
        }
        expect(TokKind::RBrace, "Expected '}' at end of block");
        return body;
    }

    Stmt parseIfStmt() {
        expect(TokKind::KwIf, "Expected 'if'");
        expect(TokKind::LParen, "Expected '(' after if");
        auto cond = parseComparison();
        expect(TokKind::RParen, "Expected ')' after if condition");
        Stmt::IfBranch head;
        head.cond = std::move(cond);
        head.body = parseBlock();

        Stmt st;
        st.kind = Stmt::Kind::If;
        st.ifBranches.push_back(std::move(head));

        while (cur_.kind == TokKind::KwElseIf) {
            advance();
            expect(TokKind::LParen, "Expected '(' after elseif");
            auto elseCond = parseComparison();
            expect(TokKind::RParen, "Expected ')' after elseif condition");
            Stmt::IfBranch branch;
            branch.cond = std::move(elseCond);
            branch.body = parseBlock();
            st.ifBranches.push_back(std::move(branch));
        }

        if (cur_.kind == TokKind::KwElse) {
            advance();
            Stmt::IfBranch branch;
            branch.body = parseBlock();
            st.ifBranches.push_back(std::move(branch));
        }

        return st;
    }

    Stmt parseWhileStmt() {
        expect(TokKind::KwWhile, "Expected 'while'");
        expect(TokKind::LParen, "Expected '(' after while");
        auto cond = parseComparison();
        expect(TokKind::RParen, "Expected ')' after while condition");
        auto body = parseBlock();
        Stmt st;
        st.kind = Stmt::Kind::While;
        st.cond = std::move(cond);
        st.body = std::move(body);
        return st;
    }

    Stmt parseForStmt() {
        expect(TokKind::KwFor, "Expected 'for'");
        expect(TokKind::LParen, "Expected '(' after for");
        Stmt init;
        if (cur_.kind == TokKind::KwAuto) {
            init = parseAutoAssignNoSemicolon();
        } else if (isTypeStart(cur_.kind) && cur_.kind != TokKind::KwVoid) {
            Type t = parseType(false);
            init = parseTypedAssignNoSemicolon(t);
        } else {
            throw Error("Expected 'auto' or integer type in for init at position " + std::to_string(cur_.pos));
        }
        expectForSep("Expected ',' or ';' after for init");
        auto cond = parseComparison();
        expectForSep("Expected ',' or ';' after for condition");
        Stmt step = parseAssignStmt(false);
        expect(TokKind::RParen, "Expected ')' after for step");
        auto body = parseBlock();
        Stmt st;
        st.kind = Stmt::Kind::For;
        st.init = std::make_unique<Stmt>(std::move(init));
        st.cond = std::move(cond);
        st.step = std::make_unique<Stmt>(std::move(step));
        st.body = std::move(body);
        return st;
    }

    void expectForSep(const char* msg) {
        if (cur_.kind == TokKind::Comma || cur_.kind == TokKind::Semicolon) {
            advance();
            return;
        }
        throw Error(std::string(msg) + " at position " + std::to_string(cur_.pos));
    }

    Stmt parseAssignStmt(bool withSemicolon) {
        std::string var = expectIdent("Expected identifier");
        Stmt::AssignOp op = parseAssignOp();
        auto e = parseComparison();
        if (withSemicolon) {
            expect(TokKind::Semicolon, "Expected ';' after assignment");
        }
        Stmt st;
        st.kind = Stmt::Kind::Assign;
        st.name = var;
        st.expr = std::move(e);
        st.assignOp = op;
        return st;
    }

    Stmt parseAutoAssignNoSemicolon() {
        expect(TokKind::KwAuto, "Expected 'auto'");
        std::string var = expectIdent("Expected identifier after 'auto'");
        expect(TokKind::Equal, "Expected '=' after variable name");
        auto e = parseComparison();
        Stmt st;
        st.kind = Stmt::Kind::AutoAssign;
        st.name = var;
        st.expr = std::move(e);
        return st;
    }

    Stmt parseTypedAssignNoSemicolon(Type t) {
        std::string var = expectIdent("Expected identifier after type");
        expect(TokKind::Equal, "Expected '=' after variable name");
        auto e = parseComparison();
        Stmt st;
        st.kind = Stmt::Kind::TypedAssign;
        st.declType = t;
        st.name = var;
        st.expr = std::move(e);
        return st;
    }

    static Type tokenToType(TokKind k, size_t pos) {
        switch (k) {
            case TokKind::KwI64: return Type::I64;
            case TokKind::KwD64: return Type::D64;
            case TokKind::KwStr: return Type::Str;
            case TokKind::KwVoid: return Type::Void;
            case TokKind::KwU8: return Type::U8;
            case TokKind::KwU16: return Type::U16;
            case TokKind::KwU32: return Type::U32;
            case TokKind::KwU64: return Type::U64;
            default: break;
        }
        throw Error("Expected type keyword at position " + std::to_string(pos));
    }

    static bool isTypeStart(TokKind k) {
        return k == TokKind::KwI64 || k == TokKind::KwD64 || k == TokKind::KwStr || k == TokKind::KwVoid ||
               k == TokKind::KwU8 || k == TokKind::KwU16 || k == TokKind::KwU32 || k == TokKind::KwU64 ||
               k == TokKind::KwPtr;
    }

    Type parseType(bool allowVoid) {
        if (cur_.kind == TokKind::KwPtr) {
            advance();
            expect(TokKind::Lt, "Expected '<' after ptr");
            if (!isTypeStart(cur_.kind) || cur_.kind == TokKind::KwPtr || cur_.kind == TokKind::KwVoid ||
                cur_.kind == TokKind::KwStr) {
                throw Error("Expected base type inside ptr<> at position " + std::to_string(cur_.pos));
            }
            Type base = tokenToType(cur_.kind, cur_.pos);
            advance();
            expect(TokKind::Gt, "Expected '>' after ptr base type");
            return makePtrType(base);
        }
        if (!isTypeStart(cur_.kind)) {
            throw Error("Expected type keyword at position " + std::to_string(cur_.pos));
        }
        if (!allowVoid && cur_.kind == TokKind::KwVoid) {
            throw Error("void is not allowed here at position " + std::to_string(cur_.pos));
        }
        Type t = tokenToType(cur_.kind, cur_.pos);
        advance();
        return t;
    }

    Param parseParam() {
        if (!isTypeStart(cur_.kind) || cur_.kind == TokKind::KwVoid) {
            throw Error("Expected parameter type at position " + std::to_string(cur_.pos));
        }
        Type t = parseType(false);
        std::string name = expectIdent("Expected parameter name");
        Param p;
        p.type = t;
        p.name = std::move(name);
        return p;
    }

    Stmt::AssignOp parseAssignOp() {
        Stmt::AssignOp op = Stmt::AssignOp::Eq;
        switch (cur_.kind) {
            case TokKind::Equal:   op = Stmt::AssignOp::Eq; break;
            case TokKind::PlusEq:  op = Stmt::AssignOp::AddEq; break;
            case TokKind::MinusEq: op = Stmt::AssignOp::SubEq; break;
            case TokKind::StarEq:  op = Stmt::AssignOp::MulEq; break;
            case TokKind::SlashEq: op = Stmt::AssignOp::DivEq; break;
            default:
                throw Error("Expected assignment operator after variable name at position " + std::to_string(cur_.pos));
        }
        advance();
        return op;
    }

    // primary := number | ident | '(' expr ')'
    std::unique_ptr<Expr> parsePrimary() {
        if (cur_.kind == TokKind::Number) {
            std::string v = cur_.text;
            advance();
            return Expr::makeNum(std::move(v));
        }
        if (cur_.kind == TokKind::KwNull) {
            advance();
            return Expr::makeNull();
        }
        if (isTypeStart(cur_.kind)) {
            Type t = parseType(true);
            if (t == Type::Void || t == Type::Str) {
                throw Error("Only integer/ptr casts are supported");
            }
            expect(TokKind::LParen, "Expected '(' after cast type");
            auto inner = parseComparison();
            expect(TokKind::RParen, "Expected ')' after cast expression");
            return Expr::makeCast(t, std::move(inner));
        }
        if (cur_.kind == TokKind::String) {
            std::string v = cur_.text;
            advance();
            return Expr::makeStr(std::move(v));
        }
        if (cur_.kind == TokKind::Ident) {
            std::string n = cur_.text;
            advance();
            if (cur_.kind == TokKind::LParen) {
                advance();
                if (n == "volatile_load") {
                    auto a = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after volatile_load argument");
                    return Expr::makeVolatileLoad(std::move(a));
                }
                if (n == "in8") {
                    auto a = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after in8 argument");
                    return Expr::makeIn8(std::move(a));
                }
                if (n == "in16") {
                    auto a = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after in16 argument");
                    return Expr::makeIn16(std::move(a));
                }
                if (n == "in32") {
                    auto a = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after in32 argument");
                    return Expr::makeIn32(std::move(a));
                }
                if (n == "byte_add") {
                    auto a = parseComparison();
                    expect(TokKind::Comma, "Expected ',' after byte_add ptr");
                    auto b = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after byte_add args");
                    return Expr::makePtrAddBytes(std::move(a), std::move(b));
                }
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
                if (n == "min") {
                    auto a = parseComparison();
                    expect(TokKind::Comma, "Expected ',' after min left operand");
                    auto b = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after min right operand");
                    return Expr::makeMin(std::move(a), std::move(b));
                }
                if (n == "max") {
                    auto a = parseComparison();
                    expect(TokKind::Comma, "Expected ',' after max left operand");
                    auto b = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after max right operand");
                    return Expr::makeMax(std::move(a), std::move(b));
                }
                if (n == "abs") {
                    auto a = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after abs argument");
                    return Expr::makeAbs(std::move(a));
                }
                if (n == "sin") {
                    auto a = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after sin argument");
                    return Expr::makeSin(std::move(a));
                }
                if (n == "cos") {
                    auto a = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after cos argument");
                    return Expr::makeCos(std::move(a));
                }
                if (n == "tan") {
                    auto a = parseComparison();
                    expect(TokKind::RParen, "Expected ')' after tan argument");
                    return Expr::makeTan(std::move(a));
                }
                std::vector<std::unique_ptr<Expr>> args;
                if (cur_.kind != TokKind::RParen) {
                    args.push_back(parseComparison());
                    while (cur_.kind == TokKind::Comma) {
                        advance();
                        args.push_back(parseComparison());
                    }
                }
                expect(TokKind::RParen, "Expected ')' after call arguments");
                return Expr::makeCall(n, std::move(args));
            }
            if (n == "pi") {
                return Expr::makeNum("3.14159265358979323846264338327950288");
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
        if (cur_.kind == TokKind::Tilde) {
            advance();
            auto rhs = parseUnary();
            return Expr::makeBitNot(std::move(rhs));
        }
        if (cur_.kind == TokKind::Bang) {
            advance();
            auto rhs = parseUnary();
            return Expr::makeNot(std::move(rhs));
        }
        if (cur_.kind == TokKind::Star) {
            advance();
            auto rhs = parseUnary();
            return Expr::makeDeref(std::move(rhs));
        }
        if (cur_.kind == TokKind::Amp) {
            advance();
            std::string n = expectIdent("Expected identifier after '&'");
            return Expr::makeAddrOf(std::move(n));
        }
        return parsePrimary();
    }

    // term := unary { (*|/|%) unary }
    std::unique_ptr<Expr> parseTerm() {
        auto left = parseUnary();
        while (cur_.kind == TokKind::Star || cur_.kind == TokKind::Slash || cur_.kind == TokKind::Percent) {
            TokKind op = cur_.kind;
            advance();
            auto right = parseUnary();
            if (op == TokKind::Star) left = Expr::makeMul(std::move(left), std::move(right));
            else if (op == TokKind::Slash) left = Expr::makeDiv(std::move(left), std::move(right));
            else                          left = Expr::makeMod(std::move(left), std::move(right));
        }
        return left;
    }

    // add := term { (+|-) term }
    std::unique_ptr<Expr> parseAdd() {
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

    // shift := add { (<<|>>) add }
    std::unique_ptr<Expr> parseShift() {
        auto left = parseAdd();
        while (cur_.kind == TokKind::Shl || cur_.kind == TokKind::Shr) {
            TokKind op = cur_.kind;
            advance();
            auto right = parseAdd();
            if (op == TokKind::Shl) left = Expr::makeShl(std::move(left), std::move(right));
            else                   left = Expr::makeShr(std::move(left), std::move(right));
        }
        return left;
    }

    // bitand := shift { '&' shift }
    std::unique_ptr<Expr> parseBitAnd() {
        auto left = parseShift();
        while (cur_.kind == TokKind::Amp) {
            advance();
            auto right = parseShift();
            left = Expr::makeBitAnd(std::move(left), std::move(right));
        }
        return left;
    }

    // bitxor := bitand { '^' bitand }
    std::unique_ptr<Expr> parseBitXor() {
        auto left = parseBitAnd();
        while (cur_.kind == TokKind::Caret) {
            advance();
            auto right = parseBitAnd();
            left = Expr::makeBitXor(std::move(left), std::move(right));
        }
        return left;
    }

    // bitor := bitxor { '|' bitxor }
    std::unique_ptr<Expr> parseBitOr() {
        auto left = parseBitXor();
        while (cur_.kind == TokKind::Pipe) {
            advance();
            auto right = parseBitXor();
            left = Expr::makeBitOr(std::move(left), std::move(right));
        }
        return left;
    }

    static std::unique_ptr<Expr> cloneExpr(const std::unique_ptr<Expr>& e) {
        if (!e) return nullptr;
        auto out = std::make_unique<Expr>();
        out->kind = e->kind;
        out->cmpOp = e->cmpOp;
        out->castType = e->castType;
        out->numText = e->numText;
        out->strText = e->strText;
        out->var = e->var;
        out->callName = e->callName;
        out->callArgs.reserve(e->callArgs.size());
        for (const auto& arg : e->callArgs) {
            out->callArgs.push_back(cloneExpr(arg));
        }
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

    // comparison := bitor ( (==|!=|<|<=|>|>=) bitor )*
    std::unique_ptr<Expr> parseCmp() {
        auto left = parseBitOr();
        if (!isCmpTok(cur_.kind)) return left;

        auto op = tokToCmpOp(cur_.kind);
        advance();
        auto right = parseBitOr();
        auto result = Expr::makeCmp(op, std::move(left), cloneExpr(right));
        auto prev = std::move(right);

        while (isCmpTok(cur_.kind)) {
            op = tokToCmpOp(cur_.kind);
            advance();
            auto next = parseBitOr();
            auto cmp = Expr::makeCmp(op, cloneExpr(prev), cloneExpr(next));
            result = Expr::makeAnd(std::move(result), std::move(cmp));
            prev = std::move(next);
        }

        return result;
    }

    // logical_and := comparison { '&&' comparison }
    std::unique_ptr<Expr> parseLogicalAnd() {
        auto left = parseCmp();
        while (cur_.kind == TokKind::AndAnd) {
            advance();
            auto right = parseCmp();
            left = Expr::makeLogAnd(std::move(left), std::move(right));
        }
        return left;
    }

    // logical_or := logical_and { '||' logical_and }
    std::unique_ptr<Expr> parseLogicalOr() {
        auto left = parseLogicalAnd();
        while (cur_.kind == TokKind::OrOr) {
            advance();
            auto right = parseLogicalAnd();
            left = Expr::makeLogOr(std::move(left), std::move(right));
        }
        return left;
    }

    // expr := logical_or
    std::unique_ptr<Expr> parseComparison() {
        return parseLogicalOr();
    }

    void advance() {
        cur_ = next_;
        next_ = lex_.next();
    }

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
    Tok next_;
};

struct FuncSig {
    Type retType = Type::Void;
    std::vector<Type> params;
};

struct CodegenCtx {
    struct VarInfo {
        Type type;
        int slot;
        int size;
    };
    std::unordered_map<std::string, VarInfo> varToSlot; // slot index: 1 => [rbp-8], 2 => [rbp-16], ...
    int nextSlot = 1;
    int maxSlotUsed = 0;
    std::vector<int> strSlots;
    struct StrLit {
        std::string data;
        std::string label;
    };
    std::vector<StrLit> strLits;
    std::unordered_map<std::string, int> strToId;
    const std::unordered_map<std::string, struct FuncSig>* funcs = nullptr;
    Mode mode = Mode::Mixed;
    std::string labelPrefix;

    int allocSlot(const std::string& name, Type type) {
        if (varToSlot.contains(name)) {
            throw Error("Variable '" + name + "' already declared");
        }
        int size = (type == Type::Str) ? 2 : 1;
        int slot = nextSlot;
        nextSlot += size;
        varToSlot[name] = VarInfo{type, slot, size};
        if (type == Type::Str) {
            strSlots.push_back(slot);
        }
        int lastSlot = slot + size - 1;
        if (lastSlot > maxSlotUsed) maxSlotUsed = lastSlot;
        return slot;
    }

    VarInfo getVar(const std::string& name) const {
        auto it = varToSlot.find(name);
        if (it == varToSlot.end()) throw Error("Unknown variable '" + name + "'");
        return it->second;
    }

    const struct FuncSig& getFuncSig(const std::string& name) const {
        if (!funcs) throw Error("Internal: missing function table");
        auto it = funcs->find(name);
        if (it == funcs->end()) throw Error("Unknown function '" + name + "'");
        return it->second;
    }

    static int slotDisp(int slot) { return slot * 8; } // [rbp-8*slot]

    const StrLit& getOrAddStr(const std::string& s) {
        auto it = strToId.find(s);
        if (it != strToId.end()) return strLits[it->second];
        int id = (int)strLits.size();
        std::string label = labelPrefix + "str" + std::to_string(id);
        strToId.emplace(s, id);
        strLits.push_back(StrLit{s, label});
        return strLits.back();
    }
};

static int64_t parseI64Literal(const std::string& text) {
    if (text.find_first_of(".eE") != std::string::npos) {
        throw Error("Expected integer literal, got '" + text + "'");
    }
    if (text.size() >= 2 && text[0] == '0' && (text[1] == 'x' || text[1] == 'X')) {
        throw Error("Expected decimal integer literal, got '" + text + "'");
    }
    try {
        long long v = std::stoll(text);
        return (int64_t)v;
    } catch (...) {
        throw Error("Number literal out of range: '" + text + "'");
    }
}

static bool isHexLiteralText(const std::string& text) {
    return text.size() >= 2 && text[0] == '0' && (text[1] == 'x' || text[1] == 'X');
}

static std::string stripNumSeparators(const std::string& text) {
    std::string out;
    out.reserve(text.size());
    for (char c : text) {
        if (c != '_') out.push_back(c);
    }
    return out;
}

static uint64_t parseU64Literal(const std::string& text) {
    std::string cleaned = stripNumSeparators(text);
    int base = 10;
    size_t pos = 0;
    if (isHexLiteralText(cleaned)) {
        base = 16;
        pos = 2;
    }
    try {
        unsigned long long v = std::stoull(cleaned.substr(pos), nullptr, base);
        return static_cast<uint64_t>(v);
    } catch (...) {
        throw Error("Number literal out of range: '" + text + "'");
    }
}

static double parseF64Literal(const std::string& text) {
    if (isHexLiteralText(text)) {
        throw Error("Expected decimal float literal, got '" + text + "'");
    }
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

static void emitExprInt(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId);
static void emitExprD64(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId);
static void emitExprPtr(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId);
static void emitStrToRegs(std::ostringstream& out, CodegenCtx& cg, const Expr& e,
                          int& labelId, const char* ptrReg, const char* lenReg);
static void emitCallExpr(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId);
enum class ExprTypeTag { I64, D64, U8, U16, U32, U64, IntLiteral };
static ExprTypeTag inferExprTypeTag(const Expr& e, const CodegenCtx& cg, Mode mode);
static ExprTypeTag mergeNumericTags(ExprTypeTag a, ExprTypeTag b, const char* ctx);
static Type tagToType(ExprTypeTag t);
static Type resolveIntExprType(const Expr& e, const CodegenCtx& cg, Mode mode);
static Type resolvePtrExprType(const Expr& e, const CodegenCtx& cg, Mode mode);
static bool isPtrExpr(const Expr& e, const CodegenCtx& cg, Mode mode);
static bool isNullExpr(const Expr& e);
static bool isUnsignedLiteralAssignable(const Expr& e, Type target, uint64_t* outVal = nullptr);
static bool isUnsignedType(Type t);
static bool isIntegerType(Type t);
static bool isFloatLiteralText(const std::string& text);
static int unsignedBits(Type t);
static bool isPtrType(Type t);
static Type ptrPointee(Type t);
static int ptrElemSize(Type t);
static Type makePtrType(Type base);

static void emitMaskUnsigned(std::ostringstream& out, Type t) {
    switch (t) {
        case Type::U8: out << "    and  rax, 0xFF\n"; break;
        case Type::U16: out << "    and  rax, 0xFFFF\n"; break;
        case Type::U32: out << "    and  eax, 0xFFFFFFFF\n"; break;
        default: break;
    }
}

static Type typeFromTagOrI64(ExprTypeTag tag) {
    return (tag == ExprTypeTag::IntLiteral) ? Type::I64 : tagToType(tag);
}

static void emitExprInt(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId) {
    using K = Expr::Kind;
    switch (e.kind) {
        case K::Num:
            if (isHexLiteralText(e.numText)) {
                (void)parseU64Literal(e.numText);
                out << "    mov  rax, " << stripNumSeparators(e.numText) << "\n";
            } else {
                out << "    mov  rax, " << parseI64Literal(e.numText) << "\n";
            }
            return;
        case K::Str:
            throw Error("Type error: string is not allowed in integer expression");
        case K::Var: {
            auto v = cg.getVar(e.var);
            if (!isIntegerType(v.type)) throw Error("Type error: expected integer variable '" + e.var + "'");
            out << "    mov  rax, [rbp-" << CodegenCtx::slotDisp(v.slot) << "]\n";
            if (isUnsignedType(v.type)) {
                emitMaskUnsigned(out, v.type);
            }
            return;
        }
        case K::Call: {
            const auto& sig = cg.getFuncSig(e.callName);
            if (!isIntegerType(sig.retType)) {
                throw Error("Type error: function '" + e.callName + "' does not return integer");
            }
            emitCallExpr(out, cg, e, labelId);
            if (isUnsignedType(sig.retType)) {
                emitMaskUnsigned(out, sig.retType);
            }
            return;
        }
        case K::Deref: {
            Type pt = resolvePtrExprType(*e.lhs, cg, cg.mode);
            Type base = ptrPointee(pt);
            if (!isIntegerType(base)) {
                throw Error("Type error: deref expects integer ptr");
            }
            emitExprPtr(out, cg, *e.lhs, labelId);
            switch (base) {
                case Type::U8:  out << "    movzx eax, byte [rax]\n"; break;
                case Type::U16: out << "    movzx eax, word [rax]\n"; break;
                case Type::U32: out << "    mov  eax, dword [rax]\n"; break;
                case Type::U64: out << "    mov  rax, qword [rax]\n"; break;
                case Type::I64: out << "    mov  rax, qword [rax]\n"; break;
                default: break;
            }
            if (isUnsignedType(base)) {
                emitMaskUnsigned(out, base);
            }
            return;
        }
        case K::VolatileLoad: {
            Type pt = resolvePtrExprType(*e.lhs, cg, cg.mode);
            Type base = ptrPointee(pt);
            if (base == Type::D64) {
                throw Error("Type error: volatile_load does not support d64");
            }
            if (!isIntegerType(base)) {
                throw Error("Type error: volatile_load expects ptr to integer");
            }
            emitExprPtr(out, cg, *e.lhs, labelId);
            switch (base) {
                case Type::U8:  out << "    movzx eax, byte [rax]\n"; break;
                case Type::U16: out << "    movzx eax, word [rax]\n"; break;
                case Type::U32: out << "    mov  eax, dword [rax]\n"; break;
                case Type::U64: out << "    mov  rax, qword [rax]\n"; break;
                case Type::I64: out << "    mov  rax, qword [rax]\n"; break;
                default: break;
            }
            if (isUnsignedType(base)) {
                emitMaskUnsigned(out, base);
            }
            return;
        }
        case K::In8:
        case K::In16:
        case K::In32: {
            Type portType = resolveIntExprType(*e.lhs, cg, cg.mode);
            if (portType != Type::U16) {
                if (!isUnsignedLiteralAssignable(*e.lhs, Type::U16)) {
                    throw Error("Type error: in* expects u16 port");
                }
            }
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    mov  dx, ax\n";
            if (e.kind == K::In8) {
                out << "    in   al, dx\n";
                out << "    movzx eax, al\n";
            } else if (e.kind == K::In16) {
                out << "    in   ax, dx\n";
                out << "    movzx eax, ax\n";
            } else {
                out << "    in   eax, dx\n";
            }
            return;
        }
        case K::Mul: {
            auto lt = inferExprTypeTag(*e.lhs, cg, cg.mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, cg.mode);
            Type resType = typeFromTagOrI64(mergeNumericTags(lt, rt, "expression"));
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    imul rax, rcx\n";
            if (isUnsignedType(resType)) {
                emitMaskUnsigned(out, resType);
            }
            return;
        }
        case K::Div: {
            auto lt = inferExprTypeTag(*e.lhs, cg, cg.mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, cg.mode);
            Type resType = typeFromTagOrI64(mergeNumericTags(lt, rt, "expression"));
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    xchg rax, rcx\n";
            if (isUnsignedType(resType)) {
                out << "    xor  edx, edx\n";
                out << "    div  rcx\n";
            } else {
                out << "    cqo\n";
                out << "    idiv rcx\n";
            }
            return;
        }
        case K::Mod: {
            auto lt = inferExprTypeTag(*e.lhs, cg, cg.mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, cg.mode);
            Type resType = typeFromTagOrI64(mergeNumericTags(lt, rt, "expression"));
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    mov  r8, rax\n";
            out << "    mov  rax, rcx\n";
            if (isUnsignedType(resType)) {
                out << "    xor  edx, edx\n";
                out << "    div  r8\n";
            } else {
                out << "    cqo\n";
                out << "    idiv r8\n";
            }
            out << "    mov  rax, rdx\n";
            return;
        }
        case K::Add: {
            auto lt = inferExprTypeTag(*e.lhs, cg, cg.mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, cg.mode);
            Type resType = typeFromTagOrI64(mergeNumericTags(lt, rt, "expression"));
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    add  rax, rcx\n";
            if (isUnsignedType(resType)) {
                emitMaskUnsigned(out, resType);
            }
            return;
        }
        case K::Sub: {
            auto lt = inferExprTypeTag(*e.lhs, cg, cg.mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, cg.mode);
            Type resType = typeFromTagOrI64(mergeNumericTags(lt, rt, "expression"));
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    sub  rcx, rax\n";
            out << "    mov  rax, rcx\n";
            if (isUnsignedType(resType)) {
                emitMaskUnsigned(out, resType);
            }
            return;
        }
        case K::Shl:
        case K::Shr: {
            auto lt = inferExprTypeTag(*e.lhs, cg, cg.mode);
            Type resType = typeFromTagOrI64(lt);
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    mov  rcx, rax\n";
            out << "    pop  rax\n";
            if (e.kind == K::Shl) {
                out << "    shl  rax, cl\n";
            } else {
                if (isUnsignedType(resType)) {
                    out << "    shr  rax, cl\n";
                } else {
                    out << "    sar  rax, cl\n";
                }
            }
            if (isUnsignedType(resType)) {
                emitMaskUnsigned(out, resType);
            }
            return;
        }
        case K::BitAnd:
        case K::BitXor:
        case K::BitOr: {
            auto lt = inferExprTypeTag(*e.lhs, cg, cg.mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, cg.mode);
            Type resType = typeFromTagOrI64(mergeNumericTags(lt, rt, "bitwise"));
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            if (e.kind == K::BitAnd) out << "    and  rax, rcx\n";
            else if (e.kind == K::BitXor) out << "    xor  rax, rcx\n";
            else out << "    or   rax, rcx\n";
            if (isUnsignedType(resType)) {
                emitMaskUnsigned(out, resType);
            }
            return;
        }
        case K::BitNot: {
            auto lt = inferExprTypeTag(*e.lhs, cg, cg.mode);
            Type resType = typeFromTagOrI64(lt);
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    not  rax\n";
            if (isUnsignedType(resType)) {
                emitMaskUnsigned(out, resType);
            }
            return;
        }
        case K::Cmp: {
            bool lPtr = isPtrExpr(*e.lhs, cg, cg.mode) || isNullExpr(*e.lhs);
            bool rPtr = isPtrExpr(*e.rhs, cg, cg.mode) || isNullExpr(*e.rhs);
            if (lPtr || rPtr) {
                if (!(lPtr && rPtr)) {
                    throw Error("Type error: ptr comparison requires ptr on both sides");
                }
                if (e.cmpOp != Expr::CmpOp::Eq && e.cmpOp != Expr::CmpOp::Ne) {
                    throw Error("Type error: only == and != are allowed for ptr");
                }
                emitExprPtr(out, cg, *e.lhs, labelId);
                out << "    push rax\n";
                emitExprPtr(out, cg, *e.rhs, labelId);
                out << "    pop  rcx\n";
                out << "    cmp  rcx, rax\n";
                if (e.cmpOp == Expr::CmpOp::Eq) out << "    sete al\n";
                else out << "    setne al\n";
                out << "    movzx eax, al\n";
                return;
            }
            Type lt = resolveIntExprType(*e.lhs, cg, cg.mode);
            Type rt = resolveIntExprType(*e.rhs, cg, cg.mode);
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    cmp  rcx, rax\n";
            bool unsignedCmp = isUnsignedType(lt) || isUnsignedType(rt);
            switch (e.cmpOp) {
                case Expr::CmpOp::Eq: out << "    sete al\n"; break;
                case Expr::CmpOp::Ne: out << "    setne al\n"; break;
                case Expr::CmpOp::Lt: out << (unsignedCmp ? "    setb al\n" : "    setl al\n"); break;
                case Expr::CmpOp::Le: out << (unsignedCmp ? "    setbe al\n" : "    setle al\n"); break;
                case Expr::CmpOp::Gt: out << (unsignedCmp ? "    seta al\n" : "    setg al\n"); break;
                case Expr::CmpOp::Ge: out << (unsignedCmp ? "    setae al\n" : "    setge al\n"); break;
            }
            out << "    movzx eax, al\n";
            return;
        }
        case K::And:
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    and  rax, rcx\n";
            return;
        case K::LogAnd:
        case K::LogOr:
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    cmp  rax, 0\n";
            out << "    setne al\n";
            out << "    movzx eax, al\n";
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    cmp  rax, 0\n";
            out << "    setne al\n";
            out << "    movzx eax, al\n";
            out << "    pop  rcx\n";
            if (e.kind == K::LogAnd) out << "    and  rax, rcx\n";
            else out << "    or   rax, rcx\n";
            return;
        case K::Not:
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    cmp  rax, 0\n";
            out << "    sete al\n";
            out << "    movzx eax, al\n";
            return;
        case K::Cast: {
            if (isPtrType(e.castType)) {
                throw Error("Type error: ptr cast is not allowed in integer expression");
            }
            if (isPtrExpr(*e.lhs, cg, cg.mode)) {
                if (e.castType != Type::U64) {
                    throw Error("Type error: ptr can only be cast to u64");
                }
                emitExprPtr(out, cg, *e.lhs, labelId);
                return;
            }
            if (!isIntegerType(e.castType)) {
                throw Error("Type error: only integer casts are supported");
            }
            emitExprInt(out, cg, *e.lhs, labelId);
            if (isUnsignedType(e.castType)) {
                emitMaskUnsigned(out, e.castType);
            }
            return;
        }
        case K::Sqrt: {
            int id = labelId++;
            emitExprInt(out, cg, *e.lhs, labelId);
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
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    mov  r8, rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
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
        case K::Min:
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    cmp  rcx, rax\n";
            out << "    cmovle rax, rcx\n";
            return;
        case K::Max:
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    cmp  rcx, rax\n";
            out << "    cmovge rax, rcx\n";
            return;
        case K::Abs: {
            int id = labelId++;
            emitExprInt(out, cg, *e.lhs, labelId);
            out << "    cmp  rax, 0\n";
            out << "    jge  .iabs_done_" << id << "\n";
            out << "    neg  rax\n";
            out << ".iabs_done_" << id << ":\n";
            return;
        }
        case K::Sin:
            throw Error("sin() is only available in d64 mode");
        case K::Cos:
            throw Error("cos() is only available in d64 mode");
        case K::Tan:
            throw Error("tan() is only available in d64 mode");
        default:
            break;

    }
    throw Error("Internal: unknown expr kind");
}

static void emitExprPtr(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId) {
    using K = Expr::Kind;
    switch (e.kind) {
        case K::Var: {
            auto v = cg.getVar(e.var);
            if (!isPtrType(v.type)) throw Error("Type error: expected ptr variable '" + e.var + "'");
            out << "    mov  rax, [rbp-" << CodegenCtx::slotDisp(v.slot) << "]\n";
            return;
        }
        case K::Call: {
            const auto& sig = cg.getFuncSig(e.callName);
            if (!isPtrType(sig.retType)) {
                throw Error("Type error: function '" + e.callName + "' does not return ptr");
            }
            emitCallExpr(out, cg, e, labelId);
            return;
        }
        case K::AddrOf: {
            auto v = cg.getVar(e.var);
            if (!isIntegerType(v.type) && v.type != Type::D64) {
                throw Error("Type error: '&' is only allowed on numeric variables");
            }
            out << "    lea  rax, [rbp-" << CodegenCtx::slotDisp(v.slot) << "]\n";
            return;
        }
        case K::Cast: {
            if (!isPtrType(e.castType)) {
                throw Error("Type error: expected ptr cast");
            }
            emitExprInt(out, cg, *e.lhs, labelId);
            return;
        }
        case K::Add:
        case K::Sub: {
            Type pt = resolvePtrExprType(*e.lhs, cg, cg.mode);
            int scale = ptrElemSize(pt);
            emitExprPtr(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    mov  rcx, rax\n";
            out << "    pop  rax\n";
            if (scale != 1) {
                out << "    imul rcx, " << scale << "\n";
            }
            if (e.kind == K::Add) {
                out << "    add  rax, rcx\n";
            } else {
                out << "    sub  rax, rcx\n";
            }
            return;
        }
        case K::PtrAddBytes: {
            emitExprPtr(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprInt(out, cg, *e.rhs, labelId);
            out << "    mov  rcx, rax\n";
            out << "    pop  rax\n";
            out << "    add  rax, rcx\n";
            return;
        }
        case K::Null:
            out << "    xor  eax, eax\n";
            return;
        default:
            break;
    }
    throw Error("Internal: unknown ptr expr kind");
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
        case K::Str:
            throw Error("Type error: string is not allowed in d64 expression");
        case K::Var: {
            auto v = cg.getVar(e.var);
            if (v.type != Type::D64) throw Error("Type error: expected d64 variable '" + e.var + "'");
            out << "    movsd xmm0, [rbp-" << CodegenCtx::slotDisp(v.slot) << "]\n";
            return;
        }
        case K::Call: {
            const auto& sig = cg.getFuncSig(e.callName);
            if (sig.retType != Type::D64) {
                throw Error("Type error: function '" + e.callName + "' does not return d64");
            }
            emitCallExpr(out, cg, e, labelId);
            return;
        }
        case K::Deref: {
            Type pt = resolvePtrExprType(*e.lhs, cg, cg.mode);
            Type base = ptrPointee(pt);
            if (base != Type::D64) {
                throw Error("Type error: deref expects ptr<d64>");
            }
            emitExprPtr(out, cg, *e.lhs, labelId);
            out << "    movsd xmm0, [rax]\n";
            return;
        }
        case K::Cast:
            throw Error("Type error: integer casts are not allowed in d64 expression");
        case K::Shl:
        case K::Shr:
        case K::BitAnd:
        case K::BitXor:
        case K::BitOr:
        case K::BitNot:
            throw Error("Type error: bitwise ops are not allowed in d64 expression");
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
        case K::Mod:
            {
            int id = labelId++;
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 16\n";
            out << "    movsd [rsp], xmm0\n";
            emitExprD64(out, cg, *e.rhs, labelId);
            out << "    movsd [rsp+8], xmm0\n";
            out << "    fld  qword [rsp+8]\n";
            out << "    fld  qword [rsp]\n";
            out << ".fprem_loop_" << id << ":\n";
            out << "    fprem\n";
            out << "    fnstsw ax\n";
            out << "    test ax, 0x0400\n";
            out << "    jnz  .fprem_loop_" << id << "\n";
            out << "    fstp qword [rsp]\n";
            out << "    fstp st0\n";
            out << "    movsd xmm0, [rsp]\n";
            out << "    add  rsp, 16\n";
            return;
            }
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
        case K::Min: {
            int id = labelId++;
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
            emitExprD64(out, cg, *e.rhs, labelId);
            out << "    movsd xmm1, [rsp]\n";
            out << "    add  rsp, 8\n";
            out << "    ucomisd xmm1, xmm1\n";
            out << "    jp   .min_nan_l_" << id << "\n";
            out << "    ucomisd xmm0, xmm0\n";
            out << "    jp   .min_nan_r_" << id << "\n";
            out << "    ucomisd xmm1, xmm0\n";
            out << "    jbe  .min_take_l_" << id << "\n";
            out << "    jmp  .min_done_" << id << "\n";
            out << ".min_nan_l_" << id << ":\n";
            out << "    movapd xmm0, xmm1\n";
            out << "    jmp  .min_done_" << id << "\n";
            out << ".min_nan_r_" << id << ":\n";
            out << "    jmp  .min_done_" << id << "\n";
            out << ".min_take_l_" << id << ":\n";
            out << "    movapd xmm0, xmm1\n";
            out << ".min_done_" << id << ":\n";
            return;
        }
        case K::Max: {
            int id = labelId++;
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
            emitExprD64(out, cg, *e.rhs, labelId);
            out << "    movsd xmm1, [rsp]\n";
            out << "    add  rsp, 8\n";
            out << "    ucomisd xmm1, xmm1\n";
            out << "    jp   .max_nan_l_" << id << "\n";
            out << "    ucomisd xmm0, xmm0\n";
            out << "    jp   .max_nan_r_" << id << "\n";
            out << "    ucomisd xmm1, xmm0\n";
            out << "    jae  .max_take_l_" << id << "\n";
            out << "    jmp  .max_done_" << id << "\n";
            out << ".max_nan_l_" << id << ":\n";
            out << "    movapd xmm0, xmm1\n";
            out << "    jmp  .max_done_" << id << "\n";
            out << ".max_nan_r_" << id << ":\n";
            out << "    jmp  .max_done_" << id << "\n";
            out << ".max_take_l_" << id << ":\n";
            out << "    movapd xmm0, xmm1\n";
            out << ".max_done_" << id << ":\n";
            return;
        }
        case K::Abs:
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    mov  rax, 0x7fffffffffffffff\n";
            out << "    movq xmm1, rax\n";
            out << "    andpd xmm0, xmm1\n";
            return;
        case K::Sin:
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
            out << "    fld  qword [rsp]\n";
            out << "    fsin\n";
            out << "    fstp qword [rsp]\n";
            out << "    movsd xmm0, [rsp]\n";
            out << "    add  rsp, 8\n";
            return;
        case K::Cos:
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
            out << "    fld  qword [rsp]\n";
            out << "    fcos\n";
            out << "    fstp qword [rsp]\n";
            out << "    movsd xmm0, [rsp]\n";
            out << "    add  rsp, 8\n";
            return;
        case K::Tan:
            emitExprD64(out, cg, *e.lhs, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
            out << "    fld  qword [rsp]\n";
            out << "    fptan\n";
            out << "    fstp st0\n";
            out << "    fstp qword [rsp]\n";
            out << "    movsd xmm0, [rsp]\n";
            out << "    add  rsp, 8\n";
            return;
        default:
            break;
    }
    throw Error("Internal: unknown expr kind");
}

static const char* typeName(Type t) {
    switch (t) {
        case Type::I64: return "i64";
        case Type::D64: return "d64";
        case Type::Str: return "str";
        case Type::Void: return "void";
        case Type::U8: return "u8";
        case Type::U16: return "u16";
        case Type::U32: return "u32";
        case Type::U64: return "u64";
        case Type::PtrU8: return "ptr<u8>";
        case Type::PtrU16: return "ptr<u16>";
        case Type::PtrU32: return "ptr<u32>";
        case Type::PtrU64: return "ptr<u64>";
        case Type::PtrI64: return "ptr<i64>";
        case Type::PtrD64: return "ptr<d64>";
    }
    return "unknown";
}

static bool isUnsignedType(Type t) {
    return t == Type::U8 || t == Type::U16 || t == Type::U32 || t == Type::U64;
}

static bool isIntegerType(Type t) {
    return t == Type::I64 || isUnsignedType(t);
}

static bool isPtrType(Type t) {
    return t == Type::PtrU8 || t == Type::PtrU16 || t == Type::PtrU32 || t == Type::PtrU64 ||
           t == Type::PtrI64 || t == Type::PtrD64;
}

static Type ptrPointee(Type t) {
    switch (t) {
        case Type::PtrU8: return Type::U8;
        case Type::PtrU16: return Type::U16;
        case Type::PtrU32: return Type::U32;
        case Type::PtrU64: return Type::U64;
        case Type::PtrI64: return Type::I64;
        case Type::PtrD64: return Type::D64;
        default: break;
    }
    throw Error("Internal: expected ptr type");
}

static Type makePtrType(Type base) {
    switch (base) {
        case Type::U8: return Type::PtrU8;
        case Type::U16: return Type::PtrU16;
        case Type::U32: return Type::PtrU32;
        case Type::U64: return Type::PtrU64;
        case Type::I64: return Type::PtrI64;
        case Type::D64: return Type::PtrD64;
        default: break;
    }
    throw Error("ptr<T> only supports u8/u16/u32/u64/i64/d64");
}

static int typeSizeBytes(Type t) {
    switch (t) {
        case Type::U8: return 1;
        case Type::U16: return 2;
        case Type::U32: return 4;
        case Type::U64: return 8;
        case Type::I64: return 8;
        case Type::D64: return 8;
        default: break;
    }
    throw Error("Internal: invalid type size");
}

static int ptrElemSize(Type t) {
    return typeSizeBytes(ptrPointee(t));
}
static bool isUnsignedLiteralAssignable(const Expr& e, Type target, uint64_t* outVal) {
    if (!isUnsignedType(target)) return false;
    if (!(e.kind == Expr::Kind::Num && !isFloatLiteralText(e.numText))) return false;
    uint64_t v = parseU64Literal(e.numText);
    int bits = unsignedBits(target);
    if (bits < 64) {
        uint64_t max = (1ULL << bits) - 1ULL;
        if (v > max) return false;
    }
    if (outVal) *outVal = v;
    return true;
}

static int unsignedBits(Type t) {
    switch (t) {
        case Type::U8: return 8;
        case Type::U16: return 16;
        case Type::U32: return 32;
        case Type::U64: return 64;
        default: break;
    }
    return 0;
}

static Type unsignedTypeFromBits(int bits) {
    switch (bits) {
        case 8: return Type::U8;
        case 16: return Type::U16;
        case 32: return Type::U32;
        case 64: return Type::U64;
        default: break;
    }
    throw Error("Internal: invalid unsigned width");
}

static void emitPrintI64(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId) {
    Type t = resolveIntExprType(e, cg, cg.mode);
    if (t != Type::I64) {
        throw Error("print_i64 expects i64 expression");
    }
    emitExprInt(out, cg, e, labelId);
    out << "    mov  rdi, rax\n";
    out << "    sub  rsp, 8\n";
    out << "    call rt_print_i64_raw\n";
    out << "    add  rsp, 8\n";
}

static void emitPrintInt(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId, Type t) {
    emitExprInt(out, cg, e, labelId);
    out << "    mov  rdi, rax\n";
    out << "    sub  rsp, 8\n";
    if (t == Type::I64) {
        out << "    call rt_print_i64_raw\n";
    } else {
        out << "    call rt_print_u64_raw\n";
    }
    out << "    add  rsp, 8\n";
}

static void emitPrintHex(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId) {
    Type t = resolveIntExprType(e, cg, cg.mode);
    if (!isUnsignedType(t)) {
        if (!isUnsignedLiteralAssignable(e, Type::U64)) {
            throw Error("print_hex expects unsigned integer expression");
        }
        t = Type::U64;
    }
    emitExprInt(out, cg, e, labelId);
    if (isUnsignedType(t)) {
        emitMaskUnsigned(out, t);
    }
    out << "    mov  rdi, rax\n";
    out << "    sub  rsp, 8\n";
    out << "    call rt_print_hex_u64_raw\n";
    out << "    add  rsp, 8\n";
}

static void emitPrintD64(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId) {
    emitExprD64(out, cg, e, labelId);
    out << "    sub  rsp, 8\n";
    out << "    call rt_print_f64_raw\n";
    out << "    add  rsp, 8\n";
}

static void emitStrToRegs(std::ostringstream& out, CodegenCtx& cg, const Expr& e,
                          int& labelId, const char* ptrReg, const char* lenReg);

static void emitPrintStr(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId) {
    emitStrToRegs(out, cg, e, labelId, "rdi", "rsi");
    out << "    sub  rsp, 8\n";
    out << "    call rt_print_bytes\n";
    out << "    add  rsp, 8\n";
}

static bool isFloatLiteralText(const std::string& text) {
    return text.find_first_of(".eE") != std::string::npos;
}

static bool isUnsignedTag(ExprTypeTag t) {
    return t == ExprTypeTag::U8 || t == ExprTypeTag::U16 || t == ExprTypeTag::U32 || t == ExprTypeTag::U64;
}

static bool isIntegerTag(ExprTypeTag t) {
    return t != ExprTypeTag::D64;
}

static int unsignedBitsFromTag(ExprTypeTag t) {
    switch (t) {
        case ExprTypeTag::U8: return 8;
        case ExprTypeTag::U16: return 16;
        case ExprTypeTag::U32: return 32;
        case ExprTypeTag::U64: return 64;
        default: break;
    }
    return 0;
}

static Type tagToType(ExprTypeTag t) {
    switch (t) {
        case ExprTypeTag::I64: return Type::I64;
        case ExprTypeTag::D64: return Type::D64;
        case ExprTypeTag::U8: return Type::U8;
        case ExprTypeTag::U16: return Type::U16;
        case ExprTypeTag::U32: return Type::U32;
        case ExprTypeTag::U64: return Type::U64;
        default: break;
    }
    throw Error("Internal: unresolved literal type");
}

static ExprTypeTag tagFromType(Type t) {
    switch (t) {
        case Type::I64: return ExprTypeTag::I64;
        case Type::D64: return ExprTypeTag::D64;
        case Type::U8: return ExprTypeTag::U8;
        case Type::U16: return ExprTypeTag::U16;
        case Type::U32: return ExprTypeTag::U32;
        case Type::U64: return ExprTypeTag::U64;
        default: break;
    }
    throw Error("Internal: invalid numeric type");
}

static ExprTypeTag mergeNumericTags(ExprTypeTag a, ExprTypeTag b, const char* ctx) {
    if (a == ExprTypeTag::D64 || b == ExprTypeTag::D64) {
        if (a == ExprTypeTag::I64 || b == ExprTypeTag::I64) {
            throw Error(std::string("Type error: mixed i64/d64 in ") + ctx);
        }
        if (a == ExprTypeTag::IntLiteral || b == ExprTypeTag::IntLiteral) {
            return ExprTypeTag::D64;
        }
        if (a == ExprTypeTag::D64 && b == ExprTypeTag::D64) {
            return ExprTypeTag::D64;
        }
        throw Error(std::string("Type error: mixed unsigned/d64 in ") + ctx);
    }

    if (!isIntegerTag(a) || !isIntegerTag(b)) {
        throw Error("Internal: unexpected numeric tags");
    }

    bool aUnsigned = isUnsignedTag(a);
    bool bUnsigned = isUnsignedTag(b);
    if (aUnsigned != bUnsigned) {
        throw Error(std::string("Type error: mixed signed/unsigned in ") + ctx);
    }
    if (aUnsigned) {
        int bits = unsignedBitsFromTag(a);
        int bitsB = unsignedBitsFromTag(b);
        if (bits == 0 || bitsB == 0) {
            throw Error("Internal: invalid unsigned tag");
        }
        return tagFromType(unsignedTypeFromBits((bits > bitsB) ? bits : bitsB));
    }
    if (a == ExprTypeTag::I64 || b == ExprTypeTag::I64) {
        return ExprTypeTag::I64;
    }
    return ExprTypeTag::IntLiteral;
}

static bool isStrExpr(const Expr& e, const CodegenCtx& cg);
static void checkCallArgs(const Expr& e, const CodegenCtx& cg, Mode mode);

static ExprTypeTag inferExprTypeTag(const Expr& e, const CodegenCtx& cg, Mode mode) {
    using K = Expr::Kind;
    switch (e.kind) {
        case K::Num:
            if (isHexLiteralText(e.numText)) {
                return ExprTypeTag::U64;
            }
            if (isFloatLiteralText(e.numText)) {
                if (mode == Mode::I64Only) {
                    throw Error("Expected integer literal, got '" + e.numText + "'");
                }
                return ExprTypeTag::D64;
            }
            return ExprTypeTag::IntLiteral;
        case K::Str:
            throw Error("Type error: string is not allowed in numeric expression");
        case K::Var: {
            auto v = cg.getVar(e.var);
            if (v.type == Type::Str) {
                throw Error("Type error: string is not allowed in numeric expression");
            }
            return tagFromType(v.type);
        }
        case K::Call: {
            const auto& sig = cg.getFuncSig(e.callName);
            checkCallArgs(e, cg, mode);
            if (sig.retType == Type::Void || sig.retType == Type::Str) {
                throw Error("Type error: function '" + e.callName + "' does not return a numeric value");
            }
            return tagFromType(sig.retType);
        }
        case K::VolatileLoad: {
            Type pt = resolvePtrExprType(*e.lhs, cg, mode);
            Type base = ptrPointee(pt);
            if (base == Type::D64) {
                throw Error("Type error: volatile_load does not support d64");
            }
            if (!isIntegerType(base)) {
                throw Error("Type error: volatile_load expects ptr to integer");
            }
            return tagFromType(base);
        }
        case K::In8:
        case K::In16:
        case K::In32: {
            Type portType = resolveIntExprType(*e.lhs, cg, mode);
            if (portType != Type::U16) {
                if (!isUnsignedLiteralAssignable(*e.lhs, Type::U16)) {
                    throw Error("Type error: in* expects u16 port");
                }
            }
            if (e.kind == K::In8) return ExprTypeTag::U8;
            if (e.kind == K::In16) return ExprTypeTag::U16;
            return ExprTypeTag::U32;
        }
        case K::AddrOf:
        case K::Null:
        case K::PtrAddBytes:
            throw Error("Type error: ptr expression is not allowed in numeric context");
        case K::Cast: {
            if (isPtrType(e.castType)) {
                throw Error("Type error: ptr cast is not allowed in numeric context");
            }
            if (isPtrExpr(*e.lhs, cg, mode)) {
                if (e.castType != Type::U64) {
                    throw Error("Type error: ptr can only be cast to u64");
                }
                return ExprTypeTag::U64;
            }
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            if (lt == ExprTypeTag::D64) {
                throw Error("Type error: casting from d64 is not supported");
            }
            if (!isIntegerType(e.castType)) {
                throw Error("Type error: only integer casts are supported");
            }
            return tagFromType(e.castType);
        }
        case K::Add:
        case K::Sub:
        case K::Mul:
        case K::Div:
        case K::Mod: {
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, mode);
            return mergeNumericTags(lt, rt, "expression");
        }
        case K::Shl:
        case K::Shr: {
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, mode);
            if (lt == ExprTypeTag::D64 || rt == ExprTypeTag::D64) {
                throw Error("Type error: shifts are only allowed for integer types");
            }
            return lt;
        }
        case K::BitAnd:
        case K::BitXor:
        case K::BitOr: {
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, mode);
            if (lt == ExprTypeTag::D64 || rt == ExprTypeTag::D64) {
                throw Error("Type error: bitwise ops are only allowed for integer types");
            }
            return mergeNumericTags(lt, rt, "bitwise");
        }
        case K::BitNot: {
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            if (lt == ExprTypeTag::D64) {
                throw Error("Type error: bitwise ops are only allowed for integer types");
            }
            return lt;
        }
        case K::Deref: {
            Type pt = resolvePtrExprType(*e.lhs, cg, mode);
            Type base = ptrPointee(pt);
            if (base == Type::D64) return ExprTypeTag::D64;
            if (!isIntegerType(base)) {
                throw Error("Type error: invalid dereference type");
            }
            return tagFromType(base);
        }
        case K::Cmp:
        case K::And: {
            bool lPtr = isPtrExpr(*e.lhs, cg, mode) || isNullExpr(*e.lhs);
            bool rPtr = isPtrExpr(*e.rhs, cg, mode) || isNullExpr(*e.rhs);
            if (lPtr || rPtr) {
                if (!(lPtr && rPtr)) {
                    throw Error("Type error: ptr comparison requires ptr on both sides");
                }
                if (e.cmpOp != Expr::CmpOp::Eq && e.cmpOp != Expr::CmpOp::Ne) {
                    throw Error("Type error: only == and != are allowed for ptr");
                }
                if (!isNullExpr(*e.lhs) && !isNullExpr(*e.rhs)) {
                    Type lt = resolvePtrExprType(*e.lhs, cg, mode);
                    Type rt = resolvePtrExprType(*e.rhs, cg, mode);
                    if (lt != rt) {
                        throw Error("Type error: ptr comparison requires same element type");
                    }
                }
                return ExprTypeTag::I64;
            }
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, mode);
            if (lt == ExprTypeTag::D64 || rt == ExprTypeTag::D64) {
                if ((lt == ExprTypeTag::D64 && (rt == ExprTypeTag::D64 || rt == ExprTypeTag::IntLiteral)) ||
                    (rt == ExprTypeTag::D64 && (lt == ExprTypeTag::D64 || lt == ExprTypeTag::IntLiteral))) {
                    return ExprTypeTag::D64;
                }
                throw Error("Type error: mixed numeric kinds in comparison");
            }
            bool lUnsigned = isUnsignedTag(lt);
            bool rUnsigned = isUnsignedTag(rt);
            if (lUnsigned != rUnsigned) {
                throw Error("Type error: mixed signed/unsigned in comparison");
            }
            if (mode == Mode::D64Only && lt == ExprTypeTag::IntLiteral && rt == ExprTypeTag::IntLiteral) {
                return ExprTypeTag::D64;
            }
            return ExprTypeTag::I64;
        }
        case K::LogAnd:
        case K::LogOr: {
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, mode);
            if (lt == ExprTypeTag::D64 || rt == ExprTypeTag::D64) {
                throw Error("Type error: logical ops are only allowed for integer types");
            }
            return ExprTypeTag::I64;
        }
        case K::Not: {
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            if (lt == ExprTypeTag::D64) {
                throw Error("Type error: logical ops are only allowed for integer types");
            }
            return ExprTypeTag::I64;
        }
        case K::Sqrt:
        case K::Abs: {
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            if (isUnsignedTag(lt)) {
                throw Error("Type error: unsigned is not allowed in sqrt/abs");
            }
            return lt;
        }
        case K::Pow:
        case K::Min:
        case K::Max: {
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, mode);
            auto merged = mergeNumericTags(lt, rt, "expression");
            if (isUnsignedTag(merged)) {
                throw Error("Type error: unsigned is not allowed in pow/min/max");
            }
            return merged;
        }
        case K::Sin:
        case K::Cos:
        case K::Tan:
            if (mode == Mode::I64Only) {
                throw Error("sin/cos/tan are only available in d64 mode");
            }
            return ExprTypeTag::D64;
    }
    throw Error("Internal: unknown expr kind");
}

static Type resolveIntExprType(const Expr& e, const CodegenCtx& cg, Mode mode) {
    ExprTypeTag tag = inferExprTypeTag(e, cg, mode);
    if (tag == ExprTypeTag::D64) {
        throw Error("Type error: expected integer expression");
    }
    if (tag == ExprTypeTag::IntLiteral) {
        return Type::I64;
    }
    return tagToType(tag);
}

static bool isNullExpr(const Expr& e) {
    return e.kind == Expr::Kind::Null;
}

static Type resolvePtrExprType(const Expr& e, const CodegenCtx& cg, Mode mode) {
    using K = Expr::Kind;
    switch (e.kind) {
        case K::Var: {
            auto v = cg.getVar(e.var);
            if (!isPtrType(v.type)) {
                throw Error("Type error: expected ptr expression");
            }
            return v.type;
        }
        case K::Call: {
            const auto& sig = cg.getFuncSig(e.callName);
            checkCallArgs(e, cg, mode);
            if (!isPtrType(sig.retType)) {
                throw Error("Type error: function '" + e.callName + "' does not return ptr");
            }
            return sig.retType;
        }
        case K::AddrOf: {
            auto v = cg.getVar(e.var);
            if (!isIntegerType(v.type) && v.type != Type::D64) {
                throw Error("Type error: '&' is only allowed on numeric variables");
            }
            return makePtrType(v.type);
        }
        case K::Cast: {
            if (!isPtrType(e.castType)) {
                throw Error("Type error: expected ptr cast");
            }
            Type src = resolveIntExprType(*e.lhs, cg, mode);
            if (src != Type::U64 && src != Type::I64) {
                throw Error("Type error: ptr cast expects u64/i64 expression");
            }
            return e.castType;
        }
        case K::Add:
        case K::Sub: {
            Type base = resolvePtrExprType(*e.lhs, cg, mode);
            Type idx = resolveIntExprType(*e.rhs, cg, mode);
            (void)idx;
            return base;
        }
        case K::PtrAddBytes: {
            Type base = resolvePtrExprType(*e.lhs, cg, mode);
            Type idx = resolveIntExprType(*e.rhs, cg, mode);
            (void)idx;
            return base;
        }
        case K::Null:
            throw Error("Type error: null needs a ptr context");
        default:
            break;
    }
    throw Error("Type error: expected ptr expression");
}

static bool isPtrExpr(const Expr& e, const CodegenCtx& cg, Mode mode) {
    try {
        (void)resolvePtrExprType(e, cg, mode);
        return true;
    } catch (...) {
        return false;
    }
}

static void checkCallArgs(const Expr& e, const CodegenCtx& cg, Mode mode) {
    const auto& sig = cg.getFuncSig(e.callName);
    if (e.callArgs.size() != sig.params.size()) {
        throw Error("Function '" + e.callName + "' expects " + std::to_string(sig.params.size()) +
                    " args, got " + std::to_string(e.callArgs.size()));
    }
    for (size_t i = 0; i < e.callArgs.size(); ++i) {
        Type paramType = sig.params[i];
        const Expr& arg = *e.callArgs[i];
        if (paramType == Type::Str) {
            if (!isStrExpr(arg, cg)) {
                throw Error("Type error: argument " + std::to_string(i + 1) + " of '" + e.callName +
                            "' expects str");
            }
            continue;
        }
        if (isPtrType(paramType)) {
            if (isNullExpr(arg)) {
                continue;
            }
            Type argPtr = resolvePtrExprType(arg, cg, mode);
            if (argPtr != paramType) {
                throw Error("Type error: argument " + std::to_string(i + 1) + " of '" + e.callName +
                            "' expects " + typeName(paramType));
            }
            continue;
        }
        if (paramType == Type::Void) {
            throw Error("Internal: void parameter type");
        }
        ExprTypeTag tag = inferExprTypeTag(arg, cg, mode);
        if (tag == ExprTypeTag::IntLiteral) {
            if (paramType == Type::I64 || paramType == Type::D64) {
                continue;
            }
            if (isUnsignedType(paramType) && isUnsignedLiteralAssignable(arg, paramType)) {
                continue;
            }
            throw Error("Type error: argument " + std::to_string(i + 1) + " of '" + e.callName +
                        "' expects " + typeName(paramType));
        }
        Type argType = tagToType(tag);
        if (paramType == Type::D64) {
            if (argType != Type::D64) {
                throw Error("Type error: argument " + std::to_string(i + 1) + " of '" + e.callName +
                            "' expects d64");
            }
            continue;
        }
        if (paramType == Type::I64) {
            if (argType != Type::I64) {
                throw Error("Type error: argument " + std::to_string(i + 1) + " of '" + e.callName +
                            "' expects i64");
            }
            continue;
        }
        if (!isUnsignedType(paramType)) {
            throw Error("Internal: invalid parameter type");
        }
        if (!isUnsignedType(argType)) {
            if (!isUnsignedLiteralAssignable(arg, paramType)) {
                throw Error("Type error: argument " + std::to_string(i + 1) + " of '" + e.callName +
                            "' expects " + typeName(paramType));
            }
            continue;
        }
        if (unsignedBits(argType) > unsignedBits(paramType)) {
            if (!isUnsignedLiteralAssignable(arg, paramType)) {
                throw Error("Type error: argument " + std::to_string(i + 1) + " of '" + e.callName +
                            "' expects " + typeName(paramType) + ", got " + typeName(argType));
            }
        }
    }
}

static Type resolvePrintType(const Expr& e, const CodegenCtx& cg, Mode mode) {
    ExprTypeTag tag = inferExprTypeTag(e, cg, mode);
    if (tag == ExprTypeTag::IntLiteral) {
        return (mode == Mode::D64Only) ? Type::D64 : Type::I64;
    }
    if (tag == ExprTypeTag::D64) {
        if (mode == Mode::I64Only) {
            throw Error("d64 expression is not allowed in main_i64");
        }
        return Type::D64;
    }
    Type t = tagToType(tag);
    if (mode == Mode::D64Only) {
        throw Error("integer expression is not allowed in main_d64");
    }
    return t;
}

struct GenResult {
    std::string text;
    std::vector<CodegenCtx::StrLit> strLits;
};

static Type resolveCondType(const Expr& e, const CodegenCtx& cg, Mode mode) {
    ExprTypeTag tag = inferExprTypeTag(e, cg, mode);
    if (tag == ExprTypeTag::IntLiteral) {
        return (mode == Mode::D64Only) ? Type::D64 : Type::I64;
    }
    if (tag == ExprTypeTag::D64) {
        return Type::D64;
    }
    Type t = tagToType(tag);
    if (mode == Mode::D64Only) {
        throw Error("integer expression is not allowed in main_d64");
    }
    return t;
}

static bool isStrExpr(const Expr& e, const CodegenCtx& cg) {
    if (e.kind == Expr::Kind::Str) return true;
    if (e.kind == Expr::Kind::Var) {
        auto v = cg.getVar(e.var);
        return v.type == Type::Str;
    }
    if (e.kind == Expr::Kind::Call) {
        const auto& sig = cg.getFuncSig(e.callName);
        return sig.retType == Type::Str;
    }
    return false;
}

static void emitCondJumpFalse(std::ostringstream& out, CodegenCtx& cg, const Expr& cond,
                              int& labelId, Mode mode, const std::string& label) {
    if (isPtrExpr(cond, cg, mode) || isNullExpr(cond)) {
        emitExprPtr(out, cg, cond, labelId);
        out << "    cmp  rax, 0\n";
        out << "    je   " << label << "\n";
        return;
    }
    Type condType = resolveCondType(cond, cg, mode);
    if (condType == Type::D64) {
        emitExprD64(out, cg, cond, labelId);
        out << "    xorpd xmm1, xmm1\n";
        out << "    ucomisd xmm0, xmm1\n";
        out << "    jp   " << label << "\n";
        out << "    je   " << label << "\n";
    } else {
        emitExprInt(out, cg, cond, labelId);
        out << "    cmp  rax, 0\n";
        out << "    je   " << label << "\n";
    }
}

static void emitStrToRegs(std::ostringstream& out, CodegenCtx& cg, const Expr& e,
                          int& labelId, const char* ptrReg, const char* lenReg) {
    if (e.kind == Expr::Kind::Str) {
        const auto& lit = cg.getOrAddStr(e.strText);
        out << "    lea  " << ptrReg << ", [rel " << lit.label << "]\n";
        out << "    mov  " << lenReg << ", " << lit.data.size() << "\n";
        return;
    }
    if (e.kind == Expr::Kind::Var) {
        auto v = cg.getVar(e.var);
        if (v.type != Type::Str) throw Error("Expected str expression");
        out << "    mov  " << ptrReg << ", [rbp-" << CodegenCtx::slotDisp(v.slot) << "]\n";
        out << "    mov  " << lenReg << ", [rbp-" << CodegenCtx::slotDisp(v.slot + 1) << "]\n";
        int id = labelId++;
        out << "    test " << lenReg << ", " << lenReg << "\n";
        out << "    jns  .str_len_ok_" << id << "\n";
        out << "    neg  " << lenReg << "\n";
        out << "    dec  " << lenReg << "\n";
        out << ".str_len_ok_" << id << ":\n";
        return;
    }
    if (e.kind == Expr::Kind::Call) {
        const auto& sig = cg.getFuncSig(e.callName);
        if (sig.retType != Type::Str) {
            throw Error("Type error: function '" + e.callName + "' does not return str");
        }
        emitCallExpr(out, cg, e, labelId);
        if (std::string(ptrReg) != "rax") {
            out << "    mov  " << ptrReg << ", rax\n";
        }
        if (std::string(lenReg) != "rdx") {
            out << "    mov  " << lenReg << ", rdx\n";
        }
        int id = labelId++;
        out << "    test " << lenReg << ", " << lenReg << "\n";
        out << "    jns  .str_len_ok_call_" << id << "\n";
        out << "    neg  " << lenReg << "\n";
        out << "    dec  " << lenReg << "\n";
        out << ".str_len_ok_call_" << id << ":\n";
        return;
    }
    throw Error("Expected str expression");
}

static int typeSlotCount(Type t) {
    return (t == Type::Str) ? 2 : 1;
}

static void emitCallExpr(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId) {
    checkCallArgs(e, cg, cg.mode);
    const auto& sig = cg.getFuncSig(e.callName);
    int totalSlots = 0;
    for (Type t : sig.params) totalSlots += typeSlotCount(t);
    int alignPad = (totalSlots % 2 == 0) ? 8 : 0;
    if (alignPad) out << "    sub  rsp, 8\n";
    for (int i = (int)e.callArgs.size() - 1; i >= 0; --i) {
        Type paramType = sig.params[(size_t)i];
        const auto& arg = *e.callArgs[(size_t)i];
        if (paramType == Type::I64 || isUnsignedType(paramType)) {
            emitExprInt(out, cg, arg, labelId);
            out << "    push rax\n";
        } else if (isPtrType(paramType)) {
            emitExprPtr(out, cg, arg, labelId);
            out << "    push rax\n";
        } else if (paramType == Type::D64) {
            emitExprD64(out, cg, arg, labelId);
            out << "    sub  rsp, 8\n";
            out << "    movsd [rsp], xmm0\n";
        } else if (paramType == Type::Str) {
            emitStrToRegs(out, cg, arg, labelId, "rax", "rdx");
            out << "    sub  rsp, 8\n";
            out << "    mov  [rsp], rdx\n";
            out << "    sub  rsp, 8\n";
            out << "    mov  [rsp], rax\n";
        } else {
            throw Error("Internal: invalid parameter type");
        }
    }
    out << "    call " << e.callName << "\n";
    int cleanup = totalSlots * 8 + alignPad;
    if (cleanup) out << "    add  rsp, " << cleanup << "\n";
    if (sig.retType == Type::Void) {
        // no result
    } else if (sig.retType == Type::Str) {
        // rax=ptr, rdx=len
    } else {
        // rax or xmm0 already set
    }
}

static void emitFreeStrIfOwned(std::ostringstream& out, int slot, int& labelId) {
    int id = labelId++;
    out << "    mov  rax, [rbp-" << CodegenCtx::slotDisp(slot + 1) << "]\n";
    out << "    test rax, rax\n";
    out << "    jns  .str_free_done_" << id << "\n";
    out << "    mov  rsi, rax\n";
    out << "    neg  rsi\n";
    out << "    dec  rsi\n";
    out << "    mov  rdi, [rbp-" << CodegenCtx::slotDisp(slot) << "]\n";
    out << "    sub  rsp, 8\n";
    out << "    call rt_str_free\n";
    out << "    add  rsp, 8\n";
    out << ".str_free_done_" << id << ":\n";
}

static void emitAssignStrExpr(std::ostringstream& out, CodegenCtx& cg, const Expr& e,
                              int slot, int& labelId, bool freeOld) {
    if (freeOld) {
        emitFreeStrIfOwned(out, slot, labelId);
    }
    if (e.kind == Expr::Kind::Str) {
        const auto& lit = cg.getOrAddStr(e.strText);
        out << "    lea  rax, [rel " << lit.label << "]\n";
        out << "    mov  rdx, " << lit.data.size() << "\n";
        out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot) << "], rax\n";
        out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot + 1) << "], rdx\n";
        return;
    }
    if (e.kind == Expr::Kind::Var) {
        auto v = cg.getVar(e.var);
        if (v.type != Type::Str) throw Error("Expected str expression");
        int id = labelId++;
        out << "    mov  rdi, [rbp-" << CodegenCtx::slotDisp(v.slot) << "]\n";
        out << "    mov  rsi, [rbp-" << CodegenCtx::slotDisp(v.slot + 1) << "]\n";
        out << "    test rsi, rsi\n";
        out << "    jns  .str_copy_len_ok_" << id << "\n";
        out << "    neg  rsi\n";
        out << "    dec  rsi\n";
        out << ".str_copy_len_ok_" << id << ":\n";
        out << "    cmp  rsi, 0\n";
        out << "    je   .str_copy_empty_" << id << "\n";
        out << "    sub  rsp, 8\n";
        out << "    call rt_str_copy\n";
        out << "    add  rsp, 8\n";
        out << "    neg  rdx\n";
        out << "    dec  rdx\n";
        out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot) << "], rax\n";
        out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot + 1) << "], rdx\n";
        out << "    jmp  .str_copy_done_" << id << "\n";
        out << ".str_copy_empty_" << id << ":\n";
        out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot) << "], rdi\n";
        out << "    mov  qword [rbp-" << CodegenCtx::slotDisp(slot + 1) << "], 0\n";
        out << ".str_copy_done_" << id << ":\n";
        return;
    }
    if (e.kind == Expr::Kind::Call) {
        const auto& sig = cg.getFuncSig(e.callName);
        if (sig.retType != Type::Str) throw Error("Expected str expression");
        emitCallExpr(out, cg, e, labelId);
        out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot) << "], rax\n";
        out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot + 1) << "], rdx\n";
        return;
    }
    throw Error("Expected str expression");
}

static void emitCleanupStrs(std::ostringstream& out, const CodegenCtx& cg, int& labelId, int skipSlot = -1) {
    for (int slot : cg.strSlots) {
        if (slot == skipSlot) continue;
        emitFreeStrIfOwned(out, slot, labelId);
    }
}

struct LoopContext {
    std::string breakLabel;
    std::string continueLabel;
};

static bool emitStmt(std::ostringstream& out, CodegenCtx& cg, const Stmt& st, int& labelId, Mode mode, Type retType,
                     std::vector<LoopContext>& loops) {
    bool hasRet = false;
    if (st.kind == Stmt::Kind::AutoAssign) {
        if (mode == Mode::Mixed) {
            throw Error("auto is not allowed in 'main' (use i64 or d64)");
        }
        Type t = (mode == Mode::D64Only) ? Type::D64 : Type::I64;
        int slot = cg.allocSlot(st.name, t);
        if (t == Type::D64) {
            emitExprD64(out, cg, *st.expr, labelId);
            out << "    movsd [rbp-" << CodegenCtx::slotDisp(slot) << "], xmm0\n";
        } else {
            Type srcType = resolveIntExprType(*st.expr, cg, mode);
            if (srcType != Type::I64) {
                throw Error("Type error: expected i64 expression");
            }
            emitExprInt(out, cg, *st.expr, labelId);
            out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot) << "], rax\n";
        }
        return false;
    }

    if (st.kind == Stmt::Kind::TypedAssign) {
        if (mode == Mode::I64Only && st.declType == Type::D64) {
            throw Error("d64 variables are not allowed in main_i64");
        }
        if (mode == Mode::D64Only && isIntegerType(st.declType)) {
            throw Error("integer variables are not allowed in main_d64");
        }
        int slot = cg.allocSlot(st.name, st.declType);
        if (st.declType == Type::Str) {
            emitAssignStrExpr(out, cg, *st.expr, slot, labelId, false);
        } else if (st.declType == Type::D64) {
            emitExprD64(out, cg, *st.expr, labelId);
            out << "    movsd [rbp-" << CodegenCtx::slotDisp(slot) << "], xmm0\n";
        } else if (isPtrType(st.declType)) {
            if (isNullExpr(*st.expr)) {
                out << "    xor  eax, eax\n";
                out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot) << "], rax\n";
                return false;
            }
            Type srcPtr = resolvePtrExprType(*st.expr, cg, mode);
            if (srcPtr != st.declType) {
                throw Error("Type error: expected " + std::string(typeName(st.declType)) + " expression");
            }
            emitExprPtr(out, cg, *st.expr, labelId);
            out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot) << "], rax\n";
            return false;
        } else {
            Type srcType = resolveIntExprType(*st.expr, cg, mode);
            if (st.declType == Type::I64) {
                if (srcType != Type::I64) {
                    throw Error("Type error: expected i64 expression");
                }
            } else {
                if (!isUnsignedType(srcType)) {
                    if (!isUnsignedLiteralAssignable(*st.expr, st.declType)) {
                        throw Error("Type error: expected " + std::string(typeName(st.declType)) + " expression");
                    }
                } else if (unsignedBits(srcType) > unsignedBits(st.declType)) {
                    if (!isUnsignedLiteralAssignable(*st.expr, st.declType)) {
                        throw Error("Type error: expected " + std::string(typeName(st.declType)) + " expression");
                    }
                }
            }
            emitExprInt(out, cg, *st.expr, labelId);
            if (isUnsignedType(st.declType)) {
                emitMaskUnsigned(out, st.declType);
            }
            out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot) << "], rax\n";
        }
        return false;
    }

    if (st.kind == Stmt::Kind::Assign) {
        auto v = cg.getVar(st.name);
        if (v.type == Type::Str) {
            if (st.assignOp == Stmt::AssignOp::Eq) {
                emitAssignStrExpr(out, cg, *st.expr, v.slot, labelId, true);
                return false;
            }
            if (st.assignOp == Stmt::AssignOp::AddEq) {
                int id = labelId++;
                out << "    mov  r8, [rbp-" << CodegenCtx::slotDisp(v.slot) << "]\n";
                out << "    mov  r9, [rbp-" << CodegenCtx::slotDisp(v.slot + 1) << "]\n";
                out << "    mov  rsi, r9\n";
                out << "    test rsi, rsi\n";
                out << "    jns  .str_add_len_ok_" << id << "\n";
                out << "    neg  rsi\n";
                out << "    dec  rsi\n";
                out << ".str_add_len_ok_" << id << ":\n";
                emitStrToRegs(out, cg, *st.expr, labelId, "rdx", "rcx");
                out << "    cmp  rcx, 0\n";
                out << "    je   .str_add_done_" << id << "\n";
                out << "    cmp  rsi, 0\n";
                out << "    je   .str_add_take_rhs_" << id << "\n";
                out << "    mov  rdi, r8\n";
                out << "    sub  rsp, 8\n";
                out << "    call rt_str_concat\n";
                out << "    add  rsp, 8\n";
                out << "    test r9, r9\n";
                out << "    jns  .str_add_store_" << id << "\n";
                out << "    mov  rdi, r8\n";
                out << "    mov  rsi, r9\n";
                out << "    neg  rsi\n";
                out << "    dec  rsi\n";
                out << "    sub  rsp, 8\n";
                out << "    call rt_str_free\n";
                out << "    add  rsp, 8\n";
                out << ".str_add_store_" << id << ":\n";
                out << "    neg  rdx\n";
                out << "    dec  rdx\n";
                out << "    mov  [rbp-" << CodegenCtx::slotDisp(v.slot) << "], rax\n";
                out << "    mov  [rbp-" << CodegenCtx::slotDisp(v.slot + 1) << "], rdx\n";
                out << "    jmp  .str_add_done_" << id << "\n";
                out << ".str_add_take_rhs_" << id << ":\n";
                out << "    test r9, r9\n";
                out << "    jns  .str_add_copy_rhs_" << id << "\n";
                out << "    mov  rdi, r8\n";
                out << "    mov  rsi, r9\n";
                out << "    neg  rsi\n";
                out << "    dec  rsi\n";
                out << "    sub  rsp, 8\n";
                out << "    call rt_str_free\n";
                out << "    add  rsp, 8\n";
                out << ".str_add_copy_rhs_" << id << ":\n";
                out << "    mov  rdi, rdx\n";
                out << "    mov  rsi, rcx\n";
                out << "    sub  rsp, 8\n";
                out << "    call rt_str_copy\n";
                out << "    add  rsp, 8\n";
                out << "    neg  rdx\n";
                out << "    dec  rdx\n";
                out << "    mov  [rbp-" << CodegenCtx::slotDisp(v.slot) << "], rax\n";
                out << "    mov  [rbp-" << CodegenCtx::slotDisp(v.slot + 1) << "], rdx\n";
                out << ".str_add_done_" << id << ":\n";
                return false;
            }
            throw Error("str assignment supports only '=' and '+='");
        } else if (isPtrType(v.type)) {
            if (st.assignOp != Stmt::AssignOp::Eq) {
                throw Error("ptr assignment supports only '='");
            }
            if (isNullExpr(*st.expr)) {
                out << "    xor  eax, eax\n";
                out << "    mov  [rbp-" << CodegenCtx::slotDisp(v.slot) << "], rax\n";
                return false;
            }
            Type srcPtr = resolvePtrExprType(*st.expr, cg, mode);
            if (srcPtr != v.type) {
                throw Error("Type error: expected " + std::string(typeName(v.type)) + " expression");
            }
            emitExprPtr(out, cg, *st.expr, labelId);
            out << "    mov  [rbp-" << CodegenCtx::slotDisp(v.slot) << "], rax\n";
            return false;
        } else if (v.type == Type::D64) {
            if (st.assignOp == Stmt::AssignOp::Eq) {
                emitExprD64(out, cg, *st.expr, labelId);
                out << "    movsd [rbp-" << CodegenCtx::slotDisp(v.slot) << "], xmm0\n";
                return false;
            }
            emitExprD64(out, cg, *st.expr, labelId);
            out << "    movsd xmm1, [rbp-" << CodegenCtx::slotDisp(v.slot) << "]\n";
            switch (st.assignOp) {
                case Stmt::AssignOp::AddEq: out << "    addsd xmm1, xmm0\n"; break;
                case Stmt::AssignOp::SubEq: out << "    subsd xmm1, xmm0\n"; break;
                case Stmt::AssignOp::MulEq: out << "    mulsd xmm1, xmm0\n"; break;
                case Stmt::AssignOp::DivEq: out << "    divsd xmm1, xmm0\n"; break;
                default: break;
            }
            out << "    movsd [rbp-" << CodegenCtx::slotDisp(v.slot) << "], xmm1\n";
            return false;
        } else {
            Type srcType = resolveIntExprType(*st.expr, cg, mode);
            if (v.type == Type::I64) {
                if (srcType != Type::I64) {
                    throw Error("Type error: expected i64 expression");
                }
            } else {
                if (!isUnsignedType(srcType)) {
                    if (!isUnsignedLiteralAssignable(*st.expr, v.type)) {
                        throw Error("Type error: expected " + std::string(typeName(v.type)) + " expression");
                    }
                } else if (unsignedBits(srcType) > unsignedBits(v.type)) {
                    if (!isUnsignedLiteralAssignable(*st.expr, v.type)) {
                        throw Error("Type error: expected " + std::string(typeName(v.type)) + " expression");
                    }
                }
            }
            if (st.assignOp == Stmt::AssignOp::Eq) {
                emitExprInt(out, cg, *st.expr, labelId);
                if (isUnsignedType(v.type)) {
                    emitMaskUnsigned(out, v.type);
                }
                out << "    mov  [rbp-" << CodegenCtx::slotDisp(v.slot) << "], rax\n";
                return false;
            }
            emitExprInt(out, cg, *st.expr, labelId);
            out << "    mov  rcx, [rbp-" << CodegenCtx::slotDisp(v.slot) << "]\n";
            switch (st.assignOp) {
                case Stmt::AssignOp::AddEq:
                    out << "    add  rax, rcx\n";
                    break;
                case Stmt::AssignOp::SubEq:
                    out << "    sub  rcx, rax\n";
                    out << "    mov  rax, rcx\n";
                    break;
                case Stmt::AssignOp::MulEq:
                    out << "    imul rax, rcx\n";
                    break;
                case Stmt::AssignOp::DivEq:
                    out << "    mov  r8, rax\n";
                    out << "    mov  rax, rcx\n";
                    if (isUnsignedType(v.type)) {
                        out << "    xor  edx, edx\n";
                        out << "    div  r8\n";
                    } else {
                        out << "    cqo\n";
                        out << "    idiv r8\n";
                    }
                    break;
                default:
                    break;
            }
            if (isUnsignedType(v.type)) {
                emitMaskUnsigned(out, v.type);
            }
            out << "    mov  [rbp-" << CodegenCtx::slotDisp(v.slot) << "], rax\n";
            return false;
        }
        return false;
    }

    if (st.kind == Stmt::Kind::PtrStore) {
        Type pt = resolvePtrExprType(*st.ptrExpr, cg, mode);
        Type base = ptrPointee(pt);
        emitExprPtr(out, cg, *st.ptrExpr, labelId);
        out << "    push rax\n";
        if (base == Type::D64) {
            emitExprD64(out, cg, *st.expr, labelId);
            out << "    pop  rax\n";
            out << "    movsd [rax], xmm0\n";
            return false;
        }
        if (!isIntegerType(base)) {
            throw Error("Type error: ptr store supports only integer/d64");
        }
        Type srcType = resolveIntExprType(*st.expr, cg, mode);
        if (base == Type::I64) {
            if (srcType != Type::I64) {
                throw Error("Type error: expected i64 expression");
            }
        } else {
            if (!isUnsignedType(srcType)) {
                if (!isUnsignedLiteralAssignable(*st.expr, base)) {
                    throw Error("Type error: expected " + std::string(typeName(base)) + " expression");
                }
            } else if (unsignedBits(srcType) > unsignedBits(base)) {
                if (!isUnsignedLiteralAssignable(*st.expr, base)) {
                    throw Error("Type error: expected " + std::string(typeName(base)) + " expression");
                }
            }
        }
        emitExprInt(out, cg, *st.expr, labelId);
        if (isUnsignedType(base)) {
            emitMaskUnsigned(out, base);
        }
        out << "    pop  rcx\n";
        switch (base) {
            case Type::U8:  out << "    mov  byte [rcx], al\n"; break;
            case Type::U16: out << "    mov  word [rcx], ax\n"; break;
            case Type::U32: out << "    mov  dword [rcx], eax\n"; break;
            case Type::U64: out << "    mov  qword [rcx], rax\n"; break;
            case Type::I64: out << "    mov  qword [rcx], rax\n"; break;
            default: break;
        }
        return false;
    }
    if (st.kind == Stmt::Kind::VolatileStore) {
        Type pt = resolvePtrExprType(*st.ptrExpr, cg, mode);
        Type base = ptrPointee(pt);
        if (base == Type::D64) {
            throw Error("Type error: volatile_store does not support d64");
        }
        emitExprPtr(out, cg, *st.ptrExpr, labelId);
        out << "    push rax\n";
        if (!isIntegerType(base)) {
            throw Error("Type error: volatile_store expects ptr to integer");
        }
        Type srcType = resolveIntExprType(*st.expr, cg, mode);
        if (base == Type::I64) {
            if (srcType != Type::I64) {
                throw Error("Type error: expected i64 expression");
            }
        } else {
            if (!isUnsignedType(srcType)) {
                if (!isUnsignedLiteralAssignable(*st.expr, base)) {
                    throw Error("Type error: expected " + std::string(typeName(base)) + " expression");
                }
            } else if (unsignedBits(srcType) > unsignedBits(base)) {
                if (!isUnsignedLiteralAssignable(*st.expr, base)) {
                    throw Error("Type error: expected " + std::string(typeName(base)) + " expression");
                }
            }
        }
        emitExprInt(out, cg, *st.expr, labelId);
        if (isUnsignedType(base)) {
            emitMaskUnsigned(out, base);
        }
        out << "    pop  rcx\n";
        switch (base) {
            case Type::U8:  out << "    mov  byte [rcx], al\n"; break;
            case Type::U16: out << "    mov  word [rcx], ax\n"; break;
            case Type::U32: out << "    mov  dword [rcx], eax\n"; break;
            case Type::U64: out << "    mov  qword [rcx], rax\n"; break;
            case Type::I64: out << "    mov  qword [rcx], rax\n"; break;
            default: break;
        }
        return false;
    }
    if (st.kind == Stmt::Kind::Out8 || st.kind == Stmt::Kind::Out16 || st.kind == Stmt::Kind::Out32) {
        Type portType = resolveIntExprType(*st.expr, cg, mode);
        if (portType != Type::U16) {
            if (!isUnsignedLiteralAssignable(*st.expr, Type::U16)) {
                throw Error("Type error: out* expects u16 port");
            }
        }
        Type valType = resolveIntExprType(*st.expr2, cg, mode);
        if (st.kind == Stmt::Kind::Out8) {
            if (valType != Type::U8) {
                if (!isUnsignedLiteralAssignable(*st.expr2, Type::U8)) {
                    throw Error("Type error: out8 expects u8 value");
                }
            }
        } else if (st.kind == Stmt::Kind::Out16) {
            if (valType != Type::U16) {
                if (!isUnsignedLiteralAssignable(*st.expr2, Type::U16)) {
                    throw Error("Type error: out16 expects u16 value");
                }
            }
        } else {
            if (valType != Type::U32) {
                if (!isUnsignedLiteralAssignable(*st.expr2, Type::U32)) {
                    throw Error("Type error: out32 expects u32 value");
                }
            }
        }
        emitExprInt(out, cg, *st.expr, labelId);
        out << "    mov  dx, ax\n";
        emitExprInt(out, cg, *st.expr2, labelId);
        if (st.kind == Stmt::Kind::Out8) {
            out << "    out  dx, al\n";
        } else if (st.kind == Stmt::Kind::Out16) {
            out << "    out  dx, ax\n";
        } else {
            out << "    out  dx, eax\n";
        }
        return false;
    }
    if (st.kind == Stmt::Kind::Asm0) {
        if (st.name == "cli") out << "    cli\n";
        else if (st.name == "sti") out << "    sti\n";
        else if (st.name == "hlt") out << "    hlt\n";
        else if (st.name == "nop") out << "    nop\n";
        else if (st.name == "pause") out << "    pause\n";
        else {
            throw Error("Unknown asm0 mnemonic '" + st.name + "'");
        }
        return false;
    }
    if (st.kind == Stmt::Kind::Asm1) {
        if (st.name != "lidt") {
            throw Error("Unknown asm1 mnemonic '" + st.name + "'");
        }
        Type pt = resolvePtrExprType(*st.expr, cg, mode);
        if (pt != Type::PtrU8) {
            throw Error("asm1(lidt, ...) expects ptr<u8>");
        }
        emitExprPtr(out, cg, *st.expr, labelId);
        out << "    lidt [rax]\n";
        return false;
    }
    if (st.kind == Stmt::Kind::BarrierFull) {
        out << "    mfence\n";
        return false;
    }
    if (st.kind == Stmt::Kind::BarrierLoad) {
        out << "    lfence\n";
        return false;
    }
    if (st.kind == Stmt::Kind::BarrierStore) {
        out << "    sfence\n";
        return false;
    }

    if (st.kind == Stmt::Kind::PrintI64) {
        if (mode == Mode::D64Only) {
            throw Error("print_i64 is not allowed in main_d64");
        }
        emitPrintI64(out, cg, *st.expr, labelId);
        return false;
    }
    if (st.kind == Stmt::Kind::PrintD64) {
        if (mode == Mode::I64Only) {
            throw Error("print_d64 is not allowed in main_i64");
        }
        emitPrintD64(out, cg, *st.expr, labelId);
        return false;
    }
    if (st.kind == Stmt::Kind::PrintHex) {
        if (mode == Mode::D64Only) {
            throw Error("print_hex is not allowed in main_d64");
        }
        emitPrintHex(out, cg, *st.expr, labelId);
        return false;
    }
    if (st.kind == Stmt::Kind::PrintStr) {
        emitPrintStr(out, cg, *st.expr, labelId);
        return false;
    }
    if (st.kind == Stmt::Kind::PrintList) {
        for (const auto& arg : st.exprs) {
            if (isStrExpr(*arg, cg)) {
                emitPrintStr(out, cg, *arg, labelId);
                continue;
            }
            Type t = resolvePrintType(*arg, cg, mode);
            if (t == Type::D64) {
                emitPrintD64(out, cg, *arg, labelId);
            } else {
                emitPrintInt(out, cg, *arg, labelId, t);
            }
        }
        return false;
    }
    if (st.kind == Stmt::Kind::ExprStmt) {
        if (!st.expr || st.expr->kind != Expr::Kind::Call) {
            throw Error("Only function calls are allowed as statements");
        }
        const auto& sig = cg.getFuncSig(st.expr->callName);
        if (sig.retType != Type::Void) {
            throw Error("Discarding return value of '" + st.expr->callName + "' is not allowed");
        }
        emitCallExpr(out, cg, *st.expr, labelId);
        return false;
    }
    if (st.kind == Stmt::Kind::If) {
        int endId = labelId++;
        for (size_t i = 0; i < st.ifBranches.size(); ++i) {
            const auto& br = st.ifBranches[i];
            int nextId = labelId++;
            if (br.cond) {
                emitCondJumpFalse(out, cg, *br.cond, labelId, mode, ".if_next_" + std::to_string(nextId));
            }
            for (const auto& inner : br.body) {
                if (emitStmt(out, cg, inner, labelId, mode, retType, loops)) {
                    hasRet = true;
                }
            }
            out << "    jmp  .if_end_" << endId << "\n";
            out << ".if_next_" << nextId << ":\n";
        }
        out << ".if_end_" << endId << ":\n";
        return hasRet;
    }
    if (st.kind == Stmt::Kind::Break) {
        if (loops.empty()) {
            throw Error("break is only allowed inside loops");
        }
        out << "    jmp  " << loops.back().breakLabel << "\n";
        return false;
    }
    if (st.kind == Stmt::Kind::Continue) {
        if (loops.empty()) {
            throw Error("continue is only allowed inside loops");
        }
        out << "    jmp  " << loops.back().continueLabel << "\n";
        return false;
    }
    if (st.kind == Stmt::Kind::While) {
        int startId = labelId++;
        int endId = labelId++;
        LoopContext loopCtx{".while_end_" + std::to_string(endId), ".while_start_" + std::to_string(startId)};
        loops.push_back(loopCtx);
        out << ".while_start_" << startId << ":\n";
        emitCondJumpFalse(out, cg, *st.cond, labelId, mode, ".while_end_" + std::to_string(endId));
        for (const auto& inner : st.body) {
            if (emitStmt(out, cg, inner, labelId, mode, retType, loops)) {
                hasRet = true;
            }
        }
        out << "    jmp  .while_start_" << startId << "\n";
        out << ".while_end_" << endId << ":\n";
        loops.pop_back();
        return hasRet;
    }
    if (st.kind == Stmt::Kind::For) {
        if (st.init) {
            if (emitStmt(out, cg, *st.init, labelId, mode, retType, loops)) {
                hasRet = true;
            }
        }
        int startId = labelId++;
        int stepId = labelId++;
        int endId = labelId++;
        LoopContext loopCtx{".for_end_" + std::to_string(endId), ".for_step_" + std::to_string(stepId)};
        loops.push_back(loopCtx);
        out << ".for_start_" << startId << ":\n";
        emitCondJumpFalse(out, cg, *st.cond, labelId, mode, ".for_end_" + std::to_string(endId));
        for (const auto& inner : st.body) {
            if (emitStmt(out, cg, inner, labelId, mode, retType, loops)) {
                hasRet = true;
            }
        }
        out << ".for_step_" << stepId << ":\n";
        if (st.step) {
            if (emitStmt(out, cg, *st.step, labelId, mode, retType, loops)) {
                hasRet = true;
            }
        }
        out << "    jmp  .for_start_" << startId << "\n";
        out << ".for_end_" << endId << ":\n";
        loops.pop_back();
        return hasRet;
    }

    if (st.kind == Stmt::Kind::Ret) {
        if (retType == Type::Void) {
            if (st.expr) {
                throw Error("Return value is not allowed in void function");
            }
            emitCleanupStrs(out, cg, labelId);
            out << "    leave\n";
            out << "    ret\n";
            return true;
        }
        if (!st.expr) {
            throw Error("Missing return value");
        }
        if (retType == Type::D64) {
            emitExprD64(out, cg, *st.expr, labelId);
            emitCleanupStrs(out, cg, labelId);
            out << "    leave\n";
            out << "    ret\n";
            return true;
        }
        if (isIntegerType(retType)) {
            Type srcType = resolveIntExprType(*st.expr, cg, mode);
            if (retType == Type::I64) {
                if (srcType != Type::I64) {
                    throw Error("Type error: expected i64 expression");
                }
            } else {
                if (!isUnsignedType(srcType)) {
                    if (!isUnsignedLiteralAssignable(*st.expr, retType)) {
                        throw Error("Type error: expected " + std::string(typeName(retType)) + " expression");
                    }
                } else if (unsignedBits(srcType) > unsignedBits(retType)) {
                    if (!isUnsignedLiteralAssignable(*st.expr, retType)) {
                        throw Error("Type error: expected " + std::string(typeName(retType)) + " expression");
                    }
                }
            }
            emitExprInt(out, cg, *st.expr, labelId);
            if (isUnsignedType(retType)) {
                emitMaskUnsigned(out, retType);
            }
            emitCleanupStrs(out, cg, labelId);
            out << "    leave\n";
            out << "    ret\n";
            return true;
        }
        if (retType == Type::Str) {
            int skipSlot = -1;
            if (st.expr->kind == Expr::Kind::Var) {
                auto v = cg.getVar(st.expr->var);
                if (v.type != Type::Str) {
                    throw Error("Return type mismatch for '" + st.expr->var + "'");
                }
                out << "    mov  rax, [rbp-" << CodegenCtx::slotDisp(v.slot) << "]\n";
                out << "    mov  rdx, [rbp-" << CodegenCtx::slotDisp(v.slot + 1) << "]\n";
                skipSlot = v.slot;
            } else if (st.expr->kind == Expr::Kind::Call) {
                const auto& sig = cg.getFuncSig(st.expr->callName);
                if (sig.retType != Type::Str) {
                    throw Error("Type error: function '" + st.expr->callName + "' does not return str");
                }
                emitCallExpr(out, cg, *st.expr, labelId);
            } else if (st.expr->kind == Expr::Kind::Str) {
                const auto& lit = cg.getOrAddStr(st.expr->strText);
                out << "    lea  rax, [rel " << lit.label << "]\n";
                out << "    mov  rdx, " << lit.data.size() << "\n";
            } else {
                throw Error("Invalid return expression for str");
            }
            emitCleanupStrs(out, cg, labelId, skipSlot);
            out << "    leave\n";
            out << "    ret\n";
            return true;
        }
        if (isPtrType(retType)) {
            if (isNullExpr(*st.expr)) {
                out << "    xor  eax, eax\n";
                emitCleanupStrs(out, cg, labelId);
                out << "    leave\n";
                out << "    ret\n";
                return true;
            }
            Type srcPtr = resolvePtrExprType(*st.expr, cg, mode);
            if (srcPtr != retType) {
                throw Error("Type error: expected " + std::string(typeName(retType)) + " expression");
            }
            emitExprPtr(out, cg, *st.expr, labelId);
            emitCleanupStrs(out, cg, labelId);
            out << "    leave\n";
            out << "    ret\n";
            return true;
        }
        throw Error("Internal: invalid return type");
    }

    throw Error("Internal: unknown statement kind");
}

static GenResult genFunctionAsm(const Func& f, Mode mode, Type retType,
                                const std::unordered_map<std::string, FuncSig>& funcs) {
    // v0: generate body for entrypoint only
    CodegenCtx cg;
    cg.funcs = &funcs;
    cg.mode = mode;
    cg.labelPrefix = f.name + "_";
    bool hasRet = false;

    // First pass: allocate slots on first encounter of auto
    // Second pass: emit with known slots (but we can allocate during emit too since we emit sequentially)
    // We'll do sequential allocation.

    std::ostringstream body;

    int labelId = 0;

    struct ParamMove {
        Type type;
        int slot;
        int offset;
    };
    std::vector<ParamMove> paramMoves;
    int paramOffset = 16;
    for (const auto& p : f.params) {
        int slot = cg.allocSlot(p.name, p.type);
        paramMoves.push_back(ParamMove{p.type, slot, paramOffset});
        paramOffset += typeSlotCount(p.type) * 8;
    }
    for (const auto& pm : paramMoves) {
        if (pm.type == Type::I64 || isUnsignedType(pm.type) || isPtrType(pm.type)) {
            body << "    mov  rax, [rbp+" << pm.offset << "]\n";
            if (isUnsignedType(pm.type)) {
                emitMaskUnsigned(body, pm.type);
            }
            body << "    mov  [rbp-" << CodegenCtx::slotDisp(pm.slot) << "], rax\n";
        } else if (pm.type == Type::D64) {
            body << "    movsd xmm0, [rbp+" << pm.offset << "]\n";
            body << "    movsd [rbp-" << CodegenCtx::slotDisp(pm.slot) << "], xmm0\n";
        } else if (pm.type == Type::Str) {
            int id = labelId++;
            body << "    mov  rax, [rbp+" << pm.offset << "]\n";
            body << "    mov  rdx, [rbp+" << (pm.offset + 8) << "]\n";
            body << "    test rdx, rdx\n";
            body << "    jns  .param_str_ok_" << id << "\n";
            body << "    neg  rdx\n";
            body << "    dec  rdx\n";
            body << ".param_str_ok_" << id << ":\n";
            body << "    mov  [rbp-" << CodegenCtx::slotDisp(pm.slot) << "], rax\n";
            body << "    mov  [rbp-" << CodegenCtx::slotDisp(pm.slot + 1) << "], rdx\n";
        } else {
            throw Error("Invalid parameter type for '" + f.name + "'");
        }
    }

    std::vector<LoopContext> loops;
    for (const auto& st : f.body) {
        if (emitStmt(body, cg, st, labelId, mode, retType, loops)) {
            hasRet = true;
        }
    }

    if (!hasRet && retType != Type::Void) {
        throw Error("Function '" + f.name + "' must contain 'ret <expr>;' in v0");
    }
    if (retType == Type::Void) {
        emitCleanupStrs(body, cg, labelId);
        body << "    leave\n";
        body << "    ret\n";
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
    return GenResult{out.str(), cg.strLits};
}

enum class EntryKind { Main, MainI64, MainD64, Start };

static std::string genOutAsm(const std::vector<Func>& funcs, const Func& entry, EntryKind kind,
                             const std::unordered_map<std::string, FuncSig>& funcMap) {
    std::ostringstream out;
    const bool isMainI64 = (kind == EntryKind::MainI64);
    const bool isMainD64 = (kind == EntryKind::MainD64);
    const bool isStart = (kind == EntryKind::Start);
    const Mode mode = isMainD64 ? Mode::D64Only : (isMainI64 ? Mode::I64Only : Mode::Mixed);
    const Type retType = isStart ? entry.retType : (isMainD64 ? Type::D64 : Type::I64);

    out << "global _start\n";
    for (const auto& f : funcs) {
        if (!f.isExtern && f.name != "_start") {
            out << "global " << f.name << "\n";
        }
    }
    out << "\n";

    out << "extern rt_exit\n";
    out << "extern rt_print_i64\n";
    out << "extern rt_print_f64\n";
    out << "extern rt_print_i64_raw\n";
    out << "extern rt_print_f64_raw\n";
    out << "extern rt_print_u64\n";
    out << "extern rt_print_u64_raw\n";
    out << "extern rt_print_hex_u64\n";
    out << "extern rt_print_hex_u64_raw\n";
    out << "extern rt_print_bytes\n";
    out << "extern rt_str_concat\n";
    out << "extern rt_str_copy\n";
    out << "extern rt_str_free\n";
    for (const auto& f : funcs) {
        if (f.isExtern) {
            out << "extern " << f.name << "\n";
        }
    }
    out << "\n";

    std::vector<GenResult> gens;
    gens.reserve(funcs.size());
    for (const auto& f : funcs) {
        if (f.isExtern) {
            continue;
        }
        Mode fMode = (f.name == entry.name) ? mode : Mode::Mixed;
        Type fRet = (f.name == entry.name) ? retType : f.retType;
        gens.push_back(genFunctionAsm(f, fMode, fRet, funcMap));
    }

    bool hasStrs = false;
    for (const auto& g : gens) {
        if (!g.strLits.empty()) {
            hasStrs = true;
            break;
        }
    }
    if (hasStrs) {
        out << "section .rodata\n\n";
        for (const auto& g : gens) {
            for (const auto& lit : g.strLits) {
                out << lit.label << ": db ";
                if (lit.data.empty()) {
                    out << "0";
                } else {
                    for (size_t i = 0; i < lit.data.size(); ++i) {
                        if (i) out << ", ";
                        out << (int)(unsigned char)lit.data[i];
                    }
                }
                out << "\n";
            }
        }
        out << "\n";
    }

    out << "section .text\n\n";
    for (const auto& g : gens) {
        out << g.text << "\n";
    }

    if (!isStart) {
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
    }

    return out.str();
}

int main(int argc, char** argv) {
    try {
        bool freestanding = false;
        int argi = 1;
        if (argi < argc && (std::string(argv[argi]) == "--freestanding")) {
            freestanding = true;
            ++argi;
        }
        if (argc - argi < 1) {
            std::cerr << "Usage: " << argv[0] << " [--freestanding] <input.elfir> [out.asm]\n";
            return 2;
        }
        std::string inPath = argv[argi++];
        std::string outPath = (argi < argc) ? argv[argi++] : "out.asm";
        if (argi < argc) {
            std::cerr << "Usage: " << argv[0] << " [--freestanding] <input.elfir> [out.asm]\n";
            return 2;
        }

        std::string src = readFile(inPath);

        Parser p{Lexer(src)};
        auto funcs = p.parseProgram();

        int mainIdx = -1;
        int mainI64Idx = -1;
        int mainD64Idx = -1;
        int startIdx = -1;

		for (int i = 0; i < (int)funcs.size(); ++i) {
			if (funcs[i].name == "main") mainIdx = i;
			else if (funcs[i].name == "main_i64") mainI64Idx = i;
            else if (funcs[i].name == "main_d64") mainD64Idx = i;
            else if (funcs[i].name == "_start") startIdx = i;
		}

        EntryKind kind = EntryKind::Main;
        int entryIdx = mainIdx;
        if (!freestanding) {
            const int count = (mainIdx != -1) + (mainI64Idx != -1) + (mainD64Idx != -1);
            if (count > 1) {
                throw Error("Multiple entrypoints: only one of 'main', 'main_i64', 'main_d64' is allowed.");
            }
            if (count == 0) {
                throw Error("Missing entrypoint: define one of 'fn main() { ... }', 'fn main_i64() { ... }', or 'fn main_d64() { ... }'.");
            }

            if (mainI64Idx != -1) {
                kind = EntryKind::MainI64;
                entryIdx = mainI64Idx;
            } else if (mainD64Idx != -1) {
                kind = EntryKind::MainD64;
                entryIdx = mainD64Idx;
            }
        } else {
            if (startIdx == -1) {
                throw Error("Missing entrypoint: define 'fn _start() { ... }' when using --freestanding.");
            }
            kind = EntryKind::Start;
            entryIdx = startIdx;
        }

        Func& entry = funcs[entryIdx];
        if (!entry.params.empty()) {
            throw Error("Entrypoint '" + entry.name + "' cannot have parameters");
        }
        if (entry.isExtern) {
            throw Error("Entrypoint '" + entry.name + "' cannot be extern");
        }
        if (kind == EntryKind::Start) {
            if (entry.retType != Type::Void) {
                throw Error("Entrypoint '_start' must be void in --freestanding mode.");
            }
        } else {
            Type entryRet = (kind == EntryKind::MainD64) ? Type::D64 : Type::I64;
            if (entry.retType == Type::Void) {
                entry.retType = entryRet;
            } else if (entry.retType != entryRet) {
                throw Error("Entrypoint '" + entry.name + "' must return " + std::string(typeName(entryRet)));
            }
        }

        std::unordered_map<std::string, FuncSig> funcMap;
        for (const auto& f : funcs) {
            if (funcMap.contains(f.name)) {
                throw Error("Duplicate function name '" + f.name + "'");
            }
            FuncSig sig;
            sig.retType = f.retType;
            for (const auto& p : f.params) sig.params.push_back(p.type);
            funcMap.emplace(f.name, std::move(sig));
        }

        std::string asmText = genOutAsm(funcs, entry, kind, funcMap);
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
