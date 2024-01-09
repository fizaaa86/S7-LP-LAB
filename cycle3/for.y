%{
	#include <stdio.h>
	#include <stdlib.h>
	int yyerror(char*);
	int yylex();
%}
%token FOR
%token ID
%token NUM
%token PLUSPLUS MINUSMINUS
%token LESS LESSEQUAL GREATER GREATEREQUAL EQUAL NOTEQUAL
%token AND OR

%%
for_loop: FOR'(' init_expr';'condition';'incr_list')''{''}' {printf("valid");exit(0);}
	  |FOR'(' init_expr';'condition';'incr_list')' {printf("valid");exit(0);}
	  ;
init_expr: init_expr','init_assign
	   | init_assign
	   ;
init_assign:ID'='NUM
	    ;
condition:condition AND condition
	  |condition OR condition
	  |expression LESS expression
	  |expression LESSEQUAL expression
	  |expression GREATER expression
	  |expression GREATEREQUAL expression
	  |expression EQUAL expression
	  |expression NOTEQUAL expression
	  ;
incr_list:incr_list','incr_assign
	  | incr_assign
	  ;
incr_assign:ID PLUSPLUS
	    |ID MINUSMINUS
	    |ID '=' expression
	    |expression
	    ;
expression:NUM
	   |ID
	   |expression '+' expression
	   |expression '-' expression
	   |expression '*' expression
	   |expression '/' expression
	   |'(' expression ')'
	   |
	   ;
%%
int yyerror(char*msg)
{
	printf("Invalid\n");
	exit(0);
}
int main()
{
	printf("Enter the loop: \n");
	yyparse();
	return 0;
}
