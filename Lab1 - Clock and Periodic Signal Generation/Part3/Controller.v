`timescale 1ps/1ps
module Controller(output reg cntRst, UxRXIF, ldEn, cntEn, input clk, ABAUD, UxRX);
    reg [3:0] ps,ns;
    parameter[3:0] Idle = 0, Init = 1, Start = 2 , U1 = 3, U2 = 4,U3 = 5, U4 = 6, U5 = 7, U6 = 8, U7 = 9, U8 = 10, End = 11;

    always@(ps, ABAUD, UxRX) 
    begin
        ns = Idle;
        {cntEn, ldEn, UxRXIF, cntRst} = 4'b0000;
        case(ps)
            Idle: ns = ABAUD ? Init : Idle;
            Init: begin 
                ns = UxRX ? Init : Start;
                cntRst = UxRX ? 1'b1 : 1'b0; 
            end
            Start: begin 
                ns = UxRX ? U1 : Start;
                cntRst = 1'b1; 
            end
            U1: begin
                ns = UxRX ? U1 : U2;
                cntEn = 1'b1;
            end
            U2: begin
                ns = UxRX ? U3 : U2;
                cntEn = 1'b1;
            end
            U3: begin 
                ns = UxRX ? U3 : U4;
                cntEn = 1'b1;
            end
            U4: begin
                ns = UxRX ? U5 : U4; 
                cntEn = 1'b1;
            end
            U5: begin
                ns = UxRX ? U5 : U6; 
                cntEn = 1'b1;
            end
            U6: begin
                ns = UxRX ? U7 : U6;
                cntEn = 1'b1;
            end
            U7: begin
                ns = UxRX ? U7 : U8 ; 
                cntEn = 1'b1;
            end 
            U8: ns = UxRX ? End : U8; 
            End: begin
                ns = Idle;
                UxRXIF = 1'b1;
                ldEn = 1'b1;
            end
        default ns = Idle;
        endcase
    end

    always@(posedge clk) begin
        ps <= ns;
    end
endmodule

