%{
#include<stdio.h>
%}
letter[A-Za-z]
digit[0-9]
keyword auto|break|case|char|const|continue|default|do|else|enum|extern|float|for|goto|if|int|long|register|return|while|short|void|steuet|switch|union
%%
{keyword}* {printf("%s is a keyword",yytext);}
{letter}* {printf("%s is not a keyword",yytext);}
%%
int yywrap()
{
return 0;
}
int main()
{
yylex();
return 0;
}

