%{
 #include <stdio.h>
 #include <stdlib.h>
 #include "y.tab.h"
%}

%%
[0-9]+    { yylval.dval = atoi(yytext); return DIGIT; }

[ \t\n]   ;      /* ignore whitespace */

.         { return yytext[0]; }
%%

int yywrap() { return 1; }
