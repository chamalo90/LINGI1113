//*******************************************************************************
//** Définitions Matrix
//** Julien Colmonts - Vincent Van Ouytsel
//*******************************************************************************

#ifndef MATRIX_H
#define MATRIX_H
typedef struct Mat_List Mat_List;
struct Mat_List {
	int* mat;
	int rows;
	int columns;
	struct Mat_List *next;
};

//@ARG : A,B are pointer to sparse matrices to multiply, Result is a pointer to result matrix.
//@PRE : -
//@POST: Result now contains new matrix computed from multiplication of A & B.
int* multiplyBis(int *matrixA, int rowsA, int columnsA, int *matrixB, int rowsB, int columnsB);

void readRows(int row, int *matrix, int columnNumber, int *tempRow);

void readColumns(int column, int *matrix, int rowNumber, int columnNumber, int *tempColumn);

int simpleMultiplication(int *row, int *column, int sizeTab);

#endif  // SPARSEMATRIX_H

	
