%{
%}
DIGIT [0-9]
EXPONENT [eE]
SIGN [\+-]
%%
{DIGIT}+"."{DIGIT}+({EXPONENT}[+,-]?{DIGIT}+)? { printf("\t%s -> 실수 상수\n", yytext); }
. ; //skip
%%
int yywrap(){return 1;}

int main(){
	yylex();
}
