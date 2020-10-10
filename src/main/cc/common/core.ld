OUTPUT_ARCH("riscv")

ENTRY(_start)

GROUP(-lc -lnosys -lgcc)

SECTIONS
{
    .loader :
    {
        *(.vector)
        *(.loader)
    }

    . = 0x00000100;
    _ftext = .;

    .text :
    {
        *(.text)
        *(.text.*)
    }

    .init :
    {
        KEEP(*(.init))
    }

    .fini :
    {
        KEEP(*(.fini))
    }

    PROVIDE(etext = .);
    _etext = .;

    . = 0x10000;
    _fdata = .;

    .data :
    {
        *(.rodata)
        *(.rodata.*)
        *(.srodata)
        *(.eh_frame)
        *(.data)
        *(.data.*)
        *(.sdata)
        *(.init_array.00000)
    }

    . = ALIGN(4);
    _gp = .;

    PROVIDE(edata = .);
    _edata = .;

    _fbss = .;
    .bss :
    {
        *(.bss)
        *(.bss.*)
    }

    PROVIDE(end = .);
    _end = ALIGN(4);

    _stack = 0x20000;
    _uart  = 0x80000000;
    _timer = 0x80001000;
    _gpio  = 0x80002000;
}
