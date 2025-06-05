module tb_dff_with_mux;

    reg clk, rst, sel, d0, d1;
    wire q;

    dff_with_mux uut (
        .clk(clk),
        .rst(rst),
        .sel(sel),
        .d0(d0),
        .d1(d1),
        .q(q)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dff_with_mux.vcd");
        $dumpvars(0, tb_dff_with_mux);

        rst = 1; sel = 0; d0 = 0; d1 = 0;
        #10;

        rst = 0; d0 = 1; d1 = 0; sel = 0;
        #10;

        sel = 1; d1 = 1;
        #10;

        d0 = 0; d1 = 0;
        #10;

        sel = 0; d0 = 1;
        #10;

        $finish;
    end

endmodule
