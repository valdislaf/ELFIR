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
    KwIf,
    KwElse,
    KwElseIf,
    KwWhile,
    KwFor,

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
            else if (t.text == "if") t.kind = TokKind::KwIf;
            else if (t.text == "else") t.kind = TokKind::KwElse;
            else if (t.text == "elseif") t.kind = TokKind::KwElseIf;
            else if (t.text == "while") t.kind = TokKind::KwWhile;
            else if (t.text == "for") t.kind = TokKind::KwFor;
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
    enum class Kind { Num, Str, Var, Add, Sub, Mul, Div, Mod, Cmp, And, Sqrt, Pow, Min, Max, Abs, Sin, Cos, Tan } kind;
    enum class CmpOp { Eq, Ne, Lt, Le, Gt, Ge } cmpOp;
    std::string numText;
    std::string strText;
    std::string var;
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

enum class Type { I64, D64, Str };

struct Stmt {
    struct IfBranch {
        std::unique_ptr<Expr> cond;
        std::vector<Stmt> body;
    };
    enum class AssignOp { Eq, AddEq, SubEq, MulEq, DivEq };
    enum class Kind { AutoAssign, TypedAssign, Assign, Ret, PrintI64, PrintD64, PrintStr, PrintList, If, While, For } kind;
    Type declType = Type::I64;    // for TypedAssign
    std::string name;             // for AutoAssign
    std::unique_ptr<Expr> expr;   // for both
    std::vector<std::unique_ptr<Expr>> exprs; // for PrintList
    std::vector<IfBranch> ifBranches;
    std::unique_ptr<Expr> cond;
    std::vector<Stmt> body;
    std::unique_ptr<Stmt> init;
    std::unique_ptr<Stmt> step;
    AssignOp assignOp = AssignOp::Eq;
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
        if (cur_.kind == TokKind::KwIf) {
            return parseIfStmt();
        }
        if (cur_.kind == TokKind::KwWhile) {
            return parseWhileStmt();
        }
        if (cur_.kind == TokKind::KwFor) {
            return parseForStmt();
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

    if (cur_.kind == TokKind::KwI64 || cur_.kind == TokKind::KwD64 || cur_.kind == TokKind::KwStr) {
            Type t = (cur_.kind == TokKind::KwI64) ? Type::I64 :
                     (cur_.kind == TokKind::KwD64) ? Type::D64 :
                                                     Type::Str;
            advance();
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

    if (cur_.kind == TokKind::Ident && (cur_.text == "print_i64" || cur_.text == "print_d64")) {
        bool isI64 = (cur_.text == "print_i64");
        advance();
        expect(TokKind::LParen, "Expected '(' after print");
        auto e = parseComparison();
        expect(TokKind::RParen, "Expected ')' after print argument");
        expect(TokKind::Semicolon, "Expected ';' after print");
        Stmt st;
        st.kind = isI64 ? Stmt::Kind::PrintI64 : Stmt::Kind::PrintD64;
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
    if (cur_.kind == TokKind::Ident) {
        return parseAssignStmt(true);
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
        } else if (cur_.kind == TokKind::KwI64 || cur_.kind == TokKind::KwD64) {
            Type t = (cur_.kind == TokKind::KwI64) ? Type::I64 : Type::D64;
            advance();
            init = parseTypedAssignNoSemicolon(t);
        } else {
            throw Error("Expected 'auto', 'i64', or 'd64' in for init at position " + std::to_string(cur_.pos));
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
                throw Error("Unknown function '" + n + "'");
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
        out->strText = e->strText;
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

    static int slotDisp(int slot) { return slot * 8; } // [rbp-8*slot]

    const StrLit& getOrAddStr(const std::string& s) {
        auto it = strToId.find(s);
        if (it != strToId.end()) return strLits[it->second];
        int id = (int)strLits.size();
        std::string label = "str" + std::to_string(id);
        strToId.emplace(s, id);
        strLits.push_back(StrLit{s, label});
        return strLits.back();
    }
};

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
        case K::Str:
            throw Error("Type error: string is not allowed in i64 expression");
        case K::Var: {
            auto v = cg.getVar(e.var);
            if (v.type != Type::I64) throw Error("Type error: expected i64 variable '" + e.var + "'");
            out << "    mov  rax, [rbp-" << CodegenCtx::slotDisp(v.slot) << "]\n";
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
        case K::Mod:
            emitExprI64(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprI64(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";        // rcx = lhs, rax = rhs
            out << "    mov  r8, rax\n";
            out << "    mov  rax, rcx\n";
            out << "    cqo\n";
            out << "    idiv r8\n";
            out << "    mov  rax, rdx\n";
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
        case K::Min:
            emitExprI64(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprI64(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    cmp  rcx, rax\n";
            out << "    cmovle rax, rcx\n";
            return;
        case K::Max:
            emitExprI64(out, cg, *e.lhs, labelId);
            out << "    push rax\n";
            emitExprI64(out, cg, *e.rhs, labelId);
            out << "    pop  rcx\n";
            out << "    cmp  rcx, rax\n";
            out << "    cmovge rax, rcx\n";
            return;
        case K::Abs: {
            int id = labelId++;
            emitExprI64(out, cg, *e.lhs, labelId);
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

enum class Mode { I64Only, D64Only, Mixed };

static void emitPrintI64(std::ostringstream& out, CodegenCtx& cg, const Expr& e, int& labelId) {
    emitExprI64(out, cg, e, labelId);
    out << "    mov  rdi, rax\n";
    out << "    sub  rsp, 8\n";
    out << "    call rt_print_i64_raw\n";
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

enum class ExprTypeTag { I64, D64, NumLiteral };

static bool isFloatLiteralText(const std::string& text) {
    return text.find_first_of(".eE") != std::string::npos;
}

static ExprTypeTag mergeNumericTags(ExprTypeTag a, ExprTypeTag b, const char* ctx) {
    if (a == ExprTypeTag::D64 || b == ExprTypeTag::D64) {
        if (a == ExprTypeTag::I64 || b == ExprTypeTag::I64) {
            throw Error(std::string("Type error: mixed i64/d64 in ") + ctx);
        }
        return ExprTypeTag::D64;
    }
    if (a == ExprTypeTag::I64 || b == ExprTypeTag::I64) {
        return ExprTypeTag::I64;
    }
    return ExprTypeTag::NumLiteral;
}

static ExprTypeTag inferExprTypeTag(const Expr& e, const CodegenCtx& cg, Mode mode) {
    using K = Expr::Kind;
    switch (e.kind) {
        case K::Num:
            if (isFloatLiteralText(e.numText)) {
                if (mode == Mode::I64Only) {
                    throw Error("Expected integer literal, got '" + e.numText + "'");
                }
                return ExprTypeTag::D64;
            }
            return ExprTypeTag::NumLiteral;
        case K::Str:
            throw Error("Type error: string is not allowed in numeric expression");
        case K::Var: {
            auto v = cg.getVar(e.var);
            if (v.type == Type::Str) {
                throw Error("Type error: string is not allowed in numeric expression");
            }
            return (v.type == Type::D64) ? ExprTypeTag::D64 : ExprTypeTag::I64;
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
        case K::Cmp:
        case K::And: {
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, mode);
            return mergeNumericTags(lt, rt, "comparison");
        }
        case K::Sqrt:
        case K::Abs: {
            return inferExprTypeTag(*e.lhs, cg, mode);
        }
        case K::Pow:
        case K::Min:
        case K::Max: {
            auto lt = inferExprTypeTag(*e.lhs, cg, mode);
            auto rt = inferExprTypeTag(*e.rhs, cg, mode);
            return mergeNumericTags(lt, rt, "expression");
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

static Type resolvePrintType(const Expr& e, const CodegenCtx& cg, Mode mode) {
    ExprTypeTag tag = inferExprTypeTag(e, cg, mode);
    if (tag == ExprTypeTag::NumLiteral) {
        return (mode == Mode::D64Only) ? Type::D64 : Type::I64;
    }
    if (tag == ExprTypeTag::D64 && mode == Mode::I64Only) {
        throw Error("d64 expression is not allowed in main_i64");
    }
    if (tag == ExprTypeTag::I64 && mode == Mode::D64Only) {
        throw Error("i64 expression is not allowed in main_d64");
    }
    return (tag == ExprTypeTag::D64) ? Type::D64 : Type::I64;
}

struct GenResult {
    std::string text;
    std::vector<CodegenCtx::StrLit> strLits;
};

static Type resolveCondType(const Expr& e, const CodegenCtx& cg, Mode mode) {
    ExprTypeTag tag = inferExprTypeTag(e, cg, mode);
    if (tag == ExprTypeTag::NumLiteral) {
        return (mode == Mode::D64Only) ? Type::D64 : Type::I64;
    }
    return (tag == ExprTypeTag::D64) ? Type::D64 : Type::I64;
}

static bool isStrExpr(const Expr& e, const CodegenCtx& cg) {
    if (e.kind == Expr::Kind::Str) return true;
    if (e.kind == Expr::Kind::Var) {
        auto v = cg.getVar(e.var);
        return v.type == Type::Str;
    }
    return false;
}

static void emitCondJumpFalse(std::ostringstream& out, CodegenCtx& cg, const Expr& cond,
                              int& labelId, Mode mode, const std::string& label) {
    Type condType = resolveCondType(cond, cg, mode);
    if (condType == Type::D64) {
        emitExprD64(out, cg, cond, labelId);
        out << "    xorpd xmm1, xmm1\n";
        out << "    ucomisd xmm0, xmm1\n";
        out << "    jp   " << label << "\n";
        out << "    je   " << label << "\n";
    } else {
        emitExprI64(out, cg, cond, labelId);
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
    throw Error("Expected str expression");
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
    throw Error("Expected str expression");
}

static void emitCleanupStrs(std::ostringstream& out, const CodegenCtx& cg, int& labelId) {
    for (int slot : cg.strSlots) {
        emitFreeStrIfOwned(out, slot, labelId);
    }
}

static bool emitStmt(std::ostringstream& out, CodegenCtx& cg, const Stmt& st, int& labelId, Mode mode, Type retType) {
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
            emitExprI64(out, cg, *st.expr, labelId);
            out << "    mov  [rbp-" << CodegenCtx::slotDisp(slot) << "], rax\n";
        }
        return false;
    }

    if (st.kind == Stmt::Kind::TypedAssign) {
        if (mode == Mode::I64Only && st.declType == Type::D64) {
            throw Error("d64 variables are not allowed in main_i64");
        }
        if (mode == Mode::D64Only && st.declType == Type::I64) {
            throw Error("i64 variables are not allowed in main_d64");
        }
        int slot = cg.allocSlot(st.name, st.declType);
        if (st.declType == Type::Str) {
            emitAssignStrExpr(out, cg, *st.expr, slot, labelId, false);
        } else if (st.declType == Type::D64) {
            emitExprD64(out, cg, *st.expr, labelId);
            out << "    movsd [rbp-" << CodegenCtx::slotDisp(slot) << "], xmm0\n";
        } else {
            emitExprI64(out, cg, *st.expr, labelId);
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
            if (st.assignOp == Stmt::AssignOp::Eq) {
                emitExprI64(out, cg, *st.expr, labelId);
                out << "    mov  [rbp-" << CodegenCtx::slotDisp(v.slot) << "], rax\n";
                return false;
            }
            emitExprI64(out, cg, *st.expr, labelId);
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
                    out << "    cqo\n";
                    out << "    idiv r8\n";
                    break;
                default:
                    break;
            }
            out << "    mov  [rbp-" << CodegenCtx::slotDisp(v.slot) << "], rax\n";
            return false;
        }
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
                emitPrintI64(out, cg, *arg, labelId);
            }
        }
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
                if (emitStmt(out, cg, inner, labelId, mode, retType)) {
                    hasRet = true;
                }
            }
            out << "    jmp  .if_end_" << endId << "\n";
            out << ".if_next_" << nextId << ":\n";
        }
        out << ".if_end_" << endId << ":\n";
        return hasRet;
    }
    if (st.kind == Stmt::Kind::While) {
        int startId = labelId++;
        int endId = labelId++;
        out << ".while_start_" << startId << ":\n";
        emitCondJumpFalse(out, cg, *st.cond, labelId, mode, ".while_end_" + std::to_string(endId));
        for (const auto& inner : st.body) {
            if (emitStmt(out, cg, inner, labelId, mode, retType)) {
                hasRet = true;
            }
        }
        out << "    jmp  .while_start_" << startId << "\n";
        out << ".while_end_" << endId << ":\n";
        return hasRet;
    }
    if (st.kind == Stmt::Kind::For) {
        if (st.init) {
            if (emitStmt(out, cg, *st.init, labelId, mode, retType)) {
                hasRet = true;
            }
        }
        int startId = labelId++;
        int endId = labelId++;
        out << ".for_start_" << startId << ":\n";
        emitCondJumpFalse(out, cg, *st.cond, labelId, mode, ".for_end_" + std::to_string(endId));
        for (const auto& inner : st.body) {
            if (emitStmt(out, cg, inner, labelId, mode, retType)) {
                hasRet = true;
            }
        }
        if (st.step) {
            if (emitStmt(out, cg, *st.step, labelId, mode, retType)) {
                hasRet = true;
            }
        }
        out << "    jmp  .for_start_" << startId << "\n";
        out << ".for_end_" << endId << ":\n";
        return hasRet;
    }

    if (st.kind == Stmt::Kind::Ret) {
        if (retType == Type::D64) {
            emitExprD64(out, cg, *st.expr, labelId);
        } else {
            emitExprI64(out, cg, *st.expr, labelId);
        }
        emitCleanupStrs(out, cg, labelId);
        out << "    leave\n";
        out << "    ret\n";
        return true;
    }

    throw Error("Internal: unknown statement kind");
}

static GenResult genFunctionAsm(const Func& f, Mode mode, Type retType) {
    // v0: generate body for entrypoint only
    CodegenCtx cg;
    bool hasRet = false;

    // First pass: allocate slots on first encounter of auto
    // Second pass: emit with known slots (but we can allocate during emit too since we emit sequentially)
    // We'll do sequential allocation.

    std::ostringstream body;

    int labelId = 0;
    for (const auto& st : f.body) {
        if (emitStmt(body, cg, st, labelId, mode, retType)) {
            hasRet = true;
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
    return GenResult{out.str(), cg.strLits};
}

enum class EntryKind { Main, MainI64, MainD64 };

static std::string genOutAsm(const Func& entry, EntryKind kind) {
    std::ostringstream out;
    const bool isMainI64 = (kind == EntryKind::MainI64);
    const bool isMainD64 = (kind == EntryKind::MainD64);
    const Mode mode = isMainD64 ? Mode::D64Only : (isMainI64 ? Mode::I64Only : Mode::Mixed);
    const Type retType = isMainD64 ? Type::D64 : Type::I64;

    out << "global _start\n";
    out << "global " << entry.name << "\n\n";

    out << "extern rt_exit\n";
    out << "extern rt_print_i64\n";
    out << "extern rt_print_f64\n";
    out << "extern rt_print_i64_raw\n";
    out << "extern rt_print_f64_raw\n";
    out << "extern rt_print_bytes\n";
    out << "extern rt_str_concat\n";
    out << "extern rt_str_copy\n";
    out << "extern rt_str_free\n";
    out << "\n";

    auto gen = genFunctionAsm(entry, mode, retType);

    if (!gen.strLits.empty()) {
        out << "section .rodata\n\n";
        for (const auto& lit : gen.strLits) {
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
        out << "\n";
    }

    out << "section .text\n\n";
    out << gen.text << "\n";

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
