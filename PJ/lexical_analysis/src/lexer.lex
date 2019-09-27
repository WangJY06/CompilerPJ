%{
#include "lexer.h"
%}
%option     nounput
%option     noyywrap
%option     nodefault



DIGIT       [0-9]
INTEGER     {DIGIT}+
REAL        {DIGIT}+"."{DIGIT}*
COMMENT     \(\*(([^*])|(\**[^*)]))*\**\*\)
UNTERMINATED_COMMENT    \(\*(([^*])|(\**[^*)]))*\**$
UNTERMINATED_STRING     \"[^\"\n]*(\n|$)
WS          [ \t]+
NEWLINE     \n
UNKNOWN     .|\n
LETTER      [a-zA-Z]
STRING      \"[^\"\n]*\"
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
{NEWLINE}   return NEWLINE;
{UNTERMINATED_STRING} return UNTERMINATED_STRING;
{UNTERMINATED_COMMENT} return UNTERMINATED_COMMENT;
{ID}        return ID;
<<EOF>>     return T_EOF;
{INTEGER}   return INTEGER;
{COMMENT}   return COMMENT;
{REAL}      return REAL;
{STRING}    return STRING;
{UNKNOWN}   return UNKNOWN;
%%