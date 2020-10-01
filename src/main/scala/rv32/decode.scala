package rv32

import Chisel._
import chisel3._
import chisel3.util._

object DecCtrl {
  def apply(op: UInt(4.W), fn: UInt(4.W), br: UInt(3.W), op1: UInt(1.W), op2: UInt(3.W)): CtrlT = {
    val ret = Wire(new CtrlT)
    ret.op := op
    ret.fn := fn
    ret.br := br
    ret.op1 := op1
    ret.op2 := op2
    ret
  }
}

class Decode extends Module {
  val io = IO(new Bundle {
    val lock = Input Bool
    val rs1_sel = Input UInt(5.W)
    val rs2_sel = Input UInt(5.W)
    val alu_data = Input UInt(32.W)
    val exe_data = Input UInt(32.W)
    val mem_data = Input UInt(32.W)
    val rs1_data = Input UInt(32.W)
    val rs2_data = Input UInt(32.W)
    val rs1_addr = Output UInt(5.W)
    val rs2_addr = Output UInt(5.W)
    val invalid = Output Bool()
    val source = new Axis(data_width = IdT.getWidth).flip()
    val sink = new Axis(data_width = ExT.getWidth)
  })
  val NONE  = DecCtrl(op_t.NONE,                fn_t.ANY,   br_t.NA,   op1_t.XX,  op2_t.XXX)
  val ADDI  = DecCtrl(op_t.INTEGER,             fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val SLTI  = DecCtrl(op_t.INTEGER,             fn_t.SLT,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val SLTIU = DecCtrl(op_t.INTEGER,             fn_t.SLTU,  br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val ANDI  = DecCtrl(op_t.INTEGER,             fn_t.AND,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val ORI   = DecCtrl(op_t.INTEGER,             fn_t.OR,    br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val XORI  = DecCtrl(op_t.INTEGER,             fn_t.XOR,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val SLLI  = DecCtrl(op_t.INTEGER,             fn_t.SLL,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val SRLI  = DecCtrl(op_t.INTEGER,             fn_t.SRL,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val SRAI  = DecCtrl(op_t.INTEGER,             fn_t.SRA,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val LUI   = DecCtrl(op_t.INTEGER,             fn_t.OP2,   br_t.NA,   op1_t.XX,  op2_t.U_IMM)
  val AUIPC = DecCtrl(op_t.INTEGER,             fn_t.ADD,   br_t.NA,   op1_t.PC,  op2_t.U_IMM)
  val ADD   = DecCtrl(op_t.INTEGER,             fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.RS2)
  val SLT   = DecCtrl(op_t.INTEGER,             fn_t.SLT,   br_t.NA,   op1_t.RS1, op2_t.RS2)
  val SLTU  = DecCtrl(op_t.INTEGER,             fn_t.SLTU,  br_t.NA,   op1_t.RS1, op2_t.RS2)
  val AND   = DecCtrl(op_t.INTEGER,             fn_t.AND,   br_t.NA,   op1_t.RS1, op2_t.RS2)
  val OR    = DecCtrl(op_t.INTEGER,             fn_t.OR,    br_t.NA,   op1_t.RS1, op2_t.RS2)
  val XOR   = DecCtrl(op_t.INTEGER,             fn_t.XOR,   br_t.NA,   op1_t.RS1, op2_t.RS2)
  val SLL   = DecCtrl(op_t.INTEGER,             fn_t.SLL,   br_t.NA,   op1_t.RS1, op2_t.RS2)
  val SRL   = DecCtrl(op_t.INTEGER,             fn_t.SRL,   br_t.NA,   op1_t.RS1, op2_t.RS2)
  val SUB   = DecCtrl(op_t.INTEGER,             fn_t.SUB,   br_t.NA,   op1_t.RS1, op2_t.RS2)
  val SRA   = DecCtrl(op_t.INTEGER,             fn_t.SRA,   br_t.NA,   op1_t.RS1, op2_t.RS2)
  val JAL   = DecCtrl(op_t.JUMP,                fn_t.ADD,   br_t.JAL,  op1_t.PC,  op2_t.J_IMM)
  val JALR  = DecCtrl(op_t.JUMP,                fn_t.ADD,   br_t.JAL,  op1_t.RS1, op2_t.I_IMM)
  val BEQ   = DecCtrl(op_t.BRANCH,              fn_t.ADD,   br_t.BEQ,  op1_t.PC,  op2_t.B_IMM)
  val BNE   = DecCtrl(op_t.BRANCH,              fn_t.ADD,   br_t.BNE,  op1_t.PC,  op2_t.B_IMM)
  val BLT   = DecCtrl(op_t.BRANCH,              fn_t.ADD,   br_t.BLT,  op1_t.PC,  op2_t.B_IMM)
  val BLTU  = DecCtrl(op_t.BRANCH,              fn_t.ADD,   br_t.BLTU, op1_t.PC,  op2_t.B_IMM)
  val BGE   = DecCtrl(op_t.BRANCH,              fn_t.ADD,   br_t.BGE,  op1_t.PC,  op2_t.B_IMM)
  val BGEU  = DecCtrl(op_t.BRANCH,              fn_t.ADD,   br_t.BGEU, op1_t.PC,  op2_t.B_IMM)
  val LW    = DecCtrl(op_t.LOAD_WORD,           fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val LH    = DecCtrl(op_t.LOAD_HALF,           fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val LHU   = DecCtrl(op_t.LOAD_HALF_UNSIGNED,  fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val LB    = DecCtrl(op_t.LOAD_BYTE,           fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val LBU   = DecCtrl(op_t.LOAD_BYTE_UNSIGNED,  fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.I_IMM)
  val SW    = DecCtrl(op_t.SAVE_WORD,           fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.S_IMM)
  val SH    = DecCtrl(op_t.SAVE_HALF,           fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.S_IMM)
  val SB    = DecCtrl(op_t.SAVE_BYTE,           fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.S_IMM)

  val id = Wire(new IdT)
  val ex_nx = Wire(new ExT)
  val ex = RegEnable(ex_nx, io.sink.t.ready)
  val pc = Wire(UInt(32.W))
  val ir = Wire(Inst)
  val ctrl = Wire(CtrlT)

  id := io.source.t.data
  io.sink.t.data := ex
  pc := id.data.pc
  ir := id.data.ir
  io.rs1_addr := ir.r_rs1
  io.rs2_addr := ir.r_rs2

  val i_imm, s_imm, b_imm, u_imm, j_imm = Wire(UInt(32.W))
  i_imm := ir.i_imm
  s_imm := ir.s_imm
  b_imm := ir.b_imm
  u_imm := ir.u_imm
  j_imm := ir.j_imm

  val rs1, rs2, op1, op2 = Wire(UInt(32.W))

  ctrl := NONE
  switch(ir.r_opcode) {
    is(opcode.OP_IMM) {
      switch(ir.r_funct3) {
        is(funct3.ADD) { ctrl := ADDI }
        is(funct3.SLL) { ctrl := SLLI }
        is(funct3.SLT) { ctrl := SLTI }
        is(funct3.SLTIU) { ctrl := SLTIU }
        is(funct3.XOR) { ctrl := XORI }
        is(funct3.SRL) { ctrl := Mux(ir.r_funct7(5), SRAI, SRLI) }
        is(funct3.OR ) { ctrl := ORI  }
        is(funct3.AND) { ctrl := ANDI }
      }
    }
    is(opcode.OP) {
      switch(ir.r_funct3) {
        is(funct3.ADD) { ctrl := Mux(ir.r_funct7(5), SUB, ADD) }
        is(funct3.SLL) { ctrl := SLL }
        is(funct3.SLT) { ctrl := SLT }
        is(funct3.SLTIU) { ctrl := SLTU }
        is(funct3.XOR) { ctrl := XOR }
        is(funct3.SRL) { ctrl := Mux(ir.r_funct7(5), SRA, SRL) }
        is(funct3.OR ) { ctrl := OR  }
        is(funct3.AND) { ctrl := AND }
      }
    }
    is(opcode.LUI)    { ctrl := LUI   }
    is(opcode.AUIPC)  { ctrl := AUIPC }
    is(opcode.JAL)    { ctrl := JAL   }
    is(opcode.JALR)   { ctrl := JALR  }
    is(opcode.BRANCH) {
      switch(ir.r_funct3) {
        is(funct3.BEQ)  { ctrl := BEQ }
        is(funct3.BNE)  { ctrl := BNE }
        is(funct3.BLT)  { ctrl := BLT }
        is(funct3.BLTU) { ctrl := BLTU }
        is(funct3.BGE)  { ctrl := BGE }
        is(funct3.BGEU) { ctrl := BGEU }
      }
    }
    is(opcdoe.LOAD) {
      switch(ir.r_funct3) {
        is(funct3.LW)   { ctrl := LW }
        is(funct3.LH)   { ctrl := LH }
        is(funct3.LHU)  { ctrl := LHU }
        is(funct3.LB)   { ctrl := LB }
        is(funct3.LBU)  { ctrl := LBU }
      }
    }
    is(opcode.STORE) {
      switch(ir.r_funct3) {
        is(funct3.SB)   { ctrl := SB }
        is(funct3.SH)   { ctrl := SH }
        is(funct3.SW)   { ctrl := SW }
      }
    }
  }

  rs1 := io.rs1_data
  switch(io.rs1_sel) {
    is(rs_t.ALU) { rs1 := io.alu_data }
    is(rs_t.EXE) { rs1 := io.exe_data }
    is(rs_t.MEM) { rs1 := io.mem_data }
  }

  rs2 := io.rs2_data
  switch(io.rs2_sel) {
    is(rs_t.ALU) { rs2 := io.alu_data }
    is(rs_t.EXE) { rs2 := io.exe_data }
    is(rs_t.MEM) { rs2 := io.mem_data }
  }

  op1 := Mux(ctrl.op1 === op1_t.PC, pc, rs1)
  op2 := rs2
  switch(ctrl.op2) {
    is(op2_t.I_IMM) { op2 := i_imm }
    is(op2_t.S_IMM) { op2 := s_imm }
    is(op2_t.B_IMM) { op2 := b_imm }
    is(op2_t.U_IMM) { op2 := u_imm }
    is(op2_t.J_IMM) { op2 := j_imm }
  }

  ex_nx.ctrl.op := ctrl.op
  ex_nx.ctrl.fn := ctrl.fn
  ex_nx.ctrl.br := ctrl.br
  ex_nx.data.pc := pc
  ex_nx.data.op1:= op1
  ex_nx.data.op2:= op2
  ex_nx.data.rs1:= rs1
  ex_nx.data.rs2:= rs2
  ex_nx.data.rd := ir.r_rd

  val tvalid_nx = Wire(Bool)
  val tvalid = Reg(tvalid_nx) init 0
  when(io.source.t.valid & io.source.t.ready) {tvalid_nx := true.B}
  .elsewhen(io.sink.t.valid & io.sink.t.ready) {tvalid_nx := false.B}

  io.sink.t.valid = tvalid
  io.source.t.ready := io.sink.t.ready & ~io.lock
  io.invalid := ctrl.op === op_t.NONE & io.source.t.valid
}

