/*
 * Copyright (c) 2015, 2016 C. Brett Witherspoon
 */

module cpubench;
  // timeunit 1ns;
  // timeprecision 1ps;
  wire [7:0] gpio_i, gpio_o;
  logic uart_tx, uart_rx;

  // Clock (100 MHz)
  bit clk = 0;
  always #5ns clk <= ~clk;

  // Reset
  bit rst_n;
  task reset();
    rst_n = 1;
    #100ns rst_n = 0;
    #100ns rst_n = 1;
  endtask : reset

  task dump();
    $write("\nRegisters:\n\n");
    for (int i = 0; i < 32; i+=4) begin : dump_registers
      $write("%2d: %08h %08h %08h %08h\n", i,
        i==0 ? 32'h0:x_dut.x_cpu.x_regfile.regs[i],
        x_dut.x_cpu.x_regfile.regs[i+1],
        x_dut.x_cpu.x_regfile.regs[i+2],
        x_dut.x_cpu.x_regfile.regs[i+3]
      );
    end : dump_registers
    $write("\n");
  endtask

  task tb_uart_rx;
  endtask

  task tb_uart_tx;
    input [7:0] char;
    integer i;
    uart_rx = 1'h0;
    i = 0;
    @(posedge clk);
    repeat(8) begin
      uart_rx = char[7-i];
      i=i+1;
      @(posedge clk);
    end
  endtask

  task wait_finish();
    wait(gpio_o[7:0] == 8'hFF);
    dump();
    $info("all tests complete");
    $finish(0);
  endtask

  initial begin
    uart_rx = '1;
    reset(); // GSR ~100 ns
    wait_finish;
  end

  assign gpio_i[7:0] = '0;

  soc x_dut( .* );

  logic [8*256-1:0] line;
  logic [7:0] ch;
  logic [3:0] tb_uart_rxst;
  integer cursor;

  always @(posedge clk) begin: TB_UART_RX
    if (!rst_n) begin
      tb_uart_rxst <= '0;
      cursor <= 255;
      line <= '0;
    end else case(tb_uart_rxst)
      4'h0: if (!uart_tx) begin
        tb_uart_rxst <= 4'h1;
        ch <= 0;
      end
      4'h9: begin
        tb_uart_rxst <= 4'h0;
        line[cursor*8+:8] <= ch;
        cursor <= cursor-1;
        if (ch == 8'h0A) begin
          $write("[%tns]UART: %s\n", $time, line);
          cursor <= 255;
          line <= '0;
        end
      end
      default: begin
        tb_uart_rxst <= tb_uart_rxst + 4'h1;
        ch <= {uart_tx, ch[7:1]};
      end
    endcase
  end

  always @(posedge clk) begin: CPU_MONITOR
    if (x_dut.io_retire_valid) begin
      $write("[%tns] pc:%h, ins:%h, ", $time, x_dut.io_retire_pc, x_dut.io_retire_inst);
      if (|x_dut.io_retire_store)
        $write("[%h]%s <- %h\n",
            x_dut.io_retire_ldst_addr,
            x_dut.io_retire_store==2'h3 ? "w":x_dut.io_retire_store==2'h2 ? "h":"b",
            x_dut.io_retire_store_data);
      else if (|x_dut.io_retire_load)
        $write("x%d <- %h[%h]%s\n",
            x_dut.io_retire_rd_sel,
            x_dut.io_retire_rd_data,
            x_dut.io_retire_ldst_addr,
            x_dut.io_retire_load==2'h3 ? "w":x_dut.io_retire_load==2'h2 ? "h":"b");
      else
        $write("x%d <- %h\n", x_dut.io_retire_rd_sel, x_dut.io_retire_rd_data);
    end
  end

endmodule: cpubench
