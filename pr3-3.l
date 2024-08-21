%{
#include<stdio.h>
int sl=0,ml=0,c;
%}
 
%%
[/]{1}[/]{1}[a-zA-Z0-9_ ]* {sl++;} printf("Single line comment %d",sl);
[/]{1}[*]{1}[a-zA-Z0-9_ ]*[*]{1}[/]{1} {ml++;} printf("Multipleline comment%d",ml);
 
%%
 
int yywrap(void){return 1;}
int main()
{
yylex();
return 0;
}
