.data
pixels: .word 0x00FF0000, 0x0000FF00, 0x000000FF, 0x00FFFFFF  # Example pixel array (red, green, blue, white)

.text
.globl main

main:
    la $a0, pixels      # Load base address of the pixels array
    li $t0, 4           # Number of pixels in the array
    li $t1, 0           # Loop counter

loop:
    bge $t1, $t0, end   # Break loop if counter reaches number of pixels
    lw $a1, 0($a0)      # Load current pixel
    jal rgb2gray        # Call rgb2gray procedure
    addi $a0, $a0, 4    # Move to the next pixel
    addi $t1, $t1, 1    # Increment loop counter
    j loop              # Jump back to the start of the loop

end:
    nop                 # No operation (end of program)

rgb2gray:
    # Extract RGB values
    andi $t2, $a1, 0xFF       # Extract blue
    srl $t3, $a1, 8
    andi $t3, $t3, 0xFF       # Extract green
    srl $t4, $a1, 16
    andi $t4, $t4, 0xFF       # Extract red

    # Calculate gray value
    add $t5, $t2, $t3
    add $t5, $t5, $t4
    div $t5, $t5, 3
    mflo $t5                  # Move result from LO to $t5

    # Print RGB and gray values (printing not implemented in MIPS assembly, use syscall or external function)
    # ...

    jr $ra                    # Return from procedure
