%{
	#include<stdio.h>
	#include<stdlib.h>
	int yyerror(char*);
	int yylex(void);
%}
%token IF THEN ID NUM NL
%%
stmt:if_stmt NL {printf("valid");exit(0);}
if_stmt:IF'(' COND ')' THEN ST;
COND:ID'>'NUM;
ST:ID'='NUM;

%%

int yyerror(char* msg)
{
	printf("Invalid\n");
	exit(0);
}

int main()
{
	printf("Enter the string: \n");
	yyparse();
	return 0;
}
