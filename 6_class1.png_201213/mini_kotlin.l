%{

#include "y.tab.h"
%}

letter	[a-zA-Z_]
digit	[0-9]

%%
"=="	return(TYES);
"="	return(TASSIGN);
"+"	return(TPLUS);
"*"	return(TMUL);
"("	return(TLPAREN);
")"	return(TRPAREN);
"["	return(TLBRACKET);
"]"	return(TRBRACKET);
"{"	return(TBEGIN);
"}"	return(TEND);
":"	return(TCOLON);

class	return(CLASSSYM);
fun	return(FUNSYM);
data	return(DATASYM);
var	return(VARSYM);
val	return(VALSYM);
while	return(WHILESYM);
if	return(IFSYM);
else	return(ELSESYM);
true	return(TRUESYM);
false	return(FALSESYM);


{digit}+	return(TNUMBER);
{letter}({letter}|{digit})*	return(TIDENT);
\"	return(DDA);
[ \t\r\n]	;
.	return(TERROR);
%%
int yywrap()
{
  return 1;
}
