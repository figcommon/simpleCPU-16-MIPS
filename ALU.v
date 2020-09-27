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

module ALU(
	input CLK,
	input [4:0] ALUControl,
	input [15:0] SrcA,
	input [15:0] SrcB,
	output reg[15:0] ALUResult,
	output reg[7:0] pc=0,
	output reg regwr
    );
	
	//���Ϊ����N=1,���Ϊ��Z=1,�ӷ���λC=1������λC=0
	reg CF_temp;
	/*
	wire ZF_temp, NF_temp;
	reg ZF, CF, NF;
	*/
	/*
	initial begin
		//��ʼ��pc
		pc <= {8'b0};
	end	
	*/
	always@(*)//����ָ�����ݣ��Բ��������в�ͬ������
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
			`JUMP:	begin ALUResult <= ALUResult;regwr <= 1'b0; end//����һλ�����Ƿ��������CF
			
			default:	ALUResult <= ALUResult;
		endcase
	end
	//������ת�ź�
	always@(posedge CLK)
	//if(enable)
	begin
		case(ALUControl)
			`JUMP:	pc <= {SrcA[3:0],SrcB[3:0]};//��תָ��λ��
			
			default:	pc <= pc+1;//Ĭ����һ��ָ��
		endcase
	end
	/*
	//���Ϊ0ʱZF��־λΪ1
	assign ZF_temp = (ALUResult == 0);
	//�����λΪ1ʱZF��־λΪ1
	assign NF_temp = (ALUResult[15] == 1'b1);
	//CF������ʱ�Ѵ���
	//assign CF_temp = CF_temp;
	//����һ�����棬ΪCMP����һ������ʹ��
	always@(posedge CLK)
	begin
		ZF <= ZF_temp;
		CF <= CF_temp;
		NF <= NF_temp;
	end
	
	//Set Flag ������ֵ������
	always@(*)
	begin
		case(ALUControl)
			`JUMP:	Flag <= 1'b1;//��תָ���Ϊ1
			
			`JMPR:	Flag <= 1'b1;
			`BZ:		Flag <= ZF;//����ZF��־λ
			`BNZ:		Flag <= ~ZF;
			`BN:		Flag <= NF;//����NF��־λ
			`BNN:		Flag <= ~NF;
			`BC:		Flag <= CF;//����CF��־λ
			`BNC:		Flag <= ~CF;
			
			default:	Flag <= 1'b0;//����Ϊ0
		endcase
	end
	*/
endmodule
