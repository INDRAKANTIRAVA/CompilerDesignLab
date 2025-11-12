
%{
    #include <stdio.h>
%}

vowel      [AEIOUaeiou]
consonant  [A-Za-z&&[^AEIOUaeiou]]

%%
{vowel}        { printf("%s is a vowel.\n", yytext); }
{consonant}    { printf("%s is a consonant.\n", yytext); }
.              { printf("%s is not a letter.\n", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}

