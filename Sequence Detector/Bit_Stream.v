module Bit_Stream(
	input wire en,
	input wire clk,
	output wire data_out
);

reg [31:0] bit_stream = 32'b01001100_11000110_11001100_11110110; //sample bit stream

assign data_out = bit_stream[31];

always @(negedge clk)
 if(!en)
	bit_stream = bit_stream<<1;
	
endmodule
		
		