/************************************************
*** Function bound to syscalls nfrag & defrag ***
************************************************/
#include "fs.h"
#include "param.h"
#include "vnode.h"
#include <minix/vfsif.h>

PUBLIC int do_nfrag(){
	/* Input
	*  Path: name1 m1_p1
	*/
	struct vnode *vn;
	int requestState;
	if(fetch_name(m_in.name1,m_in.name1_length, M1) != OK) return err_code; /* Check if file from path exist. */
	printf("name fetched\n");
	vn=eat_path(PATH_NOFLAGS,fp); /* get vnode from path */
	printf("eat path done\n");
	if(vn == NULL) return err_code; /* check eatpath success */
	if((vn->v_mode & I_TYPE) != I_REGULAR) /* check if regular file & permission to access it. */
	{
		put_vnode(vn);
		return EPERM; 
	}
	if (vp->v_ref_count != 1) return(EBUSY);

	printf("Send request to request.c\n");
	requestState = req_nfrag(vn->v_fs_e, vn->v_inode_nr); /* Throw request to fs process */
	put_vnode(vn);
	return requestState;
}

PUBLIC int do_defrag(){
	/* Input
	*  Path: name1 m1_p1
	*/
	struct vnode *vn;
	int requestState;if (vp->v_ref_count != 1) return(EBUSY);
	if(fetch_name(m_in.name1,m_in.name1_length, M1) != OK) return err_code; /* Check if file from path exist. */
	printf("name fetched\n");
	vn=eat_path(PATH_NOFLAGS,fp); /* get vnode from path */
	printf("eat path done\n");
	if(vn == NULL) return err_code; /* check eatpath success */
	if((vn->v_mode & I_TYPE) != I_REGULAR) /* check if regular file & permission to access it. */
	{
		put_vnode(vn);
		return EPERM; 
	}
	printf("Send request to request.c\n");
	requestState = req_defrag(vn->v_fs_e, vn->v_inode_nr); /* Throw request to fs process */
	put_vnode(vn);
	return requestState;
}




