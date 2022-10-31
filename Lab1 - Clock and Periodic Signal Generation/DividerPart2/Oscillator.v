`timescale 1ps/1ps
module oscillator #(parameter  counter = 5,delay = 2)(input vi, output vo);
integer i;
reg [counter:0]temp;
assign temp[0] = vi;
initial begin
	while(1) begin
	    for(i = 0 ; i < counter ; i = i+1) begin
		    #delay temp[i+1] = ~temp[i];
	    end
	    temp[0] = temp[counter];
	end
end
assign vo = temp[counter];
endmodule
