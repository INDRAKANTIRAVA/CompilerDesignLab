%{
#include <stdio.h>
%}

/* Definitions */
identifier  [a-zA-Z_][a-zA-Z0-9_]*
datatype    (void|int|float|char|double|long|struct)
comment     (\/\/[^\n]*|\/\*([^*]|\*+[^*/])*\*+\/)

%%
{datatype}[ \t]+{identifier}[ \t]*\([^\)]*\) {
    printf("%s is a function declaration.\n", yytext);
}

{comment} {
    printf("%s is a comment.\n", yytext);
}

{identifier} {
    printf("%s is an identifier.\n", yytext);
}

[ \t\n]+   ;   /* Ignore whitespace */
.         ;    /* Ignore anything else */
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter code input:\n");
    yylex();
    return 0;
}
