#include <stdio.h>
#include <stdlib.h>
#include "sparseMatrix.h"

SparseMatList *initList(){
	SparseMatList *sparseMatList = malloc(sizeof(*sparseMatList));
	sparseMatList->first = NULL;
	sparseMatList->size = 0;

	return sparseMatList;
}

SparseMatList *initList(Sparsemat *sparseMat){
	SparseMatList *sparseMatList = malloc(sizeof(*sparseMatList));
	ListElement *listElem = malloc(sizeof(*listElem));

	listElem->sparseMatrix = sparseMat;
	listElem->next = NULL
	
	sparseMatList->first = sparseMatrix;
	sparseMatList->size = 1;

	return sparseMatList;
}

void add(SparseMatList *sparseMatList, Sparsemat *sparseMat){
	ListElement *newElem = malloc(sizeof(*newElem);
	newElem->sparseMatrix = sparseMat;
	newElem->next = sparseMatList->first;
	
	sparseMatList->first = newElem;
	sparseMatList->size ++;
}

Sparsemat *removeFirst(SparseMatList *sparseMatList){
	if(sparseMatList->size == 0){
		return NULL;
	}else{
		ListElement *tempElem = sparseMatList-> first;
/*		ListElement *tempElem = malloc(sizeof(*tempElem));
		tempElem = sparseMatList-> first;
*/		sparseMatList->first = tempElem->next;
		sparseMatList->size --;
		
		Sparsemat *sparseMat = malloc(sizeof(*sparseMat));
		sparseMat = tempElem->sparseMatrix;
		free(tempElem);
		return sparseMat;
	}
}
