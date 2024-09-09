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

module top(
    input   logic nreset,
    output  logic led
);
 
  logic int_osc;
  
  // Internal high-speed oscillator
  HSOSC #(.CLKHF_DIV("0b01")) hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

  // Instantiate clock divider
  clk_divider clK_div(int_osc, nreset, led);

endmodule


module clk_divider(
	input   logic	clk, nreset,
	output  logic	clk_div
);

  logic [24:0] counter;
	
	// Counter
   always_ff @(posedge clk) begin
    if(!nreset)	counter <= 0;
    else       	counter <= counter + 1;
   end
  
   // Assign divided clock signal
   assign clk_div = counter[2];
	
endmodule

