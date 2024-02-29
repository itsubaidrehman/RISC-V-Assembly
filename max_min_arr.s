
    
    
    
.data
arr: .word 3 5 1 2 8 9 4 7 6
.text
main:
    la t0, arr
    #lw s3, 0(t0)    #base address
    lw s0, 0(t0)       #s0 holds min
    #la t0, arr
    lw s1, 0(t0)      #s1 holds max
    addi t4, zero, 0    #t0 now holds the value i
    li t1, 8
    
loop:
    bgt t4, t1, done
    slli t2, t4, 2
    add t2, t2, t0
    lw t3, 0(t2)
    maxcheck:
    bgt t3, s1, changemax
    mincheck:
    blt t3, s0, changemin
    j iterate
    changemax:
        mv s1, t3
        j mincheck

    changemin:
        mv s0, t3
        addi t4, t4, 1
        j loop
    iterate:
        addi t4, t4, 1
        j loop
       
    
    
    
done:
    add a1, zero, s0
    li a0, 1
    ecall
    
    li a1, ' '
    li a0, 11
    ecall
    
    add a1, zero, s1
    li a0, 1
    ecall
    
    li a0, 11
    li a0, 10
    ecall
    
