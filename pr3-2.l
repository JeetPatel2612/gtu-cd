%{
#include <stdio.h>
#include <stdlib.h>

void encrypt(char *text, int shift);
%}

%option noyywrap

%%
[a-zA-Z]+ {
    encrypt(yytext, 3); // Shift by 3 positions for Caesar cipher
}
.|\n {
    putchar(yytext[0]);
}
%%

void encrypt(char *text, int shift) {
    while (*text) {
        char c = *text;
        if (c >= 'a' && c <= 'z') {
            c = 'a' + (c - 'a' + shift) % 26;
        } else if (c >= 'A' && c <= 'Z') {
            c = 'A' + (c - 'A' + shift) % 26;
        }
        putchar(c);
        text++;
    }
}

int main() {
    yylex();
    return 0;
}
