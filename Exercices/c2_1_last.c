#include <stdio.h>
#include <stdlib.h>
#define MAX_DIGITS 32
int main(){
	int num = getnum();
	int tmp , count;
	char chars[MAX_DIGITS];
	count = 0;
	tmp = num;
	do{
		chars[count] = tmp % 2;
		tmp = tmp/2;
		count++;
	}while(tmp);
	count = count - 1 ;
	while(count >= 0)
	{
		printf("%d",chars[count]);
		count--;
	}
	printf("\n");
	tmp=num;
	count=0;
	do{
		chars[count] = tmp % 10;
		tmp = tmp/10;
		count++;
	}while(tmp);
	count = count - 1 ;
	while(count >= 0)
	{
		printf("%d",chars[count]);
		count--;
	}
	printf("\n");
	tmp=num;
	count = 0;
	do{
		chars[count] = tmp % 16;
		tmp = tmp/16;
		count++;
	}while(tmp);
	count = count - 1 ;
	while(count >= 0)
	{
		if(chars[count] < 10)
			printf("%d",chars[count]);
		else{
			chars[count] = chars[count]-10 + 'A';
			printf("%c",chars[count]);
		}
		count--;
	}
	printf("\n");
	tmp=num;

	exit(EXIT_SUCCESS);
}

getnum(){
   int c, value;

   value = 0;
   c = getchar();
   while(c != '\n'){
      value = 10*value + c - '0';
      c = getchar();
   }
   return (value);
}
