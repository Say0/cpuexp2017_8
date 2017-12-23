module test_rec(
  input wire clk,
  input wire UART_RX,
  output wire [7:0] data,
  output wire [7:0] LED,
  output wire valid
  );
wire [0:0] valid_rec;
assign valid =valid_rec;
wire [7:0] data_rec;
assign data = data_rec; 
assign LED = data;
receiver  #(.CLK_PER_HALF_BIT(434)) receiver (.clk(clk),.UART_RX(UART_RX),.valid_rec(valid_rec),.data_rec(data_rec));

endmodule
