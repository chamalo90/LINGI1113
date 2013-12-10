//*******************************************************************************
//** Définitions Matrix
//** Julien Colmonts - Vincent Van Ouytsel
//*******************************************************************************

#ifndef MATRIX_H
#define MATRIX_H

int matrix[][];

//@ARG : A,B are pointer to sparse matrices to multiply, Result is a pointer to result matrix.
//@PRE : -
//@POST: Result now contains new matrix computed from multiplication of A & B.
int* multiply(int *matrixA, int rowsA, int columnsA, int *matrixB, int rowsB, int columnsB);

void readRows(int row, int *matrix, int columnNumber, int *tempRow);

void readColumns(int column, int *matrix, int rowNumber, int columnNumber, int *tempColumn);

int simpleMultiplication(int *row, int *column, int sizeTab);

#endif  // SPARSEMATRIX_H

	
