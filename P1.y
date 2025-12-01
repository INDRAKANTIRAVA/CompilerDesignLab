%{
#include <stdio.h>
#include <stdlib.h>
%}

%union {
    int dval;
}

%token <dval> DIGIT
%type  <dval> expr

%%
expr: DIGIT    { printf("Value = %d\n", $1); }
     ;
%%

int main() {
    return yyparse();
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}
