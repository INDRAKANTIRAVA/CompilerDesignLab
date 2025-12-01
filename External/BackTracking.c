#include <stdio.h>
#include <string.h>

char input[100];
int pos = 0;
int match(char c) {
    if (input[pos] == c) {
        pos++;
        return 1;
    }
    return 0;
}
int A() {
    int b = pos;
    
    if (match('a') && match('b'))
        return 1;
    
    pos = b;
    if (match('a'))
        return 1;
    
    pos = b;
    return 0;
}
int C() {
    return match('c');
}
int S() {
    int b = pos;
    
    if (C() && A() && match('d') && match('#'))
        return 1;

    pos = b;
    return 0;
}

int main() {
    printf("Enter input string: ");
    scanf("%s", input);
    if (S() && input[pos] == '\0')
        printf("Accepted\n");
    else
        printf("Rejected\n");

    return 0;
}
