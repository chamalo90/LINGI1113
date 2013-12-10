#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>


/*
 * PRE : le fichier est ouvert  et formatté correctement
 */
int getSize(int *rows, int *columns, FILE *file){
	int current = fgetc(file);
	if(current == EOF){
		return 1;
	}else{
		int tempSize = 0;
		do{
			if(current == 'x'){
				*rows = tempSize;
				tempSize = 0;
				current = fgetc(file);
			}else{
				tempSize *= 10;
				tempSize += current - '0';
				current = fgetc(file);
			}
		}while(current != '\n');
		*columns = tempSize;
	}
	return 0;
}

FILE* openInput(char *path){
	FILE* file = fopen(path, "r");
	if(file == NULL){
		printf("Error opening file : %s\n", strerror(errno)); 
	}
	return file;
}

int closeInput(FILE* file){
	int r = fclose(file);
	if(r != 0){
		printf("Error closing file: %s\n", strerror(errno));
		return -1;
	}else{
		return 0;
	}
}


/*
* PRE : file is open & correctly formatted - tab is initialised at size n*m - rows & columns are right informations 
*	about matrix which is going to be read
*/
int readMatrix(int rows, int columns, FILE *file, int *tab){

int current = 0;
	int i=0;
	while(i<rows){
		int j=0;
		while(j<columns){
			current = findNextInt(file);
			printf("Je sauve %d en %d \n", current, ((i*rows)+j));
			tab[(i*rows)+j] = (current);
			j++;
		}
		i++;
	}
	current = fgetc(file); //Tuer le dernier '\n' - Encore utile???
}

int findNextInt(FILE *file){
	int entier = 0;
	int currentChar = 0;
	
	currentChar = fgetc(file);
	while(currentChar != ' ' && currentChar != '\n'){		
		entier *= 10;
		entier += (currentChar-'0');
		currentChar = fgetc(file);
	}
	return entier;
}

/*
	int i;
	int j;
	char c = fgetc(file);
	char space = fgetc(file); // variable use to check read operation on space & '\n' char
	for(i=0; i<rows; i++){
		for(j=0; j<columns; j++){
			if(c == EOF || (c != '0' && c != '1')){ // first 'if else' block fills tab
				printf("Error while reading matrix elements : %s\n", strerror(errno));
				return -1;
			}else{
				tab[i*columns + j] = c - '0';
			}
			//second 'if else' block checks if read operation can continue
			if(space == EOF && i == rows-1 && j== columns-1){ // End of input file
				return 1;
			}else if(space == EOF){
				return -1;
			}else if((i != rows-1) || (j!= columns-1)){
				c = fgetc(file);
				space = fgetc(file);
			}
		}
	}
	return 0;
}*/

