module fpu(
  //port for prepare
  input logic clk,
  input logic [0:0] fpu_is,//fpu or not
  input logic [31:0] data_a,
  input logic [31:0] data_b,
  input logic [5:0] data_op,//fpu_fun
//port for result
  //input ready,
  input flag,
  (* keep = "true" *) output logic [31:0] result,
  output logic [0:0] valid
  );
  localparam OP_FPU     = 6'b010001;

  localparam FPU_FUNCT_ADD  = 6'b000000;
	localparam FPU_FUNCT_SUB  = 6'b000001;
  localparam FPU_FUNCT_MUL  = 6'b000010;
  localparam FPU_FUNCT_DIV  = 6'b000011;
  localparam FPU_FUNCT_MOV  = 6'b000110;
  localparam FPU_FUNCT_NEG  = 6'b000111;
  localparam FPU_FUNCT_ABS  = 6'b000101;
  localparam FPU_FUNCT_SQRT = 6'b000100;
  localparam FPU_FUNCT_C_EQ = 6'b110001;
	localparam FPU_FUNCT_C_LT = 6'b110010;
	localparam FPU_FUNCT_C_LE = 6'b110011;
  localparam FPU_FUNCT_FTOI = 6'b011000;


  logic [5:0] op_out;
  assign op_out = (fpu_is == 1'b0) ? 6'b111111:
                   (data_op == FPU_FUNCT_ADD) ? 6'b000000:
                   (data_op == FPU_FUNCT_SUB) ? 6'b000001:
                   (data_op == FPU_FUNCT_C_EQ) ? 6'b010100:
                   (data_op == FPU_FUNCT_C_LT) ? 6'b001100:
                   (data_op == FPU_FUNCT_C_LE) ? 6'b011100:
                   6'b111111;
 logic [0:0] ready=0;
  //for add _ sub
  logic [0:0] valid_add;//for a.b
  logic [0:0] valid_add_res;//for result
  assign valid_add = ((data_op == FPU_FUNCT_ADD)&&flag) ? 1:0;
  logic [31:0] res_add;

  //for sub
    logic [0:0] valid_sub_res;//for result
    logic [0:0] valid_sub;//for a.b
    assign valid_sub = ((data_op == FPU_FUNCT_SUB)&&flag) ? 1:0;
    logic [31:0] res_sub;

//for mul
  logic [0:0] valid_mul_res;//for result
  logic [0:0] valid_mul;//for a.b
  assign valid_mul = ((data_op == FPU_FUNCT_MUL)&&flag) ? 1:0;
  logic [31:0] res_mul;

//for div
  logic [0:0] valid_div_res;//for result
  logic [0:0] valid_div;//for a.b
  assign valid_div = ((data_op == FPU_FUNCT_DIV)&&flag) ? 1:0;
  logic [31:0] res_div;

  //for sqrt
  logic [0:0] valid_sqrt_res;//for result
  logic [0:0] valid_sqrt;//for a.b
  assign valid_sqrt = ((data_op == FPU_FUNCT_SQRT)&&flag) ? 1:0;
  logic [31:0] res_sqrt;

//programmable
  //for cond
  logic [0:0] valid_cond_res;//for result
  logic [0:0] valid_cond;//for a.b
  assign valid_cond = (((data_op == FPU_FUNCT_C_EQ)||(data_op == FPU_FUNCT_C_LT)||(data_op == FPU_FUNCT_C_LE))&&flag) ? 1:0;
  logic [7:0] res_cond;

  //for ftoi
  logic [0:0] valid_ftoi_res;//for result
  logic [0:0] valid_ftoi;//for a.b
  assign valid_ftoi = (FPU_FUNCT_FTOI&&flag) ? 1:0;
  logic [31:0] res_ftoi;

  logic [2:0] stage=3'b001;

  localparam  raise_valid = 3'b001;
  localparam  cancel_valid = 3'b010;


  fadd fadd(
    .aclk(clk),
    .s_axis_a_tdata(data_a),.s_axis_a_tvalid(valid_add),
    .s_axis_b_tdata(data_b),.s_axis_b_tvalid(valid_add),
    .m_axis_result_tdata(res_add),.m_axis_result_tvalid(valid_add_res),.m_axis_result_tready(ready)
    );

    fsub fsub(
      .aclk(clk),
      .s_axis_a_tdata(data_a),.s_axis_a_tvalid(valid_sub),
      .s_axis_b_tdata(data_b),.s_axis_b_tvalid(valid_sub),
      .m_axis_result_tdata(res_sub),.m_axis_result_tvalid(valid_sub_res),.m_axis_result_tready(ready)
      );

  fmul fmul(
    .aclk(clk),
    .s_axis_a_tdata(data_a),.s_axis_a_tvalid(valid_mul),
    .s_axis_b_tdata(data_b),.s_axis_b_tvalid(valid_mul),
    .m_axis_result_tdata(res_mul),.m_axis_result_tvalid(valid_mul_res),.m_axis_result_tready(ready)
    );

  fdiv fdiv(
    .aclk(clk),
    .s_axis_a_tdata(data_a),.s_axis_a_tvalid(valid_div),
    .s_axis_b_tdata(data_b),.s_axis_b_tvalid(valid_div),
    .m_axis_result_tdata(res_div),.m_axis_result_tvalid(valid_div_res),.m_axis_result_tready(ready)
    );

  fsqrt fsqrt(
    .aclk(clk),
    .s_axis_a_tdata(data_a),.s_axis_a_tvalid(valid_sqrt),
    .m_axis_result_tdata(res_sqrt),.m_axis_result_tvalid(valid_sqrt_res),.m_axis_result_tready(ready)
    );

  fcond fcond(
    .aclk(clk),
    .s_axis_a_tdata(data_a),.s_axis_a_tvalid(valid_cond),
    .s_axis_b_tdata(data_b),.s_axis_b_tvalid(valid_cond),
    .s_axis_operation_tdata({2'b00,op_out}),.s_axis_operation_tvalid(valid_cond),
    .m_axis_result_tdata(res_cond),.m_axis_result_tvalid(valid_cond_res),.m_axis_result_tready(ready)
    );

    ftoi ftoi(
      .aclk(clk),
      .s_axis_a_tdata(data_a),.s_axis_a_tvalid(valid_ftoi),
      .m_axis_result_tdata(res_ftoi),.m_axis_result_tvalid(valid_ftoi_res),.m_axis_result_tready(ready)
      );

  always@(posedge clk) begin
    if (stage == raise_valid ) begin
      case(data_op)
        FPU_FUNCT_ADD:begin
          if (valid_add_res) begin
            valid <= 1'b1;
            result[31:0] <= res_add[31:0];
            ready <= 1'b1;
            stage <=  cancel_valid;
          end
        end
        FPU_FUNCT_SUB:begin
          if (valid_sub_res) begin
            valid <= 1'b1;
            result[31:0] <= res_sub[31:0];
            ready <= 1'b1;
            stage <=  cancel_valid;
          end
        end
        FPU_FUNCT_MUL:begin
          if (valid_mul_res) begin
            valid <= 1'b1;
            result[31:0] <= res_mul[31:0];
            ready <= 1'b1;
            stage <=  cancel_valid;
          end
        end
        FPU_FUNCT_DIV:begin
          if (valid_div_res) begin
            valid <= 1'b1;
            result[31:0] <= res_div[31:0];
            ready <= 1'b1;
            stage <=  cancel_valid;
          end
        end
        FPU_FUNCT_SQRT:begin
          if (valid_sqrt_res) begin
            valid <= 1'b1;
            result[31:0] <= res_sqrt[31:0];
            ready <= 1'b1;
            stage <=  cancel_valid;
          end
        end
        FPU_FUNCT_NEG:begin
          valid <= 1'b1;
          result[31:0] <= {~data_a[31],data_a[30:0]};
          stage <=  cancel_valid;
        end
        FPU_FUNCT_MOV:begin
          valid <= 1'b1;
          result[31:0] <= data_a[31:0];
          stage <=  cancel_valid;
        end
        FPU_FUNCT_ABS:begin
          valid <= 1'b1;
          result[31:0] <= {1'b0,data_a[30:0]};
          stage <=  cancel_valid;
        end
        FPU_FUNCT_C_EQ,FPU_FUNCT_C_LE,FPU_FUNCT_C_LT:begin
          if (valid_cond_res) begin
            valid <= 1'b1;
            result[31:0] <= {31'b0,res_cond[0]};
            ready <= 1'b1;
            stage <=  cancel_valid;
          end
        end
        FPU_FUNCT_FTOI:begin
          if (valid_ftoi_res) begin
            valid <= 1'b1;
            result[31:0] <= res_ftoi[31:0];
            ready <= 1'b1;
            stage <=  cancel_valid;
          end
        end
        default   stage <= stage;
      endcase
    end else begin
      valid <= 1'b0;
      stage <= {stage[1:0],stage[2]};
      ready <= 1'b0;
    end
  end

  endmodule
