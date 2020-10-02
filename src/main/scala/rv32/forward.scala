package rv32

import chisel3._
import chisel3.util._

class Forward extends Module {
  val io = IO(new Bundle {
    val decode    = Input(Irrevocable(new IdT))
    val execute   = Input(Irrevocable(new ExT))
    val memory    = Input(Irrevocable(new MmT))
    val writeback = Input(Irrevocable(new WbT))
    val rs1       = Output(UInt(2.W))
    val rs2       = Output(UInt(2.W))
  })

  val id = io.decode.bits
  val ex = io.execute.bits
  val mm = io.memory.bits
  val wb = io.writeback.bits

  val ex_rs1 = io.execute.valid & (id.ir.r_rs1 === ex.data.rd) & isinteger(ex.ctrl.op)
  val mm_rs1 = io.memory.valid & (id.ir.r_rs1 === mm.data.rd) & isinteger(mm.ctrl.op)
  val wb_rs1 = io.writeback.valid & (id.ir.r_rs1 === wb.data.rd.addr) & (isinteger(wb.ctrl.op) | isload(wb.ctrl.op))
  val ex_rs2 = io.execute.valid & (id.ir.r_rs2 === ex.data.rd) & isinteger(ex.ctrl.op)
  val mm_rs2 = io.memory.valid & (id.ir.r_rs2 === mm.data.rd) & isinteger(mm.ctrl.op)
  val wb_rs2 = io.writeback.valid & (id.ir.r_rs2 === wb.data.rd.addr) & (isinteger(wb.ctrl.op) | isload(wb.ctrl.op))

  io.rs1 := rs_t.REG
  when(id.ir.r_rs1 != 0.U) {
    when(ex_rs1) { io.rs1 := rs_t.ALU }
    .elsewhen(mm_rs1) { io.rs1 := rs_t.EXE }
    .elsewhen(wb_rs1) { io.rs1 := rs_t.MEM }
  }

  io.rs2 := rs_t.REG
  when(id.ir.r_rs2 != 0.U) {
    when(ex_rs2) { io.rs2 := rs_t.ALU }
    .elsewhen(mm_rs2) { io.rs2 := rs_t.EXE }
    .elsewhen(wb_rs2) { io.rs2 := rs_t.MEM }
  }
}
