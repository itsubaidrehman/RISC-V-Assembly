
# int i, a = 7, b[3];

# for (i = 0; i < 3; i++) {

# b[i] = a + (i * a);

# }

# Convert the C code into equivalent RISC-V assembly code.

# Instructions:

# Use s0 to hold i.

# Use s1 to hold a;

# Use s2 to hold &b i.e base address of b


.data
a: .word 7
b: .word 0,0,0
.text

main:
    addi s0, zero, 0      #s0 holds the data of i
    li s1, 7       # s1 holds the data of a
    #la t0, a        t0 holds the address of a
    #li s1, 0(t0)
    addi t1, zero, 3
    la s2, b
for:
    bge s0, t1, done
    #la s2, b
    slli t2, s0, 2
    add t2, t2, s2        # address of the arrray base + 0, base + 4, base + 8
#     mul t3, s0, s1
#     add t3, t3, s1
    # a + i*a
    slli t3, s0, 3
    sub t3, t3, s0
    add t3, t3, s1
    sw t3, 0(t2)
    add a1, zero, t3
    addi a0, zero, 1
    ecall
    addi a1, zero, ' '
    addi a0, zero, 11
    ecall
    
    addi s0, s0, 1
    j for
    
done:
    li a0, 10
    ecall
    