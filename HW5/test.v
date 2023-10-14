module testfixture;
  reg clock, reset, R0, R1;
  wire G0, G1;
  initial begin
    reset = 1;
    R0 = 0;
    R1 = 0;
    clock = 0;
    #10 reset = 0;
    #10 reset = 1;
    #10 R0 = 1;
    R1 = 1;
    #60 R1 = 0;
    #10 R1 = 1;
    #20 R1 = 0;
    #10 R0 = 1;
    #20 R1 = 1;
    R0 = 0;
    #10
    R0 = 1;
    R1 = 0;
    #60 $finish;
  end
  always #5 clock = ~clock;
  RequestQueue U0 (
      .clock(clock),
      .reset(reset),
      .R0(R0),
      .R1(R1),
      .G0(G0),
      .G1(G1)
  );
endmodule









// #10
//       if (G1 || !G0) $display("Error\n");
//       else $display("Test 1 OK\n");


//     R1 = 0;


//     #10
//       if (G0 || !G1) $display("Error\n");
//       else $display("Test 2 OK\n");


//     R0 = 1;


//     #10
//       if (G1 || !G0) $display("Error\n");
//       else $display("Test 3 OK\n");


//     #10
//       if (G1 || !G0) $display("Error\n");
//       else $display("Test 4 OK\n");


//     R1 = 1;
//     R0 = 0;


//     #10
//       if (G0 || !G1) $display("Error\n");
//       else $display("Test 5 OK\n");


//     R0 = 1;
//     R1 = 0;


//     #10
//       if (G1 || !G0) $display("Error\n");
//       else $display("Test 6 OK\n");
