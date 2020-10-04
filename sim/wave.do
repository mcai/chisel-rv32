onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpubench/clk
add wave -noupdate /cpubench/x_dut/clk
add wave -noupdate /cpubench/x_dut/rst_n
add wave -noupdate /cpubench/x_dut/gpio_o
add wave -noupdate /cpubench/x_dut/uart_tx
add wave -noupdate /cpubench/x_dut/uart_rx
add wave -noupdate /cpubench/x_dut/aclk
add wave -noupdate /cpubench/x_dut/aresetn
add wave -noupdate /cpubench/x_dut/reset
add wave -noupdate /cpubench/x_dut/irq
add wave -noupdate /cpubench/x_dut/code/aclk
add wave -noupdate /cpubench/x_dut/code/aresetn
add wave -noupdate /cpubench/x_dut/code/awaddr
add wave -noupdate /cpubench/x_dut/code/awprot
add wave -noupdate /cpubench/x_dut/code/awvalid
add wave -noupdate /cpubench/x_dut/code/awready
add wave -noupdate /cpubench/x_dut/code/wdata
add wave -noupdate /cpubench/x_dut/code/wstrb
add wave -noupdate /cpubench/x_dut/code/wvalid
add wave -noupdate /cpubench/x_dut/code/wready
add wave -noupdate /cpubench/x_dut/code/bresp
add wave -noupdate /cpubench/x_dut/code/bvalid
add wave -noupdate /cpubench/x_dut/code/bready
add wave -noupdate /cpubench/x_dut/code/araddr
add wave -noupdate /cpubench/x_dut/code/arprot
add wave -noupdate /cpubench/x_dut/code/arvalid
add wave -noupdate /cpubench/x_dut/code/arready
add wave -noupdate /cpubench/x_dut/code/rdata
add wave -noupdate /cpubench/x_dut/code/rresp
add wave -noupdate /cpubench/x_dut/code/rvalid
add wave -noupdate /cpubench/x_dut/code/rready
add wave -noupdate /cpubench/x_dut/data/aclk
add wave -noupdate /cpubench/x_dut/data/aresetn
add wave -noupdate /cpubench/x_dut/data/awaddr
add wave -noupdate /cpubench/x_dut/data/awprot
add wave -noupdate /cpubench/x_dut/data/awvalid
add wave -noupdate /cpubench/x_dut/data/awready
add wave -noupdate /cpubench/x_dut/data/wdata
add wave -noupdate /cpubench/x_dut/data/wstrb
add wave -noupdate /cpubench/x_dut/data/wvalid
add wave -noupdate /cpubench/x_dut/data/wready
add wave -noupdate /cpubench/x_dut/data/bresp
add wave -noupdate /cpubench/x_dut/data/bvalid
add wave -noupdate /cpubench/x_dut/data/bready
add wave -noupdate /cpubench/x_dut/data/araddr
add wave -noupdate /cpubench/x_dut/data/arprot
add wave -noupdate /cpubench/x_dut/data/arvalid
add wave -noupdate /cpubench/x_dut/data/arready
add wave -noupdate /cpubench/x_dut/data/rdata
add wave -noupdate /cpubench/x_dut/data/rresp
add wave -noupdate /cpubench/x_dut/data/rvalid
add wave -noupdate /cpubench/x_dut/data/rready
add wave -noupdate /cpubench/x_dut/mmio/aclk
add wave -noupdate /cpubench/x_dut/mmio/aresetn
add wave -noupdate /cpubench/x_dut/mmio/awaddr
add wave -noupdate /cpubench/x_dut/mmio/awprot
add wave -noupdate /cpubench/x_dut/mmio/awvalid
add wave -noupdate /cpubench/x_dut/mmio/awready
add wave -noupdate /cpubench/x_dut/mmio/wdata
add wave -noupdate /cpubench/x_dut/mmio/wstrb
add wave -noupdate /cpubench/x_dut/mmio/wvalid
add wave -noupdate /cpubench/x_dut/mmio/wready
add wave -noupdate /cpubench/x_dut/mmio/bresp
add wave -noupdate /cpubench/x_dut/mmio/bvalid
add wave -noupdate /cpubench/x_dut/mmio/bready
add wave -noupdate /cpubench/x_dut/mmio/araddr
add wave -noupdate /cpubench/x_dut/mmio/arprot
add wave -noupdate /cpubench/x_dut/mmio/arvalid
add wave -noupdate /cpubench/x_dut/mmio/arready
add wave -noupdate /cpubench/x_dut/mmio/rdata
add wave -noupdate /cpubench/x_dut/mmio/rresp
add wave -noupdate /cpubench/x_dut/mmio/rvalid
add wave -noupdate /cpubench/x_dut/mmio/rready
add wave -noupdate /cpubench/x_dut/uart/aclk
add wave -noupdate /cpubench/x_dut/uart/aresetn
add wave -noupdate /cpubench/x_dut/uart/psel
add wave -noupdate /cpubench/x_dut/uart/paddr
add wave -noupdate /cpubench/x_dut/uart/penable
add wave -noupdate /cpubench/x_dut/uart/pwrite
add wave -noupdate /cpubench/x_dut/uart/pwdata
add wave -noupdate /cpubench/x_dut/uart/prdata
add wave -noupdate /cpubench/x_dut/uart/pready
add wave -noupdate /cpubench/x_dut/uart/pslverr
add wave -noupdate /cpubench/x_dut/x_rom/waddr
add wave -noupdate /cpubench/x_dut/x_rom/wdata
add wave -noupdate /cpubench/x_dut/x_rom/wresp
add wave -noupdate /cpubench/x_dut/x_rom/raddr
add wave -noupdate /cpubench/x_dut/x_rom/rdata
add wave -noupdate /cpubench/x_dut/x_rom/resp
add wave -noupdate /cpubench/x_dut/x_rom/nc
add wave -noupdate /cpubench/x_dut/x_rom/bus/aclk
add wave -noupdate /cpubench/x_dut/x_rom/bus/aresetn
add wave -noupdate /cpubench/x_dut/x_rom/bus/awaddr
add wave -noupdate /cpubench/x_dut/x_rom/bus/awprot
add wave -noupdate /cpubench/x_dut/x_rom/bus/awvalid
add wave -noupdate /cpubench/x_dut/x_rom/bus/awready
add wave -noupdate /cpubench/x_dut/x_rom/bus/wdata
add wave -noupdate /cpubench/x_dut/x_rom/bus/wstrb
add wave -noupdate /cpubench/x_dut/x_rom/bus/wvalid
add wave -noupdate /cpubench/x_dut/x_rom/bus/wready
add wave -noupdate /cpubench/x_dut/x_rom/bus/bresp
add wave -noupdate /cpubench/x_dut/x_rom/bus/bvalid
add wave -noupdate /cpubench/x_dut/x_rom/bus/bready
add wave -noupdate /cpubench/x_dut/x_rom/bus/araddr
add wave -noupdate /cpubench/x_dut/x_rom/bus/arprot
add wave -noupdate /cpubench/x_dut/x_rom/bus/arvalid
add wave -noupdate /cpubench/x_dut/x_rom/bus/arready
add wave -noupdate /cpubench/x_dut/x_rom/bus/rdata
add wave -noupdate /cpubench/x_dut/x_rom/bus/rresp
add wave -noupdate /cpubench/x_dut/x_rom/bus/rvalid
add wave -noupdate /cpubench/x_dut/x_rom/bus/rready
add wave -noupdate /cpubench/x_dut/x_rom/blockram/clk
add wave -noupdate /cpubench/x_dut/x_rom/blockram/rsta
add wave -noupdate /cpubench/x_dut/x_rom/blockram/ena
add wave -noupdate /cpubench/x_dut/x_rom/blockram/wea
add wave -noupdate /cpubench/x_dut/x_rom/blockram/addra
add wave -noupdate /cpubench/x_dut/x_rom/blockram/dia
add wave -noupdate /cpubench/x_dut/x_rom/blockram/doa
add wave -noupdate /cpubench/x_dut/x_rom/blockram/rstb
add wave -noupdate /cpubench/x_dut/x_rom/blockram/enb
add wave -noupdate /cpubench/x_dut/x_rom/blockram/web
add wave -noupdate /cpubench/x_dut/x_rom/blockram/addrb
add wave -noupdate /cpubench/x_dut/x_rom/blockram/dib
add wave -noupdate /cpubench/x_dut/x_rom/blockram/dob
add wave -noupdate /cpubench/x_dut/x_rom/blockram/_doa
add wave -noupdate /cpubench/x_dut/x_rom/blockram/_dob
add wave -noupdate /cpubench/x_dut/x_ram/waddr
add wave -noupdate /cpubench/x_dut/x_ram/wdata
add wave -noupdate /cpubench/x_dut/x_ram/wresp
add wave -noupdate /cpubench/x_dut/x_ram/raddr
add wave -noupdate /cpubench/x_dut/x_ram/rdata
add wave -noupdate /cpubench/x_dut/x_ram/resp
add wave -noupdate /cpubench/x_dut/x_ram/nc
add wave -noupdate /cpubench/x_dut/x_ram/bus/aclk
add wave -noupdate /cpubench/x_dut/x_ram/bus/aresetn
add wave -noupdate /cpubench/x_dut/x_ram/bus/awaddr
add wave -noupdate /cpubench/x_dut/x_ram/bus/awprot
add wave -noupdate /cpubench/x_dut/x_ram/bus/awvalid
add wave -noupdate /cpubench/x_dut/x_ram/bus/awready
add wave -noupdate /cpubench/x_dut/x_ram/bus/wdata
add wave -noupdate /cpubench/x_dut/x_ram/bus/wstrb
add wave -noupdate /cpubench/x_dut/x_ram/bus/wvalid
add wave -noupdate /cpubench/x_dut/x_ram/bus/wready
add wave -noupdate /cpubench/x_dut/x_ram/bus/bresp
add wave -noupdate /cpubench/x_dut/x_ram/bus/bvalid
add wave -noupdate /cpubench/x_dut/x_ram/bus/bready
add wave -noupdate /cpubench/x_dut/x_ram/bus/araddr
add wave -noupdate /cpubench/x_dut/x_ram/bus/arprot
add wave -noupdate /cpubench/x_dut/x_ram/bus/arvalid
add wave -noupdate /cpubench/x_dut/x_ram/bus/arready
add wave -noupdate /cpubench/x_dut/x_ram/bus/rdata
add wave -noupdate /cpubench/x_dut/x_ram/bus/rresp
add wave -noupdate /cpubench/x_dut/x_ram/bus/rvalid
add wave -noupdate /cpubench/x_dut/x_ram/bus/rready
add wave -noupdate /cpubench/x_dut/x_ram/blockram/clk
add wave -noupdate /cpubench/x_dut/x_ram/blockram/rsta
add wave -noupdate /cpubench/x_dut/x_ram/blockram/ena
add wave -noupdate /cpubench/x_dut/x_ram/blockram/wea
add wave -noupdate /cpubench/x_dut/x_ram/blockram/addra
add wave -noupdate /cpubench/x_dut/x_ram/blockram/dia
add wave -noupdate /cpubench/x_dut/x_ram/blockram/doa
add wave -noupdate /cpubench/x_dut/x_ram/blockram/rstb
add wave -noupdate /cpubench/x_dut/x_ram/blockram/enb
add wave -noupdate /cpubench/x_dut/x_ram/blockram/web
add wave -noupdate /cpubench/x_dut/x_ram/blockram/addrb
add wave -noupdate /cpubench/x_dut/x_ram/blockram/dib
add wave -noupdate /cpubench/x_dut/x_ram/blockram/dob
add wave -noupdate /cpubench/x_dut/x_ram/blockram/_doa
add wave -noupdate /cpubench/x_dut/x_ram/blockram/_dob
add wave -noupdate /cpubench/x_dut/x_cpu/clock
add wave -noupdate /cpubench/x_dut/x_cpu/reset
add wave -noupdate /cpubench/x_dut/x_cpu/io_irq
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_aw_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_aw_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_aw_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_aw_bits_prot
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_w_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_w_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_w_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_w_bits_strb
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_b_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_b_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_b_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_ar_bits_prot
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_r_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/io_code_r_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_aw_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_aw_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_aw_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_aw_bits_prot
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_w_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_w_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_w_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_w_bits_strb
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_b_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_b_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_b_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_ar_bits_prot
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_r_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/io_data_r_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_aw_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_aw_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_aw_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_aw_bits_prot
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_w_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_w_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_w_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_w_bits_strb
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_b_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_b_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_b_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_ar_bits_prot
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_r_ready
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/io_mmio_r_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/io_wb_valid
add wave -noupdate /cpubench/x_dut/x_cpu/io_wb_pc
add wave -noupdate /cpubench/x_dut/x_cpu/io_wb_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard_io_decode_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard_io_decode_bits_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard_io_execute_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard_io_execute_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard_io_memory_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard_io_memory_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard_io_stall
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard_io_lock
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_decode_bits_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_execute_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_execute_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_execute_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_memory_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_memory_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_memory_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_writeback_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_writeback_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_writeback_bits_data_rd_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_rs1
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward_io_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_clock
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_reset
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_branch
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_target
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_trap
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_stall
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_cache_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_cache_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_cache_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_cache_r_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_cache_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_cache_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_sink_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_sink_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_sink_bits_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch_io_sink_bits_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile_clock
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile_io_rs1_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile_io_rs2_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile_io_rs1_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile_io_rs2_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile_io_rd_en
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile_io_rd_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile_io_rd_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_clock
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_reset
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_lock
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_rs1_sel
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_rs2_sel
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_alu_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_exe_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_mem_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_rs1_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_rs2_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_rs1_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_rs2_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_invalid
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_source_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_source_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_source_bits_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_source_bits_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_bits_ctrl_fn
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_bits_ctrl_br
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_bits_data_op1
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_bits_data_op2
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_bits_data_rs1
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_bits_data_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode_io_sink_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_clock
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_reset
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_branch
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_target
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_bypass
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_bits_ctrl_fn
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_bits_ctrl_br
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_bits_data_op1
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_bits_data_op2
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_bits_data_rs1
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_bits_data_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_source_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_sink_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_sink_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_sink_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_sink_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_sink_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_sink_bits_data_alu
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_sink_bits_data_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute_io_sink_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_fault
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_aw_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_aw_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_aw_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_w_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_w_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_w_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_w_bits_strb
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_b_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_b_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_cache_r_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_aw_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_aw_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_aw_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_w_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_w_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_w_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_w_bits_strb
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_b_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_b_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_r_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_data_r_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_aw_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_aw_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_aw_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_w_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_w_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_w_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_w_bits_strb
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_b_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_b_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_r_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate_io_mmio_r_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_clock
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_reset
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_aw_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_aw_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_aw_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_w_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_w_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_w_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_w_bits_strb
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_b_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_b_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_r_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_cache_r_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_source_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_source_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_source_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_source_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_source_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_source_bits_data_alu
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_source_bits_data_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_source_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_sink_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_sink_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_sink_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_sink_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_sink_bits_data_rd_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory_io_sink_bits_data_rd_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_rd_load
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_rd_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_rd_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_wb_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_wb_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_wb_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_source_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_source_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_source_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_source_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_source_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_source_bits_data_rd_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback_io_source_bits_data_rd_addr
add wave -noupdate /cpubench/x_dut/x_cpu/_T
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/io_decode_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/io_decode_bits_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/io_execute_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/io_execute_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/io_memory_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/io_memory_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/io_stall
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/io_lock
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/opcode
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_1
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_2
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_3
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/jump
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_6
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_7
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_8
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_9
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_10
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_11
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_12
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_13
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_14
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_15
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_17
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_18
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_19
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_20
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_21
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_22
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_23
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_24
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_25
add wave -noupdate /cpubench/x_dut/x_cpu/x_hazard/_T_26
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_decode_bits_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_execute_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_execute_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_execute_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_memory_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_memory_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_memory_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_writeback_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_writeback_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_writeback_bits_data_rd_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_rs1
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/io_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_1
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_2
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_4
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/ex_rs1
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_6
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_7
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_9
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/mm_rs1
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_11
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_12
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_14
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_16
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_17
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_18
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_19
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_20
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_21
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_22
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_23
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_24
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_25
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/wb_rs1
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_27
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_28
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/ex_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_32
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_33
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/mm_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_37
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_38
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/wb_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_53
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_GEN_0
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_GEN_1
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_GEN_2
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_T_55
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_GEN_4
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_GEN_5
add wave -noupdate /cpubench/x_dut/x_cpu/x_forward/_GEN_6
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/clock
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/reset
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_branch
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_target
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_trap
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_stall
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_cache_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_cache_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_cache_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_cache_r_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_cache_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_cache_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_sink_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_sink_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_sink_bits_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/io_sink_bits_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/raddr
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/rdata
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/lock
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_1
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/trapped
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_GEN_1
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_GEN_2
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/arvalid
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_3
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_4
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_5
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_6
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_GEN_3
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_GEN_4
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/araddr
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_8
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_9
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_10
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_12
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_17
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_18
add wave -noupdate /cpubench/x_dut/x_cpu/x_fetch/_T_19
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/clock
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/io_rs1_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/io_rs2_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/io_rs1_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/io_rs2_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/io_rd_en
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/io_rd_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/io_rd_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/regs__T_1_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/regs__T_1_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/regs__T_4_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/regs__T_4_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/regs__T_8_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/regs__T_8_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/regs__T_8_mask
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/regs__T_8_en
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/_T
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/_T_3
add wave -noupdate /cpubench/x_dut/x_cpu/x_regfile/_T_6
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/clock
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/reset
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_lock
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_rs1_sel
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_rs2_sel
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_alu_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_exe_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_mem_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_rs1_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_rs2_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_rs1_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_rs2_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_invalid
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_source_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_source_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_source_bits_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_source_bits_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_bits_ctrl_fn
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_bits_ctrl_br
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_bits_data_op1
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_bits_data_op2
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_bits_data_rs1
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_bits_data_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/io_sink_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ex_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ex_ctrl_fn
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ex_ctrl_br
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ex_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ex_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ex_data_op1
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ex_data_op2
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ex_data_rs1
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ex_data_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ex_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_2
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/i_imm
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/s_imm
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/b_imm
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/u_imm
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_22
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/j_imm
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_32
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_34
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_35
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_36
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_37
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_38
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_39
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_43
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_44
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_0
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_4
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_5
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_9
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_10
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_14
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_15
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_19
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_20
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_24
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_25
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_29
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_30
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_34
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_35
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_39
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_45
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_61
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_62
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_63
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_64
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_65
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_80
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_84
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_85
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_86
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_89
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_90
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_91
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_94
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_95
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_96
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_99
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_100
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_101
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_104
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_105
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_106
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_109
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_73
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_110
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_114
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_115
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_119
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_120
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_124
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_125
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_129
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_130
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_134
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_80
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_135
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_139
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_140
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_144
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_145
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_149
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_150
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_154
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_155
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_159
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_160
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_161
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_164
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_165
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_166
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_169
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_170
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_171
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_174
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_175
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_176
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_179
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_180
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_181
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_184
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_185
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_186
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_189
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ctrl_op2
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ctrl_op1
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_85
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_86
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_87
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_88
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_89
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_90
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_93
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_94
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_95
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_96
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_97
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/tvalid
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_99
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_100
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_216
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_GEN_217
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_101
add wave -noupdate /cpubench/x_dut/x_cpu/x_decode/_T_103
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/clock
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/reset
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_branch
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_target
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_bypass
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_bits_ctrl_fn
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_bits_ctrl_br
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_bits_data_op1
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_bits_data_op2
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_bits_data_rs1
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_bits_data_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_source_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_sink_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_sink_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_sink_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_sink_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_sink_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_sink_bits_data_alu
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_sink_bits_data_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/io_sink_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu_io_fn
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu_io_op1
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu_io_op2
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu_io_out
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/mm_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/mm_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/mm_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/mm_data_alu
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/mm_data_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/mm_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_1
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/eq
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/lt
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/ltu
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/jmp
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_5
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_6
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_7
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/beq
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_9
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_10
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_11
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/bne
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_13
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_14
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/blt
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_16
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_17
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/bltu
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_19
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_20
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_21
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_22
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/bge
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_24
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_25
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_26
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_27
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/bgeu
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_28
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_29
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_30
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_31
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_32
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_33
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/tvalid
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_35
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_T_36
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_GEN_0
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/_GEN_1
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/io_fn
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/io_op1
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/io_op2
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/io_out
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/shamt
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_1
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_3
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_4
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_6
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_7
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_11
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_8
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_9
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_12
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_13
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_14
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_15
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_16
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_17
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_18
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_19
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_20
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_21
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_24
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_25
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_26
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_27
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_28
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_T_29
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_0
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_1
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_2
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_3
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_4
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_5
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_6
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_7
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_8
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_9
add wave -noupdate /cpubench/x_dut/x_cpu/x_execute/x_alu/_GEN_10
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_fault
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_aw_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_aw_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_aw_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_w_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_w_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_w_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_w_bits_strb
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_b_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_b_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_cache_r_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_aw_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_aw_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_aw_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_w_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_w_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_w_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_w_bits_strb
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_b_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_b_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_r_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_data_r_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_aw_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_aw_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_aw_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_w_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_w_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_w_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_w_bits_strb
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_b_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_b_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_r_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/io_mmio_r_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_3
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/wcode
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_4
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_7
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/wdata
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/wmmio
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_GEN_0
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_GEN_1
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/write
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_8
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_11
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/rcode
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_12
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_15
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/rdata
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/rmmio
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_GEN_3
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_GEN_4
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/read
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_18
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_20
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_23
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_24
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_25
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_34
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_35
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_36
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_39
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_41
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_53
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_54
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_55
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_GEN_9
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_GEN_10
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_GEN_11
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_GEN_12
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_58
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_60
add wave -noupdate /cpubench/x_dut/x_cpu/x_arbitrate/_T_65
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/clock
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/reset
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_aw_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_aw_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_aw_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_w_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_w_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_w_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_w_bits_strb
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_b_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_b_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_ar_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_ar_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_r_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_r_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_r_bits_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_cache_r_bits_resp
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_source_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_source_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_source_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_source_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_source_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_source_bits_data_alu
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_source_bits_data_rs2
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_source_bits_data_rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_sink_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_sink_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_sink_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_sink_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_sink_bits_data_rd_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/io_sink_bits_data_rd_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/wb_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/wb_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/wb_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/wb_data_rd_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/wb_data_rd_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_1
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_6
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_8
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_10
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_13
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_15
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_16
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_17
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_18
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_20
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_21
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_22
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_23
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_24
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_25
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/write
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_26
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_27
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_28
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_29
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/cawaddr
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/cwdata
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/cwstrb
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/awvalid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_38
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_GEN_13
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_GEN_14
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/wvalid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_39
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_GEN_15
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_GEN_16
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/bready
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_40
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_GEN_17
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_GEN_18
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_42
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_43
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_44
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_45
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_46
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_47
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_48
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_49
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_50
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_51
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/read
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/reading
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_52
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_GEN_20
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/arvalid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_53
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_GEN_22
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_GEN_23
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_54
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_55
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_56
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_57
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/araddr
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/op
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/rd
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_66
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_67
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_71
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_73
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_76
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_78
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_80
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_83
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_85
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_87
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_89
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_92
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_94
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_95
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_98
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_100
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_101
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_104
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_106
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_107
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_110
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_112
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_113
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_117
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_120
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_123
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_126
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_127
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_128
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/tvalid
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_131
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_132
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_134
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_135
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_136
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_T_137
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_GEN_40
add wave -noupdate /cpubench/x_dut/x_cpu/x_memory/_GEN_41
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_rd_load
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_rd_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_rd_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_wb_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_wb_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_wb_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_source_ready
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_source_valid
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_source_bits_ctrl_op
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_source_bits_data_pc
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_source_bits_data_ir_inst
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_source_bits_data_rd_data
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/io_source_bits_data_rd_addr
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T_2
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T_4
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T_5
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T_6
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T_7
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T_8
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T_9
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T_10
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T_11
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T_12
add wave -noupdate /cpubench/x_dut/x_cpu/x_writeback/_T_13
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/aclk
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/aresetn
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/st_r
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/st_c
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/rdata_r
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/aclk
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/aresetn
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/awaddr
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/awprot
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/awvalid
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/awready
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/wdata
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/wstrb
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/wvalid
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/wready
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/bresp
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/bvalid
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/bready
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/araddr
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/arprot
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/arvalid
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/arready
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/rdata
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/rresp
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/rvalid
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/axi/rready
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/apb/aclk
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/apb/aresetn
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/apb/psel
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/apb/paddr
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/apb/penable
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/apb/pwrite
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/apb/pwdata
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/apb/prdata
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/apb/pready
add wave -noupdate -group x2p /cpubench/x_dut/x_x2p/apb/pslverr
add wave -noupdate -group uart /cpubench/x_dut/x_uart/CLK
add wave -noupdate -group uart /cpubench/x_dut/x_uart/RSTN
add wave -noupdate -group uart /cpubench/x_dut/x_uart/PADDR
add wave -noupdate -group uart /cpubench/x_dut/x_uart/PWDATA
add wave -noupdate -group uart /cpubench/x_dut/x_uart/PWRITE
add wave -noupdate -group uart /cpubench/x_dut/x_uart/PSEL
add wave -noupdate -group uart /cpubench/x_dut/x_uart/PENABLE
add wave -noupdate -group uart /cpubench/x_dut/x_uart/PRDATA
add wave -noupdate -group uart /cpubench/x_dut/x_uart/PREADY
add wave -noupdate -group uart /cpubench/x_dut/x_uart/PSLVERR
add wave -noupdate -group uart /cpubench/x_dut/x_uart/rx_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/tx_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/scr_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/event_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/register_adr
add wave -noupdate -group uart /cpubench/x_dut/x_uart/regs_q
add wave -noupdate -group uart /cpubench/x_dut/x_uart/regs_n
add wave -noupdate -group uart /cpubench/x_dut/x_uart/trigger_level_n
add wave -noupdate -group uart /cpubench/x_dut/x_uart/trigger_level_q
add wave -noupdate -group uart /cpubench/x_dut/x_uart/rx_data
add wave -noupdate -group uart /cpubench/x_dut/x_uart/parity_error
add wave -noupdate -group uart /cpubench/x_dut/x_uart/IIR_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/clr_int
add wave -noupdate -group uart /cpubench/x_dut/x_uart/tx_ready
add wave -noupdate -group uart /cpubench/x_dut/x_uart/apb_rx_ready
add wave -noupdate -group uart /cpubench/x_dut/x_uart/rx_valid
add wave -noupdate -group uart /cpubench/x_dut/x_uart/tx_fifo_clr_n
add wave -noupdate -group uart /cpubench/x_dut/x_uart/tx_fifo_clr_q
add wave -noupdate -group uart /cpubench/x_dut/x_uart/rx_fifo_clr_n
add wave -noupdate -group uart /cpubench/x_dut/x_uart/rx_fifo_clr_q
add wave -noupdate -group uart /cpubench/x_dut/x_uart/fifo_tx_valid
add wave -noupdate -group uart /cpubench/x_dut/x_uart/tx_valid
add wave -noupdate -group uart /cpubench/x_dut/x_uart/fifo_rx_valid
add wave -noupdate -group uart /cpubench/x_dut/x_uart/fifo_rx_ready
add wave -noupdate -group uart /cpubench/x_dut/x_uart/rx_ready
add wave -noupdate -group uart /cpubench/x_dut/x_uart/fifo_tx_data
add wave -noupdate -group uart /cpubench/x_dut/x_uart/fifo_rx_data
add wave -noupdate -group uart /cpubench/x_dut/x_uart/tx_data
add wave -noupdate -group uart /cpubench/x_dut/x_uart/tx_elements
add wave -noupdate -group uart /cpubench/x_dut/x_uart/rx_elements
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/clk_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/rstn_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/rx_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/cfg_div_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/cfg_en_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/cfg_parity_en_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/cfg_bits_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/busy_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/err_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/err_clr_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/rx_data_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/rx_valid_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/rx_ready_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/CS
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/NS
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/reg_data
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/reg_data_next
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/reg_rx_sync
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/reg_bit_count
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/reg_bit_count_next
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/s_target_bits
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/parity_bit
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/parity_bit_next
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/sampleData
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/baud_cnt
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/baudgen_en
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/bit_done
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/start_bit
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/set_error
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_i/s_rx_fall
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/clk_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/rstn_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/tx_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/busy_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/cfg_en_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/cfg_div_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/cfg_parity_en_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/cfg_bits_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/cfg_stop_bits_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/tx_data_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/tx_valid_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/tx_ready_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/CS
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/NS
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/reg_data
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/reg_data_next
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/reg_bit_count
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/reg_bit_count_next
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/s_target_bits
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/parity_bit
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/parity_bit_next
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/sampleData
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/baud_cnt
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/baudgen_en
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_i/bit_done
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/clk_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/rstn_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/clr_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/elements_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/data_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/valid_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/ready_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/valid_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/data_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/ready_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/pointer_in
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/pointer_out
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/elements
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/full
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_rx_fifo_i/loop1
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/clk_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/rstn_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/clr_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/elements_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/data_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/valid_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/ready_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/valid_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/data_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/ready_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/pointer_in
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/pointer_out
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/elements
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/full
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_tx_fifo_i/loop1
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/clk_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/rstn_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/IER_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/RDA_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/CTI_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/error_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/rx_elements_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/tx_elements_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/trigger_level_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/clr_int_i
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/interrupt_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/IIR_o
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/iir_n
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/iir_q
add wave -noupdate -group uart /cpubench/x_dut/x_uart/uart_interrupt_i/trigger_level_reached
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {705 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 421
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {680 ns} {783 ns}
