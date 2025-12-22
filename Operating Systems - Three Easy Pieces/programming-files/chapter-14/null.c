#include <stdio.h>

int main() {
    int *ptr = NULL;  // Create a pointer to integer, set to NULL
    
    printf("Pointer created and set to NULL\n");
    printf("Pointer value: %p\n", (void*)ptr);
    printf("Now attempting to dereference the NULL pointer...\n");
    
    // This will cause a segmentation fault
    int value = *ptr;  // Dereference NULL pointer - CRASH!
    
    // This line will never be reached
    printf("This line will never be printed: %d\n", value);
    
    return 0;
}
