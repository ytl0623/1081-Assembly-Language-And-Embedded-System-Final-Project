        .data
cX:     .word 0
cY:     .word 0
width:  .word 0
height: .word 0
frame:  .word 0
color:  .word 0
maxIter:    .word 255
zx:     .word 0
zy:     .word 0
tmp:    .word 0
x:      .word 0
y:      .word 0
i:      .word 0
num1:   .word 1500
num2:   .word 1000
num3:   .word 4000000
        .text
        .globl drawJuliaSet

drawJuliaSet:
        ldr r4,=cX      @cX
        str r0,[r4]

        ldr r4,=cY      @cY
        str r1,[r4]

        ldr r4,=width   @width
        str r2,[r4]

        ldr r4,=height  @height
        str r3,[r4]

        ldr r4,=frame   @frame
        str sp,[r4]





        stmfd sp!,{lr}

        ldr r4,=x
        mov r5,#0
        str r5,[r4]

forX:   ldr r0,=x       @for(x=0;x<width;x++)
        ldr r0,[r0]
        ldr r1,=width
        ldr r1,[r1]
        cmp r0,r1
        bge       end

        movne r1,#0       @y=0
        ldrne r0,=y
        strne r1,[r0]


forY:   ldr r0,=y       @for(;y<height;)
        ldr r1,=height
        ldr r0,[r0]
        ldr r1,[r1]
        cmp r0,r1


        bge    forYEnd

        ldr r1,=width       @zx=1500*(x-(width>>1))/(width>>1)
        ldr r1,[r1]

        ldr r0,=x
        ldr r0,[r0]

        mov r1,r1,lsr #1

        sub r0,r0,r1  @x-width>>1


        @mov r0,r0,lsr r2
        ldr r2,=num1
        ldr r2,[r2]
        mul r0,r0,r2
        bl  __aeabi_idiv
        ldr r3,=zx
        str r0,[r3]


        ldr r1,=height       @zx=1500*(x-(width>>1))/(width>>1)
        ldr r1,[r1]
        ldr r0,=y
        ldr r0,[r0]
        mov r1,r1,lsr #1
        sub r0,r0,r1  @x-width>>1

        @mov r0,r0,lsr r2
        ldr r2,=num2
        ldr r2,[r2]
        mul r0,r0,r2
        bl  __aeabi_idiv
        ldr r3,=zy
        str r0,[r3]

        ldr r0, =i          @i=maxIter
        ldr r1, =maxIter
        ldr r1, [r1]
        str r1, [r0]

while:  ldr r0,=zx
        ldr r0,[r0]
        ldr r1,=zy
        ldr r1,[r1]
        ldr r2,=i
        ldr r2,[r2]

        mul r0,r0,r0
        mul r1,r1,r1
        add r0,r0,r1

        ldr r1,=num3
        ldr r1,[r1]

        cmp r0,r1           @while(zx*zx+zy*zy<4000000&&i>0)
        bge endWhile
        @cmplt r2, #0

        ldrlt r0,=i
        ldrlt r0,[r0]

        movlt r1,#0
        adds r14,r0,r1

        ble endWhile

        ldrgt r0,=zx      @tmp=(zx*zx-zy*zy)/1000+cX
        ldrgt r0,[r0]
        ldrgt r1,=zy
        ldrgt r1,[r1]
        ldrgt r2,=i
        ldrgt r2,[r2]

        mul r0,r0,r0
        mul r1,r1,r1
        sub r0,r0,r1

        ldr r1,=num2
        ldr r1,[r1]

        @mov r0,r0,lsr r1
        bl  __aeabi_idiv

        ldr r1,=cX
        ldr r1,[r1]
        add r0,r0,r1
        ldr r1,=tmp
        str r0,[r1]

        ldr r0,=zx      @zy=(2*zx*zy)/1000+cy
        ldr r0,[r0]
        ldr r1,=zy
        ldr r1,[r1]

        mul r0,r0,r1
        mov r1,#2
        mul r0,r0,r1
        ldr r1,=num2
        ldr r1,[r1]
        bl  __aeabi_idiv
        ldr r1,=cY
        ldr r1,[r1]
        add r0,r0,r1
        ldr r1,=zy
        str r0,[r1]

        ldr r0,=zx      @zx=tmp
        ldr r1,=tmp
        ldr r1,[r1]
        str r1,[r0]

        ldr r0,=i       @i--
        mov r1,r0
        ldr r1,[r1]
        sub r1,r1,#1
        str r1,[r0]

        b while

endWhile:
        ldr r1,=i       @color=((i&0xff)<<8)|(i&0xff)
        ldr r1,[r1]
        ldr r2,=0xff
        and r1,r1,r2
        mov r3,r1,lsl #8
        orr r0,r1,r3

        mvn r0,r0       @color=(~color&0xffff)
        ldr r1,=0xffff
        and r0,r0,r1
        ldr r1,=color
        str r0,[r1]

        ldr r0,=frame   @frame[y][x]=color
        ldr r0,[r0]
        ldr r1,=width
        ldr r1,[r1]
        ldr r2,=y
        ldr r2,[r2]
        mul r1,r1,r2
        ldr r2,=x
        ldr r2,[r2]
        add r1,r1,r2
        mov r2,#2
        mul r1,r1,r2
        add r0,r0,r1

        ldr r1,=color
        ldr r1,[r1]
        strh r1,[r0]

        ldr r0,=y
        ldr r0,[r0]
        add r0,#1
        ldr r1,=y
        str r0,[r1]
        b forY

forYEnd: ldr r0,=x     @if(y==height)
        mov r1,r0     @x++
        ldr r1,[r1]
        add r1,r1,#1
        str r1,[r0]
        b forX

end:    mov r0,#0
        ldmfd   sp!,{lr}
        mov pc,lr











