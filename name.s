        .data
print:  .asciz "*****Print Name*****\n"
team:   .asciz "Team 14\n"
one:    .asciz "Yu-Ting Liu\n"
two:    .asciz "Yen-Lung Chen\n"
three:    .asciz "Yi-Hung Lu\n"
eprint:  .asciz "*****End Print*****\n"

        .text
        .globl  name


name:

        stmfd   sp!, {lr,r0,r1,r2,r3}

        ldr     r0, =print
        bl      printf
        mov     r0, #0

        ldr     r0, =team

        bl      printf



        mov     r0, #0

        ldr     r1, =one
        mov     r0, r1
        bl      printf


        ldr     r2,=two
        mov     r0, r2
        bl      printf


        ldr     r3,=three
        mov     r0, r3
        bl      printf


        ldr     r0, =eprint
        bl      printf


        @ldr     r0,=team
        @mov     r8, r0

        @ldr     r0,=one
        @mov     r9, r0

        @ldr     r0,=two
        @mov     r10, r0

        @ldr     r0,=three
        @mov     r11, r0


        sbcs    r0,r3,r4
        ldmfd   sp!, {lr,r0,r1,r2,r3}

        ldr     r4,=team
        str     r4,[r0]

        ldr     r4,=one
        str     r4,[r1]

        ldr     r4,=two
        str     r4,[r2]

        ldr     r4,=three
        str     r4,[r3]
        mov r0,#0
        mov r1,#0
        mov r2,#0
        mov r3,#0

        mov     pc, lr





