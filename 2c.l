%{
	#include<stdio.h>
%}

%%
[+-]?[0-9]*\.[0-9]+([eE][+-]?[0-9]+)? {printf("Valid floating-point number...");}

.* 				      {printf("Invalid floating-point number...");}
%%

int main(){
	yylex();
	return 0;
}
