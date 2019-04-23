%{
#include "Analyzer.h"
//[-+]?[0-9]+[.]?[0-9]+([eE][-+]?[0-9]+)? 		return NUMBER;
//[0-9]+("."[0-9]+)?[^eE\t\r\n]					return NUMERROR;
//[0-9]+[^"."\t\r\n]								return NUMERROR;
%}
%option nounput yylineno

%%
[ \t\r\n]										;
"<!--".*"-->"									;
"<!--"											return LCOMMENT;
.*"-->"											return RCOMMENT;
[-+]?[0-9]+("."[0-9]+)?([eE][-+]?[0-9]+)?[" "]? return NUMBER;

[0-9]+("."[^0-9\t\r\n])							return NUMERROR;
	
[0-9]+("."[0-9]+)?[eE][^-0-9]					return NUMERROR;
[0-9]+("."[0-9]+)?[eE][-]?[^0-9\t\r\n]			return NUMERROR;
[0-9]+("."[0-9]+)?[eE][-]?[0-9]+[^0-9\t\r\n]	return NUMERROR;
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
.												return ERROR;

%%

int yywrap(void)
{
	return 1;
}

