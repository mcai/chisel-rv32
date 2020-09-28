package rv32

import Chisel._
import chisel3._

object opcode {
  def LOAD      = UInt("b0000011", 7)
  def LOAD_FP   = UInt("b0000111", 7)
  def CUSTOM_0  = UInt("b0001011", 7)
  def MISC_MEM  = UInt("b0001111", 7)
  def OP_IMM    = UInt("b0010011", 7)
  def AUIPC     = UInt("b0010111", 7)
  def OP_IMM_32 = UInt("b0011011", 7)
  def STORE     = UInt("b0100011", 7)
  def STORE_FP  = UInt("b0100111", 7)
  def CUSTOM_1  = UInt("b0101011", 7)
  def AMO       = UInt("b0101111", 7)
  def OP        = UInt("b0110011", 7)
  def LUI       = UInt("b0110111", 7)
  def OP_32     = UInt("b0111011", 7)
  def MADD      = UInt("b1000011", 7)
  def MSUB      = UInt("b1000111", 7)
  def NMSUB     = UInt("b1001011", 7)
  def NMADD     = UInt("b1001111", 7)
  def OP_FP     = UInt("b1010011", 7)
  def CUSTOM_2  = UInt("b1011011", 7)
  def BRANCH    = UInt("b1100011", 7)
  def JALR      = UInt("b1100111", 7)
  def JAL       = UInt("b1101111", 7)
  def SYSTEM    = UInt("b1110011", 7)
  def CUSTOM_3  = UInt("b1111011", 7)
}

object funct3 {
  def BEQ   = UInt("b000", 3)
  def LB    = UInt("b000", 3)
  def SB    = UInt("b000", 3)
  def ADD   = UInt("b000", 3)
  def SUB   = UInt("b000", 3)
  def BNE   = UInt("b001", 3)
  def LH    = UInt("b001", 3)
  def SH    = UInt("b001", 3)
  def SLL   = UInt("b001", 3)
  def LW    = UInt("b010", 3)
  def SW    = UInt("b010", 3)
  def SLT   = UInt("b010", 3)
  def SLTU  = UInt("b011", 3)
  def SLTIU = UInt("b011", 3)
  def BLT   = UInt("b100", 3)
  def XOR   = UInt("b100", 3)
  def LBU   = UInt("b100", 3)
  def BGE   = UInt("b101", 3)
  def LHU   = UInt("b101", 3)
  def SRL   = UInt("b101", 3)
  def SRA   = UInt("b101", 3)
  def BLTU  = UInt("b110", 3)
  def OR    = UInt("b110", 3)
  def BGEU  = UInt("b111", 3)
  def AND   = UInt("b111", 3)
}

object rv32 {
  def RESET_ADDR= UInt("h00000000", 32)
  def TRAP_ADDR = UInt("h00000004", 32)
  def CODE_BASE = UInt("h00000400", 32)
  def CODE_SIZE = UInt("h00000C00", 32)
  def DATA_BASE = UInt("h00001000", 32)
  def DATA_SIZE = UInt("h00001000", 32)
  def MMIO_BASE = UInt("h00400000", 32)
}

class Inst extends UInt(32.W) {
  def r_funct7  = this(31, 25)
  def r_rs2     = this(24, 20)
  def r_rs1     = this(19, 15)
  def r_funct3  = this(14, 12)
  def r_rd      = this(11, 7)
  def r_opcode  = this(6, 0)

  def i_imm_11_0= this(31, 20)
  def i_rs1     = this(19, 15)
  def i_funct3  = this(14, 12)
  def i_rd      = this(11, 7)
  def i_opcode  = this(6, 0)
  def i_imm     = Cat(Fill(this(31), 20), i_imm_11_0())

  def s_imm_11_5= this(31, 25)
  def s_rs2     = this(24, 20)
  def s_rs1     = this(19, 15)
  def s_funct3  = this(14, 12)
  def s_imm_4_0 = this(11, 7)
  def s_opcode  = this(6, 0)
  def s_imm     = Cat(Fill(this(31), 20), s_imm_11_5, s_imm_4_0)

  def b_imm_12  = this(31)
  def b_imm_10_5= this(30, 25)
  def b_rs2     = this(24, 20)
  def b_rs1     = this(19, 15)
  def b_funct3  = this(14, 12)
  def b_imm_4_1 = this(11, 8)
  def b_imm_11  = this(7)
  def b_opcode  = this(6, 0)
  def b_imm     = Cat(Fill(this(31), 20), b_imm_11, b_imm_10_5, b_imm_4_1, UInt("0", 1))

