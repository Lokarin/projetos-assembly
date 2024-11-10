.macro print_str (%str)
	.data
		myLabel: .asciiz %str
	.text
	li $v0, 4
	la $a0, myLabel
	syscall
.end_macro

.macro print_int (%x)
	li $v0, 1
	add $a0, $zero, %x
	syscall
.end_macro

.macro exit ()
	print_str("\n\nEncerrando...")
	li $v0, 10
	syscall
.end_macro

.text
########Parte 1 e 2
	##Introducao
	print_str("Aluno: Henrique Amaral Onuki\n")
	print_str("Questão 1: Operações entre dois números.\n\n")
	print_str("Este progama deve receber dois números e retornar o resultado de operações entre estes dois números.\n\n")
	print_str("Por favor, forneça o valor do primeiro número (a): ")
	
	##Coleta de dados
	li $v0, 5
	syscall
	
	move $s0, $v0	#Valor de a em s0
	
	print_str("\nE o do segundo número (b): ")
	
	li $v0, 5
	syscall
	
	move $s1, $v0	#Valor de b em s1
	
	print_str("\na: ")
	print_int($s0)
	print_str("\nb: ")
	print_int($s1)

#######Parte 3
	##Soma
	add $s2,$s0,$s1

	##Diferenca
	sub $s3,$s0,$s1
	
	##Mult
	mul $s4,$s0,$s1
	
	##Quociente e Resto
	div    $s0,$s1
	mfhi $s5
	mflo $s6
	
#######Parte 4
	print_str("\n\na + b = ")
	print_int($s2)
	print_str("\na - b = ")
	print_int($s3)
	print_str("\na x b = ")
	print_int($s4)
	print_str("\na ÷ b = ")
	print_int($s6)
	print_str("\na % b = ")
	print_int($s5)
	
#######Parte 5
	exit()