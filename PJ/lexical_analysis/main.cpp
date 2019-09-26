#include <iostream>
#include <cstring>
#include <string>
#include <cstdio>
#include <iomanip>

#include "lexer.h"
#include "lexAnalyzer.h"
using namespace std;

int main(int argc, char** argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            cerr << "Cannot open file." << endl;
            return 1;
        } else {
            yyin = file;
        }
    } else {
        yyin = stdin;
    }

    LexAnalyzer *lexAnalyzer = LexAnalyzer::GetInstance();
    lexAnalyzer->analyze();
    lexAnalyzer->sanityCheck();
    lexAnalyzer->display();
    return 0;
}
