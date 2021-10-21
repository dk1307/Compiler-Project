%{
    #include<stdio.h>
    #include"y.tab.h"
%}
integer [0-9]+
float ([0-9]+)[.][0-9]+
%%
{integer} {	yylval.f=atof(yytext);
			return NUM;
		}
{float}	{ yylval.f=atof(yytext);
		  return NUM;
		}
		
.		return *yytext;
[\n]	return NEWLINE;

%%

int yywrap()
{
	return 1;
}
