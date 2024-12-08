%{
    #include "y.tab.h"
%}

%%
"if"      {return IF;}
"else"    {return ELSE;}
"do"      {return DO;}
"while"    {return WHILE;}
[a-zA-Z_][a-zA-Z0-9_]*  {return VARIABLE;}
(==|!=|<|<=|>|>=)       {return REL_OP;}
"{"        {return CURLY_OPEN;}
"}"        {return CURLY_CLOSE;}
"("         {return PARAM_OPEN;}
")"         {return PARAM_CLOSE;}
\n          {return 0;}
%%

int yywrap(){
    return 1;
}
