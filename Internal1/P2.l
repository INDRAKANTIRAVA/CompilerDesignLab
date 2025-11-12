%{
#include<stdio.h>
%}
arthimetic "+"|"-"|"*"|"/"|"%"
relational ">="|"<="|"<"|">"|"=="
logical "&&"|"||"|"!"
bitwise "&"|"|"|"^"|"~"|"<<"|">>"
assignment "+="|"-="|"*="|"/="|"&="
%%
{arthimetic} {printf("%s is an arthimetic op",yytext);}
{relational} {printf("%s is an relational  op",yytext);}
{logical} {printf("%s is an logical op",yytext);}
{bitwise} {printf("%s is an bitwise op",yytext);}
{assignment} {printf("%s is an assignment op",yytext);}
%%
int yywrap()
{
    return 0;
}
int main()
{
    printf("Enter any operator : ");
    yylex();
    return 0;
}
