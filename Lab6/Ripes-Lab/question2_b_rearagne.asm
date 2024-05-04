.data
aa: .word 5
bb: .word 7
cc: .word 10

.tex
main:
lw a1 aa
addi a4 a1 1
lw a2 bb
andi a5 a2 1
add a6 a1 a2
lw a3 cc
add a7 a3 a2