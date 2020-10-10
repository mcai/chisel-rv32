package rv32

import chisel3._
import chisel3.util._

object rv32 {
  def RESET_ADDR= "h00000000".U(32.W)
  def TRAP_ADDR = "h00000004".U(32.W)
  def CODE_BASE = "h00000000".U(32.W)
  def CODE_SIZE = "h00010000".U(32.W)
  def DATA_BASE = "h00010000".U(32.W)
  def DATA_SIZE = "h00010000".U(32.W)
  def MMIO_BASE = "h80000000".U(32.W)
}

object opcode_t {
  def LOAD      = "b0000011".U(7.W)
  def LOAD_FP   = "b0000111".U(7.W)
  def CUSTOM_0  = "b0001011".U(7.W)
  def MISC_MEM  = "b0001111".U(7.W)
  def OP_IMM    = "b0010011".U(7.W)
  def AUIPC     = "b0010111".U(7.W)
  def OP_IMM_32 = "b0011011".U(7.W)
  def STORE     = "b0100011".U(7.W)
  def STORE_FP  = "b0100111".U(7.W)
  def CUSTOM_1  = "b0101011".U(7.W)
  def AMO       = "b0101111".U(7.W)
  def OP        = "b0110011".U(7.W)
  def LUI       = "b0110111".U(7.W)
  def OP_32     = "b0111011".U(7.W)
  def MADD      = "b1000011".U(7.W)
  def MSUB      = "b1000111".U(7.W)
  def NMSUB     = "b1001011".U(7.W)
  def NMADD     = "b1001111".U(7.W)
  def OP_FP     = "b1010011".U(7.W)
  def CUSTOM_2  = "b1011011".U(7.W)
  def BRANCH    = "b1100011".U(7.W)
  def JALR      = "b1100111".U(7.W)
  def JAL       = "b1101111".U(7.W)
  def SYSTEM    = "b1110011".U(7.W)
  def CUSTOM_3  = "b1111011".U(7.W)
}

object funct3_t {
  def BEQ   = "b000".U(3.W)
  def LB    = "b000".U(3.W)
  def SB    = "b000".U(3.W)
  def ADD   = "b000".U(3.W)
  def SUB   = "b000".U(3.W)
  def BNE   = "b001".U(3.W)
  def LH    = "b001".U(3.W)
  def SH    = "b001".U(3.W)
  def SLL   = "b001".U(3.W)
  def LW    = "b010".U(3.W)
  def SW    = "b010".U(3.W)
  def SLT   = "b010".U(3.W)
  def SLTU  = "b011".U(3.W)
  def SLTIU = "b011".U(3.W)
  def BLT   = "b100".U(3.W)
  def XOR   = "b100".U(3.W)
  def LBU   = "b100".U(3.W)
  def BGE   = "b101".U(3.W)
  def LHU   = "b101".U(3.W)
  def SRL   = "b101".U(3.W)
  def SRA   = "b101".U(3.W)
  def BLTU  = "b110".U(3.W)
  def OR    = "b110".U(3.W)
  def BGEU  = "b111".U(3.W)
  def AND   = "b111".U(3.W)
}

class Inst extends Bundle {
  val inst = UInt(32.W)

  def r_funct7  = inst(31, 25)
  def r_rs2     = inst(24, 20)
  def r_rs1     = inst(19, 15)
  def r_funct3  = inst(14, 12)
  def r_rd      = inst(11, 7)
  def r_opcode  = inst(6, 0)

  def i_imm_11_0= inst(31, 20)
  def i_rs1     = inst(19, 15)
  def i_funct3  = inst(14, 12)
  def i_rd      = inst(11, 7)
  def i_opcode  = inst(6, 0)
  def i_imm     = Cat(Fill(20, inst(31)), i_imm_11_0).asUInt

  def s_imm_11_5= inst(31, 25)
  def s_rs2     = inst(24, 20)
  def s_rs1     = inst(19, 15)
  def s_funct3  = inst(14, 12)
  def s_imm_4_0 = inst(11, 7)
  def s_opcode  = inst(6, 0)
  def s_imm     = Cat(Fill(20, inst(31)), s_imm_11_5, s_imm_4_0).asUInt

  def b_imm_12  = inst(31)
  def b_imm_10_5= inst(30, 25)
  def b_rs2     = inst(24, 20)
  def b_rs1     = inst(19, 15)
  def b_funct3  = inst(14, 12)
  def b_imm_4_1 = inst(11, 8)
  def b_imm_11  = inst(7)
  def b_opcode  = inst(6, 0)
  def b_imm     = Cat(Fill(20, inst(31)), b_imm_11, b_imm_10_5, b_imm_4_1, 0.U(1.W)).asUInt

  def u_imm_31_12 = inst(31, 12)
  def u_imm_rd  = inst(11, 7)
  def u_opcode  = inst(6, 8)
  def u_imm     = Cat(u_imm_31_12, 0.U(12.W)).asUInt

  def j_imm_20  = inst(31)
  def j_imm_10_1= inst(30, 21)
  def j_imm_11  = inst(20)
  def j_imm_19_12 = inst(19, 12)
  def j_imm_rd  = inst(11, 7)
  def j_opcode  = inst(6, 0)
  def j_imm     = Cat(Fill(12, inst(31)), j_imm_19_12, j_imm_11, j_imm_10_1, 0.U(1.W)).asUInt
}

