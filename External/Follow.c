#include <stdio.h>
#include <string.h>

void calculateFollow(char nonterminal, char followset[]) {

    followset[0] = '\0';

    switch(nonterminal) {

        case 'E':
            strcat(followset, "$ }");
            break;

        case 'X':   // E'
            strcat(followset, "$ , ) }");
            break;

        case 'T':
            strcat(followset, "+ , $ , ) }");
            break;

        case 'Y':   // T'
            strcat(followset, "+ , $ , ) }");
            break;

        case 'F':
            strcat(followset, "* , + , ) , $ }");
            break;
    }
}

int main() {

    char follow[100];

    printf("Output:\n");
    printf("FOLLOW sets for the grammar:\n\n");

    printf("FOLLOW(E) = { ");
    calculateFollow('E', follow);
    printf("%s\n", follow);

    printf("FOLLOW(X) = { ");
    calculateFollow('X', follow);
    printf("%s\n", follow);

    printf("FOLLOW(T) = { ");
    calculateFollow('T', follow);
    printf("%s\n", follow);

    printf("FOLLOW(Y) = { ");
    calculateFollow('Y', follow);
    printf("%s\n", follow);

    printf("FOLLOW(F) = { ");
    calculateFollow('F', follow);
    printf("%s\n", follow);

    return 0;
}
