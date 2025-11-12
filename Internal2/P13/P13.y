%{
#include<stdio.h>
%}
/* Operator Definitions */
arithmetic    "+"|"-"|"*"|"/"|"++"|"--"|"%"
relational    "<"|">"|"<="|">="|"=="|"!="
logical       "&&"|"||"|"!"
assignment    "="|"+="|"-="|"*="|"/="|"%="|"&="|"|="|"^="|"<<="|">>="
bitwise       "&"|"|"|"^"|"~"|"<<"|">>"
conditional   "?"|":"
%%
{arithmetic}    {printf("%s is an arithmetic operator.\n", yytext);}
{relational}    {printf("%s is a relational operator.\n", yytext);}
{logical}       {printf("%s is a logical operator.\n", yytext);}
{assignment}    {printf("%s is an assignment operator.\n", yytext);}
{bitwise}       {printf("%s is a bitwise operator.\n", yytext);}
{conditional}   {printf("%s is a conditional operator.\n", yytext);}
%%
int yywrap() {
    return 0;
}
int main() {
    printf("Enter a operator : \n");
    yylex();
    return 0;
}
