//////////////////////////////////////////////////////////////////////////////////
// Design: Test Bench Single port synchronous RAM with 64Byte storage capacity
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module test_bench_ram();
//inputs for DUT
    reg [5:0] addr = 6'h0;     
    reg [7:0] data = 8'h0;
    reg clk = 1'b0;
    reg rw;             //when rw = 1 : write and when rw = 0 : read
//output from DUT    
    wire [7:0] out = 8'hz;
    
    ram DUT (.addr(addr), .data(data), .clk(clk), .rw(rw), .out(out));
    
    
    initial
        begin
            $display($time, " << Simulation Results >>");
            $monitor($time, "addr=%b, data=%b, clk=%b, rw=%b, out=%b", addr, data, clk, rw, out);
    end
    
    initial
        begin
            forever #5 clk = ~clk;
    end
    
     initial begin
            for(integer i=0; i<64; i=i+1) begin
                #10;
                rw   = 1'b1;
                addr = addr + 6'h1;
                data = data + 8'h2;
            end
            
            rw = 1'b0;
            addr = 6'h24;
            #10
            
            addr = 6'h2;
            #10
            
            addr = 6'h63;
            #10
            
            #5
            $finish;

        end

endmodule
