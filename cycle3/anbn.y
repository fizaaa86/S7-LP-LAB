%{
	#include <stdio.h>
	#include <stdlib.h>
	int yyerror(char*);
	int yylex(void);
%}
%token A B NL
%%
stmt:S NL {printf("valid");exit(0);};
S:A S B |;
%%

int yyerror(char*msg)
{
	printf("Invalid");
	exit(0);
}
int main()
{
	printf("Enter the string: ");
	yyparse();
	return 0;
}
