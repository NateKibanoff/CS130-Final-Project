#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char* tokens[] = {NULL, "PLUS", "MINUS", "MULT", "DIVIDE", "MODULO", "EXP", "LPAREN", "RPAREN", "LBRACKET", "RBRACKET", "EQUALS", "LTHAN", "GTHAN", "COLON", "COMMA", "SCOLON", "PERIOD", "QUOTE", "DQUOTE", "NUMBER", "IDENT", "TAGIDENT", "ENDTAGHEAD"};

int main(){
	int token=yylex();
	while(token){
		//cout<<tokens[token]<<"		"<<yytext<<endl;
		printf("%s		%s\n",tokens[token],yytext);
		token=yylex();
	}
}