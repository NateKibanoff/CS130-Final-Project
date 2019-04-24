#include <stdio.h>
#include <string.h>
#include "Analyzer.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char* tokens[] = {NULL, "PLUS", "MINUS", "MULT", "DIVIDE",
	"MODULO", "EXP", "LPAREN", "RPAREN", "LBRACKET",
	"RBRACKET", "EQUALS", "LTHAN", "GTHAN", "COLON",
	"COMMA", "SCOLON", "PERIOD", "QUOTE", "DQUOTE",
	"NUMBER", "IDENT", "TAGIDENT", "ENDTAGHEAD", "LCOMMENT",
	"RCOMMENT", "EOF"};

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
			if(token == ERROR){
				printf("***lexical error: illegal character (%s)\n",yytext);
			}
			else if(token == NUMERROR){
				printf("***lexical error: badly formed number\n");
				printf("NUMBER");
				for(int i=5;i>0;i--) printf(" ");
				for(int i=0;i<strlen(yytext);i++) {
					//printf("%s\n",yytext);
					if(i < strlen(yytext) - 1 || yytext[i] != ' ') printf("%c",yytext[i]);
				}
				printf("\n");
			}
			else{
				printf(tokens[token]);
				for(int i=11;i>strlen(tokens[token]);i--) printf(" ");
				for(int i=0;i<strlen(yytext);i++) {
					//printf("%s\n",yytext);
					if(i < strlen(yytext) - 1 || yytext[i] != ' ') printf("%c",yytext[i]);
				}
				printf("\n");
			}
		}
		else if(comment < 0 && token){
			comment ++;
			printf("MINUS      -\nMINUS      -\nGTHAN      >\n");
			if(token == ERROR){
				printf("***lexical error: illegal character (%s)\n",yytext);
			}
			else if(token == NUMERROR){
				printf("***lexical error: badly formed number\n");
				printf("NUMBER");
				for(int i=5;i>0;i--) printf(" ");
				for(int i=0;i<strlen(yytext);i++) {
					//printf("%s\n",yytext);
					if(i < strlen(yytext) - 1 || yytext[i] != ' ') printf("%c",yytext[i]);
				}
				printf("\n");
			}
			else{
				printf(tokens[token]);
				for(int i=11;i>strlen(tokens[token]);i--) printf(" ");
				for(int i=0;i<strlen(yytext);i++) {
					//printf("%s\n",yytext);
					if(i < strlen(yytext) - 1 || yytext[i] != ' ') printf("%c",yytext[i]);
				}
				printf("\n");
			}
		}
		token = yylex();
	}
	if(comment > 0) printf("***lexical error: un-expected end of file\n");
}