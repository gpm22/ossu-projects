# 5 - Interlude: Process API

## Homework (Simulation)

### 1

The actions are:

```
Action: a forks b
Action: a forks c
Action: c EXITS
Action: a forks d
Action: a forks e
```

For each step the tree is:

1. 

   ```
   a
   |_ b
   ```

2. 

   ```
   a
   |_ b
   |_ c
   ```

3. 

   ```
   a
   |_ b
   ```

4. 

   ```
   a
   |_ b
   |_ d
   ```

5. 

   ```
   a
   |_ b
   |_ d
   |_ e
   ```

Running it with `-c` flag confirms it:

```
                           Process Tree:
                               a
Action: a forks b
                               a
                               └── b
Action: a forks c
                               a
                               ├── b
                               └── c
Action: c EXITS
                               a
                               └── b
Action: a forks d
                               a
                               ├── b
                               └── d
Action: a forks e
                               a
                               ├── b
                               ├── d
                               └── e
```



### 2

Here I am using `-s 10 -a 100`.

With `-f 0.1` the final process tree will be just `a`, which was confirmed by running it with `-c`.

With `-f 0.2` the final process tree will also be just `a`, which was confirmed by running it with `-c`.

With `-f 0.3` the final process tree will be

```
a
|_ Z
```

Which was not confirmed (DAAAANG) by running it with `-c`, the correct result is:

```
Final Process Tree:
a
├── Y
└── Z

```

With `-f 0.4` the final process tree will be

```
a
|_ R
|  |_ X
|  |_ Y
|
|_ W
```

Which was confirmed by running it with `-c`.

With `-f 0.5` the final process tree will be

```
a
|_ w
|_ H
|_ O
|_ T
|_ W
|_ ab
```

Which was confirmed by running it with `-c`.

With `-f 0.6` the final process tree will be

```
a
|_ i
|  |_ u
|  |_ z
|  |_ A
|     |_ ah
|
|  |_ S
|     |_ aa
|
|_ m
|  |_ C
|  |_ H
|  |  |_ ab
|  |  |  |_ aq
|  |  |  |_ ak 
|  |  |
|  |  |_ ae
|  |
|  |_ L
|  |  |_ T
|  |  |_ W
|  |     |_ ad
|  |
|  |_ aj
|  
|_ n
|  |_ R
|  
|_ F
|  |_ Z
|
|_ ac
```

Which was not confirmed (DAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANG) by running it with `-c`, the correct answer is:

```
Final Process Tree:
a
├── n
│   └── R
├── m
│   └── aj
├── i
│   ├── u
│   └── S
│       └── aa
├── A
│   └── ah
├── F
│   └── Z
├── H
│   ├── ab
│   │   ├── ag
│   │   └── ak
│   └── ae
├── L
│   ├── T
│   └── W
│       └── ad
├── z
├── C
└── ac

```

With `-f 0.7` the final process tree will be

```
a
|_ g
|  |_ I
|  |  |_ ap
|  |
|  |_ O
|     |_ ai
|     |_ ak
|
|_ h
|  |_ p
|  |  |_ w
|  |  |_ C
|  |  |_ F
|  |  |_ K
|  |  |  |_ au 
|  |  | 
|  |  |_ W
|  |
|  |_ z
|  |_ ao
|     |_ ax
|
|_ k
|  |_ u  
|  |  |_ H
|  |  |  |_ Y
|  |  |     |_ac
|  |  |_ aj
|  | 
|  |_ M
|     |_N
|
|_ l
|  |_m
|    |_t
|      |_ as
|
|_ o
|  |_ E
|  |  |_ ay
|  |
|  |_ ae
|
|_i
|  |_x
|  |  |_ B
|  |  |_ L
|  |  |  |_ ar
|  |  |
|  |  |_ R
|  |  |  |_ v
|  |  |  |  |_ aq
|  |  |  |
|  |  |  |_ ag
|  |  |     |_ am
|  |  |     |_ aw
|  |  | 
|  |  |_ad
|  |
|  |_ P
|  |_ af
|    |_ at
|
|_ q
|_ G
|  |_ an
|
|_ al

```

Which was not confirmed (SAAAAAAAAAAD) by running it with `-c`, the correct one is:

```
Final Process Tree:
a
├── k
│   ├── u
│   │   ├── H
│   │   │   └── Y
│   │   │       └── ac
│   │   └── aj
│   └── M
│       └── N
├── h
│   ├── z
│   └── ao
│       └── ax
├── o
│   ├── E
│   │   └── ay
│   └── ae
├── i
│   ├── x
│   │   ├── B
│   │   ├── L
│   │   │   └── ar
│   │   ├── R
│   │   │   ├── V
│   │   │   └── ag
│   │   │       ├── am
│   │   │       └── aw
│   │   └── ad
│   └── af
│       └── at
├── q
│   ├── G
│   │   └── an
│   └── al
├── g
│   ├── I
│   │   └── ap
│   └── O
│       ├── ai
│       └── ak
├── l
├── m
├── t
├── p
│   ├── C
│   └── W
├── w
├── P
├── F
├── K
│   └── au
├── as
└── aq


```

For `-f 0.8` and `-f 0.9` I did not try to calculate the right, as it is boring as hell. It can be observed that the tree grows in depth and width.

For `-f 0.8`, the generated tree is:

