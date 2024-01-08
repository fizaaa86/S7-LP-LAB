%{
	#include <stdio.h>
	#include <stdlib.h>
	int chars = 0;
	int wds = 0;
	int line = 0;
%}

%%
[a-zA-Z] {chars ++;}
[0-9] {chars ++;}
[!@#$%^&*()+_\-\*/] {chars ++;}
[' '] {wds ++;}
[\n] {line ++,wds++;}

%%

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
	printf("The number of characters: %d\n",chars);
	printf("The number of words: %d\n",wds);
	printf("The number of lines: %d\n",line);
	return 0;
}	
