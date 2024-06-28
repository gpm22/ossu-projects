#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    int rc = fork();
    if (rc < 0) { // fork failed; exit
        fprintf(stderr, "fork failed\n");
        exit(1);
    } else if (rc == 0) { // child (new process)
        char *myargs[2];
        myargs[0] = strdup("ls");
        myargs[1] = NULL; // mark end of array
        // printf("execl\n");
        // execl("/usr/bin/ls", "ls", NULL);
        // printf("execle");
        // execle("/usr/bin/ls", "ls", NULL, myargs);
        // printf("execlp");
        // execlp("/usr/bin/ls", "ls", NULL);
        // printf("execv");
        // execv("/usr/bin/ls", myargs);
        // printf("execvp");
        // execvp(myargs[0], myargs);
        printf("execvpe");
        execve("/usr/bin/ls", myargs, myargs);
        printf("\nthis shouldn’t print out");
    } else { // parent goes down this path
        wait(NULL);
    }
    return 0;
}