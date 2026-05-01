.data
    msg1: .asciiz "\nDigite o valor da base maior: "
    msg2: .asciiz "\nDigite o valor da base menor: "
    msg3: .asciiz "\nDigite o valor da altura: "
    msg4: .asciiz "\nO valor da área do trapézio é: "
.text
main:
    # recebe base maior
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t9, $v0, 0

    # recebe base menor
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t8, $v0, 0

    # recebe altura
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t7, $v0, 0

    # calcula área
    add $s0, $t9, $t8
    div $s1, $s0, 2
    mul $s2, $s1, $t7

    # mostra resultado
    li $v0, 4
    la $a0, msg4
    syscall 
    li $v0, 1
    add $a0, $s2, 0
    syscall