/*************************************************************************
	> File Name: cp_mini.c
	> Author: 
	> Mail: 
	> Created Time: Sat 15 Jan 2022 05:28:50 PM PST
 ************************************************************************/

#include <stdio.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#define BUFSIZE 64

/* cp f1 to f2*/
int main(int argc,char **argv){
    int f1, f2, n;
    char buf[BUFSIZE];

    //progname = argv[0];
    if (argc != 3) perror("Usage: cp file");
    if ((f1 = open(argv[1], O_RDONLY)) == -1) perror("cann't open");
    if ((f2 = creat(argv[2], S_IRWXU)) == -1) perror("cann't create");

    while ((n = read(f1, buf, BUFSIZE)) > 0) {
        if (write(f2, buf, n) != n) {
            perror("write error!");
            break;
        }
    }
    return 0;
}
