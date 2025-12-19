# 13 - The Abstraction: Address Spaces

## Homework (Code)

In this homework, we’ll just learn about a few useful tools to examine virtual memory usage on Linux-based systems. This will only be a brief hint at what is possible; you’ll have to dive deeper on your own to truly become an expert (as always!).

### Questions

1. **Create a little program that uses a certain amount of memory, called `memory-user.c`. This program should take one command-line argument: the number of megabytes of memory it will use. When run, it should allocate an array, and constantly stream through the array, touching each entry. The program should do this indefinitely, or, perhaps, for a certain amount of time also specified at the command line.**

  ```c
  #include <stdio.h>
  #include <stdlib.h>
  #include <unistd.h>
  
  int main(int argc, char *argv[]) {
      if (argc != 2) {
          fprintf(stderr, "Usage: %s <megabytes>\n", argv[0]);
          return 1;
      }
      
      printf("Process pid: %s", getpid());
      
      long mb = atol(argv[1]);
      
      if (mb < 1) {
          fprintf(stderr, "Please provide a positive number of megabytes\n");
          return 1;
      }    
      
      size_t sz = mb * 1024 * 1024;
      char *mem = malloc(sz);
      
      if (!mem) {
          fprintf(stderr, "Failed to allocate %ld MB\n", mb);
          return 1;
      }
      
      printf("Using %ld MB, streaming continuously...\n", mb);
      
      while (1) {
          for (size_t i = 0; i < sz; i++) {
              mem[i] = mem[i] + 1;
          }
          
          usleep(100); // to free some CPU
      }
      
      free(mem);
      return 0;
  }
  ```

  

