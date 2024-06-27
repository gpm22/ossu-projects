#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main()
{
     int rc = fork();
     if (rc < 0) {
        // fork failed
        fprintf(stderr, "fork failed\n");
        exit(1);
     } else if (rc == 0) {
        //child
         printf("hello\n");
     } else {
        //parent
        wait(NULL);
        printf("goodbye\n");
     }
     
    return 0;
}