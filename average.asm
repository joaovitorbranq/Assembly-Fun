# Desenvolver um programa para calcular média aritmética. 
# O usuário deve informar a quantidade de notas, e as 
# Notas obtidas em cada uma das provas.

# exemplo: usuário informa 4 notas de 4 provas
# média = (p1+p2+p3+p4) / 4
# 

.data
	notas: .space 16   # reservando espa�o para 4 inteiros -- vetor
	qtdProvas: .asciiz "\nDigite a quantidade total de provas: \t"
	nota: .asciiz "\nDigite a nota:\t"
	totalProvas: .asciiz "\nTotal de provas digitado:\t "
	media: .asciiz "\nA m�dia �: \t"

.text
	
		
	# imprime no console a mensagem 1
	li $v0, 4   		
	la $a0, qtdProvas  	
	syscall     			
	
	# pegando o que o usuário digitou no console
	li $v0, 5     
	syscall        
	move $s0, $v0  # v0 = 4 --> vai pra s0
	
	# NOTA 1
	li $v0, 4   		
	la $a0, nota 	# pega o rótulo MENSAGEM 1 e coloca no argumento
	syscall     		# chamada do sistema		
	

	li $v0, 5     
	syscall        
	move $s1, $v0  # v0 = 4 --> vai pra s1	
	
	
	# NOTA 2
	li $v0, 4   		# 4 é o código do sistema para string	
	la $a0, nota  	# pega o rótulo MENSAGEM 1 e coloca no argumento
	syscall     		# chamada do sistema		
	

	li $v0, 5     
	syscall        
	move $s2, $v0  # v0 = 4 --> vai pra s1	
	
	
	# NOTA 3
	li $v0, 4   		# 4 é o código do sistema para string	
	la $a0, nota 	# pega o rótulo MENSAGEM 1 e coloca no argumento
	syscall     		# chamada do sistema		
	

	li $v0, 5     
	syscall        
	move $s3, $v0  # v0 = 4 --> vai pra s1
	
	
	# NOTA 4
	li $v0, 4   		
	la $a0, nota 	
	syscall     		
	
	li $v0, 5     
	syscall        
	move $s4, $v0  # v0 = 4 --> vai pra s1	
	
			
        # SOMA AS NOTAS
	add $t0, $s1, $s2	# t0 = s1 + s2 
	add $t1, $s3, $s4	# t1 = s3 + s4
	add $t2, $t0, $t1	# t2 = t0 + t1 --> SOMA
	
	
	# TIRA A MEDIA
	div $s5, $t2, $s0       # s5 = t2 / s0 --> soma / 4
	
	
	# IMPRIME O RESULTADO
	li $v0, 4   	     
	la $a0, media 	
	syscall 
	li $v0, 1             
	move $a0, $s5
	syscall
