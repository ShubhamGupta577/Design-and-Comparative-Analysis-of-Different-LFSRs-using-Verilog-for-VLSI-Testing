module testbench;

reg clk;
reg rst;
wire [3:0] q;
wire out;

lfsr_4bit_and_gate dut (.clk(clk), .rst(rst), .q(q), .out(out));

initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
end

always #5 clk = ~clk;

initial begin
  $monitor("q = %b, out = %b", q, out);
end

endmodule