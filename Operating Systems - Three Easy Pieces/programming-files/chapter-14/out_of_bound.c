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
    printf("Now attempting to set out bound data[100] to zero...\n");
    
    data[100] = 0;  // WRONG! This writes past the end of the array
    
    printf("data[100] = %d (but this memory doesn't belong to our array!)\n", data[100]);
    // Free the allocated memory
    free(data);
    
    return 0;
}
