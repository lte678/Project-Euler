# Finds the pythagorean triplet where a^2 + b^2 = c^2 and a+b+c=1000
# Run with:
# gcc solution.s -no-pie -o solution && ./solution

# Mark the stack a non-executable. Preferred by some versions of ld
.section .note.GNU-stack,"",@progbits

.section .rodata
.globl prefix_str
str1:
    .string "The answer is c="  # Already zero terminated
str2:
    .string " b="
str3:
    .string " a="
newline_str:
    .string "\n"
nosol_str:
    .string "No solution found\n"

.text
.global main
main:
    # Solve problem
    mov $998, %rcx
c_loop:
    mov $1000, %rbx
    sub %rcx, %rbx
    dec %rbx
b_loop:
    mov $1000, %rax
    sub %rcx, %rax
    sub %rbx, %rax
    
    # Check condition
    
    mul %rax  # This clobbers rdx 
    mov %rax, %rsi 
    mov %rbx, %rax
    mul %rax
    add %rax, %rsi
    mov %rcx, %rax
    mul %rax
    cmp %rax, %rsi
    je found_solution

    dec %rbx
    jnz b_loop
    dec %rcx
    jnz c_loop
    
    push $nosol_str
    call print
    add $8, %rsp
    jmp exit

found_solution:
    mov $1000, %rax
    sub %rbx, %rax
    sub %rcx, %rax
    push %rax
    push %rbx
    push %rcx
    # Print result

    push $str1
    call print
    add $8, %rsp
    pop %rcx
    push %rcx
    call print_long
    add $8, %rsp
    push $str2
    call print
    add $8, %rsp
    pop %rcx
    push %rcx
    call print_long
    add $8, %rsp
    push $str3
    call print
    add $8, %rsp
    pop %rcx
    push %rcx
    call print_long
    add $8, %rsp
    push $newline_str
    call print
    add $8, %rsp

    jmp exit


print_long:
    push %rbp
    mov %rsp, %rbp
    # Takes an unsigned long as the parameter. 
    
    mov 16(%rsp), %rax  # Load parameter
    sub $8, %rsp  # Stack has space for 7 numbers and null terminator

    # rcx is the string character index
    mov %rsp, %rcx
    movb $0, (%rsp)
    inc %rcx
    mov $10, %rbx  # We cannot use an immediate for div
print_long_loop:
    mov $0, %rdx  # High half, unused
    div %rbx  # divide rax by 10, and put the result in rax. rdx contains remainder
    add $48, %rdx  # Add to ascii code for '0'
    mov %dl, (%rcx)
    inc %rcx
    cmp %rbp, %rcx
    je print_long_exit
    cmp $0, %rax
    jne print_long_loop
print_long_exit:

    # %rdx is the incrementing char pointer, while rcx decrements
    mov %rsp, %rdx
print_long_rev:
    dec %rcx
    mov (%rcx), %al
    mov (%rdx), %ah
    mov %al, (%rdx)
    mov %ah, (%rcx)
    inc %rdx
    cmp %rcx, %rdx
    jl print_long_rev

    push %rsp
    call print
    add $8, %rsp

    mov %rbp, %rsp
    pop %rbp
    ret


strlen:
    # Preserve stack base pointer
    push %rbp
    mov  %rsp, %rbp

    mov 16(%rbp), %rbx
    mov $0, %rax
strlen_loop:
    inc %rax
    cmpb $0, -1(%rax, %rbx)  # Index into the address %rax + %rbx
    jne strlen_loop
    dec %rax

    mov %rbp, %rsp
    pop %rbp
    ret


print:
    # Preserve stack base pointer
    push %rbp
    mov  %rsp, %rbp

    # Get string length
    push 16(%rbp) # The only parameter is a pointer to the string. Pass as parameter again
    call strlen
    add $8, %rsp

    # Prepare syscall params
    mov %rax, %rdx  # Mov string length to rdx
    mov $1, %rax
    mov $1, %rdi
    mov 16(%rbp), %rsi
    # sys_write
    syscall

    mov %rbp, %rsp
    pop %rbp
    ret


exit:
    # sys_exit
    mov $60, %rax
    mov $0, %rdi
    syscall
