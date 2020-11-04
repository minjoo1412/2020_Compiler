%{
	/* keyword */
%}
KEYWORD (auto|double|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|const|float|short|unsigned|continue|for|signed|void|default|goto|sizeof|volatile|do|if|static|while)
%%
{KEYWORD} { printf("\t%s -> keyword\n", yytext); }
. ; //skip
%%
int yywrap(){return 1;}

int main()
{
	yylex();
	return 0;
}



