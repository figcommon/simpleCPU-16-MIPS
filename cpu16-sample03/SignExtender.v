//8λ������չ��16λ���߰�λ�÷���λ����
module SignExtender(
	input [7:0] A,
	output [15:0] B
);
	assign B = {{8{A[7]}},A};
	
endmodule