#  $v0 serve pra escrita e leitura
#  4 serve pra escrita de caracter
#  5 serve pra leitura de inteiros
#  1 serve pra escrita de inteiros

.data
    msg1: .asciiz "\nDigite o primeiro lado do terreno: "
    msg2: .asciiz "\nDigite o segundo lado do terreno: "
    msg3: .asciiz "\nA área do terreno é: "

.text
main:
    # lê o valor do primeiro lado
    li $v0, 4
    la $a0, msg1 
    syscall

    # salva o primeiro valor recebido no registrador
    li $v0, 5
    syscall
    add $t0, $v0, 0

    # lê a area do segundo lado
    li $v0, 4
    la $a0, msg2
    syscall 

    # salva o segundo valor recebido no outro registrador
    li $v0, 5
    syscall
    add $t1, $v0, 0

    # multiplica os lados
    mul $t2, $t1, $t0

    # mostra o resultado
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    add $a0, $t2, 0
    syscall