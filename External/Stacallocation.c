
#include <stdio.h>
#include <string.h>
#define MAX 10

struct Frame {
    char func[30], ret[10];
    int vars;
} stack[MAX];

int top = -1;

void push() {
    if (top == MAX - 1) {
        printf("Stack Overflow!\n");
        return;
    }
    top++;
    printf("Enter Function Name: ");
    scanf("%s", stack[top].func);

    printf("Enter Local Vars: ");
    scanf("%d", &stack[top].vars);

    printf("Enter Return Addr: ");
    scanf("%s", stack[top].ret);

    printf(">> %s pushed.\n", stack[top].func);
}

void pop() {
    if (top == -1) {
        printf("Stack Underflow!\n");
        return;
    }
    printf("<< %s popped.\n", stack[top].func);
    top--;
}

void display() {
    if (top == -1) {
        printf("Stack Empty.\n");
        return;
    }
    printf("\n--- Stack (Top → Bottom) ---\n");
    for (int i = top; i >= 0; i--) {
        printf("Func: %s | Vars: %d | Ret: %s\n",
               stack[i].func, stack[i].vars, stack[i].ret);
    }
}

int main() {
    int ch;
    printf("=== Stack Allocation Simulation ===\n");

    while (1) {
        printf("\n1. Push\n2. Pop\n3. Display\n4. Exit\nEnter choice: ");
        scanf("%d", &ch);

        switch (ch) {
            case 1: push(); break;
            case 2: pop(); break;
            case 3: display(); break;
            case 4: return 0;
            default: printf("Invalid choice!\n");
        }
    }
}
