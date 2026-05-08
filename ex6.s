.data
	msg1: .asciiz"\nDigite um numero: "
	msg2: .asciiz"\nErro so numeros positivos!!"
	msg3:.asciiz"\n O numero maior é: "
	msg4:.asciiz"\nO numero menor é: "
	
.text
main:
	li $t1, 0
volta:
	li $v0,4
	la $a0, msg2
	syscall
	j loop

loop:
	bge $t1 , 10 ,final
	li $v0, 4 
	la $a0, msg1
	syscall
	
	li $v0 , 5
	syscall
	add $t0, $v0, 0 ##t0 e o numero
	
	ble $t0, 0,volta #verifica se é negativo
	add $t1, $t1,1 # incrementa um no contador
	beq $t1, 1, primeironum #verifica se o contador é 1
	bgt $t0 , $t5, novomaior #verifica se o t2 e maior que o t3
	ble $t0, $t4, novomenor
	

	j loop
primeironum:
	add $t5,$t0,0 # t5e o maior e recebe o numero
	add $t4, $t0,0 #t4 e o menor
	
novomaior: 
	add $t5, $t0,0

	j loop
novomenor:
	add $t4, $t0,0

	j loop
	
	
	
	
final:
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0 ,1
	add $a0, $t5,0
	syscall
	
	li $v0,4
	la $a0, msg4
	syscall
	
	li $v0,1
	add $a0, $t4,0
	syscall	
