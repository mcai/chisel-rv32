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
  //val raddr = io.cache.ar.valid & io.cache.ar.ready
  //val rdata = io.cache.r.valid & io.cache.r.ready
  //val tdata = io.sink.valid & io.sink.ready

  val lock = io.sink.valid & ~io.sink.ready
  val pc = RegInit(rv32.RESET_ADDR)
  when(~lock) { pc := io.cache.ar.bits.addr }

  val id = Wire(new IdT)
  io.sink.bits := id
  id.ir.inst := io.cache.r.bits.data
  id.pc := pc

  val trapped = RegInit(false.B)
  when(io.trap) { trapped := true.B }
  .elsewhen(io.cache.r.fire()) { trapped := false.B }

  val arvalid = RegInit(true.B)
  io.cache.ar.valid := arvalid & ~io.branch
  when(io.trap | trapped | io.branch | ~io.stall) { arvalid := true.B }
  .elsewhen(io.cache.ar.fire()) { arvalid := false.B }

  val araddr = RegInit(rv32.RESET_ADDR)
  io.cache.ar.bits.addr := araddr
  when(~(io.cache.ar.valid & ~io.cache.ar.ready)) {
    when(io.trap)         { araddr := io.handler }
    .elsewhen(trapped)    { araddr := araddr + 4.U }
    .elsewhen(io.branch)  { araddr := io.target }
    .elsewhen(~io.stall)  { araddr := araddr + 4.U }
  }
  io.cache.ar.bits.prot := Axi4.AXI4
  io.cache.r.ready := ~lock
  io.cache.aw.valid := false.B
  io.cache.aw.bits.addr := 0.U
  io.cache.aw.bits.prot := 0.U
  io.cache.w.valid := false.B
  io.cache.w.bits.data := 0.U
  io.cache.w.bits.strb := 0.U
  io.cache.b.ready := true.B
  io.sink.valid := io.cache.r.valid & ~io.branch & ~trapped
}

