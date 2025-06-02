module up_down_counter (
    input wire clk,          // Clock input
    input wire reset,        // Synchronous reset (active high)
    input wire up_down,      // Direction control: 1=up, 0=down
    output reg [N-1:0] count // Counter output (N-bit width)
);

    // Parameter for counter width (default 4 bits)
    parameter N = 4;

    always @(posedge clk) begin
        if (reset) begin
            // Reset counter to 0 when reset is high
            count <= {N{1'b0}};
        end else begin
            // Count up or down based on up_down control
            if (up_down) begin
                count <= count + 1'b1;
            end else begin
                count <= count - 1'b1;
            end
        end
    end

endmodule
