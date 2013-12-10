#include <stdio.h>
#include <stdlib.h>

int main(){
 int args[5], *ip, f;
 args[0]= 0;
 args[1]= 2;
 ip= &args[1];
 printf("First Elem %d  Second Elem %d Location %p\n", args[0], *ip, ip);
 exit(0);
}
