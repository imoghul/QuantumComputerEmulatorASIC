/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP4
// Date      : Sun Nov  5 21:16:17 2023
/////////////////////////////////////////////////////////////


module Addr_Counter ( reset_n, clk, clr, rdscratch_wrinp, max, bitmask, 
        q_gates_offset, q_gates_addr, q_input_addr, q_output_addr, 
        q_wr_input_addr, done, q_input_wr_en, q_scratch_wr_en, q_output_wr_en, 
        wraparound );
  input [15:0] max;
  input [4:0] bitmask;
  input [127:0] q_gates_offset;
  output [31:0] q_gates_addr;
  output [31:0] q_input_addr;
  output [31:0] q_output_addr;
  output [31:0] q_wr_input_addr;
  input reset_n, clk, clr, rdscratch_wrinp;
  output done, q_input_wr_en, q_scratch_wr_en, q_output_wr_en, wraparound;
  wire   N20, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102,
         N103, N104, N105, N106, N107, N108, N109, N110, N111, N112, N113,
         N114, N115, N116, N117, N118, N119, N120, N121, N122, N130, N131,
         N132, N133, N134, N135, output_counter_control,
         output_counter_control1, output_counter_control2,
         output_counter_control3, N136, N137, done1, done2, done3, N248, N249,
         N250, N251, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         \intadd_0/CI , \intadd_0/SUM[13] , \intadd_0/SUM[12] ,
         \intadd_0/SUM[11] , \intadd_0/SUM[10] , \intadd_0/SUM[9] ,
         \intadd_0/SUM[8] , \intadd_0/SUM[7] , \intadd_0/SUM[6] ,
         \intadd_0/SUM[5] , \intadd_0/SUM[4] , \intadd_0/SUM[3] ,
         \intadd_0/SUM[2] , \intadd_0/SUM[1] , \intadd_0/SUM[0] ,
         \intadd_0/n14 , \intadd_0/n13 , \intadd_0/n12 , \intadd_0/n11 ,
         \intadd_0/n10 , \intadd_0/n9 , \intadd_0/n8 , \intadd_0/n7 ,
         \intadd_0/n6 , \intadd_0/n5 , \intadd_0/n4 , \intadd_0/n3 ,
         \intadd_0/n2 , \intadd_0/n1 , n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634;
  wire   [15:0] Qcounter;

  DFF_X1 \Qcounter_reg[15]  ( .D(n209), .CK(clk), .Q(Qcounter[15]), .QN(n598)
         );
  DFF_X1 \Qcounter_reg[14]  ( .D(n210), .CK(clk), .Q(Qcounter[14]), .QN(n586)
         );
  DFF_X1 \Qcounter_reg[13]  ( .D(n211), .CK(clk), .Q(Qcounter[13]) );
  DFF_X1 \Qcounter_reg[12]  ( .D(n212), .CK(clk), .Q(Qcounter[12]), .QN(n628)
         );
  DFF_X1 \Qcounter_reg[11]  ( .D(n213), .CK(clk), .Q(Qcounter[11]), .QN(n606)
         );
  DFF_X1 \Qcounter_reg[10]  ( .D(n214), .CK(clk), .Q(Qcounter[10]), .QN(n631)
         );
  DFF_X1 \Qcounter_reg[9]  ( .D(n215), .CK(clk), .Q(Qcounter[9]), .QN(n605) );
  DFF_X1 \Qcounter_reg[8]  ( .D(n216), .CK(clk), .Q(Qcounter[8]), .QN(n629) );
  DFF_X1 \Qcounter_reg[7]  ( .D(n217), .CK(clk), .Q(Qcounter[7]), .QN(n604) );
  DFF_X1 \Qcounter_reg[6]  ( .D(n218), .CK(clk), .Q(Qcounter[6]), .QN(n630) );
  DFF_X1 \Qcounter_reg[5]  ( .D(n219), .CK(clk), .Q(Qcounter[5]), .QN(n600) );
  DFF_X1 \Qcounter_reg[4]  ( .D(n220), .CK(clk), .Q(Qcounter[4]), .QN(n627) );
  DFF_X1 \Qcounter_reg[3]  ( .D(n221), .CK(clk), .Q(Qcounter[3]), .QN(n602) );
  DFF_X1 \Qcounter_reg[2]  ( .D(n222), .CK(clk), .Q(Qcounter[2]), .QN(n632) );
  DFF_X1 \Qcounter_reg[1]  ( .D(n223), .CK(clk), .Q(Qcounter[1]), .QN(n580) );
  DFF_X1 \Qcounter_reg[0]  ( .D(n224), .CK(clk), .Q(Qcounter[0]), .QN(n633) );
  DFF_X1 output_counter_control1_reg ( .D(N137), .CK(clk), .Q(
        output_counter_control1) );
  DFF_X1 output_counter_control2_reg ( .D(n207), .CK(clk), .Q(
        output_counter_control2), .QN(n634) );
  DFF_X1 output_counter_control3_reg ( .D(n208), .CK(clk), .Q(
        output_counter_control3), .QN(n593) );
  DFF_X1 output_counter_control_reg ( .D(N136), .CK(clk), .Q(
        output_counter_control) );
  DFF_X1 done1_reg ( .D(N249), .CK(clk), .Q(done1) );
  DFF_X1 done2_reg ( .D(N250), .CK(clk), .Q(done2) );
  DFF_X1 done3_reg ( .D(N251), .CK(clk), .Q(done3) );
  FA_X1 \intadd_0/U15  ( .A(q_gates_offset[2]), .B(Qcounter[2]), .CI(
        \intadd_0/CI ), .CO(\intadd_0/n14 ), .S(\intadd_0/SUM[0] ) );
  FA_X1 \intadd_0/U14  ( .A(q_gates_offset[3]), .B(Qcounter[3]), .CI(
        \intadd_0/n14 ), .CO(\intadd_0/n13 ), .S(\intadd_0/SUM[1] ) );
  FA_X1 \intadd_0/U13  ( .A(q_gates_offset[4]), .B(Qcounter[4]), .CI(
        \intadd_0/n13 ), .CO(\intadd_0/n12 ), .S(\intadd_0/SUM[2] ) );
  FA_X1 \intadd_0/U12  ( .A(q_gates_offset[5]), .B(Qcounter[5]), .CI(
        \intadd_0/n12 ), .CO(\intadd_0/n11 ), .S(\intadd_0/SUM[3] ) );
  FA_X1 \intadd_0/U11  ( .A(q_gates_offset[6]), .B(Qcounter[6]), .CI(
        \intadd_0/n11 ), .CO(\intadd_0/n10 ), .S(\intadd_0/SUM[4] ) );
  FA_X1 \intadd_0/U10  ( .A(q_gates_offset[7]), .B(Qcounter[7]), .CI(
        \intadd_0/n10 ), .CO(\intadd_0/n9 ), .S(\intadd_0/SUM[5] ) );
  FA_X1 \intadd_0/U9  ( .A(q_gates_offset[8]), .B(Qcounter[8]), .CI(
        \intadd_0/n9 ), .CO(\intadd_0/n8 ), .S(\intadd_0/SUM[6] ) );
  FA_X1 \intadd_0/U8  ( .A(q_gates_offset[9]), .B(Qcounter[9]), .CI(
        \intadd_0/n8 ), .CO(\intadd_0/n7 ), .S(\intadd_0/SUM[7] ) );
  FA_X1 \intadd_0/U7  ( .A(q_gates_offset[10]), .B(Qcounter[10]), .CI(
        \intadd_0/n7 ), .CO(\intadd_0/n6 ), .S(\intadd_0/SUM[8] ) );
  FA_X1 \intadd_0/U6  ( .A(q_gates_offset[11]), .B(Qcounter[11]), .CI(
        \intadd_0/n6 ), .CO(\intadd_0/n5 ), .S(\intadd_0/SUM[9] ) );
  FA_X1 \intadd_0/U5  ( .A(q_gates_offset[12]), .B(Qcounter[12]), .CI(
        \intadd_0/n5 ), .CO(\intadd_0/n4 ), .S(\intadd_0/SUM[10] ) );
  FA_X1 \intadd_0/U4  ( .A(q_gates_offset[13]), .B(Qcounter[13]), .CI(
        \intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(\intadd_0/SUM[11] ) );
  FA_X1 \intadd_0/U3  ( .A(q_gates_offset[14]), .B(Qcounter[14]), .CI(
        \intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(\intadd_0/SUM[12] ) );
  FA_X1 \intadd_0/U2  ( .A(q_gates_offset[15]), .B(Qcounter[15]), .CI(
        \intadd_0/n2 ), .CO(\intadd_0/n1 ), .S(\intadd_0/SUM[13] ) );
  DFF_X2 \q_wr_input_addr_reg[3]  ( .D(n203), .CK(clk), .Q(q_wr_input_addr[3])
         );
  DFF_X2 \q_wr_input_addr_reg[7]  ( .D(n199), .CK(clk), .Q(q_wr_input_addr[7])
         );
  DFF_X2 \q_wr_input_addr_reg[11]  ( .D(n195), .CK(clk), .Q(
        q_wr_input_addr[11]) );
  DFF_X2 \q_wr_input_addr_reg[15]  ( .D(n191), .CK(clk), .Q(
        q_wr_input_addr[15]) );
  DFF_X2 \q_wr_input_addr_reg[19]  ( .D(n187), .CK(clk), .Q(
        q_wr_input_addr[19]) );
  DFF_X2 \q_wr_input_addr_reg[23]  ( .D(n183), .CK(clk), .Q(
        q_wr_input_addr[23]) );
  DFF_X2 \q_wr_input_addr_reg[27]  ( .D(n179), .CK(clk), .Q(
        q_wr_input_addr[27]) );
  DFF_X2 \q_wr_input_addr_reg[0]  ( .D(n206), .CK(clk), .Q(q_wr_input_addr[0]), 
        .QN(n594) );
  DFF_X2 q_input_wr_en_reg ( .D(n140), .CK(clk), .Q(q_input_wr_en) );
  DFF_X2 \q_wr_input_addr_reg[1]  ( .D(n205), .CK(clk), .Q(q_wr_input_addr[1]), 
        .QN(n581) );
  DFF_X2 \q_wr_input_addr_reg[30]  ( .D(n176), .CK(clk), .Q(
        q_wr_input_addr[30]), .QN(n590) );
  DFF_X2 \q_wr_input_addr_reg[29]  ( .D(n177), .CK(clk), .Q(
        q_wr_input_addr[29]), .QN(n591) );
  DFF_X2 \q_output_addr_reg[4]  ( .D(n170), .CK(clk), .Q(q_output_addr[4]) );
  DFF_X2 \q_output_addr_reg[8]  ( .D(n166), .CK(clk), .Q(q_output_addr[8]) );
  DFF_X2 \q_output_addr_reg[12]  ( .D(n162), .CK(clk), .Q(q_output_addr[12])
         );
  DFF_X2 \q_output_addr_reg[16]  ( .D(n158), .CK(clk), .Q(q_output_addr[16])
         );
  DFF_X2 \q_output_addr_reg[20]  ( .D(n154), .CK(clk), .Q(q_output_addr[20])
         );
  DFF_X2 \q_output_addr_reg[24]  ( .D(n150), .CK(clk), .Q(q_output_addr[24])
         );
  DFF_X2 \q_output_addr_reg[28]  ( .D(n146), .CK(clk), .Q(q_output_addr[28])
         );
  DFF_X2 \q_wr_input_addr_reg[5]  ( .D(n201), .CK(clk), .Q(q_wr_input_addr[5]), 
        .QN(n595) );
  DFF_X2 \q_wr_input_addr_reg[9]  ( .D(n197), .CK(clk), .Q(q_wr_input_addr[9]), 
        .QN(n596) );
  DFF_X2 \q_wr_input_addr_reg[13]  ( .D(n193), .CK(clk), .Q(
        q_wr_input_addr[13]), .QN(n597) );
  DFF_X2 \q_wr_input_addr_reg[17]  ( .D(n189), .CK(clk), .Q(
        q_wr_input_addr[17]), .QN(n599) );
  DFF_X2 \q_wr_input_addr_reg[21]  ( .D(n185), .CK(clk), .Q(
        q_wr_input_addr[21]), .QN(n601) );
  DFF_X2 \q_wr_input_addr_reg[25]  ( .D(n181), .CK(clk), .Q(
        q_wr_input_addr[25]), .QN(n603) );
  DFF_X2 done_reg ( .D(N248), .CK(clk), .Q(done) );
  DFF_X2 q_output_wr_en_reg ( .D(n141), .CK(clk), .Q(q_output_wr_en), .QN(n619) );
  DFF_X2 q_scratch_wr_en_reg ( .D(n142), .CK(clk), .Q(q_scratch_wr_en), .QN(
        n618) );
  DFF_X2 \q_output_addr_reg[0]  ( .D(n174), .CK(clk), .Q(q_output_addr[0]), 
        .QN(n620) );
  DFF_X2 \q_output_addr_reg[1]  ( .D(n173), .CK(clk), .Q(q_output_addr[1]), 
        .QN(n607) );
  DFF_X2 \q_output_addr_reg[2]  ( .D(n172), .CK(clk), .Q(q_output_addr[2]), 
        .QN(n608) );
  DFF_X2 \q_wr_input_addr_reg[2]  ( .D(n204), .CK(clk), .Q(q_wr_input_addr[2]), 
        .QN(n582) );
  DFF_X2 \q_output_addr_reg[5]  ( .D(n169), .CK(clk), .Q(q_output_addr[5]), 
        .QN(n621) );
  DFF_X2 \q_output_addr_reg[6]  ( .D(n168), .CK(clk), .Q(q_output_addr[6]), 
        .QN(n609) );
  DFF_X2 \q_wr_input_addr_reg[6]  ( .D(n200), .CK(clk), .Q(q_wr_input_addr[6]), 
        .QN(n583) );
  DFF_X2 \q_output_addr_reg[9]  ( .D(n165), .CK(clk), .Q(q_output_addr[9]), 
        .QN(n622) );
  DFF_X2 \q_output_addr_reg[10]  ( .D(n164), .CK(clk), .Q(q_output_addr[10]), 
        .QN(n610) );
  DFF_X2 \q_wr_input_addr_reg[10]  ( .D(n196), .CK(clk), .Q(
        q_wr_input_addr[10]), .QN(n584) );
  DFF_X2 \q_output_addr_reg[13]  ( .D(n161), .CK(clk), .Q(q_output_addr[13]), 
        .QN(n623) );
  DFF_X2 \q_output_addr_reg[14]  ( .D(n160), .CK(clk), .Q(q_output_addr[14]), 
        .QN(n611) );
  DFF_X2 \q_wr_input_addr_reg[14]  ( .D(n192), .CK(clk), .Q(
        q_wr_input_addr[14]), .QN(n585) );
  DFF_X2 \q_output_addr_reg[17]  ( .D(n157), .CK(clk), .Q(q_output_addr[17]), 
        .QN(n624) );
  DFF_X2 \q_output_addr_reg[18]  ( .D(n156), .CK(clk), .Q(q_output_addr[18]), 
        .QN(n612) );
  DFF_X2 \q_wr_input_addr_reg[18]  ( .D(n188), .CK(clk), .Q(
        q_wr_input_addr[18]), .QN(n587) );
  DFF_X2 \q_output_addr_reg[21]  ( .D(n153), .CK(clk), .Q(q_output_addr[21]), 
        .QN(n625) );
  DFF_X2 \q_output_addr_reg[22]  ( .D(n152), .CK(clk), .Q(q_output_addr[22]), 
        .QN(n613) );
  DFF_X2 \q_wr_input_addr_reg[22]  ( .D(n184), .CK(clk), .Q(
        q_wr_input_addr[22]), .QN(n588) );
  DFF_X2 \q_output_addr_reg[25]  ( .D(n149), .CK(clk), .Q(q_output_addr[25]), 
        .QN(n626) );
  DFF_X2 \q_output_addr_reg[26]  ( .D(n148), .CK(clk), .Q(q_output_addr[26]), 
        .QN(n614) );
  DFF_X2 \q_wr_input_addr_reg[26]  ( .D(n180), .CK(clk), .Q(
        q_wr_input_addr[26]), .QN(n589) );
  DFF_X2 \q_output_addr_reg[29]  ( .D(n145), .CK(clk), .Q(q_output_addr[29]), 
        .QN(n615) );
  DFF_X2 \q_output_addr_reg[30]  ( .D(n144), .CK(clk), .Q(q_output_addr[30]), 
        .QN(n616) );
  DFF_X2 \q_output_addr_reg[31]  ( .D(n143), .CK(clk), .Q(q_output_addr[31]), 
        .QN(n617) );
  DFF_X2 \q_wr_input_addr_reg[31]  ( .D(n175), .CK(clk), .Q(
        q_wr_input_addr[31]), .QN(n592) );
  DFF_X2 \q_input_addr_reg[0]  ( .D(N130), .CK(clk), .Q(q_input_addr[0]) );
  DFF_X2 \q_input_addr_reg[1]  ( .D(N131), .CK(clk), .Q(q_input_addr[1]) );
  DFF_X2 \q_input_addr_reg[2]  ( .D(N132), .CK(clk), .Q(q_input_addr[2]) );
  DFF_X2 \q_input_addr_reg[3]  ( .D(N133), .CK(clk), .Q(q_input_addr[3]) );
  DFF_X2 \q_input_addr_reg[4]  ( .D(N134), .CK(clk), .Q(q_input_addr[4]) );
  DFF_X2 \q_input_addr_reg[5]  ( .D(N135), .CK(clk), .Q(q_input_addr[5]) );
  DFF_X2 \q_gates_addr_reg[0]  ( .D(N91), .CK(clk), .Q(q_gates_addr[0]) );
  DFF_X2 \q_gates_addr_reg[1]  ( .D(N92), .CK(clk), .Q(q_gates_addr[1]) );
  DFF_X2 \q_gates_addr_reg[2]  ( .D(N93), .CK(clk), .Q(q_gates_addr[2]) );
  DFF_X2 \q_gates_addr_reg[3]  ( .D(N94), .CK(clk), .Q(q_gates_addr[3]) );
  DFF_X2 \q_gates_addr_reg[4]  ( .D(N95), .CK(clk), .Q(q_gates_addr[4]) );
  DFF_X2 \q_gates_addr_reg[5]  ( .D(N96), .CK(clk), .Q(q_gates_addr[5]) );
  DFF_X2 \q_gates_addr_reg[6]  ( .D(N97), .CK(clk), .Q(q_gates_addr[6]) );
  DFF_X2 \q_gates_addr_reg[7]  ( .D(N98), .CK(clk), .Q(q_gates_addr[7]) );
  DFF_X2 \q_gates_addr_reg[8]  ( .D(N99), .CK(clk), .Q(q_gates_addr[8]) );
  DFF_X2 \q_gates_addr_reg[9]  ( .D(N100), .CK(clk), .Q(q_gates_addr[9]) );
  DFF_X2 \q_gates_addr_reg[10]  ( .D(N101), .CK(clk), .Q(q_gates_addr[10]) );
  DFF_X2 \q_gates_addr_reg[11]  ( .D(N102), .CK(clk), .Q(q_gates_addr[11]) );
  DFF_X2 \q_gates_addr_reg[12]  ( .D(N103), .CK(clk), .Q(q_gates_addr[12]) );
  DFF_X2 \q_gates_addr_reg[13]  ( .D(N104), .CK(clk), .Q(q_gates_addr[13]) );
  DFF_X2 \q_gates_addr_reg[14]  ( .D(N105), .CK(clk), .Q(q_gates_addr[14]) );
  DFF_X2 \q_gates_addr_reg[15]  ( .D(N106), .CK(clk), .Q(q_gates_addr[15]) );
  DFF_X2 \q_gates_addr_reg[16]  ( .D(N107), .CK(clk), .Q(q_gates_addr[16]) );
  DFF_X2 \q_gates_addr_reg[17]  ( .D(N108), .CK(clk), .Q(q_gates_addr[17]) );
  DFF_X2 \q_gates_addr_reg[18]  ( .D(N109), .CK(clk), .Q(q_gates_addr[18]) );
  DFF_X2 \q_gates_addr_reg[19]  ( .D(N110), .CK(clk), .Q(q_gates_addr[19]) );
  DFF_X2 \q_gates_addr_reg[20]  ( .D(N111), .CK(clk), .Q(q_gates_addr[20]) );
  DFF_X2 \q_gates_addr_reg[21]  ( .D(N112), .CK(clk), .Q(q_gates_addr[21]) );
  DFF_X2 \q_gates_addr_reg[22]  ( .D(N113), .CK(clk), .Q(q_gates_addr[22]) );
  DFF_X2 \q_gates_addr_reg[23]  ( .D(N114), .CK(clk), .Q(q_gates_addr[23]) );
  DFF_X2 \q_gates_addr_reg[24]  ( .D(N115), .CK(clk), .Q(q_gates_addr[24]) );
  DFF_X2 \q_gates_addr_reg[25]  ( .D(N116), .CK(clk), .Q(q_gates_addr[25]) );
  DFF_X2 \q_gates_addr_reg[26]  ( .D(N117), .CK(clk), .Q(q_gates_addr[26]) );
  DFF_X2 \q_gates_addr_reg[27]  ( .D(N118), .CK(clk), .Q(q_gates_addr[27]) );
  DFF_X2 \q_gates_addr_reg[28]  ( .D(N119), .CK(clk), .Q(q_gates_addr[28]) );
  DFF_X2 \q_gates_addr_reg[29]  ( .D(N120), .CK(clk), .Q(q_gates_addr[29]) );
  DFF_X2 \q_gates_addr_reg[30]  ( .D(N121), .CK(clk), .Q(q_gates_addr[30]) );
  DFF_X2 \q_gates_addr_reg[31]  ( .D(N122), .CK(clk), .Q(q_gates_addr[31]) );
  DFF_X2 wraparound_reg ( .D(N20), .CK(clk), .Q(wraparound) );
  DFF_X2 \q_wr_input_addr_reg[28]  ( .D(n178), .CK(clk), .Q(
        q_wr_input_addr[28]) );
  DFF_X2 \q_wr_input_addr_reg[24]  ( .D(n182), .CK(clk), .Q(
        q_wr_input_addr[24]) );
  DFF_X2 \q_wr_input_addr_reg[20]  ( .D(n186), .CK(clk), .Q(
        q_wr_input_addr[20]) );
  DFF_X2 \q_wr_input_addr_reg[16]  ( .D(n190), .CK(clk), .Q(
        q_wr_input_addr[16]) );
  DFF_X2 \q_wr_input_addr_reg[12]  ( .D(n194), .CK(clk), .Q(
        q_wr_input_addr[12]) );
  DFF_X2 \q_wr_input_addr_reg[8]  ( .D(n198), .CK(clk), .Q(q_wr_input_addr[8])
         );
  DFF_X2 \q_wr_input_addr_reg[4]  ( .D(n202), .CK(clk), .Q(q_wr_input_addr[4])
         );
  DFF_X2 \q_output_addr_reg[27]  ( .D(n147), .CK(clk), .Q(q_output_addr[27])
         );
  DFF_X2 \q_output_addr_reg[23]  ( .D(n151), .CK(clk), .Q(q_output_addr[23])
         );
  DFF_X2 \q_output_addr_reg[19]  ( .D(n155), .CK(clk), .Q(q_output_addr[19])
         );
  DFF_X2 \q_output_addr_reg[15]  ( .D(n159), .CK(clk), .Q(q_output_addr[15])
         );
  DFF_X2 \q_output_addr_reg[11]  ( .D(n163), .CK(clk), .Q(q_output_addr[11])
         );
  DFF_X2 \q_output_addr_reg[7]  ( .D(n167), .CK(clk), .Q(q_output_addr[7]) );
  DFF_X2 \q_output_addr_reg[3]  ( .D(n171), .CK(clk), .Q(q_output_addr[3]) );
  AOI21_X1 U273 ( .B1(q_gates_offset[31]), .B2(n464), .A(n463), .ZN(N122) );
  INV_X1 U274 ( .A(n308), .ZN(N120) );
  OAI21_X1 U275 ( .B1(q_gates_offset[31]), .B2(n464), .A(n506), .ZN(n463) );
  AOI211_X1 U276 ( .C1(n462), .C2(n461), .A(n464), .B(n579), .ZN(N121) );
  NOR2_X1 U277 ( .A1(n462), .A2(n461), .ZN(n464) );
  AOI211_X1 U278 ( .C1(n460), .C2(n459), .A(n458), .B(n579), .ZN(N119) );
  NAND2_X1 U279 ( .A1(n458), .A2(q_gates_offset[29]), .ZN(n462) );
  INV_X1 U280 ( .A(n307), .ZN(N118) );
  NOR2_X1 U281 ( .A1(n460), .A2(n459), .ZN(n458) );
  NAND2_X1 U282 ( .A1(n455), .A2(q_gates_offset[27]), .ZN(n460) );
  INV_X1 U283 ( .A(n306), .ZN(N116) );
  MUX2_X1 U284 ( .A(n422), .B(n421), .S(Qcounter[15]), .Z(n209) );
  NOR2_X1 U285 ( .A1(n457), .A2(n456), .ZN(n455) );
  INV_X1 U286 ( .A(n420), .ZN(n421) );
  OAI22_X1 U287 ( .A1(n497), .A2(n606), .B1(n492), .B2(n496), .ZN(n213) );
  OAI22_X1 U288 ( .A1(n486), .A2(n604), .B1(n482), .B2(n485), .ZN(n217) );
  OAI22_X1 U289 ( .A1(n481), .A2(n600), .B1(n477), .B2(n480), .ZN(n219) );
  OAI22_X1 U290 ( .A1(n491), .A2(n605), .B1(n487), .B2(n490), .ZN(n215) );
  AND2_X1 U291 ( .A1(n416), .A2(Qcounter[14]), .ZN(n422) );
  OAI22_X1 U292 ( .A1(n476), .A2(n602), .B1(n472), .B2(n475), .ZN(n221) );
  INV_X1 U293 ( .A(n305), .ZN(N114) );
  NAND2_X1 U294 ( .A1(n452), .A2(q_gates_offset[25]), .ZN(n457) );
  NOR2_X1 U295 ( .A1(n419), .A2(n502), .ZN(n420) );
  NOR2_X1 U296 ( .A1(n454), .A2(n453), .ZN(n452) );
  INV_X1 U297 ( .A(n493), .ZN(n498) );
  NAND2_X1 U298 ( .A1(n449), .A2(q_gates_offset[23]), .ZN(n454) );
  INV_X1 U299 ( .A(n304), .ZN(N112) );
  OAI21_X1 U300 ( .B1(n415), .B2(n414), .A(n413), .ZN(n493) );
  NOR2_X1 U301 ( .A1(n451), .A2(n450), .ZN(n449) );
  AOI21_X1 U302 ( .B1(n412), .B2(n415), .A(n411), .ZN(n413) );
  NAND2_X1 U303 ( .A1(n446), .A2(q_gates_offset[21]), .ZN(n451) );
  INV_X1 U304 ( .A(n303), .ZN(N110) );
  OAI211_X1 U305 ( .C1(Qcounter[12]), .C2(n410), .A(n409), .B(n408), .ZN(n411)
         );
  NOR2_X1 U306 ( .A1(n448), .A2(n447), .ZN(n446) );
  AOI221_X1 U307 ( .B1(n414), .B2(n404), .C1(max[13]), .C2(n403), .A(n402), 
        .ZN(n409) );
  NAND2_X1 U308 ( .A1(n443), .A2(q_gates_offset[19]), .ZN(n448) );
  INV_X1 U309 ( .A(n302), .ZN(N107) );
  MUX2_X1 U310 ( .A(n312), .B(n311), .S(n592), .Z(n175) );
  AOI211_X1 U311 ( .C1(n442), .C2(n441), .A(n440), .B(n579), .ZN(N108) );
  AOI21_X1 U312 ( .B1(Qcounter[12]), .B2(n410), .A(n407), .ZN(n408) );
  NOR2_X1 U313 ( .A1(max[13]), .A2(n403), .ZN(n404) );
  NOR2_X1 U314 ( .A1(n445), .A2(n444), .ZN(n443) );
  AOI22_X1 U315 ( .A1(q_wr_input_addr[30]), .A2(n569), .B1(n568), .B2(n590), 
        .ZN(n176) );
  INV_X1 U316 ( .A(n309), .ZN(n312) );
  AOI21_X1 U317 ( .B1(n563), .B2(n590), .A(n567), .ZN(n309) );
  INV_X1 U318 ( .A(n567), .ZN(n569) );
  NAND3_X1 U319 ( .A1(\intadd_0/n1 ), .A2(q_gates_offset[16]), .A3(
        q_gates_offset[17]), .ZN(n445) );
  AND2_X1 U320 ( .A1(n505), .A2(\intadd_0/SUM[13] ), .ZN(N106) );
  AND2_X1 U321 ( .A1(n310), .A2(q_wr_input_addr[30]), .ZN(n311) );
  NAND4_X1 U322 ( .A1(n401), .A2(n400), .A3(n399), .A4(n398), .ZN(n402) );
  NOR2_X1 U323 ( .A1(max[12]), .A2(n352), .ZN(n353) );
  INV_X1 U324 ( .A(n568), .ZN(n310) );
  INV_X1 U325 ( .A(n301), .ZN(n179) );
  OAI22_X1 U326 ( .A1(n566), .A2(n591), .B1(n565), .B2(n564), .ZN(n177) );
  AND2_X1 U327 ( .A1(n505), .A2(\intadd_0/SUM[12] ), .ZN(N105) );
  OAI21_X1 U328 ( .B1(q_wr_input_addr[28]), .B2(n562), .A(n561), .ZN(n178) );
  NOR4_X1 U329 ( .A1(n397), .A2(n396), .A3(n395), .A4(n394), .ZN(n398) );
  NAND2_X1 U330 ( .A1(n405), .A2(n349), .ZN(n352) );
  MUX2_X1 U331 ( .A(n317), .B(n316), .S(n589), .Z(n180) );
  AND2_X1 U332 ( .A1(n505), .A2(\intadd_0/SUM[11] ), .ZN(N104) );
  OR3_X1 U333 ( .A1(n578), .A2(n591), .A3(n564), .ZN(n568) );
  AOI21_X1 U334 ( .B1(n563), .B2(n564), .A(n554), .ZN(n566) );
  NOR2_X1 U335 ( .A1(max[10]), .A2(n348), .ZN(n405) );
  OAI21_X1 U336 ( .B1(q_wr_input_addr[24]), .B2(n553), .A(n552), .ZN(n182) );
  NAND3_X1 U337 ( .A1(q_wr_input_addr[28]), .A2(q_wr_input_addr[27]), .A3(n558), .ZN(n564) );
  OAI22_X1 U338 ( .A1(n557), .A2(n603), .B1(n556), .B2(n555), .ZN(n181) );
  AND2_X1 U339 ( .A1(n315), .A2(n314), .ZN(n316) );
  INV_X1 U340 ( .A(n313), .ZN(n317) );
  AND2_X1 U341 ( .A1(n506), .A2(\intadd_0/SUM[10] ), .ZN(N103) );
  INV_X1 U342 ( .A(n300), .ZN(n183) );
  INV_X1 U343 ( .A(n393), .ZN(n348) );
  MUX2_X1 U344 ( .A(n322), .B(n321), .S(n588), .Z(n184) );
  NOR3_X1 U345 ( .A1(n589), .A2(n603), .A3(n556), .ZN(n558) );
  AND2_X1 U346 ( .A1(n506), .A2(\intadd_0/SUM[9] ), .ZN(N102) );
  AND2_X1 U347 ( .A1(n370), .A2(max[9]), .ZN(n372) );
  NOR2_X1 U348 ( .A1(n370), .A2(max[9]), .ZN(n393) );
  AND2_X1 U349 ( .A1(n506), .A2(\intadd_0/SUM[8] ), .ZN(N101) );
  NAND3_X1 U350 ( .A1(q_wr_input_addr[24]), .A2(q_wr_input_addr[23]), .A3(n549), .ZN(n556) );
  AND2_X1 U351 ( .A1(n320), .A2(n319), .ZN(n321) );
  INV_X1 U352 ( .A(n299), .ZN(n187) );
  INV_X1 U353 ( .A(n318), .ZN(n322) );
  OAI21_X1 U354 ( .B1(q_wr_input_addr[20]), .B2(n545), .A(n544), .ZN(n186) );
  INV_X1 U355 ( .A(n499), .ZN(n417) );
  INV_X1 U356 ( .A(n365), .ZN(n370) );
  AND2_X1 U357 ( .A1(n505), .A2(\intadd_0/SUM[7] ), .ZN(N100) );
  NOR3_X1 U358 ( .A1(n588), .A2(n601), .A3(n547), .ZN(n549) );
  MUX2_X1 U359 ( .A(n327), .B(n326), .S(n587), .Z(n188) );
  NOR2_X1 U360 ( .A1(max[8]), .A2(n366), .ZN(n365) );
  INV_X1 U361 ( .A(n298), .ZN(n191) );
  NOR2_X1 U362 ( .A1(n606), .A2(n492), .ZN(n494) );
  AND2_X1 U363 ( .A1(n325), .A2(n324), .ZN(n326) );
  AND2_X1 U364 ( .A1(n506), .A2(\intadd_0/SUM[6] ), .ZN(N99) );
  INV_X1 U365 ( .A(n323), .ZN(n327) );
  NAND3_X1 U366 ( .A1(q_wr_input_addr[20]), .A2(q_wr_input_addr[19]), .A3(n541), .ZN(n547) );
  OR2_X1 U367 ( .A1(n389), .A2(max[7]), .ZN(n366) );
  NOR3_X1 U368 ( .A1(n587), .A2(n599), .A3(n539), .ZN(n541) );
  AND2_X1 U369 ( .A1(n506), .A2(\intadd_0/SUM[5] ), .ZN(N98) );
  MUX2_X1 U370 ( .A(n332), .B(n331), .S(n585), .Z(n192) );
  INV_X1 U371 ( .A(n363), .ZN(n389) );
  MUX2_X1 U372 ( .A(n337), .B(n336), .S(n584), .Z(n196) );
  MUX2_X1 U373 ( .A(n346), .B(n345), .S(n582), .Z(n204) );
  MUX2_X1 U374 ( .A(n342), .B(n341), .S(n583), .Z(n200) );
  AND2_X1 U375 ( .A1(n506), .A2(\intadd_0/SUM[4] ), .ZN(N97) );
  OAI21_X1 U376 ( .B1(q_wr_input_addr[12]), .B2(n529), .A(n528), .ZN(n194) );
  NOR2_X1 U377 ( .A1(n605), .A2(n487), .ZN(n488) );
  AND2_X1 U378 ( .A1(n330), .A2(n329), .ZN(n331) );
  INV_X1 U379 ( .A(n297), .ZN(n195) );
  INV_X1 U380 ( .A(n328), .ZN(n332) );
  NAND3_X1 U381 ( .A1(q_wr_input_addr[16]), .A2(q_wr_input_addr[15]), .A3(n533), .ZN(n539) );
  AND2_X1 U382 ( .A1(n344), .A2(q_wr_input_addr[1]), .ZN(n345) );
  AND2_X1 U383 ( .A1(n340), .A2(n339), .ZN(n341) );
  NOR2_X1 U384 ( .A1(max[6]), .A2(n364), .ZN(n363) );
  AND2_X1 U385 ( .A1(n335), .A2(n334), .ZN(n336) );
  AND2_X1 U386 ( .A1(n506), .A2(\intadd_0/SUM[3] ), .ZN(N96) );
  AND2_X1 U387 ( .A1(n506), .A2(n435), .ZN(N135) );
  NOR3_X1 U388 ( .A1(n585), .A2(n597), .A3(n531), .ZN(n533) );
  INV_X1 U389 ( .A(n281), .ZN(n162) );
  INV_X1 U390 ( .A(n289), .ZN(n147) );
  INV_X1 U391 ( .A(n296), .ZN(n203) );
  INV_X1 U392 ( .A(n293), .ZN(n155) );
  INV_X1 U393 ( .A(n295), .ZN(n199) );
  INV_X1 U394 ( .A(n294), .ZN(n151) );
  INV_X1 U395 ( .A(n290), .ZN(n163) );
  INV_X1 U396 ( .A(n282), .ZN(n154) );
  AOI22_X1 U397 ( .A1(q_wr_input_addr[1]), .A2(n508), .B1(n570), .B2(n581), 
        .ZN(n205) );
  INV_X1 U398 ( .A(n291), .ZN(n167) );
  INV_X1 U399 ( .A(n386), .ZN(n364) );
  INV_X1 U400 ( .A(n333), .ZN(n337) );
  INV_X1 U401 ( .A(n283), .ZN(n170) );
  INV_X1 U402 ( .A(n286), .ZN(n150) );
  INV_X1 U403 ( .A(n292), .ZN(n171) );
  OAI21_X1 U404 ( .B1(q_wr_input_addr[4]), .B2(n513), .A(n512), .ZN(n202) );
  INV_X1 U405 ( .A(n338), .ZN(n342) );
  INV_X1 U406 ( .A(n288), .ZN(n159) );
  OAI22_X1 U407 ( .A1(n524), .A2(n596), .B1(n523), .B2(n522), .ZN(n197) );
  INV_X1 U408 ( .A(n287), .ZN(n166) );
  OAI21_X1 U409 ( .B1(q_wr_input_addr[8]), .B2(n521), .A(n520), .ZN(n198) );
  INV_X1 U410 ( .A(n285), .ZN(n146) );
  INV_X1 U411 ( .A(n343), .ZN(n346) );
  OAI22_X1 U412 ( .A1(n516), .A2(n595), .B1(n515), .B2(n514), .ZN(n201) );
  INV_X1 U413 ( .A(n284), .ZN(n158) );
  NOR2_X1 U414 ( .A1(n434), .A2(n433), .ZN(n435) );
  AND2_X1 U415 ( .A1(n506), .A2(\intadd_0/SUM[2] ), .ZN(N95) );
  NAND3_X1 U416 ( .A1(q_wr_input_addr[12]), .A2(q_wr_input_addr[11]), .A3(n525), .ZN(n531) );
  NOR2_X1 U417 ( .A1(n604), .A2(n482), .ZN(n483) );
  NAND2_X1 U418 ( .A1(n563), .A2(q_wr_input_addr[17]), .ZN(n574) );
  NAND2_X1 U419 ( .A1(n563), .A2(q_wr_input_addr[13]), .ZN(n573) );
  NAND2_X1 U420 ( .A1(n563), .A2(q_wr_input_addr[9]), .ZN(n572) );
  NAND2_X1 U421 ( .A1(n563), .A2(q_wr_input_addr[25]), .ZN(n576) );
  NAND2_X1 U422 ( .A1(n563), .A2(q_wr_input_addr[21]), .ZN(n575) );
  AOI22_X1 U423 ( .A1(q_wr_input_addr[3]), .A2(n511), .B1(n509), .B2(n510), 
        .ZN(n296) );
  NOR2_X1 U424 ( .A1(n375), .A2(max[5]), .ZN(n386) );
  NAND2_X1 U425 ( .A1(n563), .A2(q_wr_input_addr[0]), .ZN(n570) );
  NAND2_X1 U426 ( .A1(n563), .A2(q_wr_input_addr[5]), .ZN(n571) );
  NOR3_X1 U427 ( .A1(n584), .A2(n596), .A3(n523), .ZN(n525) );
  AND2_X1 U428 ( .A1(n506), .A2(\intadd_0/SUM[1] ), .ZN(N94) );
  INV_X1 U429 ( .A(n278), .ZN(N131) );
  INV_X1 U430 ( .A(n280), .ZN(n140) );
  INV_X1 U431 ( .A(n279), .ZN(N91) );
  INV_X1 U432 ( .A(n356), .ZN(n375) );
  INV_X4 U433 ( .A(n578), .ZN(n563) );
  NAND3_X1 U434 ( .A1(q_wr_input_addr[8]), .A2(q_wr_input_addr[7]), .A3(n517), 
        .ZN(n523) );
  NOR2_X1 U435 ( .A1(n428), .A2(n427), .ZN(n429) );
  AND2_X1 U436 ( .A1(n506), .A2(\intadd_0/SUM[0] ), .ZN(N93) );
  NOR2_X1 U437 ( .A1(n600), .A2(n477), .ZN(n478) );
  AND2_X1 U438 ( .A1(n506), .A2(done2), .ZN(N251) );
  NOR2_X1 U439 ( .A1(max[4]), .A2(n374), .ZN(n356) );
  MUX2_X1 U440 ( .A(output_counter_control2), .B(output_counter_control1), .S(
        n506), .Z(n207) );
  INV_X2 U441 ( .A(n577), .ZN(n554) );
  NAND2_X1 U442 ( .A1(n506), .A2(output_counter_control), .ZN(n578) );
  AND2_X1 U443 ( .A1(n506), .A2(done3), .ZN(N248) );
  AND2_X1 U444 ( .A1(n506), .A2(done1), .ZN(N250) );
  NAND3_X1 U445 ( .A1(Qcounter[1]), .A2(bitmask[1]), .A3(n425), .ZN(n427) );
  NOR3_X1 U446 ( .A1(n583), .A2(n595), .A3(n515), .ZN(n517) );
  OR2_X1 U447 ( .A1(output_counter_control), .A2(n579), .ZN(n577) );
  INV_X2 U448 ( .A(n579), .ZN(n506) );
  INV_X1 U449 ( .A(n385), .ZN(n374) );
  NOR2_X1 U450 ( .A1(n602), .A2(n472), .ZN(n473) );
  INV_X1 U451 ( .A(n379), .ZN(n351) );
  NOR2_X1 U452 ( .A1(rdscratch_wrinp), .A2(n426), .ZN(n425) );
  NAND3_X1 U453 ( .A1(q_wr_input_addr[4]), .A2(q_wr_input_addr[3]), .A3(n509), 
        .ZN(n515) );
  INV_X2 U454 ( .A(n505), .ZN(n579) );
  NOR2_X1 U455 ( .A1(n377), .A2(max[3]), .ZN(n385) );
  NAND2_X1 U456 ( .A1(n598), .A2(max[15]), .ZN(n379) );
  AND2_X1 U457 ( .A1(Qcounter[1]), .A2(bitmask[1]), .ZN(n277) );
  NOR3_X1 U458 ( .A1(n582), .A2(n581), .A3(n594), .ZN(n509) );
  NAND2_X1 U459 ( .A1(Qcounter[0]), .A2(q_gates_offset[0]), .ZN(n439) );
  INV_X1 U460 ( .A(n355), .ZN(n377) );
  AOI221_X1 U461 ( .B1(max[0]), .B2(max[2]), .C1(max[1]), .C2(max[2]), .A(n355), .ZN(n362) );
  NOR2_X1 U462 ( .A1(n466), .A2(clr), .ZN(n505) );
  INV_X1 U463 ( .A(q_gates_offset[30]), .ZN(n461) );
  INV_X1 U464 ( .A(reset_n), .ZN(n466) );
  INV_X1 U465 ( .A(q_gates_offset[24]), .ZN(n453) );
  INV_X1 U466 ( .A(q_gates_offset[28]), .ZN(n459) );
  INV_X1 U467 ( .A(q_gates_offset[26]), .ZN(n456) );
  INV_X1 U468 ( .A(q_gates_offset[18]), .ZN(n444) );
  INV_X1 U469 ( .A(q_gates_offset[20]), .ZN(n447) );
  INV_X1 U470 ( .A(q_gates_offset[1]), .ZN(n436) );
  INV_X1 U471 ( .A(q_gates_offset[22]), .ZN(n450) );
  NOR3_X1 U472 ( .A1(max[2]), .A2(max[0]), .A3(max[1]), .ZN(n355) );
  INV_X2 U473 ( .A(1'b1), .ZN(q_input_addr[31]) );
  INV_X2 U474 ( .A(1'b1), .ZN(q_input_addr[30]) );
  INV_X2 U475 ( .A(1'b1), .ZN(q_input_addr[29]) );
  INV_X2 U476 ( .A(1'b1), .ZN(q_input_addr[28]) );
  INV_X2 U477 ( .A(1'b1), .ZN(q_input_addr[27]) );
  INV_X2 U478 ( .A(1'b1), .ZN(q_input_addr[26]) );
  INV_X2 U479 ( .A(1'b1), .ZN(q_input_addr[25]) );
  INV_X2 U480 ( .A(1'b1), .ZN(q_input_addr[24]) );
  INV_X2 U481 ( .A(1'b1), .ZN(q_input_addr[23]) );
  INV_X2 U482 ( .A(1'b1), .ZN(q_input_addr[22]) );
  INV_X2 U483 ( .A(1'b1), .ZN(q_input_addr[21]) );
  INV_X2 U484 ( .A(1'b1), .ZN(q_input_addr[20]) );
  INV_X2 U485 ( .A(1'b1), .ZN(q_input_addr[19]) );
  INV_X2 U486 ( .A(1'b1), .ZN(q_input_addr[18]) );
  INV_X2 U487 ( .A(1'b1), .ZN(q_input_addr[17]) );
  INV_X2 U488 ( .A(1'b1), .ZN(q_input_addr[16]) );
  INV_X2 U489 ( .A(1'b1), .ZN(q_input_addr[15]) );
  INV_X2 U490 ( .A(1'b1), .ZN(q_input_addr[14]) );
  INV_X2 U491 ( .A(1'b1), .ZN(q_input_addr[13]) );
  INV_X2 U492 ( .A(1'b1), .ZN(q_input_addr[12]) );
  INV_X2 U493 ( .A(1'b1), .ZN(q_input_addr[11]) );
  INV_X2 U494 ( .A(1'b1), .ZN(q_input_addr[10]) );
  INV_X2 U495 ( .A(1'b1), .ZN(q_input_addr[9]) );
  INV_X2 U496 ( .A(1'b1), .ZN(q_input_addr[8]) );
  INV_X2 U497 ( .A(1'b1), .ZN(q_input_addr[7]) );
  INV_X2 U498 ( .A(1'b1), .ZN(q_input_addr[6]) );
  INV_X1 U525 ( .A(max[11]), .ZN(n349) );
  INV_X1 U526 ( .A(max[13]), .ZN(n350) );
  INV_X1 U527 ( .A(n434), .ZN(n423) );
  INV_X1 U528 ( .A(n531), .ZN(n329) );
  INV_X1 U529 ( .A(n547), .ZN(n319) );
  INV_X1 U530 ( .A(n507), .ZN(n508) );
  INV_X1 U531 ( .A(n502), .ZN(n504) );
  AOI222_X1 U532 ( .A1(n580), .A2(n436), .B1(n580), .B2(n439), .C1(n436), .C2(
        n439), .ZN(\intadd_0/CI ) );
  NAND2_X1 U533 ( .A1(Qcounter[0]), .A2(bitmask[0]), .ZN(n426) );
  OAI211_X1 U534 ( .C1(n277), .C2(n425), .A(n427), .B(n506), .ZN(n278) );
  OAI211_X1 U535 ( .C1(Qcounter[0]), .C2(q_gates_offset[0]), .A(n439), .B(n506), .ZN(n279) );
  OAI221_X1 U536 ( .B1(n593), .B2(rdscratch_wrinp), .C1(
        output_counter_control3), .C2(q_input_wr_en), .A(n506), .ZN(n280) );
  AOI22_X1 U537 ( .A1(n563), .A2(q_wr_input_addr[12]), .B1(n554), .B2(
        q_output_addr[12]), .ZN(n281) );
  AOI22_X1 U538 ( .A1(n563), .A2(q_wr_input_addr[20]), .B1(n554), .B2(
        q_output_addr[20]), .ZN(n282) );
  AOI22_X1 U539 ( .A1(n563), .A2(q_wr_input_addr[4]), .B1(n554), .B2(
        q_output_addr[4]), .ZN(n283) );
  AOI22_X1 U540 ( .A1(n563), .A2(q_wr_input_addr[16]), .B1(n554), .B2(
        q_output_addr[16]), .ZN(n284) );
  AOI22_X1 U541 ( .A1(n563), .A2(q_wr_input_addr[28]), .B1(n554), .B2(
        q_output_addr[28]), .ZN(n285) );
  AOI22_X1 U542 ( .A1(n563), .A2(q_wr_input_addr[24]), .B1(n554), .B2(
        q_output_addr[24]), .ZN(n286) );
  AOI22_X1 U543 ( .A1(n563), .A2(q_wr_input_addr[8]), .B1(n554), .B2(
        q_output_addr[8]), .ZN(n287) );
  AOI22_X1 U544 ( .A1(n563), .A2(q_wr_input_addr[15]), .B1(n554), .B2(
        q_output_addr[15]), .ZN(n288) );
  AOI22_X1 U545 ( .A1(n563), .A2(q_wr_input_addr[27]), .B1(n554), .B2(
        q_output_addr[27]), .ZN(n289) );
  AOI22_X1 U546 ( .A1(n563), .A2(q_wr_input_addr[11]), .B1(n554), .B2(
        q_output_addr[11]), .ZN(n290) );
  AOI22_X1 U547 ( .A1(n563), .A2(q_wr_input_addr[7]), .B1(n554), .B2(
        q_output_addr[7]), .ZN(n291) );
  AOI22_X1 U548 ( .A1(n563), .A2(q_wr_input_addr[3]), .B1(n554), .B2(
        q_output_addr[3]), .ZN(n292) );
  AOI22_X1 U549 ( .A1(n563), .A2(q_wr_input_addr[19]), .B1(n554), .B2(
        q_output_addr[19]), .ZN(n293) );
  AOI22_X1 U550 ( .A1(n563), .A2(q_wr_input_addr[23]), .B1(n554), .B2(
        q_output_addr[23]), .ZN(n294) );
  AOI21_X1 U551 ( .B1(output_counter_control), .B2(n517), .A(n579), .ZN(n519)
         );
  NOR2_X1 U552 ( .A1(q_wr_input_addr[7]), .A2(n578), .ZN(n518) );
  AOI22_X1 U553 ( .A1(q_wr_input_addr[7]), .A2(n519), .B1(n517), .B2(n518), 
        .ZN(n295) );
  AOI21_X1 U554 ( .B1(output_counter_control), .B2(n509), .A(n579), .ZN(n511)
         );
  NOR2_X1 U555 ( .A1(q_wr_input_addr[3]), .A2(n578), .ZN(n510) );
  AOI21_X1 U556 ( .B1(output_counter_control), .B2(n525), .A(n579), .ZN(n527)
         );
  NOR2_X1 U557 ( .A1(q_wr_input_addr[11]), .A2(n578), .ZN(n526) );
  AOI22_X1 U558 ( .A1(q_wr_input_addr[11]), .A2(n527), .B1(n525), .B2(n526), 
        .ZN(n297) );
  AOI21_X1 U559 ( .B1(output_counter_control), .B2(n533), .A(n579), .ZN(n535)
         );
  NOR2_X1 U560 ( .A1(q_wr_input_addr[15]), .A2(n578), .ZN(n534) );
  AOI22_X1 U561 ( .A1(q_wr_input_addr[15]), .A2(n535), .B1(n533), .B2(n534), 
        .ZN(n298) );
  AOI21_X1 U562 ( .B1(output_counter_control), .B2(n541), .A(n579), .ZN(n543)
         );
  NOR2_X1 U563 ( .A1(q_wr_input_addr[19]), .A2(n578), .ZN(n542) );
  AOI22_X1 U564 ( .A1(q_wr_input_addr[19]), .A2(n543), .B1(n541), .B2(n542), 
        .ZN(n299) );
  AOI21_X1 U565 ( .B1(output_counter_control), .B2(n549), .A(n579), .ZN(n551)
         );
  NOR2_X1 U566 ( .A1(q_wr_input_addr[23]), .A2(n578), .ZN(n550) );
  AOI22_X1 U567 ( .A1(q_wr_input_addr[23]), .A2(n551), .B1(n549), .B2(n550), 
        .ZN(n300) );
  AOI21_X1 U568 ( .B1(output_counter_control), .B2(n558), .A(n579), .ZN(n560)
         );
  NOR2_X1 U569 ( .A1(q_wr_input_addr[27]), .A2(n578), .ZN(n559) );
  AOI22_X1 U570 ( .A1(q_wr_input_addr[27]), .A2(n560), .B1(n558), .B2(n559), 
        .ZN(n301) );
  NAND2_X1 U571 ( .A1(\intadd_0/n1 ), .A2(q_gates_offset[16]), .ZN(n442) );
  OAI211_X1 U572 ( .C1(\intadd_0/n1 ), .C2(q_gates_offset[16]), .A(n506), .B(
        n442), .ZN(n302) );
  OAI211_X1 U573 ( .C1(n443), .C2(q_gates_offset[19]), .A(n506), .B(n448), 
        .ZN(n303) );
  OAI211_X1 U574 ( .C1(n446), .C2(q_gates_offset[21]), .A(n506), .B(n451), 
        .ZN(n304) );
  OAI211_X1 U575 ( .C1(n449), .C2(q_gates_offset[23]), .A(n506), .B(n454), 
        .ZN(n305) );
  OAI211_X1 U576 ( .C1(n452), .C2(q_gates_offset[25]), .A(n506), .B(n457), 
        .ZN(n306) );
  OAI211_X1 U577 ( .C1(n455), .C2(q_gates_offset[27]), .A(n506), .B(n460), 
        .ZN(n307) );
  OAI211_X1 U578 ( .C1(n458), .C2(q_gates_offset[29]), .A(n506), .B(n462), 
        .ZN(n308) );
  OAI21_X1 U579 ( .B1(q_wr_input_addr[29]), .B2(n578), .A(n566), .ZN(n567) );
  AOI221_X1 U580 ( .B1(n603), .B2(n563), .C1(n556), .C2(n563), .A(n554), .ZN(
        n313) );
  INV_X1 U581 ( .A(n576), .ZN(n315) );
  INV_X1 U582 ( .A(n556), .ZN(n314) );
  AOI221_X1 U583 ( .B1(n601), .B2(n563), .C1(n547), .C2(n563), .A(n554), .ZN(
        n318) );
  INV_X1 U584 ( .A(n575), .ZN(n320) );
  AOI221_X1 U585 ( .B1(n599), .B2(n563), .C1(n539), .C2(n563), .A(n554), .ZN(
        n323) );
  INV_X1 U586 ( .A(n574), .ZN(n325) );
  INV_X1 U587 ( .A(n539), .ZN(n324) );
  AOI221_X1 U588 ( .B1(n597), .B2(n563), .C1(n531), .C2(n563), .A(n554), .ZN(
        n328) );
  INV_X1 U589 ( .A(n573), .ZN(n330) );
  AOI221_X1 U590 ( .B1(n596), .B2(n563), .C1(n523), .C2(n563), .A(n554), .ZN(
        n333) );
  INV_X1 U591 ( .A(n572), .ZN(n335) );
  INV_X1 U592 ( .A(n523), .ZN(n334) );
  AOI221_X1 U593 ( .B1(n595), .B2(n563), .C1(n515), .C2(n563), .A(n554), .ZN(
        n338) );
  INV_X1 U594 ( .A(n571), .ZN(n340) );
  INV_X1 U595 ( .A(n515), .ZN(n339) );
  AOI21_X1 U596 ( .B1(output_counter_control), .B2(q_wr_input_addr[0]), .A(
        n579), .ZN(n507) );
  AOI21_X1 U597 ( .B1(n563), .B2(n581), .A(n507), .ZN(n343) );
  INV_X1 U598 ( .A(n570), .ZN(n344) );
  NAND3_X1 U599 ( .A1(Qcounter[1]), .A2(Qcounter[0]), .A3(Qcounter[2]), .ZN(
        n472) );
  NAND2_X1 U600 ( .A1(Qcounter[4]), .A2(n473), .ZN(n477) );
  NAND2_X1 U601 ( .A1(Qcounter[6]), .A2(n478), .ZN(n482) );
  NAND2_X1 U602 ( .A1(Qcounter[8]), .A2(n483), .ZN(n487) );
  NAND2_X1 U603 ( .A1(Qcounter[10]), .A2(n488), .ZN(n492) );
  NAND2_X1 U604 ( .A1(Qcounter[12]), .A2(n494), .ZN(n499) );
  INV_X1 U605 ( .A(max[14]), .ZN(n347) );
  AOI22_X1 U606 ( .A1(Qcounter[14]), .A2(max[14]), .B1(n347), .B2(n586), .ZN(
        n415) );
  NAND2_X1 U607 ( .A1(n353), .A2(Qcounter[13]), .ZN(n414) );
  OAI211_X1 U608 ( .C1(max[14]), .C2(n351), .A(n353), .B(n350), .ZN(n412) );
  AOI21_X1 U609 ( .B1(max[12]), .B2(n352), .A(n353), .ZN(n410) );
  NOR2_X1 U610 ( .A1(n353), .A2(Qcounter[13]), .ZN(n403) );
  AOI21_X1 U611 ( .B1(n363), .B2(Qcounter[7]), .A(max[7]), .ZN(n354) );
  OAI21_X1 U612 ( .B1(n363), .B2(Qcounter[7]), .A(n354), .ZN(n401) );
  NOR2_X1 U613 ( .A1(n356), .A2(n600), .ZN(n358) );
  AOI22_X1 U614 ( .A1(n356), .A2(n600), .B1(max[5]), .B2(n358), .ZN(n357) );
  OAI21_X1 U615 ( .B1(max[5]), .B2(n358), .A(n357), .ZN(n360) );
  XNOR2_X1 U616 ( .A(max[1]), .B(Qcounter[1]), .ZN(n378) );
  OAI21_X1 U617 ( .B1(max[0]), .B2(n378), .A(Qcounter[0]), .ZN(n359) );
  OAI211_X1 U618 ( .C1(Qcounter[2]), .C2(n362), .A(n360), .B(n359), .ZN(n361)
         );
  AOI21_X1 U619 ( .B1(Qcounter[2]), .B2(n362), .A(n361), .ZN(n400) );
  AOI21_X1 U620 ( .B1(max[6]), .B2(n364), .A(n363), .ZN(n369) );
  AOI21_X1 U621 ( .B1(max[8]), .B2(n366), .A(n365), .ZN(n368) );
  OAI22_X1 U622 ( .A1(Qcounter[6]), .A2(n369), .B1(Qcounter[8]), .B2(n368), 
        .ZN(n367) );
  AOI221_X1 U623 ( .B1(Qcounter[6]), .B2(n369), .C1(n368), .C2(Qcounter[8]), 
        .A(n367), .ZN(n399) );
  NOR2_X1 U624 ( .A1(n393), .A2(n372), .ZN(n373) );
  XNOR2_X1 U625 ( .A(max[10]), .B(Qcounter[10]), .ZN(n392) );
  NAND2_X1 U626 ( .A1(Qcounter[9]), .A2(n392), .ZN(n371) );
  OAI22_X1 U627 ( .A1(Qcounter[9]), .A2(n373), .B1(n372), .B2(n371), .ZN(n397)
         );
  NAND2_X1 U628 ( .A1(Qcounter[4]), .A2(n374), .ZN(n376) );
  OAI22_X1 U629 ( .A1(max[4]), .A2(n376), .B1(Qcounter[4]), .B2(n375), .ZN(
        n396) );
  AOI21_X1 U630 ( .B1(max[3]), .B2(n377), .A(n385), .ZN(n384) );
  AOI21_X1 U631 ( .B1(max[0]), .B2(n378), .A(Qcounter[0]), .ZN(n382) );
  NOR2_X1 U632 ( .A1(max[14]), .A2(n586), .ZN(n380) );
  OAI22_X1 U633 ( .A1(n380), .A2(n379), .B1(max[15]), .B2(n598), .ZN(n381) );
  AOI211_X1 U634 ( .C1(Qcounter[3]), .C2(n384), .A(n382), .B(n381), .ZN(n383)
         );
  OAI21_X1 U635 ( .B1(Qcounter[3]), .B2(n384), .A(n383), .ZN(n395) );
  XNOR2_X1 U636 ( .A(n385), .B(Qcounter[4]), .ZN(n387) );
  AOI22_X1 U637 ( .A1(max[4]), .A2(n387), .B1(n386), .B2(n600), .ZN(n391) );
  NAND2_X1 U638 ( .A1(Qcounter[7]), .A2(n389), .ZN(n388) );
  OAI211_X1 U639 ( .C1(Qcounter[7]), .C2(n389), .A(max[7]), .B(n388), .ZN(n390) );
  OAI211_X1 U640 ( .C1(n393), .C2(n392), .A(n391), .B(n390), .ZN(n394) );
  XNOR2_X1 U641 ( .A(max[11]), .B(n405), .ZN(n406) );
  XNOR2_X1 U642 ( .A(n406), .B(Qcounter[11]), .ZN(n407) );
  NAND4_X1 U643 ( .A1(Qcounter[13]), .A2(n506), .A3(n417), .A4(n493), .ZN(n503) );
  INV_X1 U644 ( .A(n503), .ZN(n416) );
  NOR2_X1 U645 ( .A1(n579), .A2(Qcounter[14]), .ZN(n419) );
  AND2_X1 U646 ( .A1(n417), .A2(Qcounter[13]), .ZN(n418) );
  AOI21_X1 U647 ( .B1(n418), .B2(n493), .A(n579), .ZN(n502) );
  NAND2_X1 U648 ( .A1(Qcounter[4]), .A2(bitmask[4]), .ZN(n434) );
  AOI21_X1 U649 ( .B1(Qcounter[1]), .B2(bitmask[1]), .A(n423), .ZN(n424) );
  NAND2_X1 U650 ( .A1(Qcounter[3]), .A2(bitmask[3]), .ZN(n432) );
  NAND2_X1 U651 ( .A1(Qcounter[2]), .A2(bitmask[2]), .ZN(n428) );
  NAND4_X1 U652 ( .A1(n424), .A2(n432), .A3(n428), .A4(n426), .ZN(n465) );
  NOR2_X1 U653 ( .A1(n579), .A2(n465), .ZN(N137) );
  NOR2_X1 U654 ( .A1(n579), .A2(n593), .ZN(N136) );
  AOI211_X1 U655 ( .C1(rdscratch_wrinp), .C2(n426), .A(n425), .B(n579), .ZN(
        N130) );
  AOI211_X1 U656 ( .C1(n428), .C2(n427), .A(n429), .B(n579), .ZN(N132) );
  INV_X1 U657 ( .A(n429), .ZN(n431) );
  NAND3_X1 U658 ( .A1(Qcounter[3]), .A2(bitmask[3]), .A3(n429), .ZN(n433) );
  INV_X1 U659 ( .A(n433), .ZN(n430) );
  AOI211_X1 U660 ( .C1(n432), .C2(n431), .A(n430), .B(n579), .ZN(N133) );
  AOI211_X1 U661 ( .C1(n434), .C2(n433), .A(n435), .B(n579), .ZN(N134) );
  AOI22_X1 U662 ( .A1(Qcounter[1]), .A2(n436), .B1(q_gates_offset[1]), .B2(
        n580), .ZN(n438) );
  OAI21_X1 U663 ( .B1(n439), .B2(n438), .A(n506), .ZN(n437) );
  AOI21_X1 U664 ( .B1(n439), .B2(n438), .A(n437), .ZN(N92) );
  INV_X1 U665 ( .A(q_gates_offset[17]), .ZN(n441) );
  INV_X1 U666 ( .A(n445), .ZN(n440) );
  AOI211_X1 U667 ( .C1(n445), .C2(n444), .A(n443), .B(n579), .ZN(N109) );
  AOI211_X1 U668 ( .C1(n448), .C2(n447), .A(n446), .B(n579), .ZN(N111) );
  AOI211_X1 U669 ( .C1(n451), .C2(n450), .A(n449), .B(n579), .ZN(N113) );
  AOI211_X1 U670 ( .C1(n454), .C2(n453), .A(n452), .B(n579), .ZN(N115) );
  AOI211_X1 U671 ( .C1(n457), .C2(n456), .A(n455), .B(n579), .ZN(N117) );
  NOR2_X1 U672 ( .A1(n466), .A2(n465), .ZN(N20) );
  AOI221_X1 U673 ( .B1(Qcounter[0]), .B2(n493), .C1(n633), .C2(n498), .A(n579), 
        .ZN(n224) );
  NOR2_X1 U674 ( .A1(n579), .A2(n493), .ZN(N249) );
  OAI21_X1 U675 ( .B1(n498), .B2(n633), .A(n506), .ZN(n468) );
  NAND3_X1 U676 ( .A1(n506), .A2(n580), .A3(n493), .ZN(n467) );
  OAI22_X1 U677 ( .A1(n468), .A2(n580), .B1(n633), .B2(n467), .ZN(n223) );
  NAND3_X1 U678 ( .A1(n493), .A2(Qcounter[0]), .A3(Qcounter[1]), .ZN(n469) );
  NAND2_X1 U679 ( .A1(n469), .A2(n506), .ZN(n471) );
  NAND4_X1 U680 ( .A1(Qcounter[1]), .A2(n506), .A3(Qcounter[0]), .A4(n493), 
        .ZN(n470) );
  AOI22_X1 U681 ( .A1(Qcounter[2]), .A2(n471), .B1(n470), .B2(n632), .ZN(n222)
         );
  OAI21_X1 U682 ( .B1(n498), .B2(n472), .A(n506), .ZN(n476) );
  NAND3_X1 U683 ( .A1(n506), .A2(n602), .A3(n493), .ZN(n475) );
  NAND4_X1 U684 ( .A1(n506), .A2(n473), .A3(n493), .A4(n627), .ZN(n474) );
  OAI221_X1 U685 ( .B1(n627), .B2(n476), .C1(n627), .C2(n475), .A(n474), .ZN(
        n220) );
  OAI21_X1 U686 ( .B1(n498), .B2(n477), .A(n506), .ZN(n481) );
  NAND3_X1 U687 ( .A1(n506), .A2(n600), .A3(n493), .ZN(n480) );
  NAND4_X1 U688 ( .A1(n506), .A2(n478), .A3(n493), .A4(n630), .ZN(n479) );
  OAI221_X1 U689 ( .B1(n630), .B2(n481), .C1(n630), .C2(n480), .A(n479), .ZN(
        n218) );
  OAI21_X1 U690 ( .B1(n498), .B2(n482), .A(n506), .ZN(n486) );
  NAND3_X1 U691 ( .A1(n506), .A2(n604), .A3(n493), .ZN(n485) );
  NAND4_X1 U692 ( .A1(n506), .A2(n483), .A3(n493), .A4(n629), .ZN(n484) );
  OAI221_X1 U693 ( .B1(n629), .B2(n486), .C1(n629), .C2(n485), .A(n484), .ZN(
        n216) );
  OAI21_X1 U694 ( .B1(n498), .B2(n487), .A(n506), .ZN(n491) );
  NAND3_X1 U695 ( .A1(n506), .A2(n605), .A3(n493), .ZN(n490) );
  NAND4_X1 U696 ( .A1(n506), .A2(n488), .A3(n493), .A4(n631), .ZN(n489) );
  OAI221_X1 U697 ( .B1(n631), .B2(n491), .C1(n631), .C2(n490), .A(n489), .ZN(
        n214) );
  OAI21_X1 U698 ( .B1(n498), .B2(n492), .A(n506), .ZN(n497) );
  NAND3_X1 U699 ( .A1(n506), .A2(n606), .A3(n493), .ZN(n496) );
  NAND4_X1 U700 ( .A1(n506), .A2(n494), .A3(n493), .A4(n628), .ZN(n495) );
  OAI221_X1 U701 ( .B1(n628), .B2(n497), .C1(n628), .C2(n496), .A(n495), .ZN(
        n212) );
  NOR2_X1 U702 ( .A1(n499), .A2(n498), .ZN(n501) );
  OAI21_X1 U703 ( .B1(Qcounter[13]), .B2(n501), .A(n506), .ZN(n500) );
  AOI21_X1 U704 ( .B1(Qcounter[13]), .B2(n501), .A(n500), .ZN(n211) );
  AOI22_X1 U705 ( .A1(Qcounter[14]), .A2(n504), .B1(n503), .B2(n586), .ZN(n210) );
  AOI22_X1 U706 ( .A1(n505), .A2(n634), .B1(n593), .B2(n579), .ZN(n208) );
  AOI22_X1 U707 ( .A1(q_wr_input_addr[0]), .A2(n577), .B1(n578), .B2(n594), 
        .ZN(n206) );
  NAND3_X1 U708 ( .A1(n563), .A2(q_wr_input_addr[3]), .A3(n509), .ZN(n513) );
  OAI21_X1 U709 ( .B1(n511), .B2(n510), .A(q_wr_input_addr[4]), .ZN(n512) );
  AOI21_X1 U710 ( .B1(n563), .B2(n515), .A(n554), .ZN(n516) );
  NAND2_X1 U711 ( .A1(n563), .A2(n595), .ZN(n514) );
  NAND3_X1 U712 ( .A1(n563), .A2(q_wr_input_addr[7]), .A3(n517), .ZN(n521) );
  OAI21_X1 U713 ( .B1(n519), .B2(n518), .A(q_wr_input_addr[8]), .ZN(n520) );
  AOI21_X1 U714 ( .B1(n563), .B2(n523), .A(n554), .ZN(n524) );
  NAND2_X1 U715 ( .A1(n563), .A2(n596), .ZN(n522) );
  NAND3_X1 U716 ( .A1(n563), .A2(q_wr_input_addr[11]), .A3(n525), .ZN(n529) );
  OAI21_X1 U717 ( .B1(n527), .B2(n526), .A(q_wr_input_addr[12]), .ZN(n528) );
  AOI21_X1 U718 ( .B1(n563), .B2(n531), .A(n554), .ZN(n532) );
  NAND2_X1 U719 ( .A1(n563), .A2(n597), .ZN(n530) );
  OAI22_X1 U720 ( .A1(n532), .A2(n597), .B1(n531), .B2(n530), .ZN(n193) );
  NAND3_X1 U721 ( .A1(n563), .A2(q_wr_input_addr[15]), .A3(n533), .ZN(n537) );
  OAI21_X1 U722 ( .B1(n535), .B2(n534), .A(q_wr_input_addr[16]), .ZN(n536) );
  OAI21_X1 U723 ( .B1(q_wr_input_addr[16]), .B2(n537), .A(n536), .ZN(n190) );
  AOI21_X1 U724 ( .B1(n563), .B2(n539), .A(n554), .ZN(n540) );
  NAND2_X1 U725 ( .A1(n563), .A2(n599), .ZN(n538) );
  OAI22_X1 U726 ( .A1(n540), .A2(n599), .B1(n539), .B2(n538), .ZN(n189) );
  NAND3_X1 U727 ( .A1(n563), .A2(q_wr_input_addr[19]), .A3(n541), .ZN(n545) );
  OAI21_X1 U728 ( .B1(n543), .B2(n542), .A(q_wr_input_addr[20]), .ZN(n544) );
  AOI21_X1 U729 ( .B1(n563), .B2(n547), .A(n554), .ZN(n548) );
  NAND2_X1 U730 ( .A1(n563), .A2(n601), .ZN(n546) );
  OAI22_X1 U731 ( .A1(n548), .A2(n601), .B1(n547), .B2(n546), .ZN(n185) );
  NAND3_X1 U732 ( .A1(n563), .A2(q_wr_input_addr[23]), .A3(n549), .ZN(n553) );
  OAI21_X1 U733 ( .B1(n551), .B2(n550), .A(q_wr_input_addr[24]), .ZN(n552) );
  AOI21_X1 U734 ( .B1(n563), .B2(n556), .A(n554), .ZN(n557) );
  NAND2_X1 U735 ( .A1(n563), .A2(n603), .ZN(n555) );
  NAND3_X1 U736 ( .A1(n563), .A2(q_wr_input_addr[27]), .A3(n558), .ZN(n562) );
  OAI21_X1 U737 ( .B1(n560), .B2(n559), .A(q_wr_input_addr[28]), .ZN(n561) );
  NAND2_X1 U738 ( .A1(n563), .A2(n591), .ZN(n565) );
  OAI21_X1 U739 ( .B1(n577), .B2(n620), .A(n570), .ZN(n174) );
  OAI22_X1 U740 ( .A1(n578), .A2(n581), .B1(n577), .B2(n607), .ZN(n173) );
  OAI22_X1 U741 ( .A1(n578), .A2(n582), .B1(n577), .B2(n608), .ZN(n172) );
  OAI21_X1 U742 ( .B1(n577), .B2(n621), .A(n571), .ZN(n169) );
  OAI22_X1 U743 ( .A1(n578), .A2(n583), .B1(n577), .B2(n609), .ZN(n168) );
  OAI21_X1 U744 ( .B1(n577), .B2(n622), .A(n572), .ZN(n165) );
  OAI22_X1 U745 ( .A1(n578), .A2(n584), .B1(n577), .B2(n610), .ZN(n164) );
  OAI21_X1 U746 ( .B1(n577), .B2(n623), .A(n573), .ZN(n161) );
  OAI22_X1 U747 ( .A1(n578), .A2(n585), .B1(n577), .B2(n611), .ZN(n160) );
  OAI21_X1 U748 ( .B1(n577), .B2(n624), .A(n574), .ZN(n157) );
  OAI22_X1 U749 ( .A1(n578), .A2(n587), .B1(n577), .B2(n612), .ZN(n156) );
  OAI21_X1 U750 ( .B1(n577), .B2(n625), .A(n575), .ZN(n153) );
  OAI22_X1 U751 ( .A1(n578), .A2(n588), .B1(n577), .B2(n613), .ZN(n152) );
  OAI21_X1 U752 ( .B1(n577), .B2(n626), .A(n576), .ZN(n149) );
  OAI22_X1 U753 ( .A1(n578), .A2(n589), .B1(n577), .B2(n614), .ZN(n148) );
  OAI22_X1 U754 ( .A1(n578), .A2(n591), .B1(n577), .B2(n615), .ZN(n145) );
  OAI22_X1 U755 ( .A1(n578), .A2(n590), .B1(n577), .B2(n616), .ZN(n144) );
  OAI22_X1 U756 ( .A1(n592), .A2(n578), .B1(n577), .B2(n617), .ZN(n143) );
  AOI221_X1 U757 ( .B1(output_counter_control3), .B2(rdscratch_wrinp), .C1(
        n593), .C2(n618), .A(n579), .ZN(n142) );
  AOI21_X1 U758 ( .B1(n593), .B2(n619), .A(n579), .ZN(n141) );
endmodule

