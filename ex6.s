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
	
	ble $t0, 0,volta
	add $t1, $t1,1
	beq $t1, 1, faixa
	bgt $t2 , $t3, t2maior
	j t3maior
	

	j loop
faixa:
	add $t3,$t0,0 # t3 e o maior e recebe o numero
	add $t2, $t0,0 #t2 e o menor
	
t2maior: 
	add $t3, $t2,0
	add $t2, $t3,0
	j loop
t3maior:
	add $t3, $t3,0
	add $t2, $t2,0
	j loop
	
	
	
	
final:
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0 ,1
	add $a0, $t3,0
	syscall
	
	li $v0,4
	la $a0, msg4
	syscall
	
	li $v0,1
	add $a0, $t2,0
	syscall	