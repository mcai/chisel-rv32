PREFIX  ?= riscv64-unknown-elf-
ABI     = -march=rv32i -mabi=ilp32
AS      = $(PREFIX)as
CC	= $(PREFIX)gcc
LD	= $(PREFIX)ld
OBJCOPY = $(PREFIX)objcopy
OBJDUMP = $(PREFIX)objdump
OD      ?= od
LD_SRC  = $(PROJ)/src/main/cc/common/core.ld
INCDIR  = $(PROJ)/src/main/cc/common
CRT0    = $(PROJ)/src/main/cc/common/crt0.S
BOARD   = $(PROJ)/src/main/cc/common/board.c
SRC     = main.c

COPTS = -g $(ABI) $(addprefix -I,$(INCDIR))

RISCV ?= $(RVTOOL_HOME)

PATH := $(RISCV)/bin:$(PATH)

all: test

test: $(PROJSIM)/testbench.text.mem $(PROJSIM)/testbench.data.mem $(PROJSIM)/testbench.dis

%.text.bin: %.elf
	$(OBJCOPY) -O binary -j .vector -j .loader -j .text $< $@

%.data.bin: %.elf
	$(OBJCOPY) -O binary -j .data -j .bss $< $@

#%.o: %.S
#	$(CC) $(COPTS) -c -o $@ $^

#%.o: %.c
#	$(CC) $(COPTS) -c -o $@ $^

testbench.elf: $(CRT0) $(BOARD) $(SRC)
	$(CC) $(COPTS) $^ -T $(LD_SRC) -nostdlib -nostartfiles -o $@

$(PROJSIM)/%.dis: %.elf
	$(OBJDUMP) -dsSx $< > $@

$(PROJSIM)/%.mem: %.bin
	$(OD) -An -tx4 -w4 -v $< > $@

clean:
	$(RM) *.elf *.bin *.o

.PRECIOUS: %.elf %.text.bin %.data.bin %.bin

.PHONY: clean


