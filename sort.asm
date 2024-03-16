        .data
prompt: .asciz "Enter string:\n"
buf:    .space 100
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

        la t0, buf

outer_loop:
        lb t1, (t0)
        beqz t1, end

        la t2, buf

inner_loop:
        lb t3, (t2)
        beqz t3, outer_loop_end

        lb t4, 1(t2)
        beqz t4, outer_loop_end

        blt t4, t3, swap

inner_loop_end:
        addi t2, t2, 1
        j inner_loop

outer_loop_end:
        addi t0, t0, 1
        j outer_loop

swap:
        sb t4, 0(t2)
        sb t3, 1(t2)
        j inner_loop_end

end:
        li a7, 4
        la a0, buf
        ecall

        li a7, 10
        ecall