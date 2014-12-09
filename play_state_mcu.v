
module play_state_mcu(
     input button_press,
     input rst,
     input clk,
     output [1:0] play_state //00 =  play normal, 01 == double time, 10 = reverse
    );

    wire [1:0] next_state, current_state;
     reg [1:0] next_state_reg;

dff #(2) state_FF (.clk(clk), .d(next_state), .q(current_state));     

     always @(*) begin
          if(button_press)begin
             if(current_state == 2'b00) begin //regular
                next_state_reg = 2'b01;
             end
             else if(current_state == 2'b01) begin //fast forward
                 next_state_reg = 2'b00;
             end
             else begin // cur state == 2'b10, reverse
                    next_state_reg = 2'b00;
             end
          end
          else begin
               next_state_reg = current_state;
          end
     end

assign next_state = rst ? 2'b00 : next_state_reg;
assign play_state = rst ? 2'b00 : current_state;

endmodule
