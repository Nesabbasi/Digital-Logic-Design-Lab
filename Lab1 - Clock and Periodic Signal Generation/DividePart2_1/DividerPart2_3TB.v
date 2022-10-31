`timescale 1ps/1ps
module DividerPart2_3TB();
	reg DN, preset;
	wire UP ,out, outCo;
	wire[7:0] outputs;
	reg [7:0] inputs;
	DividerPart2_3 div2_3(outputs[0], inputs[3], inputs[2], inputs[1], inputs[0], UP, DN, inputs[7], inputs[6], inputs[5], inputs[4], preset, outputs[1], outputs[2], outputs[3], outputs[4], outputs[5], outputs[6], outputs[7], out, outCo);
	oscillator #(5, 525) ringOsc(1'b1, UP);
	initial begin
		#0 {inputs[7], inputs[6], inputs[5], inputs[4], inputs[3], inputs[2], inputs[1], inputs[0]} = 8'b10011001;
		#0 {DN, preset} = 2'b10;
		#10000 preset = 1'b1;
		#1200000 $stop;
	end
endmodule