```
a
├── k
│   ├── u
│   │   └── J
│   └── O
├── h
│   ├── B
│   ├── S
│   │   └── ap
│   └── at
│       └── aE
├── o
│   └── G
├── r
│   ├── D
│   └── aq
├── i
│   ├── y
│   │   ├── C
│   │   └── ai
│   └── ak
├── q
│   └── I
│       ├── ab
│       └── as
├── p
│   ├── Z
│   │   └── ae
│   └── aj
│       ├── ar
│       └── aC
├── s
│   └── H
│       └── aF
├── R
├── x
├── F
├── N
│   └── aA
│       └── aD
├── P
│   └── ax
├── T
│   └── an
├── U
├── Y
├── ac
│   └── aw
├── V
├── X
│   └── av
├── ad
│   └── ah
│       └── az
├── L
│   ├── am
│   └── au
├── ay
├── g
├── l
├── m
├── ag
├── w
├── ao
├── K
├── Q
└── aB

```



Finally, for `-f 0.9`, the generated tree is:

```
Final Process Tree:
a
├── b
│   ├── f
│   │   ├── g
│   │   │   ├── k
│   │   │   ├── B
│   │   │   │   └── V
│   │   │   │       ├── aa
│   │   │   │       │   ├── ai
│   │   │   │       │   │   ├── al
│   │   │   │       │   │   └── an
│   │   │   │       │   └── ar
│   │   │   │       └── av
│   │   │   └── aq
│   │   ├── E
│   │   │   └── ag
│   │   └── W
│   │       └── at
│   ├── n
│   │   └── J
│   │       ├── af
│   │       │   ├── ak
│   │       │   │   └── aG
│   │       │   └── aD
│   │       └── az
│   │           └── aM
│   ├── U
│   └── aN
├── c
│   ├── i
│   │   ├── p
│   │   └── x
│   │       └── Y
│   ├── y
│   │   ├── X
│   │   │   └── ac
│   │   ├── Z
│   │   │   ├── ay
│   │   │   └── aC
│   │   └── ab
│   ├── z
│   │   ├── F
│   │   ├── I
│   │   └── R
│   │       ├── T
│   │       └── aI
│   │           └── aL
│   └── O
│       ├── ae
│       │   └── ah
│       └── aH
├── e
│   ├── h
│   │   └── S
│   │       └── aE
│   ├── j
│   │   └── am
│   │       └── aJ
│   ├── s
│   │   ├── C
│   │   └── Q
│   ├── D
│   └── aA
├── q
│   ├── u
│   │   └── P
│   ├── G
│   ├── H
│   │   └── aO
│   └── L
├── o
│   ├── ad
│   └── ap
├── r
│   ├── K
│   └── aw
├── v
│   ├── N
│   │   └── aF
│   └── au
├── M
│   ├── as
│   ├── aB
│   └── aK
└── ax


```



### 3

It is easier to notice the action by the difference between 2 processes trees.

### 4

I think that when one a child exits their children go to their grandparent, there I think that the process tree will be:

```
a
|_b
  |_d
  |_e
```

WHICH IS INCORRECT!

When a process exits, all their children go to the root process, so the correct one is:

```
Final Process Tree:
a
├── b
├── d
└── e

```

Using the `-R` flag causes the behavior that originally thought was the correct one:

```
Final Process Tree:
a
└── b
    ├── d
    └── e

```

 

### 5

I already did that for question 2, I only can do it correctly for small set of actions.

### 6

It is not possible to know if there is any orphan processes, as they all appear under `a`.

## Homework (Code)

### 1

The for the child will be the one before the fork, so if the parent the values after calling fork, the child will not see this difference.

In case the child change the value, it will use the this new value, but the parent will not see it.

Program used:

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main()
{
     int x = 10;
     printf("hello (pid:%d)\n", (int) getpid());
     int rc = fork();
     if (rc < 0) {
         // fork failed
         fprintf(stderr, "fork failed\n");
         exit(1);
     } else if (rc == 0) {
         // child (new process)
        //  x = 11;
         printf("child (pid:%d)\n", (int) getpid());
         printf("%d\n", x);
     } else {
        // parent goes down this path (main)
        x = 12;
        printf("parent of %d (pid:%d)\n", rc, (int) getpid());
        printf("%d\n", x);
     }
     
    return 0;
}
```



### 2

The child has not access to the file after the parent has used it. So the child needs to open it again.

When writing, both can write to the file opened once, it seems that they wait to the other process to conclude writing.

Program used:

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>

int main()
{
     printf("hello (pid:%d)\n", (int) getpid());
     int file = open("change-variable.txt", O_RDWR);
     int rc = fork();
     char* c = (char*)calloc(100, sizeof(char));
     if (rc < 0) {
         // fork failed
         fprintf(stderr, "fork failed\n");
         exit(1);
     } else if (rc == 0) {
         // child (new process)
         printf("child (pid:%d)\n", (int) getpid());
         printf("%d\n", file);
        //  int sz = read(file, c, 100);
        //  printf("bytes: %s\n", c);
        write(file, "changed by the child!", 22);
     } else {
        // parent goes down this path (main)
        printf("parent of %d (pid:%d)\n", rc, (int) getpid());
         printf("%d\n", file);
        //  int sz = read(file, c, 100);
        //  printf("bytes: %s\n", c);
            write(file, "changed by the parent!", 22);
     }
     
    return 0;
}
```



### 3

### 4

### 5

### 6

### 7

### 8