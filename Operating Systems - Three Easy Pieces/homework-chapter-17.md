# 17 - Free-Space Management

## Homework (Simulation)

The program, `malloc.py`, lets you explore the behavior of a simple free-space allocator as described in the chapter. See the README for details of its basic operation.

### Questions

1. **First run with the flags `-n 10 -H 0 -p BEST -s 0` to generate a few random allocations and frees.**

  ```bash
  seed 0
  size 100
  baseAddr 1000
  headerSize 0
  alignment -1
  policy BEST
  listOrder ADDRSORT
  coalesce False
  numOps 10
  range 10
  percentAlloc 50
  allocList 
  compute False
  
  ptr[0] = Alloc(3) returned ?
  List? 
  
  Free(ptr[0])
  returned ?
  List? 
  
  ptr[1] = Alloc(5) returned ?
  List? 
  
  Free(ptr[1])
  returned ?
  List? 
  
  ptr[2] = Alloc(8) returned ?
  List? 
  
  Free(ptr[2])
  returned ?
  List? 
  
  ptr[3] = Alloc(8) returned ?
  List? 
  
  Free(ptr[3])
  returned ?
  List? 
  
  ptr[4] = Alloc(2) returned ?
  List? 
  
  ptr[5] = Alloc(7) returned ?
  List? 
  
  ```

  **Can you predict what `alloc()/free()` will return? Can you guess the state of the free list after each request?**

  ```bash
  ptr[0] = Alloc(3) returned 1000
  Free List [ Size 1 ]:  [ addr:1003 sz:97 ]
  
  Free(ptr[0])
  returned 0
  Free List [ Size 2 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:97 ]
  
  ptr[1] = Alloc(5) returned 1003
  Free List [ Size 2 ]:  [ addr:1000 sz:3 ] [ addr:1008 sz:92 ]
  
  Free(ptr[1])
  returned 0
  Free List [ Size 3 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:92 ]
  
  ptr[2] = Alloc(8) returned 1008
  Free List [ Size 3 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1016 sz:84 ]
  
  Free(ptr[2])
  returned 0
  Free List [ Size 4 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:8 ] [ addr:1016 sz:84 ]
  
  ptr[3] = Alloc(8) returned 1008
  Free List [ Size 3 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1016 sz:84 ]
  
  Free(ptr[3])
  returned 0
  Free List [ Size 4 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:8 ] [ addr:1016 sz:84 ]
  
  ptr[4] = Alloc(2) returned 1000
  Free List [ Size 4 ]:  [ addr:1002 sz:1 ] [ addr:1003 sz:5 ] [ addr:1008 sz:8 ] [ addr:1016 sz:84 ] 
  
  ptr[5] = Alloc(7) returned 1008
  Free List [ Size 4 ]:  [ addr:1002 sz:1 ] [ addr:1003 sz:5 ] [ addr:1015 sz:1 ] [ addr:1016 sz:84 ] 
  ```

  **What do you notice about the free list over time?**
  It becomes fragmented.
