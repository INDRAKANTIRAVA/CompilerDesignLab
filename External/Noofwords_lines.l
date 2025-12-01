
%{
#include <stdio.h>
int wordCount = 0;
int lineCount = 0;
%}

%%
[ \t]+                  ;   /* Skip spaces and tabs */
\n                      { lineCount++; }  /* Count lines */
[A-Za-z0-9_]+           { wordCount++; }  /* Count words */
.                       ;   /* Ignore other characters */
%%

int yywrap() {
    return 1;    /* End of input */
}

int main() {
    printf("Enter the Program, then press Ctrl+D:\n\n");
    yylex();
    printf("\nTotal Words: %d\n", wordCount);
    printf("Total Lines: %d\n", lineCount);
    return 0;
}
