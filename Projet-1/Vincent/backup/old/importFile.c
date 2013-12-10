#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include "sparseMatrix.h"

FILE* openFile(char *path){
	FILE* file = fopen(path, "r");
	
	if(file != NULL){
		return file;
	}else{
		printf("Can't open the file\n");
		fprintf(stderr, "Erreur : errno=%d %s\n", errno, strerror(errno));
		return NULL;
	}
}

void closeFile(FILE *file){
	fclose(file);
}

/*
 * PRE : le fichier est ouvert
 */
void fillTab(FILE *file, int *tab, int n, int m, int *endOfFile){
	int current = 0;
	int i=0;
	while(i<n){
		int j=0;
		while(j<m){
//Amelioration pour pas juste lire un char mais tout un int
			current = findNextInt(file);
//			current = fgetc(file);
			printf("Je sauve %d en %d \n", current, ((i*n)+j));
			tab[(i*n)+j] = (current/*-'0'*/);
//			current = fgetc(file); //Selon les specifications un espace separe les nombres dans la matrice
			j++;
		}
//		current = fgetc(file); //pour passer les '\n'
		i++;
	}
	current = fgetc(file); //Tuer le dernier '\n'
	if(current == EOF) *endOfFile = 1;
	//return tab;
}

//Pour essayer de rendre les 2 autres méthodes plus propre
int findNextInt(FILE *file){
	int entier = 0;
	int currentChar = 0;
/*	do{
		currentChar = fgetc(file);
		entier *= 10;
		entier += (currentChar-'0');				
		currentChar = fgetc(file);
	}while(currentChar != ' ' ||currentChar != 'x' || currentChar !='\n');
*/
	currentChar = fgetc(file);
	while(currentChar != ' ' && currentChar != '\n' && currentChar != 'x'){		
		entier *= 10;
		entier += (currentChar-'0');
		currentChar = fgetc(file);
	}
	return entier;
}

/*
 * PRE : le fichier est ouvert
 * POST : lit une ligne de fichier du type NxM et modifie les valeurs indiquée par les pointeurs par celles lue dans le fichier.
 * 	 Si la fonction arrive sur le caractère de fin de fichier, la variable endOfFile est mise à 1.
 */
int matriceDimensions(FILE *file, int *n, int *m, int *endOfFile){
	int current = fgetc(file);
	if(current == EOF){
		*endOfFile = 1;
	}else{
		int tempSize = 0;
		do{
			if(current == 'x'){
				*n = tempSize;
				tempSize = 0;
				current = fgetc(file);
			}else{
				tempSize *= 10;
				tempSize += (current-'0');
				current = fgetc(file);
			}
		}while(current != '\n');
		*m = tempSize;
	}
	return 0;
}

int main(int arg, char *argv[]){
	//int result = importFile("matrice.txt");
	FILE *file = openFile("matrice.txt");
	
	int m = 0; int n = 0 ; int endOfFile = 0;
	matriceDimensions(file, &n, &m, &endOfFile);
	
	int tab[n*m];
	fillTab(file, tab, n, m, &endOfFile);
	
	return 0;
}
