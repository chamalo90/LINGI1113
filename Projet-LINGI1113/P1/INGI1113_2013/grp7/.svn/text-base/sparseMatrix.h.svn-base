//*******************************************************************************
//** Définitions SparseMatrix
//** Julien Colmonts - Vincent Van Ouytsel
//*******************************************************************************

#ifndef SPARSEMATRIX_H
#define SPARSEMATRIX_H

typedef struct Element Element;
struct Element{ // represents cells containing 1 in the Matrix.
	struct Element *next; 
	// Is the next elem (so next value != 0 in matrix)
	// this structure can be NULL if this elem is only followed by '0' in matrix.
	int rPos;
	int cPos;
	int value; 
};

typedef struct Sparsemat Sparsemat;
struct Sparsemat { //represents structure of a sparse matrix
	struct Element *first;
	int rows;
	int columns;
};

typedef struct SpMat_List SpMat_List;
struct SpMat_List {
	struct Sparsemat *elem;
	struct SpMat_List *next;
};

//free chained struct mat
void freeSparse(struct Sparsemat *mat);

//free spmat_list
void freeSparseList(struct SpMat_List *l);



// row n elem from column 1 to m
//@POST: matrices is a pointer to a list of sparse matrices (our struct) made from formatted file
Sparsemat* initMat(int content[], int rows, int columns);


int search(struct Sparsemat *mat, int rPos, int cPos);

//@ARG : A,B are pointer to sparse matrices to multiply, Result is a pointer to result matrix.
//@PRE : -
//@POST: Result now contains new matrix computed from multiplication of A & B.
Sparsemat* multiply(struct Sparsemat *A, struct Sparsemat *B);


int main();

#endif 
	
