# Mechanism: Limited Direct Execution

## Homework (Measurement)

In this homework, you’ll measure the costs of a system call and context switch.

### System Calls

#### Code

```c
#include <sys/time.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main() {
    struct timeval start, end;
    int fd;
    char buffer[1];
    int iterations = 100000;
    long total_usec = 0;
    
    // Open /dev/zero for reading (a safe file for testing)
    fd = open("/dev/zero", O_RDONLY);
    if (fd < 0) {
        perror("open");
        return 1;
    }
    
    printf("Measuring time for 0-byte read system call...\n");
    printf("Running %d iterations\n\n", iterations);
    
    // Perform multiple iterations to get average
    for (int i = 0; i < iterations; i++) {
        gettimeofday(&start, NULL);
        
        // Perform the 0-byte read
        read(fd, buffer, 0);
        
        gettimeofday(&end, NULL);
        
        // Calculate elapsed time in microseconds
        long seconds = end.tv_sec - start.tv_sec;
        long microseconds = end.tv_usec - start.tv_usec;
        long elapsed_usec = seconds * 1000000 + microseconds;
        
        total_usec += elapsed_usec;
    }
    
    close(fd);
    
    // Calculate and display results
    double avg_usec = (double)total_usec / iterations;
    double avg_nsec = avg_usec * 1000;
    
    printf("Total time: %ld microseconds\n", total_usec);
    printf("Average time per system call: %.3f microseconds\n", avg_usec);
    printf("Average time per system call: %.0f nanoseconds\n", avg_nsec);
    
    return 0;
}
```

#### Results 

```
Measuring time for 0-byte read system call...
Running 100000 iterations

Total time: 41130 microseconds
Average time per system call: 0.411 microseconds
Average time per system call: 411 nanoseconds
```

### Context Switch

#### Code

```c
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <sched.h>

#define ITERATIONS 100000

int main() {
    int pipe1[2];  // Parent writes, child reads
    int pipe2[2];  // Child writes, parent reads
    int iterations = ITERATIONS;
    char byte = 'X';
    pid_t pid;
    struct timeval start, end;
    
    // Create two pipes
    if (pipe(pipe1) < 0 || pipe(pipe2) < 0) {
        perror("pipe");
        exit(1);
    }
    
    // Pin to CPU 0 before forking
    cpu_set_t set;
    CPU_ZERO(&set);
    CPU_SET(0, &set);
    
    if (sched_setaffinity(0, sizeof(set), &set) < 0) {
        perror("sched_setaffinity");
        exit(1);
    }
    
    printf("Measuring context switch time...\n");
    printf("Pinning both processes to CPU 0\n");
    printf("Running %d iterations\n\n", iterations);
    
    pid = fork();
    
    if (pid < 0) {
        perror("fork");
        exit(1);
    }
    
    if (pid == 0) {
        // Child process
        // Pin child to CPU 0 as well
        if (sched_setaffinity(0, sizeof(set), &set) < 0) {
            perror("child sched_setaffinity");
            exit(1);
        }
        
        for (int i = 0; i < iterations; i++) {
            // Read from pipe1 (blocks until parent writes)
            read(pipe1[0], &byte, 1);
            
            // Write to pipe2 (wakes up parent)
            write(pipe2[1], &byte, 1);
        }
        
        close(pipe1[0]);
        close(pipe2[1]);
        exit(0);
        
    } else {
        // Parent process
        gettimeofday(&start, NULL);
        
        for (int i = 0; i < iterations; i++) {
            // Write to pipe1 (wakes up child)
            write(pipe1[1], &byte, 1);
            
            // Read from pipe2 (blocks until child writes)
            read(pipe2[0], &byte, 1);
        }
        
        gettimeofday(&end, NULL);
        
        // Wait for child to finish
        wait(NULL);
        
        // Close pipes
        close(pipe1[1]);
        close(pipe2[0]);
        
        // Calculate elapsed time
        long seconds = end.tv_sec - start.tv_sec;
        long microseconds = end.tv_usec - start.tv_usec;
        long total_usec = seconds * 1000000 + microseconds;
        
        // Each iteration involves 2 context switches (parent->child, child->parent)
        double avg_usec_per_switch = (double)total_usec / (iterations * 2);
        double avg_nsec_per_switch = avg_usec_per_switch * 1000;
        
        printf("Total time: %ld microseconds\n", total_usec);
        printf("Total context switches: %d\n", iterations * 2);
        printf("Average time per context switch: %.3f microseconds\n", avg_usec_per_switch);
        printf("Average time per context switch: %.0f nanoseconds\n", avg_nsec_per_switch);
    }
    
    return 0;
}
```

#### Results 

```
Measuring context switch time...
Pinning both processes to CPU 0
Running 100000 iterations

Total time: 1028155 microseconds
Total context switches: 200000
Average time per context switch: 5.141 microseconds
Average time per context switch: 5141 nanoseconds
```

