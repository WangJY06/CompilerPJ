#ifndef _TREE_H_
#define _TREE_H_
#include <iostream>
#include <malloc.h>
#include <stdio.h>
#include <string.h>
#include <string>
#include <fstream>
using namespace std;
extern string argv_filename;
extern int yylex(void);
extern ofstream output;

typedef enum
{
    Program,
    BodyDef,
    DeclareList,
    VarDecs,
    TypeDecs,
    ProcDecs,
    VarDec,
    TypeDec,
    ProcDec,
    ArrayType,
    RecordType,
    CompList,
    Comp,
    FormalParamList,
    Param,
    AssignSt,
    CallSt,
    ReadSt,
    WriteSt,
    IfSt,
    WhileSt,
    LoopSt,
    ForSt,
    ExitSt,
    RetSt,
    SeqSt,
    ExprList,
    CallExp,
    RecordExp,
    ArrayExp,
    RecordInitList,
    RecordInit,
    ArrayInitList,
    ArrayInit,
    LvalList,
    ArrayDeref,
    RecordDeref,
    Gt,
    Lt,
    Eq,
    Ge,
    Le,
    Ne,
    Plus,
    Minus,
    Multiply,
    Slash,
    Div,
    Mod,
    And,
    Or,
    UPlus,
    UMinus,
    Not,
    TypeInferenceNeeded,
    VoidType,
    EmptyStatement,
    EmptyExpression
} node_kind;

static const char *node_names[] = {
    "program", "body_define", "declare_list", "variable_declare_list", "type_declare_list",
    "procedure_declare_list", "variable_declare", "type_declare", "procedure_declare", "array_type",
    "record_type", "component_list", "component", "formal_parameter_list", "parameter",
    "assign_statement", "call_statement", "read_statement", "write_statement", "if_statement",
    "while_statement", "loop_statement", "for_statement", "exit_statement", "return_statement",
    "statement_list", "expression_list", "call_expression", "record_expresion", "array_expression",
    "recordinit_list", "recordinit", "arrayinit_list", "arrayinit", "lval_list", "array_dereference",
    "record_dereference", "greaterthan", "lessthan", "equal", "greater&equal", "less&equal", "notequal",
    "plus", "minus", "multiply", "slash", "div", "mod", "and", "or", "uplus", "uminus", "not", "type_inference_needed",
    "voidtype", "empty_statement", "empty_expression"};

static const char *const_names[] = {"TRUE", "FALSE", "NIL"};

struct node
{
    int row, col;
    enum
    {
        int_node,
        real_node,
        var_node,
        str_node,
        const_node,
        type_node,
        node_node
    } tag;
    union {
        int integer;
        int constant;
        char *variable;
        char *string;
        // double real;
        struct
        {
            node_kind tag;
            struct node_list *arguments;
        } node;
    } info;
};

struct node_list
{
    node *elem;
    struct node_list *next;
};

struct keyword
{
    int row, col;
};

node *create_int(int row, int col, const long x);
node *create_real(int row, int col, const char *x);
node *create_var(int row, int col, const char *x);
node *create_str(int row, int col, const char *x);
node *create_const(int row, int col, const int x);
node *create_node(const node_kind tag, node_list *args);

node_list *push_front(node *e, node_list *r);
node_list *concat(node_list *a, node_list *b);
node_list *reverse(node_list *);

void print_node(node *x);

#endif
