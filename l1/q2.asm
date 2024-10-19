# Faça um programa para conversão das instruções abaixo em 
# Assembly MIPS. Use mensagens de texto para entrada e saída de
# dados.
# Considere os seguintes registradores para cada variável:
# a = $s0, 
# b = $s1, 
# c = $s2, 
# d = $s3, 
# e = $s4, 
# f = $s5.

.macro print_def(%txt)
	li $v0,4  		#print string
	la $a0,%txt
	syscall
.end_macro

.macro espacamento()
	li $v0,4		#print \n
	la $a0,newline
	syscall
.end_macro

.macro espacamento2()
	li $v0,4		#print \n\n
	la $a0,newline2
	syscall
.end_macro

.macro print_int(%int)
	li $v0,1
	move $a0,%int
	syscall
.end_macro

.data
	newline: .asciiz "\n"
	newline2: .asciiz "\n\n"
	txt0: .asciiz "Valor de a: "
	txt1: .asciiz "Valor de b: "
	txt2: .asciiz "Valor de d: "
	txt3: .asciiz "Valor de f = (a + b) - d: "
	txt4: .asciiz "Valor de c: "
	txt5: .asciiz "Valor de e: "
	txt6: .asciiz "Valor de f = ((a >= b)  && ((a+b) % 2) == 1): "
	txt7: .asciiz "Valor de f = ((c<d) && (d>e) || (a==b)): "

.text
####### Coleta
	## a
	print_def(txt0)
	
	li $v0,5		#le numero inteiro
	syscall
	
	move $s0,$v0		#guarda a em s0
	
	## b
	print_def(txt1)
	
	li $v0,5		#le numero inteiro
	syscall
	
	move $s1,$v0		#guarda b em s1
	
	## d
	print_def(txt2)
	
	li $v0,5		#le numero inteiro
	syscall
	
	move $s3,$v0		#guarda d em s3
	
######## f = (a + b) - d
	add $t1,$s0,$s1		# $t0 = a + b
	sub $s5,$t1,$s3	# f = $s5 = $t0 - d

	espacamento()
	
	print_def(txt3)
	print_int($s5)
	

######## c = a - (b + d)
	add $t1,$s1,$s3
	sub $s2,$s0,$t1
	
	espacamento()
	
	print_def(txt4)
	print_int($s2)
		
		
######## e = (a - (b - c) + f)
	sub $t1,$s1,$s2
	add $t1,$t1,$s5
	sub $s4,$s0,$t1
				
	espacamento()
	
	print_def(txt5)
	print_int($s4)						
												

######## f = ( a >= b ) && ((a+b) % 2) == 1	
	sge $t1,$s0,$s1		# t1 = a >= b ? 1 : 0
	
	add $t2,$s0,$s1		# t2  =  a + b
	li $t3,2		# t3 = 2
	div $t2,$t3		# (a + b) / 2
	mfhi $t2		# t2 = (a + b) % 2
	
	li $t3, 1		# t3 = 1
	seq $t2,$t2,$t3		# t2 = t2 == 1 ? 1 : 0
	and $s5,$t1,$t2		# f = ((a >= b)  && ((a+b) % 2) == 1) ? 1 : 0
	
	espacamento2()
	
	print_def(txt6)
	print_int($s5)
		
								
######## f = (c<d) && (d>e) || (a==b)
	slt $t1,$s2,$s3		# t1 = c<d ? 1 : 0
	sgt $t2,$s3,$s4		# t2 = d>e ? 1 : 0
	and $t1,$t1,$t2		# t1 = ((c<d) && (d>e)) ? 1 : 0
	
	seq $t2,$s0,$s1		# t2 = a==b ? 1 : 0	
	
	or $s5,$t1,$t2		# f = (c<d) && (d>e) || (a==b) ? 1 : 0	
	
	espacamento2()
	
	print_def(txt7)
	print_int($s5)																																																																									

######## Encerrar
	li $v0,10
	syscall