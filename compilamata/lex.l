%{  
#include <stdio.h>
#include "sin.tab.h"

int yyerror(const char *s);
%}

%option yylineno

%%

[ \t\r\n] { /* ignora */ }

"//".*\n { /* ignora */ }

"informatico" {return TOK_PRINT;}

"mestle" {return TOK_IF;}

"outomestle" {return TOK_ELSE;}

"aimeavida" {return TOK_LOOP;}

"nengue" {return TOK_BREAK;}

"falabaxo" {return TOK_SCAN;}

"kuna" {return TIPO_BOOL;}

"mata" {return TIPO_INT;}

"so um poco" {return TIPO_FLOAT;}

"ababa" {return TIPO_CHAR;}

"picareta" {return TIPO_STRING;}

"||" { return TOK_OR;}
"&&" { return TOK_AND;}
"+" { return '+'; }
"-" { return '-'; }
"*" { return '*'; }
"/" { return '/'; }
"(" { return '('; }
")" { return ')'; }
";" { return ';'; }
"!=" { return TOK_DIFERENTE;}
"=" { return '='; }
"<=" { return TOK_MEOI;}
">=" { return TOK_MAOI;}
"==" { return TOK_IGUAL;}
">" {return '>';}
"<" {return '<';}
\{ { return '{'; }
\} { return '}'; }

"verdadi" {return TOK_TRUE;}

"mintira" {return TOK_FALSE;}

\"[a-zA-Z_' '0-9]+\" {return TOK_STRING;}

[a-zA-Z_][a-zA-Z0-9_]* {return TOK_IDENT;}

\'[a-zA-Z]\' {return TOK_CHAR;}

[0-9]+\.[0-9]* {return TOK_FLOAT;}

[0-9]+ {return TOK_INT;}

. {
    printf("Simbolo nao reconhecido%c\n", yytext[0]);
    }

%%

int yywrap() {
    return 1;
}

int yyerror(const char *s){
    printf("Erro de sintaxe na linha %d: %s\n", yylineno, s);
    return 1;
}

int main(int argc, char *argv[]){

    if(argc <=1){
        printf("Sintaxe: %s nome_do_programa\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (yyin == NULL){
        printf("Não foi possível abrir o arquivo %s.\n", argv[1]);
        return 1;
    }

    yyparse();

    if (yyin)
        fclose(yyin);

    return 0;
}