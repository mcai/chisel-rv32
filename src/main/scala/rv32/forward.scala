package rv32

import Chisel._
import chisel3._
import chisel3.util._

class Forward extends Module {
  val io = IO(new Bundle {
    val decode =  Input(new Axis(data_width = IdT.getWidth))
    val execute = Input(new Axis(data_width = ExT.getWidth))
    val memory =  Input(new Axis(data_width = MmT.getWidth))
    val writeback = Input(new Axis(data_width = WbT.getWidth))
    val rs1 = Output(UInt(2.W))
    val rs2 = Output(UInt(2.W))
  })
  val id = Wire(new IdT)
  val ex = Wire(new ExT)
  val mm = Wire(new MmT)
  val wb = Wire(new WbT)

  id := io.decode.t.data
  ex := io.execute.t.data
  mm := io.memory.t.data
  wb := io.writeback.t.data

  val ex_rs1, mm_rs1, wb_rs1 = Wire(Bool)
  val ex_rs2, mm_rs2, wb_rs2 = Wire(Bool)
  ex_rs1 := io.execute.t.valid & (id.data.ir.r_rs1 === ex.data.rd) & isinteger(ex.ctrl.op)
  mm_rs1 := io.memory.t.valid & (id.data.ir.r_rs1 === mm.data.rd) & isinteger(mm.ctrl.op)
  wb_rs1 := io.writeback.t.valid & (id.data.ir.r_rs1 === wb.data.rd) & (isinteger(wb.ctrl.op) | isload(wb.ctrl.op))
  ex_rs2 := io.execute.t.valid & (id.data.ir.r_rs2 === ex.data.rd) & isinteger(ex.ctrl.op)
  mm_rs2 := io.memory.t.valid & (id.data.ir.r_rs2 === mm.data.rd) & isinteger(mm.ctrl.op)
  wb_rs2 := io.writeback.t.valid & (id.data.ir.r_rs2 === wb.data.rd) & (isinteger(wb.ctrl.op) | isload(wb.ctrl.op))

  io.rs1 := rs_t.REG
  when(id.data.ir.r_rs1 != 0.U) {
    when(ex_rs1) { io.rs1 := rs_t.ALU }
    .elsewhen(mm_rs1) { io.rs1 := rs_t.EXE }
    .elsewhen(wb_rs1) { io.rs1 := rs_t.MEM }
  }
  io.rs2 := rs_t.REG
  when(id.data.ir.r_rs2 != 0.U) {
    when(ex_rs2) { io.rs2 := rs_t.ALU }
    .elsewhen(mm_rs2) { io.rs2 := rs_t.EXE }
    .elsewhen(wb_rs2) { io.rs2 := rs_t.MEM }
  }
}
