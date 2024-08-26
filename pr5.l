#include <stdio.h>
#include <stdlib.h>

// Global variables
char *input;
char currentChar;

// Function prototypes
void E();
void EPrime();
void T();
void TPrime();
void F();
void advance();
void error();

void advance() {
    currentChar = *input++;
}

void error() {
    printf("Error: Invalid string.\n");
    exit(1);
}

// E -> T E'
void E() {
    printf("E -> T E'\n");
    T();
    EPrime();
}

// E' -> + T E' | ε
void EPrime() {
    if (currentChar == '+') {
        printf("E' -> + T E'\n");
        advance();
        T();
        EPrime();
    } else {
        printf("E' -> ε\n");
    }
}

// T -> F T'
void T() {
    printf("T -> F T'\n");
    F();
    TPrime();
}

// T' -> * F T' | ε
void TPrime() {
    if (currentChar == '*') {
        printf("T' -> * F T'\n");
        advance();
        F();
        TPrime();
    } else {
        printf("T' -> ε\n");
    }
}

// F -> ( E ) | i
void F() {
    if (currentChar == 'i') {
        printf("F -> i\n");
        advance();
    } else if (currentChar == '(') {
        printf("F -> ( E )\n");
        advance();
        E();
        if (currentChar == ')') {
            advance();
        } else {
            error();
        }
    } else {
        error();
    }
}

int main() {
    // Input string
    input = "i+i$";
    advance();
    E();
    if (currentChar == '$') {
        printf("String is successfully parsed\n");
    } else {
        error();
    }
    return 0;
}
