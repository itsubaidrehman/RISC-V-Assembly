# #include <stdio.h>
# int factorial(int);
# int main() {
#     // Write C code here
#     int a = 5;
#     int b = factorial(a);
#     printf("%d", b);
# }

# int factorial(int n) {
#     int result = 1;
#     if (n <= 0) {
#         return 1;
#     }
#     else {
#         for (int i = 1; i <=n; i++) {
#             result = result * i;
#         }
#         return result;
#     }
# }

.data
a: .word 5
.text
main:
    la t0, a
    lw a0, 0(t0)      #s0 holds the value of input to funct factorial
    #addi s1, zero, 1   #s1 holds the value of i
    jal factorial
  
    add a1, zero, a0
    addi a0, zero, 1
    ecall
    
    li a0, 10
    ecall
    
factorial:
    addi s1, zero, 1
    add t1, zero, a0
    li t2, 1
    addi sp, sp, -4
    sw ra, 0(sp)
    bgtz t1, else
    addi a0, zero, 1
    
    lw ra, 0(sp)
    addi sp, sp, 4
    
    jr ra
    else:
    for:
        bgt s1, t1, return
        mul t2, t2, s1
        addi s1, s1, 1
        j for
    return:
        lw ra, 0(sp)
        addi sp, sp, 4
        
        add a0, zero, t2
        jr ra


        
    
    