%{
    #include<stdio.h>
    int yyerror();
    extern int flag=1;
    extern int yylex();
%}

%token ALPHA NUMBER 

%%
input:
    ALPHA X;

X:
    ALPHA X
    | NUMBER
    | /* empty */
    ;
%%

int yyerror() {
    flag=0;
    printf("Error: Syntax Error\n");
    return 0;
}

int main() {
    if(yyparse()==0 && flag)
    printf("Valid Variable\n");
    else
    printf("Not a valid variable\n");
}
