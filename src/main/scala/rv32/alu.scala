package rv32

import Chisel._
import chisel3._
import chisel3.util._

class Alu extends Module {
  val io = IO(new Bundle {
    val fn = Input UInt(4.W)
    val op1 = Input UInt(32.W)
    val op2 = Input UInt(32.W)
    val out = Output UInt(32.W)
  })

  val shamt = Wire(UInt(5.W))
  shamt := io.op2(4, 0)

  io.out := Fill(BitPat("b?"), 32)
  switch(io.fn) {
    is(fn_t.ADD) { io.out := io.op1 + io.op2 }
    is(fn_t.SUB) { io.out := io.op1 - io.op2 }
    is(fn_t.SLL) { io.out := io.op1 << shamt }
    is(fn_t.SLT) { io.out := Cat(UInt(0, 31.W), (SInt(io.op1) < SInt(io.op2))) }
    is(fn_t.SLTU){ io.out := Cat(UInt(0, 31.W), (io.op1 < io.op2)) }
    is(fn_t.XOR) { io.out := io.op1 ^ io.op2 }
    is(fn_t.SRL) { io.out := io.op1 >> shamt }
    is(fn_t.SRA) { io.out := SInt(io.op1) >> shamt }
    is(fn_t.OR ) { io.out := io.op1 | io.op2 }
    is(fn_t.AND) { io.out := io.op1 & io.op2 }
    is(fn_t.OP2) { io.out := io.op2 }
  }
}
