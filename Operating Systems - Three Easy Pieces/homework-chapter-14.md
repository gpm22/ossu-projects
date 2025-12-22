# 14 - Interlude: Memory API

## Homework (Code)

In this homework, you will gain some familiarity with memory allocation. First, you’ll write some buggy programs (fun!). Then, you’ll use some tools to help you find the bugs you inserted. Then, you will realize how awesome these tools are and use them in the future, thus making yourself more happy and productive. The tools are the debugger (e.g., `gdb`) and a memory-bug detector called `valgrind` [SN05].

### Questions

1. **First, write a simple program called `null.c` that creates a pointer to an integer, sets it to `NULL`, and then tries to dereference it. Compile this into an executable called `null`. **

  ```c
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
  ```

  **What happens when you run this program?**
  `Segmentation fault (core dumped)`.

2. **Next, compile this program with symbol information included (with the `-g` flag). Doing so let’s put more information into the executable, enabling the debugger to access more useful information about variable names and the like.**

  Result from compiling with `g`:

  ```bash
  /usr/bin/ld: cannot use executable file 'null' as input to a link
  collect2: error: ld returned 1 exit status
  ```

  **Run the program under the debugger by typing `gdb null` and then, once `gdb` is running, typing `run`. What does `gdb` show you?**

  ```bash
  Starting program: /ossu-projects/Operating Systems - Three Easy Pieces/programming-files/chapter-14/null 
  Downloading separate debug info for system-supplied DSO at 0x7ffff7fc3000
  [Thread debugging using libthread_db enabled]                                   
  Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
  Pointer created and set to NULL
  Pointer value: (nil)
  Now attempting to dereference the NULL pointer...
  
  Program received signal SIGSEGV, Segmentation fault.
  0x00005555555551ba in main ()
  
  ```

  

3. **Finally, use the `valgrind` tool on this program. We’ll use `memcheck` that is a part of `valgrind` to analyze what happens. Run this by typing in the following: `valgrind --leak-check=yes null`.**
  **What happens when you run this?**

  ```bash
  ==21894== Command: ./null
  ==21894== 
  Pointer created and set to NULL
  Pointer value: (nil)
  Now attempting to dereference the NULL pointer...
  ==21894== Invalid read of size 4
  ==21894==    at 0x1091BA: main (in /ossu-projects/Operating Systems - Three Easy Pieces/programming-files/chapter-14/null)
  ==21894==  Address 0x0 is not stack'd, malloc'd or (recently) free'd
  ==21894== 
  ==21894== 
  ==21894== Process terminating with default action of signal 11 (SIGSEGV)
  ==21894==  Access not within mapped region at address 0x0
  ==21894==    at 0x1091BA: main (in /ossu-projects/Operating Systems - Three Easy Pieces/programming-files/chapter-14/null)
  ==21894==  If you believe this happened as a result of a stack
  ==21894==  overflow in your program's main thread (unlikely but
  ==21894==  possible), you can try to increase the size of the
  ==21894==  main thread stack using the --main-stacksize= flag.
  ==21894==  The main thread stack size used in this run was 8388608.
  ==21894== 
  ==21894== HEAP SUMMARY:
  ==21894==     in use at exit: 1,024 bytes in 1 blocks
  ==21894==   total heap usage: 1 allocs, 0 frees, 1,024 bytes allocated
  ==21894== 
  ==21894== LEAK SUMMARY:
  ==21894==    definitely lost: 0 bytes in 0 blocks
  ==21894==    indirectly lost: 0 bytes in 0 blocks
  ==21894==      possibly lost: 0 bytes in 0 blocks
  ==21894==    still reachable: 1,024 bytes in 1 blocks
  ==21894==         suppressed: 0 bytes in 0 blocks
  ==21894== Reachable blocks (those to which a pointer was found) are not shown.
  ==21894== To see them, rerun with: --leak-check=full --show-leak-kinds=all
  ==21894== 
  ==21894== For lists of detected and suppressed errors, rerun with: -s
  ==21894== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
  Segmentation fault (core dumped)
  
  ```

  **Can you interpret the output from the tool?**

  It shows that we tried to read from the memory address `0x0`, which represents `NULL`.

4. **Write a simple program that allocates memory using `malloc()` but forgets to free it before exiting.**

  ```c
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
  ```

  **What happens when this program runs?**

  Executes perfectly.

  **Can you use `gdb` to find any problems with it?**

  ```bash
  Starting program: ossu-projects/Operating Systems - Three Easy Pieces/programming-files/chapter-14/not_freed 
  Downloading separate debug info for system-supplied DSO at 0x7ffff7fc3000
  [Thread debugging using libthread_db enabled]                              
  Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
  [Inferior 1 (process 23670) exited normally]
  (gdb) 
  
  ```

  No, it shows nothing.
  **How about `valgrind` (again with the `--leak-check=yes` flag)?**

  ```bash
  ==23730== Command: ./not_freed
  ==23730== 
  ==23730== 
  ==23730== HEAP SUMMARY:
  ==23730==     in use at exit: 0 bytes in 0 blocks
  ==23730==   total heap usage: 0 allocs, 0 frees, 0 bytes allocated
  ==23730== 
  ==23730== All heap blocks were freed -- no leaks are possible
  ==23730== 
  ==23730== For lists of detected and suppressed errors, rerun with: -s
  ==23730== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
  
  ```

  Also no, this program seems too simple to even bother the analyzers.

