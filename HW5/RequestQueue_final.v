/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP3
// Date      : Fri Oct  6 15:48:38 2023
/////////////////////////////////////////////////////////////


module RequestQueue ( clock, reset, R0, R1, G0, G1 );
  input clock, reset, R0, R1;
  output G0, G1;
  wire   currState, N7, N8, N9, n4, n5, n6;

  DFF_X1 currState_reg ( .D(N7), .CK(clock), .Q(currState) );
  DFF_X2 G0_reg ( .D(N8), .CK(clock), .Q(G0) );
  DFF_X2 G1_reg ( .D(N9), .CK(clock), .Q(G1) );
  AND2_X1 U9 ( .A1(R1), .A2(N8), .ZN(N7) );
  INV_X1 U10 ( .A(R0), .ZN(n5) );
  AOI21_X1 U11 ( .B1(R1), .B2(n5), .A(currState), .ZN(n4) );
  INV_X1 U12 ( .A(reset), .ZN(n6) );
  NOR2_X1 U13 ( .A1(n4), .A2(n6), .ZN(N9) );
  NOR3_X1 U14 ( .A1(currState), .A2(n6), .A3(n5), .ZN(N8) );
endmodule

