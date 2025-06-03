module up_down_counter (
    input wire clk,          
    input wire reset,        
    input wire up_down,      
    output reg [N-1:0] count 
);

    // Parameter for counter width (default 4 bits)
    parameter N = 4;

    always @(posedge clk) begin
        if (reset) begin
            
            count <= {N{1'b0}};
        end else begin
            
            if (up_down) begin
                count <= count + 1'b1;
            end else begin
                count <= count - 1'b1;
            end
        end
    end

endmodule
