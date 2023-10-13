/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : S-2021.06-SP3
// Date      : Thu Sep 14 17:52:03 2023
/////////////////////////////////////////////////////////////


module counter ( clock, in, latch, dec, divide_by_two, zero );
  input [7:0] in;
  input clock, latch, dec, divide_by_two;
  output zero;
  wire   n27, n28, n30, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124;
  wire   [7:0] value;

  DFF_X1 \value_reg[0]  ( .D(n33), .CK(clock), .Q(value[0]), .QN(n114) );
  DFF_X1 \value_reg[1]  ( .D(n121), .CK(clock), .Q(value[1]), .QN(n116) );
  DFF_X2 \value_reg[6]  ( .D(n123), .CK(clock), .Q(value[6]), .QN(n117) );
  DFF_X2 \value_reg[4]  ( .D(n122), .CK(clock), .Q(value[4]), .QN(n113) );
  DFF_X2 \value_reg[3]  ( .D(n28), .CK(clock), .Q(value[3]), .QN(n119) );
  DFF_X2 \value_reg[7]  ( .D(n124), .CK(clock), .Q(value[7]), .QN(n118) );
  DFF_X2 \value_reg[2]  ( .D(n27), .CK(clock), .Q(value[2]), .QN(n120) );
  DFF_X1 \value_reg[5]  ( .D(n30), .CK(clock), .Q(value[5]), .QN(n115) );
  NAND3_X1 U37 ( .A1(n70), .A2(n114), .A3(n71), .ZN(n104) );
  NAND2_X1 U38 ( .A1(n63), .A2(n82), .ZN(n46) );
  NAND4_X2 U39 ( .A1(n112), .A2(n111), .A3(n110), .A4(n109), .ZN(n123) );
  INV_X2 U40 ( .A(n66), .ZN(n70) );
  NAND2_X2 U41 ( .A1(n58), .A2(n97), .ZN(n27) );
  INV_X1 U42 ( .A(n81), .ZN(n101) );
  AND3_X1 U43 ( .A1(n106), .A2(n114), .A3(n116), .ZN(n54) );
  NAND2_X1 U44 ( .A1(n70), .A2(n114), .ZN(n81) );
  INV_X1 U45 ( .A(n88), .ZN(n91) );
  INV_X1 U46 ( .A(n113), .ZN(n49) );
  INV_X1 U47 ( .A(value[4]), .ZN(n51) );
  AND2_X2 U48 ( .A1(n117), .A2(n118), .ZN(n93) );
  AND2_X2 U49 ( .A1(n113), .A2(n115), .ZN(n71) );
  NOR2_X1 U50 ( .A1(n86), .A2(n78), .ZN(n79) );
  AND2_X1 U51 ( .A1(in[1]), .A2(latch), .ZN(n61) );
  AND2_X1 U52 ( .A1(latch), .A2(in[4]), .ZN(n102) );
  OAI21_X2 U53 ( .B1(n41), .B2(n39), .A(n38), .ZN(n121) );
  INV_X2 U54 ( .A(n42), .ZN(n41) );
  INV_X2 U55 ( .A(n92), .ZN(n124) );
  OAI21_X2 U56 ( .B1(n50), .B2(n48), .A(n47), .ZN(n122) );
  OAI21_X2 U57 ( .B1(value[7]), .B2(n91), .A(n90), .ZN(n92) );
  AOI21_X2 U58 ( .B1(n63), .B2(n101), .A(n49), .ZN(n48) );
  INV_X2 U59 ( .A(n104), .ZN(n108) );
  AOI21_X2 U60 ( .B1(n52), .B2(value[2]), .A(n61), .ZN(n38) );
  NAND2_X1 U61 ( .A1(n98), .A2(value[0]), .ZN(n34) );
  NAND2_X1 U62 ( .A1(n52), .A2(value[1]), .ZN(n35) );
  INV_X2 U63 ( .A(n85), .ZN(n98) );
  AND2_X2 U64 ( .A1(n119), .A2(n120), .ZN(n37) );
  INV_X1 U65 ( .A(value[1]), .ZN(n40) );
  AND2_X1 U66 ( .A1(value[4]), .A2(value[5]), .ZN(n72) );
  CLKBUF_X3 U67 ( .A(latch), .Z(n84) );
  NAND4_X2 U68 ( .A1(n100), .A2(n35), .A3(n34), .A4(n99), .ZN(n33) );
  NAND2_X2 U69 ( .A1(n69), .A2(n65), .ZN(n85) );
  INV_X4 U70 ( .A(n36), .ZN(n52) );
  NAND2_X2 U71 ( .A1(n69), .A2(divide_by_two), .ZN(n36) );
  NOR2_X2 U72 ( .A1(n62), .A2(n40), .ZN(n39) );
  NAND2_X2 U73 ( .A1(n100), .A2(n116), .ZN(n42) );
  NAND2_X2 U74 ( .A1(n63), .A2(n114), .ZN(n100) );
  NAND4_X2 U75 ( .A1(n46), .A2(n44), .A3(n43), .A4(n83), .ZN(n28) );
  NOR2_X2 U76 ( .A1(n80), .A2(n79), .ZN(n43) );
  NAND2_X2 U77 ( .A1(n62), .A2(value[3]), .ZN(n44) );
  NAND2_X2 U78 ( .A1(n45), .A2(n85), .ZN(n62) );
  NAND2_X1 U79 ( .A1(n107), .A2(value[0]), .ZN(n45) );
  AOI21_X2 U80 ( .B1(n52), .B2(value[5]), .A(n102), .ZN(n47) );
  NOR2_X2 U81 ( .A1(n68), .A2(n51), .ZN(n50) );
  NAND2_X2 U82 ( .A1(n67), .A2(n85), .ZN(n68) );
  NOR2_X1 U83 ( .A1(latch), .A2(dec), .ZN(n69) );
  INV_X1 U84 ( .A(in[3]), .ZN(n78) );
  NAND2_X1 U85 ( .A1(n107), .A2(n56), .ZN(n55) );
  NAND2_X1 U86 ( .A1(n57), .A2(n114), .ZN(n56) );
  NOR2_X1 U87 ( .A1(value[1]), .A2(n120), .ZN(n57) );
  NAND2_X1 U88 ( .A1(n107), .A2(n54), .ZN(n94) );
  AND2_X1 U89 ( .A1(dec), .A2(value[6]), .ZN(n87) );
  NAND2_X1 U90 ( .A1(n107), .A2(n81), .ZN(n67) );
  NOR2_X1 U91 ( .A1(n60), .A2(n59), .ZN(n80) );
  NAND2_X1 U92 ( .A1(value[3]), .A2(value[1]), .ZN(n59) );
  NAND2_X1 U93 ( .A1(n96), .A2(n95), .ZN(n58) );
  NAND2_X1 U94 ( .A1(value[6]), .A2(n98), .ZN(n111) );
  INV_X1 U95 ( .A(latch), .ZN(n86) );
  AND2_X4 U96 ( .A1(n108), .A2(n93), .ZN(zero) );
  NAND2_X1 U97 ( .A1(n55), .A2(n85), .ZN(n96) );
  NAND2_X2 U98 ( .A1(n37), .A2(n116), .ZN(n66) );
  NAND4_X2 U99 ( .A1(n89), .A2(n85), .A3(n103), .A4(n88), .ZN(n90) );
  NAND2_X2 U100 ( .A1(n107), .A2(n106), .ZN(n64) );
  NAND2_X2 U101 ( .A1(n104), .A2(n107), .ZN(n89) );
  INV_X4 U102 ( .A(n60), .ZN(n107) );
  NAND2_X2 U103 ( .A1(n86), .A2(dec), .ZN(n60) );
  NAND2_X2 U104 ( .A1(n73), .A2(n63), .ZN(n75) );
  INV_X4 U105 ( .A(n64), .ZN(n63) );
  INV_X1 U106 ( .A(divide_by_two), .ZN(n65) );
  NAND2_X1 U107 ( .A1(n68), .A2(value[5]), .ZN(n77) );
  NAND2_X1 U108 ( .A1(n52), .A2(value[6]), .ZN(n76) );
  NAND3_X1 U109 ( .A1(n70), .A2(n93), .A3(n71), .ZN(n106) );
  OR2_X1 U110 ( .A1(n108), .A2(n72), .ZN(n73) );
  NAND2_X1 U111 ( .A1(n84), .A2(in[5]), .ZN(n74) );
  NAND4_X1 U112 ( .A1(n77), .A2(n76), .A3(n75), .A4(n74), .ZN(n30) );
  OAI21_X1 U113 ( .B1(n120), .B2(n119), .A(n81), .ZN(n82) );
  NAND2_X1 U114 ( .A1(n52), .A2(value[4]), .ZN(n83) );
  NAND2_X1 U115 ( .A1(n84), .A2(in[7]), .ZN(n88) );
  NAND2_X1 U116 ( .A1(n87), .A2(n86), .ZN(n103) );
  NAND2_X1 U117 ( .A1(n94), .A2(n120), .ZN(n95) );
  AOI22_X1 U118 ( .A1(n52), .A2(value[3]), .B1(n84), .B2(in[2]), .ZN(n97) );
  NAND2_X1 U119 ( .A1(n84), .A2(in[0]), .ZN(n99) );
  AOI22_X1 U120 ( .A1(n52), .A2(value[7]), .B1(n84), .B2(in[6]), .ZN(n112) );
  INV_X1 U121 ( .A(n103), .ZN(n105) );
  NAND2_X1 U122 ( .A1(n105), .A2(n104), .ZN(n110) );
  NAND4_X1 U123 ( .A1(n108), .A2(n107), .A3(n106), .A4(n117), .ZN(n109) );
endmodule

