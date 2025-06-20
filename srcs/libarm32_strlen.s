.global libarm32_strlen
libarm32_strlen:
    PUSH {r1, r2, lr}
    MOV r1, #0
.loop:
    LDRB r2, [r0, r1]
    CMP r2, #0
    BEQ .done
    ADD r1, r1, #1
    B .loop
.done:
    MOV r0, r1
    POP {r1, r2, pc}

