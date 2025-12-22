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
    
    void *funnyValue = (void*) 12121;// &data[11]; // or an random value like (void*) 12121
    
    free(funnyValue);

	printf("Freed value at %p", funnyValue);
    
    printf("data[11] = %d (but this memory was already cleaned!)\n", data[11]);
    
    return 0;
}
