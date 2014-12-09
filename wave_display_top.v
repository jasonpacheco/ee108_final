module wave_display_top (
    input 			clk,
    input 			reset,
    input			new_sample,
    input 	[15:0] 	sample,
    input 	[10:0] 	x,  // [0..1279]
    input 	[9:0]  	y,  // [0..1023]     
    input 			valid,
    input 			vsync,
    output 	[7:0] 	r,
    output 	[7:0] 	g,
    output 	[7:0] 	b/**,
    input 	[47:0]	individual_note_samples**/
);

    wire [7:0] 	read_sample, write_sample;/**, 
    			read_sample_note_one, write_sample_note_one, 
    			read_sample_note_two, write_sample_note_two, 
    			read_sample_note_three, write_sample_note_three;**/
    			
    wire [8:0] 	read_address, write_address;/**, 
    			read_address_note_one, write_address_note_one, 
    			read_address_note_two, write_address_note_two, 
    			read_address_note_three, write_address_note_three;**/
    			
    wire 		read_index;/**, 
    			read_index_note_one, 
    			read_index_note_two, 
    			read_index_note_three;**/
    			
    wire 		write_en;/**, 
    			write_en_note_one, 
    			write_en_note_two, 
    			write_en_note_three;**/
    			
    wire 		wave_display_idle = ~vsync;

    wave_capture wc_comb (
        .clk(clk),
        .reset(reset),
        .new_sample_ready(new_sample),
        .new_sample_in(sample),
        .write_address(write_address),
        .write_enable(write_en),
        .write_sample(write_sample),
        .wave_display_idle(wave_display_idle),
        .read_index(read_index)
    );
    
    /**
    wave_capture wc_note_one (
    	.clk(clk),
        .reset(reset),
        .new_sample_ready(new_sample),
        .new_sample_in(individual_note_samples[47:32]),
        .write_address(write_address_note_one),
        .write_enable(write_en_note_one),
        .write_sample(write_sample_note_one),
        .wave_display_idle(wave_display_idle),
        .read_index(read_index_note_one)
    );
    
    wave_capture wc_note_two (
    	.clk(clk),
        .reset(reset),
        .new_sample_ready(new_sample),
        .new_sample_in(individual_note_samples[31:16]),
        .write_address(write_address_note_two),
        .write_enable(write_en_note_two),
        .write_sample(write_sample_note_two),
        .wave_display_idle(wave_display_idle),
        .read_index(read_index_note_two)
    );
    
    wave_capture wc_note_three (
    	.clk(clk),
        .reset(reset),
        .new_sample_ready(new_sample),
        .new_sample_in(individual_note_samples[15:0]),
        .write_address(write_address_note_three),
        .write_enable(write_en_note_three),
        .write_sample(write_sample_note_three),
        .wave_display_idle(wave_display_idle),
        .read_index(read_index_note_three)
    );
    **/
    
    ram_1w2r #(.WIDTH(8), .DEPTH(9)) sample_ram (
        .clka(clk),
        .clkb(clk),
        .wea(write_en),
        .addra(write_address),
        .dina(write_sample),
        .douta(),
        .addrb(read_address),
        .doutb(read_sample)
    );
 /**
 	ram_1w2r #(.WIDTH(8), .DEPTH(9)) sample_ram_note_one (
 		.clka(clk),
        .clkb(clk),
        .wea(write_en_note_one),
        .addra(write_address_note_one),
        .dina(write_sample_note_one),
        .douta(),
        .addrb(read_address_note_one),
        .doutb(read_sample_note_one)
    );
    
    ram_1w2r #(.WIDTH(8), .DEPTH(9)) sample_ram_note_two (
 		.clka(clk),
        .clkb(clk),
        .wea(write_en_note_two),
        .addra(write_address_note_two),
        .dina(write_sample_note_two),
        .douta(),
        .addrb(read_address_note_two),
        .doutb(read_sample_note_two)
    );
    
    ram_1w2r #(.WIDTH(8), .DEPTH(9)) sample_ram_note_three (
 		.clka(clk),
        .clkb(clk),
        .wea(write_en_note_three),
        .addra(write_address_note_three),
        .dina(write_sample_note_three),
        .douta(),
        .addrb(read_address_note_three),
        .doutb(read_sample_note_three)
    );
    //wire [7:0] read_sample_delayed;
    //dffr #(8) read_value_pipe(.clk(clk), .r(reset), .d(read_sample), .q(read_sample_delayed));
    **/
    wire [7:0] wd_r, wd_g, wd_b;//, wd_r_n1, wd_g_n1, wd_b_n1, wd_r_n2, wd_g_n2, wd_b_n2, wd_r_n3, wd_g_n3, wd_b_n3;
    wave_display wd (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .valid(valid),
        .read_address(read_address),
        .read_value(read_sample),
        .read_index(read_index),
        .r(wd_r), .g(wd_g), .b(wd_b),
        .color(2'b00)
    );
	/**
	wave_display wd_note_one (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .valid(valid),
        .read_address(read_address_note_one),
        .read_value(read_sample_note_one),
        .read_index(read_index_note_one),
        .r(wd_r_n1), .g(wd_g_n1), .b(wd_b_n1),
        .color(2'b01)
    );
    
    wave_display wd_note_two (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .valid(valid),
        .read_address(read_address_note_two),
        .read_value(read_sample_note_two),
        .read_index(read_index_note_two),
        .r(wd_r_n2), .g(wd_g_n2), .b(wd_b_n2),
        .color(2'b10)
    );
    
    wave_display wd_note_three (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .valid(valid),
        .read_address(read_address_note_three),
        .read_value(read_sample_note_three),
        .read_index(read_index_note_three),
        .r(wd_r_n3), .g(wd_g_n3), .b(wd_b_n3),
        .color(2'b11)
    );
	reg [7:0] r_reg, b_reg, g_reg;
	always @(*) begin
		if (|{wd_r_n1, wd_r_n2, wd_r_n3} != 0) begin
			if (|wd_r_n1 && |wd_r_n2 && |wd_r_n3) begin
				r_reg = (((wd_r_n1 + wd_r_n2) / 2) + wd_r_n3) / 2;
			end else if (|wd_r_n1 && |wd_r_n2 && ~|wd_r_n3) begin
				r_reg = (wd_r_n1 + wd_r_n2) / 2;
			end else if (|wd_r_n1 && ~|wd_r_n2 && |wd_r_n3) begin
				r_reg = (wd_r_n1 + wd_r_n3) / 2;
			end else if (~|wd_r_n1 && |wd_r_n2 && |wd_r_n3) begin
				r_reg = (wd_r_n2 + wd_r_n3) / 2;
			end else if (|wd_r_n1 && ~|wd_r_n2 && ~|wd_r_n3) begin
				r_reg = wd_r_n1;
			end else if (~|wd_r_n1 && |wd_r_n2 && ~|wd_r_n3) begin
				r_reg = wd_r_n2;
			end else if (~|wd_r_n1 && ~|wd_r_n2 && |wd_r_n3) begin
				r_reg = wd_r_n3;
			end else begin
				r_reg = 8'b0;
			end
		end else begin
			r_reg = 8'b0;
		end // hi mailman 
		
		if (|{wd_g_n1, wd_g_n2, wd_g_n3} != 0) begin
			if (|wd_g_n1 && |wd_g_n2 && |wd_g_n3) begin
				g_reg = (((wd_g_n1 + wd_g_n2) / 2) + wd_g_n3) / 2;
			end else if (|wd_g_n1 && |wd_g_n2 && ~|wd_g_n3) begin
				g_reg = (wd_g_n1 + wd_g_n2) / 2;
			end else if (|wd_g_n1 && ~|wd_g_n2 && |wd_g_n3) begin
				g_reg = (wd_g_n1 + wd_g_n3) / 2;
			end else if (~|wd_g_n1 && |wd_g_n2 && |wd_g_n3) begin
				g_reg = (wd_g_n2 + wd_g_n3) / 2;
			end else if (|wd_g_n1 && ~|wd_g_n2 && ~|wd_g_n3) begin
				g_reg = wd_g_n1;
			end else if (~|wd_g_n1 && |wd_g_n2 && ~|wd_g_n3) begin
				g_reg = wd_g_n2;
			end else if (~|wd_g_n1 && ~|wd_g_n2 && |wd_g_n3) begin
				g_reg = wd_g_n3;
			end else begin
				g_reg = 8'b0;
			end
		end else begin
			g_reg = 8'b0;
		end // hi mailman 
		
		if (|{wd_b_n1, wd_b_n2, wd_b_n3} != 0) begin
			if (|wd_b_n1 && |wd_b_n2 && |wd_b_n3) begin
				b_reg = (((wd_b_n1 + wd_b_n2) / 2) + wd_b_n3) / 2;
			end else if (|wd_b_n1 && |wd_b_n2 && ~|wd_b_n3) begin
				b_reg = (wd_r_n1 + wd_r_n2) / 2;
			end else if (|wd_r_n1 && ~|wd_r_n2 && |wd_r_n3) begin
				b_reg = (wd_b_n1 + wd_b_n3) / 2;
			end else if (~|wd_b_n1 && |wd_b_n2 && |wd_b_n3) begin
				b_reg = (wd_b_n2 + wd_b_n3) / 2;
			end else if (|wd_b_n1 && ~|wd_b_n2 && ~|wd_b_n3) begin
				b_reg = wd_b_n1;
			end else if (~|wd_b_n1 && |wd_b_n2 && ~|wd_b_n3) begin
				b_reg = wd_b_n2;
			end else if (~|wd_b_n1 && ~|wd_b_n2 && |wd_b_n3) begin
				b_reg = wd_b_n3;
			end else begin
				b_reg = 8'b0;
			end
		end else begin
			b_reg = 8'b0;
		end // hi mailman 
	end
	assign r = (|wd_r) ? wd_r : r_reg;
	assign g = (|wd_g) ? wd_g : g_reg;
	assign b = (|wd_b) ? wd_b : b_reg;**/
	assign {r, g, b} = {wd_r, wd_g, wd_b};
endmodule
