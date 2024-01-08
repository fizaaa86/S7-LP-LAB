%{
	#include <stdio.h>
	#include <stdlib.h>
	int reg1 = 0;
	int reg2 = 0;
%}

%%
aa[a+b]*bb {reg1++ ;}
[0+1]*000[0+1]* {reg2++ ;} 
. {reg1++ ;}

%%

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
	
	if(reg1 ==1 || reg2 ==1)
	{
		printf("The regular expression is valid\n");
	}
	else
	{
		printf("Invalid\n");
	}
	return 0;
}
