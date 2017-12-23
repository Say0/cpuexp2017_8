module uart(
//read_address
  output logic [3:0] s_axi_arddr,
  //input logic s_axi_arready,
  output logic s_axi_arvalid,
//write address
  output logic [3:0] s_axi_awddr,
  //input logic s_axi_awready,
  output logic s_axi_awvalid,
//cond
  output logic s_axi_bready,
  input logic [1:0] s_axi_bresp,
  input logic s_axi_bvalid,
//read data
  input logic [31:0] s_axi_rdata,
  output logic s_axi_rready,
  input logic [1:0] s_axi_rresp,
  input logic  s_axi_rvalid,
//write data
  output logic [31:0] s_axi_wdata,
  input logic s_axi_wready,
  output logic [3:0] s_axi_wstrb,
  output logic  s_axi_wvalid,
//
  input logic clk,
//for recieve
  output logic valid,
  output logic [31:0] data_rec,
//for send
  input logic [31:0] data,
  input logic vald_send
  );
  logic ready_rec=1'b1;//on-off

//stage
  logic [1:0] stage = 0;
//read_address
  assign s_axi_arddr [3:0] = 4'b0;
  //ready_ignore
  //**ready = LOAD_MODE,1 clock after valid down
  assign s_axi_arvalid = 1'b1;
//write_address
  assign s_axi_awddr [3:0] = 4'h4;
  //ready_ignore
  assign s_axi_awvalid = 1'b1;
//read_data
  assign data_rec [31:0] = s_axi_rdata;
  assign s_axi_rready = ready_rec;//down?
//write_data
  assign s_axi_wdata[31:0] = data_send[31:0];
  assign s_axi_wvalid = valid_send;
  assign axi_wstrb = 4'b0001;

//output
  assign valid = s_axi_rvalid;

  always@(posedge clk) begin
    //read
    //アドレスに基づいたデータをとる+rresp処理（未実装）
    if(ready_rec == 1'b0) begin
      ready_rec <= 1'b1;
    end else if (s_axi_rvalid && (ready_rec || s_axi_rresp[1]))begin
      ready_rec <= 1'b0;
    end
    //cond
    //write
endmodule
