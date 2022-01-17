/*************************************************************************
	> File Name: sv.c
	> Author: 
	> Mail: 
	> Created Time: Sun 16 Jan 2022 06:17:16 AM PST
 ************************************************************************/

#include <stdio.h>
#include <sys/types.h>
#include <sys/dir.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <unistd.h>
#include <strings.h>
#include <stdlib.h>
char *progname;

// save file in dir
void sv(char *file, char *dir) {
    struct stat sti, sto;
    int fin, fout, n;
    char target[BUFSIZ], buf[BUFSIZ], *index();
    
    sprintf(target, "%s/%s", dir, file);
    if (index(file, '/') != NULL) {
        printf("won't handle in %s", file);
        exit(1);
    }
    if (stat(file, &sti) == -1) {
        printf("can't stat %s", file);
        exit(1);
    }
    if (stat(target, &sto) == -1) {
        sto.st_mtime = 0;
    }
    if (sti.st_mtime < sto.st_mtime) {
        printf("stderr %s: %s not copied\n", progname, file);
        exit(1);
    }
    else if ((fin = open(file, 0)) == -1) {
        printf("can't open file %s", file);
        exit(1);
    }
    else if ((fout = creat(target, sti.st_mode)) == -1) {
        printf("can't create %s", target);
//        printf("target is %s, st_mode is %o", target, sti.st_mode);
        exit(1);
    }
    else {
        while ((n = read(fin, buf, sizeof(buf))) > 0) {
            if (write(fout, buf, n) != n) {
                printf("printf writing %s", target);
            }
        }
    }
    close(fin);
    close(fout);
}


int main(int argc, char** argv){
    struct stat stbuf;
    char* dir = argv[argc-1];
    
    char* progname = argv[0];
    if (argc <= 2) {
        printf("Usage: %s files...dir", progname);
    }
    if (stat(dir, &stbuf) == -1) {
        printf("can't access directory %s", dir);
    }
    if ((stbuf.st_mode & S_IFMT) != S_IFDIR) {
        printf("%s is not a directory", dir);
    }
    for (int i=1; i < argc-1; i++) {
        sv(argv[i], dir);
    }
    return 0;
}