2. **Now, while running your memory-user program, also (in a different terminal window, but on the same machine) run the `free` tool. **
  **How do the memory usage totals change when your program is running?**

  It does not changes directly to the given amount, but after some time it does so.

  Example:
  ```bash
  # Before
  prompt > free -hm
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       4,1Gi       8,8Gi       775Mi       7,2Gi        15Gi
  Swap:           19Gi          0B        19Gi
  
  # run program to consume 1 Gi
  ./memory-user 1024
  
  # During
  prompt > free -hm
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       5,0Gi       8,0Gi       778Mi       7,3Gi        14Gi
  Swap:           19Gi          0B        19Gi
  
  # During
  prompt > free -hm
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       5,0Gi       8,0Gi       778Mi       7,3Gi        14Gi
  Swap:           19Gi          0B        19Gi
  
  # After
  prompt > free -hm
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       4,1Gi       8,9Gi       793Mi       7,3Gi        15Gi
  Swap:           19Gi          0B        19Gi
  ```

  

  **How about when you kill the memory-user program?**

  As shown by the previous example, it gives back the meory.
  **Do the numbers match your expectations?**

  Yes.
  **Try this for different amounts of memory usage.**

  ```bash
  ## 100 Mb
  # Before
                 total        used        free      shared  buff/cache   available
  Mem:           19742        2200       11253         374        7022       17541
  Swap:          20479           0       20479
  
  # During
                 total        used        free      shared  buff/cache   available
  Mem:           19742        2302       11151         378        7026       17440
  Swap:          20479           0       20479
  
  # After
                 total        used        free      shared  buff/cache   available
  Mem:           19742        2216       11237         374        7023       17525
  Swap:          20479           0       20479
  
  ## 300 Mb
  # Before
                 total        used        free      shared  buff/cache   available
  Mem:           19742        2208       11245         378        7026       17533
  Swap:          20479           0       20479
  
  # During
                 total        used        free      shared  buff/cache   available
  Mem:           19742        2525       10927         372        7020       17216
  Swap:          20479           0       20479
  
  # After
                 total        used        free      shared  buff/cache   available
  Mem:           19742        2205       11247         370        7018       17536
  Swap:          20479           0       20479
  
  ## 500 Mb
  # Before
                 total        used        free      shared  buff/cache   available
  Mem:           19742        2205       11248         384        7033       17536
  Swap:          20479           0       20479
  
  # During
  
                 total        used        free      shared  buff/cache   available
  Mem:           19742        2716       10737         384        7033       17026
  Swap:          20479           0       20479
  
  # After
                 total        used        free      shared  buff/cache   available
  Mem:           19742        2239       11214         385        7034       17502
  Swap:          20479           0       20479
  
  ## 2 Gb
  # Before
                total        used        free      shared  buff/cache   available
  Mem:           19742        2239       11214         385        7034       17502
  Swap:          20479           0       20479
  
  # During
                 total        used        free      shared  buff/cache   available
  Mem:           19742        3373       10080         383        7032       16368
  Swap:          20479           0       20479
  
                 total        used        free      shared  buff/cache   available
  Mem:           19742        4305        9148         391        7040       15436
  Swap:          20479           0       20479
  
  # After
                 total        used        free      shared  buff/cache   available
  Mem:           19742        2215       11236         386        7036       17526
  Swap:          20479           0       20479
  
  ```

  

  **What happens when you use really large amounts of memory?**

  ```bash
  ## 8GB
  # Before
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       2,2Gi        10Gi       374Mi       6,9Gi        17Gi
  Swap:           19Gi          0B        19Gi
  
  # During
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       4,9Gi       8,3Gi       365Mi       6,9Gi        14Gi
  Swap:           19Gi          0B        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       6,3Gi       6,9Gi       384Mi       6,9Gi        13Gi
  Swap:           19Gi          0B        19Gi
  
                total        used        free      shared  buff/cache   available
  Mem:            19Gi       7,7Gi       5,4Gi       379Mi       6,9Gi        11Gi
  Swap:           19Gi          0B        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       9,0Gi       4,1Gi       388Mi       6,9Gi        10Gi
  Swap:           19Gi          0B        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        10Gi       2,9Gi       388Mi       6,9Gi       9,1Gi
  Swap:           19Gi          0B        19Gi
  
  # After
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       2,2Gi        10Gi       375Mi       6,9Gi        17Gi
  Swap:           19Gi          0B        19Gi
  
  ## 16 GB
  # Before
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       2,1Gi        10Gi       371Mi       6,9Gi        17Gi
  Swap:           19Gi          0B        19Gi
  
  # During
                total        used        free      shared  buff/cache   available
  Mem:            19Gi       3,1Gi        10Gi       377Mi       6,9Gi        16Gi
  Swap:           19Gi          0B        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       4,4Gi       8,7Gi       388Mi       6,9Gi        14Gi
  Swap:           19Gi          0B        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       6,4Gi       6,8Gi       392Mi       6,9Gi        12Gi
  Swap:           19Gi          0B        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       9,0Gi       4,1Gi       397Mi       6,9Gi        10Gi
  Swap:           19Gi          0B        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        10Gi       2,9Gi       397Mi       6,9Gi       9,0Gi
  Swap:           19Gi          0B        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        11Gi       1,6Gi       397Mi       6,9Gi       7,8Gi
  Swap:           19Gi          0B        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        12Gi       291Mi       394Mi       6,9Gi       6,4Gi
  Swap:           19Gi          0B        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        14Gi       238Mi       374Mi       5,6Gi       5,1Gi
  Swap:           19Gi       256Ki        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        15Gi       183Mi       390Mi       4,0Gi       3,4Gi
  Swap:           19Gi       256Ki        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        17Gi       269Mi       397Mi       2,4Gi       1,9Gi
  Swap:           19Gi       768Ki        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        18Gi       230Mi       389Mi       1,6Gi       1,1Gi
  Swap:           19Gi       4,8Mi        19Gi
  
  # After
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       2,1Gi        16Gi       368Mi       1,6Gi        17Gi
  Swap:           19Gi       5,2Mi        19Gi
  
  
  ## 32 GB
  # Before
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       2,1Gi        16Gi       368Mi       1,6Gi        17Gi
  Swap:           19Gi       5,2Mi        19Gi
  
  # During
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       4,4Gi        14Gi       392Mi       1,6Gi        14Gi
  Swap:           19Gi       5,2Mi        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       5,6Gi        12Gi       388Mi       1,6Gi        13Gi
  Swap:           19Gi       5,2Mi        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       7,3Gi        11Gi       375Mi       1,6Gi        11Gi
  Swap:           19Gi       5,2Mi        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       8,6Gi       9,8Gi       380Mi       1,6Gi        10Gi
  Swap:           19Gi       5,2Mi        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        10Gi       8,4Gi       383Mi       1,6Gi       9,2Gi
  Swap:           19Gi       5,2Mi        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        11Gi       6,9Gi       380Mi       1,6Gi       7,7Gi
  Swap:           19Gi       5,2Mi        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        14Gi       3,7Gi       379Mi       1,6Gi       4,6Gi
  Swap:           19Gi       5,2Mi        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        15Gi       2,5Gi       387Mi       1,6Gi       3,4Gi
  Swap:           19Gi       5,2Mi        19Gi
  
                total        used        free      shared  buff/cache   available
  Mem:            19Gi        17Gi       916Mi       385Mi       1,6Gi       1,8Gi
  Swap:           19Gi       5,2Mi        19Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        18Gi       179Mi       343Mi       944Mi       426Mi
  Swap:           19Gi       338Mi        19Gi
  
  # it is freezing
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        19Gi       232Mi       225Mi       582Mi       238Mi
  Swap:           19Gi       2,2Gi        17Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        18Gi       292Mi       238Mi       603Mi       286Mi
  Swap:           19Gi       4,2Gi        15Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        19Gi       196Mi       196Mi       588Mi       232Mi
  Swap:           19Gi       8,7Gi        11Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        19Gi       151Mi       216Mi       595Mi       179Mi
  Swap:           19Gi        10Gi         9Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        19Gi       167Mi       229Mi       613Mi       200Mi
  Swap:           19Gi        11Gi       8,2Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        19Gi       240Mi       202Mi       586Mi       273Mi
  Swap:           19Gi        12Gi       7,9Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        19Gi       221Mi       227Mi       615Mi       256Mi
  Swap:           19Gi        14Gi       5,6Gi
  
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi        18Gi       249Mi       231Mi       623Mi       287Mi
  Swap:           19Gi        15Gi       4,8Gi
  
  # After
                 total        used        free      shared  buff/cache   available
  Mem:            19Gi       1,3Gi        17Gi       206Mi       594Mi        17Gi
  Swap:           19Gi       847Mi        19Gi
  
  ```

  It goes increasing the memory usage until it consumes everything, then goes do the same with the swap until it has everything.

  But it always keeps some small amount free around ~200 Mi.

3. **Let’s try one more tool, known as `pmap`. Spend some time, and read the `pmap` manual page in detail.**
  **To use `pmap`, you have to know the process ID of the process you’re interested in. Thus, first run `ps auxw` to see a list of all processes; then, pick an interesting one, such as a browser. You can also use your memory-user program in this case (indeed, you can even have that program call `getpid()` and print out its PID for your convenience).**

4. **Now run `pmap` on some of these processes, using various flags (like `-X`) to reveal many details about the process. What do you see? How many different entities make up a modern address space, as opposed to our simple conception of code/stack/heap?**

5. **Finally, let’s run `pmap` on your memory-user program, with different amounts of used memory. What do you see here? Does the output from `pmap` match your expectations?**
