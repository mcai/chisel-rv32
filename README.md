# 课设：
Design RISCV instructions for matrix addition, Implement Matrix addition in chisel, fast as possible

1.	跑通chisel模拟器 30 points
2.	设计实现矩阵加法40 points
3.	分析优化矩阵加法性能 30 points

# Install openjdk-8, sbt

Refer to https://github.com/freechipsproject/chisel-template

# Get and install Xilinx Vivado

Refer to https://Xilinx.com

# Get and install RISCV toolchain from Sifive

Refer to https://www.sifive.com/software

# Get chisel-rv32

`$ git clone https://github.com/ljiaxi/chisel-rv32.git`

# Modify TOOLs path in setup.sh

`$ cd chisel-rv32`

Modify setup.sh with whatever editor you like

# Generate CPU

`$ source setup.sh`

`$ make`

# Run simulation

`$ cd sim`

`$ make test`

# Generate Bitstream for FPGA programming

In $PROJ/sim

`$ make soc.bit`

