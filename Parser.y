%{
void yyerror (char *s);
int yylex();
char* yytext;
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
%type <tkn> table table_rows contents data

%%

/* descriptions of expected inputs     corresponding actions (in C) */
		
table		: table_open table_rows table_close			{;}
			;

table_rows	: row_open contents row_close				{;}
			| row_open contents row_close table_rows	{;}
			;

contents	: header_open data header_close				{;}
			| data_open data data_close					{;}
			| header_open data header_close contents	{printf("\n");}
			| data_open data data_close contents		{printf("\n");}
			;

data		: text	{printf("%s,", yytext);}
			;

%%                     /* C code */
 
// int computeSymbolIndex(char token)
// {
	// int idx = -1;
	// if(islower(token)) {
		// idx = token - 'a' + 26;
	// } else if(isupper(token)) {
		// idx = token - 'A';
	// }
	// return idx;
// } 

// /* returns the value of a given symbol */
// int symbolVal(char symbol)
// {
	// int bucket = computeSymbolIndex(symbol);
	// return symbols[bucket];
// }

// /* updates the value of a given symbol */
// void updateSymbolVal(char symbol, int val)
// {
	// int bucket = computeSymbolIndex(symbol);
	// symbols[bucket] = val;
// } 


int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}
	return yyparse();
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 

