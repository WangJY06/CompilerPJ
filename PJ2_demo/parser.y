%{
#include "lex.c"
#include "tree.h"
using namespace std;
extern char *yytext;

void yyerror(const char* msg) {
    fprintf(stderr,"location:%d:%d: \033[0;32;31m error \033[0m %s\n",row, col, yytext);
    fprintf(stderr,"%s\n",msg);
}

%}

%union {
        struct node*            node_type;
        struct node_list*       node_list_type;
        struct keyword*         keyword_type;
}

%token ID INTEGER REAL STRING
       PROGRAM IS _BEGIN END VAR TYPE PROCEDURE ARRAY RECORD
       IN OUT READ WRITE IF THEN ELSE ELSIF WHILE DO LOOP
       FOR EXIT RETURN TO BY AND OR NOT OF DIV MOD
       LPAREN  RPAREN LBRACKET RBRACKET LBRACE RBRACE COLON DOT
       SEMICOLON COMMA ASSIGN ADD SUB MUL SLASH BACKSLASH EQ
       NEQ LT LE GT GE LABRACKET RABRACKET NIL TRUE FALSE


%type <node_type> program
%type <node_type> body
%type <node_type> declaration_list_node
%type <node_list_type> declaration_list
%type <node_type> statement_list_node
%type <node_list_type> statement_list
%type <node_type> declaration
%type <node_list_type> var_decl_list 
%type <node_list_type> type_decl_list
%type <node_list_type> procedure_decl_list
%type <node_list_type> var_decl
%type <node_list_type> var_decl_id_list
%type <node_type> var_decl_type_O 
%type <node_type> type_decl
%type <node_type> procedure_decl
%type <node_type> procedure_decl_type_O
%type <node_type> typename
%type <node_type> type
%type <node_list_type> component_list
%type <node_type> component
%type <node_type> formal_params
%type <node_list_type> fp_listection_list
%type <node_list_type> fp_listection
%type <node_list_type> fp_listection_id_list
%type <node_type> statement
%type <node_list_type> statement_lvalue_list
%type <node_list_type> statement_elsif_list
%type <node_type> statement_else_O
%type <node_type> statement_by_O
%type <node_type> write_params
%type <node_list_type> write_params_expr_list
%type <node_type> write_expr
%type <node_type> expression_O
%type <node_type> expression
%type <node_type> lvalue
%type <node_type> actual_params
%type <node_list_type> actual_params_expr_list
%type <node_type> comp_values
%type <node_list_type> comp_values_pair_list
%type <node_type> array_values
%type <node_list_type> array_values_array_value_list
%type <node_type> array_value
%type <node_type> number
%type <node_type> identifier
%type <node_type> string
%type <node_type> constant
%type <node_type> term
%type <node_type> unary
%type <node_type> factor
%type <node_type> summand
%type <node_type> relationship
%type <node_type> and_operand
%type <node_type> or_operand
%type <node_type> TRUE
%type <node_type> FALSE
%type <node_type> NIL

%type <keyword_type> program_text
%type <keyword_type> body_text
%type <keyword_type> var
%type <keyword_type> type_text
%type <keyword_type> procedure
%type <keyword_type> array
%type <keyword_type> record
%type <keyword_type> read
%type <keyword_type> write
%type <keyword_type> if
%type <keyword_type> while
%type <keyword_type> loop
%type <keyword_type> for
%type <keyword_type> exit
%type <keyword_type> return

%nonassoc    ASSIGN
%left        OR
%left        AND
%nonassoc    EQ NEQ
%nonassoc    LT LE GT GE
%left        ADD SUB
%left        MUL DIV MOD
%nonassoc    LBRACKET DOT


%%
start:                
    program { node* prog = $1; print_node(prog); }
;
program:              
    program_text IS body SEMICOLON { $$=create_node(Program,push_front($3,NULL)); $$->row=$1->row; $$->col=$1->col; }
;
body:                 
    declaration_list_node body_text statement_list_node END { 
        $$=create_node(BodyDef,push_front($1,push_front($3,NULL)));
        // declaration_list 可能为空，行列信息均为0
        if($$->row==0){
            $$->row=$2->row;$$->col=$2->col;
            $1->row=$2->row;$1->col=$2->col;
        }
    }
;
declaration_list_node:     
    declaration_list { $$=create_node(DeclareList,reverse($1));}
