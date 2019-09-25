#include <string>
#include <iostream>
#include <iomanip>
#include <vector>
#include <map>
#include "lexAnalyzer.h"
#include "lexer.h"

LexAnalyzer* LexAnalyzer::m_instance = nullptr;

std::map<int, std::string> type2str {
    {T_EOF, "EOF"},
    {INTEGER, "integer"},
    {REAL, "real"},
    {WS, "ws"},
    {RESERVED_KEY, "reserved_keyword"},
    {ID, "identifier"},
    {DELIMITER, "delimiter"},
    {OPERATOR, "operator"},
    {STRING, "string"},
    {COMMENT, "comment"},
    {UNKNOWN, "unknown"},
    {ERROR, "error"}
};

void LexAnalyzer::analyze() {
    int row = 1;
    int col = 1;

    while (true) {
        int type = yylex();
        if (type == T_EOF) break;
        if (type == WS && yytext[0] == '\n') {
            row++;
            col = 1;
        }
        if (type == COMMENT || type == WS) continue;

        std::string token(yytext);
        tokens.push_back(Token(type, token, row, col));
		col += yyleng;
    }
}

void LexAnalyzer::display() {
    std::cout << std::setw(5) << std::left << "Row" << std::setw(5) << std::left \
        << "Col" << std::setw(20) << std::left << "Type" << "Token/Error" <<std::endl;
    for (Token t : tokens) {
        int row = t.row;
        int col = t.col;
        std::string type = type2str[t.type];
        std::string token = t.token;
        std::cout << std::setw(5) << std::left << row << std::setw(5) << std::left \
            << col << std::setw(20) << std::left << type << token <<std::endl;
    }
}
