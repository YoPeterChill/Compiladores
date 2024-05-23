%{
int yyerror(const char *s);
int yylex(void);
%}

%define parse.error verbose

%token TOK_IDENT
%token TOK_PRINT
%token TOK_SCAN
%token TOK_INT
%token TOK_FLOAT
%token TOK_STRING
%token TOK_CHAR
%token TOK_IF
%token TOK_ELSE
%token TOK_LOOP
%token TOK_BREAK
%token TOK_TRUE
%token TOK_FALSE
%token TOK_IGUAL
%token TOK_DIFERENTE
%token TOK_MEOI
%token TOK_MAOI
%token TOK_OR 
%token TOK_AND
%token TIPO_INT
%token TIPO_FLOAT
%token TIPO_STRING
%token TIPO_CHAR
%token TIPO_BOOL

%start program

%%

program : globals;

globals : globals global{
}

globals : global{
}

global : declaration | atribuition | loop | print | selection | break{
}

declaration : type TOK_IDENT '=' tok ';'{
} 

declaration : type TOK_IDENT ';'{
}

atribuition: TOK_IDENT '=' tok ';'{
}

atribuition : TOK_IDENT '=' scan{
}

scan : TOK_SCAN '(' type ')'';'{
}

type : TIPO_INT{
}

type : TIPO_FLOAT{
}

type : TIPO_STRING{
}

type : TIPO_BOOL{
}

type : TIPO_CHAR{
}

tok : TOK_STRING{
}

tok : condition{
}

tok : TOK_CHAR{
}

numeric_expression : numeric_expression '+' numeric_term{
} 

numeric_expression : numeric_expression '-' numeric_term{
}

numeric_expression : numeric_term{
}

numeric_term : numeric_term '*' numeric_factor{
}

numeric_term : numeric_term '/' numeric_factor{
}

numeric_term : numeric_factor{
}

numeric_factor : '(' numeric_expression ')'{
}

numeric_factor : TOK_IDENT{
}

numeric_factor : TOK_INT{
}

numeric_factor : TOK_FLOAT{
}

numeric_factor : unary{
} 

unary : '-' numeric_factor{
}

print : TOK_PRINT '(' tok ')'';'{
}

selection : TOK_IF '(' condition ')' '{' globals '}'{
}

selection : TOK_IF '(' condition ')' '{' globals '}' TOK_ELSE '{' globals '}'{
}

selection : TOK_IF '(' condition ')' '{' globals '}' TOK_ELSE selection {    
}

condition : numeric_factor logic_operator numeric_factor{
}

condition : '(' condition TOK_OR condition ')'{
}

condition: '(' condition TOK_AND condition ')' {
}

condition : numeric_expression{
}

condition : bool{
}

bool : TOK_TRUE{
}

bool : TOK_FALSE{
}

bool : not{
}

not : '!''(' condition ')'{
}

logic_operator : TOK_DIFERENTE{
}

logic_operator : TOK_IGUAL{
}

logic_operator : '<'{
}

logic_operator : TOK_MEOI{
}

logic_operator : '>'{
}

logic_operator : TOK_MAOI{
}

loop : TOK_LOOP '(' TOK_INT ';' TOK_INT ';' TOK_INT ')''{' globals '}'{
}

loop : TOK_LOOP '(' condition ')''{' globals '}'{
}

break : TOK_BREAK ';'{
}

%%