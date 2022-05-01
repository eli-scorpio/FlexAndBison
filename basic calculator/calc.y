%{
#include <stdio.h>
int yylex();
int yyerror();
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL MOD DIV ABS
%token EOL

%%

explist: 
 | explist exp EOL { printf("= %d\n", $2); } 
 ;

exp: NUMBER
 | SUB NUMBER  { $$ = - $2;}
 | exp ADD exp { $$ = $1 + $3; }
 | exp SUB exp { $$ = $1 - $3; }
 | exp MUL exp { $$ = $1 * $3; }
 | exp DIV exp { $$ = $1 / $3; }
 | exp MOD exp { $$ = $1 % $3; }
 | ABS exp ABS { $$ = $2 >= 0? $2 : - $2; }
 ;

%%

int main(int argc, char **argv){
 yyparse();
}

int yyerror(char *s){
 fprintf(stderr, "error: %s\n", s);
 return 0;
}