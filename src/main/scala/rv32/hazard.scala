package rv32

import Chisel._
import chisel3._
import chisel3.util._

class Hazard extends Module {
  val io = IO(new Bundle {
    val decode =  Input(new Axis(data_width = IdT.getWidth))
    val execute = Input(new Axis(data_width = ExT.getWidth))
    val memory =  Input(new Axis(data_width = MmT.getWidth))
    val writeback = Input(new Axis(data_width = WbT.getWidth))
    val stall = Output(Bool)
    val lock = Output(Bool)
  })
  val id = Wire(new IdT)
  val ex = Wire(new ExT)
  val mm = Wire(new MmT)
  val wb = Wire(new WbT)
  val opcode = Wire(UInt(7.W))
  id := io.decode.t.data
  ex := io.execute.t.data
  mm := io.memory.t.data
  wb := io.writeback.t.data
  opcode := id.data.ir.r_opcode

  val jump = Wire(Bool)
  jump := opcode === opcode_t.JAL | opcode === opcode_t.JALR | opcode === opcode_t.BRANCH
  io.stall := io.decode.t.valid & jump
  io.lock  := (io.execute.t.valid & isload(ex.ctrl.op)) | (io.memory.t.valid & isload(mm.ctrl.op))
}
