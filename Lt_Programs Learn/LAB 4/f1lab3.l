%{
#include<stdio.h>
int totaltoken= 0;
%} 

%%
("if")|("else")|("while")|("do")|("continue")|("untill")|("for")|("case")|("switch") {totaltoken ++; printf("a.This is Keywords: %s\n",yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {totaltoken ++; printf("b.This is identifiers: %s\n",yytext);}
[0-9]+"."[0-9]+ {totaltoken ++; printf("c1.This is Floats : %s\n", yytext);} 
[0-9]+ {totaltoken ++; printf("c2.This is Integer: %s\n",yytext);}
"*"." "   {totaltoken ++; printf("d.This is single line Commments start with ***: %s\n",&yytext[3]);}
[" "\t] {printf("e.This is a white space \n");}
[,|;(|)|{|}|.|\[|\]] {totaltoken ++; printf("f.This is Punctuation: %s\n",yytext);}
"+"|"-"|"*"|"/"|"%"  {totaltoken ++; printf("g.This is (mathametical) Operator: %s\n",yytext);}
"<="|">="|":="|"!="|"=="|"<>"  {totaltoken ++; printf("g.This is (relational) Operator: %s\n",yytext);}
'[^']+' {totaltoken ++; printf("f.This is String: %s\n",yytext);}
"$" return 0;
%% 

int yywrap(){} 

int main(){ 
yylex(); 
printf("totaltoken is : %d",totaltoken );
return 0; 
}