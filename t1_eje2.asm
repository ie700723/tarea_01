.data
	
	Vector_1: .word 1, 2, 3, 4, 5, 6, 7, 8 ,9 #vector1 en memoria 
	Vector_2: .word -1, 2, -3, 4, -5, 6, -7, 8, -9 #vector 2 en memoria
	
.text 
main:
	addi $s0, $zero, 0 #i
	addi $s1, $zero, 0 # result 
	addi $s2, $zero, 9
	addi $t0, $zero, 0 
	la $t3, Vector_1
	la $t4, Vector_2
	jal while


while:	
	slti $t0, $s0, 9
	beq $t0, $zero, exit
	addi $s0, $s0, 1
	
	

	addi $sp, $sp, -8
	sw $t3, 0($sp)
	sw $t4, 4($sp)
	
	jal ProductFunction
	
	sw $t3, 0($sp)
	sw $t4, 4($sp)
	addi $sp, $sp, -8
	add $s1, $s1, $v0

	j while
	
ProductFunction:
		lw $a0, 0($sp)
		lw $a1, 4($sp)
		mul $v0, $a0, $a1
		jr $ra

exit:
