PREFIX  ?= /opt/riscv/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-
AS      = $(PREFIX)as
CC	= $(PREFIX)gcc
COPTS = -march=rv32i -mabi=ilp32 -g
LD	= $(PREFIX)ld
OBJCOPY = $(PREFIX)objcopy
OD      ?= od

KTEXT   ?= 0x000
ENTRY   ?= 0x040
TEXT    ?= 0x040
DATA    ?= 0xC00
BSS     ?= 0x800

#RISCV ?= $(HOME)/.local/riscv

#PATH := $(RISCV)/bin:$(PATH)

all: $(PROJSIM)/boot.mem

test: $(PROJSIM)/testbench.text.mem $(PROJSIM)/testbench.data.mem

%.text.bin: %.elf
	$(OBJCOPY) -O binary -j .vector -j .loader -j .text $< $@

%.data.bin: %.elf
	$(OBJCOPY) -O binary -j .data -j .bss $< $@

%.elf: %.c crt0.S
	$(CC) $(COPTS) -T core.ld -nostdlib -nostartfiles -o $@ $^

%.o: %.S
	$(CC) $(COPTS) -c -o $@ $^

%.elf: %.o
	$(CC) $(COPTS) -T core.ld -nostdlib -nostartfiles -o $@ $^

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

$(PROJSIM)/%.mem: %.bin
	$(OD) -An -tx4 -w4 -v $< > $@

clean:
	$(RM) *.elf *.bin *.mem *.o

.PHONY: all clean

