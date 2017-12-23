`timescale 1 ns / 100 ps

module top(

//clk -> clk_wiz　を通してから供給
	input wire clk_p,
	input wire clk_n,
	//input wire clk,
//UART

	input wire UART_RX,
	output wire UART_TX,

//debug

	input wire SW_W,
	input wire SW_E,
	input wire SW_N,
	output wire[7:0] LED


);

	top_core  #(.MEM_WIDTH(16),.INST_WIDTH(16)) top_core(.clk_p(clk_p),.clk_n(clk_n),.SW_N(SW_N),.SW_E(SW_E),.SW_W(SW_W),.LED(LED),.UART_RX(UART_RX),.UART_TX(UART_TX));
	//top_core #(.MEM_WIDTH(16),.INST_WIDTH(16)) top_core(.clk(clk),.SW_N(SW_N),.SW_E(SW_E),.SW_W(SW_W),.LED(LED),.UART_RX(UART_RX),.UART_TX(UART_TX));

endmodule
