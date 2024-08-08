#include<stdio.h>
int main() {
    int length;
    printf("Enter length of a string: ");
    scanf("%d",&length);
    char str[length];
    int i,flag='0';
    printf("Enter a string to be checked: ");
    scanf("%s",str);
    for(i=0;str[i]!='0';i++) {
        if(str[i]=='0' || str[i]=='1') {
            flag=1;
        }
        else {
            flag=0;
            break;
        }
    }
    if(flag==1) {
        if(str[length-1]=='1' && str[length-2]=='1') {
            printf("String is accepted!");
        }
        else {
            printf("String is rejected!");
        }
    }
    else{
        printf("String is not accepted");
    }
}
