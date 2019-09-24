#include <string>
#include <iostream>
#include <iomanip>
#include "lexAnalyzer.h"
#include "lexer.h"

LexAnalyzer* LexAnalyzer::m_instance = nullptr;

/*
void LexAnalyzer::init(FILE* file) {
    if (file == nullptr) {
        yyin = stdin;
    } else {
        yyin = file;
    }
}
*/


void LexAnalyzer::analyze() {
    std::cout << "lexical analyzing" << std::endl;

    while (true) {
        int type = yylex();
        if (type == T_EOF) break;

        std::string token(yytext);
        std::cout << "[type]:" << std::setw(4) << type << " [token]:" << token << std::endl;
    }

}