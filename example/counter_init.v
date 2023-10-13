/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : S-2021.06-SP3
// Date      : Mon Sep 11 12:31:48 2023
/////////////////////////////////////////////////////////////


module counter ( clock, in, latch, dec, zero );
  input [3:0] in;
  input clock, latch, dec;
  output zero;
  wire   n18, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n32, n33,
         n34, n35, n36;
  wire   [3:0] value;

  DFF_X1 \value_reg[0]  ( .D(n20), .CK(clock), .Q(value[0]), .QN(n32) );
  DFF_X1 \value_reg[2]  ( .D(n18), .CK(clock), .Q(value[2]), .QN(n33) );
  SDFF_X1 \value_reg[1]  ( .D(1'b1), .SI(n35), .SE(n36), .CK(clock), .Q(
        value[1]) );
  DFF_X1 \value_reg[3]  ( .D(n34), .CK(clock), .QN(value[3]) );
  NOR4_X2 U24 ( .A1(value[3]), .A2(value[0]), .A3(value[1]), .A4(value[2]), 
        .ZN(zero) );
  INV_X1 U26 ( .A(latch), .ZN(n21) );
  NAND2_X1 U27 ( .A1(dec), .A2(n21), .ZN(n25) );
  NOR2_X1 U28 ( .A1(zero), .A2(n25), .ZN(n24) );
  INV_X1 U29 ( .A(n24), .ZN(n27) );
  NAND2_X1 U30 ( .A1(n27), .A2(value[0]), .ZN(n23) );
  NAND2_X1 U31 ( .A1(latch), .A2(in[0]), .ZN(n22) );
  OAI221_X1 U32 ( .B1(n23), .B2(latch), .C1(n27), .C2(value[0]), .A(n22), .ZN(
        n20) );
  AOI21_X1 U33 ( .B1(dec), .B2(n32), .A(latch), .ZN(n30) );
  AOI21_X1 U34 ( .B1(value[1]), .B2(n24), .A(n30), .ZN(n29) );
  OAI21_X1 U35 ( .B1(n33), .B2(n25), .A(n29), .ZN(n26) );
  AOI22_X1 U36 ( .A1(value[3]), .A2(n26), .B1(latch), .B2(in[3]), .ZN(n34) );
  NOR3_X1 U37 ( .A1(value[0]), .A2(value[1]), .A3(n27), .ZN(n35) );
  AOI22_X1 U38 ( .A1(latch), .A2(in[2]), .B1(n35), .B2(n33), .ZN(n28) );
  OAI21_X1 U39 ( .B1(n29), .B2(n33), .A(n28), .ZN(n18) );
  AOI22_X1 U40 ( .A1(latch), .A2(in[1]), .B1(n30), .B2(value[1]), .ZN(n36) );
endmodule

