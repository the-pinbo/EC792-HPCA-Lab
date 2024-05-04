.data
array: .word 2, 3, 1, 4, 5, 6, 7, 8, 9, 10

.text
.globl main
main:
    la $s0, array        # Load base address of the array into $s0
    lw $s2, 0($s0)       # Initialize max with the first element
    lw $s3, 0($s0)       # Initialize min with the first element
    li $s1, 0            # Initialize loop counter to 0
    li $s5, 4            # Initialize address offset to 4

loop:
    bge $s1, 10, end_loop # Break loop if counter reaches 10
    lw $s4, 0($s0)       # Load current element into $s4
    bgt $s4, $s2, update_max # Update max if current element is greater
    blt $s4, $s3, update_min # Update min if current element is lesser
    addi $s0, $s0, 4     # Move to the next element
    addi $s1, $s1, 1     # Increment loop counter
    j loop               # Jump back to the start of the loop

update_max:
    move $s2, $s4        # Update max value
    addi $s0, $s0, 4     # Move to the next element
    addi $s1, $s1, 1     # Increment loop counter
    j loop               # Jump back to the start of the loop

update_min:
    move $s3, $s4        # Update min value
    addi $s0, $s0, 4     # Move to the next element
    addi $s1, $s1, 1     # Increment loop counter
    j loop               # Jump back to the start of the loop

end_loop:
    sw $s2, 40($s0)      # Store max value after the last element
    sw $s3, 44($s0)      # Store min value after the last element
    j end                # Jump to end of program

end:
    nop                  # No operation (end of program)
