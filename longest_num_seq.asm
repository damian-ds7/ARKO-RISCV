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
        lb t1, (t0)

        li t2, 0
        la t3, buf

        li s0, 0
        la s1, buf

        li t4, '0'
        li t5, '9'

        beqz t1, end

loop:
        blt t1, t4, updateSeq
        bgt t1, t5, updateSeq
        beqz t2, firstNum

        addi t2, t2, 1

next:
        addi t0, t0, 1
        lb t1, (t0)
        bnez t1, loop
        j end

firstNum:
        sub t3, t0, a0
        addi t2, t2, 1
        j next

updateSeq:
        blt s0, t2, store
        j next

store:
        mv s0, t2
        mv s1, t3
        li t2, 0
        j next

end:
        la t0, buf
        add t0, s1, t0

print:
        beqz s0, exit
        li a7, 11
        lb a0, (t0)
        ecall

        addi t0, t0 , 1
        addi s0, s0, -1

        j print

exit:
        li a7, 10
        ecall