.data
    msg1: .asciiz "\nDigite seu primeiro número: "
    msg2: .asciiz "\nDigite seu segundo número: "
    msg3: .asciiz "\nO valor de C é: "
.text
main:
    # recebe n1
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t9, $v0, 0

    # recebe n2
    li  $v0, 4
    la  $a0, msg2
    syscall
    li $v0, 5
    syscall 
    add $t8, $v0, 0

    # verifica expressão a ser escolhida
    beq $t9, $t8, iguais
    bne $t9, $t8, diferentes

iguais:
    add $t7, $t9, $t8
    j resultado

diferentes:
    mul $t7, $t9, $t8
    j resultado

resultado:
    li $v0, 4
    la $a0, msg3
    syscall
    li  $v0, 1
    add $a0, $t7, 0
    syscall