.data
    msg1: .asciiz "\nDigite a altura em centimetros: "
    msg2: .asciiz "\nA maior altura é: "
    msg3: .asciiz "\nA menor altura é: "
.text
main:
    # recebe altura
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    # faz continha
    add $t4, $t4, 1
    beq $t4, 1, if
    bgt $t4, 1, else

if: 
    # se o contador estiver em 1, determina os padrões
    add $s0, $t0, 0
    add $s1, $t0, 0
    j main

else:
    bgt $t4, 15, chamafim
    bgt $t0, $s0, maior
    blt $t0, $s1, menor
    j main

maior:
    # numero colocado é maior q o maior
    mul $s0, $s0, 0
    add $s0, $t0, 0
    j main
menor:
    # numero colocado é menor q o menor
    mul $s1, $s1, 0
    add $s1, $t0, 0
    j main

chamafim:
    # mostra maior altura
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    add $a0, $s0, 0
    syscall

    # mostra menor altura
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    add $a0, $s1, 0
    syscall