%{
#include <stdio.h>
extern int yylex();
void yyerror();
%}

%token	TIDENT TNUMBER TASSIGN TDOT TBEGIN TEND TERROR
%token	TLPAREN TRPAREN TLBRACKET TRBRACKET TPLUS TMINUS TMUL TDIV TMOD
%token 	CLASSSYM DDA FUNSYM IFSYM TCOLON TRUESYM TYES VALSYM VARSYM WHILESYM ELSESYM
%token	DATASYM FALSESYM
%%
class_stmts:	class_stmt	{ puts("0-1, 클래스 인식"); }
		| class_stmts class_stmt	{ puts("0-2, 클래스 인식(여러개)"); }
		;
class_stmt:	DATASYM CLASSSYM TIDENT class_compound_stmt {puts("1, 클래스 분석"); }
		;
class_compound_stmt:	TBEGIN class_statement2 TEND	{ puts("2, class{ }"); }
		;
class_statement2: class_statement	{ puts("3-1"); }
		| class_statement2 class_statement	{ puts("3-2"); }
		;
class_statement: assign_stmt	{ puts("4-1"); }
		| fun_stmt {puts("4-2, 클래스 내 함수 발견");}
		;
fun_stmt: FUNSYM TIDENT TLPAREN TRPAREN fun_compound_stmt	{puts("11, 함수 분석");}
		;
fun_compound_stmt:	TBEGIN fun_statement2 TEND	{ puts("12, fun{ }"); }
		;
fun_statement2: fun_statement	{ puts("13-1, 함수 인식"); }
		| fun_statement2 fun_statement	{ puts("13-2, 함수 인식(여러개)"); }
		;
fun_statement:	statement	{ puts("14-1"); }
		|fun_compound_stmt	{ puts("14-2"); }
		;
statement: 	assign_stmt	{ puts("15-1, assign문 인식"); }
		|while_stmt	{ puts("15-2, while문 인식"); }
		|if_stmt	{ puts("15-3, if문 인식"); }
		;

assign_stmt: lhs TASSIGN exp	{ puts("5, assign문"); }
		;
while_stmt: WHILESYM TLPAREN variable TYES exp TRPAREN fun_statement	{puts("16, while문 분석");}
		;
if_stmt: IFSYM TLPAREN exp TRPAREN fun_compound_stmt ELSESYM else_stmt	{ puts("17-1,if문, else문 분석"); }
		|IFSYM TLPAREN exp TRPAREN fun_statement	{ puts("17-2, if문 분석"); }
		;
else_stmt: fun_compound_stmt	{ puts("17-3, else문 확인"); }
		;
lhs:	variable	{ puts("6-1"); }
		|VARSYM variable	{ puts("6-2, var 변수"); }
		|VALSYM variable	{ puts("6-3, val 변수"); }
		;
exp:	exp TPLUS term	{ puts("7-1"); }
		| exp TMINUS term	{ puts("7-2"); }
		| term	{ puts("7-3"); }
		;
term:	term TMUL factor	{ puts("8-1"); }
		| term TDIV factor	{ puts("8-2"); }
		| term TMOD factor	{ puts("8-3"); }
		| factor	{ puts("8-4"); }
		;
factor:	TMINUS factor	{ puts("9-1"); }
		| variable	{ puts("9-2, 변수"); }
		| TNUMBER	{ puts("9-3, 숫자"); }
		| TLPAREN exp TRPAREN	{ puts("9-4"); }
		| TRUESYM	{puts("9-5, TRUE");}
		| FALSESYM	{puts("9-6, FALSE");}
		;
variable:	TIDENT	{ puts("10-1"); }
		| TIDENT TLBRACKET exp TRBRACKET	{ puts("10-2"); }
		| TIDENT TCOLON { puts("10-3"); }
		;
%%

int main()
{
	yyparse();
	return 0;
}

void yyerror(char *s)
{
	fprintf(stderr, "%s\n", s);
	return;
}
