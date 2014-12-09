`include "dvi_defines.v"
//`define log2NUM_COLS 11
module note_display (
	input 							clk,
	input							reset,
	input 	[`log2NUM_COLS - 1:0] 	x,
	input 	[9:0] 					y,
	input	[2:0]					select,
	input 	[1:0]					song,
	input 	[5:0] 					note_one,
	input 	[5:0]					note_two,
	input	[5:0] 					note_three,
	output 	[7:0] 					r_text,
	output 	[7:0] 					g_text,
	output 	[7:0] 					b_text
);
	wire new_notes = select[0];
	wire play_enable = select[1];
	wire valid = select[2];
	reg 	[8:0] 	rom_base_addr;
	wire 	[8:0] 	rom_addr = rom_base_addr + y[2:0];
	wire 	[7:0] 	rom_data;
	wire 	[7:0] 	rom_bit_select = 8'b10000000 >> x[2:0];
	wire 			char_px = |(rom_data & rom_bit_select);
	tcgrom char_rom (.addr(rom_addr), .data(rom_data));
	wire [44:0] note_one_addr, note_two_addr, note_three_addr;
	
	note_address note_address_one(.note(note_one), .note_addr(note_one_addr));
	note_address note_address_two(.note(note_two), .note_addr(note_two_addr));
	note_address note_address_three(.note(note_three), .note_addr(note_three_addr));
	
	wire [134:0] out1, out2, out3, out4, out5, note_data, last_data;
	assign note_data = {note_one_addr, note_two_addr, note_three_addr};
	dffre #(135) new_note_data (.clk(clk), .r(reset), .en(note_data != last_data), .d(note_data), .q(last_data));
	dffre #(135) store_notes_1 (.clk(clk), .r(reset), .en(note_data != last_data), .d(note_data), .q(out1));
	dffre #(135) store_notes_2 (.clk(clk), .r(reset), .en(note_data != last_data), .d(out1), .q(out2));
	dffre #(135) store_notes_3 (.clk(clk), .r(reset), .en(note_data != last_data), .d(out2), .q(out3));
	dffre #(135) store_notes_4 (.clk(clk), .r(reset), .en(note_data != last_data), .d(out3), .q(out4));
	dffre #(135) store_notes_5 (.clk(clk), .r(reset), .en(note_data != last_data), .d(out4), .q(out5));
	
     wire [10:0] song00_dur, song01_dur, song10_dur, song11_dur;
     assign song00_dur = 11'd2016;
     assign song01_dur = 11'd336;
     assign song10_dur = 11'd385;	
     assign song11_dur = 11'd432;		


	reg [53:0] current_song_text;
	reg [23:0] color_reg;
	// Text display:
	always @(*) begin
		case (song)
			2'b00: current_song_text = {(9'd19 << 3), (9'd15 << 3), (9'd14 << 3), (9'd07 << 3), (9'd32 << 3), (9'd49 << 3)}; // Song 1
			2'b01: current_song_text = {(9'd19 << 3), (9'd15 << 3), (9'd14 << 3), (9'd07 << 3), (9'd32 << 3), (9'd50 << 3)}; // Song 2
			2'b10: current_song_text = {(9'd19 << 3), (9'd15 << 3), (9'd14 << 3), (9'd07 << 3), (9'd32 << 3), (9'd51 << 3)}; // Song 3
			2'b11: current_song_text = {(9'd19 << 3), (9'd15 << 3), (9'd14 << 3), (9'd07 << 3), (9'd32 << 3), (9'd52 << 3)}; // Song 4
			default: current_song_text = {6{(9'd26 << 3)}};
		endcase
	
		if (play_enable) begin
			if (y >= 10'd8 && y < 10'd16) begin // Currently Playing Notes:
				color_reg = 24'hFFFFFF;
				case (x[`log2NUM_COLS-1:3])
					2:	rom_base_addr = current_song_text[53:45];
					3:	rom_base_addr = current_song_text[44:36];
					4:	rom_base_addr = current_song_text[35:27];
					5:	rom_base_addr = current_song_text[26:18];
					6:	rom_base_addr = current_song_text[17:9];
					7:	rom_base_addr = current_song_text[8:0];
					8: 	rom_base_addr = (9'd32 << 3); //
					9: 	rom_base_addr = (9'd45 << 3); //
					10: rom_base_addr = (9'd32 << 3); //
					11: rom_base_addr = (9'd03 << 3); // C
					12: rom_base_addr = (9'd21 << 3); // U
					13: rom_base_addr = (9'd18 << 3); // R
					14: rom_base_addr = (9'd18 << 3); // R
					15: rom_base_addr = (9'd05 << 3); // E
					16:	rom_base_addr = (9'd14 << 3); // N
					17: rom_base_addr = (9'd20 << 3); // T
					18: rom_base_addr = (9'd12 << 3); // L
					19: rom_base_addr = (9'd25 << 3); // Y
					20: rom_base_addr = (9'd32 << 3); // 
					21: rom_base_addr = (9'd16 << 3); // P
					22: rom_base_addr = (9'd12 << 3); // L
					23: rom_base_addr = (9'd01 << 3); // A
					24: rom_base_addr = (9'd25 << 3); // Y
					25: rom_base_addr = (9'd09 << 3); // I
					26: rom_base_addr = (9'd14 << 3); // N
					27: rom_base_addr = (9'd07 << 3); // G
					28: rom_base_addr = (9'd32 << 3); // 
					29: rom_base_addr = (9'd14 << 3); // N
					30: rom_base_addr = (9'd15 << 3); // O
					31: rom_base_addr = (9'd20 << 3); // T
					32: rom_base_addr = (9'd05 << 3); // E
					33: rom_base_addr = (9'd19 << 3); // S
					34: rom_base_addr = (9'd32 << 3); // 
					35: rom_base_addr = (9'd61 << 3); // play symbol
					default: rom_base_addr = 9'h100;
				endcase
			end else if (y >= 10'd24 && y < 10'd32) begin // Note 1
				color_reg = 24'hEA4040;
				case (x[`log2NUM_COLS-1:3])
					2: 	rom_base_addr = (9'd14 << 3); // N
					3: 	rom_base_addr = (9'd15 << 3); // O
					4: 	rom_base_addr = (9'd20 << 3); // T
					5: 	rom_base_addr = (9'd05 << 3); // E
					6: 	rom_base_addr = (9'd32 << 3); // 
					7: 	rom_base_addr = (9'd49 << 3); // 1
					8: 	rom_base_addr = (9'd32 << 3); // 
					9: 	rom_base_addr = (9'd45 << 3); // -
					10: rom_base_addr = (9'd32 << 3); // 
					11: rom_base_addr = note_one_addr[44:36];
					12: rom_base_addr = note_one_addr[35:27];
					13: rom_base_addr = note_one_addr[26:18];
					14: rom_base_addr = note_one_addr[17:9];
					15: rom_base_addr = note_one_addr[8:0];
					default: rom_base_addr = 9'h100;
				endcase
			end else if (y >= 10'd40 && y < 10'd48) begin // Note 2
				color_reg = 24'h56CCB7;
				case (x[`log2NUM_COLS-1:3])
					2: 	rom_base_addr = (9'd14 << 3); // N
					3: 	rom_base_addr = (9'd15 << 3); // O
					4: 	rom_base_addr = (9'd20 << 3); // T
					5: 	rom_base_addr = (9'd05 << 3); // E
					6: 	rom_base_addr = (9'd32 << 3); // 
					7: 	rom_base_addr = (9'd50 << 3); // 2
					8: 	rom_base_addr = (9'd32 << 3); // 
					9: 	rom_base_addr = (9'd45 << 3); // -
					10: rom_base_addr = (9'd32 << 3); // 
					11: rom_base_addr = note_two_addr[44:36];
					12: rom_base_addr = note_two_addr[35:27];
					13: rom_base_addr = note_two_addr[26:18];
					14: rom_base_addr = note_two_addr[17:9];
					15: rom_base_addr = note_two_addr[8:0];
					default: rom_base_addr = 9'h100;
				endcase
			end else if (y >= 10'd56 && y < 10'd64) begin // Note 3
				color_reg = 24'hFDC00D;
				case (x[`log2NUM_COLS-1:3])
					2: 	rom_base_addr = (9'd14 << 3); // N
					3: 	rom_base_addr = (9'd15 << 3); // O
					4: 	rom_base_addr = (9'd20 << 3); // T
					5: 	rom_base_addr = (9'd05 << 3); // E
					6: 	rom_base_addr = (9'd32 << 3); // 
					7: 	rom_base_addr = (9'd51 << 3); // 3
					8: 	rom_base_addr = (9'd32 << 3); // 
					9: 	rom_base_addr = (9'd45 << 3); // -
					10: rom_base_addr = (9'd32 << 3); // 
					11: rom_base_addr = note_three_addr[44:36];
					12: rom_base_addr = note_three_addr[35:27];
					13: rom_base_addr = note_three_addr[26:18];
					14: rom_base_addr = note_three_addr[17:9];
					15: rom_base_addr = note_three_addr[8:0];
					default: rom_base_addr = 9'h100;
				endcase
			end else if (y >= 10'd72 && y < 10'd80) begin // Past Notes
				color_reg = 24'hFFFFFF;
				case (x[`log2NUM_COLS-1:3])
					2: 	rom_base_addr = (9'd16 << 3); // P
					3: 	rom_base_addr = (9'd01 << 3); // A
					4: 	rom_base_addr = (9'd19 << 3); // S
					5: 	rom_base_addr = (9'd20 << 3); // T
					6: 	rom_base_addr = (9'd32 << 3); // 
					7: 	rom_base_addr = (9'd14 << 3); // N
					8: 	rom_base_addr = (9'd15 << 3); // O
					9: 	rom_base_addr = (9'd20 << 3); // T
					10: rom_base_addr = (9'd05 << 3); // E
					11: rom_base_addr = (9'd19 << 3); // S
					default: rom_base_addr = 9'h100;
				endcase
			end else begin
				if (!reset) begin
					if (y >= 10'd88 && y < 10'd96) begin
						case (x[`log2NUM_COLS-1:3])
							2: 	begin
									rom_base_addr = out1[134:126];
									color_reg = 24'hEA4040;
								end
							3: 	begin
									rom_base_addr = out1[125:117];
									color_reg = 24'hEA4040;
								end
							4: 	begin
									rom_base_addr = out1[116:108];
									color_reg = 24'hEA4040;
								end
							5: 	begin
									rom_base_addr = out1[107:99];
									color_reg = 24'hEA4040;
								end
							6: 	begin
									rom_base_addr = out1[98:90];
									color_reg = 24'hEA4040;
								end
							7: 	begin
									rom_base_addr = (9'd32 << 3); //
									color_reg = 24'b0;
								end
							8: 	begin
									rom_base_addr = out1[89:81];
									color_reg = 24'h56CCB7;
								end
							9: 	begin
									rom_base_addr = out1[80:72];
									color_reg = 24'h56CCB7;
								end
							10: begin
									rom_base_addr = out1[71:63];
									color_reg = 24'h56CCB7;
								end
							11: begin
									rom_base_addr = out1[62:54];
									color_reg = 24'h56CCB7;
								end
							12: begin
									rom_base_addr = out1[53:45];
									color_reg = 24'h56CCB7;
								end
							13: begin
									rom_base_addr = (9'd32 << 3); //
									color_reg = 24'b0;
								end
							14: begin
									rom_base_addr = out1[44:36];
									color_reg = 24'hFDC00D;
								end
							15: begin
									rom_base_addr = out1[35:27];
									color_reg = 24'hFDC00D;
								end
							16: begin
									rom_base_addr = out1[26:18];
									color_reg = 24'hFDC00D;
								end
							17: begin
									rom_base_addr = out1[17:9];
									color_reg = 24'hFDC00D;
								end
							18: begin
									rom_base_addr = out1[8:0];
									color_reg = 24'hFDC00D;
								end
							default: begin
										rom_base_addr = 9'h100;
										color_reg = 24'b0;
									end
						endcase
					end else if (y >= 10'd104 && y < 10'd112) begin
						case (x[`log2NUM_COLS-1:3])
							2: 	begin
									rom_base_addr = out2[134:126];
									color_reg = 24'hEA4040;
								end
							3: 	begin
									rom_base_addr = out2[125:117];
									color_reg = 24'hEA4040;
								end
							4: 	begin
									rom_base_addr = out2[116:108];
									color_reg = 24'hEA4040;
								end
							5: 	begin
									rom_base_addr = out2[107:99];
									color_reg = 24'hEA4040;
								end
							6: 	begin
									rom_base_addr = out2[98:90];
									color_reg = 24'hEA4040;
								end
							7: 	begin
									rom_base_addr = (9'd32 << 3); //
									color_reg = 24'b0;
								end
							8: 	begin
									rom_base_addr = out2[89:81];
									color_reg = 24'h56CCB7;
								end
							9: 	begin
									rom_base_addr = out2[80:72];
									color_reg = 24'h56CCB7;
								end
							10: begin
									rom_base_addr = out2[71:63];
									color_reg = 24'h56CCB7;
								end
							11: begin
									rom_base_addr = out2[62:54];
									color_reg = 24'h56CCB7;
								end
							12: begin
									rom_base_addr = out2[53:45];
									color_reg = 24'h56CCB7;
								end
							13: begin
									rom_base_addr = (9'd32 << 3); //
									color_reg = 24'b0;
								end
							14: begin
									rom_base_addr = out2[44:36];
									color_reg = 24'hFDC00D;
								end
							15: begin
									rom_base_addr = out2[35:27];
									color_reg = 24'hFDC00D;
								end
							16: begin
									rom_base_addr = out2[26:18];
									color_reg = 24'hFDC00D;
								end
							17: begin
									rom_base_addr = out2[17:9];
									color_reg = 24'hFDC00D;
								end
							18: begin
									rom_base_addr = out2[8:0];
									color_reg = 24'hFDC00D;
								end
							default: begin
										rom_base_addr = 9'h100;
										color_reg = 24'b0;
									end
						endcase
					end else if (y >= 10'd120 && y < 10'd128) begin
						case (x[`log2NUM_COLS-1:3])
							2: 	begin
									rom_base_addr = out3[134:126];
									color_reg = 24'hEA4040;
								end
							3: 	begin
									rom_base_addr = out3[125:117];
									color_reg = 24'hEA4040;
								end
							4: 	begin
									rom_base_addr = out3[116:108];
									color_reg = 24'hEA4040;
								end
							5: 	begin
									rom_base_addr = out3[107:99];
									color_reg = 24'hEA4040;
								end
							6: 	begin
									rom_base_addr = out3[98:90];
									color_reg = 24'hEA4040;
								end
							7: 	begin
									rom_base_addr = (9'd32 << 3); //
									color_reg = 24'b0;
								end
							8: 	begin
									rom_base_addr = out3[89:81];
									color_reg = 24'h56CCB7;
								end
							9: 	begin
									rom_base_addr = out3[80:72];
									color_reg = 24'h56CCB7;
								end
							10: begin
									rom_base_addr = out3[71:63];
									color_reg = 24'h56CCB7;
								end
							11: begin
									rom_base_addr = out3[62:54];
									color_reg = 24'h56CCB7;
								end
							12: begin
									rom_base_addr = out3[53:45];
									color_reg = 24'h56CCB7;
								end
							13: begin
									rom_base_addr = (9'd32 << 3); //
									color_reg = 24'b0;
								end
							14: begin
									rom_base_addr = out3[44:36];
									color_reg = 24'hFDC00D;
								end
							15: begin
									rom_base_addr = out3[35:27];
									color_reg = 24'hFDC00D;
								end
							16: begin
									rom_base_addr = out3[26:18];
									color_reg = 24'hFDC00D;
								end
							17: begin
									rom_base_addr = out3[17:9];
									color_reg = 24'hFDC00D;
								end
							18: begin
									rom_base_addr = out3[8:0];
									color_reg = 24'hFDC00D;
								end
							default: begin
										rom_base_addr = 9'h100;
										color_reg = 24'b0;
									end
						endcase
					end else if (y >= 10'd136 && y < 10'd144) begin
						case (x[`log2NUM_COLS-1:3])
							2: 	begin
									rom_base_addr = out4[134:126];
									color_reg = 24'hEA4040;
								end
							3: 	begin
									rom_base_addr = out4[125:117];
									color_reg = 24'hEA4040;
								end
							4: 	begin
									rom_base_addr = out4[116:108];
									color_reg = 24'hEA4040;
								end
							5: 	begin
									rom_base_addr = out4[107:99];
									color_reg = 24'hEA4040;
								end
							6: 	begin
									rom_base_addr = out4[98:90];
									color_reg = 24'hEA4040;
								end
							7: 	begin
									rom_base_addr = (9'd32 << 3); //
									color_reg = 24'b0;
								end
							8: 	begin
									rom_base_addr = out4[89:81];
									color_reg = 24'h56CCB7;
								end
							9: 	begin
									rom_base_addr = out4[80:72];
									color_reg = 24'h56CCB7;
								end
							10: begin
									rom_base_addr = out4[71:63];
									color_reg = 24'h56CCB7;
								end
							11: begin
									rom_base_addr = out4[62:54];
									color_reg = 24'h56CCB7;
								end
							12: begin
									rom_base_addr = out4[53:45];
									color_reg = 24'h56CCB7;
								end
							13: begin
									rom_base_addr = (9'd32 << 3); //
									color_reg = 24'b0;
								end
							14: begin
									rom_base_addr = out4[44:36];
									color_reg = 24'hFDC00D;
								end
							15: begin
									rom_base_addr = out4[35:27];
									color_reg = 24'hFDC00D;
								end
							16: begin
									rom_base_addr = out4[26:18];
									color_reg = 24'hFDC00D;
								end
							17: begin
									rom_base_addr = out4[17:9];
									color_reg = 24'hFDC00D;
								end
							18: begin
									rom_base_addr = out4[8:0];
									color_reg = 24'hFDC00D;
								end
							default: begin
										rom_base_addr = 9'h100;
										color_reg = 24'b0;
									end
						endcase
					end else if (y >= 10'd152 && y < 10'd160) begin
						case (x[`log2NUM_COLS-1:3])
							2: 	begin
									rom_base_addr = out5[134:126];
									color_reg = 24'hEA4040;
								end
							3: 	begin
									rom_base_addr = out5[125:117];
									color_reg = 24'hEA4040;
								end
							4: 	begin
									rom_base_addr = out5[116:108];
									color_reg = 24'hEA4040;
								end
							5: 	begin
									rom_base_addr = out5[107:99];
									color_reg = 24'hEA4040;
								end
							6: 	begin
									rom_base_addr = out5[98:90];
									color_reg = 24'hEA4040;
								end
							7: 	begin
									rom_base_addr = (9'd32 << 3); //
									color_reg = 24'b0;
								end
							8: 	begin
									rom_base_addr = out5[89:81];
									color_reg = 24'h56CCB7;
								end
							9: 	begin
									rom_base_addr = out5[80:72];
									color_reg = 24'h56CCB7;
								end
							10: begin
									rom_base_addr = out5[71:63];
									color_reg = 24'h56CCB7;
								end
							11: begin
									rom_base_addr = out5[62:54];
									color_reg = 24'h56CCB7;
								end
							12: begin
									rom_base_addr = out5[53:45];
									color_reg = 24'h56CCB7;
								end
							13: begin
									rom_base_addr = (9'd32 << 3); //
									color_reg = 24'b0;
								end
							14: begin
									rom_base_addr = out5[44:36];
									color_reg = 24'hFDC00D;
								end
							15: begin
									rom_base_addr = out5[35:27];
									color_reg = 24'hFDC00D;
								end
							16: begin
									rom_base_addr = out5[26:18];
									color_reg = 24'hFDC00D;
								end
							17: begin
									rom_base_addr = out5[17:9];
									color_reg = 24'hFDC00D;
								end
							18: begin
									rom_base_addr = out5[8:0];
									color_reg = 24'hFDC00D;
								end
							default: begin
										rom_base_addr = 9'h100;
										color_reg = 24'b0;
									end
						endcase
					end else begin
						color_reg = 24'b0;
						rom_base_addr = 9'h100;
					end
				end else begin // on reset
					if (y >= 10'd88 && y < 10'd96) begin
						color_reg = 24'hFFFFFF;
						case (x[`log2NUM_COLS-1:3])
							2: 	rom_base_addr = (9'd14 << 3); // N
							3: 	rom_base_addr = (9'd15 << 3); // O
							4: 	rom_base_addr = (9'd32 << 3); //
							5: 	rom_base_addr = (9'd16 << 3); // P
							6: 	rom_base_addr = (9'd01 << 3); // A
							7: 	rom_base_addr = (9'd19 << 3); // S
							8: 	rom_base_addr = (9'd20 << 3); // T
							9: 	rom_base_addr = (9'd32 << 3); // 
							10: rom_base_addr = (9'd14 << 3); // N
							11: rom_base_addr = (9'd15 << 3); // O
							12: rom_base_addr = (9'd20 << 3); // T
							13: rom_base_addr = (9'd05 << 3); // E
							14: rom_base_addr = (9'd19 << 3); // S
							default: rom_base_addr = 9'h100;
						endcase
					end else begin
						color_reg = 24'b0;
						rom_base_addr = 9'h100;
					end
				end // end reset else */
			end //end else on enable 
		end else begin // play_enable low
			if (y >= 10'd8 && y < 10'd16) begin // Paused
				color_reg = 24'hFFFFFF;
				case (x[`log2NUM_COLS-1:3])
					2: rom_base_addr = (9'd16 << 3); // P
					3: rom_base_addr = (9'd01 << 3); // A
					4: rom_base_addr = (9'd21 << 3); // U
					5: rom_base_addr = (9'd19 << 3); // S
					6: rom_base_addr = (9'd05 << 3); // E
					7: rom_base_addr = (9'd04 << 3); // D
					8: rom_base_addr = (9'd32 << 3); // 
					9: rom_base_addr = (9'd62 << 3); // pause symbol
					default: rom_base_addr = 9'h100;
				endcase
			end else begin
				color_reg = 24'b0;
				rom_base_addr = 9'h100;
			end
		end // end main if/else
	end // end always
	
	assign {r_text, g_text, b_text} = (char_px && valid) ? color_reg : 24'h000000;
endmodule
