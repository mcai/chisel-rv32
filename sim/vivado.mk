#
# Copyright 2015, 2016 C. Brett Witherspoon
#
# See LICENSE for more details.
#

#TOP ?= cpubench.sv
GEN ?=
RTL ?=
ALL = $(RTL) $(TOP)

#INIT ?= src/boot.mem
TIME ?= --timescale "1ns/1ps"

LIB  = work
SNAP = $(LIB).$(basename $(notdir $(TOP)))

PRJDIR = $(PROJ)
SIMDIR = $(PRJDIR)/sim
RTLDIR = $(PRJDIR)/src/main/sv
INTFDIR= $(RTLDIR)/amba
LIBDIR = xsim.dir/$(LIB)

VIVADO_DIR ?= $(VIVADO_HOME)

PATH := $(VIVADO_DIR)/bin:$(PATH)

VPATH = $(RTLDIR)/soc:$(RTLDIR)/ram:$(RTLDIR)/uart:$(RTLDIR)/timer:$(INTFDIR):$(SIMDIR):$(LIBDIR)

.PHONY: all test tcl gui xsim xelab xvlog

all: xelab

test: xsim

tcl: xelab $(INIT)
	xsim -nolog $(SNAP)

gui: $(TOP:.sv=.wcfg) xelab $(INIT)
	xsim -nolog -gui -view $< $(SNAP) &

xsim: xelab $(INIT)
	xsim -nolog -runall $(SNAP)

xelab: xsim.dir/$(SNAP)/xsimk

xvlog: $(ALL:.sv=.sdb)

$(TOP:.sv=.wcfg):
	touch $@

xsim.dir/$(LIB).$(basename $(notdir $(TOP)))/xsimk: $(addprefix $(LIBDIR)/,$(notdir $(ALL:.sv=.sdb)))
	xelab -nolog $(TIME) --debug typical -L $(LIB) $(SNAP)

$(LIBDIR)/$(notdir $(RTL:.sv=.sdb)):

$(LIBDIR)/$(notdir $(TOP:.sv=.sdb)): $(TOP) | $(INIT) $(LIBDIR)/$(notdir $(RTL:.sv=.sdb)) $(LIBDIR)/@cpu.sdb
	xvlog -nolog --sv --work $(LIB) --define TEXT_FILE=\"$(word 1,$|)\" --define DATA_FILE=\"$(word 2,$|)\" -L $(LIB) $<

$(LIBDIR)/@cpu.sdb: $(GEN)
	xvlog -nolog --work $(LIB) -L $(LIB) $<

$(LIBDIR)/%.sdb: %.sv
	xvlog -nolog --sv --work $(LIB) -L $(LIB) $<

Cpu.v: $(PROJ)/src/main/scala/rv32/*.scala
	make -C $(PROJ) sim/$@

soc.bit: soc.dcp
	vivado -log impl.log -jou impl.jou -mode batch -source $(PROJ)/fpga/impl.tcl

soc.dcp: $(RTL) $(GEN) $(INIT)
	vivado -log syn.log -jou syn.jou -mode batch -source $(PROJ)/fpga/syn.tcl

