#Display the number of decimal numbers (sequences of decimal digits) found in a string.

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
        li t2, 0 # counter
        li t5, 0 # 1 if found a sequence of digits

        la t3, buf
        lb t4, (t3)
        beqz t3, end

loop:
        blt, t4, t0, reset_seq
        bgt, t4, t1, reset_seq
        bnez t5, next
        addi t5, t5, 1
        addi t2, t2, 1

next:
        addi t3, t3, 1
        lb t4, (t3)
        bnez t4, loop
        j end

reset_seq:
        add t5, zero, zero
        j next

end:
        li a7, 36
        add a0, t2, zero
        ecall

        li a7, 10
        ecall

