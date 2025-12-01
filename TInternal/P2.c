#include <stdio.h>
#include <string.h>
#include<stdlib.h>
#include<string.h>

char input[100];
int i = 0;

void error();
int S();
int L();
int Lprime();

int main() {
    printf("Enter input string:\n");
    scanf("%s", input);

    if (S() && input[i] == '\0')
        printf("Successfully parsed\n");
    else
        printf("Invalid parse\n");

    return 0;
}

void match(char c) {
    if (input[i] == c) {
        i++;
    } else {
        error();
    }
}

void error() {
    printf("Invalid parse\n");
    exit(0);
}

int S() {
    if (input[i] == '(') {
        match('(');
        L();
        match(')');
        return 1;
    }
    else if (input[i] == 'a') {
        match('a');
        return 1;
    }
    else {
        error();
    }
    return 0;
}

int L() {
    S();        // L → S L'
    Lprime();
    return 1;
}

int Lprime() {
    if (input[i] == ',') {
        match(',');
        S();
        Lprime();   // recursive
    }
    else {
        // epsilon production
        return 1;
    }
    return 1;
}
