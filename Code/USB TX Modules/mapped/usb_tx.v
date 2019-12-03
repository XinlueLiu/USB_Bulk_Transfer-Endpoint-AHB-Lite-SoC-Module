/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Dec  2 16:59:06 2019
/////////////////////////////////////////////////////////////


module flex_counter3_NUM_CNT_BITS7_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module flex_counter3_NUM_CNT_BITS7 ( clk, count_enable, rollover_value, clear, 
        n_rst, halt, count_out, rollover_flag );
  input [6:0] rollover_value;
  output [6:0] count_out;
  input clk, count_enable, clear, n_rst, halt;
  output rollover_flag;
  wire   N31, N32, N33, N34, N35, N36, N37, n16, n17, n18, n19, n20, n21, n39,
         n40, n1, n2, n3, n4, n5, n6, n15, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75;

  DFFSR \count_out_reg[0]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[6]  ( .D(n16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR rollover_flag_reg ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[1]  ( .D(n21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n19), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n18), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  flex_counter3_NUM_CNT_BITS7_DW01_inc_0 r310 ( .A(count_out), .SUM({N37, N36, 
        N35, N34, N33, N32, N31}) );
  MUX2X1 U4 ( .B(n1), .A(n2), .S(n3), .Y(n40) );
  NOR2X1 U5 ( .A(N31), .B(clear), .Y(n2) );
  INVX1 U6 ( .A(count_out[0]), .Y(n1) );
  OAI21X1 U14 ( .A(n4), .B(n5), .C(n6), .Y(n39) );
  OAI21X1 U15 ( .A(halt), .B(n15), .C(rollover_flag), .Y(n6) );
  OAI21X1 U16 ( .A(n22), .B(n23), .C(count_enable), .Y(n5) );
  AOI21X1 U17 ( .A(n24), .B(n25), .C(n26), .Y(n23) );
  OAI21X1 U18 ( .A(count_out[5]), .B(n27), .C(n28), .Y(n26) );
  OAI21X1 U19 ( .A(n29), .B(n30), .C(n31), .Y(n28) );
  XOR2X1 U20 ( .A(rollover_value[5]), .B(n32), .Y(n31) );
  INVX1 U21 ( .A(n27), .Y(n29) );
  OAI21X1 U22 ( .A(n33), .B(n34), .C(n35), .Y(n27) );
  OAI21X1 U23 ( .A(n36), .B(n37), .C(n38), .Y(n35) );
  AND2X1 U24 ( .A(n41), .B(n42), .Y(n38) );
  OAI21X1 U25 ( .A(n43), .B(n44), .C(n45), .Y(n42) );
  INVX1 U26 ( .A(n37), .Y(n43) );
  OAI21X1 U27 ( .A(n46), .B(n32), .C(n33), .Y(n41) );
  INVX1 U28 ( .A(n47), .Y(n46) );
  OAI21X1 U29 ( .A(n48), .B(n49), .C(n50), .Y(n37) );
  OAI21X1 U30 ( .A(count_out[2]), .B(n51), .C(n52), .Y(n50) );
  AOI22X1 U31 ( .A(n53), .B(n54), .C(n55), .D(n56), .Y(n52) );
  INVX1 U32 ( .A(n57), .Y(n55) );
  AOI21X1 U33 ( .A(rollover_value[0]), .B(rollover_value[1]), .C(n58), .Y(n57)
         );
  NAND2X1 U34 ( .A(count_out[1]), .B(n59), .Y(n54) );
  NOR2X1 U35 ( .A(rollover_value[0]), .B(count_out[0]), .Y(n53) );
  AOI21X1 U36 ( .A(rollover_value[2]), .B(n59), .C(n60), .Y(n51) );
  XOR2X1 U37 ( .A(rollover_value[2]), .B(n58), .Y(n49) );
  INVX1 U38 ( .A(n44), .Y(n36) );
  OAI21X1 U39 ( .A(n60), .B(n61), .C(n62), .Y(n44) );
  NAND2X1 U40 ( .A(n47), .B(n63), .Y(n34) );
  NAND2X1 U41 ( .A(rollover_value[4]), .B(n62), .Y(n47) );
  NOR2X1 U42 ( .A(n24), .B(n25), .Y(n22) );
  INVX1 U43 ( .A(n64), .Y(n24) );
  OAI21X1 U44 ( .A(rollover_value[5]), .B(n63), .C(rollover_value[6]), .Y(n64)
         );
  OAI21X1 U45 ( .A(n63), .B(n65), .C(n66), .Y(n4) );
  NOR2X1 U46 ( .A(halt), .B(clear), .Y(n66) );
  OR2X1 U47 ( .A(rollover_value[5]), .B(rollover_value[6]), .Y(n65) );
  INVX1 U48 ( .A(n32), .Y(n63) );
  NOR2X1 U49 ( .A(n62), .B(rollover_value[4]), .Y(n32) );
  NAND2X1 U50 ( .A(n60), .B(n61), .Y(n62) );
  INVX1 U51 ( .A(rollover_value[3]), .Y(n61) );
  NOR2X1 U52 ( .A(n59), .B(rollover_value[2]), .Y(n60) );
  INVX1 U53 ( .A(n58), .Y(n59) );
  NOR2X1 U54 ( .A(rollover_value[0]), .B(rollover_value[1]), .Y(n58) );
  OAI21X1 U55 ( .A(n3), .B(n56), .C(n67), .Y(n21) );
  NAND2X1 U56 ( .A(N32), .B(n68), .Y(n67) );
  INVX1 U57 ( .A(count_out[1]), .Y(n56) );
  OAI21X1 U58 ( .A(n3), .B(n48), .C(n69), .Y(n20) );
  NAND2X1 U59 ( .A(N33), .B(n68), .Y(n69) );
  INVX1 U60 ( .A(count_out[2]), .Y(n48) );
  OAI21X1 U61 ( .A(n3), .B(n45), .C(n70), .Y(n19) );
  NAND2X1 U62 ( .A(N34), .B(n68), .Y(n70) );
  INVX1 U63 ( .A(count_out[3]), .Y(n45) );
  OAI21X1 U64 ( .A(n3), .B(n33), .C(n71), .Y(n18) );
  NAND2X1 U65 ( .A(N35), .B(n68), .Y(n71) );
  INVX1 U66 ( .A(count_out[4]), .Y(n33) );
  OAI21X1 U67 ( .A(n3), .B(n30), .C(n72), .Y(n17) );
  NAND2X1 U68 ( .A(N36), .B(n68), .Y(n72) );
  INVX1 U69 ( .A(count_out[5]), .Y(n30) );
  OAI21X1 U70 ( .A(n3), .B(n25), .C(n73), .Y(n16) );
  NAND2X1 U71 ( .A(N37), .B(n68), .Y(n73) );
  AND2X1 U72 ( .A(n3), .B(n15), .Y(n68) );
  INVX1 U73 ( .A(count_out[6]), .Y(n25) );
  AOI21X1 U74 ( .A(n15), .B(n74), .C(halt), .Y(n3) );
  NAND2X1 U75 ( .A(n75), .B(count_enable), .Y(n74) );
  INVX1 U76 ( .A(rollover_flag), .Y(n75) );
  INVX1 U77 ( .A(clear), .Y(n15) );
endmodule


module usb_controller_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module usb_controller ( clk, n_rst, clk12, tx_packet, tx_packet_data, 
        tx_packet_data_size, CRC, serial_out, prev_parallel, bytecomplete, 
        bytealmostcomplete, bit_stuff_en, eop_en, eop_reset, en, CRC_en, data, 
        enc_en, timer_en, get_tx_packet_data );
  input [1:0] tx_packet;
  input [7:0] tx_packet_data;
  input [6:0] tx_packet_data_size;
  input [15:0] CRC;
  input [7:0] prev_parallel;
  output [7:0] data;
  input clk, n_rst, clk12, serial_out, bytecomplete, bytealmostcomplete,
         bit_stuff_en;
  output eop_en, eop_reset, en, CRC_en, enc_en, timer_en, get_tx_packet_data;
  wire   nxt_eop_en, nxt_eop_reset, nxt_en, nxt_CRC_en, nxt_enc_en,
         nxt_get_tx_packet_data, data_sent, \_1_net_[6] , \_1_net_[5] ,
         \_1_net_[4] , \_1_net_[3] , \_1_net_[2] , \_1_net_[1] , \_1_net_[0] ,
         N75, N76, N78, N79, N81, N82, N85, N86, N90, N91, N92, N93, N94, N95,
         N96, N97, N113, N114, N115, N116, N117, N118, N119, N120, N123, N133,
         N134, N135, N136, N137, N138, N139, N140, N157, N160, N161, N162,
         N163, N164, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, n169, n170, n171, n172, n173, n174, n175, n176, n177, n1,
         n2, n3, n4, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233;
  wire   [3:0] state;
  wire   [3:0] nxt_state;
  wire   [7:0] nxt_data;
  wire   [1:0] stored_packet;
  wire   [15:8] stored_crc;
  assign N169 = CRC[8];
  assign N170 = CRC[9];
  assign N171 = CRC[10];
  assign N172 = CRC[11];
  assign N173 = CRC[12];
  assign N174 = CRC[13];
  assign N175 = CRC[14];
  assign N176 = CRC[15];

  DFFSR get_tx_packet_data_reg ( .D(nxt_get_tx_packet_data), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(get_tx_packet_data) );
  LATCH \stored_packet_reg[0]  ( .CLK(n231), .D(tx_packet[0]), .Q(
        stored_packet[0]) );
  LATCH \nxt_state_reg[3]  ( .CLK(N160), .D(N164), .Q(nxt_state[3]) );
  DFFSR \state_reg[3]  ( .D(nxt_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  DFFSR eop_reset_reg ( .D(nxt_eop_reset), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        eop_reset) );
  LATCH \nxt_state_reg[2]  ( .CLK(N160), .D(N163), .Q(nxt_state[2]) );
  DFFSR \state_reg[2]  ( .D(nxt_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  LATCH \nxt_state_reg[1]  ( .CLK(N160), .D(N162), .Q(nxt_state[1]) );
  DFFSR \state_reg[1]  ( .D(nxt_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  LATCH \nxt_state_reg[0]  ( .CLK(N160), .D(N161), .Q(nxt_state[0]) );
  DFFSR \state_reg[0]  ( .D(nxt_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR timer_en_reg ( .D(n169), .CLK(clk), .R(n_rst), .S(1'b1), .Q(timer_en)
         );
  LATCH \stored_packet_reg[1]  ( .CLK(n231), .D(tx_packet[1]), .Q(
        stored_packet[1]) );
  LATCH nxt_enc_en_reg ( .CLK(n232), .D(n233), .Q(nxt_enc_en) );
  DFFSR enc_en_reg ( .D(nxt_enc_en), .CLK(clk), .R(n_rst), .S(1'b1), .Q(enc_en) );
  DFFSR eop_en_reg ( .D(nxt_eop_en), .CLK(clk), .R(n_rst), .S(1'b1), .Q(eop_en) );
  LATCH nxt_CRC_en_reg ( .CLK(N157), .D(n230), .Q(nxt_CRC_en) );
  DFFSR CRC_en_reg ( .D(nxt_CRC_en), .CLK(clk), .R(n_rst), .S(1'b1), .Q(CRC_en) );
  LATCH \stored_crc_reg[8]  ( .CLK(N168), .D(N169), .Q(stored_crc[8]) );
  LATCH \stored_crc_reg[9]  ( .CLK(N168), .D(N170), .Q(stored_crc[9]) );
  LATCH \stored_crc_reg[10]  ( .CLK(N168), .D(N171), .Q(stored_crc[10]) );
  LATCH \stored_crc_reg[11]  ( .CLK(N168), .D(N172), .Q(stored_crc[11]) );
  LATCH \stored_crc_reg[12]  ( .CLK(N168), .D(N173), .Q(stored_crc[12]) );
  LATCH \stored_crc_reg[13]  ( .CLK(N168), .D(N174), .Q(stored_crc[13]) );
  LATCH \stored_crc_reg[14]  ( .CLK(N168), .D(N175), .Q(stored_crc[14]) );
  LATCH \stored_crc_reg[15]  ( .CLK(N168), .D(N176), .Q(stored_crc[15]) );
  DFFSR \data_reg[7]  ( .D(n177), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[7])
         );
  DFFSR \data_reg[6]  ( .D(n176), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[6])
         );
  DFFSR \data_reg[5]  ( .D(n175), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[5])
         );
  DFFSR \data_reg[4]  ( .D(n174), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[4])
         );
  DFFSR \data_reg[3]  ( .D(n173), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[3])
         );
  DFFSR \data_reg[2]  ( .D(n172), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[2])
         );
  DFFSR \data_reg[1]  ( .D(n171), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[1])
         );
  DFFSR \data_reg[0]  ( .D(n170), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[0])
         );
  LATCH nxt_en_reg ( .CLK(N166), .D(N167), .Q(nxt_en) );
  DFFSR en_reg ( .D(nxt_en), .CLK(clk), .R(n_rst), .S(1'b1), .Q(en) );
  flex_counter3_NUM_CNT_BITS7 X ( .clk(clk), .count_enable(
        nxt_get_tx_packet_data), .rollover_value({\_1_net_[6] , \_1_net_[5] , 
        \_1_net_[4] , \_1_net_[3] , \_1_net_[2] , \_1_net_[1] , \_1_net_[0] }), 
        .clear(1'b0), .n_rst(n_rst), .halt(bit_stuff_en), .rollover_flag(
        data_sent) );
  usb_controller_DW01_inc_0 add_71 ( .A(tx_packet_data_size), .SUM({
        \_1_net_[6] , \_1_net_[5] , \_1_net_[4] , \_1_net_[3] , \_1_net_[2] , 
        \_1_net_[1] , \_1_net_[0] }) );
  OR2X2 U4 ( .A(n233), .B(n102), .Y(n1) );
  OR2X2 U23 ( .A(n233), .B(n96), .Y(n2) );
  INVX2 U24 ( .A(n114), .Y(n149) );
  INVX2 U25 ( .A(n141), .Y(n210) );
  NAND3X1 U26 ( .A(n79), .B(n75), .C(state[1]), .Y(n3) );
  NOR2X1 U27 ( .A(n3), .B(n201), .Y(n67) );
  NOR2X1 U28 ( .A(n3), .B(state[0]), .Y(n65) );
  AOI22X1 U29 ( .A(N123), .B(n67), .C(N86), .D(n65), .Y(n4) );
  OAI21X1 U30 ( .A(n81), .B(n84), .C(n4), .Y(nxt_get_tx_packet_data) );
  NOR2X1 U31 ( .A(state[3]), .B(state[1]), .Y(n25) );
  NAND3X1 U32 ( .A(n75), .B(n201), .C(n25), .Y(n24) );
  NOR2X1 U33 ( .A(n201), .B(n77), .Y(n57) );
  NAND3X1 U34 ( .A(n57), .B(n75), .C(n229), .Y(n26) );
  AOI21X1 U35 ( .A(N75), .B(n76), .C(n82), .Y(n32) );
  NAND3X1 U36 ( .A(n79), .B(n201), .C(state[2]), .Y(n27) );
  AOI22X1 U37 ( .A(N90), .B(n65), .C(N133), .D(n80), .Y(n31) );
  NOR2X1 U38 ( .A(n79), .B(n75), .Y(n66) );
  AOI22X1 U39 ( .A(N113), .B(n67), .C(data[0]), .D(n66), .Y(n29) );
  NOR2X1 U40 ( .A(n79), .B(state[2]), .Y(n69) );
  NOR2X1 U41 ( .A(n78), .B(n75), .Y(n68) );
  AOI22X1 U42 ( .A(CRC[0]), .B(n69), .C(stored_crc[8]), .D(n68), .Y(n28) );
  AND2X1 U43 ( .A(n29), .B(n28), .Y(n30) );
  NAND3X1 U44 ( .A(n32), .B(n31), .C(n30), .Y(nxt_data[0]) );
  AOI22X1 U45 ( .A(N114), .B(n67), .C(data[1]), .D(n66), .Y(n36) );
  AOI22X1 U46 ( .A(CRC[1]), .B(n69), .C(stored_crc[9]), .D(n68), .Y(n35) );
  AOI22X1 U47 ( .A(N91), .B(n65), .C(N134), .D(n80), .Y(n33) );
  AOI21X1 U48 ( .A(N76), .B(n76), .C(n88), .Y(n34) );
  NAND3X1 U49 ( .A(n36), .B(n35), .C(n34), .Y(nxt_data[1]) );
  AOI22X1 U50 ( .A(data[2]), .B(n66), .C(N92), .D(n65), .Y(n42) );
  NAND3X1 U51 ( .A(state[0]), .B(n79), .C(N115), .Y(n37) );
  OAI21X1 U52 ( .A(n77), .B(n1), .C(n37), .Y(n39) );
  OAI21X1 U53 ( .A(n79), .B(n86), .C(n78), .Y(n38) );
  OAI21X1 U54 ( .A(n39), .B(n38), .C(n75), .Y(n41) );
  AOI22X1 U55 ( .A(N135), .B(n80), .C(stored_crc[10]), .D(n57), .Y(n40) );
  NAND3X1 U56 ( .A(n42), .B(n41), .C(n40), .Y(nxt_data[2]) );
  NAND3X1 U57 ( .A(n57), .B(n75), .C(N85), .Y(n43) );
  AOI21X1 U58 ( .A(N78), .B(n76), .C(n83), .Y(n48) );
  AOI22X1 U59 ( .A(N93), .B(n65), .C(N136), .D(n80), .Y(n47) );
  AOI22X1 U60 ( .A(N116), .B(n67), .C(data[3]), .D(n66), .Y(n45) );
  AOI22X1 U61 ( .A(CRC[3]), .B(n69), .C(stored_crc[11]), .D(n68), .Y(n44) );
  AND2X1 U62 ( .A(n45), .B(n44), .Y(n46) );
  NAND3X1 U63 ( .A(n48), .B(n47), .C(n46), .Y(nxt_data[3]) );
  AOI21X1 U64 ( .A(N79), .B(n76), .C(n83), .Y(n53) );
  AOI22X1 U65 ( .A(N94), .B(n65), .C(N137), .D(n80), .Y(n52) );
  AOI22X1 U66 ( .A(N117), .B(n67), .C(data[4]), .D(n66), .Y(n50) );
  AOI22X1 U67 ( .A(CRC[4]), .B(n69), .C(stored_crc[12]), .D(n68), .Y(n49) );
  AND2X1 U68 ( .A(n50), .B(n49), .Y(n51) );
  NAND3X1 U69 ( .A(n53), .B(n52), .C(n51), .Y(nxt_data[4]) );
  AOI22X1 U70 ( .A(data[5]), .B(n66), .C(N95), .D(n65), .Y(n60) );
  NAND3X1 U71 ( .A(state[0]), .B(n79), .C(N118), .Y(n54) );
  OAI21X1 U72 ( .A(n77), .B(n2), .C(n54), .Y(n56) );
  OAI21X1 U73 ( .A(n79), .B(n85), .C(n78), .Y(n55) );
  OAI21X1 U74 ( .A(n56), .B(n55), .C(n75), .Y(n59) );
  AOI22X1 U75 ( .A(N138), .B(n80), .C(stored_crc[13]), .D(n57), .Y(n58) );
  NAND3X1 U76 ( .A(n60), .B(n59), .C(n58), .Y(nxt_data[5]) );
  AOI22X1 U77 ( .A(N119), .B(n67), .C(data[6]), .D(n66), .Y(n64) );
  AOI22X1 U78 ( .A(CRC[6]), .B(n69), .C(stored_crc[14]), .D(n68), .Y(n63) );
  AOI22X1 U79 ( .A(N96), .B(n65), .C(N139), .D(n80), .Y(n61) );
  AOI21X1 U80 ( .A(N81), .B(n76), .C(n87), .Y(n62) );
  NAND3X1 U81 ( .A(n64), .B(n63), .C(n62), .Y(nxt_data[6]) );
  AOI21X1 U82 ( .A(N82), .B(n76), .C(n82), .Y(n74) );
  AOI22X1 U83 ( .A(N97), .B(n65), .C(N140), .D(n80), .Y(n73) );
  AOI22X1 U84 ( .A(N120), .B(n67), .C(data[7]), .D(n66), .Y(n71) );
  AOI22X1 U85 ( .A(CRC[7]), .B(n69), .C(stored_crc[15]), .D(n68), .Y(n70) );
  AND2X1 U86 ( .A(n71), .B(n70), .Y(n72) );
  NAND3X1 U87 ( .A(n74), .B(n73), .C(n72), .Y(nxt_data[7]) );
  INVX2 U88 ( .A(state[2]), .Y(n75) );
  INVX2 U89 ( .A(n24), .Y(n76) );
  INVX2 U90 ( .A(n25), .Y(n77) );
  INVX2 U91 ( .A(n57), .Y(n78) );
  INVX2 U92 ( .A(state[3]), .Y(n79) );
  INVX2 U93 ( .A(n27), .Y(n80) );
  INVX2 U94 ( .A(n3), .Y(n81) );
  INVX2 U95 ( .A(n26), .Y(n82) );
  INVX2 U96 ( .A(n43), .Y(n83) );
  INVX2 U97 ( .A(get_tx_packet_data), .Y(n84) );
  INVX2 U98 ( .A(CRC[5]), .Y(n85) );
  INVX2 U99 ( .A(CRC[2]), .Y(n86) );
  INVX2 U100 ( .A(n61), .Y(n87) );
  INVX2 U101 ( .A(n33), .Y(n88) );
  AND2X1 U102 ( .A(n89), .B(clk12), .Y(nxt_eop_reset) );
  MUX2X1 U103 ( .B(n90), .A(n91), .S(n92), .Y(n177) );
  INVX1 U104 ( .A(nxt_data[7]), .Y(n90) );
  MUX2X1 U105 ( .B(n93), .A(n94), .S(n92), .Y(n176) );
  INVX1 U106 ( .A(nxt_data[6]), .Y(n93) );
  MUX2X1 U107 ( .B(n95), .A(n96), .S(n92), .Y(n175) );
  INVX1 U108 ( .A(nxt_data[5]), .Y(n95) );
  MUX2X1 U109 ( .B(n97), .A(n98), .S(n92), .Y(n174) );
  INVX1 U110 ( .A(nxt_data[4]), .Y(n97) );
  MUX2X1 U111 ( .B(n99), .A(n100), .S(n92), .Y(n173) );
  INVX1 U112 ( .A(nxt_data[3]), .Y(n99) );
  MUX2X1 U113 ( .B(n101), .A(n102), .S(n92), .Y(n172) );
  INVX1 U114 ( .A(nxt_data[2]), .Y(n101) );
  MUX2X1 U115 ( .B(n103), .A(n104), .S(n92), .Y(n171) );
  INVX1 U116 ( .A(nxt_data[1]), .Y(n103) );
  MUX2X1 U117 ( .B(n105), .A(n106), .S(n92), .Y(n170) );
  NAND3X1 U118 ( .A(n107), .B(n108), .C(n109), .Y(n92) );
  NOR2X1 U119 ( .A(n110), .B(n111), .Y(n109) );
  OAI21X1 U120 ( .A(n112), .B(n113), .C(n114), .Y(n108) );
  INVX1 U121 ( .A(nxt_data[0]), .Y(n105) );
  NAND2X1 U122 ( .A(n115), .B(n116), .Y(n169) );
  OAI21X1 U123 ( .A(n117), .B(n118), .C(timer_en), .Y(n116) );
  INVX1 U124 ( .A(n119), .Y(N97) );
  AOI22X1 U125 ( .A(N85), .B(tx_packet_data[7]), .C(data[7]), .D(n229), .Y(
        n119) );
  INVX1 U126 ( .A(n120), .Y(N96) );
  AOI22X1 U127 ( .A(N85), .B(tx_packet_data[6]), .C(data[6]), .D(n229), .Y(
        n120) );
  INVX1 U128 ( .A(n121), .Y(N95) );
  AOI22X1 U129 ( .A(N85), .B(tx_packet_data[5]), .C(data[5]), .D(n229), .Y(
        n121) );
  INVX1 U130 ( .A(n122), .Y(N94) );
  AOI22X1 U131 ( .A(N85), .B(tx_packet_data[4]), .C(data[4]), .D(n229), .Y(
        n122) );
  INVX1 U132 ( .A(n123), .Y(N93) );
  AOI22X1 U133 ( .A(N85), .B(tx_packet_data[3]), .C(data[3]), .D(n229), .Y(
        n123) );
  INVX1 U134 ( .A(n124), .Y(N92) );
  AOI22X1 U135 ( .A(N85), .B(tx_packet_data[2]), .C(data[2]), .D(n229), .Y(
        n124) );
  INVX1 U136 ( .A(n125), .Y(N91) );
  AOI22X1 U137 ( .A(N85), .B(tx_packet_data[1]), .C(data[1]), .D(n229), .Y(
        n125) );
  INVX1 U138 ( .A(n126), .Y(N90) );
  AOI22X1 U139 ( .A(N85), .B(tx_packet_data[0]), .C(data[0]), .D(n229), .Y(
        n126) );
  INVX1 U140 ( .A(n127), .Y(N86) );
  NAND2X1 U141 ( .A(n128), .B(n91), .Y(N82) );
  NOR2X1 U142 ( .A(n233), .B(n94), .Y(N81) );
  NOR2X1 U143 ( .A(n233), .B(n98), .Y(N79) );
  NOR2X1 U144 ( .A(n233), .B(n100), .Y(N78) );
  NOR2X1 U145 ( .A(n233), .B(n104), .Y(N76) );
  NOR2X1 U146 ( .A(n233), .B(n106), .Y(N75) );
  OR2X1 U147 ( .A(n129), .B(n130), .Y(N167) );
  OAI21X1 U148 ( .A(n131), .B(n114), .C(n132), .Y(n130) );
  INVX1 U149 ( .A(n113), .Y(n131) );
  NAND2X1 U150 ( .A(n133), .B(n134), .Y(n113) );
  OAI21X1 U151 ( .A(n135), .B(n136), .C(n137), .Y(n129) );
  NOR2X1 U152 ( .A(n231), .B(n138), .Y(n137) );
  OR2X1 U153 ( .A(n139), .B(n140), .Y(N166) );
  OAI21X1 U154 ( .A(n141), .B(n142), .C(n143), .Y(n140) );
  OAI22X1 U155 ( .A(n117), .B(n118), .C(n144), .D(n134), .Y(n139) );
  NAND3X1 U156 ( .A(n145), .B(n146), .C(n147), .Y(N164) );
  MUX2X1 U157 ( .B(n112), .A(n148), .S(n149), .Y(n147) );
  OAI21X1 U158 ( .A(n134), .B(n150), .C(n151), .Y(n148) );
  NOR2X1 U159 ( .A(n110), .B(n152), .Y(n151) );
  AND2X1 U160 ( .A(n153), .B(n230), .Y(n110) );
  XOR2X1 U161 ( .A(stored_packet[0]), .B(n154), .Y(n153) );
  INVX1 U162 ( .A(n229), .Y(n150) );
  NOR2X1 U163 ( .A(n154), .B(stored_packet[0]), .Y(n229) );
  INVX1 U164 ( .A(n155), .Y(n112) );
  INVX1 U165 ( .A(nxt_eop_en), .Y(n146) );
  OAI21X1 U166 ( .A(n156), .B(n114), .C(n157), .Y(nxt_eop_en) );
  NAND3X1 U167 ( .A(n158), .B(n159), .C(n160), .Y(N163) );
  AOI22X1 U168 ( .A(n161), .B(n114), .C(bit_stuff_en), .D(n162), .Y(n160) );
  NAND2X1 U169 ( .A(n163), .B(n142), .Y(n161) );
  INVX1 U170 ( .A(N168), .Y(n159) );
  NAND3X1 U171 ( .A(n164), .B(n165), .C(n166), .Y(N162) );
  AOI21X1 U172 ( .A(n167), .B(n138), .C(n168), .Y(n166) );
  OAI21X1 U173 ( .A(n144), .B(n134), .C(n178), .Y(n168) );
  NOR2X1 U174 ( .A(n114), .B(N85), .Y(n144) );
  INVX1 U175 ( .A(n179), .Y(n165) );
  MUX2X1 U176 ( .B(n163), .A(n180), .S(n149), .Y(n179) );
  INVX1 U177 ( .A(n181), .Y(n164) );
  OAI21X1 U178 ( .A(n157), .B(n117), .C(n145), .Y(n181) );
  INVX1 U179 ( .A(n182), .Y(n145) );
  OAI21X1 U180 ( .A(clk12), .B(n118), .C(n183), .Y(n182) );
  INVX1 U181 ( .A(clk12), .Y(n117) );
  NAND3X1 U182 ( .A(n184), .B(n178), .C(n185), .Y(N161) );
  NOR2X1 U183 ( .A(n186), .B(n187), .Y(n185) );
  MUX2X1 U184 ( .B(n188), .A(n183), .S(clk12), .Y(n187) );
  AND2X1 U185 ( .A(n118), .B(n157), .Y(n188) );
  MUX2X1 U186 ( .B(n133), .A(n189), .S(n149), .Y(n186) );
  AND2X1 U187 ( .A(n156), .B(n190), .Y(n189) );
  AND2X1 U188 ( .A(n180), .B(n191), .Y(n133) );
  NOR2X1 U189 ( .A(n231), .B(N168), .Y(n184) );
  OAI21X1 U190 ( .A(n141), .B(n142), .C(n132), .Y(N168) );
  INVX1 U191 ( .A(n192), .Y(n132) );
  INVX1 U192 ( .A(n115), .Y(n231) );
  NAND2X1 U193 ( .A(n232), .B(n233), .Y(n115) );
  INVX1 U194 ( .A(n128), .Y(n233) );
  NOR2X1 U195 ( .A(tx_packet[1]), .B(tx_packet[0]), .Y(n128) );
  INVX1 U196 ( .A(n193), .Y(n232) );
  NAND3X1 U197 ( .A(n143), .B(n107), .C(n190), .Y(N160) );
  NOR2X1 U198 ( .A(n230), .B(n138), .Y(n190) );
  INVX1 U199 ( .A(n142), .Y(n138) );
  NAND3X1 U200 ( .A(n194), .B(n195), .C(state[2]), .Y(n142) );
  INVX1 U201 ( .A(n134), .Y(n230) );
  NOR2X1 U202 ( .A(n89), .B(n196), .Y(n107) );
  OAI21X1 U203 ( .A(n197), .B(n198), .C(n157), .Y(n196) );
  NAND3X1 U204 ( .A(state[3]), .B(state[0]), .C(n199), .Y(n157) );
  NAND2X1 U205 ( .A(n183), .B(n118), .Y(n89) );
  NAND3X1 U206 ( .A(state[0]), .B(n200), .C(state[3]), .Y(n118) );
  NAND3X1 U207 ( .A(n200), .B(n201), .C(state[3]), .Y(n183) );
  NOR2X1 U208 ( .A(n202), .B(n203), .Y(n143) );
  NAND3X1 U209 ( .A(n180), .B(n155), .C(n163), .Y(n203) );
  NOR2X1 U210 ( .A(n111), .B(n152), .Y(n163) );
  INVX1 U211 ( .A(n191), .Y(n152) );
  NAND3X1 U212 ( .A(state[2]), .B(state[1]), .C(n204), .Y(n191) );
  INVX1 U213 ( .A(n156), .Y(n111) );
  NAND3X1 U214 ( .A(n194), .B(state[1]), .C(state[2]), .Y(n156) );
  AOI21X1 U215 ( .A(n199), .B(n204), .C(n205), .Y(n180) );
  INVX1 U216 ( .A(n158), .Y(n205) );
  NAND3X1 U217 ( .A(state[2]), .B(n195), .C(n204), .Y(n158) );
  NAND3X1 U218 ( .A(n206), .B(n178), .C(n193), .Y(n202) );
  OAI21X1 U219 ( .A(n207), .B(n167), .C(n208), .Y(n178) );
  AOI21X1 U220 ( .A(bytealmostcomplete), .B(clk12), .C(n149), .Y(n207) );
  OR2X1 U221 ( .A(n192), .B(n209), .Y(N157) );
  OAI21X1 U222 ( .A(n134), .B(n127), .C(n193), .Y(n209) );
  NAND2X1 U223 ( .A(n199), .B(n194), .Y(n193) );
  NAND3X1 U224 ( .A(N85), .B(clk12), .C(bytealmostcomplete), .Y(n127) );
  AND2X1 U225 ( .A(stored_packet[0]), .B(n154), .Y(N85) );
  INVX1 U226 ( .A(stored_packet[1]), .Y(n154) );
  NAND2X1 U227 ( .A(n194), .B(n200), .Y(n134) );
  NOR2X1 U228 ( .A(state[3]), .B(state[0]), .Y(n194) );
  OAI21X1 U229 ( .A(n114), .B(n155), .C(n206), .Y(n192) );
  NAND2X1 U230 ( .A(n208), .B(n210), .Y(n206) );
  INVX1 U231 ( .A(n135), .Y(n208) );
  NAND2X1 U232 ( .A(n162), .B(n198), .Y(n135) );
  INVX1 U233 ( .A(n197), .Y(n162) );
  NAND2X1 U234 ( .A(n204), .B(n200), .Y(n197) );
  NOR2X1 U235 ( .A(n195), .B(state[2]), .Y(n200) );
  INVX1 U236 ( .A(state[1]), .Y(n195) );
  NOR2X1 U237 ( .A(n201), .B(state[3]), .Y(n204) );
  NAND3X1 U238 ( .A(state[3]), .B(n201), .C(n199), .Y(n155) );
  NOR2X1 U239 ( .A(state[1]), .B(state[2]), .Y(n199) );
  INVX1 U240 ( .A(state[0]), .Y(n201) );
  INVX1 U241 ( .A(n211), .Y(N140) );
  MUX2X1 U242 ( .B(data[7]), .A(CRC[7]), .S(n210), .Y(n211) );
  INVX1 U243 ( .A(n212), .Y(N139) );
  MUX2X1 U244 ( .B(data[6]), .A(CRC[6]), .S(n210), .Y(n212) );
  INVX1 U245 ( .A(n213), .Y(N138) );
  MUX2X1 U246 ( .B(data[5]), .A(CRC[5]), .S(n210), .Y(n213) );
  INVX1 U247 ( .A(n214), .Y(N137) );
  MUX2X1 U248 ( .B(data[4]), .A(CRC[4]), .S(n210), .Y(n214) );
  INVX1 U249 ( .A(n215), .Y(N136) );
  MUX2X1 U250 ( .B(data[3]), .A(CRC[3]), .S(n210), .Y(n215) );
  INVX1 U251 ( .A(n216), .Y(N135) );
  MUX2X1 U252 ( .B(data[2]), .A(CRC[2]), .S(n210), .Y(n216) );
  INVX1 U253 ( .A(n217), .Y(N134) );
  MUX2X1 U254 ( .B(data[1]), .A(CRC[1]), .S(n210), .Y(n217) );
  INVX1 U255 ( .A(n218), .Y(N133) );
  MUX2X1 U256 ( .B(data[0]), .A(CRC[0]), .S(n210), .Y(n218) );
  NOR2X1 U257 ( .A(n219), .B(n220), .Y(N123) );
  NAND2X1 U258 ( .A(bytealmostcomplete), .B(clk12), .Y(n220) );
  NAND2X1 U259 ( .A(n114), .B(n198), .Y(n219) );
  INVX1 U260 ( .A(bit_stuff_en), .Y(n198) );
  OAI21X1 U261 ( .A(n149), .B(n91), .C(n221), .Y(N120) );
  AOI22X1 U262 ( .A(n167), .B(tx_packet_data[7]), .C(CRC[7]), .D(n210), .Y(
        n221) );
  INVX1 U263 ( .A(data[7]), .Y(n91) );
  OAI21X1 U264 ( .A(n149), .B(n94), .C(n222), .Y(N119) );
  AOI22X1 U265 ( .A(n167), .B(tx_packet_data[6]), .C(CRC[6]), .D(n210), .Y(
        n222) );
  INVX1 U266 ( .A(data[6]), .Y(n94) );
  OAI21X1 U267 ( .A(n149), .B(n96), .C(n223), .Y(N118) );
  AOI22X1 U268 ( .A(n167), .B(tx_packet_data[5]), .C(CRC[5]), .D(n210), .Y(
        n223) );
  INVX1 U269 ( .A(data[5]), .Y(n96) );
  OAI21X1 U270 ( .A(n149), .B(n98), .C(n224), .Y(N117) );
  AOI22X1 U271 ( .A(n167), .B(tx_packet_data[4]), .C(CRC[4]), .D(n210), .Y(
        n224) );
  INVX1 U272 ( .A(data[4]), .Y(n98) );
  OAI21X1 U273 ( .A(n149), .B(n100), .C(n225), .Y(N116) );
  AOI22X1 U274 ( .A(n167), .B(tx_packet_data[3]), .C(CRC[3]), .D(n210), .Y(
        n225) );
  INVX1 U275 ( .A(data[3]), .Y(n100) );
  OAI21X1 U276 ( .A(n149), .B(n102), .C(n226), .Y(N115) );
  AOI22X1 U277 ( .A(n167), .B(tx_packet_data[2]), .C(CRC[2]), .D(n210), .Y(
        n226) );
  INVX1 U278 ( .A(data[2]), .Y(n102) );
  OAI21X1 U279 ( .A(n149), .B(n104), .C(n227), .Y(N114) );
  AOI22X1 U280 ( .A(n167), .B(tx_packet_data[1]), .C(CRC[1]), .D(n210), .Y(
        n227) );
  INVX1 U281 ( .A(data[1]), .Y(n104) );
  OAI21X1 U282 ( .A(n149), .B(n106), .C(n228), .Y(N113) );
  AOI22X1 U283 ( .A(n167), .B(tx_packet_data[0]), .C(CRC[0]), .D(n210), .Y(
        n228) );
  INVX1 U284 ( .A(n136), .Y(n167) );
  NAND2X1 U285 ( .A(n149), .B(n141), .Y(n136) );
  NAND2X1 U286 ( .A(data_sent), .B(n149), .Y(n141) );
  INVX1 U287 ( .A(data[0]), .Y(n106) );
  NAND2X1 U288 ( .A(bytecomplete), .B(clk12), .Y(n114) );
endmodule


module flex_counter4_NUM_CNT_BITS4 ( clk, count_enable, rollover_value, clear, 
        clk12, n_rst, halt, count_out, rollover_flag );
  input [3:0] rollover_value;
  output [3:0] count_out;
  input clk, count_enable, clear, clk12, n_rst, halt;
  output rollover_flag;
  wire   N47, n19, n41, n42, n43, n44, n1, n2, n3, n4, n5, n6, n11, n12, n13,
         n14, n15, n16, n17, n18, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  DFFSR \count_out_reg[0]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  NOR2X1 U20 ( .A(rollover_flag), .B(n19), .Y(N47) );
  MUX2X1 U7 ( .B(n1), .A(n2), .S(n3), .Y(n44) );
  OAI21X1 U8 ( .A(n4), .B(rollover_flag), .C(n5), .Y(n1) );
  INVX1 U9 ( .A(n6), .Y(rollover_flag) );
  NAND3X1 U10 ( .A(count_enable), .B(clk12), .C(n11), .Y(n6) );
  AND2X1 U11 ( .A(n5), .B(N47), .Y(n11) );
  AND2X1 U12 ( .A(n2), .B(n19), .Y(n4) );
  MUX2X1 U13 ( .B(n12), .A(n13), .S(count_out[1]), .Y(n43) );
  NAND2X1 U14 ( .A(n14), .B(count_out[0]), .Y(n12) );
  INVX1 U15 ( .A(n15), .Y(n42) );
  MUX2X1 U16 ( .B(n16), .A(n17), .S(count_out[2]), .Y(n15) );
  MUX2X1 U17 ( .B(n18), .A(n20), .S(count_out[3]), .Y(n41) );
  AOI21X1 U18 ( .A(n14), .B(n21), .C(n17), .Y(n20) );
  OAI21X1 U19 ( .A(count_out[1]), .B(n22), .C(n13), .Y(n17) );
  AOI21X1 U21 ( .A(n2), .B(n14), .C(n3), .Y(n13) );
  INVX1 U22 ( .A(n14), .Y(n22) );
  NAND2X1 U23 ( .A(n16), .B(count_out[2]), .Y(n18) );
  INVX1 U24 ( .A(n23), .Y(n16) );
  NAND3X1 U25 ( .A(count_out[0]), .B(count_out[1]), .C(n14), .Y(n23) );
  NOR2X1 U26 ( .A(n3), .B(n24), .Y(n14) );
  OAI21X1 U27 ( .A(N47), .B(n19), .C(n5), .Y(n24) );
  INVX1 U28 ( .A(clear), .Y(n5) );
  OAI21X1 U29 ( .A(count_enable), .B(clear), .C(clk12), .Y(n3) );
  NAND3X1 U30 ( .A(n25), .B(n26), .C(n27), .Y(n19) );
  AND2X1 U31 ( .A(n28), .B(n29), .Y(n27) );
  OAI21X1 U32 ( .A(n30), .B(n31), .C(n32), .Y(n29) );
  XOR2X1 U33 ( .A(n33), .B(count_out[3]), .Y(n28) );
  OAI21X1 U34 ( .A(rollover_value[2]), .B(n34), .C(rollover_value[3]), .Y(n33)
         );
  INVX1 U35 ( .A(n32), .Y(n34) );
  MUX2X1 U36 ( .B(n35), .A(n36), .S(n32), .Y(n26) );
  NOR2X1 U37 ( .A(rollover_value[0]), .B(rollover_value[1]), .Y(n32) );
  NOR2X1 U38 ( .A(rollover_value[3]), .B(rollover_value[2]), .Y(n36) );
  OAI21X1 U39 ( .A(n37), .B(n31), .C(n30), .Y(n35) );
  XOR2X1 U40 ( .A(n21), .B(rollover_value[2]), .Y(n30) );
  INVX1 U41 ( .A(count_out[2]), .Y(n21) );
  INVX1 U42 ( .A(count_out[1]), .Y(n31) );
  AND2X1 U43 ( .A(rollover_value[1]), .B(rollover_value[0]), .Y(n37) );
  MUX2X1 U44 ( .B(n2), .A(n38), .S(rollover_value[0]), .Y(n25) );
  OAI21X1 U45 ( .A(count_out[1]), .B(n39), .C(n2), .Y(n38) );
  INVX1 U46 ( .A(rollover_value[1]), .Y(n39) );
  INVX1 U47 ( .A(count_out[0]), .Y(n2) );
endmodule


module usb_bit_stuffer ( clk, n_rst, clk12, serial_in, bit_stuff_en );
  input clk, n_rst, clk12, serial_in;
  output bit_stuff_en;
  wire   n1;

  flex_counter4_NUM_CNT_BITS4 Y ( .clk(clk), .count_enable(serial_in), 
        .rollover_value({1'b0, 1'b1, 1'b1, 1'b1}), .clear(n1), .clk12(clk12), 
        .n_rst(n_rst), .halt(1'b0), .rollover_flag(bit_stuff_en) );
  INVX1 U3 ( .A(serial_in), .Y(n1) );
endmodule


module flex_pts_sr_8_0 ( clk, n_rst, shift_enable, load_enable, halt, 
        parallel_in, serial_out, parallel_out );
  input [7:0] parallel_in;
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, load_enable, halt;
  output serial_out;
  wire   n29, n30, n31, n32, n33, n34, n35, n36, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n37;
  assign parallel_out[7] = 1'b0;

  DFFSR \parallel_out_reg[6]  ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n32), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[0]) );
  DFFSR serial_out_reg ( .D(n29), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        serial_out) );
  OAI21X1 U11 ( .A(n9), .B(n10), .C(n11), .Y(n36) );
  AOI22X1 U12 ( .A(parallel_in[2]), .B(n12), .C(parallel_out[2]), .D(n13), .Y(
        n11) );
  INVX1 U13 ( .A(parallel_out[1]), .Y(n10) );
  OAI21X1 U14 ( .A(n9), .B(n14), .C(n15), .Y(n35) );
  AOI22X1 U15 ( .A(parallel_in[3]), .B(n12), .C(parallel_out[3]), .D(n13), .Y(
        n15) );
  INVX1 U16 ( .A(parallel_out[2]), .Y(n14) );
  OAI21X1 U17 ( .A(n9), .B(n16), .C(n17), .Y(n34) );
  AOI22X1 U18 ( .A(parallel_in[4]), .B(n12), .C(parallel_out[4]), .D(n13), .Y(
        n17) );
  INVX1 U19 ( .A(parallel_out[3]), .Y(n16) );
  OAI21X1 U20 ( .A(n9), .B(n18), .C(n19), .Y(n33) );
  AOI22X1 U21 ( .A(parallel_in[5]), .B(n12), .C(parallel_out[5]), .D(n13), .Y(
        n19) );
  INVX1 U22 ( .A(parallel_out[4]), .Y(n18) );
  OAI21X1 U23 ( .A(n9), .B(n20), .C(n21), .Y(n32) );
  AOI22X1 U24 ( .A(parallel_in[6]), .B(n12), .C(parallel_out[6]), .D(n13), .Y(
        n21) );
  INVX1 U25 ( .A(parallel_out[5]), .Y(n20) );
  OAI21X1 U26 ( .A(n9), .B(n22), .C(n23), .Y(n31) );
  NAND2X1 U27 ( .A(parallel_in[7]), .B(n12), .Y(n23) );
  INVX1 U28 ( .A(parallel_out[6]), .Y(n22) );
  OAI21X1 U29 ( .A(n9), .B(n24), .C(n25), .Y(n30) );
  AOI22X1 U30 ( .A(parallel_in[1]), .B(n12), .C(parallel_out[1]), .D(n13), .Y(
        n25) );
  INVX1 U31 ( .A(parallel_out[0]), .Y(n24) );
  OAI21X1 U32 ( .A(n9), .B(n26), .C(n27), .Y(n29) );
  AOI22X1 U33 ( .A(parallel_in[0]), .B(n12), .C(parallel_out[0]), .D(n13), .Y(
        n27) );
  AND2X1 U34 ( .A(n9), .B(n28), .Y(n13) );
  AND2X1 U35 ( .A(load_enable), .B(n9), .Y(n12) );
  INVX1 U36 ( .A(serial_out), .Y(n26) );
  AOI21X1 U37 ( .A(n28), .B(n37), .C(halt), .Y(n9) );
  INVX1 U38 ( .A(shift_enable), .Y(n37) );
  INVX1 U39 ( .A(load_enable), .Y(n28) );
endmodule


module usb_pts ( clk, n_rst, clk12, data, en, bit_stuff_en, serial_data, 
        prev_parallel );
  input [7:0] data;
  output [7:0] prev_parallel;
  input clk, n_rst, clk12, en, bit_stuff_en;
  output serial_data;

  wire   SYNOPSYS_UNCONNECTED__0;
  assign prev_parallel[7] = 1'b0;

  flex_pts_sr_8_0 A ( .clk(clk), .n_rst(n_rst), .shift_enable(clk12), 
        .load_enable(en), .halt(bit_stuff_en), .parallel_in(data), 
        .serial_out(serial_data), .parallel_out({SYNOPSYS_UNCONNECTED__0, 
        prev_parallel[6:0]}) );
endmodule


module usb_encoder ( clk, n_rst, clk12, serial_out, enc_en, eop_en, eop_reset, 
        bit_stuff_en, bytecomplete, dminus_out, dplus_out );
  input clk, n_rst, clk12, serial_out, enc_en, eop_en, eop_reset, bit_stuff_en,
         bytecomplete;
  output dminus_out, dplus_out;
  wire   n16, n17, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  DFFSR dplus_out_reg ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(dplus_out)
         );
  DFFSR dminus_out_reg ( .D(n16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dminus_out) );
  MUX2X1 U5 ( .B(n3), .A(n4), .S(n5), .Y(n17) );
  AOI22X1 U6 ( .A(n6), .B(n7), .C(bit_stuff_en), .D(n3), .Y(n4) );
  OAI21X1 U7 ( .A(bit_stuff_en), .B(n8), .C(dplus_out), .Y(n6) );
  INVX1 U8 ( .A(dplus_out), .Y(n3) );
  MUX2X1 U9 ( .B(n9), .A(n5), .S(dminus_out), .Y(n16) );
  NAND2X1 U10 ( .A(n5), .B(n10), .Y(n9) );
  OAI21X1 U11 ( .A(eop_reset), .B(eop_en), .C(n11), .Y(n10) );
  INVX1 U12 ( .A(n12), .Y(n5) );
  OAI21X1 U13 ( .A(n13), .B(n14), .C(clk12), .Y(n12) );
  NAND2X1 U14 ( .A(serial_out), .B(enc_en), .Y(n14) );
  NAND3X1 U15 ( .A(n7), .B(n8), .C(n11), .Y(n13) );
  INVX1 U16 ( .A(bit_stuff_en), .Y(n11) );
  INVX1 U17 ( .A(eop_reset), .Y(n8) );
  INVX1 U18 ( .A(eop_en), .Y(n7) );
endmodule


module CDL_CRC_16 ( clk, n_rst, clk12, input_data, reset_crc, inverted_crc );
  output [15:0] inverted_crc;
  input clk, n_rst, clk12, input_data, reset_crc;
  wire   STATE, n14, n16, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36,
         n38, n40, n42, n44, n46, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11
;
  wire   [15:0] crc;

  DFFSR STATE_reg ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(STATE) );
  DFFSR \crc_reg[1]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[1]) );
  DFFSR \crc_reg[2]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[2]) );
  DFFSR \crc_reg[3]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[3]) );
  DFFSR \crc_reg[4]  ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[4]) );
  DFFSR \crc_reg[5]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[5]) );
  DFFSR \crc_reg[6]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[6]) );
  DFFSR \crc_reg[7]  ( .D(n32), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[7]) );
  DFFSR \crc_reg[8]  ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[8]) );
  DFFSR \crc_reg[9]  ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[9]) );
  DFFSR \crc_reg[10]  ( .D(n26), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[10])
         );
  DFFSR \crc_reg[11]  ( .D(n24), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[11])
         );
  DFFSR \crc_reg[12]  ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[12])
         );
  DFFSR \crc_reg[13]  ( .D(n20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[13])
         );
  DFFSR \crc_reg[14]  ( .D(n18), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[14])
         );
  DFFSR \crc_reg[15]  ( .D(n16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[15])
         );
  DFFSR \crc_reg[0]  ( .D(n14), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc[0]) );
  BUFX2 U2 ( .A(n3), .Y(n1) );
  MUX2X1 U3 ( .B(n2), .A(reset_crc), .S(clk12), .Y(n46) );
  OAI22X1 U4 ( .A(clk12), .B(inverted_crc[1]), .C(inverted_crc[0]), .D(n1), 
        .Y(n44) );
  OAI21X1 U5 ( .A(clk12), .B(inverted_crc[2]), .C(n4), .Y(n42) );
  MUX2X1 U6 ( .B(n5), .A(n6), .S(inverted_crc[1]), .Y(n4) );
  INVX1 U7 ( .A(crc[1]), .Y(inverted_crc[1]) );
  OAI22X1 U8 ( .A(clk12), .B(inverted_crc[3]), .C(inverted_crc[2]), .D(n1), 
        .Y(n40) );
  INVX1 U9 ( .A(crc[2]), .Y(inverted_crc[2]) );
  OAI22X1 U10 ( .A(clk12), .B(inverted_crc[4]), .C(inverted_crc[3]), .D(n1), 
        .Y(n38) );
  INVX1 U11 ( .A(crc[3]), .Y(inverted_crc[3]) );
  OAI21X1 U12 ( .A(clk12), .B(inverted_crc[5]), .C(n7), .Y(n36) );
  MUX2X1 U13 ( .B(n5), .A(n6), .S(inverted_crc[4]), .Y(n7) );
  INVX1 U14 ( .A(crc[4]), .Y(inverted_crc[4]) );
  OAI22X1 U15 ( .A(clk12), .B(inverted_crc[6]), .C(inverted_crc[5]), .D(n1), 
        .Y(n34) );
  INVX1 U16 ( .A(crc[5]), .Y(inverted_crc[5]) );
  OAI22X1 U17 ( .A(clk12), .B(inverted_crc[7]), .C(inverted_crc[6]), .D(n1), 
        .Y(n32) );
  INVX1 U18 ( .A(crc[6]), .Y(inverted_crc[6]) );
  OAI22X1 U19 ( .A(clk12), .B(inverted_crc[8]), .C(inverted_crc[7]), .D(n1), 
        .Y(n30) );
  INVX1 U20 ( .A(crc[7]), .Y(inverted_crc[7]) );
  OAI22X1 U21 ( .A(clk12), .B(inverted_crc[9]), .C(inverted_crc[8]), .D(n1), 
        .Y(n28) );
  INVX1 U22 ( .A(crc[8]), .Y(inverted_crc[8]) );
  OAI22X1 U23 ( .A(clk12), .B(inverted_crc[10]), .C(inverted_crc[9]), .D(n1), 
        .Y(n26) );
  INVX1 U24 ( .A(crc[9]), .Y(inverted_crc[9]) );
  OAI22X1 U25 ( .A(clk12), .B(inverted_crc[11]), .C(inverted_crc[10]), .D(n1), 
        .Y(n24) );
  INVX1 U26 ( .A(crc[10]), .Y(inverted_crc[10]) );
  OAI22X1 U27 ( .A(clk12), .B(inverted_crc[12]), .C(inverted_crc[11]), .D(n1), 
        .Y(n22) );
  INVX1 U28 ( .A(crc[11]), .Y(inverted_crc[11]) );
  OAI22X1 U29 ( .A(clk12), .B(inverted_crc[13]), .C(inverted_crc[12]), .D(n1), 
        .Y(n20) );
  INVX1 U30 ( .A(crc[12]), .Y(inverted_crc[12]) );
  OAI22X1 U31 ( .A(clk12), .B(inverted_crc[14]), .C(inverted_crc[13]), .D(n1), 
        .Y(n18) );
  INVX1 U32 ( .A(crc[13]), .Y(inverted_crc[13]) );
  OAI21X1 U33 ( .A(inverted_crc[14]), .B(n8), .C(n9), .Y(n16) );
  NAND2X1 U34 ( .A(n10), .B(crc[15]), .Y(n9) );
  OAI21X1 U35 ( .A(crc[14]), .B(n2), .C(clk12), .Y(n10) );
  INVX1 U36 ( .A(STATE), .Y(n2) );
  INVX1 U37 ( .A(n5), .Y(n8) );
  INVX1 U38 ( .A(crc[14]), .Y(inverted_crc[14]) );
  OAI21X1 U39 ( .A(clk12), .B(inverted_crc[0]), .C(n11), .Y(n14) );
  MUX2X1 U40 ( .B(n6), .A(n5), .S(input_data), .Y(n11) );
  NOR2X1 U41 ( .A(n1), .B(crc[15]), .Y(n5) );
  NOR2X1 U42 ( .A(n1), .B(inverted_crc[15]), .Y(n6) );
  INVX1 U43 ( .A(crc[15]), .Y(inverted_crc[15]) );
  NAND2X1 U44 ( .A(clk12), .B(STATE), .Y(n3) );
  INVX1 U45 ( .A(crc[0]), .Y(inverted_crc[0]) );
