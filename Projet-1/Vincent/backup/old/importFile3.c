#include <stdlib.h>
#include <stdio.h>
#include "sparseMatrix.h"

int /*Liste de sparseMatrix*/ importFile(char *path){
	FILE* file = fopen(path, "r");
	
	if(file!=NULL){	
		int endOfFile = 0;
		int n = 0;
		int m = 0;

		while(!endOfFile){
			matriceDimensions(file, &n, &m, &endOfFile);
			printf("n : %d & m : %d \n", n, m);
			
			int tab[n*m];
			fillTab(file, tab, n, m, &endOfFile);
			
//Ne tourne pas pour le moment, en attente que la structure soit ok
			Sparsemat *sparseMatrix;
			initMat(tab, n, m, sparseMatrix);
		}
		
	}else{
		printf("Can't open the file");
	}
	fclose(file);
}



/*
 * PRE : le fichier est ouvert
 */
int fillTab(FILE *file, int *tab, int n, int m, int *endOfFile){
	int current = 0;
	int i=0;
	while(i<n){
		int j=0;
		while(j<m){
//Amelioration pour pas juste lire un char mais tout un int
//			current = findNextInt(file);
			current = fgetc(file);
			printf("Je sauve %c en %d \n", current, ((i*n)+j));
			tab[(i*n)+j] = (current-'0');
			current = fgetc(file); //Selon les specifications un espace separe les nombres dans la matrice
			j++;
		}
//		current = fgetc(file); //pour passer les '\n'
		i++;
	}
	current = fgetc(file); //Tuer le dernier '\n'
	if(current == EOF) *endOfFile = 1;
	return 0;
}

//Pour essayer de rendre les 2 autres méthodes plus propre
int findNextInt(FILE *file){
	int entier = 0;
	int currentChar = 0;
	do{
		currentChar = fgetc(file);
		entier *= 10;
		entier += (currentChar-'0');		
	}while(currentChar != ' ' ||currentChar != 'x' );

	return entier;
}

/*
 * PRE : le fichier est ouvert
 * POST : lit une ligne de fichier du type NxM et modifie les valeurs indiquée par les pointeurs par celles lue dans le fichier.
 * 	 Si la fonction arrive sur le caractère de fin de fichier, la variable endOfFile est mise à 1.
 */
int matriceDimensions(FILE *file, int *n, int *m, int *endOfFile){
	int current = fgetc(file);
	printf("current %c \n", current);
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
				printf("Ok tempSize : %d \n", tempSize);
				current = fgetc(file);
			}
		}while(current != '\n');
		*m = tempSize;
	}
	return 0;
}

int main(int arg, char *argv[]){
	int result = importFile("matrice.txt");
	return 0;
}
