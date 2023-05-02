main:
	.data
addi a0, a0, 9
addi s1, zero, 136
add t0, zero, zero
add t1, zero, zero
add t2, zero, zero

.LOOP:
	addi t0, t0, 4
	beq t0, a0, .End
	lw a1, 0(s1)
	lw a2, 4(s1)
	bge a1, a2, .SWAP 

.SWAP:
	sw a1,4(s1)
	sw a2,0(s1)
	bge a1, a2, .LOOP

.End:
	
 











####################
ARRAY:	
	.word 4
	.word 9
	.word 11
	.word 3
	.word 15
	.word 5
	.word 6
	.word 8
	.word 0