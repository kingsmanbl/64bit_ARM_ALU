onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alustim/A
add wave -noupdate /alustim/B
add wave -noupdate /alustim/cntrl
add wave -noupdate -radix hexadecimal /alustim/result
add wave -noupdate /alustim/negative
add wave -noupdate /alustim/zero
add wave -noupdate /alustim/overflow
add wave -noupdate /alustim/carry_out
add wave -noupdate /alustim/dut/zero_detection/result
add wave -noupdate /alustim/dut/zero_detection/zero_detected
add wave -noupdate /alustim/dut/zero_detection/nor1
add wave -noupdate /alustim/dut/zero_detection/nor2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16067114094 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 398
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {44114093960 ps}
