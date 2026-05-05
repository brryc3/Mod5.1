%{
#include <stdio.h>
%}

%token ID

%%

expr : expr '+' term
     | term
     ;

term : term '*' primary
     | primary
     ;

primary : ID
        | '(' expr ')'
        ;

%%

int main() {
    return yyparse();
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}