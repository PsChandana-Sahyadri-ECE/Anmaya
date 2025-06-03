`timescale 1ns/1ps

module up_down_counter_tb;

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

    // Clock generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // VCD file dump setup
    initial begin
        $dumpfile("up_down_counter_waveform.vcd");
        $dumpvars(0, up_down_counter_tb);
        $display("VCD waveform file: up_down_counter_waveform.vcd");
    end

    // Stimulus
    initial begin
        clk = 0;
        reset = 1;
        up_down = 1;

        #20 reset = 0;      // Deassert reset
        #100 up_down = 0;   // Count down
        #100 $finish;       // End simulation
    end

endmodule
