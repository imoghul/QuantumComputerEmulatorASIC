module counter (input clock, input [7:0] in, input latch, input dec, input divide_by_two, output zero);
  reg [7:0] value;
  assign zero = value == 8'b0;
  always @(posedge clock) begin
    if (latch) value <= in;
    else if (!zero && dec) value <= value - 1'b1;
    else if (!zero && divide_by_two) value <= {1'b0, value[7:1]};
  end
endmodule
