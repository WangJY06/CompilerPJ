#include <iostream>
#include <string.h>
#include <stdio.h>
#include "lexer.h"
using namespace std;

int yylex();
extern "C" FILE* yyin;
extern "C" char* yytext;

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
    
    // output header
    cout<<setw(5)<<left<<"Row"<<setw(5)<<left<<"Col"<<setw(20)<<left<<"Type"<<"Token/Error"<<endl;
    
    while (true) {
        int n = yylex();
        if (n == T_EOF) {
            break
        }
        switch(n) {
            case INTEGER:
                // overflow? (see file test20.pcat)
                type = "integer";
                token = yytext;
                break;
            case REAL:
                type = "real";
                token = yytext;
                break;
            case WS:
                type = "whitespace";
                break;
            // other cases?
            
            default:
                type = "error";
                token = yytext;
        }
        
        // print (rows and cols?)
        
    }
    
    // count num of tokens and errors?
    
    return 0;
}
