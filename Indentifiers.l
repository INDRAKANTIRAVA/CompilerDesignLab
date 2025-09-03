%{
#include <stdio.h>
%}

letter  [a-zA-Z]
digit   [0-9]

%%
{letter}({letter}|{digit})*     { printf("%s is a valid identifier\n", yytext); }
{digit}({letter}|{digit})*      { printf("%s is not a valid identifier\n", yytext); }
%%

int yywrap() {
    return 0;
}

int main() {
    yylex();
    return 0;
}