2. **How are the results different when using a `WORST` fit policy to search the free list (`-p WORST`)?**

  ```bash
  seed 0
  size 100
  baseAddr 1000
  headerSize 0
  alignment -1
  policy WORST
  listOrder ADDRSORT
  coalesce False
  numOps 10
  range 10
  percentAlloc 50
  allocList 
  compute False
  
  ptr[0] = Alloc(3) returned 1000
  Free List [ Size 1 ]:  [ addr:1003 sz:97 ]
  
  Free(ptr[0])
  returned 0
  Free List [ Size 2 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:97 ]
  
  ptr[1] = Alloc(5) returned 1003
  Free List [ Size 2 ]:  [ addr:1000 sz:3 ] [ addr:1008 sz:92 ]
  
  Free(ptr[1])
  returned 0
  Free List [ Size 3 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:92 ]
  
  ptr[2] = Alloc(8) returned 1008
  Free List [ Size 3 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1016 sz:84 ]
  
  Free(ptr[2])
  returned 0
  Free List [ Size 4 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:8 ] [ addr:1016 sz:84 ]
  
  ptr[3] = Alloc(8) returned 1016
  Free List [ Size 4 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:8 ] [ addr:1024 sz:76 ]
  
  Free(ptr[3])
  returned 0
  Free List [ Size 5 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:8 ] [ addr:1016 sz:8 ] [ addr:1024 sz:76 ]
  
  ptr[4] = Alloc(2) returned 1024
  Free List [ Size 5 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:8 ] [ addr:1016 sz:8 ] [ addr:1026 sz:74 ]
  
  ptr[5] = Alloc(7) returned 1026
  Free List [ Size 5 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:8 ] [ addr:1016 sz:8 ] [ addr:1033 sz:67 ]
  
  ```

  **What changes?**
  It becomes even more fragmented, as it does not reuse any memory chunk.
3. **What about when using `FIRST` fit (`-p FIRST`)?**

  ```bash
  seed 0
  size 100
  baseAddr 1000
  headerSize 0
  alignment -1
  policy FIRST
  listOrder ADDRSORT
  coalesce False
  numOps 10
  range 10
  percentAlloc 50
  allocList 
  compute False
  
  ptr[0] = Alloc(3) returned 1000
  Free List [ Size 1 ]:  [ addr:1003 sz:97 ]
  
  Free(ptr[0])
  returned 0
  Free List [ Size 2 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:97 ]
  
  ptr[1] = Alloc(5) returned 1003
  Free List [ Size 2 ]:  [ addr:1000 sz:3 ] [ addr:1008 sz:92 ]
  
  Free(ptr[1])
  returned 0
  Free List [ Size 3 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:92 ]
  
  ptr[2] = Alloc(8) returned 1008
  Free List [ Size 3 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1016 sz:84 ]
  
  Free(ptr[2])
  returned 0
  Free List [ Size 4 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:8 ] [ addr:1016 sz:84 ]
  
  ptr[3] = Alloc(8) returned 1008
  Free List [ Size 3 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1016 sz:84 ]
  
  Free(ptr[3])
  returned 0
  Free List [ Size 4 ]:  [ addr:1000 sz:3 ] [ addr:1003 sz:5 ] [ addr:1008 sz:8 ] [ addr:1016 sz:84 ]
  
  ptr[4] = Alloc(2) returned 1000
  Free List [ Size 4 ]:  [ addr:1002 sz:1 ] [ addr:1003 sz:5 ] [ addr:1008 sz:8 ] [ addr:1016 sz:84 ] 
  
  ptr[5] = Alloc(7) returned 1008
  Free List [ Size 4 ]:  [ addr:1002 sz:1 ] [ addr:1003 sz:5 ] [ addr:1015 sz:1 ] [ addr:1016 sz:84 ] 
  ```

  **What speeds up when you use first fit?**
  It does not have to search through the whole list.
