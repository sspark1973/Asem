# switch to a nicer syntax
# .syntax unified
 
# declare main as exportable (public)
.global main
 
# our main "function"
main:
        # push return address (lr) and ip on the stack
        push {ip, lr}
        # put the address of the string into the r0 register
        ldr r0, =message
        # branch local - a function call, printf()
        bl printf
        # put 0 in r0 as result of the main function (return 0)
        mov r0, #0
        # pop the values from stack into ip and pc registers
        pop {ip, pc}
 
# our string to print, ASCII zero terminated
message:
        .asciz "Hello world!\n"
