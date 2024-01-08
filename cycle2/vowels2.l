%{
	#include <stdio.h>
	#include <stdlib.h>
	int vowels = 0;
	int consonents = 0;
%}

%%
[aeiouAEIOU] {vowels++ ;}
[a-zA-Z] {consonents++ ;}
[0-9] ;
. ;

%%

int main()
{
	int filenum;
	printf("Enter the req number of files: \n");
	scanf("%d",&filenum);
	
	char filename[100];
	
	
	
	for(int i = 0;i<filenum;i++)
	{
		printf("Enter the filename: \n");
		scanf("%s",filename);
		FILE *file = fopen(filename , "r");
		
		if(!file)
		{
			fprintf(stderr,"Error opening file %s\n",filename);
			exit(1);
		}
		yyin = file;
		vowels = 0;
		consonents = 0;
		
		yylex();
		
		printf("Number of vowels: %d\n",vowels);
		printf("Number of consonants: %d\n",consonents);
	}
	return 0;
}