4. **For the above questions, how the list is kept ordered can affect the time it takes to find a free location for some of the policies. Use the different free list orderings (`-l ADDRSORT, -l SIZESORT+, -l SIZESORT-`) to see how the policies and the list orderings interact.**

  - `BEST`

    - `-l ADDRSORT`

      ```bash
      ptr[0] = Alloc(3) returned 1000 (searched 1 elements)
      Free List [ Size 1 ]: [ addr:1003 sz:97 ]
      
      Free(ptr[0])
      returned 0
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1003 sz:97 ]
      
      ptr[1] = Alloc(5) returned 1003 (searched 2 elements)
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1008 sz:92 ]
      
      Free(ptr[1])
      returned 0
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:92 ]
      
      ptr[2] = Alloc(8) returned 1008 (searched 3 elements)
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1016 sz:84 ]
      
      Free(ptr[2])
      returned 0
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[3] = Alloc(8) returned 1008 (searched 4 elements)
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1016 sz:84 ]
      
      Free(ptr[3])
      returned 0
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[4] = Alloc(2) returned 1000 (searched 4 elements)
      Free List [ Size 4 ]: [ addr:1002 sz:1 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[5] = Alloc(7) returned 1008 (searched 4 elements)
      Free List [ Size 4 ]: [ addr:1002 sz:1 ][ addr:1003 sz:5 ][ addr:1015 sz:1 ][ addr:1016 sz:84 ]
      
      ```

    - `-l SIZESORT+`

      ```bash
      ptr[0] = Alloc(3) returned 1000 (searched 1 elements)
      Free List [ Size 1 ]: [ addr:1003 sz:97 ]
      
      Free(ptr[0])
      returned 0
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1003 sz:97 ]
      
      ptr[1] = Alloc(5) returned 1003 (searched 2 elements)
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1008 sz:92 ]
      
      Free(ptr[1])
      returned 0
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:92 ]
      
      ptr[2] = Alloc(8) returned 1008 (searched 3 elements)
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1016 sz:84 ]
      
      Free(ptr[2])
      returned 0
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[3] = Alloc(8) returned 1008 (searched 4 elements)
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1016 sz:84 ]
      
      Free(ptr[3])
      returned 0
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[4] = Alloc(2) returned 1000 (searched 4 elements)
      Free List [ Size 4 ]: [ addr:1002 sz:1 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[5] = Alloc(7) returned 1008 (searched 4 elements)
      Free List [ Size 4 ]: [ addr:1002 sz:1 ][ addr:1003 sz:5 ][ addr:1015 sz:1 ][ addr:1016 sz:84 ]
      
      ```

    - `-l SIZESORT-`

      ```bash
      ptr[0] = Alloc(3) returned 1000 (searched 1 elements)
      Free List [ Size 1 ]: [ addr:1003 sz:97 ]
      
      Free(ptr[0])
      returned 0
      Free List [ Size 2 ]: [ addr:1003 sz:97 ][ addr:1000 sz:3 ]
      
      ptr[1] = Alloc(5) returned 1003 (searched 2 elements)
      Free List [ Size 2 ]: [ addr:1008 sz:92 ][ addr:1000 sz:3 ]
      
      Free(ptr[1])
      returned 0
      Free List [ Size 3 ]: [ addr:1008 sz:92 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ptr[2] = Alloc(8) returned 1008 (searched 3 elements)
      Free List [ Size 3 ]: [ addr:1016 sz:84 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      Free(ptr[2])
      returned 0
      Free List [ Size 4 ]: [ addr:1016 sz:84 ][ addr:1008 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ptr[3] = Alloc(8) returned 1008 (searched 4 elements)
      Free List [ Size 3 ]: [ addr:1016 sz:84 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      Free(ptr[3])
      returned 0
      Free List [ Size 4 ]: [ addr:1016 sz:84 ][ addr:1008 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ptr[4] = Alloc(2) returned 1000 (searched 4 elements)
      Free List [ Size 4 ]: [ addr:1016 sz:84 ][ addr:1008 sz:8 ][ addr:1003 sz:5 ][ addr:1002 sz:1 ]
      
      ptr[5] = Alloc(7) returned 1008 (searched 4 elements)
      Free List [ Size 4 ]: [ addr:1016 sz:84 ][ addr:1015 sz:1 ][ addr:1003 sz:5 ][ addr:1002 sz:1 ]
      ```

    - Result

      - The performance is the same, just change the ordering of the lists, but it keeps doing exhaustive searching.

  - `WORST`

    - `-l ADDRSORT`

      ```bash
      ptr[0] = Alloc(3) returned 1000 (searched 1 elements)
      Free List [ Size 1 ]: [ addr:1003 sz:97 ]
      
      Free(ptr[0])
      returned 0
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1003 sz:97 ]
      
      ptr[1] = Alloc(5) returned 1003 (searched 2 elements)
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1008 sz:92 ]
      
      Free(ptr[1])
      returned 0
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:92 ]
      
      ptr[2] = Alloc(8) returned 1008 (searched 3 elements)
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1016 sz:84 ]
      
      Free(ptr[2])
      returned 0
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[3] = Alloc(8) returned 1016 (searched 4 elements)
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1024 sz:76 ]
      
      Free(ptr[3])
      returned 0
      Free List [ Size 5 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1024 sz:76 ]
      
      ptr[4] = Alloc(2) returned 1024 (searched 5 elements)
      Free List [ Size 5 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1026 sz:74 ]
      
      ptr[5] = Alloc(7) returned 1026 (searched 5 elements)
      Free List [ Size 5 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1033 sz:67 ]
      ```

    - `-l SIZESORT+`

      ```bash
      ptr[0] = Alloc(3) returned 1000 (searched 1 elements)
      Free List [ Size 1 ]: [ addr:1003 sz:97 ]
      
      Free(ptr[0])
      returned 0
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1003 sz:97 ]
      
      ptr[1] = Alloc(5) returned 1003 (searched 2 elements)
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1008 sz:92 ]
      
      Free(ptr[1])
      returned 0
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:92 ]
      
      ptr[2] = Alloc(8) returned 1008 (searched 3 elements)
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1016 sz:84 ]
      
      Free(ptr[2])
      returned 0
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[3] = Alloc(8) returned 1016 (searched 4 elements)
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1024 sz:76 ]
      
      Free(ptr[3])
      returned 0
      Free List [ Size 5 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1024 sz:76 ]
      
      ptr[4] = Alloc(2) returned 1024 (searched 5 elements)
      Free List [ Size 5 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1026 sz:74 ]
      
      ptr[5] = Alloc(7) returned 1026 (searched 5 elements)
      Free List [ Size 5 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1033 sz:67 ]
      
      ```

    - `-l SIZESORT-`

      ```bash
      ptr[0] = Alloc(3) returned 1000 (searched 1 elements)
      Free List [ Size 1 ]: [ addr:1003 sz:97 ]
      
      Free(ptr[0])
      returned 0
      Free List [ Size 2 ]: [ addr:1003 sz:97 ][ addr:1000 sz:3 ]
      
      ptr[1] = Alloc(5) returned 1003 (searched 2 elements)
      Free List [ Size 2 ]: [ addr:1008 sz:92 ][ addr:1000 sz:3 ]
      
      Free(ptr[1])
      returned 0
      Free List [ Size 3 ]: [ addr:1008 sz:92 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ptr[2] = Alloc(8) returned 1008 (searched 3 elements)
      Free List [ Size 3 ]: [ addr:1016 sz:84 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      Free(ptr[2])
      returned 0
      Free List [ Size 4 ]: [ addr:1016 sz:84 ][ addr:1008 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ptr[3] = Alloc(8) returned 1016 (searched 4 elements)
      Free List [ Size 4 ]: [ addr:1024 sz:76 ][ addr:1008 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      Free(ptr[3])
      returned 0
      Free List [ Size 5 ]: [ addr:1024 sz:76 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ptr[4] = Alloc(2) returned 1024 (searched 5 elements)
      Free List [ Size 5 ]: [ addr:1026 sz:74 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ptr[5] = Alloc(7) returned 1026 (searched 5 elements)
      Free List [ Size 5 ]: [ addr:1033 sz:67 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ```

    - Result

      - The performance is the same, just change the ordering of the lists, but it keeps doing exhaustive searching.

  - `FIRST`

    - `-l ADDRSORT`

      ```bash
      ptr[0] = Alloc(3) returned 1000 (searched 1 elements)
      Free List [ Size 1 ]: [ addr:1003 sz:97 ]
      
      Free(ptr[0])
      returned 0
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1003 sz:97 ]
      
      ptr[1] = Alloc(5) returned 1003 (searched 2 elements)
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1008 sz:92 ]
      
      Free(ptr[1])
      returned 0
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:92 ]
      
      ptr[2] = Alloc(8) returned 1008 (searched 3 elements)
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1016 sz:84 ]
      
      Free(ptr[2])
      returned 0
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[3] = Alloc(8) returned 1008 (searched 3 elements)
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1016 sz:84 ]
      
      Free(ptr[3])
      returned 0
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[4] = Alloc(2) returned 1000 (searched 1 elements)
      Free List [ Size 4 ]: [ addr:1002 sz:1 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[5] = Alloc(7) returned 1008 (searched 3 elements)
      Free List [ Size 4 ]: [ addr:1002 sz:1 ][ addr:1003 sz:5 ][ addr:1015 sz:1 ][ addr:1016 sz:84 ]
      
      ```

    - `-l SIZESORT+`

      ```bahs
      ptr[0] = Alloc(3) returned 1000 (searched 1 elements)
      Free List [ Size 1 ]: [ addr:1003 sz:97 ]
      
      Free(ptr[0])
      returned 0
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1003 sz:97 ]
      
      ptr[1] = Alloc(5) returned 1003 (searched 2 elements)
      Free List [ Size 2 ]: [ addr:1000 sz:3 ][ addr:1008 sz:92 ]
      
      Free(ptr[1])
      returned 0
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:92 ]
      
      ptr[2] = Alloc(8) returned 1008 (searched 3 elements)
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1016 sz:84 ]
      
      Free(ptr[2])
      returned 0
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[3] = Alloc(8) returned 1008 (searched 3 elements)
      Free List [ Size 3 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1016 sz:84 ]
      
      Free(ptr[3])
      returned 0
      Free List [ Size 4 ]: [ addr:1000 sz:3 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[4] = Alloc(2) returned 1000 (searched 1 elements)
      Free List [ Size 4 ]: [ addr:1002 sz:1 ][ addr:1003 sz:5 ][ addr:1008 sz:8 ][ addr:1016 sz:84 ]
      
      ptr[5] = Alloc(7) returned 1008 (searched 3 elements)
      Free List [ Size 4 ]: [ addr:1002 sz:1 ][ addr:1003 sz:5 ][ addr:1015 sz:1 ][ addr:1016 sz:84 ]
      
      ```

    - `-l SIZESORT-`

      ```bash
      ptr[0] = Alloc(3) returned 1000 (searched 1 elements)
      Free List [ Size 1 ]: [ addr:1003 sz:97 ]
      
      Free(ptr[0])
      returned 0
      Free List [ Size 2 ]: [ addr:1003 sz:97 ][ addr:1000 sz:3 ]
      
      ptr[1] = Alloc(5) returned 1003 (searched 1 elements)
      Free List [ Size 2 ]: [ addr:1008 sz:92 ][ addr:1000 sz:3 ]
      
      Free(ptr[1])
      returned 0
      Free List [ Size 3 ]: [ addr:1008 sz:92 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ptr[2] = Alloc(8) returned 1008 (searched 1 elements)
      Free List [ Size 3 ]: [ addr:1016 sz:84 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      Free(ptr[2])
      returned 0
      Free List [ Size 4 ]: [ addr:1016 sz:84 ][ addr:1008 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ptr[3] = Alloc(8) returned 1016 (searched 1 elements)
      Free List [ Size 4 ]: [ addr:1024 sz:76 ][ addr:1008 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      Free(ptr[3])
      returned 0
      Free List [ Size 5 ]: [ addr:1024 sz:76 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ptr[4] = Alloc(2) returned 1024 (searched 1 elements)
      Free List [ Size 5 ]: [ addr:1026 sz:74 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      
      ptr[5] = Alloc(7) returned 1026 (searched 1 elements)
      Free List [ Size 5 ]: [ addr:1033 sz:67 ][ addr:1008 sz:8 ][ addr:1016 sz:8 ][ addr:1003 sz:5 ][ addr:1000 sz:3 ]
      ```

    - result

      - For this specif input, `ADDRSORT` and `SIZESORT+` was the same
      -  `SIZESORT-`  improved search, but worsened the fragmentation.

  - Total result:

    - Performance does not change for `WORST` and `BEST`.
    - For `FIRST` `ADDRSORT` and `SIZESORT+` was the same, while  `SIZESORT-`  improved search, but worsened the fragmentation.