object op_t {
  def NONE                = 0x0.U(4.W)
  def INTEGER             = 0x1.U(4.W)
  def BRANCH              = 0x2.U(4.W)
  def JUMP                = 0x3.U(4.W)
  def LOAD_WORD           = 0x4.U(4.W)
  def LOAD_HALF           = 0x5.U(4.W)
  def LOAD_BYTE           = 0x6.U(4.W)
  def LOAD_HALF_UNSIGNED  = 0x7.U(4.W)
  def LOAD_BYTE_UNSIGNED  = 0x8.U(4.W)
  def STORE_WORD          = 0x9.U(4.W)
  def STORE_HALF          = 0xA.U(4.W)
  def STORE_BYTE          = 0xB.U(4.W)
}

object fn_t {
  def ADD  = 0x0.U(4.W)
  def SLL  = 0x1.U(4.W)
  def SLT  = 0x2.U(4.W)
  def SLTU = 0x3.U(4.W)
  def XOR  = 0x4.U(4.W)
  def SRL  = 0x5.U(4.W)
  def OR   = 0x6.U(4.W)
  def AND  = 0x7.U(4.W)
  def SUB  = 0x8.U(4.W)
  def SRA  = 0x9.U(4.W)
  def OP2  = 0xA.U(4.W)
  def ANY  = 0x0.U(4.W)
}

object br_t {
  def JAL  = 0.U(3.W)
  def JALR = 1.U(3.W)
  def BEQ  = 2.U(3.W)
  def BNE  = 3.U(3.W)
  def BLT  = 4.U(3.W)
  def BLTU = 5.U(3.W)
  def BGE  = 6.U(3.W)
  def BGEU = 7.U(3.W)
  def NA   = 0.U(3.W)
}

object pc_t {
  def NEXT = 0.U(2.W)
  def ADDR = 1.U(2.W)
  def TRAP = 2.U(2.W)
}

object op1_t {
  def RS1 = 0.U(1.W)
  def PC  = 1.U(1.W)
  def XX  = 0.U(1.W)
}

object op2_t {
  def RS2   = 0.U(3.W)
  def I_IMM = 1.U(3.W)
  def S_IMM = 2.U(3.W)
  def B_IMM = 3.U(3.W)
  def U_IMM = 4.U(3.W)
  def J_IMM = 5.U(3.W)
  def XXX   = 0.U(3.W)
}

object rs_t {
  def REG = 0.U(2.W)
  def ALU = 1.U(2.W)
  def EXE = 2.U(2.W)
  def MEM = 3.U(2.W)
}

class CtrlT extends Bundle {
  val op = UInt(4.W)
  val fn = UInt(4.W)
  val br = UInt(3.W)
  val op1 = UInt(1.W)
  val op2 = UInt(3.W)
}

class IdT extends Bundle {
  val pc = UInt(32.W)
  val ir = new Inst
}

class ExT extends Bundle {
  val ctrl = new Bundle {
    val op = UInt(4.W)
    val fn = UInt(4.W)
    val br = UInt(3.W)
  }
  val data = new Bundle {
    val pc = UInt(32.W)
    val ir = new Inst
    val op1 = UInt(32.W)
    val op2 = UInt(32.W)
    val rs1 = UInt(32.W)
    val rs2 = UInt(32.W)
    val rd = UInt(5.W)
  }
}

class MmT extends Bundle {
  val ctrl = new Bundle {
    val op = UInt(4.W)
    val br = Bool()
    val target = UInt(32.W)
  }
  val data = new Bundle {
    val pc = UInt(32.W)
    val ir = new Inst
    val alu = UInt(32.W)
    val rs2 = UInt(32.W)
    val rd = UInt(5.W)
  }
}

class WbT extends Bundle {
  val ctrl = new Bundle {
    val op = UInt(4.W)
  }
  val data = new Bundle {
    val rd = new Bundle {
      val data = UInt(32.W)
      val addr = UInt(5.W)
    }
  }
  val debug = new Bundle {
    val pc = UInt(32.W)
    val ir = new Inst
    val alu = UInt(32.W)
    val wdata = UInt(32.W)
    val br = Bool()
    val target = UInt(32.W)
  }
}

class RetireT extends Bundle {
  val pc = UInt(32.W)
  val inst = UInt(32.W)
  val load = UInt(2.W)
  val store = UInt(2.W)
  val ldst_addr = UInt(32.W)
  val store_data = UInt(32.W)
  val rd_load = Bool()
  val rd_sel = UInt(5.W)
  val rd_data = UInt(32.W)
  val branch = Bool()
  val target = UInt(32.W)
}

object isload {
  def apply(x: UInt): Bool = {
    val op = x(3, 0)
    val ret = op === op_t.LOAD_WORD || op === op_t.LOAD_HALF || op === op_t.LOAD_BYTE || op === op_t.LOAD_HALF_UNSIGNED || op === op_t.LOAD_BYTE_UNSIGNED
    ret
  }
}

object isstore {
  def apply(x: UInt): Bool = {
    val op = x(3, 0)
    val ret = op === op_t.STORE_WORD || op === op_t.STORE_HALF || op === op_t.STORE_BYTE
    ret
  }
}

object isinteger {
  def apply(x: UInt): Bool = {
    val op = x(3, 0)
    val ret = op === op_t.INTEGER
    ret
  }
}

object isjump {
  def apply(x: UInt): Bool = {
    val op = x(3, 0)
    val ret = op === op_t.JUMP
    ret
  }
}

object isbranch {
  def apply(x: UInt): Bool = {
    val op = x(3, 0)
    val ret = op === op_t.BRANCH
    ret
  }
}
