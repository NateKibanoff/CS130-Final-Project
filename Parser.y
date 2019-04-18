%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
%}

%union {char* tkn;}	/* Yacc definitions */
%start table
%token table_open
%token table_close
%token row_open
%token row_close
%token header_open
%token header_close
%token data_open
%token data_close
%token text
%type <tkn> table table_rows contents

%%

/* descriptions of expected inputs     corresponding actions (in C) */
		
table		: table_open table_rows table_close			{printf("Got table\n");}
			;

table_rows	: row_open contents row_close				{printf("Got table row\n");}
			| row_open contents row_close table_rows	{printf("Got table rows\n");}
			;

contents	: header_open text header_close				{printf("Got table header\n");}
			| data_open text data_close					{printf("Got table data\n",text);}
			| header_open text header_close contents	{printf("Got table headers\n");}
			| data_open text data_close contents		{printf("Got more table data\n");}
			;

%%                     /* C code */

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}

int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 

