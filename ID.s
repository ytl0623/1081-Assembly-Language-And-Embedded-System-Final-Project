

        .data
print:  .asciz "*****Print Team Member ID and ID Summation*****\n"
str1:   .asciz "%d"
str2:   .asciz "%d\n"
ansStr: .asciz "ID Summation = %d\n"
a:      .word 0
b:      .word 0
c:      .word 0
w:      .word 0
str3:   .asciz "%s"
m1:     .asciz "** Please Enter Member 1 ID:**\n"
m2:     .asciz "** Please Enter Member 2 ID:**\n"
m3:     .asciz "** Please Enter Member 3 ID:**\n"
cmd:    .asciz "** Please Enter Command **\n"
cmde:   .asciz "\n** Error Command **\n"
ans:    .word 0
p:      .word 'p'
eprint:  .asciz "*****End Print*****\n"
id1:     .word 2


        .text
        .globl ID


ID:


        stmfd sp!, {lr,r0,r1,r2,r3}

        ldr     r0, =m1
        bl      printf
        ldr r0, =str1
        ldr r1,=a
        bl scanf

        ldr     r0, =m2
        bl      printf
        ldr r0, =str1
        ldr r1,=b
        bl scanf

        ldr     r0, =m3
        bl      printf
        ldr r0, =str1
        ldr r1,=c
        bl scanf

        mov r0, #0
        mov r1, #0

        ldr     r0, =cmd
        bl      printf

        ldr r0, =str3
        ldr r1 ,=w
        bl scanf

        ldr r4,=w
        ldr r5,=p
        ldr r5,[r5]
        ldr r4,[r4]
        cmp r4,r5

        ldreq     r0, =print
        ldrne       r0,=cmde
        bl      printf

        cmp r4,r5
        ldr r0,=str2
        ldr r1,=a
        ldr r1,[r1]
        bleq printf


        ldr r0,=str2
        ldr r1,=b
        ldr r1,[r1]
        bleq printf


        ldr r0,=str2
        ldr r1,=c
        ldr r1,[r1]
        bleq printf

        ldr r1,=a
        ldr r1,[r1]
        ldr r2,=b
        ldr r2,[r2]
        ldr r3,=c
        ldr r3,[r3]
        addeq r1,r1,r2
        addeq r1,r1,r3
        ldrvc r0,=ans
        streq r1,[r0]
        ldr r0,=ansStr
        bleq printf
        ldr     r0, =eprint
        bleq      printf



        @ldr     r0,=a
        @mov     r4, r0
        @ldr     r4,[r4]


        @ldr     r0,=b
        @mov     r5, r0
        @ldr     r5,[r5]

        @ldr     r0,=c
        @mov     r6, r0
        @ldr     r6,[r6]


        @ldr     r0,=ans
        @mov     r7, r0
        @str     r7,[r7,#4]

        mov r0,#0
        ldmfd sp!,{lr,r0,r1,r2,r3}

        ldr r4,=a
        ldr r4,[r4]
        str r4,[r0]


        ldr r4,=b
        ldr r4,[r4]
        str r4,[r1]



        ldr r4,=c
        ldr r4,[r4]
        str r4,[r2]



        ldr r4,=ans
        ldr r4,[r4]
        str r4,[r3]

        mov r0,#0
        mov r1,#0
        mov r2,#0
        mov r3,#0


        mov pc, lr

