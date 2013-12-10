#include <stdlib.h>
int getSize(int *rows, int *columns,FILE *file);
FILE* openInput(char* path);
int closeInput(FILE* file);
int readMatrix(int rows, int columns, FILE *file, int *tab);

