package rv32

import Chisel._
import chisel3._
import chisel3.util._

class Regfile extends Module {
  val io = IO(new Bundle {
    val rs1_addr = Input UInt(5.W)
    val rs2_addr = Input UInt(5.W)
    val rs1_data = Output UInt(32.W)
    val rs2_data = Output UInt(32.W)
    val rd_en = Input Bool
    val rd_addr = Input UInt(5.W)
    val rd_data = Input UInt(32.W)
  })

  val regs = Mem(32, UInt(32.W))
  io.rs1_data := Mux(io.rs1_addr.orR, regs(io.rs1_addr), 0.U)
  io.rs2_data := Mux(io.rs2_addr.orR, regs(io.rs2_addr), 0.U)
  when(io.rd_en & io.rd_addr.orR) {
    regs(io.rd_addr) := io.rd_data
  }
}

