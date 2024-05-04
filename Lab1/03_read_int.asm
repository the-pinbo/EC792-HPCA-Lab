

main:
    li		$v0, 5		# $v0 = 5 (to take an input from the console)
    syscall

    move 	$t0, $v0		# $t0 = $v0
    
    li		$v0, 10		# $v0 = 10 (to print quit the program)
    syscall