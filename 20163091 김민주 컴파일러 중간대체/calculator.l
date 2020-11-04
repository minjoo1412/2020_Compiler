%{
	#include <stdio.h>
%}

DIGIT [0-9]

%%
"+" { printf("\t%s -> 더하기\n", yytext); }
"-" { printf("\t%s -> 빼기\n", yytext); }
"*" { printf("\t%s -> 곱하기\n", yytext); }
"/" { printf("\t%s -> 나누기\n", yytext); }
"(" { printf("\t%s -> (\n", yytext); }
")" { printf("\t%s -> )\n", yytext); }
("+"|"-")?[1-9]({DIGIT})* { printf("\t%s -> DIGIT\n", yytext); }
%%
int yywrap(){return 1;}
int main()
{
	yylex();
	return 0;
}
