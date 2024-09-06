// Henry Heathwood
// hheathwood@Hmc.edu
// 9/3/24
// System Verilog File for 7-segment display decoding

module seven_segment_decoder(input logic [3:0] data, 
						output logic [6:0] seg);
						
	always_comb
		case (data)
			0: seg = ~(7'b011_1111); // ZERO
			1: seg = ~(7'b000_0110); // ONE
			2: seg = ~(7'b101_1011); // TWO
			3: seg = ~(7'b100_1111); // THREE
			4: seg = ~(7'b110_0110); // FOUR
			5: seg = ~(7'b110_1101); // FIVE
			6: seg = ~(7'b111_1101); // SIX
			7: seg = ~(7'b000_0111); // SEVEN
			8: seg = ~(7'b111_1111); // EIGHT
			9: seg = ~(7'b110_1111); // NINE
			10: seg = ~(7'b111_0111); // TEN
			11: seg = ~(7'b111_1100); // ELEVEN
			12: seg = ~(7'b011_1001); // TWELVE
			13: seg = ~(7'b101_1110); // THIRTEEN
			14: seg = ~(7'b111_1001); // FOURTEEN
			15: seg = ~(7'b111_0001); // FIFTEEN
			default: seg = ~(7'b000_0000); // DEFAULT
		endcase
endmodule