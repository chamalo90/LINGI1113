#include<stdio.h>
#include<stdlib.h>
#include"SparseMatrix.c"

void export(char *path, Sparsemat *sparseMatrix){

	FILE* file = NULL;
	file = fopen(path, "w");
	
	if(file != NULL){
		int n = sparseMatrix->rows;
		int m = sparseMatrix->columns;
		fprintf(file, "%dx%d", n, m);

		Element *elem = sparseMatrix->first;
		int iElem = elem->rPos;
		int jElem = elem->cPos;
		
		int i ,j;
		for(i = 0; i<n ; i++){
			for(j = 0; j<m ; j++){
				int tempValue = 0;
				if(i==iElem && j==jElem){
					tempValue = elem->value;
					if(elem->next != NULL){
						elem = elem->next;
						iElem = elem->rPos;
						jElem = elem->cPos;
					}else{ iElem = 0; jElem = 0;}
				}
				fprintf(file, "%d ", tempValue);
			}
			fprintf(file, "\n");
		}
	}else{
		printf("Can't write in output file");	
	}
	
	fclose(file);
}

void exportSimpleMat(char *path, int *matrix, int rows, int columns){
	
	FILE* file = NULL;
	file = fopen(path, "w");
	
	if(file != NULL){
		int i ,j;
		for(i = 0; i<rows ; i++){
			for(j = 0; j<columns ; j++){
				fprintf(file, "%d ", matrix[(i*rows)+columns]);
			}
			fprintf(file, "\n");	
		}
	}else{
		printf("Can't write in output file");	
	}
	
	fclose(file);
}

/*
int main(int argc, char *argv[]){
	export("output.txt");
	return 0;
}*/
