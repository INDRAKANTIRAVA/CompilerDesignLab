%{
#include "y.tab.h"
%}

%%

[ \t\r]+                ;
\n                      { return '\n'; }

";"                     { return ';'; }
"="                     { return '='; }
"("                     { return '('; }
")"                     { return ')'; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }

[0-9]+                  { yylval = atoi(yytext); return NUMBER; }
[a-z]                   { yylval = yytext[0]; return ID; }

.                       { return yytext[0]; }

%%

int yywrap(void) { return 1; }
