# void dataArray (int num) {

# int i;

# int array[10];

# for ( i=0; i<10; i=i+1)

# array[i] = compare(num, i);

# }

# int compare (int a, int b) {

# if (sub(a, b) >= 0)

# return 1;

# else 

# return 0;

# }

# int sub (int a, int b) {

# return a - b;

# }


# Convert the C code above to the RISC-V assembly language.
# Instructions:

# Use s0 to hold i variable.

# Use a0 to hold num variable. 

.data
num: .word 7
array: .word 0,0,0,0,0,0,0,0,0,0
.text
# main:
#     addi s0, zero, 0
#     la s1, array
#     la t0, num
#     lw a0, 0(t0)
#     addi t1, zero, 10
setArray:
    addi s0, zero, 0
    la s1, array
    la t0, num
    lw a0, 0(t0)
    addi t1, zero, 10
    addi sp, sp, -4
    sw ra, 0(sp)
loop:
    bge s0, t1, done
    slli t2, s0, 2
    add t2, t2, s1      #t2 holds the address for array[i]
    add a1, zero, s0
    #add a2, zero, a0
    
    jal compare
    sw a0, 0(t2)
    addi s0, s0, 1
    addi sp, sp, 4
    lw, ra, 0(sp)
    j loop
        
compare:
    addi sp, sp, -4
    sw ra, 0(sp)
    blt a0, zero, else
    addi a0, zero, 1
    addi sp, sp, 4
    lw, ra, 0(sp)
    jr ra
else:
    addi a0, zero, 0
    addi sp, sp, 4
    lw, ra, 0(sp)
    jr ra
        
subtract:
    sub a0, a0, a1
    jr ra
done:
    addi a0, zero, 10
    ecall
    
