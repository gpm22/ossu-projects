#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <megabytes>\n", argv[0]);
        return 1;
    }
    
    printf("Process pid: %d\n", getpid());
    
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
