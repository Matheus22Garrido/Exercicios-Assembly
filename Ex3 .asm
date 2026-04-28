.data
    msg1: .asciiz "\nQuantas horas normais trabalhadas? "
    msg2: .asciiz "\nQuantas horas extras trabalhadas? "
    msg3: .asciiz "\nQual o desconto do salário? ((sem usar %) e (entre 0 e 100)): "
    msg4: .asciiz "\nSalário bruto: "
    msg5: .asciiz "\nSalário líquido: "

.text
main:
    # H normais
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    # H extras
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0

    # desconto
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 5
    syscall
    add $t2, $v0, 0

    # Aritmética
    mul $t9, $t0, 10
    mul $t8, $t1, 15
    add $s0, $t9, $t8 
    # porcentagem
    mul $t3, $s0, $t2
    div $s1, $t3, 100
    sub $s2, $s0, $s1

    # S bruto
    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    add $a0, $s0, 0
    syscall

    # S líquido
    li $v0, 4
    la $a0, msg5
    syscall
    li $v0, 1
    add $a0, $s2, 0
    syscall