5. **Coalescing of a free list can be quite important. Increase the number of random allocations (say to -`n 1000`). What happens to larger allocation requests over time? Run with and without coalescing (i.e., without and with the `-C` flag).** 

   #### Without Coalescing - `FIRST ADDRSORT`

   The list became highly fragmented:
   ```bash
   Free List [ Size 51 ]: [ addr:1000 sz:1 ][ addr:1001 sz:1 ][ addr:1002 sz:1 ][ addr:1003 sz:1 ][ addr:1004 sz:1 ][ addr:1005 sz:2 ][ addr:1007 sz:1 ][ addr:1008 sz:2 ][ addr:1010 sz:1 ][ addr:1011 sz:2 ][ addr:1013 sz:1 ][ addr:1014 sz:1 ][ addr:1015 sz:1 ][ addr:1016 sz:3 ][ addr:1019 sz:1 ][ addr:1020 sz:1 ][ addr:1021 sz:1 ][ addr:1022 sz:3 ][ addr:1025 sz:3 ][ addr:1028 sz:1 ][ addr:1029 sz:2 ][ addr:1031 sz:1 ][ addr:1032 sz:2 ][ addr:1034 sz:4 ][ addr:1038 sz:1 ][ addr:1039 sz:1 ][ addr:1040 sz:1 ][ addr:1041 sz:1 ][ addr:1042 sz:2 ][ addr:1044 sz:4 ][ addr:1048 sz:1 ][ addr:1049 sz:3 ][ addr:1052 sz:1 ][ addr:1053 sz:4 ][ addr:1057 sz:1 ][ addr:1058 sz:1 ][ addr:1059 sz:2 ][ addr:1061 sz:1 ][ addr:1062 sz:4 ][ addr:1066 sz:5 ][ addr:1071 sz:1 ][ addr:1072 sz:5 ][ addr:1077 sz:1 ][ addr:1078 sz:1 ][ addr:1079 sz:5 ][ addr:1084 sz:2 ][ addr:1086 sz:1 ][ addr:1087 sz:1 ][ addr:1088 sz:6 ][ addr:1094 sz:2 ][ addr:1096 sz:4 ]
   
   ```

   #### With Coalescing `FIRST ADDRSORT`

   The level of fragmentation is always contained

   ```bash
   Free(ptr[488])
   returned 0
   Free List [ Size 5 ]: [ addr:1000 sz:5 ][ addr:1014 sz:3 ][ addr:1025 sz:3 ][ addr:1031 sz:2 ][ addr:1037 sz:63 ]
   
   ptr[516] = Alloc(10) returned 1000 (searched 1 elements)
   Free List [ Size 1 ]: [ addr:1010 sz:90 ]
   ```

   **What differences in outcome do you see?**

   The fragmentation is contained using coalescing.
   **How big is the free list over time in each case?**

   Without coalescing the size is 51 for `ADDRSORT`, 100 for `SIZESORT-`, 31 for `SIZESORT+`.

   With coalescing the size is 1 for `ADDRSORT`, 98 for `SIZESORT-`, 28 for `SIZESORT+`.
   **Does the ordering of the list matter in this case?**
   A LOT, as we can see from the previous question. Coalescing happens between adjacent elements, so they MUST be ordered by address.
