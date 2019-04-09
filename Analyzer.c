#include <stdio.h>
#include "Analyzer.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char* tokens[] = {NULL, "PLUS", "MINUS", "MULT", "DIVIDE",
	"MODULO", "EXP", "LPAREN", "RPAREN", "LBRACKET",
	"RBRACKET", "EQUALS", "LTHAN", "GTHAN", "COLON",
	"COMMA", "SCOLON", "PERIOD", "QUOTE", "DQUOTE",
	"NUMBER", "IDENT", "TAGIDENT", "ENDTAGHEAD", "LCOMMENT",
	"RCOMMENT"};

int main(){
	int token = yylex();
	int comment = 0;
	while(token){
		if(token == LCOMMENT){
			comment++;
		}
		else if(token == RCOMMENT){
			comment--;
		}
		else if(comment == 0 && token){
			printf("%s		%s\n",tokens[token],yytext);
		}
		token = yylex();
	}
}