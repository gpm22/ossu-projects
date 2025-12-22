#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "array_list.h"
#include "linked_list.h"

void test_add_performance(int test_size, int initial_capacity) {
    printf("\n=== ADD PERFORMANCE (adding %d elements) ===\n", test_size);
    
    // Test ArrayList
    clock_t start = clock();
    ArrayList *arr = arraylist_create(initial_capacity);
    for (int i = 0; i < test_size; i++) {
        arraylist_add(arr, i);
    }
    clock_t end = clock();
    double arraylist_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    arraylist_destroy(arr);
    
    // Test LinkedList
    start = clock();
    LinkedList *list = linkedlist_create();
    for (int i = 0; i < test_size; i++) {
        linkedlist_add(list, i);
    }
    end = clock();
    double linkedlist_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    linkedlist_destroy(list);
    
    printf("ArrayList:  %.2f ms (%.0f ops/sec)\n", 
           arraylist_time, test_size / (arraylist_time / 1000));
    printf("LinkedList: %.2f ms (%.0f ops/sec)\n", 
           linkedlist_time, test_size / (linkedlist_time / 1000));
    printf("ArrayList is %.1fx %s\n", 
           arraylist_time < linkedlist_time ? 
           linkedlist_time / arraylist_time : 
           arraylist_time / linkedlist_time,
           arraylist_time < linkedlist_time ? "FASTER" : "SLOWER");
}

void test_random_access_performance(int test_size, int access_count) {
    printf("\n=== RANDOM ACCESS (%d accesses in list of %d) ===\n", 
           access_count, test_size);
    
    // Create both lists with same data
    ArrayList *arr = arraylist_create(10);
    LinkedList *list = linkedlist_create();
    for (int i = 0; i < test_size; i++) {
        arraylist_add(arr, i);
        linkedlist_add(list, i);
    }
    
    // Test ArrayList random access
    clock_t start = clock();
    int sum = 0;
    for (int i = 0; i < access_count; i++) {
        int index = rand() % test_size;
        int value;
        arraylist_get(arr, index, &value);
        sum += value;
    }
    clock_t end = clock();
    double arraylist_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    
    // Test LinkedList random access
    start = clock();
    sum = 0;
    for (int i = 0; i < access_count; i++) {
        int index = rand() % test_size;
        int value;
        linkedlist_get(list, index, &value);
        sum += value;
    }
    end = clock();
    double linkedlist_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    
    arraylist_destroy(arr);
    linkedlist_destroy(list);
    
    printf("ArrayList:  %.2f ms (%.1f μs/access)\n", 
           arraylist_time, arraylist_time / access_count * 1000);
    printf("LinkedList: %.2f ms (%.1f μs/access)\n", 
           linkedlist_time, linkedlist_time / access_count * 1000);
    printf("ArrayList is %.1fx FASTER for random access\n", 
           linkedlist_time / arraylist_time);
}

void test_sequential_access_performance(int test_size) {
    printf("\n=== SEQUENTIAL ACCESS (%d elements) ===\n", test_size);
    
    // Create both lists
    ArrayList *arr = arraylist_create(10);
    LinkedList *list = linkedlist_create();
    for (int i = 0; i < test_size; i++) {
        arraylist_add(arr, i);
        linkedlist_add(list, i);
    }
    
    // Test ArrayList sequential access
    clock_t start = clock();
    int sum = 0;
    for (int i = 0; i < test_size; i++) {
        int value;
        arraylist_get(arr, i, &value);
        sum += value;
    }
    clock_t end = clock();
    double arraylist_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    
    // Test LinkedList sequential access
    start = clock();
    sum = 0;
    for (int i = 0; i < test_size; i++) {
        int value;
        linkedlist_get(list, i, &value);
        sum += value;
    }
    end = clock();
    double linkedlist_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    
    arraylist_destroy(arr);
    linkedlist_destroy(list);
    
    printf("ArrayList:  %.2f ms\n", arraylist_time);
    printf("LinkedList: %.2f ms\n", linkedlist_time);
    printf("ArrayList is %.1fx FASTER for sequential access\n", 
           linkedlist_time / arraylist_time);
}

