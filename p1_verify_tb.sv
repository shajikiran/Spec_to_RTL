module p1_verify_tb;
    logic clk;
    logic reset;
    logic data_in;
    logic detected;
    reg [0:15] sample_in;
    reg [0:15] observed_out;
    integer i;

    seq_detector_0011 dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .detected(detected)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        sample_in = "0001100110110010";
        observed_out = 16'b0;
        data_in = 1'b0;
        reset = 1'b1;

        @(posedge clk);
        #1 reset = 1'b0;

        for (i = 0; i < 16; i = i + 1) begin
            data_in = (sample_in[i] == "1");
            @(posedge clk);
            #1 observed_out[i] = detected;
        end

        $display("observed=%b", observed_out);
        $finish;
    end
endmodule
