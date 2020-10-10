  .section .vector, "ax"
  .align 5

  j    reset
  j    trap

  .section .loader, "ax"

  .text
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
  # Initialize global pointer
1:
  auipc gp, %pcrel_hi(_gp)
  addi  gp, gp, %pcrel_lo(1b)

  # Clear the BSS segment
  la      t0, _fbss
  la      t1, _end
1:
  sw      zero,0(t0)
  addi    t0, t0, 4
  bltu    t0, t1, 1b

#  la      a0, __libc_fini_array
#  call    atexit
#  call    __libc_init_array

  la      sp, _stack
  //lw      a0, 0(sp) # a0 = argc
  //addi    a1, sp, 4 # a1 = argv
  //li      a2, 0     # a2 = envp = NULL
  call    main
  nop
  j       .

  .global _init
  .global _fini
_init:
_fini:
  ret
