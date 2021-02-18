
insertionSort:
    addiu $t0, $zero, 0
    addiu $t2, $zero, 0
    addiu $t3, $zero, 0
    addiu $t4, $zero, 0
    addiu $t5, $zero, 0
    addiu $t6, $zero, 0
    addiu $t7, $zero, 0
    addiu $t8, $zero, 0
    addiu $t1, $a1, $zero

    j for

swap:
    

for:
    slt $t1, $t2, $t3
    bne $t1, $zero, end_for

    addiu $t3, $t1, $zero
    j while

    addiu $t1, $t1, 1

    j for

while:


end_while:
    j for

end_for:

    jr $ra
