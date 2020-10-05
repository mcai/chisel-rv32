package rv32

import chisel3._
import chisel3.util._

class Writeback extends Module {
  val io = IO(new Bundle {
    val rd_load = Output(Bool())
    val rd_addr = Output(UInt(5.W))
    val rd_data = Output(UInt(32.W))
    val source = Flipped(Irrevocable(new WbT))
    val retire = ValidIO(new RetireT)
  })

  val wb = io.source.bits
  io.rd_load := io.source.valid & io.source.ready & (isinteger(wb.ctrl.op) | isload(wb.ctrl.op))
  io.rd_addr := wb.data.rd.addr
  io.rd_data := wb.data.rd.data
  io.source.ready := true.B
  io.retire.valid := io.source.valid
  io.retire.bits.pc := wb.debug.pc
  io.retire.bits.inst := wb.debug.ir.inst
  io.retire.bits.load :=  Mux(wb.ctrl.op===op_t.LOAD_BYTE|wb.ctrl.op===op_t.LOAD_BYTE_UNSIGNED, 1.U(2.W),
                          Mux(wb.ctrl.op===op_t.LOAD_HALF|wb.ctrl.op===op_t.LOAD_HALF_UNSIGNED, 2.U(2.W),
                          Mux(wb.ctrl.op===op_t.LOAD_WORD, 3.U(2.W), 0.U(2.W))))
  io.retire.bits.store := Mux(wb.ctrl.op===op_t.STORE_BYTE, 1.U(2.W),
                          Mux(wb.ctrl.op===op_t.STORE_HALF, 2.U(2.W),
                          Mux(wb.ctrl.op===op_t.STORE_WORD, 3.U(2.W), 0.U(2.W))))
  io.retire.bits.ldst_addr := wb.debug.alu
  io.retire.bits.store_data := wb.debug.wdata
  io.retire.bits.rd_sel := wb.data.rd.addr
  io.retire.bits.rd_data := wb.data.rd.data
}
