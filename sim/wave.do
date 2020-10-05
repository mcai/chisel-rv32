onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpubench/gpio_i
add wave -noupdate /cpubench/gpio_o
add wave -noupdate /cpubench/uart_tx
add wave -noupdate /cpubench/uart_rx
add wave -noupdate /cpubench/clk
add wave -noupdate /cpubench/rst_n
add wave -noupdate -radix ascii -radixshowbase 0 /cpubench/line
add wave -noupdate /cpubench/ch
add wave -noupdate /cpubench/tb_uart_rxst
add wave -noupdate /cpubench/cursor
add wave -noupdate {/cpubench/x_dut/apbx[0]/aclk}
add wave -noupdate {/cpubench/x_dut/apbx[0]/aresetn}
add wave -noupdate {/cpubench/x_dut/apbx[0]/psel}
add wave -noupdate {/cpubench/x_dut/apbx[0]/paddr}
add wave -noupdate {/cpubench/x_dut/apbx[0]/penable}
add wave -noupdate {/cpubench/x_dut/apbx[0]/pwrite}
add wave -noupdate {/cpubench/x_dut/apbx[0]/pwdata}
add wave -noupdate {/cpubench/x_dut/apbx[0]/prdata}
add wave -noupdate {/cpubench/x_dut/apbx[0]/pready}
add wave -noupdate {/cpubench/x_dut/apbx[0]/pslverr}
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/clk_i
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/rstn_i
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/tx_o
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/busy_o
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/cfg_en_i
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/cfg_div_i
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/cfg_parity_en_i
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/cfg_bits_i
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/cfg_stop_bits_i
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/tx_data_i
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/tx_valid_i
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/tx_ready_o
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/CS
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/NS
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/reg_data
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/reg_data_next
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/reg_bit_count
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/reg_bit_count_next
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/s_target_bits
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/parity_bit
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/parity_bit_next
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/sampleData
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/baud_cnt
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/baudgen_en
add wave -noupdate /cpubench/x_dut/x_uart/uart_tx_i/bit_done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1180 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 389
configure wave -valuecolwidth 76
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
WaveRestoreZoom {966 ns} {1210 ns}
