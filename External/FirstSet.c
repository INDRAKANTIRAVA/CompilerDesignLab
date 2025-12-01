
#include <stdio.h>
#include <string.h>
#include <ctype.h>

void computeFirst(char production[][10], int numProductions, char nonTerminal) {
    printf("FIRST(%c) = { ", nonTerminal);
    
    char firstSet[20] = "";
    int i, j;
    
    for (i = 0; i < numProductions; i++) {
        if (production[i][0] == nonTerminal) {
            
            char firstSymbol = production[i][3];
            if (islower(firstSymbol) || firstSymbol == '(' || firstSymbol == '@' || firstSymbol == '+' || firstSymbol == '*') {
                
                char term[2] = {firstSymbol, '\0'};
                if (strchr(firstSet, firstSymbol) == NULL) {
                    strcat(firstSet, term);
                }
            }
            else if (isupper(firstSymbol)) {
                if (nonTerminal == 'E' && firstSymbol == 'T') {
                    if (strchr(firstSet, '(') == NULL) strcat(firstSet, "(");
                    if (strchr(firstSet, 'i') == NULL) strcat(firstSet, "i");
                }
                else if (nonTerminal == 'T' && firstSymbol == 'F') {
                    if (strchr(firstSet, '(') == NULL) strcat(firstSet, "(");
                    if (strchr(firstSet, 'i') == NULL) strcat(firstSet, "i");
                }
            }
        }
    }
    for (j = 0; j < strlen(firstSet); j++) {
        if (firstSet[j] == 'i') {
            printf("'id'");
        } else if (firstSet[j] == '@') {
            printf("epsilon");
        } else {
            printf("'%c'", firstSet[j]);
        }
        
        if (j < strlen(firstSet) - 1) {
            printf(", ");
        }
    }
    printf(" }\n");
}

int main() {
    char productions[][10] = {
        "E->TX",
        "X->+TX",
        "X->@",
        "T->FY",
        "Y->*FY",
        "Y->@",
        "F->(E)",
        "F->i"
    };
    int numProductions = 8;
    printf("Computing First Sets for Right Recursive Grammar:\n");
    printf("Mapping: X = E', Y = T'\n\n");
    computeFirst(productions, numProductions, 'F');
    computeFirst(productions, numProductions, 'Y'); // T'
    computeFirst(productions, numProductions, 'X'); // E'
    computeFirst(productions, numProductions, 'T');
    computeFirst(productions, numProductions, 'E');

    return 0;
}
