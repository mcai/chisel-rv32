package rv32

import Chisel._
import chisel3._
import chisel3.util._

class Execute extends Module {
  val io = IO(new Bundle {
    val branch = Output Bool
    val target = Output UInt(32.W)
    val bypass = Output UInt(32.W)
    val source = Flipped(new Axis(data_width = (new ExT).getWidth))
    val sink = new Axis(data_width = (new MmT).getWidth)
  })
  val ex = Wire(new ExT)
  val mm = Reg(new MmT)
  val out = Wire(UInt(32.W))
  ex := io.source.t.data
  io.sink.t.data := mm
  io.target := Mux(io.branch, out, ex.data.pc + 4.U)
  io.bypass := out

  val eq = ex.data.rs1 == ex.data.rs2
  val lt = ex.data.rs1.asSInt < ex.data.rs2.asSInt
  val ltu= ex.data.rs1 < ex.data.rs2

  val jmp = ex.ctrl.op === op_t.JUMP
  val beq = ex.ctrl.op === op_t. BRANCH & ex.ctrl.br === br_t.BEQ  & eq
  val bne = ex.ctrl.op === op_t. BRANCH & ex.ctrl.br === br_t.BNE  & ~eq
  val blt = ex.ctrl.op === op_t. BRANCH & ex.ctrl.br === br_t.BLT  & lt
  val bltu= ex.ctrl.op === op_t. BRANCH & ex.ctrl.br === br_t.BLTU & ltu
  val bge = ex.ctrl.op === op_t. BRANCH & ex.ctrl.br === br_t.BGE  & (eq | ~lt)
  val bgeu= ex.ctrl.op === op_t. BRANCH & ex.ctrl.br === br_t.BGEU & (eq | ~ltu)

  io.branch := io.source.t.valid & (jmp | beq | bne | blt | bltu | bge | bgeu)

  val x_alu = Module(new ALU)
  x_alu.fn := ex.ctrl.fn
  x_alu.op1 := ex.ctrl.op1
  x_alu.op2 := ex.ctrl.op2
  out := x_alu.out

  io.source.t.ready = io.sink.t.ready

  val tvalid = RegInit(false.B)
  when(io.source.t.valid & io.source.t.ready) {tvalid := true.B}
  .elsewhen(io.sink.t.valid & io.sink.t.ready) {tvalid := false.B}

  io.sink.tvalid := tvalid

  when(io.sink.t.ready) {
    mm.ctrl.op := ex.ctrl.op
    mm.ctrl.br := ex.ctrl.br
    mm.data.rd := ex.data.rd
    mm.data.alu := Mux(jmp, ex.data.pc + 4.U, out)
    mm.data.rs2 := ex.data.rs2
  }
}