;
declaration_list:        
    declaration_list declaration { $$=push_front($2,$1); }
    | {$$=NULL;}
;
statement_list_node:       
    statement_list { $$=create_node(SeqSt,reverse($1)); }
;
statement_list:          
    statement_list statement { $$=push_front($2,$1); }
    | {$$=NULL;}
;
declaration:          
    var var_decl_list  { $$=create_node(VarDecs,$2); $$->row=$1->row; $$->col=$1->col; }
    | type_text type_decl_list  { $$=create_node(TypeDecs,reverse($2)); $$->row=$1->row; $$->col=$1->col; }
    | procedure procedure_decl_list { $$=create_node(ProcDecs,reverse($2)); $$->row=$1->row; $$->col=$1->col; }
;
var_decl_list:           
    var_decl_list var_decl { $$=concat($1,$2); }
    | {$$=NULL;}
;
type_decl_list:          
    type_decl_list type_decl { $$=push_front($2,$1); }
    | {$$=NULL;}
;
procedure_decl_list:     
    procedure_decl_list procedure_decl { $$=push_front($2,$1); }
    | {$$=NULL;}
;
var_decl:             
    identifier var_decl_id_list var_decl_type_O ASSIGN expression SEMICOLON
    {
        node_list* id_list = push_front($1,reverse($2)); $$=NULL; 
        node_list* var_list = NULL;
        while(id_list != NULL){
            var_list = push_front(create_node(VarDec,push_front(id_list->elem,push_front($3,push_front($5,NULL)))), var_list);
            id_list = id_list->next;
        }
        $$=reverse(var_list);
    }
;
var_decl_id_list:        
    var_decl_id_list COMMA identifier { $$=push_front($3,$1); }
    | {$$=NULL;}
;
var_decl_type_O:      
    COLON typename { $$=$2; }
    | {$$=create_node(TypeInferenceNeeded,NULL);}
;
type_decl:            
    identifier IS type SEMICOLON { $$=create_node(TypeDec,push_front($1,push_front($3,NULL))); }
;
procedure_decl:       
    identifier formal_params procedure_decl_type_O IS body SEMICOLON { $$=create_node(ProcDec,push_front($1,push_front($2,push_front($3,push_front($5,NULL))))); }
;
procedure_decl_type_O: 
    COLON typename  { $$=$2; }
    | {$$=create_node(VoidType,NULL);$$->row=row;$$->col=col;}
;
typename:             
    identifier { $$=$1; $$->tag=node::type_node; }
;
type:                 
    array OF typename { $$=create_node(ArrayType,push_front($3,NULL)); $$->row=$1->row; $$->col=$1->col; }
    | record component component_list END {
       $$=create_node(RecordType,push_front(create_node(CompList,push_front($2,reverse($3))),NULL)); 
        $$->row=$1->row; $$->col=$1->col;
    }
    | typename {$$=$1;}
;
component_list:          
    component_list component { $$=push_front($2,$1); }
    | {$$=NULL;}
;
component:            
    identifier COLON typename SEMICOLON { $$=create_node(Comp,push_front($1,push_front($3,NULL))); }
;
formal_params:        
    LPAREN fp_listection fp_listection_list RPAREN   { $$=create_node(FormalParamList,concat($2,$3)); }
    |LPAREN RPAREN {$$=create_node(FormalParamList,NULL);$$->row=row; $$->col=col-1;}
;
fp_listection_list:         
    fp_listection_list SEMICOLON fp_listection  { $$=concat($1,$3); }
    | {$$=NULL;}
;
fp_listection:           
    identifier fp_listection_id_list COLON typename  
    {  
        node_list* id_list = push_front($1,reverse($2)); $$=NULL; 
        node_list* fp_list = NULL;
        while( id_list != NULL ){
            fp_list = push_front(create_node(Param,push_front(id_list->elem,push_front($4,NULL))), fp_list);
            id_list = id_list->next;
        }
        $$=reverse(fp_list);
    }
;
fp_listection_id_list:      
    fp_listection_id_list COMMA identifier  { $$=push_front($3,$1); }
    | {$$=NULL;}
