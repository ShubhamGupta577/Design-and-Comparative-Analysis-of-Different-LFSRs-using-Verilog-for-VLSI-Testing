module lfsr_4bit_and_gate (
    input clk,
    input rst,
    output reg [3:0] q,
    output out,e,f
);

reg [3:0] reg_q;
wire [3:0] q_wires;
//wire nand_out;

always @(posedge clk or posedge rst)
begin
    if (rst)
        reg_q <= 4'b0001;
    else begin
       reg_q <= {reg_q[0], reg_q[3] ^ reg_q[0],reg_q[2], reg_q[1]};
        q <= reg_q;
    end
end

assign q_wires = q;
wire e, f;
  nand(e, q_wires[3], q_wires[2]);
  nor (f, q_wires[1], q_wires[0]);
  and( out,e,f);

endmodule