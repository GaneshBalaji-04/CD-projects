%{
    #include<stdio.h>
    int yylex();
    int yywrap();
    int yyparse();
    int flag=1;
    void yyerror(char *s){
        flag=0;
        fprintf(stderr,"Error:%s\n",s);
    }
    int temp_count=0;
%}

%token NUMBER EOL
%left '+' '-'
%left '*' '/' 
%left '(' ')'

%%
program: lines;

lines:line 
    | lines line;

line: expr EOL {printf("Result: t%d\n",$1);}
    | expr {printf("Result: t%d\n",$1);}

expr: NUMBER    {$$=$1;}
    | '(' expr ')'      {$$=$2;}
    | expr '+' expr     {printf("t%d = %d + %d\n",++temp_count,$1,$3);$$=temp_count;}
    | expr '-' expr     {printf("t%d = %d - %d\n",++temp_count,$1,$3);$$=temp_count;}
    | expr '*' expr     {printf("t%d = %d * %d\n",++temp_count,$1,$3);$$=temp_count;}
    | expr '/' expr     {
        if($3==0){
            yyerror("Division by Zero");
        }
        else{
            printf("t%d = %d / %d\n",++temp_count,$1,$3);
            $$=temp_count;
        }
    }
    ;
%%

int main(){
    yyparse();
    return 0;
}