endmodule


module flex_counter_NUM_CNT_BITS4_1 ( clk, count_enable, rollover_value, clear, 
        n_rst, halt, count_out, rollover_flag );
  input [3:0] rollover_value;
  output [3:0] count_out;
  input clk, count_enable, clear, n_rst, halt;
  output rollover_flag;
  wire   n47, n41, n42, n43, n44, n45, n2, n3, n4, n5, n6, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n46;

  DFFSR \count_out_reg[0]  ( .D(n45), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n47)
         );
  DFFSR \count_out_reg[2]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  INVX2 U7 ( .A(n12), .Y(rollover_flag) );
  MUX2X1 U9 ( .B(n2), .A(n3), .S(n4), .Y(n45) );
  AND2X1 U10 ( .A(n5), .B(count_out[0]), .Y(n2) );
  OAI22X1 U11 ( .A(n6), .B(n12), .C(n13), .D(n14), .Y(n44) );
  NAND2X1 U12 ( .A(n15), .B(n16), .Y(n14) );
  MUX2X1 U13 ( .B(n17), .A(n18), .S(n19), .Y(n16) );
  OAI21X1 U14 ( .A(n20), .B(n21), .C(n22), .Y(n18) );
  NOR2X1 U15 ( .A(n23), .B(n24), .Y(n20) );
  NOR2X1 U16 ( .A(rollover_value[3]), .B(rollover_value[2]), .Y(n17) );
  MUX2X1 U17 ( .B(n25), .A(n3), .S(n24), .Y(n15) );
  INVX1 U18 ( .A(rollover_value[0]), .Y(n24) );
  OAI21X1 U19 ( .A(count_out[1]), .B(n23), .C(n3), .Y(n25) );
  INVX1 U20 ( .A(rollover_value[1]), .Y(n23) );
  NAND3X1 U21 ( .A(n26), .B(n27), .C(n28), .Y(n13) );
  OAI21X1 U22 ( .A(n22), .B(n21), .C(n29), .Y(n27) );
  XNOR2X1 U23 ( .A(count_out[2]), .B(rollover_value[2]), .Y(n22) );
  XOR2X1 U24 ( .A(n30), .B(count_out[3]), .Y(n26) );
  OAI21X1 U25 ( .A(rollover_value[2]), .B(n19), .C(rollover_value[3]), .Y(n30)
         );
  INVX1 U26 ( .A(n29), .Y(n19) );
  NOR2X1 U27 ( .A(rollover_value[0]), .B(rollover_value[1]), .Y(n29) );
  INVX1 U28 ( .A(n47), .Y(n12) );
  MUX2X1 U29 ( .B(n31), .A(n32), .S(n21), .Y(n43) );
  INVX1 U30 ( .A(count_out[1]), .Y(n21) );
  NAND2X1 U31 ( .A(n28), .B(count_out[0]), .Y(n32) );
  INVX1 U32 ( .A(n33), .Y(n42) );
  MUX2X1 U33 ( .B(n34), .A(n35), .S(n36), .Y(n33) );
  MUX2X1 U34 ( .B(n37), .A(n38), .S(count_out[3]), .Y(n41) );
  AOI21X1 U35 ( .A(n28), .B(n36), .C(n34), .Y(n38) );
  OAI21X1 U36 ( .A(count_out[1]), .B(n39), .C(n31), .Y(n34) );
  AOI21X1 U37 ( .A(n3), .B(n28), .C(n4), .Y(n31) );
  INVX1 U38 ( .A(count_out[0]), .Y(n3) );
  INVX1 U39 ( .A(count_out[2]), .Y(n36) );
  NAND2X1 U40 ( .A(n35), .B(count_out[2]), .Y(n37) );
  INVX1 U41 ( .A(n40), .Y(n35) );
  NAND3X1 U42 ( .A(count_out[1]), .B(count_out[0]), .C(n28), .Y(n40) );
  INVX1 U43 ( .A(n39), .Y(n28) );
  NAND2X1 U44 ( .A(n6), .B(n5), .Y(n39) );
  NOR2X1 U45 ( .A(n47), .B(clear), .Y(n5) );
  INVX1 U46 ( .A(n4), .Y(n6) );
  OAI21X1 U47 ( .A(count_enable), .B(clear), .C(n46), .Y(n4) );
  INVX1 U48 ( .A(halt), .Y(n46) );
