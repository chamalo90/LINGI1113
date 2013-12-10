#include <stdio.h>
#include <string.h>
#include <newcalls.h>

int main(int argc, char *args[]){
	int type;
	char ** str;
	if(argc != 3){
		printf("Wrong argc number\n");
		return -1;
	}
	type = args[1][0] - '0';
	if(type == 1){ /* TEST ON NFRAG*/
		type = nfrag(args[2]);
		if(type <0){
			perror("Test stopped");
		}else{
			printf("TEST NFRAGS res :%d\n",type);
		}
	}else{ /*TEST ON DEFRAG*/
		type = defrag(args[2]);
		if(type <0)  perror("Test stopped");
		else printf("TEST DEFRAGS res :%d\n",type);
	}
}


