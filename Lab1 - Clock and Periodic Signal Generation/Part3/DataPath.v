`timescale 1ps/1ps
module DataPath(output reg [7:0] register, input clk, ldEn, cntEn, rst);
reg [7:0] count;
always@(posedge clk) begin
	if(rst)begin
		count <= 8'b0;
	end
		
	if(cntEn) begin
		count <= count + 1;

	end
end

always @(posedge clk) begin
 	if(rst)begin
		register <= 8'b0;
	end
 	if (ldEn)begin
 		register <= count;
	end
end

endmodule

