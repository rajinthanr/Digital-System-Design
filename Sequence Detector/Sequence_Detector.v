module Sequence_Detector(
		  //input reset_en,					//non repetitive enable pin
        input wire clk,             // 50 MHz clock input
        //input wire data_in,			//serial data in
        output reg [7:0] led = 0,       // LED output
		  output reg out					//flag to indicate pattern detection
);
	
	reg [3:0] sr=4'b1111;				//4bit shift register
	reg [31:0] bit_stream = 32'b01001100_11000110_11001100_11110110; //sample bit stream
	reg [3:0] target = 4'b0110;		//pattern to be detected
	wire flag;
	reg reset_en=0;
	wire data_in;
	reg [7:0]count=6;
	wire f;
	
	assign f=flag && reset_en;
	assign flag = (sr==target)? 1'b1:1'b0;
	assign data_in = bit_stream[31];
	
	always @(negedge clk)
		bit_stream = bit_stream<<1;

    always @(posedge clk or posedge f) begin
		if(f)                			//non repetitive
			sr = 4'b1111;
	
		else
			begin
			sr[0]<=sr[1];					//record incomming bits
			sr[1]<=sr[2];
			sr[2]<=sr[3];
			sr[3]<=data_in;
		end
    end
	 
	 
	 always @(posedge flag or posedge clk)
		begin
			if(flag) begin
					out = 1;					//keep output for one clock cycle
				end
			else
				out=0;
		end
		
		always @(posedge flag)
			led = led+1;
	 

endmodule