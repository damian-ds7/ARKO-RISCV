# Reverse the order of digits in a string. eg. 1a2b3c -> 3a2b1c

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

        li t0, '0'
        li t1, '9'

        la t2, buf
        la t3, buf # address of last element
        lb t5, (t3)
        addi t3, t3, -1
        addi t2, t2, -1

find_end:
        addi t3, t3, 1
        lb t5, (t3)
        bnez t5, find_end
        addi t3, t3, -1

dec_right:
        bgt t2, t3, end
        addi t3, t3, -1
        lb t5, (t3)
        blt t5, t0, dec_right
        bgt t5, t1, dec_right

inc_left:
        addi t2, t2, 1
        lb t4, (t2)
        blt t4, t0, inc_left
        bgt t4, t1, inc_left

swap:
        sb t5, (t2)
        sb t4, (t3)
        j dec_right

end:
        li a7, 4
        la a0, buf
        ecall

        li a7, 10
        ecall


