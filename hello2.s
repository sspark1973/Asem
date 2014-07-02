            ; Hello world in ARM assembler

            AREA text, CODE
            ; This section is called "text", and contains code

            ENTRY

            ; Print "Hello world"

            ; Get the offset to the string in r4.
            adr       r4, hello           ;; "address in register"

loop        ; "loop" is a label and designates an address
            ; Call putchar to display each character
            ; to illustrate how a loop works

            ldrb      r0, [r4], #1        ; Get next byte and post-index r4
            cmp       r0, #0              ; Stop when we hit a null
            beq       outputstring        ;; "branch if equal" = cond. goto

            bl        putchar             
            b         loop                ;; "branch" =  goto

outputstring
            ; Alternatively, use putstring to write out the
            ; whole string in one go
            adr       r0, hello
            bl        putstring           ;; "branch+link" = subroutine call

finish
            ; Standard exit code: SWI 0x123456, calling routine 0x18
            ; with argument 0x20026
            mov       r0, #0x18
            mov       r1, #0x20000        ; build the "difficult" number...
            add       r1, r1, #0x26       ; ...in two steps
            SWI       0x123456            ;; "software interrupt" = sys call

hello
            DCB       "Hello World\n",0

            END
