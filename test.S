.global main

.text
// start code here
// Insert your code here  

main:
    la t0, n
    lw a0, 0(t0)
    jal factorial
    
    mv a1, a0
    li a0, 1
    ecall
    
    addi a0, zero 10
    ecall

factorial: 
	addi sp, sp, -8
	sw a0, 4(sp)
	sw ra, 0(sp)
	li t0, 1
	bgt a0, t0, else
	addi a0, zero, 1
	addi sp, sp, 8
	jr ra
	
	else: 
		addi a0, a0, -1
		jal factorial
		lw t1, 4(sp)
		lw ra, 0(sp)
		addi sp, sp, 8
		mul a0, t1, a0
		jr ra



    
// end code here
write_tohost:
li x1, 1
sw x1, tohost, t5
j write_tohost
.data 
// start data section here      
// Initialize data here (if required)
n: .word 5



// end data section here
.align 12
.section ".tohost","aw",@progbits;                            
.align 4; .global tohost; tohost: .dword 0;                     
.align 4; .global fromhost; fromhost: .dword 0;

