%{
	#include "y.tab.h"
%}
%%
"for" {return FOR;}
[a-zA-Z][a-zA-Z_0-9]* {return ID;}
[0-9]+ {return NUM;}
"++" {return PLUSPLUS;}
"--" {return MINUSMINUS;}
"<" {return LESS;}
"<=" {return LESSEQUAL;}
">" {return GREATER;}
">=" {return GREATEREQUAL;}
"==" {return EQUAL;}
"!=" {return NOTEQUAL;}
"&&" {return AND;}
"||" {return OR;}
[\t] ;
. ;{return yytext[0];}
%%

int yywrap()
{
	return 1;
}
