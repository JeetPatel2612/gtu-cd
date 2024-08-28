#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define MAX 10

void findFirst(char, int, int);
void addToResultSet(char);
int numOfProductions;
char productionSet[MAX][MAX];
char firstSet[MAX];

int main() {
    int i, choice;
    char c, ch;
    printf("Enter the number of productions: ");
    scanf("%d", &numOfProductions); 
    printf("Enter the productions (e.g., E=TR):\n");
    for (i = 0; i < numOfProductions; i++) {
        scanf("%s", productionSet[i]);
    }
    do {
        printf("Enter the symbol to find First set: ");
        scanf(" %c", &c);
        findFirst(c, 0, 0);
        printf("First(%c) = { ",c);
        for (i = 0; firstSet[i] != '\0'; i++) {
            printf("%c ", firstSet[i]);
        }
        printf("}\n");
        
        firstSet[0] = '\0';
        printf("Do you want to find another First set? (1 for Yes / 0 for No): ");
        scanf("%d", &choice);
    } while(choice == 1);   
    return 0;
}

void findFirst(char c, int q1, int q2) {
    int j;
    if (!(isupper(c))) {
        addToResultSet(c);
    }
    for (j = 0; j < numOfProductions; j++) {
        if (productionSet[j][0] == c) {
            if (productionSet[j][2] == '$') {
                if (productionSet[q1][q2] == '\0') {
                    addToResultSet('$');
                } else if (productionSet[q1][q2] != '\0' && (q1 != 0 || q2 != 0)) {
                    findFirst(productionSet[q1][q2], q1, (q2 + 1));
                } else {
                    addToResultSet('$');
                }
            } else if (!isupper(productionSet[j][2])) {
                addToResultSet(productionSet[j][2]);
            } else {
                findFirst(productionSet[j][2], j, 3);
            }
        }
    }
}

void addToResultSet(char c) {
    int i;
    for (i = 0; firstSet[i] != '\0'; i++) {
        if (firstSet[i] == c) {
            return;
        }
    }
    firstSet[i] = c;
    firstSet[i + 1] = '\0';
}
