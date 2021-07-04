# 课程设计内容：

## 整体目标

设计矩阵乘法的RISCV指令，在chisel中实现矩阵乘法，越快越好。

## 问题背景

数学中，矩阵乘法（英语：matrix multiplication）是一种根据两个矩阵得到第三个矩阵的二元运算，第三个矩阵即前两者的乘积，称为矩阵积（英语：matrix product）。设{\displaystyle A}A是{\displaystyle n\times m}{\displaystyle n\times m}的矩阵，{\displaystyle B}B是{\displaystyle m\times p}m\times p的矩阵，则它们的矩阵积{\displaystyle AB}AB是{\displaystyle n\times p}n\times p的矩阵。{\displaystyle A}A中每一行的{\displaystyle m}m个元素都与{\displaystyle B}B中对应列的{\displaystyle m}m个元素对应相乘，这些乘积的和就是{\displaystyle AB}AB中的一个元素。

## 具体要求

1.	用C语言编写两个 32 x 32 大小随机矩阵乘法程序，并在vivado模拟器上跑通该程序。 (20分)
2.	设计、实现、跑通矩阵乘法，并计算矩阵乘法需要的时钟周期数。（20分）
3.	采用流水线技术优化矩阵乘法性能，并计算加速比 = 改进前的时钟周期数 / 改进后的时钟周期数。（20分）
4.	采用分块技术优化矩阵乘法性能，支持 512 x 512 大小的矩阵乘法运算。（20分）

# 课程设计指导书

## 详见 doc/目录下的文档说明。

# 主要实验步骤

## 安装 openjdk-8和sbt

请参考 https://github.com/freechipsproject/chisel-template

## 安装 Xilinx Vivado

请参考 https://Xilinx.com

## 安装来自 Sifive 的 RISCV 工具链

Refer to https://www.sifive.com/software

## 获取 chisel-rv32

`$ git clone https://github.com/mcai/chisel-rv32`

## 在setup.sh修改 TOOLs 路径

`$ cd chisel-rv32`

Modify setup.sh with whatever editor you like

## 生成 CPU 实现

`$ source setup.sh`

`$ make`

## 运行Vivado仿真

`$ cd sim`

`$ make test`

## （选做，不做要求）生成bit流，用于FPGA编程

In $PROJ/sim

`$ make soc.bit`
