%{
#include "lexer.h"
%}
%option     nounput
%option     noyywrap

DIGIT       [0-9]
INTEGER     {DIGIT}+
REAL        {DIGIT}+"."{DIGIT}*
WS          [ \t\n]+

%%
{WS}        return WS; // skip blanks and tabs
<<EOF>>     return T_EOF;
{INTEGER}	return INTEGER;
{REAL}		return REAL;
%%
