%{
int yyerror(const char *s);
int yylex(void);
%}

%define parse.error verbose

%token TOK_IDENT TOK_PRINT TOK_SCAN TOK_IF TOK_ELSE TOK_WHILE TOK_FOR TOK_BREAK
%token TYPE_BOOL TYPE_INT TYPE_FLOAT TYPE_CHAR TYPE_STRING
%token TOK_AND TOK_OR TOK_LESSEQUAL TOK_GREATEREQUAL TOK_EQUAL TOK_DIFF
%token TOK_TRUE TOK_FALSE TOK_INT TOK_FLOAT TOK_CHAR TOK_STRING

%start program

%%

program
	: globals;

globals
	: globals global
	| global
	;

global
	: declaration
    | atribuition
    | while
    | for
    | print
    | selection
    | break
	;

declaration
	: type TOK_IDENT '=' tok ';'
	| type TOK_IDENT ';'
	;

atribuition
	: TOK_IDENT '=' tok ';'
	| TOK_IDENT '=' scan
	;

scan
	: TOK_SCAN '(' type ')'';'
	;

type
	: TYPE_BOOL
	| TYPE_INT
	| TYPE_FLOAT
	| TYPE_CHAR
	| TYPE_STRING
	;

tok
	: TOK_STRING
	| TOK_CHAR
	| condition
	;

num_expression
	: num_expression '+' num_term
	| num_expression '-' num_term
	| num_term
	;

num_term
	: num_term '*' num_factor
	| num_term '/' num_factor
	| num_factor
	;

num_factor
	: '(' num_expression ')'
	| TOK_IDENT
	| TOK_INT
	| TOK_FLOAT
	| unary
	;

unary
	: '-' num_factor
	;

print
	: TOK_PRINT '(' tok ')'';'
	;

selection
	: TOK_IF '(' condition ')' '{' globals '}'
	| TOK_IF '(' condition ')' '{' globals '}' TOK_ELSE '{' globals '}'
	| TOK_IF '(' condition ')' '{' globals '}' TOK_ELSE selection
	;

condition
	: num_factor relational_operator num_factor
	| '(' condition logic_operator condition ')'
	| num_expression
	| bool
	;

bool
	: TOK_TRUE
	| TOK_FALSE
	| not
	;

not
	: '!''(' condition ')'
	;

relational_operator
	: TOK_EQUAL
	| TOK_DIFF
	| '>'
	| TOK_GREATEREQUAL
	| '<'
	| TOK_LESSEQUAL
	;

logic_operator
	: TOK_AND
	| TOK_OR
	;

while
	: TOK_WHILE '(' TOK_INT ';' TOK_INT ';' TOK_INT ')''{' globals '}'
	| TOK_WHILE '(' condition ')''{' globals '}'
	;

for
	: TOK_FOR '(' for_init ';' condition ';' for_iter ')' '{' globals '}'
	;

for_init
	: declaration 
    | atribuition
	;

for_iter
	: atribuition
	;

break
	: TOK_BREAK ';'
	;

%%