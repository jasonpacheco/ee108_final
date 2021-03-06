module mcu (
    input 			clk,
    input 			reset,
    input 			play_button,
    input 			next_button,
    output 			play,
    output 			reset_player,
    output [1:0] 	song,
    input 			song_done
);

	wire    play_state;
	reg     play_next_state;
	
	// Flip-flop for tracking current song. Resets to song 0. Goes to next song on next_button or song_done.
	dffre #(2) song_ff (.clk(clk), .r(reset), .en(next_button || song_done), .d(song + 1'b1), .q(song));
	
	// Flip-flop for tracking the play state. Initializes to paused (1'b0); goes to pause when the play button
	// is pressed if the song was playing, when the song is complete, or when the next button is pressed; and 
	// goes to play if the play button is pressed when previously paused.
	dffr #(1) play_ff (.clk(clk), .r(reset), .d(play_next_state), .q(play_state));
	
	//Logic that determines current song.
	always @(*) begin
		if (play_state == 1'b1) begin
			play_next_state = (play_button || next_button || song_done) ? 1'b0 : 1'b1;
		end else if (play_state == 1'b0) begin
		    play_next_state = play_button ? 1'b1 : 1'b0;
		end else begin
			play_next_state = 1'b0;
		end
	end
	
	assign reset_player = next_button || song_done;
	assign play = (play_state == 1'b1);

endmodule
