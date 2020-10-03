onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpubench/x_dut/clock
add wave -noupdate /cpubench/x_dut/reset
add wave -noupdate /cpubench/x_dut/x_fetch/io_cache_ar_ready
add wave -noupdate /cpubench/x_dut/x_fetch/io_cache_ar_valid
add wave -noupdate /cpubench/x_dut/x_fetch/io_cache_ar_bits_addr
add wave -noupdate /cpubench/x_dut/x_fetch/io_cache_r_ready
add wave -noupdate /cpubench/x_dut/x_fetch/io_cache_r_valid
add wave -noupdate /cpubench/x_dut/x_fetch/io_cache_r_bits_data
add wave -noupdate /cpubench/rom/bus/aclk
add wave -noupdate /cpubench/rom/bus/aresetn
add wave -noupdate /cpubench/rom/bus/araddr
add wave -noupdate /cpubench/rom/bus/arprot
add wave -noupdate /cpubench/rom/bus/arvalid
add wave -noupdate /cpubench/rom/bus/arready
add wave -noupdate /cpubench/rom/bus/rdata
add wave -noupdate /cpubench/rom/bus/rresp
add wave -noupdate /cpubench/rom/bus/rvalid
add wave -noupdate /cpubench/rom/bus/rready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {105 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 346
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
WaveRestoreZoom {0 ns} {173 ns}