  def u_imm_31_12 = this(31, 12)
  def u_imm_rd  = this(11, 7)
  def u_opcode  = this(6, 8)
  def u_imm     = Cat(u_imm_31_12, UInt("0", 12))

  def j_imm_20  = this(31)
  def j_imm_10_1= this(30, 21)
  def j_imm_11  = this(20)
  def j_imm_19_12 = this(19, 12)
  def j_imm_rd  = this(11, 7)
  def j_opcode  = this(6, 0)
  def j_imm     = Cat(Fill(this(31), 12), j_imm_19_12, j_imm_11, j_imm_10_1, UInt("0", 1))
}

object op_t {
  def NONE                = UInt("h0", 4.W)
  def INTEGER             = UInt("h1", 4.W)
  def BRANCH              = UInt("h3", 4.W)
  def JUMP                = UInt("h4", 4.W)
  def LOAD_WORD           = UInt("h5", 4.W)
  def LOAD_HALF           = UInt("h6", 4.W)
  def LOAD_BYTE           = UInt("h7", 4.W)
  def LOAD_HALF_UNSIGNED  = UInt("h8", 4.W)
  def LOAD_BYTE_UNSIGNED  = UInt("h9", 4.W)
  def STORE_WORD          = UInt("hA", 4.W)
  def STORE_HALF          = UInt("hB", 4.W)
  def STORE_BYTE          = UInt("hC", 4.W)
}

object fn_t {
  def ADD  = UInt("h0", 4.W)
  def SLL  = UInt("h1", 4.W)
  def SLT  = UInt("h2", 4.W)
  def SLTU = UInt("h3", 4.W)
  def XOR  = UInt("h4", 4.W)
  def SRL  = UInt("h5", 4.W)
  def OR   = UInt("h6", 4.W)
  def AND  = UInt("h7", 4.W)
  def SUB  = UInt("h8", 4.W)
  def SRA  = UInt("h9", 4.W)
  def OP2  = UInt("hA", 4.W)
  def ANY  = BitPat("b????")
}

object br_t {
  def JAL  = UInt("h0", 3.W)
  def JALR = UInt("h1", 3.W)
  def BEQ  = UInt("h2", 3.W)
  def BNE  = UInt("h3", 3.W)
  def BLT  = UInt("h4", 3.W)
  def BLTU = UInt("h5", 3.W)
  def BGE  = UInt("h6", 3.W)
  def BGEU = UInt("h7", 3.W)
  def NA   = BitPat("b???")
}

object pc_t {
  def NEXT = UInt("h0", 2.W)
  def ADDR = UInt("h1", 2.W)
  def TRAP = UInt("h2", 2.W)
}

object op1_t {
  def RS1 = UInt("h0", 1.W)
  def PC  = UInt("h1", 1.W)
}

object op2_t {
  def RS2   = UInt("h0", 3.W)
  def I_IMM = UInt("h1", 3.W)
  def S_IMM = UInt("h2", 3.W)
  def B_IMM = UInt("h3", 3.W)
  def U_IMM = UInt("h4", 3.W)
  def J_IMM = UInt("h5", 3.W)
  def XXX = BitPat("b???")
}

object rs_t {
  def REG = UInt("h0", 2.W)
  def ALU = UInt("h1", 2.W)
  def EXE = UInt("h2", 2.W)
  def MEM = UInt("h3", 2.W)
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
  val ir = UInt(32.W)
}

class ExT extends Bundle {
  val ctrl = new Bundle {
    val op = UInt(4.W)
    val fn = UInt(4.W)
    val br = UInt(3.W)
  }
  val data = new Bundle {
    val pc = UInt(32.W)
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
    val br = UInt(3.W)
  }
  val data = new Bundle {
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
}

object isload {
  def apply(op: UInt(4.W)): Bool = {
    val ret = op === op_t.LOAD_WORD || op === op_t.LOAD_HALF || op === op_t.LOAD_BYTE || op === op_t.LOAD_HALF_UNSIGNED || op === op_t.LOAD_BYTE_UNSIGNED
    ret
  }
}

object isstore {
  def apply(op: UInt(4.W)): Bool = {
    val ret = op === op_t.STORE_WORD || op_t.STORE_HALF || op_t.STORE_BYTE
    ret
  }
}

object isinteger {
  def applay(op: UInt(4.W)): Bool = {
    val ret = op === op_t.INTEGER
    ret
  }
}

object isjump {
  def applay(op: UInt(4.W)): Bool = {
    val ret = op === op_t.JUMP
    ret
  }
}

object isbranch {
  def applay(op: UInt(4.W)): Bool = {
    val ret = op === op_t.BRANCH
    ret
  }
}
