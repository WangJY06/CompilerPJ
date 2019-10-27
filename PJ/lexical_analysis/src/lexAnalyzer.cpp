#include <string>
#include <iostream>
#include <algorithm>
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
        // std::cout << yytext << ' ' << type2str[type] << std::endl;
        if (type == T_EOF) break;
        std::string token(yytext);
        int newlineCount = std::count(token.begin(), token.end(), '\n');
        if (type == NEWLINE) {
            row ++;
            col = 1;
            continue;
        }
        if (type == COMMENT) {
            int p = token.find_last_of('\n');
            row += newlineCount;
            col = token.size() - p;
            continue;
        }

        if (type == WS) {
            col += yyleng;
            continue;
        }

        tokens.push_back(Token(type, token, row, col));
        col += yyleng;

		if (type == UNTERMINATED_STRING) {
            row++;
            col = 1;
        }
        
        if (type == UNTERMINATED_COMMENT) break;
    }
}

void LexAnalyzer::sanityCheck() {
    for (Token& t : tokens) {
        switch (t.type) {
            case STRING:
                if (t.token.find_first_of("\t\n") != std::string::npos) {
                    t.type = ERROR;
                    t.token = "Error: String contains tabs or newlines.";
                }
                else if (t.token.size() > 257) {
                    t.type = ERROR;
                    t.token = "Error: String length out of range.";
                }
                break;
            case INTEGER:
                if (t.token.size() > 10 || (t.token.size()==10 && t.token > "2147483647")) {
                    t.type = ERROR;
                    t.token = "Error: Integer out of range.";
                }
                break;
            case ID:
                if (t.token.size() > 255) {
                    t.type = ERROR;
                    t.token = "Error: Identifier length out of range.";
                }
                break;
            case UNTERMINATED_COMMENT:
                t.type = ERROR;
                t.token = "Error: unterminated comment.";
                break;
            case UNTERMINATED_STRING:
                t.type = ERROR;
                t.token = "Error: unterminated string.";
                break;
            case UNKNOWN:
                t.type = ERROR;
                t.token = "Error: unknown token.";
                break;
            default:
                break;
        }
        if (t.type == ERROR) errorCount++;
    }
}

void LexAnalyzer::display() {
    std::cout << std::setw(5) << std::left << "Row" << std::setw(5) << std::left \
        << "Col" << std::setw(20) << std::left << "Type" << "Token/Error" << std::endl;
    for (Token t : tokens) {
        int row = t.row;
        int col = t.col;
        std::string type = type2str[t.type];
        std::string token = t.token;
        std::cout << std::setw(5) << std::left << row << std::setw(5) << std::left \
            << col << std::setw(20) << std::left << type << token << std::endl;
    }
    std::cout << errorCount << " errors, " << tokens.size() - errorCount << " tokens." << std::endl;
}
