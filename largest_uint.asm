#Scan the biggest unsigned decimal number found in a string and display its value using
#print_int function.

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
        li t4, 10

        li a0, 0 # int to print
        li t5, 0 # temp int

        la t2, buf
        lb t3, (t2)
        beqz t3, end

loop:
        blt t3, t0, reset_temp
        bgt t3, t1, reset_temp
        mul t5, t5, t4
        sub t3, t3, t0
        add t5, t5, t3

increment:
        addi t2, t2, 1
        lb t3, (t2)
        bnez t3, loop
        beqz a0, end
        beqz t3, print_int

reset_temp:
        bgt t5, a0, swap
        j increment

swap:
        add a0, t5, zero
        li t5, 0
        j increment

print_int:
        li a7, 36
        ecall

end:
        li a7, 10
        ecall
