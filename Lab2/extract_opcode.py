import re

regex = r"\[.*\] (.*) \/\/"

test_str = ("[00000000] 00008020 //  add $16, $0, $0          ; 7: add $s0, $zero, $zero # Load base address of the array into $s0 \n"
            "[00000004] 8e120000 //  lw $18, 0($16)           ; 8: lw $s2, 0($s0) # Initialize max with the first element \n"
            "[00000008] 8e130000 //  lw $19, 0($16)           ; 9: lw $s3, 0($s0) # Initialize min with the first element \n"
            "[0000000C] 00008820 //  add $17, $0, $0          ; 10: add $s1, $zero, $zero # Initialize loop counter to 0 \n"
            "[00000010] 20110004 //  addi $17, $0, 4          ; 11: addi $s1, $zero, 4 # Initialize loop counter to 0 \n"
            "[00000014] 2a21000a //  slti $1, $17, 10         ; 14: bge $s1, 10, end_loop # Break loop if counter reaches 10 \n"
            "[00000018] 10200012 //  beq $1, $0, 72 [end_loop-0x00000018] \n"
            "[0000001C] 8e140000 //  lw $20, 0($16)           ; 15: lw $s4, 0($s0) # Load current element into $s4 \n"
            "[00000020] 0254082a //  slt $1, $18, $20         ; 16: bgt $s4, $s2, update_max # Update max if current element is greater \n"
            "[00000024] 14200006 //  bne $1, $0, 24 [update_max-0x00000024] \n"
            "[00000028] 0293082a //  slt $1, $20, $19         ; 17: blt $s4, $s3, update_min # Update min if current element is lesser \n"
            "[0000002C] 14200008 //  bne $1, $0, 32 [update_min-0x0000002C] \n"
            "[00000030] 22100004 //  addi $16, $16, 4         ; 18: addi $s0, $s0, 4 # Move to the next element \n"
            "[00000034] 22310001 //  addi $17, $17, 1         ; 19: addi $s1, $s1, 1 # Increment loop counter \n"
            "[00000038] 08000005 //  j 0x00000014 [loop]      ; 20: j loop # Jump back to the start of the loop \n"
            "[0000003C] 00149020 //  add $18, $0, $20         ; 23: add $s2, $zero, $s4 # Update max value \n"
            "[00000040] 22100004 //  addi $16, $16, 4         ; 24: addi $s0, $s0, 4 # Move to the next element \n"
            "[00000044] 22310001 //  addi $17, $17, 1         ; 25: addi $s1, $s1, 1 # Increment loop counter \n"
            "[00000048] 08000005 //  j 0x00000014 [loop]      ; 26: j loop # Jump back to the start of the loop \n"
            "[0000004C] 00149820 //  add $19, $0, $20         ; 29: add $s3, $zero, $s4 # Update min value \n"
            "[00000050] 00149820 //  add $19, $0, $20         ; 30: add $s3, $zero, $s4 # Update min value \n"
            "[00000054] 22100004 //  addi $16, $16, 4         ; 31: addi $s0, $s0, 4 # Move to the next element \n"
            "[00000058] 22310001 //  addi $17, $17, 1         ; 32: addi $s1, $s1, 1 # Increment loop counter \n"
            "[0000005C] 08000005 //  j 0x00000014 [loop]      ; 33: j loop # Jump back to the start of the loop \n"
            "[00000060] ae120028 //  sw $18, 40($16)          ; 36: sw $s2, 40($s0) # Store max value after the last element \n"
            "[00000064] ae13002c //  sw $19, 44($16)          ; 37: sw $s3, 44($s0) # Store min value after the last element \n"
            "[00000068] 0800001B //  j 0x0000006C [end]       ; 38: j end # Jump to end of program \n"
            "[0000006C] 00000000 //  nop                      ; 41: nop # No operation (end of program) \n")

matches = re.finditer(regex, test_str, re.MULTILINE)

for matchNum, match in enumerate(matches, start=1):

    print("Match {matchNum} was found at {start}-{end}: {match}".format(
        matchNum=matchNum, start=match.start(), end=match.end(), match=match.group()))

    for groupNum in range(0, len(match.groups())):
        groupNum = groupNum + 1

        print("Group {groupNum} found at {start}-{end}: {group}".format(groupNum=groupNum,
              start=match.start(groupNum), end=match.end(groupNum), group=match.group(groupNum)))
