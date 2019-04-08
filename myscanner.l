%{
#include "myscanner.h"
%}
%option nounput yylineno

%%
+			return PLUS;
-			return MINUS;
*			return MULT;
/			return DIVIDE;
%			return MODULO;
**			return EXP;
(			return LPAREN;
)			return RPAREN;
[			return LBRACKET;
]			return RBRACKET;
=			return EQUALS;
<			return LTHAN;
>			return GTHAN;
:			return COLON;
,			return COMMA;
;			return SCOLON;
.			return PERIOD;
'			return QUOTE;
"			return DQUOTE;

NUMBER	examples:  0 123 5.5  2.35 0.88888 1e20 2.2E-5
IDENT	[any sequence of letters]  examples:  table  description  value  th
TAGIDENT	[letter sequence immediately preceded by <]  examples:  <table  <th
EOF		end-of-file token

%%

int yywrap(void)
{
	return 1;
}

