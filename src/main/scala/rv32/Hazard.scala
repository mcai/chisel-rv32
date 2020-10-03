package rv32

import chisel3._
import chisel3.util._

class Hazard extends Module {
  val io = IO(new Bundle {
    val decode    = Input(Irrevocable(new IdT))
    val execute   = Input(Irrevocable(new ExT))
    val memory    = Input(Irrevocable(new MmT))
    val writeback = Input(Irrevocable(new WbT))
    val stall     = Output(Bool())
    val lock      = Output(Bool())
  })
  val id = io.decode.bits
  val ex = io.execute.bits
  val mm = io.memory.bits
  val wb = io.writeback.bits
  val opcode = id.ir.r_opcode
  val jump = opcode === opcode_t.JAL | opcode === opcode_t.JALR | opcode === opcode_t.BRANCH

  io.stall := io.decode.valid & jump
  io.lock  := (io.execute.valid & isload(ex.ctrl.op)) | (io.memory.valid & isload(mm.ctrl.op))
}
