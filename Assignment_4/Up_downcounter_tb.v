`timescale 1ns/1ps

module up_down_counter_tb;

    // Parameters
    parameter N = 4;                
    parameter CLK_PERIOD = 10;      
  
   
    reg clk;
    reg reset;
    reg up_down;
    wire [N-1:0] count;
    
  
    up_down_counter #(.N(N)) dut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );
    
   
    always #(CLK_PERIOD/2) clk = ~clk;
    
   
    initial begin
        $dumpfile("up_down_counter_waveform.vcd");
        $dumpvars(0, up_down_counter_tb);
        $display("VCD dump file will be created as: up_down_counter_waveform.vcd");
    end
    
    
    initial begin
       
        clk = 0;
        reset = 1;
        up_down = 1; // Start with up count
        
        
        $monitor("Time=%0t: reset=%b, up_down=%b, count=%d", $time, reset, up_down, count);
        
        // Reset functionality
        $display("\nTest 1: Reset Functionality");
        #CLK_PERIOD;
        if (count !== 0) $error("Reset failed - counter not zero");
        reset = 0;
        #CLK_PERIOD;
        
        // Count up sequence
        $display("\nTest 2: Count Up Sequence");
        up_down = 1;
        repeat(5) #CLK_PERIOD;
        if (count !== 5) $error("Count up failed - expected 5, got %d", count);
        
        // Count down sequence
        $display("\nTest 3: Count Down Sequence");
        up_down = 0;
        repeat(3) #CLK_PERIOD;
        if (count !== 2) $error("Count down failed - expected 2, got %d", count);
        
        // Reset during counting
        $display("\nTest 4: Reset During Counting");
        reset = 1;
        #CLK_PERIOD;
        if (count !== 0) $error("Reset during counting failed");
        reset = 0;
        
        // Count to max value and roll over
        $display("\nTest 5: Count to Max and Roll Over");
        up_down = 1;
        repeat((1<<N)-1) #CLK_PERIOD; // Count to max value
        if (count !== (1<<N)-1) $error("Max count failed");
        #CLK_PERIOD; // Should roll over to 0
        if (count !== 0) $error("Rollover failed");
        
        // Count to min value and roll under
        $display("\nTest 6: Count to Min and Roll Under");
        up_down = 0;
        repeat((1<<N)-1) #CLK_PERIOD; // Count down to min value
        if (count !== 1) $error("Min count failed");
        #CLK_PERIOD; // Should roll under to max value
        if (count !== (1<<N)-1) $error("Rollunder failed");
        
       
        $display("\nAll tests completed");
        $finish;
    end
    
endmodule

