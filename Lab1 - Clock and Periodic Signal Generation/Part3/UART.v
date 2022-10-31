`timescale 1ps/1ps
module ABRCKT(input clk, ABAUD, UxRX, output UxRXIF, output [7:0] out);
    wire rst,ldEn, cntEn;
    Controller UARTController(rst, UxRXIF, ldEnEn, cntEn, clk, ABAUD, UxRX);
    DataPath UARTDataPath(out, clk, ldEn, cntEn, rst);
endmodule
