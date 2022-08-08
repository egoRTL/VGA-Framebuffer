//`include "config.vh"

module top
# (
    parameter X_WIDTH = 10,
              Y_WIDTH = 10,
              clk_mhz = 50,
				  	RESOLUTION_H =640,
					RESOLUTION_V =480,
					V_TOP = 	  	10,
					V_SYNC = 	  	2,
					V_BOTTOM =  	33,
					H_FRONT =	  	16,
					H_SYNC =	  	96,
					H_BACK = 	  	48
)
(
    input        clk,
    input        reset_n,
    
    input  [3:0] key_sw,
    output [3:0] led,
    
    output [7:0] abcdefgh,
    output [3:0] digit,

    output       buzzer,

    output       hsync,
    output       vsync,
    output [2:0] rgb
);

    assign led       = key_sw;
    assign abcdefgh  = 8'hff;
    assign digit     = 4'hf;
    assign buzzer    = 1'b0;

    //------------------------------------------------------------------------

    wire                 display_on;
    wire [X_WIDTH - 1:0] pixel_x;
    wire [Y_WIDTH - 1:0] pixel_y;
 
	 pll pll(.areset(~reset_n),.inclk0(clk),.c0(pllclk));
 
    vga
    # (
        .HPOS_WIDTH ( X_WIDTH    ),
        .VPOS_WIDTH ( Y_WIDTH    ),
        
		  .H_DISPLAY( RESOLUTION_H ),
        .H_FRONT	(	H_FRONT		),
        .H_SYNC   (	H_SYNC		),
        .H_BACK   (	H_BACK		),
        .V_DISPLAY(	RESOLUTION_V),
        .V_BOTTOM (	V_BOTTOM		),
        .V_SYNC   (	V_SYNC		),
        .V_TOP    (	V_TOP			)
    )
    i_vga
    (
        .clk        ( pllclk        ), 
        .reset      ( ~reset_n   ),
        .hsync      ( hsync      ),
        .vsync      ( vsync      ),
		  .enable	  (1),
        .display_on ( display_on ),
        .hpos       ( pixel_x    ),
        .vpos       ( pixel_y    )
    );

	 brush
	 #(
	 .RESOLUTION_H   ( RESOLUTION_H ),
	 .RESOLUTION_V   ( RESOLUTION_V ),
	 .HPOS_WIDTH	  ( X_WIDTH ),
	 .VPOS_WIDTH 	  ( Y_WIDTH )
	 )
	 Painting_Brush
	 (
			.clk		  ( pllclk		),
			.reset	  ( ~reset_n 	),
			.BTN		  ( ~key_sw		), // [2:0]movedirection=[2:0]key_sw
			.display_on(display_on	),
			.hpos		  ( pixel_x		),
			.vpos		  ( pixel_y		),
			.FB_RGB	  (0),
			.rgb		  ( rgb			)
	 );
    //------------------------------------------------------------------------

endmodule
