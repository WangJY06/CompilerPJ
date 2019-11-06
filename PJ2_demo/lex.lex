%{
#include "lex.h"
int line = 1, col = 1;
void yyerror(const char *msg);
%}
%option     noyywrap

DIGIT       [0-9]
INTEGER     {DIGIT}+
REAL        {DIGIT}+"."{DIGIT}*
WS          [ \t]+

%%
<<EOF>>     { return 0; }
{WS}        { }
\n          { line++; col = 1; return EOL; }
{INTEGER}	{ yylval.val = atof(yytext); col += strlen(yytext); return INTEGER; }
{REAL}		{ yylval.val = atof(yytext); col += strlen(yytext); return REAL; }

"+"         { col += strlen(yytext); return ADD; }
"-"         { col += strlen(yytext); return SUB; }
"*"         { col += strlen(yytext); return MUL; }
"/"         { col += strlen(yytext); return DIV; }
"("         { col += strlen(yytext); return LPAREN; }
")"         { col += strlen(yytext); return RPAREN; }
%%

void yyerror(const char *msg) {
	cout << "Error at line: " << line << ", column: " << col << endl;
	cerr << msg << endl;
}
