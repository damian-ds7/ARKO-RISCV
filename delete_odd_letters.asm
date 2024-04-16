	.data
prompt: .asciz  "Enter string:\n"
buf:    .space  100
        .text
        .globl main
main:
        li a7, 4
        la a0, prompt
        ecall

        li a7, 8
        la a0, buf
        li a1, 100
        ecall

        li t0, 'a'
        li t1, 'z'
        li t2, 'A'
        li t3, 'Z'

        la t4, buf
        lb t5, (t4)
        mv a0, t4
        beqz t5, end

check_small:
	blt t5, t0, check_capital
	bgt t5, t1, check_capital
	andi t6, t5, 1
	bnez t6, next

check_capital:
	blt t5, t2, save
	bgt t5, t3, save
	andi t6, t5, 1
	bnez t6, next

save:
	sb t5, (a0)
	addi a0, a0, 1

next:
	addi t4, t4, 1
	lb t5, (t4)
	bnez t5, check_small

end:
	sb zero, (a0)
        li a7, 4
        la a0, buf
        ecall

        li a7, 10
        ecall


