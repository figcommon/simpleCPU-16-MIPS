/*module DataMem(
	input wrenable,
	input [2:0] dataadr,
	input [15:0] writedata,
	output [15:0] readdata
    );

	reg [15:0] Dmem [7:0];
	reg Wrenable;
	reg [2:0] Dataadr; 
	reg [15:0] Writedata;
	
	initial begin//��ʼ��
		Wrenable = 1'b0;
		Dmem[0] = 16'b0000000000000000;
		Dmem[1] = 16'b0000000000000000;
		Dmem[2] = 16'b0000000000000000;
		Dmem[3] = 16'b0000000000000000;
		Dmem[4] = 16'b0000000000000000;
		Dmem[5] = 16'b0000000000000000;
		Dmem[6] = 16'b0000000000000000;
		Dmem[7] = 16'b0000000000000000;
	end
	
	always@(*)
	begin
		Wrenable <= wrenable;
		Dataadr <= dataadr;
		Writedata <= writedata;
	end
	
	always@(*)//����Dataadr
	begin
		if(Wrenable)
			Dmem[Dataadr] <= Writedata;
	end
	//���ݵ�ַ
	assign readdata = Dmem[Dataadr];

	//д����ֻ����wrenableʹ��ʱ����д��������ÿһ�������ض�����һ�ζ�
endmodule*/

module DataMem(
	input clk,
	input wrenable,
	input [2:0] dataadr,
	input [15:0] writedata,
	output [15:0] readdata
    );
	
	reg Wrenable1;
	reg [2:0] Dataadr; 
	reg [15:0] Writedata;
	
	integer i;
	reg [15:0] mem[0:7];

	initial begin//��ʼ��
		Wrenable1 = 1'b0;
		mem[0] = 16'b0000000000000001;//1
		mem[1] = 16'b0000000000000010;//2
		mem[2] = 16'b0000000000000100;//4
		mem[3] = 16'b0000000000000000;
		mem[4] = 16'b0000000000000000;
		mem[5] = 16'b0000000000000000;
		mem[6] = 16'b0000000000000000;
		mem[7] = 16'b0000000000000000;
	end
	
	
	always@(negedge clk)
	begin
		Wrenable1 <= wrenable;
		Dataadr <= dataadr;
		Writedata <= writedata;
	end
	
	always@(*)//����Dataadr
	begin
		if(Wrenable1)
			mem[Dataadr] <= Writedata;
	end
	//���ݵ�ַ
	assign readdata = mem[Dataadr];

	//д����ֻ����wrenableʹ��ʱ����д��������ÿһ�������ض�����һ�ζ�
endmodule