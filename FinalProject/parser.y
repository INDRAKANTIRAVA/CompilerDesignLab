%{

#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);

/* symbol table */
int sym[26];
int isConst[26];

%}

/* tokens (all default int type) */
%token NUMBER ID

/* precedence to avoid conflicts */
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

program:
      /* empty */
    | program line
    ;

line:
      stmt '\n'
    | '\n'
    ;

stmt:
      ID '=' expr ';'
        {
            int idx = $1 - 'a';
            sym[idx] = $3;
            isConst[idx] = 1;
            printf("%c = %d\n", $1, $3);
        }
    |
      expr ';'
        {
            printf("Result = %d\n", $1);
        }
    ;

expr:
      expr '+' expr       { $$ = $1 + $3; }
    | expr '-' expr       { $$ = $1 - $3; }
    | expr '*' expr       { $$ = $1 * $3; }
    | expr '/' expr
        {
            if ($3 == 0) {
                printf("Error: divide by zero\n");
                $$ = 0;
            } else $$ = $1 / $3;
        }
    | '-' expr %prec UMINUS
        { $$ = -$2; }
    | NUMBER
        { $$ = $1; }
    | ID
        {
            int idx = $1 - 'a';
            if (isConst[idx])
                $$ = sym[idx];   /* constant propagation */
            else {
                printf("Error: variable %c not constant\n", $1);
                $$ = 0;
            }
        }
    | '(' expr ')'
        { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    printf("Parse error: %s\n", s);
}

int main() {
    for (int i = 0; i < 26; i++) { isConst[i] = 0; sym[i] = 0; }

    printf("Constant Propagation + Constant Folding Optimizer\n");
    printf("Enter statements:\n");

    yyparse();
    return 0;
}
