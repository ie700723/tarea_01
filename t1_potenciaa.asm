
.data

.text	
	addi $a1, $zero,6 #n
	addi $a2, $zero,6 #m
	
	jal Potencia 
	j Exit

Potencia:
	slti $t0, $a1, 1 
	beq $t0, $zero, Ciclo
	addi $v0, $zero, 1 
	jr $ra

Ciclo:	
	addi $sp, $sp,-12 	# Decreasing the stack pointer
	sw $a2 8($sp) 		#stroing m
	sw $ra 4($sp) 		# Storing n
	sw $a1, 0($sp) 		#  Storing the resturn address
	addi $a1, $a1, -1 	# Decreasing n
	jal Potencia 		# recursive function
	lw $a1, 0($sp) 		# Loading values from stak
	lw $ra, 4($sp) 		# Loading values from stak
	lw $a2, 8($sp)
	addi $sp, $sp, 12 	# Increasing stack pointer
	mul $v0, $a2, $v0 	# Multiplying m*Factorial(n-1)
	jr $ra  		# Return to the caller

Exit: