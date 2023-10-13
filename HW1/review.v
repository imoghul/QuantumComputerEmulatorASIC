module review (

    input wire clock,
    input wire [3:0] NumberIn,
    input wire start,
    output wire overflow,
    output wire [3:0] count

);



  wire is5;
  assign is5 = !(NumberIn[0] ^ 1) && !(NumberIn[1] ^ 0) && !(NumberIn[2] ^ 1) && !(NumberIn[3] ^ 0);

  wire [3:0] accumVal, nextCount;
  wire overflowSel, overflowVal, nextOverflow;
  assign {overflowSel, accumVal} = is5 ? (1 + count) : (count);
  assign nextCount = start ? 0 : accumVal;
  reg [3:0] countVal;
  reg overflowReg;
  assign count = countVal;
  assign overflowVal = overflowSel ? 1 : overflow;
  assign nextOverflow = start ? 0 : overflowVal;
  assign overflow = overflowReg;

  always @(posedge clock) begin
    countVal <= nextCount;
    overflowReg = nextOverflow;
  end





endmodule
