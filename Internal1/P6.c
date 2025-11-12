#include<stdio.h>
#include<string.h>
char input[100];
int pos=0;
int match(char c)
{
    return input[pos]==c?pos++,1:0;
}
int A()
{
    int b=pos;
    if(match('a')&&match('b'))
        return 1;
    pos=b;
    if(match('a'))
        return 1;
    pos=b;
    return 0;
}

int C()
{
    return match('c');
}
int S()
{
    int b=pos;
    if(C()&&A()&&match('d'))
        if(match('#'))
            return 1;
    pos=b;
    return 0;
}
int main()
{
    printf("Enter Grammar : \n");
    scanf("%s",input);
    if(S()&&input[pos]=='\0')
        printf("Entered Grammar is Accpeted");
    else {
        printf("Entered Grammar is Rejected");
    }
}
