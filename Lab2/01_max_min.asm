.data
array: .word 2, 3, 1, 4, 5, 6, 7, 8, 9, 10

.text
.globl main
main:
    add $s0, $zero, $zero # Load base address of the array into $s0 <= 0
    lw $s2, 0($s0)       # Initialize max with the first element
    lw $s3, 0($s0)       # Initialize min with the first element
    add $s1, $zero, $zero # Initialize loop counter to 0
    addi $s1, $zero, 4 # Initialize loop counter to 0

loop:
    addi $t0, $zero, 10 
    slt $t0, $s1, $t0
    beq $t0, $zero, end_loop # Break loop if counter reaches 10
    lw $s4, 0($s0)       # Load current element into $s4
    bgt $s4, $s2, update_max # Update max if current element is greater
    blt $s4, $s3, update_min # Update min if current element is lesser
    addi $s0, $s0, 4     # Move to the next element
    addi $s1, $s1, 1     # Increment loop counter
    j loop               # Jump back to the start of the loop

update_max:
    add $s2, $zero, $s4  # Update max value
    addi $s0, $s0, 4     # Move to the next element
    addi $s1, $s1, 1     # Increment loop counter
    j loop               # Jump back to the start of the loop

update_min:
    add $s3, $zero, $s4  # Update min value
    add $s3, $zero, $s4  # Update min value
    addi $s0, $s0, 4     # Move to the next element
    addi $s1, $s1, 1     # Increment loop counter
    j loop               # Jump back to the start of the loop

end_loop:
    sw $s2, 40($s0)      # Store max value after the last element
    sw $s3, 44($s0)      # Store min value after the last element
    j end                # Jump to end of program

end:
    nop                  # No operation (end of program)
