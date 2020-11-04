%{
	#include <stdio.h>
%}
DIGIT [0-9]
OCTAL [0-7]
HEXA [0-9a-fA-F]
%%
0{OCTAL}+ { printf("\t%s -> 8진수 정수\n", yytext); }
[1-9]{DIGIT}* { printf("\t%s -> 10진수 정수\n", yytext); }
0(x|X){HEXA}+ { printf("\t%s -> 16진수 정수\n", yytext); }
%%
int yywrap(){return 1;}

int main(){
	yylex();
	return 0;
}
