%{
#include "Parser.tab.h"
void yyerror (char *s);
int yylex();
%}
%%
"<table>"				{return table_open;}
"</table>"				{return table_close;}
"<tr>"					{return row_open;}
"</tr>"					{return row_close;}
"<th>"					{return header_open;}
"</th>"					{return header_close;}
"<td>"					{return data_open;}
"</td>"					{return data_close;}
[-+]?[0-9]+("."[0-9]+)? {yylval.num = atoi(yytext); return number;}
[a-zA-Z0-9]+			{return text;}
[+-=\*\.\[\]]+			{return text;}
[ \t\r\n]				;
.						{ECHO; yyerror("unexpected character");}
%%
int yywrap (void) {return 1;}

