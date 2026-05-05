%{
#include <stdio.h>
%}

%token ID INT STARSTAR

%left '+'
%left '*'
%right STARSTAR
%left UNARY

%%

expr : expr '+' expr
     | expr '*' expr
     | expr STARSTAR expr
     | primary
     | '+' expr %prec UNARY
     ;

primary : ID
        | '(' expr ')'
        | '(' "int" ')' primary
        | '(' expr ')' primary %prec UNARY
        ;

%%

int main() {
    return yyparse();
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}