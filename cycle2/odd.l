%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
extern FILE *yyin, *yyout;
char val1[] = "10";
char val2[] = "99";
int i;
%}

%%
[0-9]+ {
  i = atoi(yytext);
    if (i % 2 == 0)
    {
        fprintf(yyout, "%s", val1);
    }
    else
    {
        fprintf(yyout,"%s",val2);
    }
}
. {}

%%

int yywrap()
{
    return 1;
}

int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin)
    {
        fprintf(stderr, "Unable to open input file: %s\n", argv[1]);
        return 1;
    }

    yyout = fopen(argv[2], "w"); // Change the output file name as needed
    if (!yyout)
    {
        fprintf(stderr, "Unable to open output file\n");
        fclose(yyin);
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);
    return 0;
}

