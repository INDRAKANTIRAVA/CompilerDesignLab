%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token DIGIT PLUS STAR LPAREN RPAREN

%%

input:
      /* empty */
    | input line
    ;

line:
      E '\n'     { printf("Valid Expression\n"); }
    ;

E:
      T Eprime
    ;

Eprime:
      PLUS T Eprime
    | /* epsilon */
    ;

T:
      F Tprime
    ;

Tprime:
      STAR F Tprime
    | /* epsilon */
    ;

F:
      LPAREN E RPAREN
    | DIGIT
    ;

%%

int main() {
    printf("Enter expressions:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Invalid Expression\n");
}
