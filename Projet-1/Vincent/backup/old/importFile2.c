#include <stdlib.h>
#include <stdio.h>
#include "sparseMatrix.h"

int /*spareMatrix*/ importFile(char* path){
	
	int row=0;
	int col=0;

	tableSize(path, &row, &col);

	int current = 0;
	FILE* file = fopen(path, "r");
	int i = 0; 
	int j = 0;

/*
	Creer tableau de taille row*col et mettre toutes les infos dedans.
*/

	if(file != NULL){
		do{
			current = fgetc(file);
			if(current == '\n'){
				i++;
				if(col==0) col = j;
				j=0;
			}else{
				j++;
			}
		}while(current != EOF);
		row = i;
	}else{
		printf("Can't open the file");
	}
	return 0;
}

void tableSize(char *path, int *rows, int *columns){
	int current = 0;
	FILE* file = fopen(path, "r");
	int i = 0;
	int j = 0;

	if(file != NULL){
		do{
			current = fgetc(file);
			if(current == '\n'){
				i++;
				if(*columns==0) (*columns) = j;
				j=0;
			}else{
				j++;
			}
		}while(current != EOF);
		(*rows) = i;
	}else{
		printf("Can't open the file");
	}
}

int main(int arg, char *argv[]){
	int result = importFile("matrice.txt");
	return 0;
}
