.data
    msg1: .asciiz "\nDigite seu número: "
    msg2: .asciiz "\nO resultado da soma é: "
.text
main:
    # recebe valor
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall 
    add $t9, $v0, 0

    # verifica se é par ou ímpar
    rem $s0, $t9, 2
    beq $s0, 0, if
    bne $s0, 0, else

if: 
    # caso número par
    add $s1, $t9, 5

    j resultado

else:
    # caso número ímpar
    add $s1, $t9, 8

    j resultado

resultado:
    # mostra resultado
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    add $a0, $s1, 0
    syscall