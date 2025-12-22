#include <stdio.h>
#include <stdlib.h>

int main() {
     // Allocate memory that will never be freed
    int *leaked_memory = (int*) 1024;
    
    if (leaked_memory == NULL) {
        printf("Memory allocation failed!\n");
        return 1;
    }
    
    return 0;      // Memory leak - no way to free it now
}
