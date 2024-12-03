# Run with:
# gcc solution.s -no-pie -o solution && ./solution

.section .rodata
.globl prefix_str
prefix_str:
    .string "The answer is "  # Already zero terminated
newline_str:
    .string "\n"

.text
.global main
main:
    sub $8, %rsp
    mov $0, %rcx
    mov $431, %rax
    mov $10, %rbx
dectostr:
    mov $0, %rdx  # High half, unused
    div %rbx  # divide rax by 10, and put the result in rax. rdx contains remainder
    add $48, %rdx  # Add to ascii code for '0'
    mov %dl, (%rsp, %rcx)
    inc %rcx
    cmp $0, %rax
    jne dectostr
    movb $0, (%rsp, %rcx)

    # Print result
    push $prefix_str
    call print
    add $8, %rsp
    push %rsp
    call print
    add $8, %rsp
    push $newline_str
    call print
    add $8, %rsp

    jmp exit


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
