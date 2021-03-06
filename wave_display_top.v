module wave_display_top (
    input 			clk,
    input 			reset,
    input			new_sample,
    input 	[15:0] 	sample,
    input 	[10:0] 	x,  // [0..1279]
    input 	[9:0]  	y,  // [0..1023]     
    input 			valid,
    input 			vsync,
    input 	[1:0]	color,		
    output 	[7:0] 	r,
    output 	[7:0] 	g,
    output 	[7:0] 	b
);

    wire [7:0] 	read_sample, write_sample;			
    wire [8:0] 	read_address, write_address;  			
    wire 		read_index;
    wire 		write_en;
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
        .color(color)
    );
	/**
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
