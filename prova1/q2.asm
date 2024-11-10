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

.data
	#A: .space 80
	A: .word 5, 8, 2, 10, 3, 7, 1, 9, 4, 6, 15, 12, 11, 14, 13, 16, 19, 17, 18, 20

.text
	##Load s0 com A
	la $s0, A
	
	##menor = primeiro elemento
	lw $t1, ($s0)  
	
	##maior = primeiro elemento  
    	lw $t2, ($s0)    
	
	##i = 0
	li $t0, 0
	
	##tamanho do vetor
	li $t3, 20      
	
	print_str("Vetor A = [")
	
	loop:
		beq $t0, $t3, fim_loop    	# for i < 20
		
		sll $t4, $t0, 2          	# t4 = i * 4 (2 bits para esquerda)
    		add $t4, $s0, $t4        	# t4 = endereço base + deslocamento
    		lw $t5, ($t4)            	# t5 = A[i]
    		
    		print_int($t5)			# print vetor
        	print_str(", ")
        	
    		##a
    		add $s1, $s1, $t5        	# x += A[i]
    		
    		##b
    		slt $t6, $t5, $t1         	# se A[i] < menor
    		beq $t6, $zero, nao_menor 	# se t5 nao for menor que t1, pula
    		move $t1, $t5             	# menor = A[i]
    		
    		nao_menor:
    			slt $t6, $t2, $t5         # se maior < A[i]
    			beq $t6, $zero, nao_maior # se não for maior, pula
    			move $t2, $t5             # maior = A[i]
    		
    			nao_maior:
    		
    		addi $t0, $t0, 1		# i = i +1
    		j loop
    	fim_loop:
    		print_str("]\n")
    		##c
    		sub $t7, $t2, $t1         	# t7 = maior - menor
    		
    		print_str("\nO menor número neste vetor é: ")
    		print_int($t1)
    		
    		print_str("\nO maior número neste vetor é: ")
    		print_int($t2)
    		
    		print_str("\nA diferença entre o maior e menor numero é: ")
    		print_int($t7)
    		
    		exit()