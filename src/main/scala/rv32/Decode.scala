package rv32

import chisel3._
import chisel3.util._

object DecCtrl {
  def apply(op: UInt, fn: UInt, br: UInt, op1: UInt, op2: UInt): CtrlT = {
    val ret = Wire(new CtrlT)
    ret.op := op(3, 0)
    ret.fn := fn(3, 0)
    ret.br := br(2, 0)
    ret.op1 := op1(0)
    ret.op2 := op2(2, 0)
    ret
  }
}

class Decode extends Module {
  val io = IO(new Bundle {
    val lock = Input(Bool())
    val branch = Input(Bool())
    val rs1_sel = Input(UInt(2.W))
    val rs2_sel = Input(UInt(2.W))
    val alu_data = Input(UInt(32.W))
    val exe_data = Input(UInt(32.W))
    val mem_data = Input(UInt(32.W))
    val rs1_data = Input(UInt(32.W))
    val rs2_data = Input(UInt(32.W))
    val rs1_addr = Output(UInt(5.W))
    val rs2_addr = Output(UInt(5.W))
    val invalid = Output(Bool())
    val source = Flipped(Irrevocable(new IdT))
    val sink = Irrevocable(new ExT)
    //val ctrl = Output(new CtrlT)
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
  val SW    = DecCtrl(op_t.STORE_WORD,          fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.S_IMM)
  val SH    = DecCtrl(op_t.STORE_HALF,          fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.S_IMM)
  val SB    = DecCtrl(op_t.STORE_BYTE,          fn_t.ADD,   br_t.NA,   op1_t.RS1, op2_t.S_IMM)

  val id = io.source.bits
  val ex = Reg(new ExT)
  val pc = id.pc
  val ir = id.ir
  val ctrl = Wire(new CtrlT)

  val i_imm = ir.i_imm
  val s_imm = ir.s_imm
  val b_imm = ir.b_imm
  val u_imm = ir.u_imm
  val j_imm = ir.j_imm

  val rs1, rs2, op1, op2 = Wire(UInt(32.W))

  io.sink.bits := ex
  io.rs1_addr := ir.r_rs1
  io.rs2_addr := ir.r_rs2

  ctrl := NONE
  switch(ir.r_opcode) {
    is(opcode_t.OP_IMM) {
      switch(ir.r_funct3) {
        is(funct3_t.ADD) { ctrl := ADDI }
        is(funct3_t.SLL) { ctrl := SLLI }
        is(funct3_t.SLT) { ctrl := SLTI }
        is(funct3_t.SLTIU) { ctrl := SLTIU }
        is(funct3_t.XOR) { ctrl := XORI }
        is(funct3_t.SRL) { ctrl := Mux(ir.r_funct7(5), SRAI, SRLI) }
        is(funct3_t.OR ) { ctrl := ORI  }
        is(funct3_t.AND) { ctrl := ANDI }
      }
    }
    is(opcode_t.OP) {
      switch(ir.r_funct3) {
        is(funct3_t.ADD) { ctrl := Mux(ir.r_funct7(5), SUB, ADD) }
        is(funct3_t.SLL) { ctrl := SLL }
        is(funct3_t.SLT) { ctrl := SLT }
        is(funct3_t.SLTIU) { ctrl := SLTU }
        is(funct3_t.XOR) { ctrl := XOR }
        is(funct3_t.SRL) { ctrl := Mux(ir.r_funct7(5), SRA, SRL) }
        is(funct3_t.OR ) { ctrl := OR  }
        is(funct3_t.AND) { ctrl := AND }
      }
    }
    is(opcode_t.LUI)    { ctrl := LUI   }
    is(opcode_t.AUIPC)  { ctrl := AUIPC }
    is(opcode_t.JAL)    { ctrl := JAL   }
    is(opcode_t.JALR)   { ctrl := JALR  }
    is(opcode_t.BRANCH) {
      switch(ir.r_funct3) {
        is(funct3_t.BEQ)  { ctrl := BEQ }
        is(funct3_t.BNE)  { ctrl := BNE }
        is(funct3_t.BLT)  { ctrl := BLT }
        is(funct3_t.BLTU) { ctrl := BLTU }
        is(funct3_t.BGE)  { ctrl := BGE }
        is(funct3_t.BGEU) { ctrl := BGEU }
      }
    }
    is(opcode_t.LOAD) {
      switch(ir.r_funct3) {
        is(funct3_t.LW)   { ctrl := LW }
        is(funct3_t.LH)   { ctrl := LH }
        is(funct3_t.LHU)  { ctrl := LHU }
        is(funct3_t.LB)   { ctrl := LB }
        is(funct3_t.LBU)  { ctrl := LBU }
      }
    }
    is(opcode_t.STORE) {
      switch(ir.r_funct3) {
        is(funct3_t.SB)   { ctrl := SB }
        is(funct3_t.SH)   { ctrl := SH }
        is(funct3_t.SW)   { ctrl := SW }
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

  when(io.sink.ready) {
    ex.ctrl.op := ctrl.op
    ex.ctrl.fn := ctrl.fn
    ex.ctrl.br := ctrl.br
    ex.data.pc := pc
    ex.data.ir := ir
    ex.data.op1:= op1
    ex.data.op2:= op2
    ex.data.rs1:= rs1
    ex.data.rs2:= rs2
    ex.data.rd := ir.r_rd
  }

  val tvalid = RegInit(false.B)
  when(io.branch) {tvalid := false.B}
  .elsewhen(io.source.fire()) {tvalid := true.B}
  .elsewhen(io.sink.fire()) {tvalid := false.B}

  io.sink.valid := tvalid
  io.source.ready := io.sink.ready & ~io.lock
  io.invalid := ctrl.op === op_t.NONE & io.source.valid
  //io.ctrl := ctrl
}

