module brush
# (
	parameter SLOWNESS = 16,//number of position of counter clock divider
				 RESOLUTION_H = 640,
				 RESOLUTION_V = 480,
	//cursor moving speed is  CLK/2^SLOWNESS
//			    COLOR = 3, //color of cursor_rgb
				 HPOS_WIDTH=0, //coordinate wires width
				 VPOS_WIDTH=0,
				 BRUSH_BASE_SIZE=10,
				 BRUSH_MAX_SIZE=30,
				 INIT_XPOS = RESOLUTION_H/2,
				 INIT_YPOS = RESOLUTION_V/2,
				 SIZE_WIDTH= $clog2(BRUSH_MAX_SIZE)

)
(
	input clk,
	input reset,
	input [3:0] BTN, // [2:0]movedirection=[2:0]key_sw
	input [3:0] BTN_POSEDGE,
	input display_on,
	input [HPOS_WIDTH - 1:0]hpos,
	input [VPOS_WIDTH - 1:0]vpos,
	input [2:0]FB_RGB,
	output[2:0] rgb
);

reg [SIZE_WIDTH - 1:0] brush_size;
reg [HPOS_WIDTH - 1:0] cursor_xpos;
reg [VPOS_WIDTH - 1:0] cursor_ypos;
//reg [2:0] cursorsprite [CURSOR_SIZE*CURSOR_SIZE-1:0];
reg [SLOWNESS:0] counterclk; //clkdiv counter

//brush counter
always@(posedge clk or posedge reset) begin //ALWAYS MAKE ASYNCRONIC RESET ,WHEN WORKING WITH SPRITES!!!
if(reset) counterclk<=0;
else if(display_on) counterclk<=counterclk+1;
end

//brush movement
always@(posedge clk or posedge reset) begin
if(reset) begin
cursor_xpos<=INIT_XPOS;
cursor_ypos<=INIT_YPOS;
end else begin
	if (BTN[2]) begin // move right or down
		if(BTN[0]&&(counterclk==0)) if(cursor_xpos!=RESOLUTION_H-brush_size) cursor_xpos<=cursor_xpos+'b1; // move right
		if(BTN[1]&&(counterclk==0)) if(cursor_ypos!=RESOLUTION_V-brush_size) cursor_ypos<=cursor_ypos+'b1; // move down
	end else if (~BTN[2]) begin //move left or up
		if(BTN[0]&&(counterclk==0)) if(cursor_xpos != brush_size) cursor_xpos<=cursor_xpos-'b1; // move left
		if(BTN[1]&&(counterclk==0)) if(cursor_ypos != brush_size) cursor_ypos<=cursor_ypos-'b1; // move up 
	end
end
end

//brush size
always@(posedge clk or posedge reset) begin
if(reset) begin
brush_size<=BRUSH_BASE_SIZE;
end else begin
if(BTN_POSEDGE[3]&&BTN[2]&&~BTN[1]&&~BTN[0]) if(brush_size == BRUSH_MAX_SIZE) brush_size<=BRUSH_BASE_SIZE;
else brush_size<=brush_size+'d10;
end
end

brush_sprite
#(
	.HPOS_WIDTH	(	HPOS_WIDTH	),
	.VPOS_WIDTH	(	VPOS_WIDTH	),
	.SIZE_WIDTH	(	SIZE_WIDTH	)
)
(
	.clk			(	clk			),
	.reset	 	(	reset			),
	.display_on	(	display_on	),
	.cursor_xpos(	cursor_xpos	),
	.hpos			(	hpos			),
	.cursor_ypos(	cursor_ypos	),
	.vpos			(	vpos			),
	.brush_size	(	brush_size	),
	.FB_RGB		(	FB_RGB		),
	.rgb			(	rgb			)
);


endmodule 