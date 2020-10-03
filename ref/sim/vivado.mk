#
# Copyright 2015, 2016 C. Brett Witherspoon
#
# See LICENSE for more details.
#

TOP ?= testbench.sv
PKG ?=
INT ?=
RTL ?=
ALL = $(PKG) $(INT) $(RTL) $(TOP)

INIT ?= src/boot.mem
TIME ?= "1ns/1ps"

LIB  = work
SNAP = $(LIB).$(basename $(TOP))

PRJDIR = $(PROJ)/ref
SIMDIR = $(PRJDIR)/sim
RTLDIR = $(PRJDIR)/sv/rtl
INTFDIR= $(PRJDIR)/sv/intf
SRCDIR = $(PRJDIR)/sim/src
LIBDIR = xsim.dir/$(LIB)

VIVADO_DIR ?= /opt/Xilinx/Vivado/2019.2

PATH := $(VIVADO_DIR)/bin:$(PATH)

VPATH = $(RTLDIR):$(INTFDIR):$(SRCDIR):$(LIBDIR)

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

xsim.dir/$(LIB).$(basename $(TOP))/xsimk: $(addprefix $(LIBDIR)/,$(ALL:.sv=.sdb))
	xelab -nolog --timescale $(TIME) --debug typical -L $(LIB) $(SNAP)

$(LIBDIR)/$(INT:.sv=.sdb): | $(PKG:.sv=.sdb)

$(LIBDIR)/$(RTL:.sv=.sdb): | $(PKG:.sv=.sdb) $(INT:.sv=.sdb)

$(LIBDIR)/$(TOP:.sv=.sdb): $(TOP) | $(INIT) $(PKG:.sv=.sdb) $(INT:.sv=.sdb) $(RTL:.sv=.sdb)
	xvlog -nolog --sv --work $(LIB) --define TEXT_FILE=\"$(word 1,$|)\" --define DATA_FILE=\"$(word 2,$|)\" -L $(LIB) $<

$(LIBDIR)/%.sdb: %.sv
	xvlog -nolog --sv --work $(LIB) -L $(LIB) $<

$(LIBDIR):
	mkdir -p $@
