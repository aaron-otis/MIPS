test1: .word 0x0001004F

.text

    .globl main

main:
    lw $a0, test1
    jal countbits
    move $t0, $v0
    li $v0, 10
    syscall

countbits: move $v0, $zero
    ori $t0, $zero, 1

loop: and $t1, $t0, $a0
    beq $t1, $zero, notset
    addi $v0, $v0, 1

notset: sll $t0, $t0, 1
    bne $t0, $zero, loop

ret: jr $ra

.end
