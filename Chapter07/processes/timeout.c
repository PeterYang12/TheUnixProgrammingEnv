/*************************************************************************
	> File Name: timeout.c
	> Author: 
	> Mail: 
	> Created Time: Sun 16 Jan 2022 07:05:29 PM PST
 ************************************************************************/

#include <stdio.h>
#include <signal.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
pid_t pid;

// kill child when alarm arrives
void onalarm() {
    kill(pid, SIGKILL);
}

int main(int argc, char** argv){
    int sec = 10, status;
    char *progname = argv[0];
    if (argc > 1 && argv[1][0] == '-') {
        sec = atoi(&argv[1][1]);
        argc--;
        argv++;
    }
    if (argc < 2) {
        printf("Usage: %s [-10] command", progname);
        exit(1);
    }
    if ((pid = fork()) == 0) {
        execvp(argv[1], &argv[1]);
        printf("could't start %s", argv[1]);
    }
    signal(SIGALRM, onalarm);
    alarm(sec);
    if (wait(&status) == -1 || (status & 0177) != 0) {
        printf("%s killed", argv[1]);
    }
    exit((status >> 8) & 0377);
    return 0;
}

