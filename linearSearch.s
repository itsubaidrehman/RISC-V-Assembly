#Linear Search
.data
arr: .word 4 2 7 1 0 2 4 9
find: .word 7
string: .string "At Index "

.text
main:
    la t0, arr
    la t1, find
    lw s0, 0(t1)      # target value
    addi s1, zero, 1     # value of i in s1
    addi s2, zero, 7
    
loop:
    bgt s1, s2, done
    slli t2, s1, 2
    add t2, t2, t0       # address of array locations
    lw s3, 0(t2)
    if: 
        bne s0, s3, else
        add, a2, zero, s1
        j done
    else:
        addi s1, s1, 1
        j loop
done:
    la a1, string
    li a0, 4
    ecall
    
    add a1, zero, a2
    addi a0, zero, 1
    ecall
    
    addi a0, zero, 10
    ecall
    