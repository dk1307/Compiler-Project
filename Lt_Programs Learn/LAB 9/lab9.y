%{

#include<stdio.h>
#include "y.tab.h"
int yyerror(char *s);
int yyparse(void);

%}

%token OPERATION KEYWORD SHOW SEMICOLON QM NUMBER NL

%%

E : S NL { return 0;}

S : T {printf("\nYour Given String is Valid\n\n");}

T : OPERATION NUMBER SEMICOLON NUMBER SEMICOLON NUMBER SEMICOLON NUMBER QM |
	OPERATION NUMBER KEYWORD KEYWORD QM |
	OPERATION KEYWORD KEYWORD KEYWORD NUMBER QM|
	SHOW KEYWORD KEYWORD KEYWORD QM

%%

int main()
{
    while(1)
    {
        printf("Enter your language input:");
        yyparse();
    }
}
int yyerror(char *s)
{
    fprintf(stderr,"%s\n",s);
    exit(0);
}
