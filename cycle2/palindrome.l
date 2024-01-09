%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	int count = 0;
	int flag = 0;
	char comp [] = "computer";
	char sci [] = "science";
%}
%%
[a-zA-Z_0-9]* {
	for(int i=0,j=yyleng-1;i<=j;i++,j--)
	{
		if(yytext[i]!=yytext[j])
		{
			flag = 1;
			break;
		}
		else
		{
			flag = 0;
		}
	}
	if(flag==0)
	{
		count++;
	}
	if(strcmp(yytext,comp)==0)
	{
		fprintf(yyout,"%s ",sci);
	}
	else
	{
		fprintf(yyout,"%s",yytext);
	}
}
. {}

	
%%
int yywrap()
{
	return 1;
}
int main(int argc,char*argv[])
{
	yyin = fopen(argv[1],"r");
	yyout = fopen(argv[2],"w");
	yylex();
	printf("Count of Palindromes: %d\n",count);
	return 0;
}

