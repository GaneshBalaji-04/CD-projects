%{
#include<stdio.h>
%}

%%
.*abbba.* {printf("Substring contains 'abbba'...");}
.*	  {printf("Substring does not contain 'abbba'...");}
%%

int main(){
	yylex();
	return 0;
}
