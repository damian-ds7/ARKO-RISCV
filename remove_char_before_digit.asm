        .data
prompt: .asciz  "Enter string:\n"
buf:    .space  100
outBuf: .space  100
        .text
        .globl 	main

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
        la t3, outBuf

        li t4, '0'
        li t5, '9'

        beqz t1, end

loop:
        bnez t2, resetNumEnc
        blt t1, t4, saveChar
        bgt t1, t5, saveChar

        addi t2, t2, 1

saveChar:
        sb t1, (t3)
        addi t3, t3, 1
        j next

resetNumEnc:
        add t2, zero, zero
        blt t1, t4, next
        bgt t1, t5, next

numSeq:
        addi t2, t2, 1

next:
        addi, t0, t0, 1
        lb t1, (t0)
        bnez t1, loop

end:
        li a7, 4
        la a0, outBuf
        ecall

        li a7, 10
        ecall
