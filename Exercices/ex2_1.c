#include <stdlib.h>
#include <stdio.h>

void ordonnerTableau(long tableau[], long tailleTableau)
{
        long i,t,k=0;

        for(t = 1; t < tailleTableau; t++)
        {
                for(i=0; i < tailleTableau - 1; i++)
                {
                        if(tableau[i] > tableau[i+1])
                        {
                                k= tableau[i] - tableau[i+1];
                                tableau[i] -= k;
                                tableau[i+1] += k;
                        }
                }
        }
}


int main(int argc, char** args)
{
 if(argc != 2){
     printf("Error - Invalid args in %s\n", args[0]);
     exit(0);
 }
 int size = atoi(args[1]);
 long n[size], *p;
 int i =1;
 for(p=n; p<=&n[size-1]; p++){
   *p = (rand() % 300) + 1;
   printf("Position %d : nombre - %ld\n", i, *p);
   i++;
 }
 ordonnerTableau(n,size);
 i=1;
 long *a;
 for(a=n; a<=&n[size-1]; a++)
 {
	printf("Position %d : nombre - %ld\n", i, *a);
	i++;
 }
 exit(0);
}
