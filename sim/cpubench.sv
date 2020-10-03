/*
 * Copyright (c) 2015, 2016 C. Brett Witherspoon
 */

`ifndef TEXT_FILE
    `define TEXT_FILE "src/testbench.text.mem"
`endif

`ifndef DATA_FILE
    `define DATA_FILE "src/testbench.data.mem"
`endif

module cpubench;
    // timeunit 1ns;
    // timeprecision 1ps;

    // Clock (100 MHz)
    bit clk = 0;
    always #5ns clk <= ~clk;

    // Reset
    bit rst;
    task reset();
        rst = 1;
        #100ns rst = 0;
    endtask : reset

    wire aclk = clk;
    wire aresetn = ~rst;

    logic irq = 1'b0;

    axi code (.*);
    axi data (.*);
    axi mmio (.*);

    ram #(.INIT_FILE(`TEXT_FILE)) rom (.bus(code));
    ram #(.INIT_FILE(`DATA_FILE)) ram (.bus(data));
    ram #(.DATA_DEPTH(2048)) io (.bus(mmio));

    Cpu x_dut (
      .clock(clk),
      .reset(rst),
      .io_irq(irq),
      .io_code_aw_ready(code.awready),
      .io_code_aw_valid(code.awvalid),
      .io_code_aw_bits_addr(code.awaddr),
      .io_code_aw_bits_prot(code.awprot),
      .io_code_w_ready(code.wready),
      .io_code_w_valid(code.wvalid),
      .io_code_w_bits_data(code.wdata),
      .io_code_w_bits_strb(code.wstrb),
      .io_code_b_ready(code.bready),
      .io_code_b_valid(code.bvalid),
      .io_code_b_bits_resp(code.bresp),
      .io_code_ar_ready(code.arready),
      .io_code_ar_valid(code.arvalid),
      .io_code_ar_bits_addr(code.araddr),
      .io_code_ar_bits_prot(code.arprot),
      .io_code_r_ready(code.rready),
      .io_code_r_valid(code.rvalid),
      .io_code_r_bits_data(code.rdata),
      .io_code_r_bits_resp(code.rresp),
      .io_data_aw_ready(data.awready),
      .io_data_aw_valid(data.awvalid),
      .io_data_aw_bits_addr(data.awaddr),
      .io_data_aw_bits_prot(data.awprot),
      .io_data_w_ready(data.wready),
      .io_data_w_valid(data.wvalid),
      .io_data_w_bits_data(data.wdata),
      .io_data_w_bits_strb(data.wstrb),
      .io_data_b_ready(data.bready),
      .io_data_b_valid(data.bvalid),
      .io_data_b_bits_resp(data.bresp),
      .io_data_ar_ready(data.arready),
      .io_data_ar_valid(data.arvalid),
      .io_data_ar_bits_addr(data.araddr),
      .io_data_ar_bits_prot(data.arprot),
      .io_data_r_ready(data.rready),
      .io_data_r_valid(data.rvalid),
      .io_data_r_bits_data(data.rdata),
      .io_data_r_bits_resp(data.rresp),
      .io_mmio_aw_ready(mmio.awready),
      .io_mmio_aw_valid(mmio.awvalid),
      .io_mmio_aw_bits_addr(mmio.awaddr),
      .io_mmio_aw_bits_prot(mmio.awprot),
      .io_mmio_w_ready(mmio.wready),
      .io_mmio_w_valid(mmio.wvalid),
      .io_mmio_w_bits_data(mmio.wdata),
      .io_mmio_w_bits_strb(mmio.wstrb),
      .io_mmio_b_ready(mmio.bready),
      .io_mmio_b_valid(mmio.bvalid),
      .io_mmio_b_bits_resp(mmio.bresp),
      .io_mmio_ar_ready(mmio.arready),
      .io_mmio_ar_valid(mmio.arvalid),
      .io_mmio_ar_bits_addr(mmio.araddr),
      .io_mmio_ar_bits_prot(mmio.arprot),
      .io_mmio_r_ready(mmio.rready),
      .io_mmio_r_valid(mmio.rvalid),
      .io_mmio_r_bits_data(mmio.rdata),
      .io_mmio_r_bits_resp(mmio.rresp)

    );

    task dump();
        $write("\nRegisters:\n\n");
        for (int i = 1; i < 32; i++) begin : dump_registers
            $write("%2d: %08h\n", i, x_dut.x_regfile.regs[i]);
        end : dump_registers
        $write("\nMemory:\n\n");
        for (int i = 0; i < 8; i++) begin : dump_memory
            $write("%08h: ", i*4);
            for (int j = 0; j < 4; j++)
                $write("%08h ", io.blockram.mem[i+j]);
            $write("\n");
        end : dump_memory
        $write("\n");
    endtask

    initial begin
        reset(); // GSR ~100 ns

        repeat (14) @(posedge clk);
        @(negedge clk) assert(x_dut.x_regfile.regs[7] == 5) begin
            $info("execute and memory forwarding succeeded");
        end else begin
            dump();
            $fatal(1, "execute and memory forwarding failed");
        end

        repeat (4) @(posedge clk);
        @(negedge clk) assert(x_dut.x_regfile.regs[7] == 9) begin
            $info("memory and writeback forwarding succeeded");
        end else begin
            dump();
            $fatal(1, "memory and writeback forwarding failed");
        end

        $info("all tests succeeded");
        $finish(0);
    end

endmodule: cpubench
