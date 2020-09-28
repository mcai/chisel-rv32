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

  val id = Wire(new Axis())
  val ex = Wire(new Axis())
  val mm = Wire(new Axis())
  val wb = Wire(new Axis())

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
}
