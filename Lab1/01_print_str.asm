        .data

one:    .asciiz "This is string one!\n"
two:    .asciiz "This is string two!\n"
        .text

main:
        li		$v0, 4		# $v0 = 4 (to print a string)
        la		$a0, one	# $a0 = one 
        syscall

        la		$a0, two	# $a0 = two 
        syscall
        .data
hello:  .asciiz "Hello World!\n"
        .text
        la		$a0, hello	# $a0 = three 
        syscall

        li		$v0, 10		# $v0 = 10 (to print quit the program)
        syscall
        
        
        
