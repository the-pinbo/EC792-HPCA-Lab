.data
array1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
array2: .word 10, 9, 8, 7, 6, 5, 4, 3, 2, 1

.text
.globl main
main:
    la $s0, array1       # Load base address of the first array into $s0
    la $t0, array2       # Load base address of the second array into $t0
    li $s1, 0            # Initialize loop counter to 0
    li $s3, 4            # Initialize address offset to 4

loop:
    bge $s1, 10, end_loop # Break loop if counter reaches 10
    lw $s2, 0($s0)       # Load current element from the first array into $s2
    lw $t1, 0($t0)       # Load current element from the second array into $t1
    sw $t1, 0($s0)       # Store second array element into the first array
    sw $s2, 0($t0)       # Store first array element (in $s2) into the second array
    addi $s0, $s0, 4     # Move to the next element in the first array
    addi $t0, $t0, 4     # Move to the next element in the second array
    addi $s1, $s1, 1     # Increment loop counter
    j loop               # Jump back to the start of the loop

end_loop:
    nop                  # No operation (end of program)
