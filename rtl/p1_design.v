module seq_detector_0011(
    input clk,
    input reset,
    input data_in,
    output reg detected
);

reg [3:0] history;

always @(posedge clk) begin
    if (reset) begin
        history <= 4'b0000;
        detected <= 1'b0;
    end else begin
        detected <= (history == 4'b0011);
        history <= {history[2:0], data_in};
    end
end

endmodule
