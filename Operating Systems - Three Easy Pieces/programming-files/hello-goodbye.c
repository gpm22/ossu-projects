#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main()
{

     printf("hello (pid:%d)\n", (int) getpid());
     int rc = fork();
     if (rc < 0) {
        // fork failed
        fprintf(stderr, "fork failed\n");
        exit(1);
     } else if (rc == 0) {
        //child
        int rc_wait = waitpid(rc, NULL, 0);
        printf("hello\n");
        printf("child (pid:%d)\n", (int) getpid());
        printf("wait: %d", rc_wait);

     } else {
        //parent
        int rc_wait = waitpid(rc, NULL, 0);
    
        printf("goodbye\n");

        printf("parent of %d (pid:%d)\n", rc, (int) getpid());
        printf("wait: %d", rc_wait);
     }
     
    return 0;
}