5. **Write a program that creates an array of integers called data of size 100 using `malloc`; then, set `data[100]` to zero.**

  ```c
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
  ```

  **What happens when you run this program?**

  Runs without problems.
  **What happens when you run this program using `valgrind`?**

  ```bash
  ==24222== Command: ./out_of_bound
  ==24222== 
  Array of 100 integers allocated successfully.
  Now attempting to set out bound data[100] to zero...
  ==24222== Invalid write of size 4
  ==24222==    at 0x109208: main (out_of_bound.c:16)
  ==24222==  Address 0x4a8c1d0 is 0 bytes after a block of size 400 alloc'd
  ==24222==    at 0x4846828: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
  ==24222==    by 0x1091BE: main (out_of_bound.c:6)
  ==24222== 
  ==24222== Invalid read of size 4
  ==24222==    at 0x109218: main (out_of_bound.c:18)
  ==24222==  Address 0x4a8c1d0 is 0 bytes after a block of size 400 alloc'd
  ==24222==    at 0x4846828: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
  ==24222==    by 0x1091BE: main (out_of_bound.c:6)
  ==24222== 
  data[100] = 0 (but this memory doesn't belong to our array!)
  ==24222== 
  ==24222== HEAP SUMMARY:
  ==24222==     in use at exit: 0 bytes in 0 blocks
  ==24222==   total heap usage: 2 allocs, 2 frees, 1,424 bytes allocated
  ==24222== 
  ==24222== All heap blocks were freed -- no leaks are possible
  ==24222== 
  ==24222== For lists of detected and suppressed errors, rerun with: -s
  ==24222== ERROR SUMMARY: 2 errors from 2 contexts (suppressed: 0 from 0)
  ```

  It shows that we are setting a value right after the allocated block at line 16.
  It also shows that we are reading from a block not allocated at line 18.

  **Is the program correct?**
  No, as it set a data at a position after the allocated one.

6. **Create a program that allocates an array of integers (as above), frees them, and then tries to print the value of one of the elements of the array.**

  ```c
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
  ```

  **Does the program run?**

  It runs and shows the correct value!
  **What happens when you use `valgrind` on it?**

  ```bash
  ==24548== Command: ./freed_too_soon
  ==24548== 
  Array of 100 integers allocated successfully.
  Values set correctly.
  ==24548== Invalid read of size 4
  ==24548==    at 0x10924B: main (freed_too_soon.c:23)
  ==24548==  Address 0x4a8c06c is 44 bytes inside a block of size 400 free'd
  ==24548==    at 0x484988F: free (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
  ==24548==    by 0x109242: main (freed_too_soon.c:21)
  ==24548==  Block was alloc'd at
  ==24548==    at 0x4846828: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
  ==24548==    by 0x1091BE: main (freed_too_soon.c:6)
  ==24548== 
  data[11] = 110 (but this memory was already cleaned!)
  ==24548== 
  ==24548== HEAP SUMMARY:
  ==24548==     in use at exit: 0 bytes in 0 blocks
  ==24548==   total heap usage: 2 allocs, 2 frees, 1,424 bytes allocated
  ==24548== 
  ==24548== All heap blocks were freed -- no leaks are possible
  ==24548== 
  ==24548== For lists of detected and suppressed errors, rerun with: -s
  ==24548== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
  
  ```

  It shows that we are reading a freed value at line 23, which was allocated at line 6 and freed at line 21.

