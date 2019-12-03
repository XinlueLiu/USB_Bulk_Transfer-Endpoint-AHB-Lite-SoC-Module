/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Dec  3 05:29:20 2019
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
  wire   N31, N32, N33, N34, N35, N36, N37, n39, n40, n1, n2, n3, n4, n5, n6,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75;

  DFFSR \count_out_reg[0]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[6]  ( .D(n70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR rollover_flag_reg ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[1]  ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n74), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n72), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  flex_counter3_NUM_CNT_BITS7_DW01_inc_0 r310 ( .A(count_out), .SUM({N37, N36, 
        N35, N34, N33, N32, N31}) );
  OAI21X1 U4 ( .A(n1), .B(n2), .C(n3), .Y(n70) );
  NAND2X1 U5 ( .A(N37), .B(n4), .Y(n3) );
  OAI21X1 U6 ( .A(n1), .B(n5), .C(n6), .Y(n71) );
  NAND2X1 U14 ( .A(N36), .B(n4), .Y(n6) );
  OAI21X1 U15 ( .A(n1), .B(n15), .C(n16), .Y(n72) );
  NAND2X1 U16 ( .A(N35), .B(n4), .Y(n16) );
  OAI21X1 U17 ( .A(n1), .B(n17), .C(n18), .Y(n73) );
  NAND2X1 U18 ( .A(N34), .B(n4), .Y(n18) );
  OAI21X1 U19 ( .A(n1), .B(n19), .C(n20), .Y(n74) );
  NAND2X1 U20 ( .A(N33), .B(n4), .Y(n20) );
  OAI21X1 U21 ( .A(n1), .B(n21), .C(n22), .Y(n75) );
  NAND2X1 U22 ( .A(N32), .B(n4), .Y(n22) );
  AND2X1 U23 ( .A(n1), .B(n23), .Y(n4) );
  MUX2X1 U24 ( .B(n24), .A(n25), .S(n1), .Y(n40) );
  AOI21X1 U25 ( .A(n23), .B(n26), .C(halt), .Y(n1) );
  NAND2X1 U26 ( .A(n27), .B(count_enable), .Y(n26) );
  INVX1 U27 ( .A(rollover_flag), .Y(n27) );
  NOR2X1 U28 ( .A(N31), .B(clear), .Y(n25) );
  INVX1 U29 ( .A(count_out[0]), .Y(n24) );
  OAI21X1 U30 ( .A(n28), .B(n29), .C(n30), .Y(n39) );
  OAI21X1 U31 ( .A(halt), .B(n23), .C(rollover_flag), .Y(n30) );
  INVX1 U32 ( .A(clear), .Y(n23) );
  OAI21X1 U33 ( .A(n31), .B(n32), .C(count_enable), .Y(n29) );
  AOI21X1 U34 ( .A(n33), .B(n2), .C(n34), .Y(n32) );
  OAI21X1 U35 ( .A(count_out[5]), .B(n35), .C(n36), .Y(n34) );
  OAI21X1 U36 ( .A(n37), .B(n5), .C(n38), .Y(n36) );
  XOR2X1 U37 ( .A(rollover_value[5]), .B(n41), .Y(n38) );
  INVX1 U38 ( .A(count_out[5]), .Y(n5) );
  INVX1 U39 ( .A(n35), .Y(n37) );
  OAI21X1 U40 ( .A(n15), .B(n42), .C(n43), .Y(n35) );
  OAI21X1 U41 ( .A(n44), .B(n45), .C(n46), .Y(n43) );
  AND2X1 U42 ( .A(n47), .B(n48), .Y(n46) );
  OAI21X1 U43 ( .A(n49), .B(n50), .C(n17), .Y(n48) );
  INVX1 U44 ( .A(count_out[3]), .Y(n17) );
  INVX1 U45 ( .A(n45), .Y(n49) );
  OAI21X1 U46 ( .A(n51), .B(n41), .C(n15), .Y(n47) );
  INVX1 U47 ( .A(n52), .Y(n51) );
  OAI21X1 U48 ( .A(n19), .B(n53), .C(n54), .Y(n45) );
  OAI21X1 U49 ( .A(count_out[2]), .B(n55), .C(n56), .Y(n54) );
  AOI22X1 U50 ( .A(n57), .B(n58), .C(n59), .D(n21), .Y(n56) );
  INVX1 U51 ( .A(count_out[1]), .Y(n21) );
  INVX1 U52 ( .A(n60), .Y(n59) );
  AOI21X1 U53 ( .A(rollover_value[0]), .B(rollover_value[1]), .C(n61), .Y(n60)
         );
  NAND2X1 U54 ( .A(count_out[1]), .B(n62), .Y(n58) );
  NOR2X1 U55 ( .A(rollover_value[0]), .B(count_out[0]), .Y(n57) );
  AOI21X1 U56 ( .A(rollover_value[2]), .B(n62), .C(n63), .Y(n55) );
  XOR2X1 U57 ( .A(rollover_value[2]), .B(n61), .Y(n53) );
  INVX1 U58 ( .A(count_out[2]), .Y(n19) );
  INVX1 U59 ( .A(n50), .Y(n44) );
  OAI21X1 U60 ( .A(n63), .B(n64), .C(n65), .Y(n50) );
  NAND2X1 U61 ( .A(n52), .B(n66), .Y(n42) );
  NAND2X1 U62 ( .A(rollover_value[4]), .B(n65), .Y(n52) );
  INVX1 U63 ( .A(count_out[4]), .Y(n15) );
  NOR2X1 U64 ( .A(n33), .B(n2), .Y(n31) );
  INVX1 U65 ( .A(count_out[6]), .Y(n2) );
  INVX1 U66 ( .A(n67), .Y(n33) );
  OAI21X1 U67 ( .A(rollover_value[5]), .B(n66), .C(rollover_value[6]), .Y(n67)
         );
  OAI21X1 U68 ( .A(n66), .B(n68), .C(n69), .Y(n28) );
  NOR2X1 U69 ( .A(halt), .B(clear), .Y(n69) );
  OR2X1 U70 ( .A(rollover_value[5]), .B(rollover_value[6]), .Y(n68) );
  INVX1 U71 ( .A(n41), .Y(n66) );
  NOR2X1 U72 ( .A(n65), .B(rollover_value[4]), .Y(n41) );
  NAND2X1 U73 ( .A(n63), .B(n64), .Y(n65) );
  INVX1 U74 ( .A(rollover_value[3]), .Y(n64) );
  NOR2X1 U75 ( .A(n62), .B(rollover_value[2]), .Y(n63) );
  INVX1 U76 ( .A(n61), .Y(n62) );
  NOR2X1 U77 ( .A(rollover_value[0]), .B(rollover_value[1]), .Y(n61) );
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
        bytealmostcomplete, bit_stuff_en, eop_en, eop_reset, en, CRC_en, 
        reset_crc, data, enc_en, timer_en, get_tx_packet_data );
  input [1:0] tx_packet;
  input [7:0] tx_packet_data;
  input [6:0] tx_packet_data_size;
  input [15:0] CRC;
  input [7:0] prev_parallel;
  output [7:0] data;
  input clk, n_rst, clk12, serial_out, bytecomplete, bytealmostcomplete,
         bit_stuff_en;
  output eop_en, eop_reset, en, CRC_en, reset_crc, enc_en, timer_en,
         get_tx_packet_data;
  wire   nxt_en, nxt_get_tx_packet_data, data_sent, \_1_net_[6] , \_1_net_[5] ,
         \_1_net_[4] , \_1_net_[3] , \_1_net_[2] , \_1_net_[1] , \_1_net_[0] ,
         N91, N106, N107, N108, N117, N118, N119, N120, N132, N137, N138, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n1, n2, n3, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222;
  wire   [3:0] state;
  wire   [1:0] stored_packet;
  wire   [3:0] nxt_state;
  assign N137 = clk12;

  DFFSR get_tx_packet_data_reg ( .D(nxt_get_tx_packet_data), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(get_tx_packet_data) );
  DFFSR \state_reg[3]  ( .D(nxt_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  DFFSR \state_reg[2]  ( .D(nxt_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[1]  ( .D(nxt_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[0]  ( .D(nxt_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR eop_en_reg ( .D(n189), .CLK(clk), .R(n_rst), .S(1'b1), .Q(eop_en) );
  DFFSR eop_reset_reg ( .D(n188), .CLK(clk), .R(n_rst), .S(1'b1), .Q(eop_reset) );
  DFFSR enc_en_reg ( .D(n187), .CLK(clk), .R(n_rst), .S(1'b1), .Q(enc_en) );
  DFFSR timer_en_reg ( .D(n186), .CLK(clk), .R(n_rst), .S(1'b1), .Q(timer_en)
         );
  DFFSR \stored_packet_reg[1]  ( .D(n221), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        stored_packet[1]) );
  DFFSR \stored_packet_reg[0]  ( .D(n185), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        stored_packet[0]) );
  DFFSR en_reg ( .D(n184), .CLK(clk), .R(n_rst), .S(1'b1), .Q(en) );
  DFFSR CRC_en_reg ( .D(n183), .CLK(clk), .R(n_rst), .S(1'b1), .Q(CRC_en) );
  DFFSR \data_reg[4]  ( .D(n178), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[4])
         );
  DFFSR \data_reg[3]  ( .D(n179), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[3])
         );
  DFFSR \data_reg[0]  ( .D(n182), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[0])
         );
  DFFSR \data_reg[1]  ( .D(n181), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[1])
         );
  DFFSR \data_reg[2]  ( .D(n180), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[2])
         );
  DFFSR \data_reg[5]  ( .D(n177), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[5])
         );
  DFFSR \data_reg[6]  ( .D(n176), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[6])
         );
  DFFSR \data_reg[7]  ( .D(n175), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data[7])
         );
  DFFSR reset_crc_reg ( .D(n174), .CLK(clk), .R(n_rst), .S(1'b1), .Q(reset_crc) );
  flex_counter3_NUM_CNT_BITS7 X ( .clk(clk), .count_enable(
        nxt_get_tx_packet_data), .rollover_value({\_1_net_[6] , \_1_net_[5] , 
        \_1_net_[4] , \_1_net_[3] , \_1_net_[2] , \_1_net_[1] , \_1_net_[0] }), 
        .clear(1'b0), .n_rst(n_rst), .halt(bit_stuff_en), .rollover_flag(
        data_sent) );
  usb_controller_DW01_inc_0 add_77 ( .A(tx_packet_data_size), .SUM({
        \_1_net_[6] , \_1_net_[5] , \_1_net_[4] , \_1_net_[3] , \_1_net_[2] , 
        \_1_net_[1] , \_1_net_[0] }) );
  NAND3X1 U4 ( .A(n73), .B(n70), .C(state[1]), .Y(n1) );
  NOR2X1 U26 ( .A(n1), .B(state[0]), .Y(n64) );
  NOR2X1 U27 ( .A(n1), .B(n68), .Y(n60) );
  AOI22X1 U28 ( .A(N91), .B(n64), .C(n219), .D(n60), .Y(n2) );
  OAI21X1 U29 ( .A(n76), .B(n77), .C(n2), .Y(nxt_get_tx_packet_data) );
  AOI22X1 U30 ( .A(N108), .B(n64), .C(N132), .D(n60), .Y(n32) );
  NOR2X1 U31 ( .A(state[1]), .B(n199), .Y(n26) );
  XNOR2X1 U32 ( .A(n70), .B(state[3]), .Y(n34) );
  NOR2X1 U33 ( .A(n70), .B(n73), .Y(n3) );
  AOI22X1 U34 ( .A(n26), .B(n34), .C(n3), .D(en), .Y(n31) );
  NAND3X1 U35 ( .A(state[2]), .B(n73), .C(state[1]), .Y(n27) );
  NAND3X1 U36 ( .A(n75), .B(N137), .C(state[0]), .Y(n66) );
  NAND2X1 U37 ( .A(state[0]), .B(n118), .Y(n54) );
  NAND3X1 U38 ( .A(n218), .B(n73), .C(n69), .Y(n46) );
  NAND3X1 U39 ( .A(n118), .B(n68), .C(n73), .Y(n28) );
  NAND3X1 U40 ( .A(n74), .B(n70), .C(n222), .Y(n41) );
  NAND2X1 U41 ( .A(n46), .B(n41), .Y(n29) );
  NOR2X1 U42 ( .A(n79), .B(n29), .Y(n30) );
  NAND3X1 U43 ( .A(n32), .B(n31), .C(n30), .Y(nxt_en) );
  NAND3X1 U44 ( .A(n74), .B(state[2]), .C(N137), .Y(n44) );
  NAND2X1 U45 ( .A(state[3]), .B(n118), .Y(n62) );
  NAND3X1 U46 ( .A(n70), .B(n68), .C(n218), .Y(n33) );
  NAND2X1 U47 ( .A(N137), .B(n70), .Y(n42) );
  AOI22X1 U48 ( .A(n199), .B(n73), .C(n42), .D(state[3]), .Y(n38) );
  OAI21X1 U49 ( .A(state[3]), .B(N117), .C(n71), .Y(n35) );
  OAI21X1 U50 ( .A(N137), .B(n71), .C(n35), .Y(n36) );
  AOI22X1 U51 ( .A(n36), .B(state[0]), .C(n38), .D(n68), .Y(n37) );
  OAI22X1 U52 ( .A(n54), .B(n38), .C(n118), .D(n37), .Y(n39) );
  AOI21X1 U53 ( .A(n72), .B(n82), .C(n39), .Y(n40) );
  NAND3X1 U54 ( .A(n41), .B(n44), .C(n40), .Y(nxt_state[0]) );
  AOI22X1 U55 ( .A(N106), .B(n64), .C(N118), .D(n60), .Y(n50) );
  OAI22X1 U56 ( .A(n68), .B(N137), .C(n218), .D(state[0]), .Y(n43) );
  NOR2X1 U57 ( .A(n68), .B(n42), .Y(n45) );
  AOI22X1 U58 ( .A(n43), .B(n75), .C(n72), .D(n45), .Y(n49) );
  NAND3X1 U59 ( .A(n80), .B(state[1]), .C(state[3]), .Y(n59) );
  NAND2X1 U60 ( .A(n59), .B(n46), .Y(n47) );
  NOR2X1 U61 ( .A(n78), .B(n47), .Y(n48) );
  NAND3X1 U62 ( .A(n50), .B(n49), .C(n48), .Y(nxt_state[1]) );
  NOR2X1 U63 ( .A(state[0]), .B(n199), .Y(n51) );
  AOI22X1 U64 ( .A(n51), .B(n72), .C(N119), .D(n60), .Y(n58) );
  NOR2X1 U65 ( .A(n218), .B(state[0]), .Y(n52) );
  AOI22X1 U66 ( .A(n52), .B(state[1]), .C(N138), .D(n118), .Y(n53) );
  OAI21X1 U67 ( .A(n68), .B(N137), .C(n53), .Y(n56) );
  NAND2X1 U68 ( .A(n54), .B(n73), .Y(n55) );
  OAI21X1 U69 ( .A(n56), .B(n55), .C(state[2]), .Y(n57) );
  NAND2X1 U70 ( .A(n58), .B(n57), .Y(nxt_state[2]) );
  AOI21X1 U71 ( .A(N120), .B(n60), .C(n81), .Y(n67) );
  NAND3X1 U72 ( .A(n75), .B(n68), .C(n218), .Y(n61) );
  OAI21X1 U73 ( .A(n82), .B(n62), .C(n61), .Y(n63) );
  AOI21X1 U74 ( .A(N107), .B(n64), .C(n63), .Y(n65) );
  NAND3X1 U75 ( .A(n67), .B(n66), .C(n65), .Y(nxt_state[3]) );
  INVX2 U76 ( .A(state[0]), .Y(n68) );
  INVX2 U77 ( .A(n54), .Y(n69) );
  INVX2 U78 ( .A(state[2]), .Y(n70) );
  INVX2 U79 ( .A(n34), .Y(n71) );
  INVX2 U80 ( .A(n62), .Y(n72) );
  INVX2 U81 ( .A(state[3]), .Y(n73) );
  INVX2 U82 ( .A(n28), .Y(n74) );
  INVX2 U83 ( .A(n27), .Y(n75) );
  INVX2 U84 ( .A(n1), .Y(n76) );
  INVX2 U85 ( .A(get_tx_packet_data), .Y(n77) );
  INVX2 U86 ( .A(n44), .Y(n78) );
  INVX2 U87 ( .A(n66), .Y(n79) );
  INVX2 U88 ( .A(n45), .Y(n80) );
  INVX2 U89 ( .A(n59), .Y(n81) );
  INVX2 U90 ( .A(n33), .Y(n82) );
  MUX2X1 U91 ( .B(n83), .A(n84), .S(n85), .Y(n221) );
  OAI21X1 U92 ( .A(n86), .B(n87), .C(n88), .Y(n189) );
  OAI21X1 U93 ( .A(n89), .B(n87), .C(eop_en), .Y(n88) );
  OAI22X1 U94 ( .A(N137), .B(n89), .C(n218), .D(n90), .Y(n87) );
  AND2X1 U95 ( .A(n90), .B(n91), .Y(n86) );
  NAND2X1 U96 ( .A(n92), .B(n93), .Y(n90) );
  OAI21X1 U97 ( .A(n220), .B(n89), .C(n94), .Y(n188) );
  OAI21X1 U98 ( .A(n95), .B(n96), .C(eop_reset), .Y(n94) );
  AND2X1 U99 ( .A(n97), .B(n98), .Y(n95) );
  OAI21X1 U100 ( .A(n99), .B(n100), .C(n101), .Y(n187) );
  INVX1 U101 ( .A(enc_en), .Y(n100) );
  OAI21X1 U102 ( .A(n99), .B(n102), .C(n101), .Y(n186) );
  INVX1 U103 ( .A(n85), .Y(n101) );
  INVX1 U104 ( .A(timer_en), .Y(n102) );
  NOR2X1 U105 ( .A(n98), .B(n220), .Y(n99) );
  MUX2X1 U106 ( .B(n103), .A(n104), .S(n85), .Y(n185) );
  MUX2X1 U107 ( .B(n105), .A(n106), .S(n107), .Y(n184) );
  NOR2X1 U108 ( .A(n108), .B(n109), .Y(n107) );
  INVX1 U109 ( .A(n110), .Y(n109) );
  AOI21X1 U110 ( .A(n218), .B(n111), .C(n96), .Y(n110) );
  OAI21X1 U111 ( .A(N137), .B(n98), .C(n89), .Y(n96) );
  NAND3X1 U112 ( .A(state[1]), .B(n112), .C(state[3]), .Y(n89) );
  NAND3X1 U113 ( .A(state[3]), .B(state[1]), .C(n113), .Y(n98) );
  OAI21X1 U114 ( .A(n114), .B(n115), .C(n116), .Y(n108) );
  AND2X1 U115 ( .A(n91), .B(n117), .Y(n116) );
  NAND3X1 U116 ( .A(state[3]), .B(n118), .C(n113), .Y(n91) );
  INVX1 U117 ( .A(n119), .Y(n114) );
  INVX1 U118 ( .A(nxt_en), .Y(n106) );
  NAND3X1 U119 ( .A(n120), .B(n117), .C(n121), .Y(n183) );
  AOI22X1 U120 ( .A(CRC_en), .B(n122), .C(N91), .D(n123), .Y(n121) );
  OAI21X1 U121 ( .A(n124), .B(n125), .C(n126), .Y(n122) );
  MUX2X1 U122 ( .B(n220), .A(n97), .S(n127), .Y(n126) );
  NAND3X1 U123 ( .A(n119), .B(N137), .C(n92), .Y(n120) );
  INVX1 U124 ( .A(n115), .Y(n92) );
  NAND2X1 U125 ( .A(state[2]), .B(n68), .Y(n115) );
  OAI21X1 U126 ( .A(n128), .B(n129), .C(n130), .Y(n182) );
  NAND2X1 U127 ( .A(data[0]), .B(n131), .Y(n130) );
  AND2X1 U128 ( .A(n132), .B(n133), .Y(n128) );
  AOI22X1 U129 ( .A(tx_packet_data[0]), .B(n134), .C(CRC[7]), .D(n135), .Y(
        n133) );
  AOI22X1 U130 ( .A(n136), .B(n137), .C(CRC[15]), .D(n138), .Y(n132) );
  OAI21X1 U131 ( .A(n139), .B(n129), .C(n140), .Y(n181) );
  NAND2X1 U132 ( .A(data[1]), .B(n131), .Y(n140) );
  AOI21X1 U133 ( .A(CRC[14]), .B(n138), .C(n141), .Y(n139) );
  INVX1 U134 ( .A(n142), .Y(n141) );
  AOI22X1 U135 ( .A(tx_packet_data[1]), .B(n134), .C(CRC[6]), .D(n135), .Y(
        n142) );
  OAI21X1 U136 ( .A(n143), .B(n129), .C(n144), .Y(n180) );
  NAND2X1 U137 ( .A(data[2]), .B(n131), .Y(n144) );
  AND2X1 U138 ( .A(n145), .B(n146), .Y(n143) );
  AOI21X1 U139 ( .A(tx_packet_data[2]), .B(n134), .C(n136), .Y(n146) );
  AOI22X1 U140 ( .A(CRC[5]), .B(n135), .C(CRC[13]), .D(n138), .Y(n145) );
  OAI21X1 U141 ( .A(n147), .B(n129), .C(n148), .Y(n179) );
  NAND2X1 U142 ( .A(data[3]), .B(n131), .Y(n148) );
  AND2X1 U143 ( .A(n149), .B(n150), .Y(n147) );
  AOI22X1 U144 ( .A(tx_packet_data[3]), .B(n134), .C(CRC[4]), .D(n135), .Y(
        n150) );
  AOI22X1 U145 ( .A(n136), .B(n151), .C(CRC[12]), .D(n138), .Y(n149) );
  OAI21X1 U146 ( .A(n152), .B(n129), .C(n153), .Y(n178) );
  NAND2X1 U147 ( .A(data[4]), .B(n131), .Y(n153) );
  AND2X1 U148 ( .A(n154), .B(n155), .Y(n152) );
  AOI22X1 U149 ( .A(tx_packet_data[4]), .B(n134), .C(CRC[3]), .D(n135), .Y(
        n155) );
  AOI22X1 U150 ( .A(n136), .B(n151), .C(CRC[11]), .D(n138), .Y(n154) );
  INVX1 U151 ( .A(n156), .Y(n151) );
  OAI21X1 U152 ( .A(n157), .B(n129), .C(n158), .Y(n177) );
  NAND2X1 U153 ( .A(data[5]), .B(n131), .Y(n158) );
  AND2X1 U154 ( .A(n159), .B(n160), .Y(n157) );
  AOI21X1 U155 ( .A(tx_packet_data[5]), .B(n134), .C(n136), .Y(n160) );
  INVX1 U156 ( .A(n161), .Y(n136) );
  AOI22X1 U157 ( .A(CRC[2]), .B(n135), .C(CRC[10]), .D(n138), .Y(n159) );
  OAI21X1 U158 ( .A(n162), .B(n129), .C(n163), .Y(n176) );
  NAND2X1 U159 ( .A(data[6]), .B(n131), .Y(n163) );
  OR2X1 U160 ( .A(n164), .B(n165), .Y(n131) );
  OAI21X1 U161 ( .A(n222), .B(n97), .C(n166), .Y(n165) );
  AOI21X1 U162 ( .A(CRC[9]), .B(n138), .C(n167), .Y(n162) );
  INVX1 U163 ( .A(n168), .Y(n167) );
  AOI22X1 U164 ( .A(tx_packet_data[6]), .B(n134), .C(CRC[1]), .D(n135), .Y(
        n168) );
  INVX1 U165 ( .A(n169), .Y(n135) );
  NAND2X1 U166 ( .A(n170), .B(n171), .Y(n175) );
  OAI21X1 U167 ( .A(n164), .B(n172), .C(data[7]), .Y(n171) );
  NAND2X1 U168 ( .A(n166), .B(n97), .Y(n172) );
  OAI21X1 U169 ( .A(n218), .B(n125), .C(n173), .Y(n164) );
  AOI22X1 U170 ( .A(n137), .B(n123), .C(n190), .D(n191), .Y(n173) );
  INVX1 U171 ( .A(n192), .Y(n191) );
  AND2X1 U172 ( .A(n97), .B(n127), .Y(n190) );
  INVX1 U173 ( .A(n193), .Y(n137) );
  OAI21X1 U174 ( .A(n194), .B(n195), .C(n166), .Y(n170) );
  INVX1 U175 ( .A(n129), .Y(n166) );
  OAI21X1 U176 ( .A(N137), .B(n127), .C(n196), .Y(n129) );
  AND2X1 U177 ( .A(n197), .B(n117), .Y(n196) );
  NAND2X1 U178 ( .A(bit_stuff_en), .B(n198), .Y(n117) );
  OAI21X1 U179 ( .A(n111), .B(n199), .C(n192), .Y(n197) );
  NAND3X1 U180 ( .A(n169), .B(n161), .C(n200), .Y(n192) );
  NOR2X1 U181 ( .A(n123), .B(n138), .Y(n200) );
  INVX1 U182 ( .A(n201), .Y(n123) );
  NOR2X1 U183 ( .A(n201), .B(n202), .Y(n111) );
  NAND2X1 U184 ( .A(state[0]), .B(n93), .Y(n127) );
  OAI21X1 U185 ( .A(n193), .B(n161), .C(n203), .Y(n195) );
  NAND2X1 U186 ( .A(CRC[8]), .B(n138), .Y(n203) );
  INVX1 U187 ( .A(n204), .Y(n138) );
  NAND3X1 U188 ( .A(n112), .B(n118), .C(state[3]), .Y(n204) );
  NAND2X1 U189 ( .A(n113), .B(n119), .Y(n161) );
  OAI21X1 U190 ( .A(n169), .B(n205), .C(n206), .Y(n194) );
  AOI21X1 U191 ( .A(tx_packet_data[7]), .B(n134), .C(n85), .Y(n206) );
  NOR2X1 U192 ( .A(n97), .B(n207), .Y(n85) );
  OAI21X1 U193 ( .A(n201), .B(n156), .C(n208), .Y(n134) );
  NAND3X1 U194 ( .A(n198), .B(n209), .C(n218), .Y(n208) );
  INVX1 U195 ( .A(n125), .Y(n198) );
  NAND2X1 U196 ( .A(n113), .B(n93), .Y(n125) );
  NOR2X1 U197 ( .A(n68), .B(state[2]), .Y(n113) );
  NAND2X1 U198 ( .A(n93), .B(n112), .Y(n201) );
  NOR2X1 U199 ( .A(n118), .B(state[3]), .Y(n93) );
  INVX1 U200 ( .A(CRC[0]), .Y(n205) );
  NAND3X1 U201 ( .A(state[2]), .B(n119), .C(state[0]), .Y(n169) );
  INVX1 U202 ( .A(n210), .Y(n174) );
  MUX2X1 U203 ( .B(n207), .A(reset_crc), .S(n97), .Y(n210) );
  NAND2X1 U204 ( .A(n112), .B(n119), .Y(n97) );
  NOR2X1 U205 ( .A(state[3]), .B(state[1]), .Y(n119) );
  NOR2X1 U206 ( .A(state[2]), .B(state[0]), .Y(n112) );
  INVX1 U207 ( .A(n222), .Y(n207) );
  NAND2X1 U208 ( .A(n104), .B(n84), .Y(n222) );
  INVX1 U209 ( .A(tx_packet[1]), .Y(n84) );
  INVX1 U210 ( .A(tx_packet[0]), .Y(n104) );
  NOR2X1 U211 ( .A(n156), .B(n211), .Y(N91) );
  OR2X1 U212 ( .A(n220), .B(data_sent), .Y(N138) );
  INVX1 U213 ( .A(N137), .Y(n220) );
  OAI21X1 U214 ( .A(n211), .B(n105), .C(n199), .Y(N132) );
  AND2X1 U215 ( .A(state[3]), .B(n219), .Y(N120) );
  INVX1 U216 ( .A(n212), .Y(n219) );
  OAI21X1 U217 ( .A(n70), .B(n212), .C(n213), .Y(N119) );
  NOR2X1 U218 ( .A(bit_stuff_en), .B(n124), .Y(n213) );
  INVX1 U219 ( .A(n209), .Y(n124) );
  NAND2X1 U220 ( .A(data_sent), .B(n218), .Y(n209) );
  OAI21X1 U221 ( .A(n118), .B(n212), .C(n214), .Y(N118) );
  INVX1 U222 ( .A(state[1]), .Y(n118) );
  OAI21X1 U223 ( .A(n68), .B(n212), .C(n214), .Y(N117) );
  OAI21X1 U224 ( .A(n218), .B(n211), .C(n215), .Y(n214) );
  NAND3X1 U225 ( .A(n199), .B(n215), .C(n216), .Y(n212) );
  INVX1 U226 ( .A(n211), .Y(n216) );
  NAND2X1 U227 ( .A(bytealmostcomplete), .B(N137), .Y(n211) );
  INVX1 U228 ( .A(bit_stuff_en), .Y(n215) );
  AND2X1 U229 ( .A(n218), .B(n217), .Y(N108) );
  OAI21X1 U230 ( .A(n105), .B(n193), .C(n156), .Y(n217) );
  INVX1 U231 ( .A(en), .Y(n105) );
  AOI21X1 U232 ( .A(n202), .B(n193), .C(n199), .Y(N107) );
  NAND2X1 U233 ( .A(stored_packet[1]), .B(n103), .Y(n193) );
  XOR2X1 U234 ( .A(n103), .B(n83), .Y(n202) );
  INVX1 U235 ( .A(stored_packet[0]), .Y(n103) );
  NAND2X1 U236 ( .A(n218), .B(n156), .Y(N106) );
  NAND2X1 U237 ( .A(stored_packet[0]), .B(n83), .Y(n156) );
  INVX1 U238 ( .A(stored_packet[1]), .Y(n83) );
  INVX1 U239 ( .A(n199), .Y(n218) );
  NAND2X1 U240 ( .A(bytecomplete), .B(N137), .Y(n199) );
endmodule


module flex_counter4_NUM_CNT_BITS4 ( clk, count_enable, rollover_value, clear, 
        clk12, n_rst, halt, count_out, rollover_flag );
  input [3:0] rollover_value;
  output [3:0] count_out;
  input clk, count_enable, clear, clk12, n_rst, halt;
  output rollover_flag;
  wire   n38, n41, n43, n44, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n42, n45, n46;

  DFFSR \count_out_reg[0]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[2]  ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  INVX1 U3 ( .A(n1), .Y(n46) );
  MUX2X1 U4 ( .B(n2), .A(n3), .S(n4), .Y(n1) );
  MUX2X1 U5 ( .B(n5), .A(n6), .S(n7), .Y(n44) );
  OAI21X1 U6 ( .A(rollover_flag), .B(n6), .C(n8), .Y(n5) );
  MUX2X1 U7 ( .B(n9), .A(n10), .S(n11), .Y(n43) );
  NAND2X1 U8 ( .A(count_out[0]), .B(n12), .Y(n10) );
  MUX2X1 U9 ( .B(n13), .A(n14), .S(count_out[3]), .Y(n41) );
  AOI21X1 U10 ( .A(n12), .B(n4), .C(n2), .Y(n14) );
  OAI21X1 U11 ( .A(count_out[1]), .B(n15), .C(n9), .Y(n2) );
  AOI21X1 U12 ( .A(n6), .B(n12), .C(n7), .Y(n9) );
  INVX1 U13 ( .A(count_out[2]), .Y(n4) );
  NAND2X1 U14 ( .A(n3), .B(count_out[2]), .Y(n13) );
  INVX1 U15 ( .A(n16), .Y(n3) );
  NAND3X1 U16 ( .A(count_out[0]), .B(n12), .C(count_out[1]), .Y(n16) );
  INVX1 U17 ( .A(n15), .Y(n12) );
  NAND3X1 U18 ( .A(n8), .B(n17), .C(n18), .Y(n15) );
  INVX1 U19 ( .A(n7), .Y(n18) );
  OAI21X1 U20 ( .A(count_enable), .B(clear), .C(clk12), .Y(n7) );
  MUX2X1 U21 ( .B(clk12), .A(n19), .S(n17), .Y(n38) );
  INVX1 U22 ( .A(rollover_flag), .Y(n17) );
  OR2X1 U23 ( .A(n20), .B(n21), .Y(n19) );
  NAND3X1 U24 ( .A(n22), .B(clk12), .C(count_enable), .Y(n21) );
  MUX2X1 U25 ( .B(n23), .A(n6), .S(n24), .Y(n22) );
  OAI21X1 U26 ( .A(count_out[1]), .B(n25), .C(n6), .Y(n23) );
  INVX1 U27 ( .A(count_out[0]), .Y(n6) );
  NAND3X1 U28 ( .A(n26), .B(n27), .C(n28), .Y(n20) );
  AND2X1 U29 ( .A(n29), .B(n8), .Y(n28) );
  INVX1 U30 ( .A(clear), .Y(n8) );
  OAI21X1 U31 ( .A(n30), .B(n11), .C(n31), .Y(n29) );
  XOR2X1 U32 ( .A(n32), .B(count_out[3]), .Y(n27) );
  OAI21X1 U33 ( .A(rollover_value[2]), .B(n33), .C(rollover_value[3]), .Y(n32)
         );
  MUX2X1 U34 ( .B(n34), .A(n42), .S(n33), .Y(n26) );
  INVX1 U35 ( .A(n31), .Y(n33) );
  NOR2X1 U36 ( .A(rollover_value[0]), .B(rollover_value[1]), .Y(n31) );
  OAI21X1 U42 ( .A(n45), .B(n11), .C(n30), .Y(n42) );
  XNOR2X1 U43 ( .A(count_out[2]), .B(rollover_value[2]), .Y(n30) );
  INVX1 U44 ( .A(count_out[1]), .Y(n11) );
  NOR2X1 U45 ( .A(n25), .B(n24), .Y(n45) );
  INVX1 U46 ( .A(rollover_value[0]), .Y(n24) );
  INVX1 U47 ( .A(rollover_value[1]), .Y(n25) );
  NOR2X1 U48 ( .A(rollover_value[3]), .B(rollover_value[2]), .Y(n34) );
endmodule


module usb_bit_stuffer ( clk, n_rst, clk12, serial_in, bit_stuff_en );
  input clk, n_rst, clk12, serial_in;
  output bit_stuff_en;
  wire   n1;

  flex_counter4_NUM_CNT_BITS4 Y ( .clk(clk), .count_enable(serial_in), 
        .rollover_value({1'b0, 1'b1, 1'b1, 1'b0}), .clear(n1), .clk12(clk12), 
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


module CDL_CRC_16 ( clk, n_rst, clk12, crc_en, input_data, reset_crc, 
        inverted_crc );
  output [15:0] inverted_crc;
  input clk, n_rst, clk12, crc_en, input_data, reset_crc;
  wire   n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43;

  DFFSR \crc_reg[0]  ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[0]) );
  DFFSR \crc_reg[1]  ( .D(n58), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[1]) );
  DFFSR \crc_reg[2]  ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[2]) );
  DFFSR \crc_reg[3]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[3]) );
  DFFSR \crc_reg[4]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[4]) );
  DFFSR \crc_reg[5]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[5]) );
  DFFSR \crc_reg[6]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[6]) );
  DFFSR \crc_reg[7]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[7]) );
  DFFSR \crc_reg[8]  ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[8]) );
  DFFSR \crc_reg[9]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[9]) );
  DFFSR \crc_reg[10]  ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[10]) );
  DFFSR \crc_reg[11]  ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[11]) );
  DFFSR \crc_reg[12]  ( .D(n47), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[12]) );
  DFFSR \crc_reg[13]  ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[13]) );
  DFFSR \crc_reg[14]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[14]) );
  DFFSR \crc_reg[15]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        inverted_crc[15]) );
  BUFX2 U18 ( .A(n21), .Y(n17) );
  INVX2 U19 ( .A(n43), .Y(n18) );
  OAI22X1 U20 ( .A(n18), .B(n19), .C(n20), .D(n17), .Y(n59) );
  OAI22X1 U21 ( .A(n18), .B(n22), .C(n17), .D(n19), .Y(n58) );
  INVX1 U22 ( .A(inverted_crc[0]), .Y(n19) );
  INVX1 U23 ( .A(inverted_crc[1]), .Y(n22) );
  OAI22X1 U24 ( .A(n18), .B(n23), .C(n24), .D(n17), .Y(n57) );
  XOR2X1 U25 ( .A(inverted_crc[1]), .B(n20), .Y(n24) );
  XNOR2X1 U26 ( .A(input_data), .B(inverted_crc[15]), .Y(n20) );
  OAI22X1 U27 ( .A(n18), .B(n25), .C(n17), .D(n23), .Y(n56) );
  INVX1 U28 ( .A(inverted_crc[2]), .Y(n23) );
  OAI22X1 U29 ( .A(n18), .B(n26), .C(n17), .D(n25), .Y(n55) );
  INVX1 U30 ( .A(inverted_crc[3]), .Y(n25) );
  OAI22X1 U31 ( .A(n18), .B(n27), .C(n17), .D(n26), .Y(n54) );
  INVX1 U32 ( .A(inverted_crc[4]), .Y(n26) );
  OAI22X1 U33 ( .A(n18), .B(n28), .C(n17), .D(n27), .Y(n53) );
  INVX1 U34 ( .A(inverted_crc[5]), .Y(n27) );
  OAI22X1 U35 ( .A(n18), .B(n29), .C(n17), .D(n28), .Y(n52) );
  INVX1 U36 ( .A(inverted_crc[6]), .Y(n28) );
  OAI22X1 U37 ( .A(n18), .B(n30), .C(n17), .D(n29), .Y(n51) );
  INVX1 U38 ( .A(inverted_crc[7]), .Y(n29) );
  OAI22X1 U39 ( .A(n18), .B(n31), .C(n17), .D(n30), .Y(n50) );
  INVX1 U40 ( .A(inverted_crc[8]), .Y(n30) );
  OAI22X1 U41 ( .A(n18), .B(n32), .C(n17), .D(n31), .Y(n49) );
  INVX1 U42 ( .A(inverted_crc[9]), .Y(n31) );
  OAI22X1 U43 ( .A(n18), .B(n33), .C(n17), .D(n32), .Y(n48) );
  INVX1 U44 ( .A(inverted_crc[10]), .Y(n32) );
  OAI22X1 U45 ( .A(n18), .B(n34), .C(n17), .D(n33), .Y(n47) );
  INVX1 U46 ( .A(inverted_crc[11]), .Y(n33) );
  OAI22X1 U47 ( .A(n18), .B(n35), .C(n17), .D(n34), .Y(n46) );
  INVX1 U48 ( .A(inverted_crc[12]), .Y(n34) );
  OAI22X1 U49 ( .A(n18), .B(n36), .C(n17), .D(n35), .Y(n45) );
  INVX1 U50 ( .A(inverted_crc[13]), .Y(n35) );
  NAND2X1 U51 ( .A(n18), .B(n37), .Y(n21) );
  INVX1 U52 ( .A(inverted_crc[14]), .Y(n36) );
  OAI21X1 U53 ( .A(n18), .B(n38), .C(n39), .Y(n44) );
  NAND2X1 U54 ( .A(n40), .B(n37), .Y(n39) );
  INVX1 U55 ( .A(reset_crc), .Y(n37) );
  MUX2X1 U56 ( .B(n38), .A(n41), .S(n42), .Y(n40) );
  XOR2X1 U57 ( .A(inverted_crc[14]), .B(input_data), .Y(n42) );
  NAND3X1 U58 ( .A(clk12), .B(n38), .C(crc_en), .Y(n41) );
  INVX1 U59 ( .A(inverted_crc[15]), .Y(n38) );
  OAI21X1 U60 ( .A(reset_crc), .B(crc_en), .C(clk12), .Y(n43) );
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
  wire   N6, n57, n58, n59, n60, n61, n62, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52;
  assign N6 = rollover_value[0];

  DFFSR rollover_flag_reg ( .D(n62), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[0]  ( .D(n61), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n58), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR one_before_flag_reg ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        one_before_flag) );
  OAI22X1 U7 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n62) );
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
  OR2X1 U19 ( .A(N6), .B(rollover_value[1]), .Y(n10) );
  NAND2X1 U20 ( .A(rollover_value[1]), .B(N6), .Y(n20) );
  OAI21X1 U21 ( .A(halt), .B(n26), .C(n27), .Y(n61) );
  AOI22X1 U22 ( .A(n28), .B(n29), .C(n30), .D(count_out[0]), .Y(n27) );
  INVX1 U23 ( .A(n2), .Y(n30) );
  NAND2X1 U24 ( .A(count_out[0]), .B(n1), .Y(n29) );
  INVX1 U25 ( .A(n31), .Y(n28) );
  MUX2X1 U26 ( .B(n32), .A(n33), .S(n12), .Y(n60) );
  NAND2X1 U27 ( .A(n6), .B(count_out[0]), .Y(n33) );
  INVX1 U28 ( .A(n34), .Y(n59) );
  MUX2X1 U29 ( .B(n35), .A(n36), .S(n37), .Y(n34) );
  MUX2X1 U30 ( .B(n38), .A(n39), .S(count_out[3]), .Y(n58) );
  AOI21X1 U31 ( .A(n6), .B(n37), .C(n35), .Y(n39) );
  OAI21X1 U32 ( .A(count_out[1]), .B(n40), .C(n32), .Y(n35) );
  INVX1 U33 ( .A(n41), .Y(n32) );
  OAI21X1 U34 ( .A(count_out[0]), .B(n40), .C(n2), .Y(n41) );
  INVX1 U35 ( .A(n6), .Y(n40) );
  NAND2X1 U36 ( .A(n36), .B(count_out[2]), .Y(n38) );
  INVX1 U37 ( .A(n42), .Y(n36) );
  NAND3X1 U38 ( .A(count_out[0]), .B(count_out[1]), .C(n6), .Y(n42) );
  NOR2X1 U39 ( .A(n31), .B(rollover_flag), .Y(n6) );
  NAND3X1 U40 ( .A(n26), .B(n43), .C(n2), .Y(n31) );
  OAI21X1 U41 ( .A(n43), .B(n1), .C(n44), .Y(n2) );
  INVX1 U42 ( .A(rollover_flag), .Y(n1) );
  MUX2X1 U43 ( .B(n45), .A(n46), .S(n44), .Y(n57) );
  OAI21X1 U44 ( .A(count_enable), .B(clear), .C(n43), .Y(n44) );
  INVX1 U45 ( .A(halt), .Y(n43) );
  INVX1 U46 ( .A(one_before_flag), .Y(n46) );
  NAND3X1 U47 ( .A(n47), .B(n48), .C(n49), .Y(n45) );
  NOR2X1 U48 ( .A(n23), .B(n50), .Y(n49) );
  OAI21X1 U49 ( .A(rollover_value[1]), .B(n25), .C(n26), .Y(n50) );
  INVX1 U50 ( .A(clear), .Y(n26) );
  NOR2X1 U51 ( .A(n12), .B(n19), .Y(n25) );
  XOR2X1 U52 ( .A(N6), .B(count_out[0]), .Y(n23) );
  XOR2X1 U53 ( .A(n51), .B(count_out[3]), .Y(n48) );
  OAI21X1 U54 ( .A(rollover_value[1]), .B(rollover_value[2]), .C(
        rollover_value[3]), .Y(n51) );
  MUX2X1 U55 ( .B(n8), .A(n52), .S(rollover_value[1]), .Y(n47) );
  NAND2X1 U56 ( .A(n19), .B(n12), .Y(n52) );
  INVX1 U57 ( .A(count_out[1]), .Y(n12) );
  XOR2X1 U58 ( .A(n37), .B(rollover_value[2]), .Y(n19) );
  INVX1 U59 ( .A(count_out[2]), .Y(n37) );
  NOR2X1 U60 ( .A(rollover_value[3]), .B(rollover_value[2]), .Y(n8) );
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
         reset_crc, timer_en, eop_en, eop_reset, crc_en, bytealmostcomplete;
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
        .reset_crc(reset_crc), .data(data_out), .enc_en(enc_en), .timer_en(
        timer_en), .get_tx_packet_data(get_tx_packet_data) );
  usb_bit_stuffer B ( .clk(clk), .n_rst(n_rst), .clk12(clk12), .serial_in(
        serial_out), .bit_stuff_en(bit_stuff_en) );
  usb_pts C ( .clk(clk), .n_rst(n_rst), .clk12(clk12), .data(data_out), .en(
        en_pts), .bit_stuff_en(bit_stuff_en), .serial_data(serial_out), 
        .prev_parallel({SYNOPSYS_UNCONNECTED__0, prev_parallel[6:0]}) );
  usb_encoder D ( .clk(clk), .n_rst(n_rst), .clk12(clk12), .serial_out(
        serial_out), .enc_en(enc_en), .eop_en(eop_en), .eop_reset(eop_reset), 
        .bit_stuff_en(bit_stuff_en), .bytecomplete(bytecomplete), .dminus_out(
        dminus_out), .dplus_out(dplus_out) );
  CDL_CRC_16 E ( .clk(clk), .n_rst(n_rst), .clk12(clk12), .crc_en(crc_en), 
        .input_data(serial_out), .reset_crc(reset_crc), .inverted_crc(CRC) );
  usb_timer F ( .clk(clk), .n_rst(n_rst), .serial_out(serial_out), .timer_en(
        timer_en), .bit_stuff_en(bit_stuff_en), .clk12(clk12), .bytecomplete(
        bytecomplete), .bytealmostcomplete(bytealmostcomplete) );
endmodule

