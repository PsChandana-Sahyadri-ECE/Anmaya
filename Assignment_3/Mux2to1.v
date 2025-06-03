module mux_2to1 (
    input wire a,      // Input 0
    input wire b,      // Input 1
    input wire sel,    // Select line
    output wire out    // Output
);
    assign out = sel ? b : a;
endmodule
