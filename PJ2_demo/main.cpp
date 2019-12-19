#include "tree.h"

int yyparse();
string argv_filename;
ofstream output;
extern "C" FILE *yyin;

int main(int argc, char** argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            cerr << "Cannot open file." << endl;
            return 1;
        } else {
            argv_filename = argv[1];
            argv_filename = argv_filename.substr(argv_filename.rfind("/")+1);
            char *filename = argv[1];
            do{
                filename++;
            } while (*filename != '0' && *filename != '1' && *filename != '2');
            string str_filename("../results2/result");
            str_filename.append(filename, 2);
            str_filename.append(".html");
            output.open(str_filename);
            yyin = file;
        }
    } else {
        yyin = stdin;
    }
    
    yyparse();
    // root->show();
    output.close();
    return 0;
}