endmodule


module flex_counter2_NUM_CNT_BITS4 ( clk, count_enable, rollover_value, clear, 
        n_rst, halt, count_out, rollover_flag, one_before_flag );
  input [3:0] rollover_value;
  output [3:0] count_out;
  input clk, count_enable, clear, n_rst, halt;
  output rollover_flag, one_before_flag;
  wire   N5, n56, n57, n58, n59, n60, n61, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49;
  assign N5 = rollover_value[0];

  DFFSR rollover_flag_reg ( .D(n61), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[0]  ( .D(n60), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n58), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR one_before_flag_reg ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        one_before_flag) );
  OAI22X1 U7 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n61) );
  NAND3X1 U10 ( .A(n5), .B(n6), .C(n7), .Y(n4) );
  MUX2X1 U11 ( .B(n8), .A(n9), .S(n10), .Y(n7) );
  OAI21X1 U12 ( .A(n11), .B(n12), .C(n19), .Y(n9) );
  INVX1 U13 ( .A(n20), .Y(n11) );
  XOR2X1 U14 ( .A(n21), .B(count_out[3]), .Y(n5) );
  OAI21X1 U15 ( .A(rollover_value[2]), .B(n10), .C(rollover_value[3]), .Y(n21)
         );
  NAND2X1 U16 ( .A(n22), .B(n23), .Y(n3) );
  INVX1 U17 ( .A(n24), .Y(n22) );
  OAI22X1 U18 ( .A(n20), .B(count_out[1]), .C(n10), .D(n25), .Y(n24) );
  OR2X1 U19 ( .A(N5), .B(rollover_value[1]), .Y(n10) );
  NAND2X1 U20 ( .A(rollover_value[1]), .B(N5), .Y(n20) );
  MUX2X1 U21 ( .B(n26), .A(n27), .S(n1), .Y(n60) );
  NOR2X1 U22 ( .A(n26), .B(n28), .Y(n27) );
  NAND2X1 U23 ( .A(n29), .B(n2), .Y(n28) );
  MUX2X1 U24 ( .B(n30), .A(n31), .S(n12), .Y(n59) );
  NAND2X1 U25 ( .A(n6), .B(count_out[0]), .Y(n31) );
  INVX1 U26 ( .A(n32), .Y(n58) );
  MUX2X1 U27 ( .B(n33), .A(n34), .S(n35), .Y(n32) );
  MUX2X1 U28 ( .B(n36), .A(n37), .S(count_out[3]), .Y(n57) );
  AOI21X1 U29 ( .A(n6), .B(n35), .C(n33), .Y(n37) );
  OAI21X1 U30 ( .A(count_out[1]), .B(n38), .C(n30), .Y(n33) );
  INVX1 U31 ( .A(n39), .Y(n30) );
  OAI21X1 U32 ( .A(count_out[0]), .B(n38), .C(n1), .Y(n39) );
  NAND2X1 U33 ( .A(n34), .B(count_out[2]), .Y(n36) );
  INVX1 U34 ( .A(n40), .Y(n34) );
  NAND3X1 U35 ( .A(count_out[0]), .B(count_out[1]), .C(n6), .Y(n40) );
  INVX1 U36 ( .A(n38), .Y(n6) );
  NAND3X1 U37 ( .A(n29), .B(n2), .C(n1), .Y(n38) );
  INVX1 U38 ( .A(rollover_flag), .Y(n2) );
  MUX2X1 U39 ( .B(n41), .A(n42), .S(n1), .Y(n56) );
  AOI21X1 U40 ( .A(n43), .B(n29), .C(halt), .Y(n1) );
  INVX1 U41 ( .A(count_enable), .Y(n43) );
  NAND3X1 U42 ( .A(n44), .B(n45), .C(n46), .Y(n42) );
  NOR2X1 U43 ( .A(n23), .B(n47), .Y(n46) );
  OAI21X1 U44 ( .A(rollover_value[1]), .B(n25), .C(n29), .Y(n47) );
  INVX1 U45 ( .A(clear), .Y(n29) );
  NOR2X1 U46 ( .A(n12), .B(n19), .Y(n25) );
  XNOR2X1 U47 ( .A(N5), .B(n26), .Y(n23) );
  INVX1 U48 ( .A(count_out[0]), .Y(n26) );
  XOR2X1 U49 ( .A(n48), .B(count_out[3]), .Y(n45) );
  OAI21X1 U50 ( .A(rollover_value[1]), .B(rollover_value[2]), .C(
        rollover_value[3]), .Y(n48) );
  MUX2X1 U51 ( .B(n8), .A(n49), .S(rollover_value[1]), .Y(n44) );
  NAND2X1 U52 ( .A(n19), .B(n12), .Y(n49) );
  INVX1 U53 ( .A(count_out[1]), .Y(n12) );
  XOR2X1 U54 ( .A(n35), .B(rollover_value[2]), .Y(n19) );
  INVX1 U55 ( .A(count_out[2]), .Y(n35) );
  NOR2X1 U56 ( .A(rollover_value[3]), .B(rollover_value[2]), .Y(n8) );
  INVX1 U57 ( .A(one_before_flag), .Y(n41) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, count_enable, rollover_value, clear, 
        n_rst, halt, count_out, rollover_flag );
  input [3:0] rollover_value;
  output [3:0] count_out;
  input clk, count_enable, clear, n_rst, halt;
  output rollover_flag;
  wire   n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n46, n47, n48, n49, n50;

  DFFSR \count_out_reg[0]  ( .D(n46), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n47), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[2]  ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  MUX2X1 U7 ( .B(n1), .A(n2), .S(n3), .Y(n46) );
  AND2X1 U9 ( .A(n4), .B(count_out[0]), .Y(n1) );
  OAI22X1 U10 ( .A(n5), .B(n6), .C(n12), .D(n13), .Y(n47) );
  NAND2X1 U11 ( .A(n14), .B(n15), .Y(n13) );
  MUX2X1 U12 ( .B(n16), .A(n17), .S(n18), .Y(n15) );
  OAI21X1 U13 ( .A(n19), .B(n20), .C(n21), .Y(n17) );
  NOR2X1 U14 ( .A(n22), .B(n23), .Y(n19) );
  NOR2X1 U15 ( .A(rollover_value[3]), .B(rollover_value[2]), .Y(n16) );
  MUX2X1 U16 ( .B(n24), .A(n2), .S(n23), .Y(n14) );
  INVX1 U17 ( .A(rollover_value[0]), .Y(n23) );
  OAI21X1 U18 ( .A(count_out[1]), .B(n22), .C(n2), .Y(n24) );
  INVX1 U19 ( .A(rollover_value[1]), .Y(n22) );
  NAND3X1 U20 ( .A(n25), .B(n26), .C(n27), .Y(n12) );
  OAI21X1 U21 ( .A(n21), .B(n20), .C(n28), .Y(n26) );
  XNOR2X1 U22 ( .A(count_out[2]), .B(rollover_value[2]), .Y(n21) );
  XOR2X1 U23 ( .A(n29), .B(count_out[3]), .Y(n25) );
  OAI21X1 U24 ( .A(rollover_value[2]), .B(n18), .C(rollover_value[3]), .Y(n29)
         );
  INVX1 U25 ( .A(n28), .Y(n18) );
  NOR2X1 U26 ( .A(rollover_value[0]), .B(rollover_value[1]), .Y(n28) );
  INVX1 U27 ( .A(rollover_flag), .Y(n6) );
  MUX2X1 U28 ( .B(n30), .A(n31), .S(n20), .Y(n48) );
  INVX1 U29 ( .A(count_out[1]), .Y(n20) );
  NAND2X1 U30 ( .A(n27), .B(count_out[0]), .Y(n31) );
  INVX1 U31 ( .A(n32), .Y(n49) );
  MUX2X1 U32 ( .B(n33), .A(n34), .S(n35), .Y(n32) );
  MUX2X1 U33 ( .B(n36), .A(n37), .S(count_out[3]), .Y(n50) );
  AOI21X1 U34 ( .A(n27), .B(n35), .C(n33), .Y(n37) );
  OAI21X1 U35 ( .A(count_out[1]), .B(n38), .C(n30), .Y(n33) );
  AOI21X1 U36 ( .A(n2), .B(n27), .C(n3), .Y(n30) );
  INVX1 U37 ( .A(count_out[0]), .Y(n2) );
  INVX1 U38 ( .A(count_out[2]), .Y(n35) );
  NAND2X1 U39 ( .A(n34), .B(count_out[2]), .Y(n36) );
  INVX1 U40 ( .A(n39), .Y(n34) );
  NAND3X1 U41 ( .A(count_out[1]), .B(count_out[0]), .C(n27), .Y(n39) );
  INVX1 U42 ( .A(n38), .Y(n27) );
  NAND2X1 U43 ( .A(n5), .B(n4), .Y(n38) );
  NOR2X1 U44 ( .A(rollover_flag), .B(clear), .Y(n4) );
  INVX1 U45 ( .A(n3), .Y(n5) );
  OAI21X1 U46 ( .A(count_enable), .B(clear), .C(n40), .Y(n3) );
  INVX1 U47 ( .A(halt), .Y(n40) );
