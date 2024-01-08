%{
	#include <stdio.h>
	#include <stdlib.h>
	extern FILE *yyin,*yyout;
	int flag = 0;
%}

%%
[0-9]+ {;}
[' '] {flag++ ;}
. {
	if(flag == 1)
	{
		fprintf(yyout," %s",yytext);
		flag = 0;
	}
	else{
		fprintf(yyout,"%s",yytext);
	    }
}
%%

int yywrap()
{
	return 1;
}

int main(int argc,char*argv[])
{
	if(argc!=3)
	{
		fprintf(stderr,"Usage error");
		return 1;
	}
	yyin = fopen(argv[1],"r");
	
	if(!yyin)
	{
		fprintf(stderr,"Error opening input file\n");
		return -1;
	}
	yyout = fopen(argv[2],"w");
	
	if(!yyout)
	{
		fprintf(stderr,"Error opening output file\n");
		return -1;
	}
	
	yylex();
	printf("Contents copied successfully!\n");
	fclose(yyin);
	fclose(yyout);
	
	return 0;
}
