module soc #(
  parameter TEXT_FILE = "testbench.text.mem"
  ,parameter DATA_FILE = "testbench.data.mem"
) (
  input wire clk
  ,input wire rst_n
  ,output wire [7:0] gpio_o
  ,output wire uart_tx
  ,input wire uart_rx
);

localparam APB_SLV_CNT = 2;
localparam TIMER_CNT = 2;

wire aclk = clk;
wire aresetn = rst_n;
wire reset = ~rst_n;

logic irq, uart_irq;
logic [TIMER_CNT*2-1:0] timer_irq;

wire        io_retire_valid;
wire [31:0] io_retire_pc;
wire [31:0] io_retire_inst;
wire [1:0]  io_retire_load;
wire [1:0]  io_retire_store;
wire [31:0] io_retire_ldst_addr;
wire [31:0] io_retire_store_data;
wire [4:0]  io_retire_rd_sel;
wire [31:0] io_retire_rd_data;

axi code (.*);
axi data (.*);
axi mmio (.*);
apb apbx[APB_SLV_CNT](.*);

ram #(.INIT_FILE(TEXT_FILE), .DATA_DEPTH(16384)) x_rom (.bus(code));
ram #(.INIT_FILE(DATA_FILE), .DATA_DEPTH(16384)) x_ram (.bus(data));
//ram #(.DATA_DEPTH(2048)) x_io (.bus(mmio));

Cpu x_cpu (
  .clock(clk),
  .reset(reset),
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
  .io_mmio_r_bits_resp(mmio.rresp),
  .io_retire_valid(io_retire_valid),
  .io_retire_bits_pc(io_retire_pc),
  .io_retire_bits_inst(io_retire_inst),
  .io_retire_bits_load(io_retire_load),
  .io_retire_bits_store(io_retire_store),
  .io_retire_bits_ldst_addr(io_retire_ldst_addr),
  .io_retire_bits_store_data(io_retire_store_data),
  .io_retire_bits_rd_sel(io_retire_rd_sel),
  .io_retire_bits_rd_data(io_retire_rd_data)
);

axi2apb #(.SLV_NUM(APB_SLV_CNT)) x_x2p (
  .axi(mmio),
  .apb(apbx)
);

apb_uart x_uart (
  .CLK(clk),
  .RSTN(rst_n),
  .PADDR(apbx[0].paddr),
  .PWDATA(apbx[0].pwdata),
  .PWRITE(apbx[0].pwrite),
  .PSEL(apbx[0].psel),
  .PENABLE(apbx[0].penable),
  .PRDATA(apbx[0].prdata),
  .PREADY(apbx[0].pready),
  .PSLVERR(apbx[0].pslverr),
  .rx_i(uart_rx),
  .tx_o(uart_tx),
  .scr_o(gpio_o),
  .event_o(irq)
);

apb_timer #(.TIMER_CNT(TIMER_CNT)) x_timer (
  .HCLK(clk),
  .HRESETn(rst_n),
  .PADDR(apbx[1].paddr),
  .PWDATA(apbx[1].pwdata),
  .PWRITE(apbx[1].pwrite),
  .PSEL(apbx[1].psel),
  .PENABLE(apbx[1].penable),
  .PRDATA(apbx[1].prdata),
  .PREADY(apbx[1].pready),
  .PSLVERR(apbx[1].pslverr),
  .irq_o(timer_irq[TIMER_CNT*2-1:0])
);

endmodule: soc
