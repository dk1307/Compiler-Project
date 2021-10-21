%{
	#include<stdio.h>
	int totaltk=0;
%}

Keywords		"From"|"from"|"show"|"Show"|"by"|"to"|"it"|"the"|"me"|"number"|"and"|"Result"|"result"|"answer"|"Answer"
Operator		"Add"|"add"|"Sub"|"sub"|"Mul"|"mul"|"Div"|"div"
Digit		[0-9]
QM		"?"
WS		[\t\n]
Int		{Digit}+
Float		{Digit}+(\.{Digit}+)?(E[+\-]?{Digit}+)?
Space		{WS}+

%%
{Keywords}	{printf("Keyword : %s\n",yytext);totaltk++;}
{Operator}  {printf("operator is: %s\n",yytext);totaltk++;}
{Int}  {printf("Integer : %s\n",yytext);totaltk++;}
{Float}  {printf("Float No : %s\n",yytext);totaltk++;}
{QM}	{printf("\n");totaltk++;}
{Space} {}
.	{}
%%
int yywrap()
{
	return 1;
}
int main()
{
	yylex();
	printf("Total Number of Tokens In our Example: %d\n",totaltk);
	return 0;
}
