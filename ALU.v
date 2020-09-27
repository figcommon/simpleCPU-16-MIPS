`define  INS		5'b00000 //自增
`define  DES		5'b00001 //自减

`define	AND		5'b01000	//与
`define 	OR    	5'b01001	//或
`define 	XOR   	5'b01010	//异或
`define	SLL		5'b01011	//逻辑左移
`define 	SRL   	5'b01100 //逻辑右移
`define	SLA		5'b01101 //算数左移
`define 	SRA   	5'b01110 //算数右移

`define  ADD		5'b10000 //加
`define	ADDC		5'b10001 //带进位的加
`define	SUB   	5'b10010 //减
`define 	SUBC  	5'b10011 //带借位的减

`define	ADD_I		5'b10100 //带一个立即数的加
`define 	SUB_I  	5'b10101 //带一个立即数的减
`define	ADD_II	5'b10110 //带两个立即数的加
`define 	SUB_II 	5'b10111 //带两个立即数的减

`define	CMP		5'b00100 //比较
`define	JUMP		5'b00101 //跳转
`define	MOV		5'b00110 //传送

module ALU(
	input CLK,
	input [4:0] ALUControl,
	input [15:0] SrcA,
	input [15:0] SrcB,
	output reg[15:0] ALUResult,
	output reg[7:0] pc=0,
	output reg regwr
    );
	
	//结果为负数N=1,结果为零Z=1,加法进位C=1减法借位C=0
	reg CF_temp;
	/*
	wire ZF_temp, NF_temp;
	reg ZF, CF, NF;
	*/
	/*
	initial begin
		//初始化pc
		pc <= {8'b0};
	end	
	*/
	always@(*)//根据指令内容，对操作数进行不同的运算
	//if(enable)
	begin
		//ALUResult <= 16'b0;
		case(ALUControl)
			`INS:	   begin ALUResult <= ( SrcA + 1 ); regwr <= 1'b1; end
			`DES:		begin ALUResult <= ( SrcA - 1 ); regwr <= 1'b1; end
			
			`AND:		begin ALUResult <= ( SrcA & SrcB );regwr <= 1'b1; end
			`OR:		begin ALUResult <= ( SrcA | SrcB );regwr <= 1'b1; end
			`XOR:		begin ALUResult <= ( SrcA ^ SrcB );regwr <= 1'b1; end
			`SLL:		begin ALUResult <= ( SrcA << SrcB );regwr <= 1'b1; end
			`SRL:		begin ALUResult <= ( SrcA >> SrcB );regwr <= 1'b1; end
			`SLA:		begin ALUResult <= ( SrcA <<< SrcB );regwr <= 1'b1; end
			`SRA:		begin ALUResult <= ( SrcA >>> SrcB );regwr <= 1'b1; end
			
			`ADD:		begin {CF_temp, ALUResult} <= {1'b0, SrcA} + {1'b0, SrcB};regwr <= 1'b1; end
			`ADD_I:	begin {CF_temp, ALUResult} <= {1'b0, SrcA} + {1'b0, SrcB};regwr <= 1'b1; end
			`ADD_II:	begin {CF_temp, ALUResult} <= {1'b0, SrcA} + {1'b0, SrcB};regwr <= 1'b0; end
			`ADDC:	begin ALUResult <= ( SrcA + SrcB + CF_temp);regwr <= 1'b1; end
			
			`SUB:		begin ALUResult <= ( SrcA - SrcB );regwr <= 1'b1; end
			`SUB_I:	begin ALUResult <= ( SrcA - SrcB );regwr <= 1'b1; end
			`SUB_II:	begin ALUResult <= ( SrcA - SrcB );regwr <= 1'b0; end
			`SUBC:	begin ALUResult <= ( SrcA - SrcB - CF_temp);regwr <= 1'b1; end
			
			`CMP:		begin ALUResult <= ( SrcA - SrcB );regwr <= 1'b0; end
			`MOV:	   begin ALUResult <= SrcB;regwr <= 1'b1; end
			`JUMP:	begin ALUResult <= ALUResult;regwr <= 1'b0; end//增加一位处理是否溢出设置CF
			
			default:	ALUResult <= ALUResult;
		endcase
	end
	//发送跳转信号
	always@(posedge CLK)
	//if(enable)
	begin
		case(ALUControl)
			`JUMP:	pc <= {SrcA[3:0],SrcB[3:0]};//跳转指定位置
			
			default:	pc <= pc+1;//默认下一条指令
		endcase
	end
	/*
	//结果为0时ZF标志位为1
	assign ZF_temp = (ALUResult == 0);
	//结果高位为1时ZF标志位为1
	assign NF_temp = (ALUResult[15] == 1'b1);
	//CF在运算时已处理
	//assign CF_temp = CF_temp;
	//增加一级缓存，为CMP的下一个周期使用
	always@(posedge CLK)
	begin
		ZF <= ZF_temp;
		CF <= CF_temp;
		NF <= NF_temp;
	end
	
	//Set Flag 根据真值表设置
	always@(*)
	begin
		case(ALUControl)
			`JUMP:	Flag <= 1'b1;//跳转指令恒为1
			
			`JMPR:	Flag <= 1'b1;
			`BZ:		Flag <= ZF;//根据ZF标志位
			`BNZ:		Flag <= ~ZF;
			`BN:		Flag <= NF;//根据NF标志位
			`BNN:		Flag <= ~NF;
			`BC:		Flag <= CF;//根据CF标志位
			`BNC:		Flag <= ~CF;
			
			default:	Flag <= 1'b0;//其余为0
		endcase
	end
	*/
endmodule
