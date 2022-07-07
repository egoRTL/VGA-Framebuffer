onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Top_FB_TestBench/clk
add wave -noupdate /Top_FB_TestBench/reset_n
add wave -noupdate /Top_FB_TestBench/DUT/display_on
add wave -noupdate /Top_FB_TestBench/DUT/enable
add wave -noupdate -expand -group VGA /Top_FB_TestBench/DUT/hsync
add wave -noupdate -expand -group VGA /Top_FB_TestBench/DUT/vsync
add wave -noupdate -expand -group VGA /Top_FB_TestBench/DUT/hpos
add wave -noupdate -expand -group VGA /Top_FB_TestBench/DUT/vpos
add wave -noupdate -expand -group VGA /Top_FB_TestBench/DUT/rgb
add wave -noupdate -expand -group ROM /Top_FB_TestBench/DUT/fifofull
add wave -noupdate -expand -group ROM /Top_FB_TestBench/DUT/ROM_RGB
add wave -noupdate -expand -group ROM /Top_FB_TestBench/DUT/ROM_hpos
add wave -noupdate -expand -group ROM /Top_FB_TestBench/DUT/ROM_vpos
add wave -noupdate -expand -group FIFO -expand -group HPOS_data /Top_FB_TestBench/DUT/FIFO/HPOS_FIFO/data
add wave -noupdate -expand -group FIFO -expand -group VPOS_data /Top_FB_TestBench/DUT/FIFO/RGB_FIFO/data
add wave -noupdate -expand -group FIFO -expand -group RGB_data /Top_FB_TestBench/DUT/FIFO/VPOS_FIFO/data
add wave -noupdate -expand -group FIFO /Top_FB_TestBench/DUT/fifoempty
add wave -noupdate -expand -group FIFO /Top_FB_TestBench/DUT/fifopush
add wave -noupdate -expand -group FIFO /Top_FB_TestBench/DUT/fifopop
add wave -noupdate -expand -group FIFO /Top_FB_TestBench/DUT/RGBfifo
add wave -noupdate -expand -group FIFO /Top_FB_TestBench/DUT/hposfifo
add wave -noupdate -expand -group FIFO /Top_FB_TestBench/DUT/vposfifo
add wave -noupdate -expand -group FRAMEBUFFER /Top_FB_TestBench/DUT/hpos_to_fb
add wave -noupdate -expand -group FRAMEBUFFER /Top_FB_TestBench/DUT/vpos_to_fb
add wave -noupdate -expand -group FRAMEBUFFER -radix unsigned /Top_FB_TestBench/DUT/resetcnt
add wave -noupdate -expand -group FRAMEBUFFER /Top_FB_TestBench/DUT/FrameBuffer/R_data
add wave -noupdate -expand -group FRAMEBUFFER /Top_FB_TestBench/DUT/FrameBuffer/G_data
add wave -noupdate -expand -group FRAMEBUFFER /Top_FB_TestBench/DUT/FrameBuffer/B_data
add wave -noupdate -expand -group FRAMEBUFFER /Top_FB_TestBench/DUT/FrameBuffer/writeR_data
add wave -noupdate -expand -group FRAMEBUFFER /Top_FB_TestBench/DUT/FrameBuffer/writeG_data
add wave -noupdate -expand -group FRAMEBUFFER /Top_FB_TestBench/DUT/FrameBuffer/writeB_data
add wave -noupdate -expand -group FRAMEBUFFER /Top_FB_TestBench/DUT/FrameBuffer/addrbuf_wire
add wave -noupdate -expand -group FRAMEBUFFER /Top_FB_TestBench/DUT/FrameBuffer/we
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/hpos
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/vpos
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/datafromR
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/datafromG
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/datafromB
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/RGBin
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/display_on
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/memenable
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/we
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/RGB
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/Rdatatomem
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/Gdatatomem
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/Bdatatomem
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/addr
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/Rdatabuf
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/Gdatabuf
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/Bdatabuf
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/dataselect
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/dataselect_r
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/dataselect_w
add wave -noupdate -expand -group FRAMEBUFFER -expand -group CODEC /Top_FB_TestBench/DUT/FrameBuffer/FBCODEC/w_state
add wave -noupdate -expand -group FRAMEBUFFER -expand -group R /Top_FB_TestBench/DUT/FrameBuffer/R_MEMORY/ramblock
add wave -noupdate -expand -group FRAMEBUFFER -expand -group G /Top_FB_TestBench/DUT/FrameBuffer/G_MEMORY/ramblock
add wave -noupdate -expand -group FRAMEBUFFER -expand -group B /Top_FB_TestBench/DUT/FrameBuffer/B_MEMORY/ramblock
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8352929 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 382
configure wave -valuecolwidth 78
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {12893109 ps}
