# #include <stdio.h>
# void fibonacci(int);
# int main() {
#     int terms = 15;
#     fibonacci(terms);
#     return 0;
# }

# void fibonacci(int terms) {
#     int first = 0; int second = 1; int c;
#     for (int i = 0; i < 8; i++) {
#         printf("%d ", first);
#         int c = first + second;
#         first = second;
#         second = c;

#     }
#     printf("\n");
# }

.data
term: .word 8

.text
main:
    la t0, term
    lw a0, 0(t0)      #a0 holds the value of term or the argument of funct
    addi s0, zero, 0    # value of i
    addi t1, zero, 7
    
finonacci:
    li s1, 0
    li s2, 1
    for:
        bgt s0, t1, done
        mv a1, s1
        li a0, 1
        ecall
        li a1, ' '
        li a0, 11
        ecall
        add s3, s1, s2
        mv s1, s2
        mv s2, s3
        addi s0, s0, 1
        j for
        
done:
    li a0, 10
    ecall