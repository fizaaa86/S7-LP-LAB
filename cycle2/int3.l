%{
	#include <stdio.h>
	#include <stdlib.h>
	extern FILE *yyin,*yyout;
	int count1 = 0;
	int count2 = 0;
	int count3 = 0;
%}
%%
^[aeiouAEIOU][a-zA-Z]* {count1++;}
^(a|b|c)*a(a|b|c)(a|b|c)$ {count2++;}
^[b*ab*ab*]*$ {count3++ ;}
. {}
%%
int yywrap()
{
	return 1;
}
int main(int argc,char*argv[])
{
	if(argc!=2)
	{
		fprintf(stderr,"Usage: error");
	}
	yyin = fopen(argv[1],"r");
	yylex();
	printf("Count 1: %d\n",count1);
	printf("Count 2: %d\n",count2);
	printf("Count 3: %d\n",count3);
	return 0;
}
	
