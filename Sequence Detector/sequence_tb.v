`timescale 1ns/1ns

module sequence_tb;
	reg [31:0] data_stream = 32'b01101100_11000110_11001100_11110110;
	reg data;
	reg reset_en;
	wire out;
	reg clk;
	
	Sequence_Detector sd(
	.data_in(data_stream[31]),
	.out(out),
	.clk(clk),
	.reset_en(reset_en)
	);
	integer i;
	
	initial begin
        clk = 0;
		  reset_en = 0;
    end
	
	initial
	begin
		#10 clk = 1;
		#10 clk = 0;
		for(i=0; i<300;i=i+1)begin
			data_stream = data_stream<<1;
			#10 clk = 1;
			#10 clk = 0;
		end
	$stop;
	$finish;
	end

endmodule