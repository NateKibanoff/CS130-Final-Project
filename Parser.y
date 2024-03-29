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
int first;
void updateSymbolVal(char symbol, int val);
double evaluate(char* expression);
double multiply(char* factor);
char* brackets(char* txt);
%}

%union {char* tkn; float num;}	/* Yacc definitions */
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
%token number
%token <tkn> equation
%type <tkn> table table_rows contents data
%type <num> exp term

%%

/* descriptions of expected inputs     corresponding actions (in C) */
		
table		: table_open table_rows table_close			{;}
			;

table_rows	: row_open contents row_close				{;}
			| row_open contents row_close table_rows	{;}
			;

contents	: header_open data header_close				{;}
			| data_open data data_close					{;}
			| header_open data header_close contents	{printf("\n"); first = 0;}
			| data_open data data_close contents		{printf("\n"); first = 0;}
			;

data		: exp			                  			{;}
			| equation									{if(first++) printf(","); printf("%.2f", evaluate(yytext));}
			| text 										{if(first++) printf(","); printf("%s", brackets(yytext));}
			| data text									{printf(" %s", brackets(yytext));}
			;
			
exp    		: term                  					{$$ = $1;}
			;
			
term   		: number                					{if(first++) printf(","); printf("%s", yytext);}
			;

%%                     /* C code */

double multiply(char* factor){
	double result;
	char* temp = strtok(factor,"*");
	result = atof(temp);
	temp = strtok(NULL,"*");
	while(temp){
		result *= atof(temp);
		temp = strtok(NULL,"*");
	}
	return result;
}

double evaluate(char* expression){
	char* ops = strchr(expression, '+');
	char* factor = strtok(expression,"=+-");
	int started=0,idx = 0;
	double result;
	while(factor){
		if(strchr(factor,'*')){
			char* temp = malloc(strlen(expression));
			strcpy(temp, factor);
			if(started++==0) result = multiply(temp);
			else result += multiply(temp);
		}
		else if(started++==0) result = atof(factor);
		else result += atof(factor);
		factor = strtok(NULL,"+");
	}
	return result;
}

char* brackets(char* txt){
	if(txt[0] == '[' && txt[strlen(txt) - 1] == ']'){
		char* result = malloc(strlen(txt) - 2);
		strncpy(result, txt + 1, strlen(txt) - 2);
		result[strlen(txt)-2]='\0';
		return result;
	}
	return txt;
}

int main (void) {
	/* init symbol table */
	first = 0;
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}
	return yyparse();
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 

