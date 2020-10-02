package rv32

import chisel3._
import chisel3.util._

class Fetch extends Module {
  val io = IO(new Bundle {
    val branch = Input(Bool())
    val target = Input(UInt(32.W))
    val trap = Input(Bool())
    val handler = Input(UInt(32.W))
    val stall = Input(Bool())
    val cache = new Axi
    val sink = Irrevocable(new IdT)
  })
  val raddr = io.cache.ar.valid & io.cache.ar.ready
  val rdata = io.cache.r.valid & io.cache.r.ready
  val tdata = io.sink.valid & io.sink.ready

  val pc = RegInit(rv32.RESET_ADDR)
  val lock = io.sink.valid & ~io.sink.ready
  val id = new IdT
  io.sink.bits := id
  id.ir.inst := io.cache.r.bits.data
  id.pc := pc

  when(~lock) { pc := io.cache.ar.bits.addr }
  val trapped = RegInit(false.B)
  when(io.trap) { trapped := true.B }
  .elsewhen(io.cache.r.valid & io.cache.r.ready) { trapped := false.B }

  val arvalid = RegInit(true.B)
  io.cache.ar.valid := arvalid
  when(io.trap | trapped | io.branch | ~io.stall) { arvalid := true.B }
  .elsewhen(io.cache.ar.valid & io.cache.ar.ready) { arvalid := false.B }

  val araddr = RegInit(rv32.RESET_ADDR)
  io.cache.ar.bits.addr := araddr
  when(~(io.cache.ar.valid & ~io.cache.ar.ready)) {
    when(io.trap)         { araddr := io.handler }
    .elsewhen(trapped)    { araddr := araddr + 4.U }
    .elsewhen(io.branch)  { araddr := io.target }
    .elsewhen(~io.stall)  { araddr := araddr + 4.U }
  }
  io.cache.ar.bits.prot := 0.U
  io.cache.r.ready := ~lock
  io.sink.valid := io.cache.r.valid & ~io.branch & ~trapped
}

