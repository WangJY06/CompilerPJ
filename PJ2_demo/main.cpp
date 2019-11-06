#include <iostream>
#include <stdio.h>
// #include "tree.h"
using namespace std;

int yyparse();
extern "C" FILE* yyin;
// extern node_t* root;

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
    
    yyparse();
    // root->show();
    return 0;
}
