`timescale 1ps/1ps
module oscillatorTB();
reg vi;
wire vo;
oscillator #(5,2000)oscillatorTB(vi,vo);
initial begin
	vi = 0;
	#50;
	vi = 1;
	#40;
end
endmodule
