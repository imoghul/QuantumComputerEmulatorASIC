`include "counter.v"

module divide_by_two_tb;

  reg clock100;
  reg latch, dec, divide_by_two;
  reg [7:0] in;
  wire zero;
  //following block executed only once
  initial begin
    // below commands save waves as vcd files. These are
    // not needed if Modelsim used as the simulator. This
    // useful if cadence tools are used for simulation.
    $dumpfile("count.vcd");  // waveforms in this file
    $dumpvars;  // saves all waveforms
    clock100 = 0;
    latch = 0;
    dec = 0;
    divide_by_two = 0;
    in = 8'b00001000;
    #16 latch = 1;  // wait 16 ns
    #10 latch = 0;  // wait 10 ns
    #10 dec = 1;
    #20 dec = 0;
    in = 8'b00100000;
    divide_by_two = 1;

    #40 latch = 1;
    #10 latch = 0;

    #100 $finish;  //finished with simulation
  end
  always #5 clock100 = ~clock100;  // 10ns clock
  // instantiate modules -- call this counter u1
  counter dut (
      .clock(clock100),
      .in(in),
      .latch(latch),
      .dec(dec),
      .divide_by_two(divide_by_two),
      .zero(zero)
  );

endmodule
