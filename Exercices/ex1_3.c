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


int main()
{
 long n[50], *p;
 int i =1;
 for(p=n; p<=&n[49]; p++){
   *p = rand() % 300;
   printf("Position %d : nombre - %ld\n", i, *p);
   i++;
 }
 ordonnerTableau(n,50);
 i=1;
 long *a;
 for(a=n; a<=&n[49]; a++)
 {
	printf("Position %d : nombre - %ld\n", i, *a);
	i++;
 }
 exit(0);
}
