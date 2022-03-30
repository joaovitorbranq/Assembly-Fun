		.data
array:	.word		3, 4, 12, 22, 24, 27, 36, 39, 44, 57, 60, 67, 76, 81
msgNaoAchou:	.ascii		" nao foi encontrado."
valor:		.word		24
msgAchou:	.ascii		" foi encontrado."
		.text
		.globl		main
main:
		la	$a0, array		# loada o endereço do array que tem os valores
		la	$s0, valor		# loada o endereço do valor a ser procurado
		lw	$a1, 0($s0)		# loada o valor a ser procurado
		
		jal	buscaBinaria		# executa o algoritmo
		
		addi	$a2, $s1, 0
		jal	retornoMsg		# pula para a mensagem de retorno
		
		li	$v0, 10
		syscall	
		
buscaBinaria:
		addi	$t1, $zero, 0		# 0 inicial
		addi	$t2, $zero, 4		
		
inic:		
		addi	$t3, $t1, 1		
				
		bgt	$t3, $t2, fim	# bgt -> se (inic + 1 > fim)
		beq	$t3, $t2, fim	# beq -> se (inic + 1 == fim)
		
		sub	$t4, $t2, $t1		# (fim - inic)
		div	$t4, $t4, 2		# (fim - inic) / 2
		add	$t5, $t1, $t4		# meio = inic + ((fim - inic) / 2)
		
		mul	$t7, $t5, 4		
						
		add 	$t6, $a0, $t7		
		lw	$t6, 0($t6)		# loada valor de array[meio]
		
		bgt	$a1, $t6, else	
		beq	$a1, $t6, else	
		
		add	$t2, $zero, $t5		# fim = meio
		j 	inic
		
else:
		add	$t1, $zero, $t5		# inic = meio
		j	inic
		
fim:	
		mul	$t7, $t1, 4		
		
		add 	$t6, $a0, $t7		# array[inic]
		lw	$t6, 0($t6)		
		
		bne	$a1, $t6, notInic	
		addi	$s1, $zero, 1 		# 1 indica que achou
		j	final
		
notInic:	
		mul	$t7, $t2, 4		
				
		add 	$t6, $a0, $t7		# array[fim]
		lw	$t6, 0($t6)		
		
		bne	$a1, $t6, notFim	
		addi	$s1, $zero, 1 		
		j	final
notFim:		
		addi	$s1, $zero, 0		# 0 indica que não achou

final:	
		jr	$ra		

retornoMsg:	
		li	$v0, 1
		add	$a0, $a1, 0		
		syscall
				
		bne	$a2, 0, esta		# se a2==0, não achou
		
naoEsta:		
		li	$v0, 4
		la	$a0, msgNaoAchou	
		syscall
		
		j	msgFim

esta:
		li	$v0, 4
		la	$a0, msgAchou	
		syscall
			
msgFim:
		jr	$ra
