%{
#include "demo.h"
%}
%option     nounput
%option     noyywrap

LETTER		[A-Za-z]
WS          [ \t\n]+
DIGIT       [0-9]
INTEGER     {DIGIT}+
REAL        {DIGIT}+"."{DIGIT}*

%%
// skip blanks and tabs
{WS}        return WS;

{INTEGER}	return INTEGER;
{REAL}		return REAL;
%%