;
statement:            
    lvalue ASSIGN expression SEMICOLON  { $$=create_node(AssignSt,push_front($1,push_front($3,NULL))); }
    | identifier actual_params SEMICOLON  { $$=create_node(CallSt,push_front($1,push_front($2,NULL))); }
    | read LPAREN lvalue statement_lvalue_list RPAREN SEMICOLON    { $$=create_node(ReadSt,push_front(create_node(LvalList,push_front($3,reverse($4))),NULL)); $$->row=$1->row; $$->col=$1->col;}
    | write write_params SEMICOLON        { $$=create_node(WriteSt,push_front($2,NULL)); $$->row=$1->row; $$->col=$1->col; }
    | if expression THEN statement_list_node statement_elsif_list statement_else_O END SEMICOLON 
        {
            node* if_node = create_node(IfSt,push_front($2,push_front($4,push_front(NULL,NULL))));
            node* current_if = if_node;
            node_list* middle_list = reverse($5);
            for(; middle_list != NULL; middle_list = middle_list->next){
                current_if->info.node.arguments->next->next = push_front(middle_list->elem,NULL);
                current_if = current_if->info.node.arguments->next->next->elem;
            }
            current_if->info.node.arguments->next->next = push_front($6,NULL);
            $$ = if_node;
            $$->row=$1->row; $$->col=$1->col;
        }
    | while expression DO statement_list_node END SEMICOLON     { $$=create_node(WhileSt,push_front($2,push_front($4,NULL))); $$->row=$1->row; $$->col=$1->col; }
    | loop statement_list_node END SEMICOLON   { $$=create_node(LoopSt,push_front($2,NULL)); $$->row=$1->row; $$->col=$1->col; }
    | for identifier ASSIGN expression TO expression statement_by_O DO statement_list_node END SEMICOLON 
        { 
            $$=create_node(ForSt,push_front($2,push_front($4,push_front($6,push_front($7,push_front($9,NULL))))));
             $$->row=$1->row; $$->col=$1->col;
        }
    | exit SEMICOLON                      { $$=create_node(ExitSt,NULL); $$->row=$1->row; $$->col=$1->col; }
    | return expression_O SEMICOLON       { $$=create_node(RetSt,push_front($2,NULL)); $$->row=$1->row; $$->col=$1->col; }
;
statement_lvalue_list:   
    statement_lvalue_list COMMA lvalue     { $$=push_front($3,$1); }       
    |{ $$=NULL; }
;
statement_elsif_list:    
    statement_elsif_list ELSIF expression THEN statement_list_node 
    { 
        $$=push_front(create_node(IfSt,push_front($3,push_front($5,push_front(NULL,NULL)))),$1);
    }
    | { $$=NULL; }
;
statement_else_O:     
    ELSE statement_list_node { $$=$2; }
    | {$$=create_node(EmptyStatement,NULL);}
;
statement_by_O:       
    BY expression { $$=$2; }
    | {$$=create_int(row, col, 1);}
;
write_params:         
    LPAREN write_expr write_params_expr_list RPAREN { $$=create_node(ExprList,push_front($2,reverse($3))); }
    | LPAREN RPAREN { $$=create_node(EmptyExpression,NULL);$$->row=row; $$->col=col-1; }
;
write_params_expr_list:  
    write_params_expr_list COMMA write_expr { $$=push_front($3,$1); } 
    | {$$=NULL;}
;
write_expr:           
    string  { $$=$1; }
    | expression { $$=$1; }
;
expression_O:         
    expression { $$=$1; }
    |{$$=create_node(EmptyExpression,NULL);}
;

expression:           
    or_operand { $$=$1; }
;
or_operand:           
    or_operand OR and_operand { $$=create_node(Or,push_front($1,push_front($3,NULL))); }
    | and_operand { $$=$1; }
;
and_operand:          
    and_operand AND relationship { $$=create_node(And,push_front($1,push_front($3,NULL))); }
    |relationship {$$=$1;}
;
relationship:         
    summand GT summand         { $$=create_node(Gt,push_front($1,push_front($3,NULL))); }
    | summand LT summand         { $$=create_node(Lt,push_front($1,push_front($3,NULL))); }
    | summand EQ summand         { $$=create_node(Eq,push_front($1,push_front($3,NULL))); }
    | summand GE summand         { $$=create_node(Ge,push_front($1,push_front($3,NULL))); }
    | summand LE summand         { $$=create_node(Le,push_front($1,push_front($3,NULL))); }
    | summand NEQ summand        { $$=create_node(Ne,push_front($1,push_front($3,NULL))); }
    | summand                    { $$=$1; }
