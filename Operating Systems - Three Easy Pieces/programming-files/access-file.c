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