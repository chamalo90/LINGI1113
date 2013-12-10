#include <stdlib.h>
#include <stdio.h>

int main(int argc, char** args){
 if(argc != 3){
	printf("Error - Wrong args in %s execution\n", args[0]);
	exit(0);
 }
 int m = atoi(args[1]);
 int n = atoi(args[2]);
 int sum = m + n;
 printf("%d + %d = %d \n", m , n , sum);
 exit(0);
}
