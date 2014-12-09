
module wave_display_2(
	input clk,
	input reset,
	input [10:0] x,
	input [9:0] y,
	input valid,
	output [8:0] read_address,
	input [7:0] read_value,
	input read_index,
	output valid_pixel,
	output [7:0] r,
	output [7:0] g,
	output [7:0] b
);


     wire [8:0] curr_read_addr, next_read_addr;
     wire [7:0] curr_value, next_value;
     reg [7:0] next_value_reg;
     reg [8:0] next_read_addr_reg;
     reg valid_pixel_reg;
     wire [8:0] y_translate;
     wire [23:0] rgb;
     
     dff #(8) read_value_ff(.clk(clk), .d(next_value), .q(curr_value));
     
     dff #(9) read_address_ff(.clk(clk),.d(next_read_addr), .q(curr_read_addr));
     
     // always for next_read_addr;
     always @(*) begin
          if (x [9:8] == 2'b01) begin
               next_read_addr_reg = {read_index, 1'b0, x [7:1]};
          end
          else if (x [9:8] == 2'b10) begin
               next_read_addr_reg = {read_index, 1'b1, x [7:1]};
          end
          else begin
               next_read_addr_reg = 9'b0;
          end
     end

     // always for valid_pixel
     always @(*) begin
          if((x [9:8] == 2'b01 || x [9:8] == 2'b10) && y[9] == 0 && valid) begin
               valid_pixel_reg = 1;
          end
          else begin
               valid_pixel_reg = 1'b0;
          end
     end

     // always for latency
     always @(*) begin
          if(next_read_addr_reg == curr_read_addr) begin
               next_value_reg = curr_value;
          end
          else begin
               next_value_reg = read_value;
          end
     end

     assign y_translate = {1'b0, y [8:1]};     

     assign next_value = reset ? 0 : next_value_reg;
     assign next_read_addr = reset ? 0 : next_read_addr_reg;
     assign valid_pixel = reset ? 0 : valid_pixel_reg;
     assign rgb = reset ? 24'h0 : ( (y_translate <= next_value && y_translate >= curr_value) || ( y_translate >= next_value && y_translate <= curr_value) ? 24'hFFFFFF : 24'h0);
	assign read_address = next_read_addr;

     assign r = rgb[23:16];
     assign g = rgb[15:8];
     assign b = rgb[7:0];
     
endmodule
