module test_loop(
  input clk_p,
  input clk_n,
  input wire UART_RX,
  output wire UART_TX
  );
  wire  valid_send;
  wire valid_rec;
  reg   [7:0] data_send;
  reg [7:0] data_rec;
  wire ready;

  assign valid_rec = valid_send;
  assign data_rec = data_send;

  clk_wiz clk_wiz(.clk_in1_p(clk_p),.clk_in1_n(clk_n),.clk(clk));

  receiver  #(.CLK_PER_HALF_BIT(868)) receiver (.clk(clk),.UART_RX(UART_RX),.valid_rec(valid_rec),.data_rec(data_rec));

  sender  #(.CLK_PER_HALF_BIT(868)) sender (.clk(clk),.UART_TX(UART_TX),.valid_send(valid_send),
  .data_send(data_send),.ready_send(ready));
endmodule
