        .data
nl: .asciiz "\n"

        .text
main:

        li $v0, 1 # ($v0 = 1) to print an integer
        li $a0, 17
        syscall

        li		$v0, 4		# $v0 = 4 (to print a string)
        la		$a0, nl	# $a0 = one 
        syscall

        li $v0, 1 # ($v0 = 1) to print an integer
        li $a0, 47
        syscall

        li		$v0, 4		# $v0 = 4 (to print a string)
        la		$a0, nl	# $a0 = one 
        syscall

        li		$v0, 10		# $v0 = 10 (to print quit the program)
        syscall