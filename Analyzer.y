%{
#include "Analyzer.h"
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
%}

%token TAGIDENT
%token GTHAN
%token IDENT
%token NUMBER
%token ENDTAGHEAD

%%
start: opening '\n'		{printf("\nComplete");exit(1);}
	;

opening: TAGIDENT GTHAN opening
	| contains
	;
	
contains: IDENT closing		{printf("%d ",$1);}
		| NUMBER closing	{printf("%d ",$1);}
		;

closing: ENDTAGHEAD IDENT GTHAN opening
		| ENDTAGHEAD IDENT GTHAN closing
		| ENDTAGHEAD IDENT GTHAN
		;
%%

int main()
{
  yyparse();
  return 1;
}

