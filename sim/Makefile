#
# Copyright 2015, 2016 C. Brett Witherspoon
#
# See LICENSE for more details.
#

TOP = $(PROJSIM)/cpubench.sv
GEN = $(PROJSIM)/Cpu.v
RTL = $(PROJ)/src/main/sv/amba/axi4.sv \
			$(PROJ)/src/main/sv/amba/axi.sv \
			$(PROJ)/src/main/sv/amba/apb.sv \
			$(PROJ)/src/main/sv/amba/axi2apb.sv \
			$(PROJ)/src/main/sv/uart/apb_uart.sv \
			$(PROJ)/src/main/sv/uart/uart_interrupt.sv \
			$(PROJ)/src/main/sv/uart/uart_tx.sv \
			$(PROJ)/src/main/sv/uart/uart_rx.sv \
			$(PROJ)/src/main/sv/uart/io_generic_fifo.sv \
			$(PROJ)/src/main/sv/timer/apb_timer.sv \
			$(PROJ)/src/main/sv/timer/timer.sv \
			$(PROJ)/src/main/sv/ram/blockram.sv \
			$(PROJ)/src/main/sv/ram/ram.sv \
			$(PROJ)/src/main/sv/soc/soc.sv \

INIT = testbench.text.mem testbench.data.mem

%.mem:
	make -C $(PROJ)/src/main/cc/benchmark

.PHONY: clean

include vivado.mk

clean:
	$(RM) -rf Cpu.* *.mem *.dis *.log *.jou *.pb *.vcd *.wdb *.str xsim.dir .Xil

