package rv32

import chisel3._
import chisel3.util._

class Cpu extends Module {
  val io = IO(new Bundle {
    val irq = Input(Bool())
    val code = new Axi
    val data = new Axi
    val mmio = new Axi
  })

  val x_hazard    = Module(new Hazard)
  val x_forward   = Module(new Forward)
  val x_fetch     = Module(new Fetch)
  val x_regfile   = Module(new Regfile)
  val x_decode    = Module(new Decode)
  val x_execute   = Module(new Execute)
  val x_arbitrate = Module(new Arbitrate)
  val x_memory    = Module(new Memory)
  val x_writeback = Module(new Writeback)

  val id = Wire(Irrevocable(new IdT))
  val ex = Wire(Irrevocable(new ExT))
  val mm = Wire(Irrevocable(new MmT))
  val wb = Wire(Irrevocable(new WbT))
  val cache = Wire(new Axi)

  val exe = mm.bits
  val exe_data = exe.data.alu
  val mem = wb.bits
  val mem_data = mem.data.rd.data

  val stall = x_hazard.io.stall
  val lock  = x_hazard.io.lock
  val fault = x_arbitrate.io.fault
  val invalid = x_decode.io.invalid
  val trap = io.irq | invalid | fault
  val rs1_addr = x_decode.io.rs1_addr
  val rs2_addr = x_decode.io.rs2_addr
  val rs1_data = x_regfile.io.rs1_data
  val rs2_data = x_regfile.io.rs2_data
  val rs1 = x_forward.io.rs1
  val rs2 = x_forward.io.rs2
  val branch = x_execute.io.branch
  val target = x_execute.io.target
  val alu_data = x_execute.io.bypass
  val rd_en = x_writeback.io.rd_load
  val rd_addr = x_writeback.io.rd_addr
  val rd_data = x_writeback.io.rd_data

  x_hazard.io.decode   <> id
  x_hazard.io.execute  <> ex
  x_hazard.io.memory   <> mm
  x_hazard.io.writeback<> wb

  x_forward.io.decode   <> id
  x_forward.io.execute  <> ex
  x_forward.io.memory   <> mm
  x_forward.io.writeback<> wb

  x_fetch.io.branch := branch
  x_fetch.io.target := target
  x_fetch.io.trap := trap
  x_fetch.io.handler := rv32.TRAP_ADDR
  x_fetch.io.stall := stall
  x_fetch.io.cache <> io.code
  id <> x_fetch.io.sink

  x_regfile.io.rs1_addr := rs1_addr
  x_regfile.io.rs2_addr := rs2_addr
  x_regfile.io.rd_en := rd_en
  x_regfile.io.rd_addr := rd_addr
  x_regfile.io.rd_data := rd_data

  x_decode.io.lock := lock
  x_decode.io.rs1_sel := rs1
  x_decode.io.rs2_sel := rs2
  x_decode.io.alu_data := alu_data
  x_decode.io.exe_data := exe_data
  x_decode.io.mem_data := mem_data
  x_decode.io.rs1_data := rs1_data
  x_decode.io.rs2_data := rs2_data
  x_decode.io.source <> id
  ex <> x_decode.io.sink

  x_execute.io.source <> ex
  mm <> x_execute.io.sink

  x_memory.io.source <> mm
  cache <> x_memory.io.cache
  wb <> x_memory.io.sink

  x_writeback.io.source <> wb

  x_arbitrate.io.cache <> cache
  io.code <> x_arbitrate.io.code
  io.data <> x_arbitrate.io.data
  io.mmio <> x_arbitrate.io.mmio
}
