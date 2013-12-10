#include <stdio.h>
#include <stdlib.h>

int* multiplyBis(int *matrixA, int rowsA, int columnsA, int *matrixB, int rowsB, int columnsB){
	int result[columnsA*rowsB];
	if(columnsA != rowsB){
		return NULL;
	}else{
		int i;
		int j;
		
		for(i=0; i<rowsA; i++){
			int tempRow[columnsA];			
			readRows(i, matrixA, columnsA, tempRow);
			for(j=0; j<columnsB; j++){
				int tempColumn[rowsB];
				readColumns(j, matrixB, rowsB, columnsB, tempColumn);
				result[((i*columnsA)+j)] = simpleMultiplication(tempRow, tempColumn, columnsA);
			}
		}
			
		return result;
	}
}

int readRows(int row, int *matrix, int columnNumber, int *tempRow){
	int i;
	int j=0;
	for(i = row*columnNumber ; i < ((row+1)*columnNumber) ; i++){
		tempRow[j] = matrix[i];
		j++;
	}
	return 0;
}

int readColumns(int column, int *matrix, int rowNumber, int columnNumber, int *tempColumn){
	int i;
	int j=0;
	for(i = column; i <= ((columnNumber*rowNumber-1)+column); i+rowNumber){
		tempColumn[j] = matrix[i];
		j++;
	}
	return 0;
}

int simpleMultiplication(int *row, int *column, int sizeTab){
	int tempValue = 0;
	int i;
	for(i = 0; i < sizeTab ; i++){
		tempValue += (row[i]*column[i]);
	}
	return tempValue;
}
