AREA ||.text||, CODE, READONLY, ALIGN=2;

hello PROC
  PUSH {r1-r3, lr}
  ADR r0, |L1.36|
  LDM r0, {r2, r3, r12}
  STM r1, {r2, r3, r12}
  ADR r0, |L1.48|
  BL  __2printf
  MOV r0, #0
  POP {r1-r3, pc}
  ENDP
  
|L1.36|
  DCB "Hell"
  DCB "o wo"
  DCB "rld\0"
  
|L1.48|
  DCB "%s\0"
