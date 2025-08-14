module Sequence_Detector (
        input wire clk,             // 50 MHz clock input
        input wire data_in,
        output reg [3:0] led,              // LED output
		  output wire flag
);

	reg [3:0] target = 4'b0110;
	
	assign flag = led==target? 1'b1:1'b0;

    always @(posedge clk) begin
		  led[0]<=led[1];
		  led[1]<=led[2];
		  led[2]<=led[3];
		  led[3]<=data_in;
    end

endmodule