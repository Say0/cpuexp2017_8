module send_wrapper(
  input wire clk,
  input wire valid,
  input reg [31:0] data,
  input reg [0:0] id,
  output wire UART_TX//,
//  output reg ready
  );

  localparam WIDTH = 128;

  reg [WIDTH-1:0] [31:0] buffer = {128{32'b0}};
  reg [WIDTH-1:0] is_byte = 128'b0;
  wire ready_send;
  reg [7:0] data_send=8'b11111111;

  reg [1:0] idx = 2'b00;

  reg [7:0] in = 7'b0;
  reg [7:0] out = 7'b0;
  reg diff=1'b0;

  reg valid_send=0;

	sender #(.CLK_PER_HALF_BIT(434))  sender(.clk(clk),.valid_send(valid_send),.data_send(data_send),.ready_send(ready_send),.UART_TX(UART_TX));

  always @ (posedge clk) begin
    if (valid) begin
      buffer[in] <= data;
      is_byte[in] <= id;
      in <= in+1;
    end
    if (in != out) begin
      diff <= 1'b1;
    end else begin
      diff <= 1'b0;
    end
    if(diff) begin
      data_send <= buffer[out][idx*8+:8];
      valid_send <= 1'b1;
    end else begin
      valid_send <= 1'b0;
    end
    if(valid_send && ready_send) begin
      valid_send <= 0;
      if(!is_byte[out]) begin
        {out,idx} <= {out,idx}+1;
      end else begin
        out <= out+1;
      end
    end
  end
endmodule
