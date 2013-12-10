#include "fs.h"
#include "buf.h"
#include "inode.h"
#include "super.h"
#include <stdio.h>
#include <minix/vfsif.h>

int fs_nfrag()
{
	struct inode *in;
	int fragments;
	if((in = get_inode(fs_dev, (ino_t) fs_m_in.REQ_INODE_NR))== NULL) return EINVAL; /* get the inode */
	fragments = count(in); /* count fragments */
	put_inode(in); /* put inode back */
	printf("frags : %d\n",fragments);
	fs_m_out.RES_FRAGS = fragments;
	return 0;
}

int fs_defrag()
{
	struct inode *in;
	int fragments, state, zone_number, block_per_zone, offset, block_counter;
	struct super_block *super_bl;
	bit_t first_bit, it_bit;
	zone_t new_zone;
	block_t input_b, output_b;
	struct buf *src_buf, dst_buf;
	if((in=get_inode(fs_dev, (ino_t) fs_m_in.REQ_INODE_NR)) == NULL) return EINVAL;
	fragments = count(in);
	if(fragments <= 1){
		/* no need to defrag */
		printf("No need to defrag, contiguous file\n");
		fs_m_out.RES_FRAGS = fragments;
		return 0;
	}
	printf("Beginning defrag, frags:%d\n", fragments);
	super_bl = in->i_sp;
	block_per_zone = 1<< log_zone_size;
	zone_size = super_bl->s_block_size * block_per_zone; 
	zone_number = in->i_size / zone_size;
	if(in->i_size % zone_size > 0){ /* file size does not fit in integer number of zones */
		zone_number++;
	}
	
	first_bit = find_n_contig_zone(super_bl->s_dev, zone_number);
	if(first_bit == NO_BIT){ /* no space found */
		fs_m_out.RES_FRAGS = fragments;
		return ENOSPC;
	
	}else{ /* need to allocate zone_number zones in zmap*/
		it_bit = first_bit
		for(;zone_number>0; zone_number--){
			alloc_bit(super_bl->s_dev, ZMAP, it_bit);
			it_bit ++;
		}
	}
	new_zone = first_bit + sp->s_firstdatazone - 1;
	output_b = new_zone << log_zone_size;
	
	for(offset=0; offset<in->i_size; offset+=in->i_sp->s_block_size, output_b++){
		input_b = read_map(in,offset);
		src_buf = get_block(in->i_dev, input_b, NORMAL);
		dst_buf = get_block(in->i_dev, output_b , NORMAL);
		memcpy(dst_buf->b_data, src_buf->b_data, (size_t) src_buf->b_bytes);
		dst_buf->b_dirt = DIRTY;
		if(in->i_size % zone_size > 0 && offset + in->i_sp->s_block_size >in->i_size){ /* file size does not fit in integer number of zones */
			put_block(src_buf, PARTIAL_DATA_BLOCK);
			put_block(dst_buf, PARTIAL_DATA_BLOCK);
		}else{
			put_block(src_buf, FULL_DATA_BLOCK);
			put_block(dst_buf, FULL_DATA_BLOCK);
		}
	}
	
	for(offset=0; offset<in->i_size; offset+=zone_size){
		write_map(in, offset, NO_ZONE, WMAP_FREE);
		write_map(in, offset, newzone++, 0);
	}
	
	fragments = count(in)

	put_inode(in); /* put inode back */
	printf("defrag done fragments : %d (should be 1)\n",fragments);
	fs_m_out.RES_FRAGS = fragments;
	return 0;
}

int count(struct inode *in){
	struct super_block *super_bl;
	unsigned log_zone_size, zone_size, block_per_zone, frags, offset;

	block_t next_zone_block; /* pointer to expected first block in next zone */
	block_t current_zone_block; /* pointer to current block */
	
	frags = 0;
	super_bl = in->i_sp;
	log_zone_size = super_bl->s_log_zone_size;
	block_per_zone = 1<< log_zone_size;
	zone_size = super_bl->s_block_size * block_per_zone; 

	next_zone_block = -1;
	frags = 0;

	for(offset = 0; offset < in->i_size; offset+=zone_size){
		if(next_zone_block != (current_zone_block=read_map(in,offset))){
			next_zone_block = current_zone_block;
			frags++;
		}
		next_zone_block += block_per_zone;
	}
	
	return frags;
	
}

