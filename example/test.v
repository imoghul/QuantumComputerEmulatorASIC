module test_fixture;
  reg clock100 = 0;
  reg latch = 0;
  reg dec = 0;
  reg [3:0] in = 4'b0101;
  wire zero;

  initial  //following block executed only once
    begin
      //$dumpfile("count.vcd"); // waveforms in this file.. 
      //$dumpvars; // saves all waveforms
      #16 latch = 1;  // wait 16 ns
      #10 latch = 0;  // wait 10 ns
      #10 dec = 1;
      #100 $finish;  //finished with simulation
    end
  always #5 clock100 = ~clock100;  // 10ns clock

  // instantiate modules -- call this counter u1
  counter u1 (
      .clock(clock100),
      .in(in),
      .latch(latch),
      .dec(dec),
      .zero(zero)
  );
endmodule  /*test_fixture*/

