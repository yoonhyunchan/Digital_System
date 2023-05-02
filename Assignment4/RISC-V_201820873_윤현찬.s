	.text
	.align	2
	.globl bubblesort
bubblesort:
	#############################
	addi a4, zero, 4
	addi a1, zero, 9
	slli a1, a1, 2
	add a0, zero, zero
	add t0, zero, zero 
    	add t1, zero, zero
	add t2, zero, zero 
	

.LOOP:  
	add  t2, s1, t1  
	addi  t1, t1, 4
	add t3, t1, t0  
	beq t3, a1, .TLOOP  
	lw a0, 0(t2)
    	lw a2, 4(t2)
    	blt a2, a0, .SWAP  
	beq zero, zero, .LOOP   

.SWAP: 
    	sw a0, 4(t2)  
    	sw a2, 0(t2)
    	beq zero, zero, .LOOP

.TLOOP:
	add t1, zero, zero  
	addi t0, t0, 4  
	blt t0, a1, .LOOP

	
	#############################
	xor a0, a0, a0
	jalr	zero, 0(ra)
	############################

	.align 2
	.globl print_array
print_array:
	# Argument: a0 - base address of array
	# Argument: a1 - end offset of array
	add	t1, zero, zero # byte offset of array
	add	t3, zero, a0 # t3 base addr
.PLOOP:
	add 	t2, t3, t1
	lw	a0, 0(t2)
	addi	t0, zero, 1 # t0 is reserved for syscall 
	ecall
	addi	t1, t1, 4
	bne	t1, s2, .PLOOP
	jalr	zero, 0(ra)

	.align	2
	.globl main
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s2,4(sp)
	sw	s1,0(sp)
	lui s1, %hi(ARRAY) 
	addi s1, s1, %lo(ARRAY) # s0 has the addr of ADDR
	lw	s2, -4(s1) # s1 = # size of ADDR
	slli	s2, s2, 2
	lui a0, %hi(MSG1)
	addi a0, a0, %lo(MSG1)
	addi a1, zero, 16
	addi t0, zero, 3
	ecall
	jal	ra, bubblesort
	###################
	lui a0, %hi(MSG2)
	addi a0, a0, %lo(MSG2)
	addi a1, zero, 14
	addi t0, zero, 3
	ecall
	# print sorted array
	add	a0, zero, s1
	add	a1, zero, s2
	jal	ra, print_array 
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s2,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,-16
	jalr	zero, 0(ra)

	.rodata
MSG1:
	.word 0x4f534e55 # UNSORTED ARRAY:
	.word 0x44455452 
	.word 0x52524120 
	.word 0x0a3a5941 
	# 15 chars
MSG2:
	.word 0x54524f53 # SORTED ARRAY:
	.word 0x41204445
	.word 0x59415252
	.word 0x00000a3a
	# 13 chars

	.data
	.align 2
	####################################
	#           ARRAY DATA             #
	####################################
ARRAY_SIZE:
	.word 9
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