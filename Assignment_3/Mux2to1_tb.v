module mux_2to1_tb;

    
    reg a, b, sel;
    wire out;
    
    
    mux_2to1 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );
    
   
    initial begin
      
        a = 0; b = 0; sel = 0; #10;
        $display("Time=%0t: a=%b, b=%b, sel=%b => out=%b", $time, a, b, sel, out);
        
        a = 0; b = 0; sel = 1; #10;
        $display("Time=%0t: a=%b, b=%b, sel=%b => out=%b", $time, a, b, sel, out);
        
        a = 0; b = 1; sel = 0; #10;
        $display("Time=%0t: a=%b, b=%b, sel=%b => out=%b", $time, a, b, sel, out);
        
        a = 0; b = 1; sel = 1; #10;
        $display("Time=%0t: a=%b, b=%b, sel=%b => out=%b", $time, a, b, sel, out);
        
        $finish;
    end
    
endmodule
