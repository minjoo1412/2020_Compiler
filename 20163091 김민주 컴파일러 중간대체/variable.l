%{
	#include <stdio.h>
%}

LETTER [a-zA-Z]
DIGIT [0-9]
UNDERBAR _
%%
({LETTER}|{UNDERBAR})({LETTER}|{DIGIT}|{UNDERBAR})* { printf("\t%s -> variable\n", yytext); }
. ; //skip
%%
int yywrap(){
	return 1;
}
int main(){
	yylex();
	return 0;
}