7. **Now pass a funny value to free (e.g., a pointer in the middle of the array you allocated above).**

  ```c
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
      
      void *funnyValue = &data[11]; // or an random value like (void*) 12121
      
      free(funnyValue);
  
  	printf("Freed value at %p", funnyValue);
      
      printf("data[11] = %d (but this memory was already cleaned!)\n", data[11]);
      
      return 0;
  }
  ```

  **What happens?**

  It compiled, but showed the following warnings:

  ```bash
  wrongly_freed.c: In function ‘main’:
  wrongly_freed.c:21:5: warning: ‘free’ called on pointer ‘data’ with nonzero offset 44 [-Wfree-nonheap-object]
     21 |     free(&data[11]);
        |     ^~~~~~~~~~~~~~~
  wrongly_freed.c:6:23: note: returned from ‘malloc’
      6 |     int *data = (int*)malloc(100 * sizeof(int));
        |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
  
  ----------------------------------------------------------------------------------------
  
  wrongly_freed.c: In function ‘main’:
  wrongly_freed.c:23:5: warning: ‘free’ called on a pointer to an unallocated object ‘12121’ [-Wfree-nonheap-object]
     23 |     free(funnyValue);
        |     ^~~~~~~~~~~~~~~~
  wrongly_freed.c:21:11: note: assigned here
     21 |     void *funnyValue = (void*) 12121;// &data[11]; // or an random value like (void*) 12121
  
  ```

  When running it failed:

  ```bash
  Array of 100 integers allocated successfully.
  Values set correctly.
  munmap_chunk(): invalid pointer
  Aborted (core dumped)
  ----------------------------------------------------------------------------------------
  Array of 100 integers allocated successfully.
  Values set correctly.
  Segmentation fault (core dumped)
  ```

  **Do you need tools to find this type of problem?**
  Not this specifically one.

