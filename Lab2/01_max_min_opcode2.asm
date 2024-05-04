[00000000] 00008020 // add $16, $0, $0          ; 7: add $s0, $zero, $zero # Load base address of the array into $s0 
[00000001] 8e120000 // lw $18, 0($16)           ; 8: lw $s2, 0($s0) # Initialize max with the first element 
[00000002] 8e130000 // lw $19, 0($16)           ; 9: lw $s3, 0($s0) # Initialize min with the first element 
[00000003] 00008820 // add $17, $0, $0          ; 10: add $s1, $zero, $zero # Initialize loop counter to 0 
[00000004] 20110004 // addi $17, $0, 4          ; 11: addi $s1, $zero, 4 # Initialize loop counter to 0 
[00000005] 2008000a // addi $8, $0, 10          ; 14: addi $t0, $zero, 10 
[00000006] 0228402a // slt $8, $17, $8          ; 15: slt $t0, $s1, $t0 
[00000007] 11000012 // beq $8, $0, 72 [end_loop-0x00400040]
[00000008] 8e140000 // lw $20, 0($16)           ; 17: lw $s4, 0($s0) # Load current element into $s4 
[00000009] 0254082a // slt $1, $18, $20         ; 18: bgt $s4, $s2, update_max # Update max if current element is greater 
[00000010] 14200006 // bne $1, $0, 24 [update_max-0x0040004c] 
[00000011] 0293082a // slt $1, $20, $19         ; 19: blt $s4, $s3, update_min # Update min if current element is lesser 
[00000012] 14200008 // bne $1, $0, 32 [update_min-0x00400054] 
[00000013] 22100004 // addi $16, $16, 4         ; 20: addi $s0, $s0, 4 # Move to the next element 
[00000014] 22310001 // addi $17, $17, 1         ; 21: addi $s1, $s1, 1 # Increment loop counter 
[00000015] 08000005 // j 0x00000005 [loop]      ; 22: j loop # Jump back to the start of the loop 
[00000016] 00149020 // add $18, $0, $20         ; 25: add $s2, $zero, $s4 # Update max value 
[00000017] 22100004 // addi $16, $16, 4         ; 26: addi $s0, $s0, 4 # Move to the next element 
[00000018] 22310001 // addi $17, $17, 1         ; 27: addi $s1, $s1, 1 # Increment loop counter 
[00000019] 08000005 // j 0x00000005 [loop]      ; 28: j loop # Jump back to the start of the loop 
[00000020] 00149820 // add $19, $0, $20         ; 31: add $s3, $zero, $s4 # Update min value 
[00000021] 00149820 // add $19, $0, $20         ; 32: add $s3, $zero, $s4 # Update min value 
[00000022] 22100004 // addi $16, $16, 4         ; 33: addi $s0, $s0, 4 # Move to the next element 
[00000023] 22310001 // addi $17, $17, 1         ; 34: addi $s1, $s1, 1 # Increment loop counter 
[00000024] 08000005 // j 0x00000005 [loop]      ; 35: j loop # Jump back to the start of the loop 
[00000025] ae120028 // sw $18, 40($16)          ; 38: sw $s2, 40($s0) # Store max value after the last element 
[00000026] ae13002c // sw $19, 44($16)          ; 39: sw $s3, 44($s0) # Store min value after the last element 
[00000027] 0800001c // j 0x00000028 [end]       ; 40: j end # Jump to end of program 
[00000028] 00000000 // nop                      ; 43: nop # No operation (end of program) 
