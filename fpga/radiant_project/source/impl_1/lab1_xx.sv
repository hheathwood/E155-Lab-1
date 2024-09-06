// Henry Heathwood
// hheathwood@Hmc.edu
// 9/3/24
// Top level verilog file for lab 1
module top_level(input logic [3:0] data,
					output logic [2:0] led, logic [6:0] seg);
					
	//calling other modules
	led_logic s1(data, led);
	seven_segment_decoder s2(data, seg);

endmodule

