module Top_Block(
	input wire clk,
	input wire en,
	output reg [7:0] led = 0   // LED output to show the number of sequence detected
);

wire data;
reg reset_en = 0;
wire out;

Sequence_Detector sq_det(
	.reset_en(reset_en),
   .clk(clk),
   .data_in(data),			//serial data in
	.out(out)	
);

Bit_Stream bit_stream(
	.clk(clk),
	.data_out(data),
	.en(en)
);


always @(posedge out)
		led = led+1;
		
endmodule