module test_sen(
	input wire	clk,
	input wire valid_send,
	input wire [7:0] data_send,
	output wire UART_TX
);
  wire [0:0] ready_send;
sender  #(.CLK_PER_HALF_BIT(434)) sender (.clk(clk),.UART_TX(UART_TX),.valid_send(valid_send),.data_send(data_send),.ready_send(ready_send));
endmodule
