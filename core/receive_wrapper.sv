module receiver_wrapper(
  input wire clk,
  input wire UART_RX,
  input wire ready,
  output reg [31:0] data=0,
  output reg valid
  );

  localparam WIDTH = 128;

  reg [WIDTH-1:0] [31:0] buffer = {128{32'b0}};
  wire valid_rec;
  reg [7:0] data_rec;

  reg [1:0] idx = 2'b00;

  reg [WIDTH-1:0] in = 7'b0;
  reg [WIDTH-1:0] out = 7'b0;

  wire valid_w;
  assign valid_w = (in != out);

  receiver  #(.CLK_PER_HALF_BIT(434)) receiver (.clk(clk),.UART_RX(UART_RX),.valid_rec(valid_rec),.data_rec(data_rec));

  always @ (posedge clk) begin
    if (valid_rec) begin
      buffer[in][idx*8+:8] <= data_rec;
      {in,idx} <= {in,idx}+1;
    end
    if (ready && valid_w) begin
      data <= buffer[out];
      out <= out+1;
    end
    valid <= valid_w;
  end
endmodule
