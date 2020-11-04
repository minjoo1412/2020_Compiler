%{
	#include <stdio.h>
%}
LETTER [a-zA-Z]
QUOTE \"
ESCAPE_QUOTE \\\"
%%
{QUOTE}([^\042\134]|"\\"(.|[\n]))*\" { printf("\t%s -> 스트링 상수\n", yytext); }
. ; //skip
%%
int yywrap(){return 1;}

int main()
{
	yylex();
	return 0;
}
