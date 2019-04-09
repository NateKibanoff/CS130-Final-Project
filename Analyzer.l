%{
#include "Analyzer.h"
//[-+]?[0-9]+[.]?[0-9]+([eE][-+]?[0-9]+)? 		return NUMBER;
%}
%option nounput yylineno

%%
"<!--".*"-->"									;
"<!--"											return LCOMMENT;
.*"-->"											return RCOMMENT;
[0-9]+("."[0-9]+)?([eE][-]?[0-9]+)?				return NUMBER;
[0-9]+^"."										return ERROR;
[0-9]+"."[^0-9]?								return ERROR;
[0-9]+("."[0-9]+)?^([eE][-]?[0-9]+)?			return ERROR;
[0-9]+("."[0-9]+)?([eE]^[-]?[0-9]+)?			return ERROR;
[0-9]+("."[0-9]+)?([eE][-]?[^0-9]?)				return ERROR;
"+"												return PLUS;
"-"												return MINUS;
"**"											return EXP;
"*"												return MULT;
"/"												return DIVIDE;
"%"												return MODULO;
"("												return LPAREN;
")"												return RPAREN;
"["												return LBRACKET;
"]"												return RBRACKET;
"="												return EQUALS;
"</"											return ENDTAGHEAD;
"<"[a-zA-Z]+									return TAGIDENT;
"<"												return LTHAN;
">"												return GTHAN;
":"												return COLON;
","												return COMMA;
";"												return SCOLON;
"."												return PERIOD;
"'"												return QUOTE;
"\""											return DQUOTE;
[a-zA-Z]+										return IDENT;
[ \t\r\n]										;
.												return ERROR;

%%

int yywrap(void)
{
	return 1;
}

