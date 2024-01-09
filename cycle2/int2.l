%{
	#include <stdio.h>
	#include <stdlib.h>
	extern FILE *yyin,*yyout;
	int neg = 0;
	int pos = 0;
%}
%%
^[-][0-9]+ {neg ++;}
[0-9]+ {pos++;}
" " { fprintf(yyout,"%s","_");}
. {fprintf(yyout,"%s",yytext);}

%%
int yywrap()
{
	return 1;
}
int main(int argc,char*argv[])
{
	if(argc!=3)
	{
		fprintf(stderr,"Usage: error");
	}
	yyin = fopen(argv[1],"r");
	yyout = fopen(argv[2],"w");
	yylex();
	printf("Negative no: %d\n",neg);
	printf("Positive no: %d\n",pos);
	return 0;
}
