onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /computador_tb/c1/MAIN_CPU/clock
add wave -noupdate /computador_tb/c1/MAIN_CPU/reset
add wave -noupdate /computador_tb/c1/MAIN_CPU/inM
add wave -noupdate /computador_tb/c1/MAIN_CPU/instruction
add wave -noupdate /computador_tb/c1/MAIN_CPU/outM
add wave -noupdate /computador_tb/c1/MAIN_CPU/writeM
add wave -noupdate /computador_tb/c1/MAIN_CPU/addressM
add wave -noupdate /computador_tb/c1/MAIN_CPU/pcout
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_muxALUI_A
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_muxAM_ALU
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_muxSD_ALU
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_zx
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_nx
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_zy
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_ny
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_f
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_loadA
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_loadD
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_loadS
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_loadPC
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_loadM
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_zr
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_ng
add wave -noupdate -radix decimal /computador_tb/c1/MAIN_CPU/s_muxALUI_Aout
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_muxAM_ALUout
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_muxSDout
add wave -noupdate -radix decimal /computador_tb/c1/MAIN_CPU/s_regAout
add wave -noupdate -radix decimal /computador_tb/c1/MAIN_CPU/s_regDout
add wave -noupdate -radix decimal /computador_tb/c1/MAIN_CPU/s_regSout
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_ALUout
add wave -noupdate /computador_tb/c1/MAIN_CPU/s_pcout
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_a/clock
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_a/input
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_a/load
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_a/output
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_s/clock
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_s/input
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_s/load
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_s/output
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_d/clock
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_d/input
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_d/load
add wave -noupdate /computador_tb/c1/MAIN_CPU/reg_d/output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8211 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 274
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
WaveRestoreZoom {0 ps} {28126 ps}
