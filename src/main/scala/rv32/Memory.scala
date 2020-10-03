package rv32

import chisel3._
import chisel3.util._

class Memory extends Module {
  val io = IO(new Bundle {
    val cache = new Axi
    val source = Flipped(Irrevocable(new MmT))
    val sink = Irrevocable(new WbT)
  })
  val rdata, wdata = Wire(UInt(32.W))
  val wstrb = Wire(UInt(4.W))
  val wb = Reg(new WbT)

  val mm = io.source.bits
  io.sink.bits := wb

  wstrb := 0.U(4.W)
  wdata := mm.data.rs2
  switch(mm.ctrl.op) {
    is(op_t.STORE_WORD) {
      wstrb := 0xF.U(4.W)
      wdata := mm.data.rs2
    }
    is(op_t.STORE_HALF) {
      wstrb := Mux(mm.data.alu(1), 0xC.U(4.W), 0x3.U(4.W))
      wdata := Mux(mm.data.alu(1), Cat(mm.data.rs2(15, 0), 0.U(16.W)), Cat(0.U(16.W), mm.data.rs2(15, 0)))
    }
    is(op_t.STORE_BYTE) {
      wdata := Fill(4, mm.data.rs2(7, 0))
      switch(mm.data.alu(1, 0)) {
        is(0.U(2.W)) { wstrb := 1.U(4.W) }
        is(1.U(2.W)) { wstrb := 2.U(4.W) }
        is(2.U(2.W)) { wstrb := 4.U(4.W) }
        is(3.U(2.W)) { wstrb := 8.U(4.W) }
      }
    }
  }

  val write = isstore(mm.ctrl.op) & io.source.valid & io.source.ready
  val writing = io.cache.b.ready
  io.cache.aw.bits.prot := Axi4.AXI4
  val cawaddr = RegEnable(mm.data.alu, write & ~(io.cache.aw.valid & ~io.cache.aw.ready))
  val cwdata  = RegEnable(wdata,       write & ~(io.cache.aw.valid & ~io.cache.aw.ready))
  val cwstrb  = RegEnable(wstrb,       write & ~(io.cache.aw.valid & ~io.cache.aw.ready))
  io.cache.aw.bits.addr := cawaddr
  io.cache.w.bits.data := cwdata
  io.cache.w.bits.strb := cwstrb

  val awvalid = RegInit(false.B)
  io.cache.aw.valid := awvalid
  when(write) { awvalid := true.B }
  .elsewhen(io.cache.aw.valid & io.cache.aw.ready) { awvalid := false.B }

  val wvalid = RegInit(false.B)
  io.cache.w.valid := wvalid
  when(write) { wvalid := true.B }
  .elsewhen(io.cache.w.valid & io.cache.w.ready) { wvalid := false.B }

  val bready = RegInit(false.B)
  io.cache.b.ready := bready
  when(write) { bready := true.B }
  .elsewhen(io.cache.b.valid & io.cache.b.ready) { bready := false.B }

  val read = isload(mm.ctrl.op) & io.source.valid & io.source.ready
  val reading = RegInit(false.B)
  when(reading) {
    when(io.cache.r.valid & io.cache.r.ready) { reading := false.B }
  }.elsewhen(read) {reading := true.B}

  io.cache.ar.bits.prot := Axi4.AXI4
  val arvalid = RegInit(false.B)
  io.cache.ar.valid := arvalid
  when(read) { arvalid := true.B }
  .elsewhen(io.cache.ar.valid & io.cache.ar.ready) { arvalid := false.B }

  val araddr = RegEnable(mm.data.alu, read & ~(io.cache.ar.valid & ~io.cache.ar.ready))
  val op     = RegEnable(mm.ctrl.op,  read & ~(io.cache.ar.valid & ~io.cache.ar.ready))
  val rd     = RegEnable(mm.data.rd,  read & ~(io.cache.ar.valid & ~io.cache.ar.ready))
  io.cache.ar.bits.addr := araddr

  io.cache.r.ready := io.sink.ready

  rdata := 0.U(32.W)
  switch(op) {
    is(op_t.LOAD_WORD) { rdata := io.cache.r.bits.data }
    is(op_t.LOAD_HALF) {
      rdata := Mux(io.cache.ar.bits.addr(1),
        Cat(Fill(16, io.cache.r.bits.data(31)), io.cache.r.bits.data(31, 16)),
        Cat(Fill(16, io.cache.r.bits.data(15)), io.cache.r.bits.data(15, 0)))
    }
    is(op_t.LOAD_HALF_UNSIGNED) {
      rdata := Mux(io.cache.ar.bits.addr(1),
        Cat(0.U(16.W), io.cache.r.bits.data(31, 16)),
        Cat(0.U(16.W), io.cache.r.bits.data(15, 0)))
    }
    is(op_t.LOAD_BYTE) {
      switch(io.cache.ar.bits.addr(1, 0)) {
        is(0.U(2.W)) { rdata := Cat(Fill(24, io.cache.r.bits.data(7)), io.cache.r.bits.data(7, 0)) }
        is(1.U(2.W)) { rdata := Cat(Fill(24, io.cache.r.bits.data(15)), io.cache.r.bits.data(15, 8)) }
        is(2.U(2.W)) { rdata := Cat(Fill(24, io.cache.r.bits.data(23)), io.cache.r.bits.data(23, 16)) }
        is(3.U(2.W)) { rdata := Cat(Fill(24, io.cache.r.bits.data(31)), io.cache.r.bits.data(31, 24)) }
      }
    }
    is(op_t.LOAD_BYTE_UNSIGNED) {
      switch(io.cache.ar.bits.addr(1, 0)) {
        is(0.U(2.W)) { rdata := Cat(0.U(24.W), io.cache.r.bits.data(7, 0)) }
        is(1.U(2.W)) { rdata := Cat(0.U(24.W), io.cache.r.bits.data(15, 8)) }
        is(2.U(2.W)) { rdata := Cat(0.U(24.W), io.cache.r.bits.data(23, 16)) }
        is(3.U(2.W)) { rdata := Cat(0.U(24.W), io.cache.r.bits.data(31, 24)) }
      }
    }
  }

  io.source.ready := ~reading & ~writing & io.sink.ready
  val tvalid = RegInit(false.B)
  when (~read & ((io.source.valid & io.source.ready) | (io.cache.r.valid & io.cache.r.ready &io.cache.r.bits.resp === 0.U(2.W)))) {
    tvalid := true.B
  }.elsewhen (io.sink.valid & io.sink.ready) {
    tvalid := false.B
  }
  io.sink.valid := tvalid

  when (io.sink.ready) {
    wb.ctrl.op := Mux((io.cache.r.valid & io.cache.r.ready & io.cache.r.bits.resp === 0.U(2.W)), op, mm.ctrl.op)
    wb.data.rd.data := Mux((io.cache.r.valid & io.cache.r.ready & io.cache.r.bits.resp === 0.U(2.W)), rdata, mm.data.alu)
    wb.data.rd.addr := Mux((io.cache.r.valid & io.cache.r.ready & io.cache.r.bits.resp === 0.U(2.W)), rd, mm.data.rd)
  }

}

