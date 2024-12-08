%{
#include<stdio.h>
#include<stdlib.h>

int flag = 1;
int yylex();
int yyerror(char *s);
int yyparse();
extern int yylval;
%}

%token NUMBER

%%

expr: term expr_exp;

expr_exp: '+' expr       
        | '-' expr       
        | /* empty */    
        ;

term: factor term_exp;

term_exp: '*' factor     
        | '/' factor     
        | /* empty */    
        ;

factor: '(' expr ')'     
      | NUMBER           
      ;

%%

int yyerror(char *s) {
        flag = 0;
        printf("Invalid Expression\n");
        return 0;
}
    


int main() {
    printf("Enter an arithmetic expression: ");
    yyparse();
    if(flag) {
        printf("Valid Expression\n");
    }
    return 0;
}
