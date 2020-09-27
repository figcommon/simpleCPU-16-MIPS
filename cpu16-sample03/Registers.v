module Registers(  //��д��ʹ�ܶ�Ϊ1ʱ����д��Ĵ�����ַ����д�롣��ÿ��ʱ��������readdata������ж�ȡ�����и���
	input clk,
	input [2:0] read_adr1,
	input [2:0] read_adr2,
	input [2:0] write_adr1,
	input [15:0] writedata1,
	input wrenable,
	output [15:0] readdata1,
	output [15:0] readdata2
    );
    
	reg [15:0] Regsmem [0:7];
	reg Wrenable;
	reg [2:0] Write_adr1;
	reg [15:0] Writedata1;
		initial begin//��ʼ��8��ͨ�üĴ���
		Wrenable = 1'b0;
		Regsmem[0] = 16'b0000000000000010;
		Regsmem[1] = 16'b0000000000001000;//8
		Regsmem[2] = 16'b0000000000000000;
		Regsmem[3] = 16'b0000000000000000;
		Regsmem[4] = 16'b0000000000000000;
		Regsmem[5] = 16'b0000000000000000;
		Regsmem[6] = 16'b0000000000000000;
		Regsmem[7] = 16'b0000000000000000;
	end
	
	always@(posedge clk)
	begin
		Wrenable <= wrenable;
		Write_adr1 <= write_adr1;
		Writedata1 <= writedata1;
	end
	
	always@(*)
	begin
		if(Wrenable)
			Regsmem[Write_adr1] <= Writedata1;
	end
	
	assign readdata1 = Regsmem[read_adr1];
	assign readdata2 = Regsmem[read_adr2];
	
	
endmodule