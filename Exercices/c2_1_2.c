#include <stdio.h>
#include <stdlib.h>

/* array size */
#define NUMBER  10

main(){
   int arr[NUMBER], count, lo, hi;

   count = 0;
   while(count < NUMBER){
      printf("Type in a string: ");
      arr[count] = getnum();
      count = count+1;
   }
   lo = 0;
   while(lo < NUMBER-1){
      hi = lo+1;
      while(hi < NUMBER){
         int tmp;
         if(arr[lo] > arr[hi]){
            tmp = arr[lo];
            arr[lo] = arr[hi];
            arr[hi] = tmp;
         }
         hi = hi + 1;
      }
      lo = lo + 1;
   }
   /* now print them */
   count = 0;
   while(count < NUMBER){
      printf("%d\n", arr[count]);
      count = count+1;
   }
   exit(EXIT_SUCCESS);
}

getnum(){
   int c, value;;

   value = 0;
   c = getchar();
   while(c != '\n'){
      value = 10*value + c - '0';
      c = getchar();
   }
   return (value);
}
