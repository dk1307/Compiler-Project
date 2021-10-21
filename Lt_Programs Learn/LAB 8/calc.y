%{
	#include<stdio.h>
	#include<math.h>
	int yyerror();
%}

%union{
	float f;
}
%token<f> NUM NEWLINE
%type<f> expr
%type<f> start

%left '+' '-'
%left '*' '/' '%'

%%

start: expr NEWLINE{
			int answer=$1;
			printf("Answer of given Expression: %d\n",answer);
			return 0;
		}
		;
expr: expr '+' expr {$$=$1+$3;}
	| expr '-' expr	{$$=$1-$3;}
	| expr '*' expr	{$$=$1*$3;}
	| expr '/' expr	{$$=$1/$3;}
	| NUM			{$$=$1;}
	;
%%
int yyerror(char *message)
{
	printf("YACC error: %s\n",message);
	exit(1);
}
int main()
{
	while(1){
	printf("Enter the Expression: ");
	yyparse();
	}
}
