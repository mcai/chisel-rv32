package rv32

import chisel3._
import chisel3.util._

class AxiAXPayload(val addr_width: Int) extends Bundle {
  val addr = UInt(addr_width.W)
  val prot = UInt(3.W)
}

class AxiWPayload(val data_width: Int) extends Bundle {
  val data = UInt(data_width.W)
  val strb = UInt((data_width/8).W)
}

class AxiBPayload extends Bundle {
  val resp = UInt(2.W)
}

class AxiRPayload(val data_width: Int) extends Bundle {
  val data = UInt(data_width.W)
  val resp = UInt(2.W)
}

class Axi(val addr_width: Int = 32, val data_width: Int = 32) extends Bundle {
  val aw = Irrevocable(new AxiAXPayload(addr_width))
  val w  = Irrevocable(new AxiWPayload(data_width))
  val b  = Flipped(Irrevocable(new AxiBPayload))
  val ar = Irrevocable(new AxiAXPayload(addr_width))
  val r  = Flipped(Irrevocable(new AxiRPayload(data_width)))
}

object Axi4 {
  val AXI4 = 0.U(3.W)
  val ACE  = 1.U(3.W)
  val ACE_LITE = 2.U(3.W)

  val OKAY    = 0.U(2.W)
  val EXOKAY  = 1.U(2.W)
  val SLVERR  = 2.U(2.W)
  val DECERR  = 3.U(2.W)
}
