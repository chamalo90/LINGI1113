#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "sparseMatrix.h"


void freeSparse(Sparsemat *mat){
	Element *elem= mat->first;
	free(mat);
	while(elem != NULL){
		Element *tmp = elem->next;
		free(elem);
		elem = tmp;	
	}
}

Sparsemat* initMat(int content[], int rows, int columns){
	int i;
	int j;
	Sparsemat *matrix = malloc(sizeof(Sparsemat));
	Element *e = malloc(sizeof(Element));
	Element *last;
	matrix->first = e;
	matrix->rows = rows;
	matrix->columns = columns;
	for(i=0; i<rows; i++){
		for(j=0; j<columns; j++){
			if(content[i*columns + j] != 0){
				e->value = 1;
				e->cPos = j;
				e->rPos = i;
				printf("Elem val:%d i:%d j:%d\n", e->value, e->rPos ,e->cPos);
				Element *tmp= malloc(sizeof(Element));
				last = e;
				e->next = tmp;
				e = tmp;
	
			}
		}
	}
	last->next = NULL;
	free(e);
	return matrix;


}

int search(Sparsemat *mat, int rowPos, int colPos){
	if(mat->rows < rowPos || mat->columns < colPos){
		return 0;
	}
	Element *tmp = mat->first;
	while(tmp->rPos <= rowPos || tmp->cPos <= colPos){
		if(tmp->rPos == rowPos && tmp->cPos == colPos)
			return tmp->value;
		else{
			tmp = tmp->next;
			if(tmp==NULL)
			return 0;
		}
	}
	return 0;
}

Sparsemat* multiply(Sparsemat *A, Sparsemat *B){
	if(A->columns != B->rows){
		return NULL;
	}
	Sparsemat *result = malloc(sizeof(Sparsemat));
	result->rows = A->rows;
	result->columns = B->columns;
	int i;
	int j;
	int k;
	Element *elem = malloc(sizeof(Element));
	Element *last;
	result->first = elem;
	for(i= A->first->rPos; i<A->rows; i++){ //starts at A->first->rPos because not any node in res before any node in aList
		for(j=0; j<B->columns; j++){
			elem->rPos = i;
			elem->cPos = j;
			for(k = 0; k< A->columns; k++){
				int aVal = search(A, i, k);
				if(aVal){
					int bVal = search(B, k, j);
					elem->value =+ aVal*bVal;
				}
			}
				if(elem->value){
					Element *tmp= malloc(sizeof(Element));
					last = elem;
					elem->next = tmp;
					elem = tmp;
			}
		}
	}
	last->next = NULL;
	free(elem);
	return result;	
}



int main(){
	int contenuTest[9];
	int i;
	int j;
	for(i=0; i<3; i++){
	for(j=0; j<3; j++){
		if(i==j)
			contenuTest[i*3 + j] = 1;
		else
			contenuTest[i*3 + j] = 0;
	}
	}
	Sparsemat *matrixA = initMat(contenuTest,3,3);
	for(i=0; i<3; i++){
	for(j=0; j<3; j++){
		if(j==0)
			contenuTest[i*3 + j] = 0;
		else
			contenuTest[i*3 + j] = 1;
	}
	}
	Sparsemat *matrixB;
	matrixB=initMat(contenuTest,3,3);

	printf("Matrices initialized\n");
	
	Sparsemat *res = multiply(matrixA, matrixB);
	Element *p = res->first;
	while(p != NULL){
		printf("Res row:%d col:%d val:%d\n", p->rPos, p->cPos, p->value);
		p = p->next;
	}
	freeSparse(matrixA);
	freeSparse(matrixB);
	freeSparse(res);
	return 0;
}

