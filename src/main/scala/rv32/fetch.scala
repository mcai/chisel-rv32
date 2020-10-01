package rv32

import Chisel._
import chisel3._
import chisel3.util._

class Fetch extends Module {
  val io = IO(New Bundle {
    val branch = Input Bool
    val target = Input UInt(32.W)
    val trap = Input Bool
    val handler = input UInt(32.W)
    val stall = Input Bool
    val cache = new Axi
    val sink = Flipped(new Axis)
  })
  val raddr, rdata, tdata = Wire(Bool)
  raddr := io.cache.ar.valid & io.cache.ar.ready
  rdata := io.cache.r.valid & io.cache.r.ready
  tdata := io.sink.t.valid & io.sink.t.ready

  val id = Wire(new IdT)
  val pc = RegInit(rv32.RESET_ADDR)
  val lock = Wire(Bool)
  lock := io.sink.t.valid & ~io.sink.t.ready
  io.sink.t.data := id
  id.data.ir := io.cache.r.data
  id.data.pc := pc

  when(~lock) { pc := cache.araddr }
  val trapped = RegInit(false.B)
  when(io.trap) { trapped := true.B }
  .elsewhen(io.cache.r.valid & io.cache.r.ready) { trapped := false.B }

  val arvalid = RegInit(true.B)
  io.cache.ar.valid := arvalid
  when(io.trap | trapped | io.branch | ~io.stall)
  .elsewhen(io.cache.ar.valid & io.cache.ar.ready)

  val araddr = RegInit(rv32.RESET_ADDR)
  io.cache.ar.addr := araddr
  when(~(io.cache.ar.valid & ~io.cache.ar.ready)) {
    when(io.trap)         { araddr := io.handler }
    .elsewhen(trapped)    { araddr := araddr + 4.U }
    .elsewhen(io.branch)  { araddr := target }
    .elsewhen(~io.stall ) {araddr := araddr + 4.U }
  }
  io.cache.ar.prot := 0.U
  io.cache.r.ready := ~lock
  io.sink.t.valid := io.cache.r.valid & ~io.branch & ~trapped
}

