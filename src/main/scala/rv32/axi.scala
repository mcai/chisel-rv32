package rv32

import Chisel._
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
  val b  = Irrevocable(new AxiBPayload).flip
  val ar = Irrevocable(new AxiAXPayload(addr_width))
  val r  = Irrevocable(new AxiRPayload(data_width))
}

class AxisTPayload(val data_width: Int = 32, val id_width: Int = 4, val dest_width: Int = 4, val user_width: Int = 16) extends Bundle {
  val data = UInt(data_width.W)
  val strb = UInt((data_width/8).W)
  val keep = UInt((data_width/8).W)
  val id   = UInt(id_width.W)
  val dest = UInt(dest_width.W)
  val user = UInt(user_width.W)
  val last = Bool()
}

class Axis(val data_width: Int = 32, val id_width: Int = 4, val dest_width: Int = 4, val user_width: Int = 16) extends Bundle {
  val t = Irrevocable(new AxisTPayload(data_width, id_width, dest_width, user_width))
}
