%{
#include<stdio.h>
%}
%%


("") {printf(""); } 

(==) {printf("Valid token:%s\n" , yytext); }
(=\+) {printf("Valid token:%s\n" , yytext); }
(=-) {printf("Valid token:%s\n" , yytext); }
(=\?) {printf("Valid token:%s\n" , yytext); }
(=) {printf("Valid token:%s\n" , yytext); }
[0-9][0-9]E\+[0-9][0-9]  {printf("Valid token:%s\n" , yytext); }
[0-9][0-9]E-[0-9][0-9]  {printf("Valid token:%s\n" , yytext); }
. { printf("Invalid token:%s\n" , yytext); }


%%
void main()
{
	yylex() ; 
}
yywrap()
{

}