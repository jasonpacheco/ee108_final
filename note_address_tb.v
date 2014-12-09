
module note_address_tb (
    );
    
    reg [5:0] note_in;
    wire [44:0] note_address;
	note_address DUT(.note(note_in), .note_addr(note_address));
	
	
	initial begin
		note_in = 6'd4;
		$display("note_in=%d, note_address=%h", note_in, note_address);
		#20 note_in = 6'd12;
		$display("note_in=%d, note_address=%h", note_in, note_address);
		#10 note_in = 6'd22;
		$display("note_in=%d, note_address=%h", note_in, note_address);
		#10 note_in = 6'd4;
		$display("note_in=%d, note_address=%h", note_in, note_address);
		#10 note_in = 6'd12;
		$display("note_in=%d, note_address=%h", note_in, note_address);
		#10 note_in = 6'd22;
		$display("note_in=%d, note_address=%h", note_in, note_address);
		#10
		$finish;
	end

endmodule
