.data
	x: .word -1 # x < 0 || x == 0 || x > 0

.text
	main:
		la $t0, x
		lw $a0, 0($t0)
		
		# return 1
		addi $t1, $zero, 1
		# return -1
		sub $t2, $zero, 1
		
		jal sign
		
		li $v0, 10
		syscall
			
	sign:	
		bgt $a0, $zero, returnOne
		beq $a0, $zero, returnZero
		move $v0, $t2
		add $t3, $zero, $v0
		jr $ra
		
	returnOne:
		move $v0, $t1
		add $t3, $zero, $v0
		jr $ra
	
	returnZero:
		move $v0, $zero
		jr $ra
