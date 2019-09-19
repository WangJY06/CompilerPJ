#include <iostream>
#include <string.h>
#include <stdio.h>
#include "demo.h"
using namespace std;

int yylex();
extern "C" FILE* yyin;
extern "C" char* yytext;

int main(int argc, char* args[]) {
    if (argc > 1) {
        FILE *file = fopen(args[1], "r");
        if (!file) {
            cerr << "Can not open file." << endl;
            return 1;
        } else {
            yyin = file;
        }
    }
    
    // output header
    cout<<setw(5)<<left<<"Row"<<setw(5)<<left<<"Col"<<setw(20)<<left<<"Type"<<"Token/Error"<<endl;
    
    while(1) {
        int ret = yylex();
        switch(ret) {
            case WS:
                type = "whitespace";
                break;
            case INTEGER:
                // overflow?
                type = "integer";
                token = yytext;
                break;
            case REAL:
                type = "real";
                token = yytext;
                break;
            // other cases?
            default:
                type = "error";
                token = yytext;
        }
    }
    
    // rows and cols?
    
    // num of tokens and errors?
    
    return 0;
}
