%{
	#include "y.tab.h"
%}

%%
if {return IF;}
then {return THEN;}
[a-z]+ {return ID;}
[0-9]+ {return NUM;}
\n {return NL;}
[\t]+ ;
. return yytext[0];
%%
int yywrap()
{
	return 1;
}
