//*******************************************************************************
//** Définitions Matrix
//** Julien Colmonts - Vincent Van Ouytsel
//*******************************************************************************

#ifndef MATRIX_H
#define MATRIX_H

int matrix[][];


//@ARG : path to  txt file containing matrix to compute
//@PRE : path is on a valid format
// *** FORMAT ***
// rows x columns
// row 1 elem from column 1 to m
// ...
// row n elem from column 1 to m
//@POST: matrices is a pointer to a list of sparse matrices (our struct) made from formatted file
void initMat(char** path, struct sparsemat **matrices);

//@ARG : A,B are pointer to sparse matrices to multiply, Result is a pointer to result matrix.
//@PRE : -
//@POST: Result now contains new matrix computed from multiplication of A & B.
void multiply(struct sparsemat *A, struct sparsemat *B, struct sparsemat *Result);





#endif  // SPARSEMATRIX_H

	
