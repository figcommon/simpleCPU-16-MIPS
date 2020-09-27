//8位数据扩展成16位，高八位用符号位补齐
module SignExtender(
	input [7:0] A,
	output [15:0] B
);
	assign B = {{8{A[7]}},A};
	
endmodule