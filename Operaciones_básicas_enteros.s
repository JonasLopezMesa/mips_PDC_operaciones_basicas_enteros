# PRACTICA 2 PRINCIPIO DE COMPUTADORAS
# Suma dos nœmero enteros y almacena el resultado

        	.data  
cadena:		.asciiz "El valor de la suma es:\n";
cadena1:		.asciiz "El valor de la resta es:\n";
cadena2:		.asciiz "El valor de la multiplicacion es:\n";
cadena3:		.asciiz "El valor de la division es:\n";
							# Seccion declaracion de datos
op1:		.word	4   	# variable op1 con valor inicial 0
op2:		.word	2		# variable op2 con valor inicial 0
suma:		.word	0
resta:		.word	0
multbajo: 	.word  	0
multalto: 	.word  	0
divis:		.word	0
resto:		.word	0
		.text			# Seccion de codigo de usuario	
main:                		# La etiqueta main es el inicio

	lw	$s0, op1	# cargo en el registro $s0 el valor de op1
	lw	$s1,	op2	# cargo en el registro $s1 el valor de op2
	
	# suma de enteros
	add	$s2, $s0, $s1
	sw	$s2,	suma

	# resta de enteros
	sub 	$s2, $s0, $s1
	sw	$s3, resta

	# multiplicacion
	mult 	$s0, $s1
	mflo	$s4
	sw $s4, multbajo
	mfhi	$s5
	sw $s5, multalto

	# division
	div		$s0, $s1
	mflo	$t6
	sw		$t6, resto
	mfhi	$t7
	sw		$t7, divis
	
	li	$v0,4		# $v0 = 4 funcion print string
	la	$a0,cadena	# Sa0 = direccion de la cadena a imprimir
	syscall

	li	$v0,1		# $v0 = 4 funcion print_int
	lw	$a0,suma	# Sa0 = entero a imprimir
	syscall

	li	$v0,4		# $v0 = 4 funcion print string
	la	$a0,cadena1	# Sa0 = direccion de la cadena a imprimir
	syscall
	
	li	$v0,1		# $v0 = 4 funcion print_int
	lw	$a0,resta	# Sa0 = entero a imprimir
	syscall
	
	li	$v0,4		# $v0 = 4 funcion print string
	la	$a0,cadena2	# Sa0 = direccion de la cadena a imprimir
	syscall
	
	li	$v0,1		# $v0 = 4 funcion print_int
	lw	$a0,multbajo	# Sa0 = entero a imprimir
	syscall
	
	li	$v0,4		# $v0 = 4 funcion print string
	la	$a0,cadena3	# Sa0 = direccion de la cadena a imprimir
	syscall

	li	$v0,1		# $v0 = 4 funcion print_int
	lw	$a0,divis	# Sa0 = entero a imprimir
	syscall
	
	# se hace una salida limpia del sistema (exit es codigo 10)
	li $v0, 10
     syscall     
# END
