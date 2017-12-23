`timescale 1 ns / 100 ps
//remove incompatible address-register
module top_core #(
	parameter MEM_WIDTH = 16,
	parameter INST_WIDTH = 16
)(

//clk -> clk_wiz　を通してから供給
		input logic clk_p,
		input logic clk_n,
		//input logic clk,
//UART
	input logic UART_RX,
	output logic UART_TX,

//debug

	input logic SW_W,
	input logic SW_E,
	input logic SW_N,
	output logic[7:0] LED
);
//local param
	localparam OP_SPECIAL = 6'b000000;
	localparam OP_FPU     = 6'b010001;
	localparam OP_ADDI    = 6'b001000;
	localparam OP_ANDI    = 6'b001100;
	localparam OP_ORI     = 6'b001101;
	localparam OP_IN      = 6'b011010;
	localparam OP_OUT     = 6'b011011;
	localparam OP_LUI    = 6'b001111;
	localparam OP_BEQ     = 6'b000100;
	localparam OP_BNE     = 6'b000101;
	localparam OP_BGEZ     = 6'b000001;
	localparam OP_BGTZ     = 6'b000111;
	localparam OP_BLEZ  = 6'b000110;
	localparam OP_J       = 6'b000010;
	localparam OP_JAL     = 6'b000011;

	localparam OP_LW      = 6'b100011;
	localparam OP_SW      = 6'b101011;

	localparam OP_FSW      = 6'b110001;
	localparam OP_FLW      = 6'b111001;

	localparam OP_MTFC	  = 6'b010011;

	localparam OP_FBCT     = 6'b010101;

	localparam FPU_FUNCT_FTOI = 6'b011000;
	localparam OP_ITOF = 6'b011001;

	localparam FUNCT_ADD  = 6'b100000;
	localparam FUNCT_SUB  = 6'b100010;
	localparam FUNCT_AND  = 6'b100100;
	localparam FUNCT_OR   = 6'b100101;
//	localparam FUNCT_NOR  = 6'b100111;
	localparam FUNCT_SLL  = 6'b000000;
	localparam FUNCT_SRL  = 6'b000010;
//	localparam FUNCT_SLT  = 6'b101010;
	localparam FUNCT_JR   = 6'b001000;
	localparam FUNCT_JALR = 6'b001001;

//	localparam FPU_OP_SPECIAL = 2'b10;
//	localparam FPU_OP_B       = 2'b01;

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


	localparam FETCH = 2'b00;
	localparam DECODE = 2'b01;
	localparam EXECUTE = 2'b10;
	localparam WRITE = 2'b11;

	logic [31:0] instr=0;
(* mark_debug = "true" *)	logic [1:0] stage = FETCH;

//register
	(* keep = "true" *)  logic [31:0] [31:0] gpr = {{29{32'b0}},32'b00000011000001010000001000000011,32'b00000001000000100000001100000111,32'b0};
	logic [31:0] [31:0] fpr = {{29{32'b0}},
	32'b00000000100000000000000000000010,
	32'b01000001000000000000000000000000,
	32'b0};
	logic [0:0] cond_reg=0;
	logic [31:0] reg_ew=0;
	logic [INST_WIDTH-1:0] reg_pc=0;
	assign LED = (SW_E) ? gpr [1] [23:16]:
							 (SW_W) ? gpr [1] [15:8]:
							 (SW_N) ? pc [7:0]:
							 gpr [1] [7:0];
//clk
	logic clk;
	clk_wiz clk_wiz(.clk_in1_p(clk_p),.clk_in1_n(clk_n),.clk_out1(clk));

//bram_data for data
 logic [MEM_WIDTH-1:0] addra=0;
 logic [31:0] din;
 logic [31:0] dout;
 logic wea=0;
 logic enable;
 assign enable = 1;
 blk_mem blk_mem(.addra(addra),.clka(clk),.dina(din),.douta(dout),.wea(wea),.ena(enable));
 logic [0:0] latency=0;

//pc
	(* mark_debug = "true" *) (* keep = "true" *) logic [INST_WIDTH-1:0] pc  = 16'b0;
	logic [INST_WIDTH-1:0] pc_add_1;
	assign pc_add_1 = pc +1;

	//bram_data for instr
   //logic [MEM_WIDTH-1:0] addrb=0;
   logic [31:0] dinb=32'b0;
   logic [31:0] doutb;
   logic weab;
   logic enableb;
   assign enableb = 1;
 	//assign addrb = pc;
   inst_mem inst_mem(.addra(pc),.clka(clk),.dina(dinb),.douta(doutb),.wea(weab),.ena(enableb));

 	assign weab = 1'b0;

//output
	assign data = gpr[1];
//fpu
 logic [31:0] res_fp;
 logic [0:0] valid_fp;
 logic [0:0] fpu_is;
 logic [0:0] flag=0;
 assign  fpu_is =  (instr[31:26] == OP_FPU) ? 1:0;
 fpu fpu(.clk(clk),.fpu_is(fpu_is),.data_a(fpr[instr[15:11]]),.data_b(fpr[instr[20:16]]),.data_op(instr[5:0]),.flag(flag),.result(res_fp),.valid(valid_fp));
//result=>fpr writestep

//itof (ftoi => fpu)
	logic [31:0] res_if;
	logic [0:0] valid_if;
	logic [0:0] if_is;
	assign  if_is =  (instr[31:26] == OP_ITOF) ? 1:0;
	logic [0:0] ready_if=1;
	itof itof(
    .aclk(clk),
    .s_axis_a_tdata(gpr[instr[15:11]]),.s_axis_a_tvalid(if_is&&flag),
    .m_axis_result_tdata(res_if),.m_axis_result_tvalid(valid_if),.m_axis_result_tready(ready_if)
    );

//communicate
	(* mark_debug = "true" *) logic valid_rec;
	(* mark_debug = "true" *) logic ready_rec;
	assign ready_rec = (instr[31:26] == OP_IN && stage == EXECUTE) ? 1:0;
	logic [31:0] data_rec;
	receiver_wrapper receiver_wrapper(.clk(clk),.UART_RX(UART_RX),.ready(ready_rec),.data(data_rec),.valid(valid_rec));

	logic valid_send=1'b0;
	logic [31:0] data_send=31'b0;
	logic [0:0] id=1'b0;
	send_wrapper send_wrapper(.clk(clk),.valid(valid_send),.data(data_send),.id(id),.UART_TX(UART_TX));

//comp
	always@(posedge clk) begin
//-fetch
		if(stage == FETCH) begin
			stage <= stage +1;
//-decode <= instr = instr_mem[pc] で代用
		end else if (stage == DECODE) begin//addra確定
			instr <= doutb;
			flag <= 1;
			stage <= stage +1;
		end else if (stage == EXECUTE) begin//instr確定 + add EWregister
			flag <= 0;
			case(instr[31:26])
//-exec_alu
				OP_SPECIAL:
					case(instr[5:0])
						FUNCT_ADD:reg_ew <= gpr[instr[25:21]] + gpr[instr[20:16]];
						FUNCT_SUB:reg_ew <= gpr[instr[25:21]] - gpr[instr[20:16]];
						FUNCT_AND:reg_ew <= gpr[instr[25:21]] & gpr[instr[20:16]];
						FUNCT_OR:reg_ew <= gpr[instr[25:21]] | gpr[instr[20:16]];
						FUNCT_SLL:reg_ew <= gpr[instr[20:16]] << instr[10:6];
						FUNCT_SRL:reg_ew <= gpr[instr[20:16]] >> instr[10:6];
						FUNCT_JALR:begin
							reg_pc<=gpr[instr[25:21]][INST_WIDTH-1:0];
							reg_ew <= {16'b0,pc_add_1};
						end
						FUNCT_JR:reg_pc <= gpr[instr[25:21]][INST_WIDTH-1:0];
					endcase
				OP_ADDI:reg_ew <= gpr[instr[25:21]] + $signed({{16{instr[15]}},instr[15:0]});
				OP_ANDI:reg_ew <= gpr[instr[25:21]] & {16'b0,instr[15:0]};
				OP_ORI:reg_ew<= gpr[instr[25:21]] | {16'b0,instr[15:0]};
				OP_LUI:reg_ew<= {instr[15:0],16'b0};
				OP_J:reg_pc <= instr[INST_WIDTH-1:0];
				OP_JAL:reg_pc <= pc_add_1;
				OP_MTFC:begin
					if(instr[25:21]==5'b0) begin
						reg_ew<=fpr[instr[15:11]];
					end else begin
						reg_ew<=gpr[instr[20:16]];
					end
				end
				OP_ITOF:begin
					if(valid_if) begin
						reg_ew <= res_if;
						ready_if <= 0;
					end
				end
//-exec_load
				OP_LW:begin
					addra [MEM_WIDTH-1:0] <= gpr[instr[25:21]][MEM_WIDTH-1:0]+$signed({instr[15],instr[MEM_WIDTH-2:0]});
					latency <= 1'b1;
				end
				OP_SW:begin
					addra [MEM_WIDTH-1:0] <= gpr[instr[25:21]][MEM_WIDTH-1:0]+$signed({instr[15],instr[MEM_WIDTH-2:0]});
					din <= gpr[instr[20:16]];
					wea <= 1'b1;
				end
				OP_FLW:begin
					addra [MEM_WIDTH-1:0] <= gpr[instr[25:21]][MEM_WIDTH-1:0]+$signed({instr[15],instr[MEM_WIDTH-2:0]});
					latency <= 1'b1;
				end
				OP_FSW:begin
					addra [MEM_WIDTH-1:0] <= gpr[instr[25:21]][MEM_WIDTH-1:0]+$signed({instr[15],instr[MEM_WIDTH-2:0]});
					din <= fpr[instr[20:16]];
					wea <= 1'b1;
				end
//-exec_branch
				OP_BEQ:reg_pc <= pc+$signed({instr[15],instr[MEM_WIDTH-2:0]});
				OP_BNE:reg_pc <= pc+$signed({instr[15],instr[MEM_WIDTH-2:0]});
				OP_BGEZ:reg_pc <= pc+$signed({instr[15],instr[MEM_WIDTH-2:0]});
				OP_BGTZ:reg_pc <= pc+$signed({instr[15],instr[MEM_WIDTH-2:0]});
				OP_BLEZ:reg_pc <= pc+$signed({instr[15],instr[MEM_WIDTH-2:0]});
				OP_FBCT:reg_pc <= pc+$signed({instr[15],instr[MEM_WIDTH-2:0]});
//-exec_fpu
			OP_FPU:
				/*case(instr[5:0])
					FPU_FUNCT_ADD,FPU_FUNCT_SUB,FPU_FUNCT_MUL,FPU_FUNCT_NEG,FPU_FUNCT_MOV,FPU_FUNCT_ABS,FPU_FUNCT_DIV,FPU_FUNCT_C_EQ,FPU_FUNCT_C_LE,FPU_FUNCT_C_LT:*/begin
						if (valid_fp) begin
							reg_ew <= res_fp;
						end
					end
				//endcase
//-exec-in/out
			OP_IN:begin
				if (valid_rec) begin
								reg_ew <= data_rec;
							end
			end
			OP_OUT:	begin
			//32bit
									id <= instr[21];
									data_send <= gpr[instr[20:16]];
									valid_send <= 1'b1;
							end
					default reg_ew <= reg_ew;
			endcase
//fpu or not
	case(instr[31:26])
		OP_FPU:begin
			if (valid_fp) begin
				stage <= stage +1;
			end else begin
					stage <= stage;
			end
		end
		OP_ITOF:begin
			if (valid_if) begin
				stage <= stage +1;
			end else begin
					stage <= stage;
			end
		end
		OP_IN:begin
			if (valid_rec) begin
				stage <= stage +1;
			end else begin
					stage <= stage;
			end
		end
		OP_OUT:begin
						if (valid_send) begin
							stage <= stage + 1;
							valid_send <= 1'b0;
						end else begin
							stage <= stage;
						end
					end
		default stage <= stage + 1;
	endcase
//stage_renew
		end else if (stage == WRITE) begin
			case(instr[31:26])
//-write_alu
				OP_SPECIAL:
					case(instr[5:0])
						FUNCT_ADD:gpr[instr[15:11]] <= reg_ew;
						FUNCT_SUB:gpr[instr[15:11]] <= reg_ew;
						FUNCT_AND:gpr[instr[15:11]] <= reg_ew;
						FUNCT_OR:gpr[instr[15:11]] <= reg_ew;
						FUNCT_JALR:gpr[instr[15:11]]<=reg_ew;
						FUNCT_SLL:gpr[instr[15:11]]<=reg_ew;
						FUNCT_SRL:gpr[instr[15:11]]<=reg_ew;
					endcase
				OP_FPU:
					case(instr[5:0])
						FPU_FUNCT_C_EQ,FPU_FUNCT_C_LE,FPU_FUNCT_C_LT:cond_reg <= reg_ew[0];
						FPU_FUNCT_FTOI:gpr[instr[10:6]] <= reg_ew;
						default fpr[instr[10:6]] <= reg_ew;
					endcase
				OP_ITOF:begin
					fpr[instr[10:6]] <= reg_ew;
					ready_if <= 1'b1;
				end
				OP_LUI:gpr[instr[20:16]] <= reg_ew;
				OP_ADDI:gpr[instr[20:16]] <= reg_ew;
				OP_ANDI:gpr[instr[20:16]] <= reg_ew;
				OP_ORI:gpr[instr[20:16]] <= reg_ew;
				OP_JAL:gpr[31] <= {16'b0,reg_pc};
				OP_MTFC:begin
					if(instr[25:21]==5'b0) begin
						gpr[instr[20:16]]<=reg_ew;
					end else begin
						fpr[instr[15:11]]<=reg_ew;
					end
				end
//-write_load
				OP_LW:begin
					if(latency) begin
						latency <= 1'b0;
					end else begin
						gpr[instr[20:16]] <= dout;
					end
				end
				OP_FLW:begin
					if(latency) begin
						latency <= 1'b0;
					end else begin
						fpr[instr[20:16]] <= dout;
					end
				end
				OP_SW,OP_FSW:wea <= 1'b0;
//-write_in/out
				OP_IN:begin
						gpr[instr[20:16]] <= reg_ew;
					end
			endcase
//pc
//special_case 1.JALR 2.JR 3.BEQ,BNE,BGEZ,BGTZ,BLEZ 4.J 5,JAL
			case(instr[31:26])
				OP_SPECIAL:
					case(instr[5:0])
						FUNCT_JALR:pc <= reg_pc;
						FUNCT_JR:pc <= reg_pc;
						default  pc <= pc_add_1;
					endcase
				OP_BEQ:begin
					if (gpr[instr[25:21]] == gpr[instr[20:16]])	begin
						pc <= reg_pc;
					end else begin
						pc <= pc_add_1;
					end
				end
				OP_BNE:begin
					if (gpr[instr[25:21]] != gpr[instr[20:16]])	begin
						pc <= reg_pc;
					end else begin
						pc <= pc_add_1;
					end
				end
				OP_BGEZ:begin
					if (gpr[instr[25:21]] >= gpr[0])	begin
						pc <= reg_pc;
					end else begin
						pc <= pc_add_1;
					end
				end
				OP_BGTZ:begin
					if (gpr[instr[25:21]] > gpr[0])	begin
						pc <= reg_pc;
					end else begin
						pc <= pc_add_1;
					end
				end
				OP_BLEZ:begin
					if (gpr[instr[25:21]] <= gpr[0])	begin
						pc <= reg_pc;
					end else begin
						pc <= pc_add_1;
					end
				end
				OP_FBCT:begin
					if (cond_reg)	begin
						pc <= reg_pc;
					end else begin
						pc <= pc_add_1;
					end
				end
				OP_J:pc <= reg_pc;
				OP_JAL:pc <= pc+$signed({instr[15],instr[INST_WIDTH-2:0]});
				OP_LW,OP_FLW:begin
					if(latency) begin
						pc <= pc;
					end else begin
						pc <= pc_add_1;
					end
				end
				default : pc <= pc_add_1;
			endcase
			if(latency)begin
				stage <= stage;
			end else begin
		 		stage <= stage+1;
			end
		end
	end
endmodule
