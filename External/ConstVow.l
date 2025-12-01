%{
    #include <stdio.h>
%}

vowel      [AEIOUaeiou]
consonant  [A-Za-z]

%%
{vowel}        { printf("%s is a vowel.\n", yytext); }
{consonant}    { printf("%s is a consonant.\n", yytext); }
[ \t\n]+       { /* ignore spaces, tabs, newlines */ }
.              { printf("%s is not a letter.\n", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter characters : ");
    yylex();
    return 0;
}
