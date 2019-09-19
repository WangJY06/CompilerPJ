%{
#include "demo.h"
%}
%option     nounput
%option     noyywrap

WS          [ \t\n]+
DIGIT       [0-9]
INTEGER     {DIGIT}+
REAL        {DIGIT}+"."{DIGIT}*

%%
<<EOF>>     return T_EOF;
{WS}        return WS; // skip blanks and tabs

{INTEGER}	return INTEGER;
{REAL}		return REAL;
%%
