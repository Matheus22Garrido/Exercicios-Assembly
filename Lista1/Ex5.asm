.data
    msg1: .asciiz "\nDigite o valor do primeiro cateto: "
    msg2: .asciiz "\nDigite o valor do segundo cateto: "
    msg3: .asciiz "\nO valor da hipotenusa é: "
.text
main:
    # recebe cateto1
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t9, $v0, 0

    # recebe cateto2
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    add $t8, $v0, 0

    # verifica maior menor
    bgt $t9, $t8 maior
    blt $t9, $t8 menor

maior:
    # $t0 = maior e $t1 = menor
    add $t0, $t9, 0
    add $t1, $t8, 0
    j aritmetica

menor:
    # $t0 = maior e $t1 = menor
    add $t0, $t8, 0
    add $t1, $t9, 0
    j aritmetica

aritmetica:
    # melhor aproximação pra teorema de pitágoras sem poder usar raiz quadrada é "C = B + (A*A)/(2*B)"
    mul $s0, $t1, $t1
    mul $s1, $t0, 2
    div $s2, $s0, $s1
    add $s3, $s2, $t0

    # mostra resultado
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    add $a0, $s3, 0
    syscall