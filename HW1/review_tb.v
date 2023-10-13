module review_tb;

  reg clk;
  initial begin
    clk = 0;
  end
  always #5 clk = ~clk;

  wire [3:0] count;
  wire overflow;

  reg [3:0] Number;
  reg start;

  review dut (
      .clock(clk),
      .NumberIn(Number),
      .start(start),
      .overflow(overflow),
      .count(count)
  );


  initial begin
    Number = 0;
    start  = 0;
    #4 start = 1;
    #5 start = 0;
    Number = 5;
    #204 start = 1;
    #5 start = 0;
  end


  initial begin
    #400 $finish;
  end


endmodule
