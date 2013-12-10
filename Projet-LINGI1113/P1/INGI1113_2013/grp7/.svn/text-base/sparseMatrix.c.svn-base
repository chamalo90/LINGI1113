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

void freeSparseList(struct SpMat_List *l){
	SpMat_List *tmp1 = l->next;
	freeSparse(l->elem);
	free(l);
	while(tmp1 != NULL){
		freeSparse(tmp1->elem);
		SpMat_List *tmp2 = tmp1->next;
		free(tmp1);
		tmp1=tmp2;
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
		printf("Wrong Dimensions - Cannot make multiplication\n");
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
					elem->value += aVal*bVal;
				}
			}
				if(elem->value){
					Element *tmp= malloc(sizeof(Element));
					last = elem;
					elem->next = tmp;
					elem = tmp;
					elem->value = 0;
			}
		}
	}
	last->next = NULL;
	free(elem);
	return result;	
}


