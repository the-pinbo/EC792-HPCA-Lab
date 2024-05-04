.data
array: .word 10, 3, 5, 8, 4, 1, 7, 9, 2, 6  # Example array of 10 distinct numbers
new_number: .word 5  # New number to insert or find

.text
.globl main

main:
    la $s0, array           # Load base address of the array into $s0
    li $s1, 10              # Array size

    # Call bubble sort
    jal bubble_sort

    # Prepare to search or insert
    lw $t0, new_number      # Load new number into $t0
    li $t1, 0               # Reset index to 0

search_insert:
    # Loop over the array to find the position or the existing number
    bge $t1, $s1, not_found # If end of array, number not found
    lw $t2, 0($s0)          # Load current array element
    beq $t2, $t0, found     # If number found, jump to 'found' label
    blt $t2, $t0, next_elem # If current element is smaller, go to next
    # Else, we found the position to insert
    # Insertion code goes here (not implemented)

    j end

next_elem:
    addi $s0, $s0, 4        # Move to the next element
    addi $t1, $t1, 1        # Increment index
    j search_insert

found:
    # Number found, $t1 is the index
    # Handling code goes here (not implemented)
    j end

not_found:
    # Number not found, insert at $t1
    # Insertion code goes here (not implemented)

end:
    nop                     # End of program

bubble_sort:
    # Bubble sort implementation
    # ...

    jr $ra                  # Return from procedure



bubble_sort:
    li $t3, 0              # Set outer loop counter to 0
outer_loop:
    bge $t3, $s1, end_sort # Exit loop if outer loop counter is equal to array size
    li $t4, 1              # Set inner loop counter to 1 (since we compare array[i] with array[i-1])

inner_loop:
    blt $t4, $s1, swap_check # If inner loop counter is less than array size, check for swap
    addi $t3, $t3, 1       # Increment outer loop counter
    j outer_loop           # Jump back to outer loop

swap_check:
    lw $t5, 0($s0)         # Load current element
    lw $t6, 4($s0)         # Load next element
    ble $t5, $t6, no_swap  # If current element is less than or equal to next, no swap needed
    # Swap elements
    sw $t5, 4($s0)
    sw $t6, 0($s0)

no_swap:
    addi $s0, $s0, 4       # Move to next element
    addi $t4, $t4, 1       # Increment inner loop counter
    j inner_loop           # Jump back to inner loop

end_sort:
    jr $ra                 # Return from bubble_sort procedure