;
summand:        
    summand ADD factor  { $$=create_node(Plus,push_front($1,push_front($3,NULL))); }
    | summand SUB factor  { $$=create_node(Minus,push_front($1,push_front($3,NULL))); }
    | factor  {$$=$1;}
;
factor:         
    factor MUL unary  { $$=create_node(Multiply,push_front($1,push_front($3,NULL))); }
    | factor SLASH unary  { $$=create_node(Slash,push_front($1,push_front($3,NULL))); }
    | factor DIV unary  { $$=create_node(Div,push_front($1,push_front($3,NULL))); }
    | factor MOD unary  { $$=create_node(Mod,push_front($1,push_front($3,NULL))); }
    | unary  {$$=$1;}
;
unary:          
    ADD unary  { $$=create_node(UPlus,push_front($2,NULL)); }
    | SUB unary { $$=create_node(UMinus,push_front($2,NULL)); }
    | NOT unary  { $$=create_node(Not,push_front($2,NULL)); }
    | term  {$$=$1;}
;
term:           
    number  { $$=$1; }
    | lvalue  { $$=$1; }
    | identifier actual_params  { $$=create_node(CallExp,push_front($1,push_front($2,NULL)));}
    | identifier comp_values  { $$=create_node(RecordExp,push_front($1,push_front($2,NULL)));}
    | identifier array_values  { $$=create_node(ArrayExp,push_front($1,push_front($2,NULL)));}
    | LPAREN expression RPAREN {$$=$2;}
    | constant  {$$=$1;}
;
constant:        
    TRUE  {$$=create_const(row, col, 0);}
    | FALSE  {$$=create_const(row, col, 1);}
    | NIL  {$$=create_const(row, col, 2);}
;


lvalue:               
    identifier  { $$=$1; }
    | lvalue LBRACKET expression RBRACKET  { $$=create_node(ArrayDeref,push_front($1,push_front($3,NULL))); }
    | lvalue DOT identifier   { $$=create_node(RecordDeref,push_front($1,push_front($3,NULL))); }
;
actual_params:        
    LPAREN expression actual_params_expr_list RPAREN  { $$=create_node(ExprList,push_front($2,reverse($3))); }
    | LPAREN RPAREN  { $$=create_node(ExprList,NULL);$$->row=row; $$->col=col-1; }
;
actual_params_expr_list: 
    actual_params_expr_list COMMA expression  { $$=push_front($3,$1); }
    | { $$=NULL; }
;
comp_values:         
    LBRACE identifier ASSIGN expression comp_values_pair_list RBRACE { $$=create_node(RecordInitList,push_front(create_node(RecordInit,push_front($2,push_front($4,NULL))),reverse($5))); }
;
comp_values_pair_list:  
    comp_values_pair_list SEMICOLON identifier ASSIGN expression { $$=push_front(create_node(RecordInit,push_front($3,push_front($5,NULL))),$1); }
    | { $$=NULL; }
;
array_values:          
    LABRACKET array_value array_values_array_value_list RABRACKET { $$=create_node(ArrayInitList,push_front($2,reverse($3))); }
;
array_values_array_value_list: 
    array_values_array_value_list COMMA array_value { $$=push_front($3,$1); }
    | { $$=NULL; }
;
array_value:          
    expression { $$=create_node(ArrayInit,push_front(create_int(row, col, 1),push_front($1,NULL))); }
    | expression OF expression { $$=create_node(ArrayInit,push_front($1,push_front($3,NULL))); }
;
number:               
    INTEGER { $$=create_int(row, col, atoi(yytext)); }
    | REAL    { $$=create_real(row, col, yytext); }
;
identifier:          
    ID { $$ = create_var(row, col, yytext); }
;
string:              
    STRING { $$=create_str(row, col, yytext); }
;
program_text:
    PROGRAM { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
body_text:
    _BEGIN { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
var:
    VAR { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
type_text:
    TYPE { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
procedure:
    PROCEDURE { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
array:
    ARRAY { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
record:
    RECORD { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
read:
    READ { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
write:
    WRITE { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
if:
    IF { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
while:
    WHILE { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
loop:
    LOOP { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
for:
    FOR { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
exit:
    EXIT { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;
return:
    RETURN { $$=new keyword;$$->row=row;$$->col=col-strlen(yytext);}
;

%%
