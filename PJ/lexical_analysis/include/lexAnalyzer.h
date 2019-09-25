#ifndef _LEX_ANALYZER_H_
#define _LEX_ANALYZER_H_

#include <iostream>
#include <string>
#include <vector>
#include <map>

#include "lexer.h"

extern "C" int yylex();
extern "C" FILE* yyin;
extern "C" char* yytext;
extern "C" int yyleng;

extern std::map<int, std::string> type2str;

struct Token {
    int type;
    std::string token;
    int row;
    int col;
    Token() {}
    explicit Token(int type, std::string token, int row, int col) : type(type), token(token), row(row), col(col) {}
};

class LexAnalyzer {
public:
    ~LexAnalyzer() {}
    // static void init(FILE* file=nullptr);
    static LexAnalyzer* GetInstance() {
        if (m_instance == nullptr) {
            m_instance = new LexAnalyzer();
        }
        return m_instance;
    }

    void analyze();
    void display();

private:
    LexAnalyzer() {}
    static LexAnalyzer* m_instance;
    std::vector<Token> tokens;
};

#endif //_LEX_ANALYZER_H_
