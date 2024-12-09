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
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

ArithmeticExpression: E
    {
        printf("Result is %d...",$1);
    }
    ;
E:
    E '+' E      {$$ = $1+$3;}
  |  E '-' E     {$$ = $1-$3;}
  |  E '*' E     {$$ = $1*$3;}
  |  E '/' E     {$$ = $1/$3;}
  |  '(' E ')'   {$$ = $2;}
  |  NUMBER      {$$ = $1;}
  ;

%%

int main(){
    printf("Enter the valid arithmetic expression:");
    if(yyparse()==0 && flag){
        printf("Expression is valid...\n");
    }
    return 0;
}
