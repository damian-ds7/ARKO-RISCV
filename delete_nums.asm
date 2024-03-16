        .data
prompt: .asciz "Enter string:\n"
buf_in: .space 100
buf_out:.space 100

        .text
        .globl main

main:
        li a7, 4
        la a0, prompt
        ecall

        li a7, 8
        la a0, buf_in
        li a1, 100
        ecall

        li t0, '0'
        li t1, '9'

        la t2, buf_in
        la t3, buf_out
        lb t4, (t2)
        beqz t4, end

loop:
        blt t4, t0, store
        bgt t4, t1, store
        j next

store:
        sb t4, (t3)
        addi t3, t3, 1

next:
        addi t2, t2, 1
        lb t4, (t2)
        bnez t4, loop

end:
        li a7, 4
        la a0, buf_out
        ecall

        li a7, 10
        ecall
