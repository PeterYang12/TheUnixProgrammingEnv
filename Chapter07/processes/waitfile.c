/*************************************************************************
	> File Name: waitfile.c
	> Author: 
	> Mail: 
	> Created Time: Sun 16 Jan 2022 05:05:59 PM PST
 ************************************************************************/

#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>

int main(int argc, char** argv){
    int fd;
    struct stat stbuf;
    time_t old_time = 0;
    char *progname = argv[0];
    if (argc < 2) {
        printf("Usage: %s filename [cmd]", progname);
        exit(1);
    }
    if ((fd = open(argv[1], 0)) == -1) {
        printf("can't open %s", argv[1]);
        exit(1);
    }
    // file status is saved in stbuf
    fstat(fd, &stbuf);
    while (stbuf.st_mtime != old_time) {
        old_time = stbuf.st_mtime;
        sleep(5);
        fstat(fd, &stbuf);
    }
    // copy files
    if (argc == 2) {
        execlp("cat", "cat", argv[1], (char*)0);
        printf("can't excute %s", argv[1]);
    }
    // run process
    else {
        execvp(argv[2], &argv[2]);
        printf("can't execute %s", argv[2]);
    }
    return 0;
  }

