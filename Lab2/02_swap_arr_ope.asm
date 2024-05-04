.text
main:
    add $16, $0, $0           # Load base address of the first array into $s0 
    addi $16, $0, 10          # Load base address of the second array into $t0 
    add $17, $0, $0           # Initialize loop counter to 0 
    addi $17, $0, 1           # Initialize address offset to 1 (this is not byte addressable memory) 
    addi $18, $0, 10

loop:
    slt $10, $17, $18           # Break loop if counter reaches 10 
    beq $10, $0, end_loop           
    lw $18, 0($16)            # Load current element from the first array into $s2 
    lw $9, 0($8)              # Load current element from the second array into $t1 
    sw $9, 0($16)             # Store second array element into the first array 
    sw $18, 0($8)             # Store first array element (in $s2) into the second array 
    addi $16, $16, 1          # Move to the next element in the first array 
    addi $8, $8, 1            # Move to the next element in the second array 
    addi $17, $17, 1          # Increment loop counter 
    j loop       # Jump back to the start of the loop 

end_loop:
    nop                  # No operation (end of program)
