#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int writeFile(char* path, int size);

int writeFile(char* path, int size){
	
    FILE* file = NULL;
    file = fopen(path, "w");
	

    if (file != NULL){
	int i=0;
	while(i!=size){
		fprintf(file, "%d", i);
		i++;
	}
	
        fclose(file);
    }
    else{
        printf("Error opening the file\n");
    }

    return 0;
}


int main(int argc, char **args){
	int j=0;
	char* path = "/home/vincent/Documents/DoFragments/files/f";
	while(j != 2048){
		char* t_path[25];
		sprintf(t_path, "%s_small_%i.txt", path, j);
		writeFile(t_path, 1024);
		printf("%s ecris !\n", t_path);
		j++;
	}
	j=0;
	while(j != 2048){
		char* t_path[25];
		sprintf(t_path, "%s_small_%i.txt", path, j);
		remove(t_path);
		printf("%s supprimé !\n", t_path);
		j+=2;
	}
	j=0;
	while(j != 32){
		char* t_path[25];
		sprintf(t_path, "%s_big_%i.txt", path, j);
		writeFile(t_path, 1048576);
		printf("%s ecris !\n", t_path);
		j++;
	}	
	return 0;
}


