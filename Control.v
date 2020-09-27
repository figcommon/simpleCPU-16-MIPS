`define  INS		5'b00000 //����
`define  DES		5'b00001 //�Լ�

`define	AND		5'b01000	//��
`define 	OR    	5'b01001	//��
`define 	XOR   	5'b01010	//���
`define	SLL		5'b01011	//�߼�����
`define 	SRL   	5'b01100 //�߼�����
`define	SLA		5'b01101 //��������
`define 	SRA   	5'b01110 //��������

`define  ADD		5'b10000 //��
`define	ADDC		5'b10001 //����λ�ļ�
`define	SUB   	5'b10010 //��
`define 	SUBC  	5'b10011 //����λ�ļ�

`define	ADD_I		5'b10100 //��һ���������ļ�
`define 	SUB_I  	5'b10101 //��һ���������ļ�
`define	ADD_II	5'b10110 //�������������ļ�
`define 	SUB_II 	5'b10111 //�������������ļ�

`define	CMP		5'b00100 //�Ƚ�
`define	JUMP		5'b00101 //��ת
`define	MOV		5'b00110 //����

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
