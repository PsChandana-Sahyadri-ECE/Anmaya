`timescale 1ns/1ps

module tb_mux4to1;
    
    reg [3:0] data_in;
    reg [1:0] sel;
    
    
    wire out;
    
    
    mux4to1 uut (
        .data_in(data_in),
        .sel(sel),
        .out(out)
    );
    
    initial begin
        
        data_in = 4'b0000;
        sel = 2'b00;
        
        
        $monitor("Time=%0t | Data=%4b | Sel=%2b | Out=%b", 
                $time, data_in, sel, out);
        
        
        $dumpfile("mux4to1.vcd");
        $dumpvars(0, tb_mux4to1);
        
        
        
        data_in = 4'b1010;  
        #10 sel = 2'b00;    // Select input 0 (should be 0)
        #10 sel = 2'b01;    // Select input 1 (should be 1)
        #10 sel = 2'b10;    // Select input 2 (should be 0)
      #10 sel = 2'b11;    // Select input 3 (should be 
        #10 $finish;
    end
endmodule
