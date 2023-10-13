/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP3
// Date      : Tue Sep 12 08:34:29 2023
/////////////////////////////////////////////////////////////


module counter_divider ( clock, in, latch, dec, divide_by_two, zero );
  input [7:0] in;
  input clock, latch, dec, divide_by_two;
  output zero;
  wire   n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72;
  wire   [7:0] value;

  DFF_X1 value_reg_0_ ( .D(n35), .CK(clock), .Q(value[0]), .QN(n69) );
  DFF_X1 value_reg_7_ ( .D(n34), .CK(clock), .Q(value[7]) );
  DFF_X1 value_reg_6_ ( .D(n33), .CK(clock), .Q(value[6]), .QN(n72) );
  DFF_X1 value_reg_5_ ( .D(n32), .CK(clock), .Q(value[5]) );
  DFF_X1 value_reg_4_ ( .D(n31), .CK(clock), .Q(value[4]), .QN(n70) );
  DFF_X1 value_reg_3_ ( .D(n30), .CK(clock), .Q(value[3]) );
  DFF_X1 value_reg_2_ ( .D(n29), .CK(clock), .Q(value[2]), .QN(n71) );
  DFF_X1 value_reg_1_ ( .D(n28), .CK(clock), .Q(value[1]) );
  INV_X1 U39 ( .A(n60), .ZN(n56) );
  INV_X1 U40 ( .A(n41), .ZN(n42) );
  INV_X1 U41 ( .A(n68), .ZN(n62) );
  INV_X1 U42 ( .A(n40), .ZN(n34) );
  NOR3_X2 U43 ( .A1(value[7]), .A2(value[6]), .A3(n38), .ZN(zero) );
  INV_X1 U44 ( .A(n44), .ZN(n38) );
  INV_X1 U45 ( .A(latch), .ZN(n36) );
  INV_X1 U46 ( .A(dec), .ZN(n37) );
  INV_X1 U47 ( .A(n50), .ZN(n52) );
  INV_X1 U48 ( .A(n51), .ZN(n55) );
  NOR4_X1 U49 ( .A1(value[1]), .A2(value[0]), .A3(value[3]), .A4(value[2]), 
        .ZN(n50) );
  NOR3_X1 U50 ( .A1(n52), .A2(value[5]), .A3(value[4]), .ZN(n44) );
  NOR3_X1 U51 ( .A1(n37), .A2(latch), .A3(zero), .ZN(n60) );
  OAI21_X1 U52 ( .B1(n37), .B2(zero), .A(n36), .ZN(n41) );
  NOR2_X1 U53 ( .A1(n41), .A2(divide_by_two), .ZN(n51) );
  AOI21_X1 U54 ( .B1(n60), .B2(n38), .A(n51), .ZN(n46) );
  OAI21_X1 U55 ( .B1(n72), .B2(n56), .A(n46), .ZN(n39) );
  AOI22_X1 U56 ( .A1(latch), .A2(in[7]), .B1(value[7]), .B2(n39), .ZN(n40) );
  NAND2_X1 U57 ( .A1(n42), .A2(divide_by_two), .ZN(n68) );
  AOI22_X1 U58 ( .A1(value[1]), .A2(n62), .B1(latch), .B2(in[0]), .ZN(n43) );
  OAI221_X1 U59 ( .B1(value[0]), .B2(n56), .C1(n69), .C2(n55), .A(n43), .ZN(
        n35) );
  NAND2_X1 U60 ( .A1(n44), .A2(n60), .ZN(n48) );
  AOI22_X1 U61 ( .A1(latch), .A2(in[6]), .B1(value[7]), .B2(n62), .ZN(n45) );
  OAI221_X1 U62 ( .B1(value[6]), .B2(n48), .C1(n72), .C2(n46), .A(n45), .ZN(
        n33) );
  OAI221_X1 U63 ( .B1(n56), .B2(n50), .C1(n56), .C2(n70), .A(n55), .ZN(n47) );
  AOI22_X1 U64 ( .A1(latch), .A2(in[5]), .B1(value[5]), .B2(n47), .ZN(n49) );
  OAI211_X1 U65 ( .C1(n68), .C2(n72), .A(n49), .B(n48), .ZN(n32) );
  NAND2_X1 U66 ( .A1(n50), .A2(n60), .ZN(n58) );
  AOI21_X1 U67 ( .B1(n60), .B2(n52), .A(n51), .ZN(n54) );
  AOI22_X1 U68 ( .A1(latch), .A2(in[4]), .B1(value[5]), .B2(n62), .ZN(n53) );
  OAI221_X1 U69 ( .B1(value[4]), .B2(n58), .C1(n70), .C2(n54), .A(n53), .ZN(
        n31) );
  OAI21_X1 U70 ( .B1(n56), .B2(n69), .A(n55), .ZN(n65) );
  AOI21_X1 U71 ( .B1(value[1]), .B2(n60), .A(n65), .ZN(n64) );
  OAI21_X1 U72 ( .B1(n71), .B2(n56), .A(n64), .ZN(n57) );
  AOI22_X1 U73 ( .A1(value[3]), .A2(n57), .B1(latch), .B2(in[3]), .ZN(n59) );
  OAI211_X1 U74 ( .C1(n70), .C2(n68), .A(n59), .B(n58), .ZN(n30) );
  NOR2_X1 U75 ( .A1(value[1]), .A2(value[0]), .ZN(n61) );
  NAND2_X1 U76 ( .A1(n61), .A2(n60), .ZN(n66) );
  AOI22_X1 U77 ( .A1(value[3]), .A2(n62), .B1(latch), .B2(in[2]), .ZN(n63) );
  OAI221_X1 U78 ( .B1(value[2]), .B2(n66), .C1(n71), .C2(n64), .A(n63), .ZN(
        n29) );
  AOI22_X1 U79 ( .A1(value[1]), .A2(n65), .B1(latch), .B2(in[1]), .ZN(n67) );
  OAI211_X1 U80 ( .C1(n68), .C2(n71), .A(n67), .B(n66), .ZN(n28) );
endmodule