6. **What happens when you change the percent allocated fraction `-P` to higher than 50?**

   50 -> 0/6 fails

   60 -> 1/6 fails

   70 -> 2/6 fails

   80 -> 6/8 fails

   It increases the chance of allocation failing.

   **What happens to allocations as it nears 100?**

   90 -> 5/8 fails

   95 -> 9/10 fails

   100 -> 9/10 fails
   The fail dominates.

   **What about as the percent nears 0?**
   40 -> 0/5 fails

   30 -> 0/5 fails

   20 -> 0/5 fails

   10 -> 0/5 fails

   01 - > 0/5 fails
   It never fails, but it allocates 50  % anyway, as it needs at least one allocated chunk to free.
7. **What kind of specific requests can you make to generate a highly-fragmented free space? Use the `-A` flag to create fragmented free lists, and see how different policies and options change the organization of the free list.**
   A request that makes 1 chunk for each memory byte and then frees only the non-adjacent chunks, that way any police will have at least 50% of fragmentation:

   ```bash
   prompt> python3 malloc.py -c -C -S 10 -p BEST -l ADDRSORT  -A +1,+1,+1,+1,+1,+1,+1,+1,+1,+1,-0,-2,-4,-6,-8
   
   seed 0
   size 10
   baseAddr 1000
   headerSize 0
   alignment -1
   policy BEST
   listOrder ADDRSORT
   coalesce True
   numOps 10
   range 10
   percentAlloc 50
   allocList +1,+1,+1,+1,+1,+1,+1,+1,+1,+1,-0,-2,-4,-6,-8
   compute True
   
   ptr[0] = Alloc(1) returned 1000 (searched 1 elements)
   Free List [ Size 1 ]: [ addr:1001 sz:9 ]
   
   ptr[1] = Alloc(1) returned 1001 (searched 1 elements)
   Free List [ Size 1 ]: [ addr:1002 sz:8 ]
   
   ptr[2] = Alloc(1) returned 1002 (searched 1 elements)
   Free List [ Size 1 ]: [ addr:1003 sz:7 ]
   
   ptr[3] = Alloc(1) returned 1003 (searched 1 elements)
   Free List [ Size 1 ]: [ addr:1004 sz:6 ]
   
   ptr[4] = Alloc(1) returned 1004 (searched 1 elements)
   Free List [ Size 1 ]: [ addr:1005 sz:5 ]
   
   ptr[5] = Alloc(1) returned 1005 (searched 1 elements)
   Free List [ Size 1 ]: [ addr:1006 sz:4 ]
   
   ptr[6] = Alloc(1) returned 1006 (searched 1 elements)
   Free List [ Size 1 ]: [ addr:1007 sz:3 ]
   
   ptr[7] = Alloc(1) returned 1007 (searched 1 elements)
   Free List [ Size 1 ]: [ addr:1008 sz:2 ]
   
   ptr[8] = Alloc(1) returned 1008 (searched 1 elements)
   Free List [ Size 1 ]: [ addr:1009 sz:1 ]
   
   ptr[9] = Alloc(1) returned 1009 (searched 1 elements)
   Free List [ Size 0 ]: 
   
   Free(ptr[0])
   returned 0
   Free List [ Size 1 ]: [ addr:1000 sz:1 ]
   
   Free(ptr[2])
   returned 0
   Free List [ Size 2 ]: [ addr:1000 sz:1 ][ addr:1002 sz:1 ]
   
   Free(ptr[4])
   returned 0
   Free List [ Size 3 ]: [ addr:1000 sz:1 ][ addr:1002 sz:1 ][ addr:1004 sz:1 ]
   
   Free(ptr[6])
   returned 0
   Free List [ Size 4 ]: [ addr:1000 sz:1 ][ addr:1002 sz:1 ][ addr:1004 sz:1 ][ addr:1006 sz:1 ]
   
   Free(ptr[8])
   returned 0
   Free List [ Size 5 ]: [ addr:1000 sz:1 ][ addr:1002 sz:1 ][ addr:1004 sz:1 ][ addr:1006 sz:1 ][ addr:1008 sz:1 ]
   
   ```

   

   

