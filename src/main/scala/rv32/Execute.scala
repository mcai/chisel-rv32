package rv32

import chisel3._
import chisel3.util._

class Execute extends Module {
  val io = IO(new Bundle {
    val branch = Output(Bool())
    val target = Output(UInt(32.W))
    val bypass = Output(UInt(32.W))
    val source = Flipped(Irrevocable(new ExT))
    val sink = Irrevocable(new MmT)
  })
  val x_alu = Module(new ALU)

  val mm = Reg(new MmT)
  val out = x_alu.io.out
  val ex = io.source.bits

  io.sink.bits := mm
  io.target := Mux(io.branch, out, ex.data.pc + 4.U)
  io.bypass := out

  val eq = ex.data.rs1 === ex.data.rs2
  val lt = ex.data.rs1.asSInt < ex.data.rs2.asSInt
  val ltu= ex.data.rs1 < ex.data.rs2

  val jmp = ex.ctrl.op === op_t.JUMP
  val beq = ex.ctrl.op === op_t.BRANCH & ex.ctrl.br === br_t.BEQ  & eq
  val bne = ex.ctrl.op === op_t.BRANCH & ex.ctrl.br === br_t.BNE  & ~eq
  val blt = ex.ctrl.op === op_t.BRANCH & ex.ctrl.br === br_t.BLT  & lt
  val bltu= ex.ctrl.op === op_t.BRANCH & ex.ctrl.br === br_t.BLTU & ltu
  val bge = ex.ctrl.op === op_t.BRANCH & ex.ctrl.br === br_t.BGE  & (eq | ~lt)
  val bgeu= ex.ctrl.op === op_t.BRANCH & ex.ctrl.br === br_t.BGEU & (eq | ~ltu)

  io.branch := io.source.fire() & (jmp | beq | bne | blt | bltu | bge | bgeu)

  x_alu.io.fn := ex.ctrl.fn
  x_alu.io.op1 := ex.data.op1
  x_alu.io.op2 := ex.data.op2

  io.source.ready := io.sink.ready

  val tvalid = RegInit(false.B)
  when(io.source.fire()) {tvalid := true.B}
  .elsewhen(io.sink.fire()) {tvalid := false.B}

  io.sink.valid := tvalid

  when(io.sink.ready) {
    mm.ctrl.op := ex.ctrl.op
    mm.ctrl.br := io.branch
    mm.ctrl.target := io.target
    mm.data.pc := ex.data.pc
    mm.data.ir := ex.data.ir
    mm.data.rd := ex.data.rd
    mm.data.alu := Mux(jmp, ex.data.pc + 4.U, out)
    mm.data.rs2 := ex.data.rs2
  }
}
