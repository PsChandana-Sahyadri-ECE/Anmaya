module up_down_counter_tb;

    // Parameters
    parameter N = 4;
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Testbench signals
    reg clk;
    reg reset;
    reg up_down;
    wire [N-1:0] count;

    // Instantiate the counter
    up_down_counter #(.N(N)) uut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        up_down = 1; // Start with up count
        
        // Apply reset
        #CLK_PERIOD reset = 0;
        
        // Count up for 10 cycles
        #(10*CLK_PERIOD);
        
        // Switch to down count
        up_down = 0;
        
        // Count down for 10 cycles
        #(10*CLK_PERIOD);
        
        // Apply reset again
        reset = 1;
        #CLK_PERIOD reset = 0;
        
        // Count up again
        up_down = 1;
        #(5*CLK_PERIOD);
        
        // End simulation
        $finish;
    end

    // Monitor the counter value
    initial begin
        $monitor("Time = %0t, Reset = %b, Up/Down = %b, Count = %d", 
                 $time, reset, up_down, count);
    end

endmodule
