onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group soc /cpubench/x_dut/clk
add wave -noupdate -expand -group soc /cpubench/x_dut/rst_n
add wave -noupdate -expand -group soc /cpubench/x_dut/gpio_o
add wave -noupdate -expand -group soc /cpubench/x_dut/uart_tx
add wave -noupdate -expand -group soc /cpubench/x_dut/uart_rx
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_valid
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_pc
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_inst
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_load
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_store
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_ldst_addr
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_store_data
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_rd_load
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_rd_sel
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_rd_data
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_branch
add wave -noupdate -expand -group soc /cpubench/x_dut/io_retire_target
add wave -noupdate {/cpubench/x_dut/x_timer/TIMER_GEN[0]/timer_i/regs_q[0]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {199425 ns} 0} {{Cursor 2} {168264 ns} 0}
quietly wave cursor active 2
configure wave -namecolwidth 344
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ns} {3744851 ns}
