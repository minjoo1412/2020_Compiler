%{
	#include <stdio.h>
%}
C [^\n\*]
STAR [\*]
BEGIN1 "//"
BEGIN2 "/\*"
END "\*/"
%%
{BEGIN1}.* {printf("\t%s -> //주석\n", yytext);}
{BEGIN2}.*{END} {printf("\t%s -> /**/주석\n", yytext);}
. ; //skip
%%
int yywrap(){return 1;}
int main()
{
	yylex();
	return 0;
}