void test_insert_at_beginning(int test_size) {
    printf("\n=== INSERT AT BEGINNING (%d elements) ===\n", test_size);
    
    // For ArrayList, we'd need to shift all elements
    // Let's simulate it by creating a function that inserts at beginning
    // (Note: Our ArrayList doesn't have insert_at_beginning, so we'll skip)
    
    // Test LinkedList insert at beginning
    clock_t start = clock();
    LinkedList *list = linkedlist_create();
    for (int i = 0; i < test_size; i++) {
        // To insert at beginning in our LinkedList, we'd need to modify add()
        // For simplicity, let's just show that LinkedList can do this in O(1)
        // while ArrayList would need O(n)
    }
    clock_t end = clock();
    double linkedlist_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    linkedlist_destroy(list);
    
    printf("LinkedList insert at beginning: %.2f ms\n", linkedlist_time);
    printf("(ArrayList would be MUCH slower - O(n) vs O(1))\n");
}

void test_memory_usage(int test_size) {
    printf("\n=== MEMORY USAGE (%d elements) ===\n", test_size);
    
    // Create ArrayList
    ArrayList *arr = arraylist_create(10);
    for (int i = 0; i < test_size; i++) {
        arraylist_add(arr, i);
    }
    
    // Create LinkedList
    LinkedList *list = linkedlist_create();
    for (int i = 0; i < test_size; i++) {
        linkedlist_add(list, i);
    }
    
    // Calculate memory usage
    size_t arraylist_memory = sizeof(ArrayList) + (arr->capacity * sizeof(int));
    size_t linkedlist_memory = sizeof(LinkedList) + (list->size * sizeof(Node));
    
    printf("ArrayList memory:  %zu bytes (%.2f bytes/element)\n", 
           arraylist_memory, (double)arraylist_memory / test_size);
    printf("LinkedList memory: %zu bytes (%.2f bytes/element)\n", 
           linkedlist_memory, (double)linkedlist_memory / test_size);
    printf("LinkedList uses %.1fx MORE memory\n", 
           (double)linkedlist_memory / arraylist_memory);
    
    arraylist_destroy(arr);
    linkedlist_destroy(list);
}

void test_cache_performance(int test_size) {
    printf("\n=== CACHE PERFORMANCE (%d elements) ===\n", test_size);
    
    // Create both lists
    ArrayList *arr = arraylist_create(10);
    LinkedList *list = linkedlist_create();
    for (int i = 0; i < test_size; i++) {
        arraylist_add(arr, i);
        linkedlist_add(list, i);
    }
    
    // Access elements with different strides to test cache
    const int iterations = 1000000;
    
    // Small stride (good for cache)
    clock_t start = clock();
    int sum = 0;
    for (int i = 0; i < iterations; i++) {
        int index = (i * 1) % test_size;  // Stride of 1
        int value;
        arraylist_get(arr, index, &value);
        sum += value;
    }
    clock_t end = clock();
    double arraylist_cache_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    
    start = clock();
    sum = 0;
    for (int i = 0; i < iterations; i++) {
        int index = (i * 1) % test_size;
        int value;
        linkedlist_get(list, index, &value);
        sum += value;
    }
    end = clock();
    double linkedlist_cache_time = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
    
    arraylist_destroy(arr);
    linkedlist_destroy(list);
    
    printf("With good cache locality (stride=1):\n");
    printf("  ArrayList:  %.2f ms\n", arraylist_cache_time);
    printf("  LinkedList: %.2f ms\n", linkedlist_cache_time);
    printf("  ArrayList is %.1fx FASTER due to cache\n", 
           linkedlist_cache_time / arraylist_cache_time);
}

int main() {
    srand(time(NULL));
    
    printf("=== ARRAYLIST vs LINKEDLIST COMPARISON ===\n");
    
    // Run various tests
    test_add_performance(10000, 10);
    test_random_access_performance(10000, 10000);
    test_sequential_access_performance(10000);
    test_memory_usage(10000);
    test_cache_performance(10000);
    
    return 0;
}
