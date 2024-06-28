#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#define MSGSIZE 16

int main()
{
    printf("hello (pid:%d)\n", (int)getpid());
    char inbuf[MSGSIZE];
    int p[2], i;
    if (pipe(p) < 0)
        exit(1);
    int rc_1 = fork();
    int rc_2 = 1;
    char *c = (char *)calloc(100, sizeof(char));
    if (rc_1 < 0 || rc_2 < 0)
    {
        // fork failed
        fprintf(stderr, "fork failed\n");
        exit(1);
    }
    else if (rc_1 == 0)
    {
        char *msg1 = "hello, world #1";
        char *msg2 = "hello, world #2";
        char *msg3 = "hello, world #3";
        // child 1 (new process)
        printf("child 1 (pid:%d)\n", (int)getpid());
        write(p[1], msg1, MSGSIZE);
        write(p[1], msg2, MSGSIZE);
        write(p[1], msg3, MSGSIZE);

        rc_2 = fork();

        if (rc_2 == 0)
        {
            // child 2 (new process)
            printf("child 2 (pid:%d)\n", (int)getpid());
            for (i = 0; i < 3; i++)
            {
                /* read pipe */
                read(p[0], inbuf, MSGSIZE);
                printf("%s\n", inbuf);
            }
        }
        else
        {
            printf("parent of %d (pid:%d)\n", rc_2, (int)getpid());
        }
    }
    else
    {
        // parent goes down this path (main)
        printf("dad\n");
        printf("parent of %d (pid:%d)\n", rc_1, (int)getpid());
    }

    return 0;
}