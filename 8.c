#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_INSTRUCTIONS 100
#define MAX_VAR_LENGTH 10

typedef struct {
    char op[3];      
    char arg1[MAX_VAR_LENGTH]; 
    char arg2[MAX_VAR_LENGTH]; 
    char result[MAX_VAR_LENGTH]; 
} TACInstruction;

TACInstruction tac[MAX_INSTRUCTIONS];
int tac_count = 0;

void addTACInstruction(const char* op, const char* arg1, const char* arg2, const char* result) {
    strcpy(tac[tac_count].op, op);
    strcpy(tac[tac_count].arg1, arg1);
    strcpy(tac[tac_count].arg2, arg2);
    strcpy(tac[tac_count].result, result);
    tac_count++;
}

void generateAssembly() {
    printf("\nAssembly Instructions:\n");
    for (int i = 0; i < tac_count; i++) {
        TACInstruction instruction = tac[i];
        if (strcmp(instruction.op, "+") == 0) {
            printf("MOV %s, R0\n", instruction.arg1); 
            printf("ADD R0, %s\n", instruction.arg2); 
            printf("MOV R0, %s\n", instruction.result); 
        } else if (strcmp(instruction.op, "-") == 0) {
            printf("MOV %s, R0\n", instruction.arg1);
            printf("SUB R0, %s\n", instruction.arg2);
            printf("MOV R0, %s\n", instruction.result);
        } else if (strcmp(instruction.op, "*") == 0) {
            printf("MOV %s, R0\n", instruction.arg1);
            printf("MUL R0, %s\n", instruction.arg2);
            printf("MOV R0, %s\n", instruction.result);
        } else if (strcmp(instruction.op, "/") == 0) {
            printf("MOV %s, R0\n", instruction.arg1);
            printf("DIV R0, %s\n", instruction.arg2);
            printf("MOV R0, %s\n", instruction.result);
        } else {
            printf("Unknown operation: %s\n", instruction.op);
        }
    }
}

int main() {
    char op[3], arg1[MAX_VAR_LENGTH], arg2[MAX_VAR_LENGTH], result[MAX_VAR_LENGTH];
    char continueInput;

    do {
        printf("Enter operation (+, -, *, /): ");
        scanf("%s", op);
        printf("Enter first argument: ");
        scanf("%s", arg1);
        printf("Enter second argument: ");
        scanf("%s", arg2);
        printf("Enter result variable: ");
        scanf("%s", result);

        addTACInstruction(op, arg1, arg2, result);

        printf("Do you want to add another instruction? (y/n): ");
        scanf(" %c", &continueInput); 
    } while (continueInput == 'y' || continueInput == 'Y');

    generateAssembly();

    return 0;
}