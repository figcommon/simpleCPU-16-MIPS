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

module InstructionMemory(
	input CLK,
	input [7:0] A,
	output [15:0] RD
   );
	
	reg [15:0] IMmem [21:0];
	reg [7:0] temp = 0;
	assign RD = IMmem[temp];//�������ݵ�ַȡ������
	
	initial begin
		IMmem[0] = {`INS, 3'b000, 4'b0011,4'b0000};		//����

		IMmem[1] = {`ADD_I,  3'b000, 4'b0001, 4'b1000};	//regData[1]=8
		IMmem[2] = {`SUB_I,	3'b000, 4'b0001, 4'b0001};	//regData[1]=7
		IMmem[3] = {`ADD_II, 3'b000, 4'b0001, 4'b0010};
		IMmem[4] = {`SUB_II, 3'b000, 4'b0001, 4'b0010};
		
		IMmem[5] = {`OR,  3'b000, 4'b0010, 4'b0001};		//regData[2]=7
		IMmem[6] = {`AND, 3'b000, 4'b0001, 4'b0010};		
		IMmem[7] = {`XOR, 3'b000, 4'b0010, 4'b0001};		//regData[2]=0
		
		IMmem[8] = {`MOV,3'b000, 4'b0010, 4'b0010};		//regData[2]=2
		
		IMmem[9 ] = {`SLL, 3'b000, 4'b0001, 4'b0010}; 	//regData[1]=28
		IMmem[10] = {`SRL, 3'b000, 4'b0001, 4'b0010};	//regData[1]=7
		IMmem[11] = {`SLA, 3'b000, 4'b0001, 4'b0010};	//regData[1]=28
		IMmem[12] = {`SRA, 3'b000, 4'b0001, 4'b0010};	//regData[1]=7
		IMmem[13] = {`ADD, 3'b000, 4'b0001, 4'b0010};	//regData[1]=9
		IMmem[14] = {`ADDC,3'b000, 4'b0001, 4'b0010};	//regData[1]=11
		IMmem[15] = {`SUB, 3'b000, 4'b0001, 4'b0010};	//regData[1]=9
		IMmem[16] = {`SUBC,3'b000, 4'b0001, 4'b0010};	//regData[1]=7

		IMmem[17] = {`CMP, 	3'b000, 4'b0001, 4'b0010};	
		IMmem[18] = {`MOV, 	3'b000, 4'b0001, 4'b0010};	//regData[1]=2
		IMmem[19] = {`JUMP, 	3'b000, 8'b00010101};		//����21��ָ��
		IMmem[20] = {`MOV, 	3'b000, 4'b0001, 4'b0011}; //���ִ��,regData[1]=3
		IMmem[21] = {`DES, 	3'b000, 4'b0011, 4'b0000}; //�Լ�
	end
	
	always@(negedge CLK) 
		begin
			temp <= A;
	end
	
endmodule
