PREFIX  ?= riscv64-unknown-elf-
AS      = $(PREFIX)as
CC	= $(PREFIX)gcc
COPTS = -march=rv32i -mabi=ilp32 -g
LD	= $(PREFIX)ld
OBJCOPY = $(PREFIX)objcopy
OBJDUMP = $(PREFIX)objdump
OD      ?= od
LD_SRC  = $(PROJ)/src/main/cc/common/core.ld
CRT0    = $(PROJ)/src/main/cc/common/crt0.S

RISCV ?= $(RVTOOL_HOME)

PATH := $(RISCV)/bin:$(PATH)

all: test

test: $(PROJSIM)/testbench.text.mem $(PROJSIM)/testbench.data.mem $(PROJSIM)/testbench.dis

%.text.bin: %.elf
	$(OBJCOPY) -O binary -j .vector -j .loader -j .text $< $@

%.data.bin: %.elf
	$(OBJCOPY) -O binary -j .data -j .bss $< $@

%.elf: %.c crt0.S
	$(CC) $(COPTS) -T $(LD_SRC) -nostdlib -nostartfiles -o $@ $^

%.o: %.S
	$(CC) $(COPTS) -c -o $@ $^

%.elf: %.o
	$(CC) $(COPTS) -T $(LD_SRC) -nostdlib -nostartfiles -o $@ $^

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

$(PROJSIM)/%.dis: %.elf
	$(OBJDUMP) -xdS $< > $@

$(PROJSIM)/%.mem: %.bin
	$(OD) -An -tx4 -w4 -v $< > $@

clean:
	$(RM) *.elf *.bin *.o

.PRECIOUS: %.elf %.text.bin %.data.bin %.bin

.PHONY: clean


