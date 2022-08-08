module brush_sprite
#(
	parameter SPRITE_MAX_SIZE  = 30,

				 SIZE_10_ROW_0	= 64'b000000000000000000000000,
				 SIZE_10_ROW_1	= 64'b000000000000000000000000,
				 SIZE_10_ROW_2	= 64'b000000000000000000000000,
				 SIZE_10_ROW_3	= 64'b000000000000000000000000,
				 SIZE_10_ROW_4	= 64'b000000000000000000000000,
				 SIZE_10_ROW_5	= 64'b000000000000000000000000,
				 SIZE_10_ROW_6	= 64'b000000000000000000000000,
				 SIZE_10_ROW_7	= 64'b000000000000000000000000,
				 SIZE_10_ROW_8	= 64'b000000000000000000000000,
				 SIZE_10_ROW_9	= 64'b000000000000000000000000,
				 
             ROW_0         = 32'h000cc000,
             ROW_1         = 32'h000cc000,
             ROW_2         = 32'h000cc000,
             ROW_3         = 32'hcccccccc,
             ROW_4         = 32'hcccccccc,
             ROW_5         = 32'h000cc000,
             ROW_6         = 32'h000cc000,
             ROW_7         = 32'h000cc000
				 
	HPOS_WIDTH=0, //coordinate wires width
	VPOS_WIDTH=0,
	SIZE_WIDTH=0,
	BRUSH_COLOR=3'b101
)
(
	input clk,reset,display_on,
	input [HPOS_WIDTH - 1:0] cursor_xpos,hpos,
	input [VPOS_WIDTH - 1:0] cursor_ypos,vpos,
	input [SIZE_WIDTH - 1:0] brush_size,
	input [2:0] FB_RGB,
	output reg [2:0] rgb
);

reg [2:0] ergb;

reg [SPRITE_MAX_SIZE * 3 - 1:0] row;

    always @*
        case (row_index)
        3'd0: row = ROW_0;
        3'd1: row = ROW_1;
        3'd2: row = ROW_2;
        3'd3: row = ROW_3;
        3'd4: row = ROW_4;
        3'd5: row = ROW_5;
        3'd6: row = ROW_6;
        3'd7: row = ROW_7;
        endcase

    always @*
        case (column_index)
        3'd0: ergb = row [31:28];
        3'd1: ergb = row [27:24];
        3'd2: ergb = row [23:20];
        3'd3: ergb = row [19:16];
        3'd4: ergb = row [15:12];
        3'd5: ergb = row [11: 8];
        3'd6: ergb = row [ 7: 4];
        3'd7: ergb = row [ 3: 0];
        endcase

//brush sprite
always @ (posedge clk or posedge reset)
        if (reset)
            rgb <= 3'b000;
        else if (display_on)
         if ((vpos >= cursor_ypos - brush_size)&&(vpos <= cursor_ypos + brush_size)&&(hpos >= cursor_xpos - brush_size)&&(hpos <= cursor_xpos + brush_size)) 
				rgb <= ergb;
         else rgb <= FB_RGB;
		  else  rgb <= 3'b000;

endmodule