%{
#include "TopDown.tab.h"
#include <stdio.h>
%}

digit   [0-9]

%%

{digit}       { yylval = yytext[0]; return DIGIT; }
"("           return LPAREN;
")"           return RPAREN;
"+"           return PLUS;
"*"           return STAR;

[ \t\r]+      ;      /* ignore spaces */
\n            return '\n';

.             { return yytext[0]; }

%%

int yywrap() { return 1; }
