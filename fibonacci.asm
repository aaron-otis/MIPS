.data

msgfib: .asciiz "Give a Fibonacci Number: "
.text
.globl main



main:
   
   li $v0,4 #start of fibonacci
   la $a0,msgfib
   syscall
   li $v0,5
   syscall
   add $a0,$v0,$zero

   jal fibonacci

   add $a0,$v0,$zero
   li $v0,1
   syscall

   li $v0,10
   syscall #end of fibonacci


fibonacci: 
   
   addi $sp,$sp,-12 #save in stack
   sw $ra,0($sp)
   sw $s0,4($sp)
   sw $s1,8($sp)
   add $s0,$a0,$zero
   addi $t1,$zero,1
   beq $s0,$zero,return0
   beq $s0,$t1,return1
   addi $a0,$s0,-1
   
   jal fibonacci
   
   add $s1,$zero,$v0
   addi $a0,$s0,-2
   
   jal fibonacci
   
   add $v0,$v0,$s1
   exitfib:
   
   lw $ra,0($sp)
   lw $s0,4($sp)
   lw $s1,8($sp)
   addi $sp,$sp,12
   jr $ra
   
   return1:
    li $v0,1
    j exitfib
   return0 :     li $v0,0
    j exitfib