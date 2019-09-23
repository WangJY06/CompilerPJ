%{
#include "lexer.h"
%}
%option     nounput
%option     noyywrap
%option     nodefault


DIGIT       [0-9]
INTEGER     {DIGIT}+
REAL        {DIGIT}+"."{DIGIT}*
WS          [ \t\n]+
COMMENT     "(*"[^("*)")]*"*)"
DEFAULT     .|\n
LETTER      [a-zA-Z]
STRING      \"[^\"]*\"


%%
{WS}        // return WS; // skip blanks and tabs
<<EOF>>     return T_EOF;
{COMMENT}   // return COMMENT; // skip
{INTEGER}	return INTEGER;
{REAL}		return REAL;
{DEFAULT}   return DEFAULT;
{STRING}    return STRING;

AND         |
ARRAY       |
BEGIN       |
BY          |
DIV         |
DO          |
ELSE        |
ELSIF       |
END         |
EXIT        |
FOR         |
IF          |
IN          |
IS          |
LOOP        |
MOD         |
NOT         |
OF          |
OR          |
OUT         |
PROCEDURE   |
PROGRAM     |
READ        |
RECORD      |
RETURN      |
THEN        |
TO          |
TYPE        |
VAR         |
WHILE       |
WRITE       return RESERVED_KEY;


%%
