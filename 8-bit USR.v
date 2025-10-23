module univ_shift_reg(
    input wire clk, reset,
    input wire [1:0] ctrl,
    input wire [7:0] d,
    output wire [7:0] q
);

reg [7:0] r_reg, r_next;

always @(posedge clk, posedge reset)
if (reset)
    r_reg <= 0;
else
    r_reg <= r_next;

// next-state logic
always @*
case(ctrl)
    2'b00: r_next = r_reg;      // no op
    2'b01: r_next = {r_reg[6:0], d[0]}; // shift left
    2'b10: r_next = {d[7], r_reg[7:1]}; // shift right
    default: r_next = d;        // load
endcase

// output logic
assign q = r_reg;

endmodule


module tb;
reg clk, reset;
reg [1:0] ctrl;
reg [7:0] d;
wire [7:0] q;

univ_shift_reg uut(clk, reset, ctrl, d, q);

always #5 clk = ~clk;

initial
begin
clk=0; reset=0;

#10;
d=8'b11010011;
ctrl = 2'b11; // load

#10;
ctrl = 2'b01;

#10;
ctrl = 2'b11;

end
endmodule


