module brush
# (
	parameter SLOWNESS = 18,//number of position of counter clock divider
				 RESOLUTION_H = 0,
				 RESOLUTION_V = 0,
	//cursor moving speed is  CLK/2^SLOWNESS
//			    COLOR = 3, //color of cursor_rgb
				 HPOS_WIDTH=0, //coordinate wires width
				 VPOS_WIDTH=0,
				 BRUSH_SIZE=10,
				 BRUSH_COLOR=3'b101,
				 INIT_XPOS = RESOLUTION_H/2,
				 INIT_YPOS = RESOLUTION_V/2

)
(
	input clk,
	input reset,
	input [3:0] BTN, // [2:0]movedirection=[2:0]key_sw
	input enable,
	input [HPOS_WIDTH - 1:0]hpos,
	input [VPOS_WIDTH - 1:0]vpos,
	input [2:0]FB_RGB,
	output reg [2:0] rgb
);

reg [SLOWNESS:0] counterclk=0; //clkdiv counter
reg [HPOS_WIDTH - 1:0]cursor_xpos;
reg [VPOS_WIDTH - 1:0]cursor_ypos;
//reg [2:0] cursorsprite [CURSOR_SIZE*CURSOR_SIZE-1:0];

always@(posedge clk)
if(reset) begin
counterclk<=0;
end else if(enable) begin
counterclk<=counterclk+1;
end

//cursor movement

always@(posedge clk)
if(reset) begin
	cursor_xpos<=INIT_XPOS;
	cursor_ypos<=INIT_YPOS;
end else if(enable) begin
	if (BTN[2]) begin // move left or down
		if(BTN[0]&&(counterclk==0)) cursor_xpos<=cursor_xpos+'b1; // move left
		if(BTN[1]&&(counterclk==0)) cursor_ypos<=cursor_ypos+'b1; // move down
		end
	else if (~BTN[2]) begin //move right or up
		if(BTN[0]&&(counterclk==0)) cursor_xpos<=cursor_xpos-'b1; // move right
		if(BTN[1]&&(counterclk==0)) cursor_ypos<=cursor_ypos-'b1; // move up
	end
end

always@ (posedge clk) begin
if(((hpos>=(cursor_xpos-BRUSH_SIZE))&&(hpos<=(cursor_xpos+BRUSH_SIZE)))&&
((vpos>=(cursor_ypos-BRUSH_SIZE))&&(vpos<=(cursor_ypos+BRUSH_SIZE)))) rgb<=BRUSH_COLOR;
else rgb<=FB_RGB;
end

endmodule 