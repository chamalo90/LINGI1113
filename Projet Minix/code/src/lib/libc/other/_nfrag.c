#include <lib.h>
#include <newcalls.h>
#include <unistd.h>

/**
* library function for nfrag syscall
* PARAM = file's path
*/
PUBLIC int nfrag(const char* path){
	message m;
	int r;
	m.m1_p1 = (char*) path; /*Message param for input = name1 m1_p1*/
	m.m1_i1 = (strlen(path) + 1);
	return _syscall(VFS_PROC_NR,NFRAG, &m);
}
