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

  val read = isload(mm.ctrl.op) & io.source.fire()
  val reading = RegInit(false.B)
  when(reading) {
    when(io.cache.r.fire()) { reading := false.B }
  }.elsewhen(read) {reading := true.B}

  val arvalid = RegInit(false.B)
  when(read) { arvalid := true.B }
  .elsewhen(io.cache.ar.fire()) { arvalid := false.B }

  val araddr = RegInit(0.U(32.W))
  val op     = RegInit(0.U(4.W))
  val rd     = RegInit(0.U(5.W))
  val pc     = RegInit(0.U(32.W))
  val ir     = RegInit(0.U(32.W))
  when (read & ~(io.cache.ar.valid & ~io.cache.ar.ready)) {
    araddr := mm.data.alu
    op := mm.ctrl.op
    rd := mm.data.rd
    pc := mm.data.pc
    ir := mm.data.ir.inst
  }

  io.cache.ar.bits.prot := Axi4.AXI4
  io.cache.ar.bits.addr := araddr
  io.cache.ar.valid := arvalid

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
  val rvokay = io.cache.r.fire() & io.cache.r.bits.resp === Axi4.OKAY
  when (~read & (io.source.fire() | rvokay)) {
    tvalid := true.B
  }.elsewhen (io.sink.fire()) {
    tvalid := false.B
  }
  io.sink.valid := tvalid

  when (io.sink.ready & rvokay) {
    wb.ctrl.op := op
    wb.data.rd.data := rdata
    wb.data.rd.addr := rd
    wb.debug.pc := pc
    wb.debug.ir.inst := ir
  }.elsewhen (io.sink.ready & io.source.valid) {
    wb.ctrl.op := mm.ctrl.op
    wb.data.rd.data := mm.data.alu
    wb.data.rd.addr := mm.data.rd
    wb.debug.pc := mm.data.pc
    wb.debug.ir.inst := mm.data.ir.inst
    wb.debug.alu := mm.data.alu
    wb.debug.wdata := Mux1H(Seq(
      (mm.ctrl.op === op_t.STORE_WORD) -> mm.data.rs2,
      (mm.ctrl.op === op_t.STORE_HALF) -> Cat(0.U(16.W), mm.data.rs2(15, 0)),
      (mm.ctrl.op === op_t.STORE_BYTE) -> Cat(0.U(24.W), mm.data.rs2(7, 0))
    ))
    wb.debug.br := mm.ctrl.br
    wb.debug.target := mm.ctrl.target
  }

}

