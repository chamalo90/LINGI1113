#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>
int main(int argc, char** args)
{
	if(argc != 2)
	{
		printf("Error - wrong args in %s\n", args[0]);
		exit(0);
	}
	printf("%s\n", args[1]);
	int fd  = open(args[1], O_RDONLY);
        if(errno == EACCES | errno == ENFILE)
	{
		printf("Error - file opening failed");
		exit(0);
	}
	char buf[1];
	int line = 1;
	printf("fd: %d\nline %d -", fd, line);
	while (read(fd, buf, sizeof(char)) != 0)
	{
		if(*buf=='\n'){
			line++;
			printf("\nline %d -", line);
		}else{
			printf("%s",buf);
		}
	}
	printf("\nLe Fichier compter %d lignes\n", line);
	close(fd);
	exit(0);
}	
