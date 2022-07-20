if (RESOLUTION == "640x480") begin
parameter RESOLUTION_H =640
parameter RESOLUTION_V =480
parameter V_TOP = 	  	10
parameter V_SYNC = 	  	2
parameter V_BOTTOM =  	33
parameter H_FRONT =	  	16
parameter H_SYNC =	  	96
parameter H_BACK = 	  	48
parameter VGA_CLK_MHZ =	25
end else if(RESOLUTION == "768x576") begin
parameter RESOLUTION_H =768
parameter RESOLUTION_V =576
parameter V_TOP = 		1
parameter V_SYNC =		3
parameter V_BOTTOM =		17
parameter H_FRONT =		24
parameter H_SYNC =		80
parameter H_BACK = 		104
parameter VGA_CLK_MHZ = 35
end else if(RESOLUTION == "800x600") begin
parameter RESOLUTION_H =800
parameter RESOLUTION_V =600
parameter V_TOP = 		1
parameter V_SYNC = 		4
parameter V_BOTTOM =		23
parameter H_FRONT =		40
parameter H_SYNC = 		128
parameter H_BACK = 		88
parameter VGA_CLK_MHZ = 40
end else if(RESOLUTION == "1024x768") begin
parameter RESOLUTION_H =1024
parameter RESOLUTION_V =768
parameter V_TOP = 		3
parameter V_SYNC = 		6
parameter V_BOTTOM =		29
parameter H_FRONT =		24
parameter H_SYNC =		136
parameter H_BACK =		160
parameter VGA_CLK_MHZ =	65
end else if(RESOLUTION == "1152x864") begin
parameter RESOLUTION_H =1152
parameter RESOLUTION_V =864
parameter V_TOP = 		1
parameter V_SYNC = 		3
parameter V_BOTTOM =		27
parameter H_FRONT =		64
parameter H_SYNC = 		120
parameter H_BACK = 		184
parameter VGA_CLK_MHZ = 82
end else if(RESOLUTION == "1280x960") begin
parameter RESOLUTION_H =1280
parameter RESOLUTION_V =960
parameter V_TOP = 		1
parameter V_SYNC = 		3
parameter V_BOTTOM =		30
parameter H_FRONT =		80
parameter H_SYNC = 		136
parameter H_BACK =		216
parameter VGA_CLK_MHZ = 102
end else if(RESOLUTION == "1400x1050") begin
parameter RESOLUTION_H =1400
parameter RESOLUTION_V =1050
parameter V_TOP = 		1
parameter V_SYNC = 		3
parameter V_BOTTOM =		33
parameter H_FRONT =		88
parameter H_SYNC = 		152
parameter H_BACK =		240
parameter VGA_CLK_MHZ = 102
end else if(RESOLUTION == "1600x1200") begin
parameter RESOLUTION_H =1280
parameter RESOLUTION_V =960
parameter V_TOP = 		1
parameter V_SYNC = 		3
parameter V_BOTTOM =		46
parameter H_FRONT =		64
parameter H_SYNC = 		192
parameter H_BACK =		304
parameter VGA_CLK_MHZ = 162
end else if(RESOLUTION == "1920x1440") begin
parameter RESOLUTION_H =1920
parameter RESOLUTION_V =1440
parameter V_TOP = 		1
parameter V_SYNC = 		3
parameter V_BOTTOM =		56
parameter H_FRONT =		128
parameter H_SYNC = 		208
parameter H_BACK =		344
parameter VGA_CLK_MHZ = 234
end