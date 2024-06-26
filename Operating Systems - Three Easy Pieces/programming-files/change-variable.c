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