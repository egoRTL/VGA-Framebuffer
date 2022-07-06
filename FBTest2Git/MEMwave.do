onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TestBench/clk
add wave -noupdate /TestBench/memreset
add wave -noupdate /TestBench/reset_n
add wave -noupdate -radix unsigned /TestBench/resetcnt
add wave -noupdate -radix unsigned /TestBench/hpos
add wave -noupdate -radix unsigned /TestBench/vpos
add wave -noupdate /TestBench/RGBin
add wave -noupdate /TestBench/RGB
add wave -noupdate -expand -group Banks /TestBench/DUT/R_MEMORY/ramblock
add wave -noupdate -expand -group Banks /TestBench/DUT/G_MEMORY/ramblock
add wave -noupdate -expand -group Banks /TestBench/DUT/B_MEMORY/ramblock
add wave -noupdate -expand -group Debug -group DUT /TestBench/DUT/writeR_data
add wave -noupdate -expand -group Debug -group DUT /TestBench/DUT/writeG_data
add wave -noupdate -expand -group Debug -group DUT /TestBench/DUT/writeB_data
add wave -noupdate -expand -group Debug -group DUT /TestBench/DUT/R_data
add wave -noupdate -expand -group Debug -group DUT /TestBench/DUT/G_data
add wave -noupdate -expand -group Debug -group DUT /TestBench/DUT/B_data
add wave -noupdate -expand -group Debug -group DUT /TestBench/DUT/addrbuf_wire
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/reset
add wave -noupdate -expand -group Debug -expand -group FBCODEC -radix unsigned /TestBench/DUT/FBCODEC/hpos
add wave -noupdate -expand -group Debug -expand -group FBCODEC -radix unsigned /TestBench/DUT/FBCODEC/vpos
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/datafromR
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/datafromG
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/datafromB
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/RGBin
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/display_on
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/we
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/dataselect_r
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/dataselect_w
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/w_state
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/memenable
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/RGB
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/Rdatatomem
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/Gdatatomem
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/Bdatatomem
add wave -noupdate -expand -group Debug -expand -group FBCODEC -radix unsigned /TestBench/DUT/FBCODEC/addr
add wave -noupdate -expand -group Debug -expand -group FBCODEC -radix unsigned /TestBench/DUT/FBCODEC/dataselect
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/Rdatabuf
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/Gdatabuf
add wave -noupdate -expand -group Debug -expand -group FBCODEC /TestBench/DUT/FBCODEC/Bdatabuf
add wave -noupdate -expand -group Debug -group R_MEMORY /TestBench/DUT/R_MEMORY/data
add wave -noupdate -expand -group Debug -group R_MEMORY /TestBench/DUT/R_MEMORY/addr
add wave -noupdate -expand -group Debug -group R_MEMORY /TestBench/DUT/R_MEMORY/we
add wave -noupdate -expand -group Debug -group R_MEMORY /TestBench/DUT/R_MEMORY/clk
add wave -noupdate -expand -group Debug -group R_MEMORY /TestBench/DUT/R_MEMORY/memenable
add wave -noupdate -expand -group Debug -group R_MEMORY /TestBench/DUT/R_MEMORY/resetcnt
add wave -noupdate -expand -group Debug -group R_MEMORY /TestBench/DUT/R_MEMORY/q
add wave -noupdate -expand -group Debug -group R_MEMORY /TestBench/DUT/R_MEMORY/ramblock
add wave -noupdate -expand -group Debug -group R_MEMORY /TestBench/DUT/R_MEMORY/addr_x
add wave -noupdate -expand -group Debug -group R_MEMORY /TestBench/DUT/R_MEMORY/data_x
add wave -noupdate -expand -group Debug -group R_MEMORY /TestBench/DUT/R_MEMORY/we_x
add wave -noupdate -expand -group Debug -group G_MEMORY /TestBench/DUT/G_MEMORY/data
add wave -noupdate -expand -group Debug -group G_MEMORY /TestBench/DUT/G_MEMORY/addr
add wave -noupdate -expand -group Debug -group G_MEMORY /TestBench/DUT/G_MEMORY/we
add wave -noupdate -expand -group Debug -group G_MEMORY /TestBench/DUT/G_MEMORY/clk
add wave -noupdate -expand -group Debug -group G_MEMORY /TestBench/DUT/G_MEMORY/memenable
add wave -noupdate -expand -group Debug -group G_MEMORY /TestBench/DUT/G_MEMORY/resetcnt
add wave -noupdate -expand -group Debug -group G_MEMORY /TestBench/DUT/G_MEMORY/q
add wave -noupdate -expand -group Debug -group G_MEMORY /TestBench/DUT/G_MEMORY/ramblock
add wave -noupdate -expand -group Debug -group G_MEMORY /TestBench/DUT/G_MEMORY/addr_x
add wave -noupdate -expand -group Debug -group G_MEMORY /TestBench/DUT/G_MEMORY/data_x
add wave -noupdate -expand -group Debug -group G_MEMORY /TestBench/DUT/G_MEMORY/we_x
add wave -noupdate -expand -group Debug -group B_MEMORY /TestBench/DUT/B_MEMORY/data
add wave -noupdate -expand -group Debug -group B_MEMORY /TestBench/DUT/B_MEMORY/addr
add wave -noupdate -expand -group Debug -group B_MEMORY /TestBench/DUT/B_MEMORY/we
add wave -noupdate -expand -group Debug -group B_MEMORY /TestBench/DUT/B_MEMORY/clk
add wave -noupdate -expand -group Debug -group B_MEMORY /TestBench/DUT/B_MEMORY/memenable
add wave -noupdate -expand -group Debug -group B_MEMORY /TestBench/DUT/B_MEMORY/resetcnt
add wave -noupdate -expand -group Debug -group B_MEMORY /TestBench/DUT/B_MEMORY/q
add wave -noupdate -expand -group Debug -group B_MEMORY /TestBench/DUT/B_MEMORY/ramblock
add wave -noupdate -expand -group Debug -group B_MEMORY /TestBench/DUT/B_MEMORY/addr_x
add wave -noupdate -expand -group Debug -group B_MEMORY /TestBench/DUT/B_MEMORY/data_x
add wave -noupdate -expand -group Debug -group B_MEMORY /TestBench/DUT/B_MEMORY/we_x
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8212 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 275
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
WaveRestoreZoom {8027 ns} {8588 ns}
