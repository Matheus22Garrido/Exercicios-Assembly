.data
    msg1: .asciiz "\nDigite seu número: "
    msg2: .asciiz "\nO resultado é: "
.text
main:
    # recebe valor
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall 
    add $t9, $v0, 0

    # verifica se é positivo ou negativo
    blt $t9, 0, negativo
    bgt $t9, 0, positivo

positivo:
    # caso número positivo
    mul $s0, $t9, 2
    j resultado

negativo:
    # caso número negativo
    mul $s0, $t9, 3
    j resultado

resultado:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    add $a0, $s0, 0
    syscall