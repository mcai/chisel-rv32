#
# Copyright 2015, 2016 C. Brett Witherspoon
#
# See LICENSE for more details.
#

TOP = testbench.sv
PKG = axi4.sv      \
      opcodes.sv   \
      funct3.sv    \
      rv32.sv
INT = axi.sv       \
      axis.sv
RTL = alu.sv       \
      arbitrate.sv \
      blockram.sv  \
      cpu.sv       \
      decode.sv    \
      execute.sv   \
      fetch.sv     \
      forward.sv   \
      hazard.sv    \
      memory.sv    \
      ram.sv       \
      regfile.sv   \
      writeback.sv
INIT = src/testbench.text.mem src/testbench.data.mem

%.mem:
	make -C src/ $(notdir $@)

.PHONY: clean

include vivado.mk

clean:
	$(RM) -rf *.log *.jou *.pb *.vcd *.wdb *.str xsim.dir .Xil
	make -C src/ $@

