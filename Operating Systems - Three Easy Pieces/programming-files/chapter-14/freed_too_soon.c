#include <stdio.h>
#include <stdlib.h>

int main() {
    // Allocate array of 100 integers
    int *data = (int*)malloc(100 * sizeof(int));
    
    if (data == NULL) {
        printf("Memory allocation failed!\n");
        return 1;
    }
    
    printf("Array of 100 integers allocated successfully.\n");

    for (int i = 0; i < 100; i++) {
        data[i] = i * 10;
    }

    printf("Values set correctly.\n");
    
    free(data);
    
    printf("data[11] = %d (but this memory was already cleaned!)\n", data[11]);
    
    return 0;
}
