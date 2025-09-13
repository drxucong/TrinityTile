// Simple Verilog testbench for tt_um_trinitytile
`timescale 1ns/1ps

module tb_trinitytile;
    reg  clk;
    reg  rst_n;
    reg  ena;
    wire [7:0] uo_out;

    // Unused I/Os
    reg  [7:0] ui_in   = 8'h00;
    reg  [7:0] uio_in  = 8'h00;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    // DUT instantiation
    tt_um_trinitytile dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock: 10ns period = 100 MHz (for sim)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // VCD waveform
        $dumpfile("tb_trinitytile.vcd");
        $dumpvars(0, tb_trinitytile);

        // Reset & enable
        ena   = 1'b0;
        rst_n = 1'b0;
        repeat(5) @(posedge clk);
        rst_n = 1'b1;
        ena   = 1'b1;

        // Run for some cycles
        repeat(300) @(posedge clk);

        // Finish
        $display("Simulation finished. Final counter = %0d", uo_out);
        $finish;
    end
endmodule
