    .section .vector, "ax"
    .align 5

    j    reset
    j    trap

    .section .loader, "ax"
    .align 5
    .global _start

reset:
    li x1, 0
    li x2, 0
    li x3, 0
    li x4, 0
    li x5, 0
    li x6, 0
    li x7, 0
    li x8, 0
    li x9, 0
    li x10, 0
    li x11, 0
    li x12, 0
    li x13, 0
    li x14, 0
    li x15, 0
    li x16, 0
    li x17, 0
    li x18, 0
    li x19, 0
    li x20, 0
    li x21, 0
    li x22, 0
    li x23, 0
    li x24, 0
    li x25, 0
    li x26, 0
    li x27, 0
    li x28, 0
    li x29, 0
    li x30, 0
    li x31, 0
    j _start

trap:
    j .

_start:
    # Test execute and memory forwarding
    li  t0,-1
    li  t1, 6
    add t2,t0,t1

    # Test memory and writeback forwarding
    li  t0, 4
    li  t1, 5
    nop
    add t2,t0,t1

    # Test timer
    la   t0,_timer
    li   t1,1
    sw   t1,4(t0)

    # Test store and load
    la   t0,_fdata
    li   t1,1
    sw   t1,0(t0)
    lw   t2,0(t0)
    andi t3,t2,2

    # test UART.SCR
    la   t0,_uart
    li   t1,0xA5
    sb   t1,7(t0)
    # set 8n1
    li   t1,0x3
    sb   t1,3(t0)
    // send byte
    li   t2,'h'
    sb   t2,0(t0)
    li   t2,'e'
    sb   t2,0(t0)
    li   t2,'l'
    sb   t2,0(t0)
    li   t2,'l'
    sb   t2,0(t0)
    li   t2,'o'
    sb   t2,0(t0)
    li   t2,'\n'
    sb   t2,0(t0)
    // wait print
    li   t1,10
l1: addi t1,t1,-1
    bne  t1,x0,l1
    // finish
    li   t2,0xFF
    sb   t2,7(t0)

    j   .
