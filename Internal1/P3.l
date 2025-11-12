%{
#include<stdio.h>
%}
letter [a-zA-Z]
keyword auto|break|char|case|const|do|while|int|double|if|else|ifelse|switch|float|long|void
%%
{letter}  {printf("%s is not keyword",yytext);}
{keyword} {printf("%s is an Keyword",yytext);}
%%
int yywrap()
{
    return 0;
}
int main()
{
    printf("Enter here : ");
    yylex();
    return 0;
}

