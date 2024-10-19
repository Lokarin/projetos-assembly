# Soma, Diferenca, Multiplicacao e Divisao entre dois float

.data
	newline: .asciiz "\n"
	newline2: .asciiz "\n\n"
	txt0: .asciiz "Primeiro numero: "
	txt1: .asciiz "Segundo numero: "
	txt2: .asciiz "Soma: "
	txt3: .asciiz "Diferenca: "
	txt4: .asciiz "Multiplicacao: "
	txt5: .asciiz "Divisao: "

.text
######## Numero 1
	li $v0,4  		#print string
	la $a0,txt0
	syscall
	
	li $v0,6 		#le float
	syscall
	
	mov.s $f1,$f0 		#move valor lido para f1
	
	
######## Numero 2
	li $v0,4  		#print string
	la $a0,txt1
	syscall
	
	li $v0,6 		#le float
	syscall
	
	mov.s $f2,$f0 		#move valor lido para f2

######## Print de Coleta
	li $v0,4  		#print \n
	la $a0,newline
	syscall
	
	li $v0,4  		#print n1 txt
	la $a0,txt0
	syscall
	li $v0,2		#print n1
	mov.s $f12,$f1
	syscall
	
	li $v0,4  		#print \n
	la $a0,newline
	syscall
	
	li $v0,4  		#print n2 txt
	la $a0,txt1
	syscall
	li $v0,2 		#print n2 
	mov.s $f12,$f2
	syscall
	
	 
######## Operacoes
	##Soma
	add.s $f3,$f1,$f2
	
	li $v0,4  		#print \n\n
	la $a0,newline2
	syscall
	
	li $v0,4  		#print soma txt
	la $a0,txt2
	syscall
	li $v0,2		#print soma
	mov.s $f12,$f3
	syscall
	
	##Diferenca
	sub.s $f3,$f1,$f2
	
	li $v0,4  		#print \n
	la $a0,newline
	syscall
	
	li $v0,4  		#print diferenca txt
	la $a0,txt3
	syscall
	li $v0,2		#print diferenca
	mov.s $f12,$f3
	syscall
	
	##Mult
	mul.s $f3,$f1,$f2
	
	li $v0,4  		#print \n
	la $a0,newline
	syscall
	
	li $v0,4  		#print mult txt
	la $a0,txt4
	syscall
	li $v0,2		#print mult
	mov.s $f12,$f3
	syscall
	
	##Div
	div.s $f3,$f1,$f2
	
	li $v0,4  		#print \n
	la $a0,newline
	syscall
	
	li $v0,4  		#print div txt
	la $a0,txt5
	syscall
	li $v0,2		#print div
	mov.s $f12,$f3
	syscall
	
######## Encerrar
	li $v0,10
	syscall