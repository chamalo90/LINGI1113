#include <stdio.h>
#include <stdlib.h>

int sum(int* tab, int n, int acc);

int main()
{
  int tab[6]={1,3,4,2,7,2};
  int result=sum(tab,5,0);
  printf("Result is : %d\n",result);
  return 0;
}
