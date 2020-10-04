/*
 * Copyright (c) 2015, 2016 C. Brett Witherspoon
 */

module cpubench;
    // timeunit 1ns;
    // timeprecision 1ps;
    wire [7:0] gpio_i, gpio_o;
    wire uart_tx, uart_rx;

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

    initial begin
        reset(); // GSR ~100 ns

        wait(gpio_o[7:0] == 8'hFF);

        dump();
        $info("all tests complete");
        $finish(0);
    end

    assign gpio_i[7:0] = '0;
    assign uart_rx = '0;

    soc x_dut( .* );

endmodule: cpubench
