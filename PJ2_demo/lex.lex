%{
  #include <stdlib.h>
  #include <limits.h>
  #include "parser.h"
  int row = 1, col = 1;
  void yyerror(const char *);
%}
%option noyywrap
 // 匹配注释的新方法
%x COMMENT

EOL           \n|\r\n
WS           [ ]+
TAB          \t
DIGIT        [0-9]
INTEGER      {DIGIT}+
REAL         {DIGIT}+"."{DIGIT}*
LETTER       [a-zA-Z]
ID           {LETTER}({LETTER}|{DIGIT})*
STRING       \"[^\"\n]*\"
UNCLOSED_STR \"[^\"\n]*
%%
 // 用于处理注释的规则
 // yymore()下一次匹配规则把相应的token附加到yytext的当前值上
 // 制表符只算一个字符但会带来4列偏移，在这里进行分类处理
"(*" { 
  BEGIN(COMMENT);
  yymore(); 
 }


<COMMENT>"*)" { 
  BEGIN(INITIAL); 
 }


<COMMENT><<EOF>> { 
  yyerror("Unclosed comment.\n");
  return 0; 
 }


<COMMENT>. {
  yymore();
 }


<COMMENT>\n { 
  row++;
  yymore(); 
 }


<<EOF>>     { return 0; }
{EOL}       { row++;col=1; }
{WS}        { col += strlen(yytext); }
{TAB}       { col += 4; }

"AND"        { col += strlen(yytext); return AND; }
"ARRAY"      { col += strlen(yytext); return ARRAY; }
"BEGIN"      { col += strlen(yytext); return _BEGIN; }
"BY"         { col += strlen(yytext); return BY; }
"DIV"        { col += strlen(yytext); return DIV; }
"DO"         { col += strlen(yytext); return DO; }
"ELSE"       { col += strlen(yytext); return ELSE; }
"ELSIF"      { col += strlen(yytext); return ELSIF; }
"END"        { col += strlen(yytext); return END; }
"EXIT"       { col += strlen(yytext); return EXIT; }
"FOR"        { col += strlen(yytext); return FOR; }
"IF"         { col += strlen(yytext); return IF; }
"IN"         { col += strlen(yytext); return IN; }
"IS"         { col += strlen(yytext); return IS; }
"LOOP"       { col += strlen(yytext); return LOOP; }
"MOD"        { col += strlen(yytext); return MOD; }
"NOT"        { col += strlen(yytext); return NOT; }
"OF"         { col += strlen(yytext); return OF; }
"OR"         { col += strlen(yytext); return OR; }
"OUT"        { col += strlen(yytext); return OUT; }
"PROCEDURE"  { col += strlen(yytext); return PROCEDURE; }
"PROGRAM"    { col += strlen(yytext); return PROGRAM; }
"READ"       { col += strlen(yytext); return READ; }
"RECORD"     { col += strlen(yytext); return RECORD; }
"RETURN"     { col += strlen(yytext); return RETURN; }
"THEN"       { col += strlen(yytext); return THEN; }
"TO"         { col += strlen(yytext); return TO; }
"TYPE"       { col += strlen(yytext); return TYPE; }
"VAR"        { col += strlen(yytext); return VAR; }
"WHILE"      { col += strlen(yytext); return WHILE; }
"WRITE"      { col += strlen(yytext); return WRITE; }

"NIL"        { col += strlen(yytext); return NIL; }
"TRUE"       { col += strlen(yytext); return TRUE; }
"FALSE"      { col += strlen(yytext); return FALSE; }

":="	     { col += strlen(yytext); return ASSIGN; }
"+"	         { col += strlen(yytext); return ADD; }
"-"	         { col += strlen(yytext); return SUB; }
"*"	         { col += strlen(yytext); return MUL; }
"/"	         { col += strlen(yytext); return SLASH; }
"<"	         { col += strlen(yytext); return LT; }
"<="	     { col += strlen(yytext); return LE; }
">"	         { col += strlen(yytext); return GT; }
">="	     { col += strlen(yytext); return GE; }
"="	         { col += strlen(yytext); return EQ; }
"<>"	     { col += strlen(yytext); return NEQ; }

":"	         { col += strlen(yytext); return COLON; }
";"	         { col += strlen(yytext); return SEMICOLON; }
","	         { col += strlen(yytext); return COMMA; }
"."	         { col += strlen(yytext); return DOT; }
"("	         { col += strlen(yytext); return LPAREN; }
")"	         { col += strlen(yytext); return RPAREN; }
"["	         { col += strlen(yytext); return LBRACKET; }
"]"	         { col += strlen(yytext); return RBRACKET; }
"{"	         { col += strlen(yytext); return LBRACE; }
"}"	         { col += strlen(yytext); return RBRACE; }
"[<"	     { col += strlen(yytext); return LABRACKET; }
">]"	     { col += strlen(yytext); return RABRACKET; }
"\\"	     { col += strlen(yytext); return BACKSLASH; }

{ID} {
    // 标识符: 检测长度是否超过255
    if(yyleng > 255){
        yyerror("Identifier too long(max length: 255).\n");
        return 0;
    }
    col += strlen(yytext);
    return ID;
}
{REAL} {
    // 实数
    col += strlen(yytext); 
    return REAL; 
}

{INTEGER} { 
    // 整型：检测是否超过整型可以表示的大小
    if(yyleng > 10 || (yyleng == 10 && atol(yytext) > INT_MAX)){
        yyerror("Integer out of range.\n");
        return 0;
    }
    col += strlen(yytext); 
    return INTEGER; 
}

{STRING} {
    // 完整字符串
    // 检测是否超过规定长度或者含有非法字符
    if(yyleng > 257){
        yyerror("String too long(max length: 257).\n");
        return 0;
    }
    for(int i = 0; i < yyleng; i++){
        if(yytext[i] < 32 || yytext[i] >= 127){
            yyerror("Illegal character.\n");
            return 0;
        }
    }
    col += strlen(yytext); 
    return STRING;
}

{UNCLOSED_STR} {
    // 未闭合字符串
    yyerror("Unclosed string.\n");
    return 0;
}

. {
    // 无法识别的内容
    yyerror("Unrecognized character.\n");
    return 0;
}

%%



