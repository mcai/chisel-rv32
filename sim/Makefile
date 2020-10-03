#
# Copyright 2015, 2016 C. Brett Witherspoon
#
# See LICENSE for more details.
#

TOP = cpubench.sv
PKG = axi4.sv
INT = axi.sv
RTL = ram.sv blockram.sv
GEN = Cpu.v

INIT = testbench.text.mem testbench.data.mem

%.mem:
	make -C $(PROJ)/src/main/cc/ $(notdir $@)

.PHONY: clean

include vivado.mk

clean:
	$(RM) -rf Cpu.* *.mem *.log *.wcfg *.jou *.pb *.vcd *.wdb *.str xsim.dir .Xil

