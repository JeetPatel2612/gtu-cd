%{
#include<stdio.h>
%}
%%
"hi" {printf("bye");}
.* {printf("Wrong Input");}
%%
void main()
{
printf("Enter IP:");
yylex();
}

