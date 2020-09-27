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

module Control (ins,controlcode);
	input[15:0] ins;
	output[20:0] controlcode;
	
	reg[20:0] controlcode;
	
	always@(*) 
		begin
			 case(ins[15:11])
				`INS:		controlcode<={`INS,	ins[7:0],8'b00000000};
				`DES:	   controlcode<={`DES,	ins[7:0],8'b00000000};
				`AND:		controlcode<={`AND,	ins[7:0],8'b00000000};
				`OR:		controlcode<={`OR,	ins[7:0],8'b00000000};
				`XOR:		controlcode<={`XOR,	ins[7:0],8'b00000000};
				`SLL:		controlcode<={`SLL,	ins[7:0],8'b00000000};
				`SRL:		controlcode<={`SRL,	ins[7:0],8'b00000000};
				`SLA:		controlcode<={`SLA,	ins[7:0],8'b00000000};
				`SRA:		controlcode<={`SRA,	ins[7:0],8'b00000000};
				
				`ADD:		controlcode<={`ADD,	ins[7:0],8'b00000000};
				`ADD_I:	controlcode<={`ADD_I,ins[7:4],8'b00000000,ins[3:0]};
				`ADD_II:	controlcode<={`ADD_II,8'b00000000,ins[7:0]};
				`ADDC:	controlcode<={`ADDC,	ins[7:0],8'b00000000};
				
				`SUB:		controlcode<={`SUB,	ins[7:0],8'b00000000};
				`SUB_I:	controlcode<={`SUB_I,ins[7:4],8'b00000000,ins[3:0]};
				`SUB_II:	controlcode<={`SUB_II,8'b00000000,ins[7:0]};
				`SUBC:	controlcode<={`SUBC,	ins[7:0],8'b00000000};
				
				`CMP:		controlcode<={`CMP,	ins[7:0],8'b00000000};
				`MOV:	  	controlcode<={`MOV,	ins[7:4],8'b00000000,ins[3:0]};
				`JUMP:	controlcode<={`JUMP,	8'b00000000,ins[7:0]};
			 endcase
		end
		
endmodule
