%{
    #include "y.tab.h"
    extern int yylval;
%}

%%
[0-9]   {yylval=atoi(yytext);return NUMBER;}
\t      {}
\n      {return EOL;}
[-+*/()] { return yytext[0]; } 
.       {fprintf(stderr, "Error:Invalid Character...\n");}
%%

int yywrap(){
    return 1;
}