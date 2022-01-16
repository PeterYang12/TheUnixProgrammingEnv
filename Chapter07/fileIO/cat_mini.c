/*************************************************************************
	> File Name: cat_mini.c
	> Author: Xue Wang
	> Mail: 
	> Created Time: Fri 14 Jan 2022 11:47:10 PM PST
 ************************************************************************/

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#define SIZE 4

int main() {
    char buf[SIZE];
    int n;
    while ((n = read(0, buf, sizeof(buf))) > 0) {
        write(1, buf, n);
    }
    exit(0);
    return 0;
}
