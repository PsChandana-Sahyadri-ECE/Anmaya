module dff_with_mux (
    input wire clk,
    input wire rst,
    input wire sel,
    input wire d0,
    input wire d1,
    output reg q
);

    wire d;
    assign d = sel ? d1 : d0;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule
