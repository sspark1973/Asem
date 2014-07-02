; I/O routines

            AREA      text,CODE
                                                
            EXPORT    printhex, putchar, putstring

printhex
            ; Print number in r0 as 8 hex digits
            ; Conforms to APCS
            stmfd     sp!, {r4, lr}

            adr       r2, hex_digits
            adr	      r3, print_hex_string
            mov       r4, #28

printhex_loop
            ;; For r4 = 28 to 0 step -4
            mov       r1, r0, lsr r4	; Get digit n
            and       r1, r1, #0x0f	; mask off lower nibble
            ldrb      r1, [r2, r1]	; r0 now contains a hex number, 
                                    ;look it up in table
            strb      r1, [r3], #1
            subs      r4, r4, #4
            bpl       printhex_loop

            adr       r0, print_hex_string
            bl        putstring

            ldmfd     sp!, {r4, pc}

hex_digits
            DCB       "0123456789ABCDEF"
print_hex_string
            DCB       "12345678",0	; storage for 8 digit hex string, 
                                    ; null terminated
            ALIGN


putchar
            ; Entry: Takes char in r0.
            ; Conforms to APCS
            ; Call SYS_WRITEC, with r1 containing a POINTER TO a character.

            ; SYS_WRITEC = 3, SYS_WRITE0 = 4, SYS_READC = 7

            stmfd     sp!, {r4-r12, lr} ; push the registers that 
                                        ; you want to save

            adr       r1, putchar_temp
            strb      r0, [r1]
            mov       r0, #3
            swi       0x123456

            ldmfd     sp!, {r4-r12, pc} ; and pop them once you're back

putchar_temp
            DCB       0

            ALIGN

putstring
            ; Entry: Takes pointer to a null terminated string in r0
            ; Conforms to APCS
            ; uses Call SYS_WRITE0

            stmfd     r13!, {r4-r12, lr}

            mov       r1, r0
            mov       r0, #4
            swi       0x123456

            ldmfd     r13!, {r4-r12, pc}

            END