8. **Try out some of the other interfaces to memory allocation. For example, create a simple vector-like data structure and related routines that use `realloc()` to manage the vector. Use an array to store the vectors elements; when a user adds an entry to the vector, use `realloc()` to allocate more space for it. How well does such a vector perform? How does it compare to a linked list? Use `valgrind` to help you find bugs.**

  #### Java `ArrayList` C version

  ##### `array_list.c`

  ```c
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
  ```

  ##### `array_list.h`

  ```c
  // array_list.h
  #ifndef ARRAYLIST_H
  #define ARRAYLIST_H
  
  #include <stdlib.h>
  
  typedef struct {
      int *data;
      size_t size;
      size_t capacity;
  } ArrayList;
  
  ArrayList* arraylist_create(size_t initial_capacity);
  int arraylist_add(ArrayList *list, int value);
  int arraylist_get(ArrayList *list, size_t index, int *value);
  int arraylist_set(ArrayList *list, size_t index, int value);
  int arraylist_remove(ArrayList *list, size_t index);
  size_t arraylist_size(ArrayList *list);
  size_t arraylist_capacity(ArrayList *list);
  void arraylist_destroy(ArrayList *list);
  void arraylist_print(ArrayList *list);
  
  #endif
  ```

  

  #### Performance

  ```c
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
  ```

  ##### Result

  ```bash
  === ARRAYLIST PERFORMANCE EVALUATION ===
  
  === TEST: Add 10000 elements (initial capacity: 10) ===
  Create time: 0.00 ms
  Total add time: 0.33 ms
  Average time per add: 0.033 μs
  Final size: 10000, Final capacity: 10240
  
  === TEST: Add 10000 elements (initial capacity: 10000) ===
  Create time: 0.00 ms
  Total add time: 0.21 ms
  Average time per add: 0.022 μs
  Final size: 10000, Final capacity: 10000
  
  === TEST: Random Access (size: 10000) ===
  Sequential access (all 10000 elements): 0.23 ms
  Random access (100k operations): 8.46 ms
  Average random access time: 84.620 μs
  
  === TEST: Resize Pattern Analysis ===
  Starting with capacity: 1
  Resize #1: 1 -> 2 (after adding 2 elements)
  Resize #2: 2 -> 4 (after adding 3 elements)
  Resize #3: 4 -> 8 (after adding 5 elements)
  Resize #4: 8 -> 16 (after adding 9 elements)
  Resize #5: 16 -> 32 (after adding 17 elements)
  Resize #6: 32 -> 64 (after adding 33 elements)
  Resize #7: 64 -> 128 (after adding 65 elements)
  Resize #8: 128 -> 256 (after adding 129 elements)
  Resize #9: 256 -> 512 (after adding 257 elements)
  Resize #10: 512 -> 1024 (after adding 513 elements)
  Total resizes: 10
  Final capacity: 1024 (theoretical optimal: 1000)
  Memory overhead: 2.4%
  
  === COMPARISON: ArrayList vs Fixed Array ===
  Fixed array (10000 elements): 0.07 ms
  ArrayList (pre-allocated): 0.23 ms (3.4x slower)
  ArrayList (with resizing): 0.22 ms (3.2x slower)
  
  === TEST: Memory Fragmentation ===
  Created/destroyed 1000 lists: 35.19 ms
  Average per list: 0.035 ms
  
  === STRESS TEST: Large Dataset ===
  Testing with 1000000 elements...
  Add 1000000 elements: 0.02 seconds
  Access sampled elements: 0.00 seconds
  Elements per second: 40368158
  Memory usage: ~5.00 MB
  ```

  - Fairly good

  #### Comparison with LinkedList

  ##### `linked_list.h`

  ```c
  #ifndef LINKEDLIST_H
  #define LINKEDLIST_H
  
  #include <stdlib.h>
  
  typedef struct Node {
      int data;
      struct Node *next;
  } Node;
  
  typedef struct {
      Node *head;
      Node *tail;
      size_t size;
  } LinkedList;
  
  LinkedList* linkedlist_create();
  int linkedlist_add(LinkedList *list, int value);
  int linkedlist_get(LinkedList *list, size_t index, int *value);
  int linkedlist_set(LinkedList *list, size_t index, int value);
  int linkedlist_remove(LinkedList *list, size_t index);
  size_t linkedlist_size(LinkedList *list);
  void linkedlist_destroy(LinkedList *list);
  void linkedlist_print(LinkedList *list);
  
  #endif
  ```

  ##### `linked_list.c`

  ```c
  #include "linkedlist.h"
  #include <stdio.h>
  
  LinkedList* linkedlist_create() {
      LinkedList *list = malloc(sizeof(LinkedList));
      if (!list) return NULL;
      
      list->head = NULL;
      list->tail = NULL;
      list->size = 0;
      return list;
  }
  
  int linkedlist_add(LinkedList *list, int value) {
      Node *new_node = malloc(sizeof(Node));
      if (!new_node) return 0;
      
      new_node->data = value;
      new_node->next = NULL;
      
      if (list->size == 0) {
          list->head = new_node;
          list->tail = new_node;
      } else {
          list->tail->next = new_node;
          list->tail = new_node;
      }
      
      list->size++;
      return 1;
  }
  
  int linkedlist_get(LinkedList *list, size_t index, int *value) {
      if (index >= list->size) return 0;
      
      Node *current = list->head;
      for (size_t i = 0; i < index; i++) {
          current = current->next;
      }
      
      *value = current->data;
      return 1;
  }
  
  int linkedlist_set(LinkedList *list, size_t index, int value) {
      if (index >= list->size) return 0;
      
      Node *current = list->head;
      for (size_t i = 0; i < index; i++) {
          current = current->next;
      }
      
      current->data = value;
      return 1;
  }
  
  int linkedlist_remove(LinkedList *list, size_t index) {
      if (index >= list->size) return 0;
      
      Node *to_delete;
      
      if (index == 0) {
          // Remove head
          to_delete = list->head;
          list->head = list->head->next;
          if (list->size == 1) {
              list->tail = NULL;
          }
      } else {
          // Find node before the one to delete
          Node *prev = list->head;
          for (size_t i = 0; i < index - 1; i++) {
              prev = prev->next;
          }
          
          to_delete = prev->next;
          prev->next = to_delete->next;
          
          if (index == list->size - 1) {
              list->tail = prev;
          }
      }
      
      free(to_delete);
      list->size--;
      return 1;
  }
  
  size_t linkedlist_size(LinkedList *list) {
      return list->size;
  }
  
  void linkedlist_destroy(LinkedList *list) {
      Node *current = list->head;
      while (current) {
          Node *next = current->next;
          free(current);
          current = next;
      }
      free(list);
  }
  
  void linkedlist_print(LinkedList *list) {
      printf("[");
      Node *current = list->head;
      while (current) {
          printf("%d", current->data);
          if (current->next) printf(", ");
          current = current->next;
      }
      printf("]\n");
  }
  ```

  ##### `comparison_lists.c`

  ```c
  #include <stdio.h>
  #include <stdlib.h>
  #include <time.h>
  #include <math.h>
  #include "arraylist.h"
  #include "linkedlist.h"
  
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
  ```

  ##### Results

  ```bash
  === ARRAYLIST vs LINKEDLIST COMPARISON ===
  
  === ADD PERFORMANCE (adding 10000 elements) ===
  ArrayList:  0.22 ms (46082949 ops/sec)
  LinkedList: 1.15 ms (8695652 ops/sec)
  ArrayList is 5.3x FASTER
  
  === RANDOM ACCESS (10000 accesses in list of 10000) ===
  ArrayList:  0.66 ms (0.1 μs/access)
  LinkedList: 327.52 ms (32.8 μs/access)
  ArrayList is 497.8x FASTER for random access
  
  === SEQUENTIAL ACCESS (10000 elements) ===
  ArrayList:  0.04 ms
  LinkedList: 213.54 ms
  ArrayList is 5475.4x FASTER for sequential access
  
  === MEMORY USAGE (10000 elements) ===
  ArrayList memory:  40984 bytes (4.10 bytes/element)
  LinkedList memory: 160024 bytes (16.00 bytes/element)
  LinkedList uses 3.9x MORE memory
  
  === CACHE PERFORMANCE (10000 elements) ===
  With good cache locality (stride=1):
    ArrayList:  6.95 ms
    LinkedList: 26323.82 ms
    ArrayList is 3786.0x FASTER due to cache
  
  ```

  `ArrayList` beat the shit out of `LinkedList` ): 

