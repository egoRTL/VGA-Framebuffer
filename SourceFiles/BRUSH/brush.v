module brush
# (
	parameter SLOWNESS = 16,//number of position of counter clock divider
				 RESOLUTION_H = 640,
				 RESOLUTION_V = 480,
	//cursor moving speed is  CLK/2^SLOWNESS
//			    COLOR = 3, //color of cursor_rgb
				 HPOS_WIDTH=0, //coordinate wires width
				 VPOS_WIDTH=0,
				 BRUSH_SIZE=20,
				 BRUSH_COLOR=3'b101,
				 INIT_XPOS = RESOLUTION_H/2,
				 INIT_YPOS = RESOLUTION_V/2

)
(
	input clk,
	input reset,
	input [3:0] BTN, // [2:0]movedirection=[2:0]key_sw
	input display_on,
	input [HPOS_WIDTH - 1:0]hpos,
	input [VPOS_WIDTH - 1:0]vpos,
	input [2:0]FB_RGB,
	output reg [2:0] rgb
);

reg [SLOWNESS:0] counterclk=0; //clkdiv counter
reg [HPOS_WIDTH - 1:0]cursor_xpos;
reg [VPOS_WIDTH - 1:0]cursor_ypos;
//reg [5:0] brush_size;
//reg [2:0] cursorsprite [CURSOR_SIZE*CURSOR_SIZE-1:0];

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
end else /*if(display_on)*/ begin
	if (BTN[2]) begin // move right or down
		if(BTN[0]&&(counterclk==0)) if(cursor_xpos!=RESOLUTION_H-BRUSH_SIZE) cursor_xpos<=cursor_xpos+'b1; // move right
		if(BTN[1]&&(counterclk==0)) if(cursor_ypos!=RESOLUTION_V-BRUSH_SIZE) cursor_ypos<=cursor_ypos+'b1; // move down
	end else if (~BTN[2]) begin //move left or up
		if(BTN[0]&&(counterclk==0)) if(cursor_xpos != BRUSH_SIZE) cursor_xpos<=cursor_xpos-'b1; // move left
		if(BTN[1]&&(counterclk==0)) if(cursor_ypos != BRUSH_SIZE) cursor_ypos<=cursor_ypos-'b1; // move up 
	end
end
end

//brush size
//always@(posedge clk or posedge reset) begin
//if(reset) begin
//brush_size<='d10;
//end else /*if(display_on)*/  begin
//
//end
//end

//brush sprite
always @ (posedge clk or posedge reset)
        if (reset)
            rgb <= 3'b000;
        else if (display_on)
         if ((vpos >= cursor_ypos - BRUSH_SIZE)&&(vpos <= cursor_ypos + BRUSH_SIZE)&&(hpos >= cursor_xpos - BRUSH_SIZE)&&(hpos <= cursor_xpos + BRUSH_SIZE)) 
				rgb <= BRUSH_COLOR;
         else rgb <= FB_RGB;
		  else  rgb <= 3'b000;

endmodule 