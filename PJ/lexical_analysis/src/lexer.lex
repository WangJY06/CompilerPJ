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
UNKNOWN     .|\n
LETTER      [a-zA-Z]
STRING      \"[^\"]*\"
ID          {LETTER}({LETTER}|{DIGIT})*

ASSIGN      :=
PLUS        \+
MINUS       -
STAR        \*
SLASH       \/
LT          <
LE          <=
GT          >
GE          >=
EQ          =
NEQ         <>

COLON       :
SEMICOLON   ;
COMMA       ,
DOT         \.
LPAREN      \(
RPAREN      \)
LBRACKET    \[
RBRACKET    \]
LBRACE      \{
RBRACE      \}
LABRACKET   \[<
RABRACKET   >\]
BACKSLASH   \\


%%

{ASSIGN}    |
{PLUS}      |
{MINUS}     |
{STAR}      |
{SLASH}     |
{LT}        |
{LE}        |
{GT}        |
{GE}        |
{EQ}        |
{NEQ}       return OPERATOR;

{COLON}     |
{SEMICOLON} |
{COMMA}     |
{DOT}       |
{LPAREN}    |
{RPAREN}    |
{LBRACKET}  |
{RBRACKET}  |
{LBRACE}    |
{RBRACE}    |
{LABRACKET} |
{RABRACKET} |
{BACKSLASH} return DELIMITER;

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

{WS}        return WS; // skip blanks and tabs
{ID}        return ID;
<<EOF>>     return T_EOF;
{COMMENT}   return COMMENT; // skip
{INTEGER}   return INTEGER;
{REAL}      return REAL;
{STRING}    return STRING;
{UNKNOWN}   return UNKNOWN;
%%
