runall: test initmfs mountdisk createfiles runnfrags rundefrag clean
	@echo "Test Done"

rundefrag: 
	@cp /mnt/disk/file06 /root/test/
	@./test 2 /mnt/disk/file06& #testing defrag
	@sleep 3
	@echo "Diff between copy & defrag file"
	@diff /mnt/disk/file06 /root/test/file06
	@echo "End Diff"

runnfrags:
	./test 1 /mnt/disk/file06& #test on regular file
	@sleep 3
	./test 1 /mnt/disk& # test on repertory
	@sleep 3
	./test 1 /mnt/disk/file12& # test on non existing file

test: test.c
	@$(CC) -o test test.c

createfiles: 
	@dd if=/dev/zero of=/mnt/disk/file01 count=4 bs=1024 >/dev/null
	@dd if=/dev/zero of=/mnt/disk/file02 count=4 bs=1024 >/dev/null
	@dd if=/dev/zero of=/mnt/disk/file03 count=4 bs=1024 >/dev/null
	@dd if=/dev/zero of=/mnt/disk/file04 count=4 bs=1024 >/dev/null
	@dd if=/dev/zero of=/mnt/disk/file05 count=4 bs=1024 >/dev/null
	@rm /mnt/disk/file01 /mnt/disk/file04 
	@dd if=/dev/zero of=/mnt/disk/file06 count=16 bs=1024 >/dev/null #should create 3 fragments
	@echo "Files created"

initmfs:
	@echo "File System initialising..."
	@/sbin/mkfs.mfs /dev/c0d1
	@echo "File System initiated"

mountdisk: 
	@mkdir -p /mnt/disk
	@mount /dev/c0d1 /mnt/disk
	@echo "File system mounted"


checkfs:
	/sbin/fsck.mfs /dev/c0d1
	du /mnt/

clean :
	@rm -f /root/test/file06 
	@rm -rf /mnt/disk
	@umount /mnt/disk
	@echo "System Cleaned"
	
	
	
	
