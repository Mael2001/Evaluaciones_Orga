.global draw_triangle

draw_triangle:
    add $t0, $zero, $a0
    addiu $t1, $zero, 0
    addiu $t7, $zero, 0
    addiu $t8, $zero, 0
    addiu $t9, $zero, 2
    j print_primero

print_primero:
    beq $t1, $t0, print_hash_primero
    bne $t1, $t0, print_space_primero

print_space_primero:
    li $a0, ' '
    li $v0, 11    
    syscall
    addiu $t1, $t1, 1
    j print_primero

print_hash_primero:
    li $a0, '*'
    li $v0, 11    
    syscall

    addiu $t1, $zero, 1
    addiu $t5, $zero, 0
    addiu $t6, $zero, 0
    li $a0, 10
    li $v0, 11    
    j print_niveles

print_niveles:
    beq $t2, $t0, print_ultimo

    addiu $t3, $zero, 0
    addiu $t4, $zero, 0

    sub $t3, $t0, $t2
    sub $t4, $t0, $t3

    beq $t5, $t4, print_hash
    j print_space

print_hash:
    li $a0, '*'
    li $v0, 11
    syscall
    addiu $t6, $t6, 1
    j print_niveles

print_hash_ultimo:
    li $a0, '*'
    li $v0, 11    
    syscall
    addiu $t1, $t1, 1
    li $a0, 10
    li $v0, 11    
    syscall
    j print_ultimo

print_space:
    li $a0, ' '
    li $v0, 11    
    syscall
    addiu $t5, $t5, 1
    j print_niveles

print_ultimo:
    addiu $t7, $t4, -1 
    mult $t7, $t9
    mflo $t7
    addiu $t7, $t7, 1
    beq $t8,$t7, volver
    li $a0, 10
    li $v0, 11    
    syscall
    j imprimir

imprimir:
    addiu $t8, $t8, 1
    li $a0, '*'
    li $v0, 11    
    syscall
    j print_ultimo

volver:
    jr $ra