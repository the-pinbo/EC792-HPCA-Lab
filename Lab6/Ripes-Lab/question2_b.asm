.data
aa: .word 5
bb: .word 7
cc: .word 10

.tex
main:
lw a1 aa
lw a2 bb
lw a3 cc
addi a4 a1 1
andi a5 a2 1
add a6 a1 a2
add a7 a3 a2