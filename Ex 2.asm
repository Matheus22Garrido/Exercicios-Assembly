.data
    msg1: .asciiz "\nQuantas camisetas pequenas vai comprar? "
    msg2: .asciiz "\nQuantas camisetas médias vai comprar? "
    msg3: .asciiz "\nQuantas camisetas grandes vai comprar? "
    msg4: .asciiz "\nValor total a pagar: "

.text
main:
    # P
    li $v0, 4
    la $a0, msg1
    syscall 
    li $v0, 5
    syscall
    add $t0, $v0, 0

    # M
    li $v0, 4
    la $a0, msg2
    syscall 
    li $v0, 5
    syscall
    add $t1, $v0, 0

    # G
    li $v0, 4
    la $a0, msg3
    syscall 
    li $v0, 5
    syscall
    add $t2, $v0, 0

    # Aritmetica
    mul $s0, $t0, 10
    mul $s1, $t1, 12
    mul $s2, $t2, 15
    add $t5, $s0, $s1
    add $t6, $s2, $t5

    # Resultado
    li $v0, 4
    la $a0, msg4
    syscall 
    li $v0, 1
    add $a0, $t6, 0
    syscall