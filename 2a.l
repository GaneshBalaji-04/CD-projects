%{
#include<stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* { printf("Valid Identifier...\n");}
.*		       { printf("Invalid identifier...\n");}
%%
int main(void){
	yylex();
	return 0;
}