endmodule


module usb_timer ( clk, n_rst, serial_out, timer_en, bit_stuff_en, clk12, 
        bytecomplete, bytealmostcomplete );
  input clk, n_rst, serial_out, timer_en, bit_stuff_en;
  output clk12, bytecomplete, bytealmostcomplete;
  wire   three, _4_net_;
  wire   [3:0] rollover_valedit;

  DFFSR \rollover_valedit_reg[0]  ( .D(three), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rollover_valedit[0]) );
  flex_counter_NUM_CNT_BITS4_1 A ( .clk(clk), .count_enable(timer_en), 
        .rollover_value({1'b1, 1'b0, 1'b0, rollover_valedit[0]}), .clear(1'b0), 
        .n_rst(n_rst), .halt(1'b0), .rollover_flag(clk12) );
  flex_counter2_NUM_CNT_BITS4 B ( .clk(clk), .count_enable(clk12), 
        .rollover_value({1'b1, 1'b0, 1'b0, 1'b0}), .clear(1'b0), .n_rst(n_rst), 
        .halt(bit_stuff_en), .rollover_flag(bytecomplete), .one_before_flag(
        bytealmostcomplete) );
  flex_counter_NUM_CNT_BITS4_0 C ( .clk(clk), .count_enable(_4_net_), 
        .rollover_value({1'b0, 1'b0, 1'b1, 1'b1}), .clear(1'b0), .n_rst(n_rst), 
        .halt(bit_stuff_en), .rollover_flag(three) );
  AND2X1 U7 ( .A(clk12), .B(bytecomplete), .Y(_4_net_) );
endmodule


module usb_tx ( tx_packet_data, tx_packet_size, tx_packet, n_rst, clk, 
        dplus_out, dminus_out, get_tx_packet_data );
  input [7:0] tx_packet_data;
  input [6:0] tx_packet_size;
  input [1:0] tx_packet;
  input n_rst, clk;
  output dplus_out, dminus_out, get_tx_packet_data;
  wire   clk12, bit_stuff_en, serial_out, bytecomplete, en_pts, enc_en,
         timer_en, eop_en, eop_reset, crc_en, bytealmostcomplete, n3;
  wire   [15:0] CRC;
  wire   [7:0] prev_parallel;
  wire   [7:0] data_out;
  wire   SYNOPSYS_UNCONNECTED__0;

  usb_controller A ( .clk(clk), .n_rst(n_rst), .clk12(clk12), .tx_packet(
        tx_packet), .tx_packet_data(tx_packet_data), .tx_packet_data_size(
        tx_packet_size), .CRC(CRC), .serial_out(serial_out), .prev_parallel({
        1'b0, prev_parallel[6:0]}), .bytecomplete(bytecomplete), 
        .bytealmostcomplete(bytealmostcomplete), .bit_stuff_en(bit_stuff_en), 
        .eop_en(eop_en), .eop_reset(eop_reset), .en(en_pts), .CRC_en(crc_en), 
        .data(data_out), .enc_en(enc_en), .timer_en(timer_en), 
        .get_tx_packet_data(get_tx_packet_data) );
  usb_bit_stuffer B ( .clk(clk), .n_rst(n_rst), .clk12(clk12), .serial_in(
        serial_out), .bit_stuff_en(bit_stuff_en) );
  usb_pts C ( .clk(clk), .n_rst(n_rst), .clk12(clk12), .data(data_out), .en(
        en_pts), .bit_stuff_en(bit_stuff_en), .serial_data(serial_out), 
        .prev_parallel({SYNOPSYS_UNCONNECTED__0, prev_parallel[6:0]}) );
  usb_encoder D ( .clk(clk), .n_rst(n_rst), .clk12(clk12), .serial_out(
        serial_out), .enc_en(enc_en), .eop_en(eop_en), .eop_reset(eop_reset), 
        .bit_stuff_en(bit_stuff_en), .bytecomplete(bytecomplete), .dminus_out(
        dminus_out), .dplus_out(dplus_out) );
  CDL_CRC_16 E ( .clk(clk), .n_rst(n_rst), .clk12(clk12), .input_data(
        serial_out), .reset_crc(n3), .inverted_crc(CRC) );
  usb_timer F ( .clk(clk), .n_rst(n_rst), .serial_out(serial_out), .timer_en(
        timer_en), .bit_stuff_en(bit_stuff_en), .clk12(clk12), .bytecomplete(
        bytecomplete), .bytealmostcomplete(bytealmostcomplete) );
  INVX1 U3 ( .A(crc_en), .Y(n3) );
endmodule

