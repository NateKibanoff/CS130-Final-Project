%{
#include "myscanner.h"
%}
%option nounput yylineno

%%
+												return PLUS;
-												return MINUS;
*												return MULT;
/												return DIVIDE;
%												return MODULO;
**												return EXP;
(												return LPAREN;
)												return RPAREN;
[												return LBRACKET;
]												return RBRACKET;
=												return EQUALS;
</												return ENDTAGHEAD;
<[^>]*												return TAGIDENT;
<												return LTHAN;
>												return GTHAN;
:												return COLON;
,												return COMMA;
;												return SCOLON;
.												return PERIOD;
'												return QUOTE;
"												return DQUOTE;
[-+]?[0-9]+[.]?[0-9]+([eE][-+]?[0-9]+)? 							return NUMBER;
[a-zA-Z]*											return IDENT;

%%

int yywrap(void)
{
	return 1;
}

