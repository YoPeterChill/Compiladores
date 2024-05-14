%{
int yyerror(const char *s);
int yylex(void);
%}

%define parse.error verbose

%token TOK_IDENT
%token TOK_PRINT
%token TOK_FLOAT
%token TOK_INT

%start program

%%

program : globals ;

globals : globals global{
}

globals : global {
}

global : TOK_IDENT '=' expr ';' {
}

global : TOK_PRINT TOK_IDENT ';' {
}

expr : expr '+' term {
} 

expr : expr '-' term {
}

expr : term{
}

term : term '*' factor{
}

term : term '/' factor{
}

term : factor{
}

factor : '(' expr ')' {
}

factor : TOK_IDENT {
}

factor : TOK_INT {
}

factor : TOK_FLOAT {
}

%%
