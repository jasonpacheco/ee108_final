////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: div.v
// /___/   /\     Timestamp: Fri Dec  5 17:58:57 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog ./tmp/_cg/div.ngc ./tmp/_cg/div.v 
// Device	: 5vlx110tff1136-1
// Input file	: ./tmp/_cg/div.ngc
// Output file	: ./tmp/_cg/div.v
// # of Modules	: 1
// Design Name	: div
// Xilinx        : /opt/xilinx/14.6/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module div (
  rfd, clk, dividend, quotient, divisor, fractional
)/* synthesis syn_black_box syn_noprune=1 */;
  output rfd;
  input clk;
  input [10 : 0] dividend;
  output [10 : 0] quotient;
  input [2 : 0] divisor;
  output [2 : 0] fractional;
  
  // synthesis translate_off
  
  wire NlwRenamedSig_OI_rfd;
  wire \blk00000003/sig0000019c ;
  wire \blk00000003/sig0000019b ;
  wire \blk00000003/sig0000019a ;
  wire \blk00000003/sig00000199 ;
  wire \blk00000003/sig00000198 ;
  wire \blk00000003/sig00000197 ;
  wire \blk00000003/sig00000196 ;
  wire \blk00000003/sig00000195 ;
  wire \blk00000003/sig00000194 ;
  wire \blk00000003/sig00000193 ;
  wire \blk00000003/sig00000192 ;
  wire \blk00000003/sig00000191 ;
  wire \blk00000003/sig00000190 ;
  wire \blk00000003/sig0000018f ;
  wire \blk00000003/sig0000018e ;
  wire \blk00000003/sig0000018d ;
  wire \blk00000003/sig0000018c ;
  wire \blk00000003/sig0000018b ;
  wire \blk00000003/sig0000018a ;
  wire \blk00000003/sig00000189 ;
  wire \blk00000003/sig00000188 ;
  wire \blk00000003/sig00000187 ;
  wire \blk00000003/sig00000186 ;
  wire \blk00000003/sig00000185 ;
  wire \blk00000003/sig00000184 ;
  wire \blk00000003/sig00000183 ;
  wire \blk00000003/sig00000182 ;
  wire \blk00000003/sig00000181 ;
  wire \blk00000003/sig00000180 ;
  wire \blk00000003/sig0000017f ;
  wire \blk00000003/sig0000017e ;
  wire \blk00000003/sig0000017d ;
  wire \blk00000003/sig0000017c ;
  wire \blk00000003/sig0000017b ;
  wire \blk00000003/sig0000017a ;
  wire \blk00000003/sig00000179 ;
  wire \blk00000003/sig00000178 ;
  wire \blk00000003/sig00000177 ;
  wire \blk00000003/sig00000176 ;
  wire \blk00000003/sig00000175 ;
  wire \blk00000003/sig00000174 ;
  wire \blk00000003/sig00000173 ;
  wire \blk00000003/sig00000172 ;
  wire \blk00000003/sig00000171 ;
  wire \blk00000003/sig00000170 ;
  wire \blk00000003/sig0000016f ;
  wire \blk00000003/sig0000016e ;
  wire \blk00000003/sig0000016d ;
  wire \blk00000003/sig0000016c ;
  wire \blk00000003/sig0000016b ;
  wire \blk00000003/sig0000016a ;
  wire \blk00000003/sig00000169 ;
  wire \blk00000003/sig00000168 ;
  wire \blk00000003/sig00000167 ;
  wire \blk00000003/sig00000166 ;
  wire \blk00000003/sig00000165 ;
  wire \blk00000003/sig00000164 ;
  wire \blk00000003/sig00000163 ;
  wire \blk00000003/sig00000162 ;
  wire \blk00000003/sig00000161 ;
  wire \blk00000003/sig00000160 ;
  wire \blk00000003/sig0000015f ;
  wire \blk00000003/sig0000015e ;
  wire \blk00000003/sig0000015d ;
  wire \blk00000003/sig0000015c ;
  wire \blk00000003/sig0000015b ;
  wire \blk00000003/sig0000015a ;
  wire \blk00000003/sig00000159 ;
  wire \blk00000003/sig00000158 ;
  wire \blk00000003/sig00000157 ;
  wire \blk00000003/sig00000156 ;
  wire \blk00000003/sig00000155 ;
  wire \blk00000003/sig00000154 ;
  wire \blk00000003/sig00000153 ;
  wire \blk00000003/sig00000152 ;
  wire \blk00000003/sig00000151 ;
  wire \blk00000003/sig00000150 ;
  wire \blk00000003/sig0000014f ;
  wire \blk00000003/sig0000014e ;
  wire \blk00000003/sig0000014d ;
  wire \blk00000003/sig0000014c ;
  wire \blk00000003/sig0000014b ;
  wire \blk00000003/sig0000014a ;
  wire \blk00000003/sig00000149 ;
  wire \blk00000003/sig00000148 ;
  wire \blk00000003/sig00000147 ;
  wire \blk00000003/sig00000146 ;
  wire \blk00000003/sig00000145 ;
  wire \blk00000003/sig00000144 ;
  wire \blk00000003/sig00000143 ;
  wire \blk00000003/sig00000142 ;
  wire \blk00000003/sig00000141 ;
  wire \blk00000003/sig00000140 ;
  wire \blk00000003/sig0000013f ;
  wire \blk00000003/sig0000013e ;
  wire \blk00000003/sig0000013d ;
  wire \blk00000003/sig0000013c ;
  wire \blk00000003/sig0000013b ;
  wire \blk00000003/sig0000013a ;
  wire \blk00000003/sig00000139 ;
  wire \blk00000003/sig00000138 ;
  wire \blk00000003/sig00000137 ;
  wire \blk00000003/sig00000136 ;
  wire \blk00000003/sig00000135 ;
  wire \blk00000003/sig00000134 ;
  wire \blk00000003/sig00000133 ;
  wire \blk00000003/sig00000132 ;
  wire \blk00000003/sig00000131 ;
  wire \blk00000003/sig00000130 ;
  wire \blk00000003/sig0000012f ;
  wire \blk00000003/sig0000012e ;
  wire \blk00000003/sig0000012d ;
  wire \blk00000003/sig0000012c ;
  wire \blk00000003/sig0000012b ;
  wire \blk00000003/sig0000012a ;
  wire \blk00000003/sig00000129 ;
  wire \blk00000003/sig00000128 ;
  wire \blk00000003/sig00000127 ;
  wire \blk00000003/sig00000126 ;
  wire \blk00000003/sig00000125 ;
  wire \blk00000003/sig00000124 ;
  wire \blk00000003/sig00000123 ;
  wire \blk00000003/sig00000122 ;
  wire \blk00000003/sig00000121 ;
  wire \blk00000003/sig00000120 ;
  wire \blk00000003/sig0000011f ;
  wire \blk00000003/sig0000011e ;
  wire \blk00000003/sig0000011d ;
  wire \blk00000003/sig0000011c ;
  wire \blk00000003/sig0000011b ;
  wire \blk00000003/sig0000011a ;
  wire \blk00000003/sig00000119 ;
  wire \blk00000003/sig00000118 ;
  wire \blk00000003/sig00000117 ;
  wire \blk00000003/sig00000116 ;
  wire \blk00000003/sig00000115 ;
  wire \blk00000003/sig00000114 ;
  wire \blk00000003/sig00000113 ;
  wire \blk00000003/sig00000112 ;
  wire \blk00000003/sig00000111 ;
  wire \blk00000003/sig00000110 ;
  wire \blk00000003/sig0000010f ;
  wire \blk00000003/sig0000010e ;
  wire \blk00000003/sig0000010d ;
  wire \blk00000003/sig0000010c ;
  wire \blk00000003/sig0000010b ;
  wire \blk00000003/sig0000010a ;
  wire \blk00000003/sig00000109 ;
  wire \blk00000003/sig00000108 ;
  wire \blk00000003/sig00000107 ;
  wire \blk00000003/sig00000106 ;
  wire \blk00000003/sig00000105 ;
  wire \blk00000003/sig00000104 ;
  wire \blk00000003/sig00000103 ;
  wire \blk00000003/sig00000102 ;
  wire \blk00000003/sig00000101 ;
  wire \blk00000003/sig00000100 ;
  wire \blk00000003/sig000000ff ;
  wire \blk00000003/sig000000fe ;
  wire \blk00000003/sig000000fd ;
  wire \blk00000003/sig000000fc ;
  wire \blk00000003/sig000000fb ;
  wire \blk00000003/sig000000fa ;
  wire \blk00000003/sig000000f9 ;
  wire \blk00000003/sig000000f8 ;
  wire \blk00000003/sig000000f7 ;
  wire \blk00000003/sig000000f6 ;
  wire \blk00000003/sig000000f5 ;
  wire \blk00000003/sig000000f4 ;
  wire \blk00000003/sig000000f3 ;
  wire \blk00000003/sig000000f2 ;
  wire \blk00000003/sig000000f1 ;
  wire \blk00000003/sig000000f0 ;
  wire \blk00000003/sig000000ef ;
  wire \blk00000003/sig000000ee ;
  wire \blk00000003/sig000000ed ;
  wire \blk00000003/sig000000ec ;
  wire \blk00000003/sig000000eb ;
  wire \blk00000003/sig000000ea ;
  wire \blk00000003/sig000000e9 ;
  wire \blk00000003/sig000000e8 ;
  wire \blk00000003/sig000000e7 ;
  wire \blk00000003/sig000000e6 ;
  wire \blk00000003/sig000000e5 ;
  wire \blk00000003/sig000000e4 ;
  wire \blk00000003/sig000000e3 ;
  wire \blk00000003/sig000000e2 ;
  wire \blk00000003/sig000000e1 ;
  wire \blk00000003/sig000000e0 ;
  wire \blk00000003/sig000000df ;
  wire \blk00000003/sig000000de ;
  wire \blk00000003/sig000000dd ;
  wire \blk00000003/sig000000dc ;
  wire \blk00000003/sig000000db ;
  wire \blk00000003/sig000000da ;
  wire \blk00000003/sig000000d9 ;
  wire \blk00000003/sig000000d8 ;
  wire \blk00000003/sig000000d7 ;
  wire \blk00000003/sig000000d6 ;
  wire \blk00000003/sig000000d5 ;
  wire \blk00000003/sig000000d4 ;
  wire \blk00000003/sig000000d3 ;
  wire \blk00000003/sig000000d2 ;
  wire \blk00000003/sig000000d1 ;
  wire \blk00000003/sig000000d0 ;
  wire \blk00000003/sig000000cf ;
  wire \blk00000003/sig000000ce ;
  wire \blk00000003/sig000000cd ;
  wire \blk00000003/sig000000cc ;
  wire \blk00000003/sig000000cb ;
  wire \blk00000003/sig000000ca ;
  wire \blk00000003/sig000000c9 ;
  wire \blk00000003/sig000000c8 ;
  wire \blk00000003/sig000000c7 ;
  wire \blk00000003/sig000000c6 ;
  wire \blk00000003/sig000000c5 ;
  wire \blk00000003/sig000000c4 ;
  wire \blk00000003/sig000000c3 ;
  wire \blk00000003/sig000000c2 ;
  wire \blk00000003/sig000000c1 ;
  wire \blk00000003/sig000000c0 ;
  wire \blk00000003/sig000000bf ;
  wire \blk00000003/sig000000be ;
  wire \blk00000003/sig000000bd ;
  wire \blk00000003/sig000000bc ;
  wire \blk00000003/sig000000bb ;
  wire \blk00000003/sig000000ba ;
  wire \blk00000003/sig000000b9 ;
  wire \blk00000003/sig000000b8 ;
  wire \blk00000003/sig000000b7 ;
  wire \blk00000003/sig000000b6 ;
  wire \blk00000003/sig000000b5 ;
  wire \blk00000003/sig000000b4 ;
  wire \blk00000003/sig000000b3 ;
  wire \blk00000003/sig000000b2 ;
  wire \blk00000003/sig000000b1 ;
  wire \blk00000003/sig000000b0 ;
  wire \blk00000003/sig000000af ;
  wire \blk00000003/sig000000ae ;
  wire \blk00000003/sig000000ad ;
  wire \blk00000003/sig000000ac ;
  wire \blk00000003/sig000000ab ;
  wire \blk00000003/sig000000aa ;
  wire \blk00000003/sig000000a9 ;
  wire \blk00000003/sig000000a8 ;
  wire \blk00000003/sig000000a7 ;
  wire \blk00000003/sig000000a6 ;
  wire \blk00000003/sig000000a5 ;
  wire \blk00000003/sig000000a4 ;
  wire \blk00000003/sig000000a3 ;
  wire \blk00000003/sig000000a2 ;
  wire \blk00000003/sig000000a1 ;
  wire \blk00000003/sig000000a0 ;
  wire \blk00000003/sig0000009f ;
  wire \blk00000003/sig0000009e ;
  wire \blk00000003/sig0000009d ;
  wire \blk00000003/sig0000009c ;
  wire \blk00000003/sig0000009b ;
  wire \blk00000003/sig0000009a ;
  wire \blk00000003/sig00000099 ;
  wire \blk00000003/sig00000098 ;
  wire \blk00000003/sig00000097 ;
  wire \blk00000003/sig00000096 ;
  wire \blk00000003/sig00000095 ;
  wire \blk00000003/sig00000094 ;
  wire \blk00000003/sig00000093 ;
  wire \blk00000003/sig00000092 ;
  wire \blk00000003/sig00000091 ;
  wire \blk00000003/sig00000090 ;
  wire \blk00000003/sig0000008f ;
  wire \blk00000003/sig0000008e ;
  wire \blk00000003/sig0000008d ;
  wire \blk00000003/sig0000008c ;
  wire \blk00000003/sig0000008b ;
  wire \blk00000003/sig0000008a ;
  wire \blk00000003/sig00000089 ;
  wire \blk00000003/sig00000088 ;
  wire \blk00000003/sig00000087 ;
  wire \blk00000003/sig00000086 ;
  wire \blk00000003/sig00000085 ;
  wire \blk00000003/sig00000084 ;
  wire \blk00000003/sig00000083 ;
  wire \blk00000003/sig00000082 ;
  wire \blk00000003/sig00000081 ;
  wire \blk00000003/sig00000080 ;
  wire \blk00000003/sig0000007f ;
  wire \blk00000003/sig0000007e ;
  wire \blk00000003/sig0000007d ;
  wire \blk00000003/sig0000007c ;
  wire \blk00000003/sig0000007b ;
  wire \blk00000003/sig0000007a ;
  wire \blk00000003/sig00000079 ;
  wire \blk00000003/sig00000078 ;
  wire \blk00000003/sig00000077 ;
  wire \blk00000003/sig00000076 ;
  wire \blk00000003/sig00000075 ;
  wire \blk00000003/sig00000074 ;
  wire \blk00000003/sig00000073 ;
  wire \blk00000003/sig00000072 ;
  wire \blk00000003/sig00000071 ;
  wire \blk00000003/sig00000070 ;
  wire \blk00000003/sig0000006f ;
  wire \blk00000003/sig0000006e ;
  wire \blk00000003/sig0000006d ;
  wire \blk00000003/sig0000006c ;
  wire \blk00000003/sig0000006b ;
  wire \blk00000003/sig0000006a ;
  wire \blk00000003/sig00000069 ;
  wire \blk00000003/sig00000068 ;
  wire \blk00000003/sig00000067 ;
  wire \blk00000003/sig00000066 ;
  wire \blk00000003/sig00000065 ;
  wire \blk00000003/sig00000064 ;
  wire \blk00000003/sig00000063 ;
  wire \blk00000003/sig00000062 ;
  wire \blk00000003/sig00000061 ;
  wire \blk00000003/sig00000060 ;
  wire \blk00000003/sig0000005f ;
  wire \blk00000003/sig0000005e ;
  wire \blk00000003/sig0000005d ;
  wire \blk00000003/sig0000005c ;
  wire \blk00000003/sig0000005b ;
  wire \blk00000003/sig0000005a ;
  wire \blk00000003/sig00000059 ;
  wire \blk00000003/sig00000058 ;
  wire \blk00000003/sig00000057 ;
  wire \blk00000003/sig00000056 ;
  wire \blk00000003/sig00000055 ;
  wire \blk00000003/sig00000054 ;
  wire \blk00000003/sig00000053 ;
  wire \blk00000003/sig00000052 ;
  wire \blk00000003/sig00000051 ;
  wire \blk00000003/sig00000050 ;
  wire \blk00000003/sig0000004f ;
  wire \blk00000003/sig0000004e ;
  wire \blk00000003/sig0000004d ;
  wire \blk00000003/sig0000004c ;
  wire \blk00000003/sig0000004b ;
  wire \blk00000003/sig0000004a ;
  wire \blk00000003/sig00000049 ;
  wire \blk00000003/sig00000048 ;
  wire \blk00000003/sig00000047 ;
  wire \blk00000003/sig00000046 ;
  wire \blk00000003/sig00000045 ;
  wire \blk00000003/sig00000044 ;
  wire \blk00000003/sig00000043 ;
  wire \blk00000003/sig00000042 ;
  wire \blk00000003/sig00000041 ;
  wire \blk00000003/sig00000040 ;
  wire \blk00000003/sig0000003f ;
  wire \blk00000003/sig0000003e ;
  wire \blk00000003/sig0000003d ;
  wire \blk00000003/sig0000003c ;
  wire \blk00000003/sig0000003b ;
  wire \blk00000003/sig0000003a ;
  wire \blk00000003/sig00000039 ;
  wire \blk00000003/sig00000038 ;
  wire \blk00000003/sig00000037 ;
  wire \blk00000003/sig00000036 ;
  wire \blk00000003/sig00000035 ;
  wire \blk00000003/sig00000034 ;
  wire \blk00000003/sig00000033 ;
  wire \blk00000003/sig00000032 ;
  wire \blk00000003/sig00000031 ;
  wire \blk00000003/sig00000030 ;
  wire \blk00000003/sig0000002f ;
  wire \blk00000003/sig0000002e ;
  wire \blk00000003/sig0000002d ;
  wire \blk00000003/sig0000002c ;
  wire \blk00000003/sig0000002b ;
  wire \blk00000003/sig0000002a ;
  wire \blk00000003/sig00000029 ;
  wire \blk00000003/sig00000028 ;
  wire \blk00000003/sig00000027 ;
  wire \blk00000003/sig00000026 ;
  wire \blk00000003/sig00000025 ;
  wire \blk00000003/sig00000024 ;
  wire \blk00000003/sig00000023 ;
  wire \blk00000003/sig00000022 ;
  wire \blk00000003/sig00000021 ;
  wire \blk00000003/sig00000020 ;
  wire \blk00000003/sig0000001e ;
  wire NLW_blk00000001_P_UNCONNECTED;
  wire NLW_blk00000002_G_UNCONNECTED;
  wire [10 : 0] dividend_0;
  wire [2 : 0] divisor_1;
  wire [10 : 0] quotient_2;
  wire [2 : 0] fractional_3;
  assign
    dividend_0[10] = dividend[10],
    dividend_0[9] = dividend[9],
    dividend_0[8] = dividend[8],
    dividend_0[7] = dividend[7],
    dividend_0[6] = dividend[6],
    dividend_0[5] = dividend[5],
    dividend_0[4] = dividend[4],
    dividend_0[3] = dividend[3],
    dividend_0[2] = dividend[2],
    dividend_0[1] = dividend[1],
    dividend_0[0] = dividend[0],
    quotient[10] = quotient_2[10],
    quotient[9] = quotient_2[9],
    quotient[8] = quotient_2[8],
    quotient[7] = quotient_2[7],
    quotient[6] = quotient_2[6],
    quotient[5] = quotient_2[5],
    quotient[4] = quotient_2[4],
    quotient[3] = quotient_2[3],
    quotient[2] = quotient_2[2],
    quotient[1] = quotient_2[1],
    quotient[0] = quotient_2[0],
    divisor_1[2] = divisor[2],
    divisor_1[1] = divisor[1],
    divisor_1[0] = divisor[0],
    rfd = NlwRenamedSig_OI_rfd,
    fractional[2] = fractional_3[2],
    fractional[1] = fractional_3[1],
    fractional[0] = fractional_3[0];
  VCC   blk00000001 (
    .P(NLW_blk00000001_P_UNCONNECTED)
  );
  GND   blk00000002 (
    .G(NLW_blk00000002_G_UNCONNECTED)
  );
  INV   \blk00000003/blk00000190  (
    .I(\blk00000003/sig00000068 ),
    .O(\blk00000003/sig000000a3 )
  );
  INV   \blk00000003/blk0000018f  (
    .I(\blk00000003/sig00000067 ),
    .O(\blk00000003/sig000000a6 )
  );
  INV   \blk00000003/blk0000018e  (
    .I(\blk00000003/sig00000182 ),
    .O(\blk00000003/sig0000008a )
  );
  INV   \blk00000003/blk0000018d  (
    .I(\blk00000003/sig00000183 ),
    .O(\blk00000003/sig0000008b )
  );
  INV   \blk00000003/blk0000018c  (
    .I(\blk00000003/sig00000184 ),
    .O(\blk00000003/sig0000008c )
  );
  INV   \blk00000003/blk0000018b  (
    .I(\blk00000003/sig00000185 ),
    .O(\blk00000003/sig0000008d )
  );
  INV   \blk00000003/blk0000018a  (
    .I(\blk00000003/sig00000186 ),
    .O(\blk00000003/sig0000008e )
  );
  INV   \blk00000003/blk00000189  (
    .I(\blk00000003/sig00000187 ),
    .O(\blk00000003/sig0000008f )
  );
  INV   \blk00000003/blk00000188  (
    .I(\blk00000003/sig00000188 ),
    .O(\blk00000003/sig00000090 )
  );
  INV   \blk00000003/blk00000187  (
    .I(\blk00000003/sig00000189 ),
    .O(\blk00000003/sig00000091 )
  );
  INV   \blk00000003/blk00000186  (
    .I(\blk00000003/sig0000018a ),
    .O(\blk00000003/sig00000092 )
  );
  INV   \blk00000003/blk00000185  (
    .I(\blk00000003/sig0000018b ),
    .O(\blk00000003/sig00000093 )
  );
  INV   \blk00000003/blk00000184  (
    .I(\blk00000003/sig0000014c ),
    .O(\blk00000003/sig00000158 )
  );
  INV   \blk00000003/blk00000183  (
    .I(\blk00000003/sig0000013a ),
    .O(\blk00000003/sig00000146 )
  );
  INV   \blk00000003/blk00000182  (
    .I(\blk00000003/sig00000128 ),
    .O(\blk00000003/sig00000134 )
  );
  INV   \blk00000003/blk00000181  (
    .I(\blk00000003/sig00000028 ),
    .O(\blk00000003/sig00000122 )
  );
  INV   \blk00000003/blk00000180  (
    .I(\blk00000003/sig0000003b ),
    .O(\blk00000003/sig00000111 )
  );
  INV   \blk00000003/blk0000017f  (
    .I(\blk00000003/sig00000047 ),
    .O(\blk00000003/sig00000100 )
  );
  INV   \blk00000003/blk0000017e  (
    .I(\blk00000003/sig00000064 ),
    .O(\blk00000003/sig000000ef )
  );
  INV   \blk00000003/blk0000017d  (
    .I(\blk00000003/sig0000005b ),
    .O(\blk00000003/sig000000dd )
  );
  INV   \blk00000003/blk0000017c  (
    .I(\blk00000003/sig00000061 ),
    .O(\blk00000003/sig000000cb )
  );
  INV   \blk00000003/blk0000017b  (
    .I(\blk00000003/sig00000063 ),
    .O(\blk00000003/sig000000b9 )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \blk00000003/blk0000017a  (
    .I0(\blk00000003/sig0000015d ),
    .I1(\blk00000003/sig00000089 ),
    .I2(\blk00000003/sig0000015e ),
    .O(\blk00000003/sig0000018d )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \blk00000003/blk00000179  (
    .I0(\blk00000003/sig0000015c ),
    .I1(\blk00000003/sig00000088 ),
    .I2(\blk00000003/sig0000015e ),
    .O(\blk00000003/sig00000192 )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \blk00000003/blk00000178  (
    .I0(\blk00000003/sig0000015b ),
    .I1(\blk00000003/sig00000087 ),
    .I2(\blk00000003/sig0000015e ),
    .O(\blk00000003/sig00000198 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000177  (
    .I0(\blk00000003/sig0000014b ),
    .I1(\blk00000003/sig0000014c ),
    .O(\blk00000003/sig0000014f )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000176  (
    .I0(\blk00000003/sig0000014a ),
    .I1(\blk00000003/sig00000086 ),
    .I2(\blk00000003/sig0000014c ),
    .O(\blk00000003/sig00000152 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000175  (
    .I0(\blk00000003/sig00000149 ),
    .I1(\blk00000003/sig00000085 ),
    .I2(\blk00000003/sig0000014c ),
    .O(\blk00000003/sig00000155 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000174  (
    .I0(\blk00000003/sig00000065 ),
    .I1(\blk00000003/sig00000084 ),
    .I2(\blk00000003/sig0000014c ),
    .O(\blk00000003/sig00000159 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000173  (
    .I0(\blk00000003/sig00000139 ),
    .I1(\blk00000003/sig0000013a ),
    .O(\blk00000003/sig0000013d )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000172  (
    .I0(\blk00000003/sig00000138 ),
    .I1(\blk00000003/sig00000083 ),
    .I2(\blk00000003/sig0000013a ),
    .O(\blk00000003/sig00000140 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000171  (
    .I0(\blk00000003/sig00000137 ),
    .I1(\blk00000003/sig00000082 ),
    .I2(\blk00000003/sig0000013a ),
    .O(\blk00000003/sig00000143 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000170  (
    .I0(\blk00000003/sig00000023 ),
    .I1(\blk00000003/sig00000081 ),
    .I2(\blk00000003/sig0000013a ),
    .O(\blk00000003/sig00000147 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000016f  (
    .I0(\blk00000003/sig00000127 ),
    .I1(\blk00000003/sig00000128 ),
    .O(\blk00000003/sig0000012b )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk0000016e  (
    .I0(\blk00000003/sig00000126 ),
    .I1(\blk00000003/sig00000080 ),
    .I2(\blk00000003/sig00000128 ),
    .O(\blk00000003/sig0000012e )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk0000016d  (
    .I0(\blk00000003/sig00000125 ),
    .I1(\blk00000003/sig0000007f ),
    .I2(\blk00000003/sig00000128 ),
    .O(\blk00000003/sig00000131 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk0000016c  (
    .I0(\blk00000003/sig00000027 ),
    .I1(\blk00000003/sig0000007e ),
    .I2(\blk00000003/sig00000128 ),
    .O(\blk00000003/sig00000135 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000016b  (
    .I0(\blk00000003/sig00000116 ),
    .I1(\blk00000003/sig00000028 ),
    .O(\blk00000003/sig00000119 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk0000016a  (
    .I0(\blk00000003/sig00000115 ),
    .I1(\blk00000003/sig0000007d ),
    .I2(\blk00000003/sig00000028 ),
    .O(\blk00000003/sig0000011c )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000169  (
    .I0(\blk00000003/sig00000114 ),
    .I1(\blk00000003/sig0000007c ),
    .I2(\blk00000003/sig00000028 ),
    .O(\blk00000003/sig0000011f )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000168  (
    .I0(\blk00000003/sig0000003a ),
    .I1(\blk00000003/sig0000007b ),
    .I2(\blk00000003/sig00000028 ),
    .O(\blk00000003/sig00000123 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000167  (
    .I0(\blk00000003/sig00000105 ),
    .I1(\blk00000003/sig0000003b ),
    .O(\blk00000003/sig00000108 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000166  (
    .I0(\blk00000003/sig00000104 ),
    .I1(\blk00000003/sig0000007a ),
    .I2(\blk00000003/sig0000003b ),
    .O(\blk00000003/sig0000010b )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000165  (
    .I0(\blk00000003/sig00000103 ),
    .I1(\blk00000003/sig00000079 ),
    .I2(\blk00000003/sig0000003b ),
    .O(\blk00000003/sig0000010e )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000164  (
    .I0(\blk00000003/sig00000046 ),
    .I1(\blk00000003/sig00000078 ),
    .I2(\blk00000003/sig0000003b ),
    .O(\blk00000003/sig00000112 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000163  (
    .I0(\blk00000003/sig000000f4 ),
    .I1(\blk00000003/sig00000047 ),
    .O(\blk00000003/sig000000f7 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000162  (
    .I0(\blk00000003/sig000000f3 ),
    .I1(\blk00000003/sig00000077 ),
    .I2(\blk00000003/sig00000047 ),
    .O(\blk00000003/sig000000fa )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000161  (
    .I0(\blk00000003/sig000000f2 ),
    .I1(\blk00000003/sig00000076 ),
    .I2(\blk00000003/sig00000047 ),
    .O(\blk00000003/sig000000fd )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000160  (
    .I0(\blk00000003/sig00000052 ),
    .I1(\blk00000003/sig00000075 ),
    .I2(\blk00000003/sig00000047 ),
    .O(\blk00000003/sig00000101 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000015f  (
    .I0(\blk00000003/sig000000e3 ),
    .I1(\blk00000003/sig00000064 ),
    .O(\blk00000003/sig000000e6 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk0000015e  (
    .I0(\blk00000003/sig000000e2 ),
    .I1(\blk00000003/sig00000074 ),
    .I2(\blk00000003/sig00000064 ),
    .O(\blk00000003/sig000000e9 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk0000015d  (
    .I0(\blk00000003/sig000000e1 ),
    .I1(\blk00000003/sig00000073 ),
    .I2(\blk00000003/sig00000064 ),
    .O(\blk00000003/sig000000ec )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk0000015c  (
    .I0(\blk00000003/sig0000005a ),
    .I1(\blk00000003/sig00000072 ),
    .I2(\blk00000003/sig00000064 ),
    .O(\blk00000003/sig000000f0 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000015b  (
    .I0(\blk00000003/sig000000d1 ),
    .I1(\blk00000003/sig0000005b ),
    .O(\blk00000003/sig000000d4 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk0000015a  (
    .I0(\blk00000003/sig000000d0 ),
    .I1(\blk00000003/sig00000071 ),
    .I2(\blk00000003/sig0000005b ),
    .O(\blk00000003/sig000000d7 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000159  (
    .I0(\blk00000003/sig000000cf ),
    .I1(\blk00000003/sig00000070 ),
    .I2(\blk00000003/sig0000005b ),
    .O(\blk00000003/sig000000da )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000158  (
    .I0(\blk00000003/sig000000e0 ),
    .I1(\blk00000003/sig0000006f ),
    .I2(\blk00000003/sig0000005b ),
    .O(\blk00000003/sig000000de )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000157  (
    .I0(\blk00000003/sig000000bf ),
    .I1(\blk00000003/sig00000061 ),
    .O(\blk00000003/sig000000c2 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000156  (
    .I0(\blk00000003/sig000000be ),
    .I1(\blk00000003/sig0000006e ),
    .I2(\blk00000003/sig00000061 ),
    .O(\blk00000003/sig000000c5 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000155  (
    .I0(\blk00000003/sig000000bd ),
    .I1(\blk00000003/sig0000006d ),
    .I2(\blk00000003/sig00000061 ),
    .O(\blk00000003/sig000000c8 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000154  (
    .I0(\blk00000003/sig000000ce ),
    .I1(\blk00000003/sig0000006c ),
    .I2(\blk00000003/sig00000061 ),
    .O(\blk00000003/sig000000cc )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk00000153  (
    .I0(\blk00000003/sig000000ad ),
    .I1(\blk00000003/sig00000063 ),
    .O(\blk00000003/sig000000b0 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000152  (
    .I0(\blk00000003/sig000000ac ),
    .I1(\blk00000003/sig0000006b ),
    .I2(\blk00000003/sig00000063 ),
    .O(\blk00000003/sig000000b3 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000151  (
    .I0(\blk00000003/sig000000ab ),
    .I1(\blk00000003/sig0000006a ),
    .I2(\blk00000003/sig00000063 ),
    .O(\blk00000003/sig000000b6 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk00000150  (
    .I0(\blk00000003/sig000000bc ),
    .I1(\blk00000003/sig00000069 ),
    .I2(\blk00000003/sig00000063 ),
    .O(\blk00000003/sig000000ba )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000014f  (
    .I0(\blk00000003/sig00000095 ),
    .I1(\blk00000003/sig00000066 ),
    .O(\blk00000003/sig000000a9 )
  );
  LUT1 #(
    .INIT ( 2'h1 ))
  \blk00000003/blk0000014e  (
    .I0(\blk00000003/sig0000015e ),
    .O(\blk00000003/sig00000094 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000014d  (
    .C(clk),
    .D(\blk00000003/sig00000196 ),
    .Q(\blk00000003/sig0000019c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000014c  (
    .C(clk),
    .D(\blk00000003/sig00000197 ),
    .Q(\blk00000003/sig0000019b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000014b  (
    .C(clk),
    .D(\blk00000003/sig0000018e ),
    .Q(fractional_3[2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000014a  (
    .C(clk),
    .D(\blk00000003/sig00000193 ),
    .Q(fractional_3[1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000149  (
    .C(clk),
    .D(\blk00000003/sig00000199 ),
    .Q(fractional_3[0])
  );
  MULT_AND   \blk00000003/blk00000148  (
    .I0(\blk00000003/sig00000087 ),
    .I1(\blk00000003/sig0000015e ),
    .LO(\blk00000003/sig0000019a )
  );
  MULT_AND   \blk00000003/blk00000147  (
    .I0(\blk00000003/sig00000088 ),
    .I1(\blk00000003/sig0000015e ),
    .LO(\blk00000003/sig00000194 )
  );
  MULT_AND   \blk00000003/blk00000146  (
    .I0(\blk00000003/sig00000089 ),
    .I1(\blk00000003/sig0000015e ),
    .LO(\blk00000003/sig0000018f )
  );
  MULT_AND   \blk00000003/blk00000145  (
    .I0(\blk00000003/sig0000001e ),
    .I1(\blk00000003/sig0000015e ),
    .LO(\blk00000003/sig00000195 )
  );
  MUXCY   \blk00000003/blk00000144  (
    .CI(\blk00000003/sig0000001e ),
    .DI(\blk00000003/sig0000019a ),
    .S(\blk00000003/sig00000198 ),
    .O(\blk00000003/sig00000191 )
  );
  XORCY   \blk00000003/blk00000143  (
    .CI(\blk00000003/sig0000001e ),
    .LI(\blk00000003/sig00000198 ),
    .O(\blk00000003/sig00000199 )
  );
  XORCY   \blk00000003/blk00000142  (
    .CI(\blk00000003/sig00000190 ),
    .LI(\blk00000003/sig0000001e ),
    .O(\blk00000003/sig00000197 )
  );
  MUXCY   \blk00000003/blk00000141  (
    .CI(\blk00000003/sig00000190 ),
    .DI(\blk00000003/sig00000195 ),
    .S(\blk00000003/sig0000001e ),
    .O(\blk00000003/sig00000196 )
  );
  MUXCY   \blk00000003/blk00000140  (
    .CI(\blk00000003/sig00000191 ),
    .DI(\blk00000003/sig00000194 ),
    .S(\blk00000003/sig00000192 ),
    .O(\blk00000003/sig0000018c )
  );
  XORCY   \blk00000003/blk0000013f  (
    .CI(\blk00000003/sig00000191 ),
    .LI(\blk00000003/sig00000192 ),
    .O(\blk00000003/sig00000193 )
  );
  MUXCY   \blk00000003/blk0000013e  (
    .CI(\blk00000003/sig0000018c ),
    .DI(\blk00000003/sig0000018f ),
    .S(\blk00000003/sig0000018d ),
    .O(\blk00000003/sig00000190 )
  );
  XORCY   \blk00000003/blk0000013d  (
    .CI(\blk00000003/sig0000018c ),
    .LI(\blk00000003/sig0000018d ),
    .O(\blk00000003/sig0000018e )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000013c  (
    .C(clk),
    .D(\blk00000003/sig0000014c ),
    .Q(\blk00000003/sig0000018b )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000013b  (
    .C(clk),
    .D(\blk00000003/sig00000181 ),
    .Q(\blk00000003/sig0000018a )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000013a  (
    .C(clk),
    .D(\blk00000003/sig00000180 ),
    .Q(\blk00000003/sig00000189 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000139  (
    .C(clk),
    .D(\blk00000003/sig0000017f ),
    .Q(\blk00000003/sig00000188 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000138  (
    .C(clk),
    .D(\blk00000003/sig0000017e ),
    .Q(\blk00000003/sig00000187 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000137  (
    .C(clk),
    .D(\blk00000003/sig0000017d ),
    .Q(\blk00000003/sig00000186 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000136  (
    .C(clk),
    .D(\blk00000003/sig0000017c ),
    .Q(\blk00000003/sig00000185 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000135  (
    .C(clk),
    .D(\blk00000003/sig0000017b ),
    .Q(\blk00000003/sig00000184 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000134  (
    .C(clk),
    .D(\blk00000003/sig0000017a ),
    .Q(\blk00000003/sig00000183 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000133  (
    .C(clk),
    .D(\blk00000003/sig00000179 ),
    .Q(\blk00000003/sig00000182 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000132  (
    .C(clk),
    .D(\blk00000003/sig0000013a ),
    .Q(\blk00000003/sig00000181 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000131  (
    .C(clk),
    .D(\blk00000003/sig00000178 ),
    .Q(\blk00000003/sig00000180 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000130  (
    .C(clk),
    .D(\blk00000003/sig00000177 ),
    .Q(\blk00000003/sig0000017f )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000012f  (
    .C(clk),
    .D(\blk00000003/sig00000176 ),
    .Q(\blk00000003/sig0000017e )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000012e  (
    .C(clk),
    .D(\blk00000003/sig00000175 ),
    .Q(\blk00000003/sig0000017d )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000012d  (
    .C(clk),
    .D(\blk00000003/sig00000174 ),
    .Q(\blk00000003/sig0000017c )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000012c  (
    .C(clk),
    .D(\blk00000003/sig00000173 ),
    .Q(\blk00000003/sig0000017b )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000012b  (
    .C(clk),
    .D(\blk00000003/sig00000172 ),
    .Q(\blk00000003/sig0000017a )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000012a  (
    .C(clk),
    .D(\blk00000003/sig00000171 ),
    .Q(\blk00000003/sig00000179 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000129  (
    .C(clk),
    .D(\blk00000003/sig00000128 ),
    .Q(\blk00000003/sig00000178 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000128  (
    .C(clk),
    .D(\blk00000003/sig00000029 ),
    .Q(\blk00000003/sig00000177 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000127  (
    .C(clk),
    .D(\blk00000003/sig0000002b ),
    .Q(\blk00000003/sig00000176 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000126  (
    .C(clk),
    .D(\blk00000003/sig0000002d ),
    .Q(\blk00000003/sig00000175 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000125  (
    .C(clk),
    .D(\blk00000003/sig0000002f ),
    .Q(\blk00000003/sig00000174 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000124  (
    .C(clk),
    .D(\blk00000003/sig00000031 ),
    .Q(\blk00000003/sig00000173 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000123  (
    .C(clk),
    .D(\blk00000003/sig00000033 ),
    .Q(\blk00000003/sig00000172 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000122  (
    .C(clk),
    .D(\blk00000003/sig00000035 ),
    .Q(\blk00000003/sig00000171 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000121  (
    .C(clk),
    .D(\blk00000003/sig00000170 ),
    .Q(\blk00000003/sig00000053 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000120  (
    .C(clk),
    .D(\blk00000003/sig0000016f ),
    .Q(\blk00000003/sig00000054 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000011f  (
    .C(clk),
    .D(\blk00000003/sig0000016e ),
    .Q(\blk00000003/sig00000055 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000011e  (
    .C(clk),
    .D(\blk00000003/sig0000016d ),
    .Q(\blk00000003/sig00000056 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000011d  (
    .C(clk),
    .D(\blk00000003/sig0000016c ),
    .Q(\blk00000003/sig00000057 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000011c  (
    .C(clk),
    .D(\blk00000003/sig0000016b ),
    .Q(\blk00000003/sig00000058 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000011b  (
    .C(clk),
    .D(\blk00000003/sig0000016a ),
    .Q(\blk00000003/sig00000059 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000011a  (
    .C(clk),
    .D(\blk00000003/sig00000169 ),
    .Q(\blk00000003/sig000000e0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000119  (
    .C(clk),
    .D(\blk00000003/sig00000168 ),
    .Q(\blk00000003/sig00000170 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000118  (
    .C(clk),
    .D(\blk00000003/sig00000167 ),
    .Q(\blk00000003/sig0000016f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000117  (
    .C(clk),
    .D(\blk00000003/sig00000166 ),
    .Q(\blk00000003/sig0000016e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000116  (
    .C(clk),
    .D(\blk00000003/sig00000165 ),
    .Q(\blk00000003/sig0000016d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000115  (
    .C(clk),
    .D(\blk00000003/sig00000164 ),
    .Q(\blk00000003/sig0000016c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000114  (
    .C(clk),
    .D(\blk00000003/sig00000163 ),
    .Q(\blk00000003/sig0000016b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000113  (
    .C(clk),
    .D(\blk00000003/sig00000162 ),
    .Q(\blk00000003/sig0000016a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000112  (
    .C(clk),
    .D(\blk00000003/sig00000161 ),
    .Q(\blk00000003/sig00000169 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000111  (
    .C(clk),
    .D(\blk00000003/sig00000160 ),
    .Q(\blk00000003/sig000000ce )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000110  (
    .C(clk),
    .D(\blk00000003/sig0000009f ),
    .Q(\blk00000003/sig00000168 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000010f  (
    .C(clk),
    .D(\blk00000003/sig0000009e ),
    .Q(\blk00000003/sig00000167 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000010e  (
    .C(clk),
    .D(\blk00000003/sig0000009d ),
    .Q(\blk00000003/sig00000166 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000010d  (
    .C(clk),
    .D(\blk00000003/sig0000009c ),
    .Q(\blk00000003/sig00000165 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000010c  (
    .C(clk),
    .D(\blk00000003/sig0000009b ),
    .Q(\blk00000003/sig00000164 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000010b  (
    .C(clk),
    .D(\blk00000003/sig0000009a ),
    .Q(\blk00000003/sig00000163 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000010a  (
    .C(clk),
    .D(\blk00000003/sig00000099 ),
    .Q(\blk00000003/sig00000162 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000109  (
    .C(clk),
    .D(\blk00000003/sig00000098 ),
    .Q(\blk00000003/sig00000161 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000108  (
    .C(clk),
    .D(\blk00000003/sig00000097 ),
    .Q(\blk00000003/sig00000160 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000107  (
    .C(clk),
    .D(\blk00000003/sig00000096 ),
    .Q(\blk00000003/sig000000bc )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000106  (
    .C(clk),
    .D(\blk00000003/sig00000157 ),
    .Q(\blk00000003/sig0000015f )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000105  (
    .C(clk),
    .D(\blk00000003/sig00000150 ),
    .Q(\blk00000003/sig0000015e )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000104  (
    .C(clk),
    .D(\blk00000003/sig00000153 ),
    .Q(\blk00000003/sig0000015d )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000103  (
    .C(clk),
    .D(\blk00000003/sig00000156 ),
    .Q(\blk00000003/sig0000015c )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000102  (
    .C(clk),
    .D(\blk00000003/sig0000015a ),
    .Q(\blk00000003/sig0000015b )
  );
  MUXCY   \blk00000003/blk00000101  (
    .CI(\blk00000003/sig00000158 ),
    .DI(\blk00000003/sig00000065 ),
    .S(\blk00000003/sig00000159 ),
    .O(\blk00000003/sig00000154 )
  );
  XORCY   \blk00000003/blk00000100  (
    .CI(\blk00000003/sig00000158 ),
    .LI(\blk00000003/sig00000159 ),
    .O(\blk00000003/sig0000015a )
  );
  MUXCY   \blk00000003/blk000000ff  (
    .CI(\blk00000003/sig0000014e ),
    .DI(\blk00000003/sig0000014b ),
    .S(\blk00000003/sig0000014f ),
    .O(\blk00000003/sig00000157 )
  );
  MUXCY   \blk00000003/blk000000fe  (
    .CI(\blk00000003/sig00000154 ),
    .DI(\blk00000003/sig00000149 ),
    .S(\blk00000003/sig00000155 ),
    .O(\blk00000003/sig00000151 )
  );
  MUXCY   \blk00000003/blk000000fd  (
    .CI(\blk00000003/sig00000151 ),
    .DI(\blk00000003/sig0000014a ),
    .S(\blk00000003/sig00000152 ),
    .O(\blk00000003/sig0000014e )
  );
  XORCY   \blk00000003/blk000000fc  (
    .CI(\blk00000003/sig00000154 ),
    .LI(\blk00000003/sig00000155 ),
    .O(\blk00000003/sig00000156 )
  );
  XORCY   \blk00000003/blk000000fb  (
    .CI(\blk00000003/sig00000151 ),
    .LI(\blk00000003/sig00000152 ),
    .O(\blk00000003/sig00000153 )
  );
  XORCY   \blk00000003/blk000000fa  (
    .CI(\blk00000003/sig0000014e ),
    .LI(\blk00000003/sig0000014f ),
    .O(\blk00000003/sig00000150 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000f9  (
    .C(clk),
    .D(\blk00000003/sig00000145 ),
    .Q(\blk00000003/sig0000014d )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000f8  (
    .C(clk),
    .D(\blk00000003/sig0000013e ),
    .Q(\blk00000003/sig0000014c )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000f7  (
    .C(clk),
    .D(\blk00000003/sig00000141 ),
    .Q(\blk00000003/sig0000014b )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000f6  (
    .C(clk),
    .D(\blk00000003/sig00000144 ),
    .Q(\blk00000003/sig0000014a )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000f5  (
    .C(clk),
    .D(\blk00000003/sig00000148 ),
    .Q(\blk00000003/sig00000149 )
  );
  MUXCY   \blk00000003/blk000000f4  (
    .CI(\blk00000003/sig00000146 ),
    .DI(\blk00000003/sig00000023 ),
    .S(\blk00000003/sig00000147 ),
    .O(\blk00000003/sig00000142 )
  );
  XORCY   \blk00000003/blk000000f3  (
    .CI(\blk00000003/sig00000146 ),
    .LI(\blk00000003/sig00000147 ),
    .O(\blk00000003/sig00000148 )
  );
  MUXCY   \blk00000003/blk000000f2  (
    .CI(\blk00000003/sig0000013c ),
    .DI(\blk00000003/sig00000139 ),
    .S(\blk00000003/sig0000013d ),
    .O(\blk00000003/sig00000145 )
  );
  MUXCY   \blk00000003/blk000000f1  (
    .CI(\blk00000003/sig00000142 ),
    .DI(\blk00000003/sig00000137 ),
    .S(\blk00000003/sig00000143 ),
    .O(\blk00000003/sig0000013f )
  );
  MUXCY   \blk00000003/blk000000f0  (
    .CI(\blk00000003/sig0000013f ),
    .DI(\blk00000003/sig00000138 ),
    .S(\blk00000003/sig00000140 ),
    .O(\blk00000003/sig0000013c )
  );
  XORCY   \blk00000003/blk000000ef  (
    .CI(\blk00000003/sig00000142 ),
    .LI(\blk00000003/sig00000143 ),
    .O(\blk00000003/sig00000144 )
  );
  XORCY   \blk00000003/blk000000ee  (
    .CI(\blk00000003/sig0000013f ),
    .LI(\blk00000003/sig00000140 ),
    .O(\blk00000003/sig00000141 )
  );
  XORCY   \blk00000003/blk000000ed  (
    .CI(\blk00000003/sig0000013c ),
    .LI(\blk00000003/sig0000013d ),
    .O(\blk00000003/sig0000013e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000ec  (
    .C(clk),
    .D(\blk00000003/sig00000133 ),
    .Q(\blk00000003/sig0000013b )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000eb  (
    .C(clk),
    .D(\blk00000003/sig0000012c ),
    .Q(\blk00000003/sig0000013a )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000ea  (
    .C(clk),
    .D(\blk00000003/sig0000012f ),
    .Q(\blk00000003/sig00000139 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000e9  (
    .C(clk),
    .D(\blk00000003/sig00000132 ),
    .Q(\blk00000003/sig00000138 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000e8  (
    .C(clk),
    .D(\blk00000003/sig00000136 ),
    .Q(\blk00000003/sig00000137 )
  );
  MUXCY   \blk00000003/blk000000e7  (
    .CI(\blk00000003/sig00000134 ),
    .DI(\blk00000003/sig00000027 ),
    .S(\blk00000003/sig00000135 ),
    .O(\blk00000003/sig00000130 )
  );
  XORCY   \blk00000003/blk000000e6  (
    .CI(\blk00000003/sig00000134 ),
    .LI(\blk00000003/sig00000135 ),
    .O(\blk00000003/sig00000136 )
  );
  MUXCY   \blk00000003/blk000000e5  (
    .CI(\blk00000003/sig0000012a ),
    .DI(\blk00000003/sig00000127 ),
    .S(\blk00000003/sig0000012b ),
    .O(\blk00000003/sig00000133 )
  );
  MUXCY   \blk00000003/blk000000e4  (
    .CI(\blk00000003/sig00000130 ),
    .DI(\blk00000003/sig00000125 ),
    .S(\blk00000003/sig00000131 ),
    .O(\blk00000003/sig0000012d )
  );
  MUXCY   \blk00000003/blk000000e3  (
    .CI(\blk00000003/sig0000012d ),
    .DI(\blk00000003/sig00000126 ),
    .S(\blk00000003/sig0000012e ),
    .O(\blk00000003/sig0000012a )
  );
  XORCY   \blk00000003/blk000000e2  (
    .CI(\blk00000003/sig00000130 ),
    .LI(\blk00000003/sig00000131 ),
    .O(\blk00000003/sig00000132 )
  );
  XORCY   \blk00000003/blk000000e1  (
    .CI(\blk00000003/sig0000012d ),
    .LI(\blk00000003/sig0000012e ),
    .O(\blk00000003/sig0000012f )
  );
  XORCY   \blk00000003/blk000000e0  (
    .CI(\blk00000003/sig0000012a ),
    .LI(\blk00000003/sig0000012b ),
    .O(\blk00000003/sig0000012c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000df  (
    .C(clk),
    .D(\blk00000003/sig00000121 ),
    .Q(\blk00000003/sig00000129 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000de  (
    .C(clk),
    .D(\blk00000003/sig0000011a ),
    .Q(\blk00000003/sig00000128 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000dd  (
    .C(clk),
    .D(\blk00000003/sig0000011d ),
    .Q(\blk00000003/sig00000127 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000dc  (
    .C(clk),
    .D(\blk00000003/sig00000120 ),
    .Q(\blk00000003/sig00000126 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000db  (
    .C(clk),
    .D(\blk00000003/sig00000124 ),
    .Q(\blk00000003/sig00000125 )
  );
  MUXCY   \blk00000003/blk000000da  (
    .CI(\blk00000003/sig00000122 ),
    .DI(\blk00000003/sig0000003a ),
    .S(\blk00000003/sig00000123 ),
    .O(\blk00000003/sig0000011e )
  );
  XORCY   \blk00000003/blk000000d9  (
    .CI(\blk00000003/sig00000122 ),
    .LI(\blk00000003/sig00000123 ),
    .O(\blk00000003/sig00000124 )
  );
  MUXCY   \blk00000003/blk000000d8  (
    .CI(\blk00000003/sig00000118 ),
    .DI(\blk00000003/sig00000116 ),
    .S(\blk00000003/sig00000119 ),
    .O(\blk00000003/sig00000121 )
  );
  MUXCY   \blk00000003/blk000000d7  (
    .CI(\blk00000003/sig0000011e ),
    .DI(\blk00000003/sig00000114 ),
    .S(\blk00000003/sig0000011f ),
    .O(\blk00000003/sig0000011b )
  );
  MUXCY   \blk00000003/blk000000d6  (
    .CI(\blk00000003/sig0000011b ),
    .DI(\blk00000003/sig00000115 ),
    .S(\blk00000003/sig0000011c ),
    .O(\blk00000003/sig00000118 )
  );
  XORCY   \blk00000003/blk000000d5  (
    .CI(\blk00000003/sig0000011e ),
    .LI(\blk00000003/sig0000011f ),
    .O(\blk00000003/sig00000120 )
  );
  XORCY   \blk00000003/blk000000d4  (
    .CI(\blk00000003/sig0000011b ),
    .LI(\blk00000003/sig0000011c ),
    .O(\blk00000003/sig0000011d )
  );
  XORCY   \blk00000003/blk000000d3  (
    .CI(\blk00000003/sig00000118 ),
    .LI(\blk00000003/sig00000119 ),
    .O(\blk00000003/sig0000011a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000d2  (
    .C(clk),
    .D(\blk00000003/sig00000110 ),
    .Q(\blk00000003/sig00000117 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000d1  (
    .C(clk),
    .D(\blk00000003/sig00000109 ),
    .Q(\blk00000003/sig00000028 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000d0  (
    .C(clk),
    .D(\blk00000003/sig0000010c ),
    .Q(\blk00000003/sig00000116 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000cf  (
    .C(clk),
    .D(\blk00000003/sig0000010f ),
    .Q(\blk00000003/sig00000115 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000ce  (
    .C(clk),
    .D(\blk00000003/sig00000113 ),
    .Q(\blk00000003/sig00000114 )
  );
  MUXCY   \blk00000003/blk000000cd  (
    .CI(\blk00000003/sig00000111 ),
    .DI(\blk00000003/sig00000046 ),
    .S(\blk00000003/sig00000112 ),
    .O(\blk00000003/sig0000010d )
  );
  XORCY   \blk00000003/blk000000cc  (
    .CI(\blk00000003/sig00000111 ),
    .LI(\blk00000003/sig00000112 ),
    .O(\blk00000003/sig00000113 )
  );
  MUXCY   \blk00000003/blk000000cb  (
    .CI(\blk00000003/sig00000107 ),
    .DI(\blk00000003/sig00000105 ),
    .S(\blk00000003/sig00000108 ),
    .O(\blk00000003/sig00000110 )
  );
  MUXCY   \blk00000003/blk000000ca  (
    .CI(\blk00000003/sig0000010d ),
    .DI(\blk00000003/sig00000103 ),
    .S(\blk00000003/sig0000010e ),
    .O(\blk00000003/sig0000010a )
  );
  MUXCY   \blk00000003/blk000000c9  (
    .CI(\blk00000003/sig0000010a ),
    .DI(\blk00000003/sig00000104 ),
    .S(\blk00000003/sig0000010b ),
    .O(\blk00000003/sig00000107 )
  );
  XORCY   \blk00000003/blk000000c8  (
    .CI(\blk00000003/sig0000010d ),
    .LI(\blk00000003/sig0000010e ),
    .O(\blk00000003/sig0000010f )
  );
  XORCY   \blk00000003/blk000000c7  (
    .CI(\blk00000003/sig0000010a ),
    .LI(\blk00000003/sig0000010b ),
    .O(\blk00000003/sig0000010c )
  );
  XORCY   \blk00000003/blk000000c6  (
    .CI(\blk00000003/sig00000107 ),
    .LI(\blk00000003/sig00000108 ),
    .O(\blk00000003/sig00000109 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000c5  (
    .C(clk),
    .D(\blk00000003/sig000000ff ),
    .Q(\blk00000003/sig00000106 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000c4  (
    .C(clk),
    .D(\blk00000003/sig000000f8 ),
    .Q(\blk00000003/sig0000003b )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000c3  (
    .C(clk),
    .D(\blk00000003/sig000000fb ),
    .Q(\blk00000003/sig00000105 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000c2  (
    .C(clk),
    .D(\blk00000003/sig000000fe ),
    .Q(\blk00000003/sig00000104 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000c1  (
    .C(clk),
    .D(\blk00000003/sig00000102 ),
    .Q(\blk00000003/sig00000103 )
  );
  MUXCY   \blk00000003/blk000000c0  (
    .CI(\blk00000003/sig00000100 ),
    .DI(\blk00000003/sig00000052 ),
    .S(\blk00000003/sig00000101 ),
    .O(\blk00000003/sig000000fc )
  );
  XORCY   \blk00000003/blk000000bf  (
    .CI(\blk00000003/sig00000100 ),
    .LI(\blk00000003/sig00000101 ),
    .O(\blk00000003/sig00000102 )
  );
  MUXCY   \blk00000003/blk000000be  (
    .CI(\blk00000003/sig000000f6 ),
    .DI(\blk00000003/sig000000f4 ),
    .S(\blk00000003/sig000000f7 ),
    .O(\blk00000003/sig000000ff )
  );
  MUXCY   \blk00000003/blk000000bd  (
    .CI(\blk00000003/sig000000fc ),
    .DI(\blk00000003/sig000000f2 ),
    .S(\blk00000003/sig000000fd ),
    .O(\blk00000003/sig000000f9 )
  );
  MUXCY   \blk00000003/blk000000bc  (
    .CI(\blk00000003/sig000000f9 ),
    .DI(\blk00000003/sig000000f3 ),
    .S(\blk00000003/sig000000fa ),
    .O(\blk00000003/sig000000f6 )
  );
  XORCY   \blk00000003/blk000000bb  (
    .CI(\blk00000003/sig000000fc ),
    .LI(\blk00000003/sig000000fd ),
    .O(\blk00000003/sig000000fe )
  );
  XORCY   \blk00000003/blk000000ba  (
    .CI(\blk00000003/sig000000f9 ),
    .LI(\blk00000003/sig000000fa ),
    .O(\blk00000003/sig000000fb )
  );
  XORCY   \blk00000003/blk000000b9  (
    .CI(\blk00000003/sig000000f6 ),
    .LI(\blk00000003/sig000000f7 ),
    .O(\blk00000003/sig000000f8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000b8  (
    .C(clk),
    .D(\blk00000003/sig000000ee ),
    .Q(\blk00000003/sig000000f5 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000b7  (
    .C(clk),
    .D(\blk00000003/sig000000e7 ),
    .Q(\blk00000003/sig00000047 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000b6  (
    .C(clk),
    .D(\blk00000003/sig000000ea ),
    .Q(\blk00000003/sig000000f4 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000b5  (
    .C(clk),
    .D(\blk00000003/sig000000ed ),
    .Q(\blk00000003/sig000000f3 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000b4  (
    .C(clk),
    .D(\blk00000003/sig000000f1 ),
    .Q(\blk00000003/sig000000f2 )
  );
  MUXCY   \blk00000003/blk000000b3  (
    .CI(\blk00000003/sig000000ef ),
    .DI(\blk00000003/sig0000005a ),
    .S(\blk00000003/sig000000f0 ),
    .O(\blk00000003/sig000000eb )
  );
  XORCY   \blk00000003/blk000000b2  (
    .CI(\blk00000003/sig000000ef ),
    .LI(\blk00000003/sig000000f0 ),
    .O(\blk00000003/sig000000f1 )
  );
  MUXCY   \blk00000003/blk000000b1  (
    .CI(\blk00000003/sig000000e5 ),
    .DI(\blk00000003/sig000000e3 ),
    .S(\blk00000003/sig000000e6 ),
    .O(\blk00000003/sig000000ee )
  );
  MUXCY   \blk00000003/blk000000b0  (
    .CI(\blk00000003/sig000000eb ),
    .DI(\blk00000003/sig000000e1 ),
    .S(\blk00000003/sig000000ec ),
    .O(\blk00000003/sig000000e8 )
  );
  MUXCY   \blk00000003/blk000000af  (
    .CI(\blk00000003/sig000000e8 ),
    .DI(\blk00000003/sig000000e2 ),
    .S(\blk00000003/sig000000e9 ),
    .O(\blk00000003/sig000000e5 )
  );
  XORCY   \blk00000003/blk000000ae  (
    .CI(\blk00000003/sig000000eb ),
    .LI(\blk00000003/sig000000ec ),
    .O(\blk00000003/sig000000ed )
  );
  XORCY   \blk00000003/blk000000ad  (
    .CI(\blk00000003/sig000000e8 ),
    .LI(\blk00000003/sig000000e9 ),
    .O(\blk00000003/sig000000ea )
  );
  XORCY   \blk00000003/blk000000ac  (
    .CI(\blk00000003/sig000000e5 ),
    .LI(\blk00000003/sig000000e6 ),
    .O(\blk00000003/sig000000e7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000ab  (
    .C(clk),
    .D(\blk00000003/sig000000dc ),
    .Q(\blk00000003/sig000000e4 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000aa  (
    .C(clk),
    .D(\blk00000003/sig000000d5 ),
    .Q(\blk00000003/sig00000064 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000a9  (
    .C(clk),
    .D(\blk00000003/sig000000d8 ),
    .Q(\blk00000003/sig000000e3 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000a8  (
    .C(clk),
    .D(\blk00000003/sig000000db ),
    .Q(\blk00000003/sig000000e2 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk000000a7  (
    .C(clk),
    .D(\blk00000003/sig000000df ),
    .Q(\blk00000003/sig000000e1 )
  );
  MUXCY   \blk00000003/blk000000a6  (
    .CI(\blk00000003/sig000000dd ),
    .DI(\blk00000003/sig000000e0 ),
    .S(\blk00000003/sig000000de ),
    .O(\blk00000003/sig000000d9 )
  );
  XORCY   \blk00000003/blk000000a5  (
    .CI(\blk00000003/sig000000dd ),
    .LI(\blk00000003/sig000000de ),
    .O(\blk00000003/sig000000df )
  );
  MUXCY   \blk00000003/blk000000a4  (
    .CI(\blk00000003/sig000000d3 ),
    .DI(\blk00000003/sig000000d1 ),
    .S(\blk00000003/sig000000d4 ),
    .O(\blk00000003/sig000000dc )
  );
  MUXCY   \blk00000003/blk000000a3  (
    .CI(\blk00000003/sig000000d9 ),
    .DI(\blk00000003/sig000000cf ),
    .S(\blk00000003/sig000000da ),
    .O(\blk00000003/sig000000d6 )
  );
  MUXCY   \blk00000003/blk000000a2  (
    .CI(\blk00000003/sig000000d6 ),
    .DI(\blk00000003/sig000000d0 ),
    .S(\blk00000003/sig000000d7 ),
    .O(\blk00000003/sig000000d3 )
  );
  XORCY   \blk00000003/blk000000a1  (
    .CI(\blk00000003/sig000000d9 ),
    .LI(\blk00000003/sig000000da ),
    .O(\blk00000003/sig000000db )
  );
  XORCY   \blk00000003/blk000000a0  (
    .CI(\blk00000003/sig000000d6 ),
    .LI(\blk00000003/sig000000d7 ),
    .O(\blk00000003/sig000000d8 )
  );
  XORCY   \blk00000003/blk0000009f  (
    .CI(\blk00000003/sig000000d3 ),
    .LI(\blk00000003/sig000000d4 ),
    .O(\blk00000003/sig000000d5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000009e  (
    .C(clk),
    .D(\blk00000003/sig000000ca ),
    .Q(\blk00000003/sig000000d2 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000009d  (
    .C(clk),
    .D(\blk00000003/sig000000c3 ),
    .Q(\blk00000003/sig0000005b )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000009c  (
    .C(clk),
    .D(\blk00000003/sig000000c6 ),
    .Q(\blk00000003/sig000000d1 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000009b  (
    .C(clk),
    .D(\blk00000003/sig000000c9 ),
    .Q(\blk00000003/sig000000d0 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000009a  (
    .C(clk),
    .D(\blk00000003/sig000000cd ),
    .Q(\blk00000003/sig000000cf )
  );
  MUXCY   \blk00000003/blk00000099  (
    .CI(\blk00000003/sig000000cb ),
    .DI(\blk00000003/sig000000ce ),
    .S(\blk00000003/sig000000cc ),
    .O(\blk00000003/sig000000c7 )
  );
  XORCY   \blk00000003/blk00000098  (
    .CI(\blk00000003/sig000000cb ),
    .LI(\blk00000003/sig000000cc ),
    .O(\blk00000003/sig000000cd )
  );
  MUXCY   \blk00000003/blk00000097  (
    .CI(\blk00000003/sig000000c1 ),
    .DI(\blk00000003/sig000000bf ),
    .S(\blk00000003/sig000000c2 ),
    .O(\blk00000003/sig000000ca )
  );
  MUXCY   \blk00000003/blk00000096  (
    .CI(\blk00000003/sig000000c7 ),
    .DI(\blk00000003/sig000000bd ),
    .S(\blk00000003/sig000000c8 ),
    .O(\blk00000003/sig000000c4 )
  );
  MUXCY   \blk00000003/blk00000095  (
    .CI(\blk00000003/sig000000c4 ),
    .DI(\blk00000003/sig000000be ),
    .S(\blk00000003/sig000000c5 ),
    .O(\blk00000003/sig000000c1 )
  );
  XORCY   \blk00000003/blk00000094  (
    .CI(\blk00000003/sig000000c7 ),
    .LI(\blk00000003/sig000000c8 ),
    .O(\blk00000003/sig000000c9 )
  );
  XORCY   \blk00000003/blk00000093  (
    .CI(\blk00000003/sig000000c4 ),
    .LI(\blk00000003/sig000000c5 ),
    .O(\blk00000003/sig000000c6 )
  );
  XORCY   \blk00000003/blk00000092  (
    .CI(\blk00000003/sig000000c1 ),
    .LI(\blk00000003/sig000000c2 ),
    .O(\blk00000003/sig000000c3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000091  (
    .C(clk),
    .D(\blk00000003/sig000000b8 ),
    .Q(\blk00000003/sig000000c0 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000090  (
    .C(clk),
    .D(\blk00000003/sig000000b1 ),
    .Q(\blk00000003/sig00000061 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000008f  (
    .C(clk),
    .D(\blk00000003/sig000000b4 ),
    .Q(\blk00000003/sig000000bf )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000008e  (
    .C(clk),
    .D(\blk00000003/sig000000b7 ),
    .Q(\blk00000003/sig000000be )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000008d  (
    .C(clk),
    .D(\blk00000003/sig000000bb ),
    .Q(\blk00000003/sig000000bd )
  );
  MUXCY   \blk00000003/blk0000008c  (
    .CI(\blk00000003/sig000000b9 ),
    .DI(\blk00000003/sig000000bc ),
    .S(\blk00000003/sig000000ba ),
    .O(\blk00000003/sig000000b5 )
  );
  XORCY   \blk00000003/blk0000008b  (
    .CI(\blk00000003/sig000000b9 ),
    .LI(\blk00000003/sig000000ba ),
    .O(\blk00000003/sig000000bb )
  );
  MUXCY   \blk00000003/blk0000008a  (
    .CI(\blk00000003/sig000000af ),
    .DI(\blk00000003/sig000000ad ),
    .S(\blk00000003/sig000000b0 ),
    .O(\blk00000003/sig000000b8 )
  );
  MUXCY   \blk00000003/blk00000089  (
    .CI(\blk00000003/sig000000b5 ),
    .DI(\blk00000003/sig000000ab ),
    .S(\blk00000003/sig000000b6 ),
    .O(\blk00000003/sig000000b2 )
  );
  MUXCY   \blk00000003/blk00000088  (
    .CI(\blk00000003/sig000000b2 ),
    .DI(\blk00000003/sig000000ac ),
    .S(\blk00000003/sig000000b3 ),
    .O(\blk00000003/sig000000af )
  );
  XORCY   \blk00000003/blk00000087  (
    .CI(\blk00000003/sig000000b5 ),
    .LI(\blk00000003/sig000000b6 ),
    .O(\blk00000003/sig000000b7 )
  );
  XORCY   \blk00000003/blk00000086  (
    .CI(\blk00000003/sig000000b2 ),
    .LI(\blk00000003/sig000000b3 ),
    .O(\blk00000003/sig000000b4 )
  );
  XORCY   \blk00000003/blk00000085  (
    .CI(\blk00000003/sig000000af ),
    .LI(\blk00000003/sig000000b0 ),
    .O(\blk00000003/sig000000b1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000084  (
    .C(clk),
    .D(\blk00000003/sig000000a8 ),
    .Q(\blk00000003/sig000000ae )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000083  (
    .C(clk),
    .D(\blk00000003/sig000000a1 ),
    .Q(\blk00000003/sig00000063 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000082  (
    .C(clk),
    .D(\blk00000003/sig000000a4 ),
    .Q(\blk00000003/sig000000ad )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000081  (
    .C(clk),
    .D(\blk00000003/sig000000a7 ),
    .Q(\blk00000003/sig000000ac )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000080  (
    .C(clk),
    .D(\blk00000003/sig000000aa ),
    .Q(\blk00000003/sig000000ab )
  );
  MUXCY   \blk00000003/blk0000007f  (
    .CI(NlwRenamedSig_OI_rfd),
    .DI(\blk00000003/sig00000095 ),
    .S(\blk00000003/sig000000a9 ),
    .O(\blk00000003/sig000000a5 )
  );
  XORCY   \blk00000003/blk0000007e  (
    .CI(NlwRenamedSig_OI_rfd),
    .LI(\blk00000003/sig000000a9 ),
    .O(\blk00000003/sig000000aa )
  );
  MUXCY   \blk00000003/blk0000007d  (
    .CI(\blk00000003/sig000000a0 ),
    .DI(\blk00000003/sig0000001e ),
    .S(NlwRenamedSig_OI_rfd),
    .O(\blk00000003/sig000000a8 )
  );
  MUXCY   \blk00000003/blk0000007c  (
    .CI(\blk00000003/sig000000a5 ),
    .DI(\blk00000003/sig0000001e ),
    .S(\blk00000003/sig000000a6 ),
    .O(\blk00000003/sig000000a2 )
  );
  MUXCY   \blk00000003/blk0000007b  (
    .CI(\blk00000003/sig000000a2 ),
    .DI(\blk00000003/sig0000001e ),
    .S(\blk00000003/sig000000a3 ),
    .O(\blk00000003/sig000000a0 )
  );
  XORCY   \blk00000003/blk0000007a  (
    .CI(\blk00000003/sig000000a5 ),
    .LI(\blk00000003/sig000000a6 ),
    .O(\blk00000003/sig000000a7 )
  );
  XORCY   \blk00000003/blk00000079  (
    .CI(\blk00000003/sig000000a2 ),
    .LI(\blk00000003/sig000000a3 ),
    .O(\blk00000003/sig000000a4 )
  );
  XORCY   \blk00000003/blk00000078  (
    .CI(\blk00000003/sig000000a0 ),
    .LI(NlwRenamedSig_OI_rfd),
    .O(\blk00000003/sig000000a1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000077  (
    .C(clk),
    .D(dividend_0[0]),
    .Q(\blk00000003/sig0000009f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000076  (
    .C(clk),
    .D(dividend_0[1]),
    .Q(\blk00000003/sig0000009e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000075  (
    .C(clk),
    .D(dividend_0[2]),
    .Q(\blk00000003/sig0000009d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000074  (
    .C(clk),
    .D(dividend_0[3]),
    .Q(\blk00000003/sig0000009c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000073  (
    .C(clk),
    .D(dividend_0[4]),
    .Q(\blk00000003/sig0000009b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000072  (
    .C(clk),
    .D(dividend_0[5]),
    .Q(\blk00000003/sig0000009a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000071  (
    .C(clk),
    .D(dividend_0[6]),
    .Q(\blk00000003/sig00000099 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000070  (
    .C(clk),
    .D(dividend_0[7]),
    .Q(\blk00000003/sig00000098 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000006f  (
    .C(clk),
    .D(dividend_0[8]),
    .Q(\blk00000003/sig00000097 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000006e  (
    .C(clk),
    .D(dividend_0[9]),
    .Q(\blk00000003/sig00000096 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000006d  (
    .C(clk),
    .D(dividend_0[10]),
    .Q(\blk00000003/sig00000095 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000006c  (
    .C(clk),
    .D(\blk00000003/sig00000094 ),
    .Q(quotient_2[0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000006b  (
    .C(clk),
    .D(\blk00000003/sig00000093 ),
    .Q(quotient_2[1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000006a  (
    .C(clk),
    .D(\blk00000003/sig00000092 ),
    .Q(quotient_2[2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000069  (
    .C(clk),
    .D(\blk00000003/sig00000091 ),
    .Q(quotient_2[3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000068  (
    .C(clk),
    .D(\blk00000003/sig00000090 ),
    .Q(quotient_2[4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000067  (
    .C(clk),
    .D(\blk00000003/sig0000008f ),
    .Q(quotient_2[5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000066  (
    .C(clk),
    .D(\blk00000003/sig0000008e ),
    .Q(quotient_2[6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000065  (
    .C(clk),
    .D(\blk00000003/sig0000008d ),
    .Q(quotient_2[7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000064  (
    .C(clk),
    .D(\blk00000003/sig0000008c ),
    .Q(quotient_2[8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000063  (
    .C(clk),
    .D(\blk00000003/sig0000008b ),
    .Q(quotient_2[9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000062  (
    .C(clk),
    .D(\blk00000003/sig0000008a ),
    .Q(quotient_2[10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000061  (
    .C(clk),
    .D(\blk00000003/sig00000086 ),
    .Q(\blk00000003/sig00000089 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000060  (
    .C(clk),
    .D(\blk00000003/sig00000085 ),
    .Q(\blk00000003/sig00000088 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000005f  (
    .C(clk),
    .D(\blk00000003/sig00000084 ),
    .Q(\blk00000003/sig00000087 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000005e  (
    .C(clk),
    .D(\blk00000003/sig00000083 ),
    .Q(\blk00000003/sig00000086 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000005d  (
    .C(clk),
    .D(\blk00000003/sig00000082 ),
    .Q(\blk00000003/sig00000085 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000005c  (
    .C(clk),
    .D(\blk00000003/sig00000081 ),
    .Q(\blk00000003/sig00000084 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000005b  (
    .C(clk),
    .D(\blk00000003/sig00000080 ),
    .Q(\blk00000003/sig00000083 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000005a  (
    .C(clk),
    .D(\blk00000003/sig0000007f ),
    .Q(\blk00000003/sig00000082 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000059  (
    .C(clk),
    .D(\blk00000003/sig0000007e ),
    .Q(\blk00000003/sig00000081 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000058  (
    .C(clk),
    .D(\blk00000003/sig0000007d ),
    .Q(\blk00000003/sig00000080 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000057  (
    .C(clk),
    .D(\blk00000003/sig0000007c ),
    .Q(\blk00000003/sig0000007f )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000056  (
    .C(clk),
    .D(\blk00000003/sig0000007b ),
    .Q(\blk00000003/sig0000007e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000055  (
    .C(clk),
    .D(\blk00000003/sig0000007a ),
    .Q(\blk00000003/sig0000007d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000054  (
    .C(clk),
    .D(\blk00000003/sig00000079 ),
    .Q(\blk00000003/sig0000007c )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000053  (
    .C(clk),
    .D(\blk00000003/sig00000078 ),
    .Q(\blk00000003/sig0000007b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000052  (
    .C(clk),
    .D(\blk00000003/sig00000077 ),
    .Q(\blk00000003/sig0000007a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000051  (
    .C(clk),
    .D(\blk00000003/sig00000076 ),
    .Q(\blk00000003/sig00000079 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000050  (
    .C(clk),
    .D(\blk00000003/sig00000075 ),
    .Q(\blk00000003/sig00000078 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000004f  (
    .C(clk),
    .D(\blk00000003/sig00000074 ),
    .Q(\blk00000003/sig00000077 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000004e  (
    .C(clk),
    .D(\blk00000003/sig00000073 ),
    .Q(\blk00000003/sig00000076 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000004d  (
    .C(clk),
    .D(\blk00000003/sig00000072 ),
    .Q(\blk00000003/sig00000075 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000004c  (
    .C(clk),
    .D(\blk00000003/sig00000071 ),
    .Q(\blk00000003/sig00000074 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000004b  (
    .C(clk),
    .D(\blk00000003/sig00000070 ),
    .Q(\blk00000003/sig00000073 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000004a  (
    .C(clk),
    .D(\blk00000003/sig0000006f ),
    .Q(\blk00000003/sig00000072 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000049  (
    .C(clk),
    .D(\blk00000003/sig0000006e ),
    .Q(\blk00000003/sig00000071 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000048  (
    .C(clk),
    .D(\blk00000003/sig0000006d ),
    .Q(\blk00000003/sig00000070 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000047  (
    .C(clk),
    .D(\blk00000003/sig0000006c ),
    .Q(\blk00000003/sig0000006f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000046  (
    .C(clk),
    .D(\blk00000003/sig0000006b ),
    .Q(\blk00000003/sig0000006e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000045  (
    .C(clk),
    .D(\blk00000003/sig0000006a ),
    .Q(\blk00000003/sig0000006d )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000044  (
    .C(clk),
    .D(\blk00000003/sig00000069 ),
    .Q(\blk00000003/sig0000006c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000043  (
    .C(clk),
    .D(\blk00000003/sig00000068 ),
    .Q(\blk00000003/sig0000006b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000042  (
    .C(clk),
    .D(\blk00000003/sig00000067 ),
    .Q(\blk00000003/sig0000006a )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000041  (
    .C(clk),
    .D(\blk00000003/sig00000066 ),
    .Q(\blk00000003/sig00000069 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000040  (
    .C(clk),
    .D(divisor_1[2]),
    .Q(\blk00000003/sig00000068 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000003f  (
    .C(clk),
    .D(divisor_1[1]),
    .Q(\blk00000003/sig00000067 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000003e  (
    .C(clk),
    .D(divisor_1[0]),
    .Q(\blk00000003/sig00000066 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000003d  (
    .C(clk),
    .D(\blk00000003/sig00000021 ),
    .Q(\blk00000003/sig00000065 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000003c  (
    .C(clk),
    .D(\blk00000003/sig00000060 ),
    .Q(\blk00000003/sig0000004b )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000003b  (
    .C(clk),
    .D(\blk00000003/sig0000005e ),
    .Q(\blk00000003/sig0000004a )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000003a  (
    .C(clk),
    .D(\blk00000003/sig0000005c ),
    .Q(\blk00000003/sig00000049 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000039  (
    .C(clk),
    .D(\blk00000003/sig00000064 ),
    .Q(\blk00000003/sig00000048 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000038  (
    .C(clk),
    .D(\blk00000003/sig00000063 ),
    .Q(\blk00000003/sig00000062 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000037  (
    .C(clk),
    .D(\blk00000003/sig00000062 ),
    .Q(\blk00000003/sig0000005f )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000036  (
    .C(clk),
    .D(\blk00000003/sig00000061 ),
    .Q(\blk00000003/sig0000005d )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000035  (
    .C(clk),
    .D(\blk00000003/sig0000005f ),
    .Q(\blk00000003/sig00000060 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000034  (
    .C(clk),
    .D(\blk00000003/sig0000005d ),
    .Q(\blk00000003/sig0000005e )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000033  (
    .C(clk),
    .D(\blk00000003/sig0000005b ),
    .Q(\blk00000003/sig0000005c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000032  (
    .C(clk),
    .D(\blk00000003/sig00000059 ),
    .Q(\blk00000003/sig0000005a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000031  (
    .C(clk),
    .D(\blk00000003/sig00000058 ),
    .Q(\blk00000003/sig00000051 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000030  (
    .C(clk),
    .D(\blk00000003/sig00000057 ),
    .Q(\blk00000003/sig00000050 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000002f  (
    .C(clk),
    .D(\blk00000003/sig00000056 ),
    .Q(\blk00000003/sig0000004f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000002e  (
    .C(clk),
    .D(\blk00000003/sig00000055 ),
    .Q(\blk00000003/sig0000004e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000002d  (
    .C(clk),
    .D(\blk00000003/sig00000054 ),
    .Q(\blk00000003/sig0000004d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000002c  (
    .C(clk),
    .D(\blk00000003/sig00000053 ),
    .Q(\blk00000003/sig0000004c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000002b  (
    .C(clk),
    .D(\blk00000003/sig00000051 ),
    .Q(\blk00000003/sig00000052 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000002a  (
    .C(clk),
    .D(\blk00000003/sig00000050 ),
    .Q(\blk00000003/sig00000045 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000029  (
    .C(clk),
    .D(\blk00000003/sig0000004f ),
    .Q(\blk00000003/sig00000044 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000028  (
    .C(clk),
    .D(\blk00000003/sig0000004e ),
    .Q(\blk00000003/sig00000043 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000027  (
    .C(clk),
    .D(\blk00000003/sig0000004d ),
    .Q(\blk00000003/sig00000042 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000026  (
    .C(clk),
    .D(\blk00000003/sig0000004c ),
    .Q(\blk00000003/sig00000041 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000025  (
    .C(clk),
    .D(\blk00000003/sig0000004b ),
    .Q(\blk00000003/sig00000040 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000024  (
    .C(clk),
    .D(\blk00000003/sig0000004a ),
    .Q(\blk00000003/sig0000003f )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000023  (
    .C(clk),
    .D(\blk00000003/sig00000049 ),
    .Q(\blk00000003/sig0000003e )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000022  (
    .C(clk),
    .D(\blk00000003/sig00000048 ),
    .Q(\blk00000003/sig0000003d )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000021  (
    .C(clk),
    .D(\blk00000003/sig00000047 ),
    .Q(\blk00000003/sig0000003c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000020  (
    .C(clk),
    .D(\blk00000003/sig00000045 ),
    .Q(\blk00000003/sig00000046 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000001f  (
    .C(clk),
    .D(\blk00000003/sig00000044 ),
    .Q(\blk00000003/sig00000039 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000001e  (
    .C(clk),
    .D(\blk00000003/sig00000043 ),
    .Q(\blk00000003/sig00000038 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000001d  (
    .C(clk),
    .D(\blk00000003/sig00000042 ),
    .Q(\blk00000003/sig00000037 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000001c  (
    .C(clk),
    .D(\blk00000003/sig00000041 ),
    .Q(\blk00000003/sig00000036 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000001b  (
    .C(clk),
    .D(\blk00000003/sig00000040 ),
    .Q(\blk00000003/sig00000034 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000001a  (
    .C(clk),
    .D(\blk00000003/sig0000003f ),
    .Q(\blk00000003/sig00000032 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000019  (
    .C(clk),
    .D(\blk00000003/sig0000003e ),
    .Q(\blk00000003/sig00000030 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000018  (
    .C(clk),
    .D(\blk00000003/sig0000003d ),
    .Q(\blk00000003/sig0000002e )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000017  (
    .C(clk),
    .D(\blk00000003/sig0000003c ),
    .Q(\blk00000003/sig0000002c )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000016  (
    .C(clk),
    .D(\blk00000003/sig0000003b ),
    .Q(\blk00000003/sig0000002a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000015  (
    .C(clk),
    .D(\blk00000003/sig00000039 ),
    .Q(\blk00000003/sig0000003a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000014  (
    .C(clk),
    .D(\blk00000003/sig00000038 ),
    .Q(\blk00000003/sig00000026 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000013  (
    .C(clk),
    .D(\blk00000003/sig00000037 ),
    .Q(\blk00000003/sig00000025 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000012  (
    .C(clk),
    .D(\blk00000003/sig00000036 ),
    .Q(\blk00000003/sig00000024 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000011  (
    .C(clk),
    .D(\blk00000003/sig00000034 ),
    .Q(\blk00000003/sig00000035 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000010  (
    .C(clk),
    .D(\blk00000003/sig00000032 ),
    .Q(\blk00000003/sig00000033 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000000f  (
    .C(clk),
    .D(\blk00000003/sig00000030 ),
    .Q(\blk00000003/sig00000031 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000000e  (
    .C(clk),
    .D(\blk00000003/sig0000002e ),
    .Q(\blk00000003/sig0000002f )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000000d  (
    .C(clk),
    .D(\blk00000003/sig0000002c ),
    .Q(\blk00000003/sig0000002d )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000000c  (
    .C(clk),
    .D(\blk00000003/sig0000002a ),
    .Q(\blk00000003/sig0000002b )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000000b  (
    .C(clk),
    .D(\blk00000003/sig00000028 ),
    .Q(\blk00000003/sig00000029 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000000a  (
    .C(clk),
    .D(\blk00000003/sig00000026 ),
    .Q(\blk00000003/sig00000027 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000009  (
    .C(clk),
    .D(\blk00000003/sig00000025 ),
    .Q(\blk00000003/sig00000022 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000008  (
    .C(clk),
    .D(\blk00000003/sig00000024 ),
    .Q(\blk00000003/sig00000020 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000007  (
    .C(clk),
    .D(\blk00000003/sig00000022 ),
    .Q(\blk00000003/sig00000023 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000006  (
    .C(clk),
    .D(\blk00000003/sig00000020 ),
    .Q(\blk00000003/sig00000021 )
  );
  VCC   \blk00000003/blk00000005  (
    .P(NlwRenamedSig_OI_rfd)
  );
  GND   \blk00000003/blk00000004  (
    .G(\blk00000003/sig0000001e )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
