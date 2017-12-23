module test_top (
	input wire 	clk,
	//input logic valid_send,
	//input logic data_send[7:0],
	//output logic ready_send,
	output wire UART_TX
	);
test  #(.CLK_PER_HALF_BIT(868)) test (.clk(clk),.UART_TX(UART_TX));
endmodule
