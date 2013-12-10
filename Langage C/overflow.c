#include <stdio.h>

/* overflow.c
 *
 * Ce programme montre comment exécuter une fonction par écrasement de
 * l'adresse de retour sur la pile. Normalement seule normal_function
 * est appelée, mais lors de l'exécution on verra que le printf de 
 * bad_function s'exécutera. 
 *
 * Explication : Dans normal_function, ap est un pointeur vers a, 
 * *ap est une zone où l'on peut écrire mais on ne le fait pas, elle 
 * reste indéfinie. *(ap+3) pointe 12 (3*sizeof(int)) octets plus haut.
 * Si l'on exécute le programme sous gdb, on observe que cet emplacement
 * correspond à l'endroit où l'adresse de retour de la fonction a été empilée.
 * On remplace l'adresse de retour (quelque part dans main) par celle du 
 * début de bad_function.
 *
 * Une version améliorée de ce programme pourrait, au lieu de simplement
 * écraser l'adresse de retour, la stocker quelque part pour la récupérer 
 * ensuite et s'arranger pour que le return de bad_function revienne dans la
 * fonction main, de telle manière que l'exécution se termine sans segfault.
 *
 * Si on ne veut faire que du C, cela peut être compliqué, par contre je 
 * pense qu'avec une ligne en langage d'assemblage à la place du return
 * on peut y arriver facilement (il s'agit d'un simple jump). Peut-être
 * pour une prochaine version.
 *
 * Auteur : Sébastien Barré.
 * Date : mars 2007.
 */

void bad_function()
{
    printf("This is the bad function\n");
    /* Ceci déclenchera une segmentation fault, puisque la return address
     * n'est plus correcte.
     */
    return;
}

int normal_function()
{
    int a;
    int* ap=&a;

    *(ap+3)=(int)&bad_function;
    return 1;
}


int main(int argc, char* argv[])
{
    char chaine[20];

    normal_function();
    return 0;
}
