`timescale 1ps/1ps
module UARTTB();

    wire clk, ABAUD, UxRX;
    wire [1:0] k = 0;
    reg UxRXIF;
    reg [7:0] out;
    wire [1:0] outOscillator;
    ABRCKT abrkct(clk, ABAUD, UxRX, UxRXIF, out);
    oscillator #(5, 450)os1 (1'b1, outOscillator[0]);
    oscillator #(10, 450)os2 (1'b1, outOscillator[1]);
    oscillator #(20, 450)os3 (1'b1, outOscillator[2]);
    oscillator #(40, 450)os4 (1'b1, outOscillator[3]);
    initial begin 
	#5000 k = 2'b00;
	#5000 k = 2'b01;
	#5000 k = 2'b10;
	#5000 k = 2'b11;
    end

endmodule
