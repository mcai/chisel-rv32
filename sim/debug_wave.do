onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -group soc "/cpubench/x_dut/*"
add wave -group fetch     "/cpubench/x_dut/x_cpu/x_fetch/io_*"
add wave -group decode    "/cpubench/x_dut/x_cpu/x_decode/io_*"
add wave -group execute   "/cpubench/x_dut/x_cpu/x_execute/io_*"
add wave -group memory    "/cpubench/x_dut/x_cpu/x_memory/io_*"
add wave -group writeback "/cpubench/x_dut/x_cpu/x_writeback/io_*"
add wave -group hazard    "/cpubench/x_dut/x_cpu/x_hazard/io_*"
add wave -group forward   "/cpubench/x_dut/x_cpu/x_forward/io_*"
add wave -group regfile   "/cpubench/x_dut/x_cpu/x_regfile/io_*"
add wave -group uart -port "/cpubench/x_dut/x_uart/*"
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ns} {1 us}
