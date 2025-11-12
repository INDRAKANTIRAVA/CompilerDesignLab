%{
#include<stdio.h>
%}
letter [A-Za-z]
digit [0-9]
%%
{letter}({letter}|{digit})* {printf("%s is a valid identifier",yytext);}
{digit}({digit}|{letter})* {printf("%s is a not valid identifier",yytext);}
%%
int yywrap()
{
    return 0;
}
int main(){
    printf("Type here : \n");
    yylex();
    return 0;
}
    
