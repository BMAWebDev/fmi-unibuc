.data
  n: .word 3
  z: .space 4

.text
  main:
    lw $t0, n
    blt $t0, $zero, exit
    li $t1, 3
    li $t4, 1

    blt $t0, $t1, fib_end
    li $t2, 1
    li $t3, 1
    add $t4, $t2, $t3
    
    fib_start:

      beq $t1, $t0, fib_end #if index == n
      add $t2, $t3, $0      #penultimul
      add $t3, $t4, $0      #ultimul
      add $t4, $t2, $t3     #curent
      addi $t1, $t1, 1      #index

      j fib_start

    fib_end:
    
      sw $t4, z #rezultatul
      j exit

    exit:
    
      li $v0, 10
      syscall
