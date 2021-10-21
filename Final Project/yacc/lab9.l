%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
"Add"|"add"|"Sub"|"sub"|"Mul"|"mul"|"Div"|"div" {printf("<%s, OPERATION>\n", yytext); return OPERATION;}

"From"|"from"|"by"|"to"|"it"|"number"|"and"|"result"|"Result"|"the"|"me"|"Answer"|"answer" {printf("<%s, KEYWORD>\n", yytext); return KEYWORD;}

"Show"|"show" {printf("<%s, KEYWORD>\n", yytext); return SHOW;}

"," {return SEMICOLON;}

[0-9]+ {printf("<%s, NUMBER>\n",yytext); return NUMBER;}

"?" {printf("<%s, QUESTION MARK>\n",yytext); return QM;}

\n {return NL;}

. {}
%%

int yywrap(void)
{
    return 1;
}
