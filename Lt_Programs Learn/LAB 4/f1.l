%{
#include <stdio.h>
%}
%%

[0-9]+ { printf("got number token: %s	\n", yytext); }
[0-9]+(.[0-9]+) {printf("got float number %s \n",yytext);}
\n {printf("got new line \n"); }
. {printf("got non numeric charachter %s \n",yytext);}
%%
int yywrap()
{
	return 1;
}
int main()
{ 
	yylex();
	return 0;
}
