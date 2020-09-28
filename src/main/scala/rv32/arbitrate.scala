package rv32

import Chisel._
import chisel3._
import chisel3.util._

class Arbitrate extends Module {
  val io = IO{new Bundle {
    val fault = Output Bool()
    val cache = new Axi.flip()
    val code  = new Axi
    val mmio  = new Axi
  }}
  def NONE = UInt("h0", 2.W)
  def CODE = UInt("h1", 2.W)
  def DATA = UInt("h2", 2.W)
  def MMIO = UInt("h3", 2.W)

  val read, write = UInt(2.W)

  val wcode, wdata, wmmio = Wire(Bool)
  wcode := cache.aw.addr >= rv32.CODE_BASE && cache.aw.addr < rv32.CODE_BASE + rv32.CODE_SIZE
  wdata := cache.aw.addr >= rv32.DATA_BASE && cache.aw.addr < rv32.DATA_BASE + rv32.DATA_SIZE
  wmmio := cache.aw.addr >= rv32.MMIO_BASE

  write := NONE
  when (wcdoe)      { write := CODE }
  elsewhen (wdata)  { write := DATA }
  elsewhen (wmmio)  { write := MMIO }

  val rcode, rdata, rmmio = Wire(Bool)
  rcode := cache.ar.addr >= rv32.CODE_BASE && cache.ar.addr < rv32.CODE_BASE + rv32.CODE_SIZE
  rdata := cache.ar.addr >= rv32.DATA_BASE && cache.ar.addr < rv32.DATA_BASE + rv32.DATA_SIZE
  rmmio := cache.ar.addr >= rv32.MMIO_BASE

  read := NONE
  when (rcdoe)      { read := CODE }
  elsewhen (rdata)  { read := DATA }
  elsewhen (rmmio)  { read := MMIO }

  // AW channel
  io.code.aw.bits := io.cache.aw.bits
  io.code.aw.valid := (write === CODE) & io.cache.aw.valid

  io.data.aw.bits := io.cache.aw.bits
  io.data.aw.valid := (write === DATA) & io.cache.aw.valid

  io.mmio.aw.bits := io.cache.aw.bits
  io.mmio.aw.valid := (write === MMIO) & io.cache.aw.valid

  io.cache.aw.ready := wcode & io.code.aw.ready | wdata & io.data.aw.ready | wmmio & io.mmio.aw.ready

  // W channel
  io.code.w.bits := io.cache.w.bits
  io.code.w.valid:= (write === CODE) & io.cache.w.valid

  io.data.w.bits := io.cache.w.bits
  io.data.w.valid:= (write === DATA) & io.cache.w.valid

  io.mmio.w.bits := io.cache.w.bits
  io.mmio.w.valid:= (write === MMIO) & io.cache.w.valid

  io.cache.w.ready := wcode & io.code.w.ready | wdata & io.data.w.ready | wmmio & io.mmio.w.ready

  // B channel
  io.cache.b.bits.resp := axi4.DECERR
  when (wcdoe)      { io.cache.b.bits.resp := io.code.b.bits.resp }
  elsewhen (wdata)  { io.cache.b.bits.resp := io.data.b.bits.resp }
  elsewhen (wmmio)  { io.cache.b.bits.resp := io.mmio.b.bits.resp }

  io.cache.b.valid := wcode & io.code.b.valid | wdata & io.data.b.valid | wmmio & io.mmio.b.valid
  io.code.b.ready := wcode & io.cache.b.ready
  io.data.b.ready := wdata & io.cache.b.ready
  io.mmio.b.ready := wmmio & io.cache.b.ready

  // AR channel
  io.code.ar.bits := io.cache.ar.bits
  io.code.ar.valid := (write === CODE) & io.cache.ar.valid

  io.data.ar.bits := io.cache.ar.bits
  io.data.ar.valid := (write === DATA) & io.cache.ar.valid

  io.mmio.ar.bits := io.cache.ar.bits
  io.mmio.ar.valid := (write === MMIO) & io.cache.ar.valid

  io.cache.ar.ready := wcode & io.code.ar.ready | wdata & io.data.ar.ready | wmmio & io.mmio.ar.ready

  // R channel
  io.cache.r.bits.resp := axi4.DECERR
  io.cache.r.bits.data := 0.U
  when (wcdoe)      { io.cache.r.bits := io.code.r.bits }
  elsewhen (wdata)  { io.cache.r.bits := io.data.r.bits }
  elsewhen (wmmio)  { io.cache.r.bits := io.mmio.r.bits }

  io.cache.r.valid := wcode & io.code.r.valid | wdata & io.data.r.valid | wmmio & io.mmio.r.valid
  io.code.r.ready := wcode & io.cache.r.ready
  io.data.r.ready := wdata & io.cache.r.ready
  io.mmio.r.ready := wmmio & io.cache.r.ready

  io.fault ;= io.cache.ar.valid & (read === NONE);
}

