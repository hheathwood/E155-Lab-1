// Henry Heathwood
// hheathwood@Hmc.edu
// 9/5/24
// System Verilog File for 2.4 Hz LED blinking

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

module led_logic(
	input logic [3:0] data,
	output logic [2:0] led
);
	always_comb
		case (data[1:0])
			2'b00: led[0] = 0;
			2'b01: led[0] = 1;
			2'b10: led[0] = 1;
			2'b11: led[0] = 0;
			default: led[0] = 0;
		endcase
		
	always_comb	
		case (data[3:2])
			2'b00: led[1] = 0;
			2'b01: led[1] = 0;
			2'b10: led[1] = 0;
			2'b11: led[1] = 1;
			default: led[1] = 0;
		endcase
		
	
endmodule
			