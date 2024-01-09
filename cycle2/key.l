%{
	#include<stdio.h>
	#include<stdlib.h>
	int stmt = 0;
	int id = 0;
	int assign = 0;
	int rel = 0;
	int key = 0;
	int intgr = 0;
%}
%%
"break"|"case"|"char"|"const"|"continue"|"do"|"double"|"else"|"float"|"for"|"goto"|"int"|"if"|"return"|"switch"|"while" {key++;}
[a-zA-Z][a-zA-Z_0-9]* {id++;}
[0-9]+ {intgr++;}
[#][a-zA-Z<>.]* {}
[=] {assign++;}
[<|<[=]*|>=*|>] {rel++;}
[;] {stmt ++;}
. {}
%%
int yywrap()
{
	return 1;
}
int main()
{
	yylex();
	printf("No of statements: %d\n",stmt);
	printf("No of Keywords: %d\n",key);
	printf("No of identifiers: %d\n",id);
	printf("No of integers: %d\n",intgr);
	printf("No of relational operators: %d\n",rel);
	printf("No of assignment operators: %d\n",assign);
	
	return 0;
}
	
