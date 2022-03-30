.data
base: .asciiz "Digite uma base de 1 a 20: "
exp: .asciiz "Digite um expoente de 0 a 5:  "

.text



.globl main
main:
addi $s0,$zero,21 #s0=21
addi $s1,$zero,6 #s1=6

getBase:
addi $s2,$zero,0 #inicializa s2=0 
li $v0,4
la $a0,base
syscall  #printa string 'base'
li $v0,5
syscall  #le o inteiro
slt $s3,$v0,$s0 

move $t0,$v0

getExp:
addi $s2,$zero,1
li $v0,4
la $a0,exp
syscall  #printa string 'exp'
li $v0,5
syscall  #le o inteiro
slt $s3,$v0,$s1 

move $t1,$v0

beq $t1,$zero,else 
addi $t2,$zero,1
addi $s4,$zero,0

loop:  
slt $s5,$s4,$t1 
beq $s5,$zero,printresult 

mul $t2,$t2,$t0 
addi $s4,$s4,1
j loop

else:
addi $t2,$zero,1
j printresult

printresult:

li $v0,1
move $a0,$t2
syscall  #printa o resultado (em t2)
li $v0,10
syscall 
