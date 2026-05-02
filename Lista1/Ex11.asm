.data
    msg1: .asciiz "\nEscreva um número entre 0 e 100 (e se o número for negativo a contagem acaba): "
    msg2: .asciiz "\nEu disse pra colocar entre 0 e 100"
    msg3: .asciiz "\nA quantidade de números entre 0 e 25 é: "
    msg4: .asciiz "\nA quantidade de números entre 26 e 50 é: "
    msg5: .asciiz "\nA quantidade de números entre 51 e 75 é: "
    msg6: .asciiz "\nA quantidade de números entre 76 e 100 é: "
.text
main:
    # recebe valor
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

VerificaNegativo:
    # verifica se o numero digitado é maior q 0
    bge $t0, 0, VerificaZeroCem
    j ChamaFim

VerificaZeroCem:
    # verifica se o numero é valido, ou maior que 100
    ble $t0, 100, Válido
    bgt $t0, 100, AcimaDeCem

Válido:
    # numero ja foi verificado que é valido
    # ENTRE 0 E 25 = $s7
    # ENTRE 26 E 50 = $s6
    # ENTRE 51 E 75 = $s5
    # ENTRE 76 E 100 = $s4
    # $t0 = espaço temporário do número
    ble $t0, 25, inter1
    bgt $t0, 25, inter2

inter1: # $s7
    add $s7, $s7, 1
    j main

inter2: # $s6
    ble $t0, 50, inter22
    bgt $t0, 50, inter3

inter22:
    add $s6, $s6, 1
    j main

inter3: # $s5
    ble $t0, 75, inter32
    bgt $t0, 75, inter4

inter32:
    add $s5, $s5, 1
    j main

inter4: # $s4
    add $s4, $s4, 1
    j main

AcimaDeCem:
    # caso o numero digitado seja maior que 100
    li $v0, 4
    la $a0, msg2
    syscall
    j main

ChamaFim:
    # numero digitado foi negativo, então precisa fechar o ciclo
    # mostra inter1
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    add $a0, $s7, 0
    syscall

    # mostra inter2
    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    add $a0, $s6, 0
    syscall

    # mostra inter3
    li $v0, 4
    la $a0, msg5
    syscall
    li $v0, 1
    add $a0, $s5, 0
    syscall

    # mostra inter4
    li $v0, 4
    la $a0, msg6
    syscall
    li $v0, 1
    add $a0, $s4, 0
    syscall