//////////////////////////////////////////////////////////////////////////////////
// Design: Single port synchronous RAM with 64Byte storage capacity
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module ram(addr,data,clk,rw,out);
    input  wire [5:0] addr;     
    input  wire [7:0] data;
    input  wire clk;
    input  wire rw;             //when rw = 1 : write and when rw = 0 : read
    output reg [7:0] out;
    
    reg [7:0] ram [63:0];
    
    always @(posedge clk)
        begin
            case (rw) 
                1'b0 : out <= ram[addr];
                1'b1 : ram[addr] <= data;
                default : out <= 7'h0;
            endcase
        end
endmodule


