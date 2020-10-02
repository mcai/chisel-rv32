package rv32

import chisel3._
import chisel3.util._

class Writeback extends Module {
  val io = IO(new Bundle {
    val rd_load = Output(Bool())
    val rd_addr = Output(UInt(5.W))
    val rd_data = Output(UInt(32.W))
    val source = Flipped(Irrevocable(new WbT))
  })

  val wb = io.source.bits
  io.rd_load := io.source.valid & io.source.ready & (isinteger(wb.ctrl.op) | isload(wb.ctrl.op))
  io.rd_addr := wb.data.rd.addr
  io.rd_data := wb.data.rd.data
  io.source.ready := true.B
}
