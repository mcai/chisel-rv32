package rv32

import Chisel._
import chisel3._
import chisel3.util._

class Cpu extends Module {
  val io = IO(new Bundle {
    val irq = Input Bool()
    val code = new Axi
    val data = new Axi
    val mmio = new Axi
  })

  val id = Wire(new Axis(data_width = IdT.getWidth))
  val ex = Wire(new Axis(data_width = ExT.getWidth))
  val mm = Wire(new Axis(data_width = MmT.getWidth))
  val wb = Wire(new Axis(data_width = WbT.getWidth))

  val stall, lock = Wire(Bool)
  val x_hazard = Module(new Hazard)
  x_hazard.io.decode   <> id
  x_hazard.io.execute  <> ex
  x_hazard.io.memory   <> mm
  x_hazard.io.writeback<> wb
  stall := x_hazard.io.stall
  lock  := x_hazard.io.lock

  val invalid, fault, trap = Wire(Bool)
  trap := irq | invalid | fault

  val rs1, rs2 = Wire(UInt(32.W))
  val x_forward = Module(new Forward)
  x_forward.io.decode   <> id
  x_forward.io.execute  <> ex
  x_forward.io.memory   <> mm
  x_forward.io.writeback<> wb
  rs1 <> x_forward.io.rs1
  rs2 <> x_forward.io.rs2

  val branch = Wire(Bool)
  val target = Wire(UInt(32.W))
  val x_fetch = Module(new Fetch)
  branch := x_fetch.io.branch
  target := x_fetch.io.target
  x_fetch.io.trap := trap
  x_fetch.io.handler := rv32.TRAP_ADDR
  x_fecth.io.stall := stall
  x_fetch.io.cache <> code
  x_fetch.io.sind <> id

  val rs1_addr, rs2_addr, rd_addr = Wire(UInt(5.W))
  val rs1_data, rs2_data, alu_data, exe_data, mem_data, rd_data = Wire(UInt(32.W))
  val rd_en = Wire(Bool)

  val exe = Wire(new MmT)
  exe := mm.tdata
  exe_data := exe.data.alu

  val mem = Wire(new WbT)
  mem := wb.tdata
  mem_data := mem.data.rd.data

  val x_regfile = Module(new Regfile)
  x_regfile.rs1_addr := rs1_addr
  x_regfile.rs2_addr := rs2_addr
  rs1_data := x_regfile.rs1_data
  rs2_data := x_regfile.rs2_data
  x_regfile.rd_en := rd_en
  x_regfile.rd_addr := rd_addr
  x_regfile.rd_data := rd_data

  val x_decode = Module(new Decode)
  x_decode.lock := lock
  rs1 := x_decode.rs1_sel
  rs2 := x_decode.rs2_sel
  x_decode.alu_data := alu_data
  x_decode.exe_data := exe_data
  x_decode.mem_data := mem_data
  x_decode.rs1_data := rs1_data
  x_decode.rs2_data := rs2_data
  rs1_addr := x_decode.rs1_addr
  rs2_addr := x_decode.rs2_addr
  invalud := x_decode.invalid
  x_decode.source <> id
  x_decode.sink <> ex

  val x_execute = Module(Execute)
  x_execute.branch := branch
  x_execute.target := target
  x_execute.bypass := alu_data
  x_execute.source <> ex
  x_execute.sink <> mm

  val cache = Wire(new Axi)
  val x_arbitrate = Module(new Arbitrate)
  val x_memory = Module(new Memory)
  x_memory.cache <> cache
  x_memory.source <> mm
  x_memory.sink <> wb

  val x_writeback = Module(new Writeback)
  rd_en := x_writeback.rd_en
  rd_addr := x_writeback.rd_addr
  rd_data := x_writeback.rd_data
  x_writeback.source <> wb
}
