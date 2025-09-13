// Minimal top-level module for TinyTapeout
// Project: TrinityTile
// Function: Simple 8-bit counter output to verify build flow

module tt_um_trinitytile (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path
    input  wire       ena,      // always 1 when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n (active low)
);

    // Simple 8-bit counter
    reg [7:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            counter <= 8'd0;
        else if (ena)
            counter <= counter + 1'b1;
    end

    // Drive outputs
    assign uo_out  = counter;  // Show counter on output pins
    assign uio_out = 8'h00;    // Not used
    assign uio_oe  = 8'h00;    // Set as inputs

endmodule
