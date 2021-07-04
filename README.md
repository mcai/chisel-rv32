# 课程设计内容

## 整体目标

设计矩阵乘法的RISCV指令，在chisel中实现矩阵乘法指令，越快越好。

## 问题背景

数学中，矩阵乘法（英语：matrix multiplication）是一种根据两个矩阵得到第三个矩阵的二元运算，第三个矩阵即前两者的乘积，称为矩阵积（英语：matrix product）。设 A 是 n x m 的矩阵，B 是 m x p 的矩阵，则它们的矩阵积 AB 是 n x p 的矩阵。A中每一行的 m 个元素都与 B 中对应列的 m 个元素对应相乘，这些乘积的和就是 AB 中的一个元素。

矩阵可以用来表示线性映射，矩阵积则可以用来表示线性映射的复合。因此，矩阵乘法是线性代数的基础工具，不仅在数学中有大量应用，在应用数学、物理学、工程学等领域也有广泛使用。

## 具体要求

请根据自己兴趣，1必做，2a和2b可选做其一。

1. 用Chisel语言设计、实现、跑通 32 x 32 （n = m = p = 32）大小的随机矩阵乘法，并计算矩阵乘法需要的时钟周期数。（60分）

2a.	采用流水线技术优化矩阵乘法性能，并计算加速比 = 改进前的时钟周期数 / 改进后的时钟周期数；采用分块技术优化矩阵乘法性能，支持 512 x 512（n = m = p = 512）大小的随机矩阵乘法运算，并计算加速比。（40分）

2b.	在riscv汇编语言中通过insn自定义矩阵乘法指令（mload, mmult, mstore），在chisel-rv32中实现上述三种指令，用C语言编写测试程序调用上述三种指令完成随机矩阵乘法，最后在vivado模拟器上跑通该程序。 (40分)


# 参考资料

1. Chisel编程，请参考 doc/目录下的chisel-book-chinese.pdf电子书。

2. Vivado仿真，请参考以下步骤和 doc/目录下的report.pdf。

## Vivado实验步骤

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
