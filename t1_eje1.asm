

.data

.text
main:
	addiu $s0, $zero, 3 		#s0
	addiu $s1, $zero, 5		#s1a	
	addiu $s2, $zero, 3		#s2b
	addiu $s3, $zero, 0		#s3c
	addiu $s4, $zero, 1  		#case1
	addiu $s5, $zero, 2 		#case2
	addiu $s6, $zero, 3 		#case3

case1: 	
	bne $s0, $s4,case2
	jal suma
	j exit
case2: 	
	bne $s0,$s5,case3 
	jal rest
	j exit
case3:	
	bne $s0, $s6, case4
	jal multi
	j exit

case4: 	
 	jal andBitwise
 	j exit 
	

suma:
	addiu $s3, $zero, 0
	add $s3, $s1, $s2
	jr $ra
rest:	
	addiu $s3, $zero, 0
	sub $s3, $s1, $s2
	jr $ra

multi:
	addiu $s3, $zero, 0
	mul $s3, $s1, $s2
	jr $ra
	
andBitwise:
	addiu $s3, $zero, 0
	and $s3, $s1, $s2
	jr $ra 


	
exit:
		
