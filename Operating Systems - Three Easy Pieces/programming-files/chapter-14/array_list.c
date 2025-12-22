#include "array_list.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Create a new ArrayList
ArrayList* arraylist_create(size_t initial_capacity) {
    ArrayList *list = (ArrayList*)malloc(sizeof(ArrayList));
    if (!list) {
        return NULL;
    }
    
    list->data = (int*)malloc(initial_capacity * sizeof(int));
    if (!list->data) {
        free(list);
        return NULL;
    }
    
    list->size = 0;
    list->capacity = initial_capacity;
    return list;
}

// Add an element to the ArrayList
int arraylist_add(ArrayList *list, int value) {
    // Check if we need to resize
    if (list->size >= list->capacity) {
        // Double the capacity (common growth strategy)
        size_t new_capacity = list->capacity * 2;
        if (new_capacity == 0) {
            new_capacity = 1;  // Handle initial capacity of 0
        }
        
        // Use realloc to resize the array
        int *new_data = (int*)realloc(list->data, new_capacity * sizeof(int));
        if (!new_data) {
            return 0;  // Allocation failed
        }
        
        list->data = new_data;
        list->capacity = new_capacity;
        //printf("Resized array: capacity = %zu\n", list->capacity);
    }
    
    // Add the new element
    list->data[list->size] = value;
    list->size++;
    return 1;  // Success
}

// Get an element by index
int arraylist_get(ArrayList *list, size_t index, int *value) {
    if (index >= list->size) {
        return 0;  // Return FALSE - operation failed
    }
    
    *value = list->data[index];  // Store the value at the pointer location
    return 1;  // Return TRUE - operation succeeded
}

// Set an element at a specific index
int arraylist_set(ArrayList *list, size_t index, int value) {
    if (index >= list->size) {
        return 0;  // Index out of bounds
    }
    
    list->data[index] = value;
    return 1;  // Success
}

// Remove an element at a specific index
int arraylist_remove(ArrayList *list, size_t index) {
    if (index >= list->size) {
        return 0;  // Index out of bounds
    }
    
    // Shift elements to fill the gap
    for (size_t i = index; i < list->size - 1; i++) {
        list->data[i] = list->data[i + 1];
    }
    
    list->size--;
    
    if (list->size < list->capacity / 4 && list->capacity > 4) {
        size_t new_capacity = list->capacity / 2;
        int *new_data = (int*)realloc(list->data, new_capacity * sizeof(int));
        if (new_data) {
            list->data = new_data;
            list->capacity = new_capacity;
            //printf("Shrunk array: capacity = %zu\n", list->capacity);
        }
    }
    
    return 1;  // Success
}

// Get the current size of the ArrayList
size_t arraylist_size(ArrayList *list) {
    return list->size;
}

// Get the current capacity of the ArrayList
size_t arraylist_capacity(ArrayList *list) {
    return list->capacity;
}

// Free the ArrayList and all its resources
void arraylist_destroy(ArrayList *list) {
    if (list) {
        free(list->data);       
        free(list);
    }
}

// Print the ArrayList contents
void arraylist_print(ArrayList *list) {
    printf("ArrayList (size=%zu, capacity=%zu): [", list->size, list->capacity);
    for (size_t i = 0; i < list->size; i++) {
        printf("%d", list->data[i]);
        if (i < list->size - 1) {
            printf(", ");
        }
    }
    printf("]\n");
}

// Example usage
int main_() { // rename to just main when testing it
    // Create an ArrayList with initial capacity of 2
    ArrayList *list = arraylist_create(2);
    if (!list) {
        printf("Failed to create ArrayList\n");
        return 1;
    }
    
    printf("Created ArrayList with initial capacity %zu\n\n", arraylist_capacity(list));
    
    // Add elements (this will trigger realloc when needed)
    printf("Adding 10 elements:\n");
    for (int i = 1; i <= 10; i++) {
        arraylist_add(list, i * 10);
        printf("Added %d: ", i * 10);
        arraylist_print(list);
    }
    printf("\n");
    
    // Get an element
    int value;
    if (arraylist_get(list, 3, &value)) {
        printf("Element at index 3: %d\n", value);
    }
    
    // Set an element
    arraylist_set(list, 3, 999);
    printf("After setting index 3 to 999: ");
    arraylist_print(list);
    
    // Remove some elements
    printf("\nRemoving elements at indices 2, 4, and 6:\n");
    arraylist_remove(list, 2);
    arraylist_print(list);
    arraylist_remove(list, 4);  // Note: indices shift after removal
    arraylist_print(list);
    arraylist_remove(list, 6);  // Note: indices shift again
    arraylist_print(list);
    
    // Try to access out of bounds
    if (!arraylist_get(list, 100, &value)) {
        printf("\nCorrectly failed to get element at index 100 (out of bounds)\n");
    }
    
    // Clean up
    arraylist_destroy(list);
    
    return 0;
}
