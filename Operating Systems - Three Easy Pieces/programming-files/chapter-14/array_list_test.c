#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "array_list.h"

// Performance test functions
void test_add_performance(int test_size, int initial_capacity) {
    printf("\n=== TEST: Add %d elements (initial capacity: %d) ===\n", test_size, initial_capacity);
    
    clock_t start = clock();
    ArrayList *list = arraylist_create(initial_capacity);
    clock_t end = clock();
    double create_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    
    start = clock();
    for (int i = 0; i < test_size; i++) {
        arraylist_add(list, i);
    }
    end = clock();
    double add_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    
    double avg_time_per_add = add_time / test_size * 1000;  // microseconds
    
    printf("Create time: %.2f ms\n", create_time);
    printf("Total add time: %.2f ms\n", add_time);
    printf("Average time per add: %.3f μs\n", avg_time_per_add);
    printf("Final size: %zu, Final capacity: %zu\n", 
           arraylist_size(list), arraylist_capacity(list));
    
    arraylist_destroy(list);
}

void test_random_access_performance(int test_size) {
    printf("\n=== TEST: Random Access (size: %d) ===\n", test_size);
    
    ArrayList *list = arraylist_create(10);
    for (int i = 0; i < test_size; i++) {
        arraylist_add(list, i);
    }
    
    // Test sequential access (best case for cache)
    clock_t start = clock();
    int sum = 0;
    for (int i = 0; i < test_size; i++) {
        int value;
        arraylist_get(list, i, &value);
        sum += value;
    }
    clock_t end = clock();
    double sequential_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    
    // Test random access (worst case for cache)
    start = clock();
    sum = 0;
    for (int i = 0; i < 100000; i++) {
        int random_index = rand() % test_size;
        int value;
        arraylist_get(list, random_index, &value);
        sum += value;
    }
    end = clock();
    double random_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    
    printf("Sequential access (all %d elements): %.2f ms\n", test_size, sequential_time);
    printf("Random access (100k operations): %.2f ms\n", random_time);
    printf("Average random access time: %.3f μs\n", random_time / 100 * 1000);
    
    arraylist_destroy(list);
}

void test_resize_pattern(int max_size) {
    printf("\n=== TEST: Resize Pattern Analysis ===\n");
    
    ArrayList *list = arraylist_create(1);
    printf("Starting with capacity: %zu\n", arraylist_capacity(list));
    
    int resize_count = 0;
    size_t previous_capacity = list->capacity;
    
    for (int i = 0; i < max_size; i++) {
        arraylist_add(list, i);
        if (list->capacity != previous_capacity) {
            printf("Resize #%d: %zu -> %zu (after adding %d elements)\n", 
                   ++resize_count, previous_capacity, list->capacity, i + 1);
            previous_capacity = list->capacity;
        }
    }
    
    printf("Total resizes: %d\n", resize_count);
    printf("Final capacity: %zu (theoretical optimal: %d)\n", 
           list->capacity, max_size);
    printf("Memory overhead: %.1f%%\n", 
           (list->capacity - max_size) * 100.0 / max_size);
    
    arraylist_destroy(list);
}

void test_memory_fragmentation() {
    printf("\n=== TEST: Memory Fragmentation ===\n");
    
    // Create and destroy many ArrayLists of different sizes
    const int num_lists = 1000;
    const int max_size = 1000;
    
    clock_t start = clock();
    
    for (int i = 0; i < num_lists; i++) {
        ArrayList *list = arraylist_create(10);
        int size = (rand() % max_size) + 1;
        
        for (int j = 0; j < size; j++) {
            arraylist_add(list, j);
        }
        
        // Do some operations
        for (int j = 0; j < size / 2; j++) {
            int index = rand() % size;
            int value;
            arraylist_get(list, index, &value);
            arraylist_set(list, index, value * 2);
        }
        
        arraylist_destroy(list);
    }
    
    clock_t end = clock();
    double time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    
    printf("Created/destroyed %d lists: %.2f ms\n", num_lists, time);
    printf("Average per list: %.3f ms\n", time / num_lists);
}

void compare_with_fixed_array(int test_size) {
    printf("\n=== COMPARISON: ArrayList vs Fixed Array ===\n");
    
    // Test fixed array
    clock_t start = clock();
    int *fixed_array = (int*)malloc(test_size * sizeof(int));
    for (int i = 0; i < test_size; i++) {
        fixed_array[i] = i;
    }
    clock_t end = clock();
    double fixed_array_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    free(fixed_array);
    
    // Test ArrayList with same initial capacity
    start = clock();
    ArrayList *list = arraylist_create(test_size);
    for (int i = 0; i < test_size; i++) {
        arraylist_add(list, i);
    }
    end = clock();
    double arraylist_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    arraylist_destroy(list);
    
    // Test ArrayList with small initial capacity (forces resizing)
    start = clock();
    list = arraylist_create(10);
    for (int i = 0; i < test_size; i++) {
        arraylist_add(list, i);
    }
    end = clock();
    double arraylist_resize_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    arraylist_destroy(list);
    
    printf("Fixed array (%d elements): %.2f ms\n", test_size, fixed_array_time);
    printf("ArrayList (pre-allocated): %.2f ms (%.1fx slower)\n", 
           arraylist_time, arraylist_time / fixed_array_time);
    printf("ArrayList (with resizing): %.2f ms (%.1fx slower)\n", 
           arraylist_resize_time, arraylist_resize_time / fixed_array_time);
}

void stress_test() {
    printf("\n=== STRESS TEST: Large Dataset ===\n");
    
    const int large_size = 1000000;  // 1 million elements
    printf("Testing with %d elements...\n", large_size);
    
    clock_t start = clock();
    ArrayList *list = arraylist_create(10);
    
    for (int i = 0; i < large_size; i++) {
        arraylist_add(list, i);
    }
    
    clock_t end = clock();
    double add_time = ((double)(end - start)) / CLOCKS_PER_SEC;
    
    // Access test
    start = clock();
    int sum = 0;
    for (int i = 0; i < large_size; i += 100) {  // Sample every 100th element
        int value;
        arraylist_get(list, i, &value);
        sum += value;
    }
    end = clock();
    double access_time = ((double)(end - start)) / CLOCKS_PER_SEC;
    
    printf("Add %d elements: %.2f seconds\n", large_size, add_time);
    printf("Access sampled elements: %.2f seconds\n", access_time);
    printf("Elements per second: %.0f\n", large_size / add_time);
    printf("Memory usage: ~%.2f MB\n", 
           (list->capacity * sizeof(int)) / (1024.0 * 1024.0));
    
    arraylist_destroy(list);
}

int main() {
    srand(time(NULL));  // Seed random number generator
    
    printf("=== ARRAYLIST PERFORMANCE EVALUATION ===\n");
    
    // Run different tests
    test_add_performance(10000, 10);      // 10k adds, small initial capacity
    test_add_performance(10000, 10000);   // 10k adds, pre-allocated
    
    test_random_access_performance(10000);
    
    test_resize_pattern(1000);
    
    compare_with_fixed_array(10000);
    
    test_memory_fragmentation();
    
    // Comment out for quick tests, uncomment for comprehensive testing
    stress_test();
    
    return 0;
}
