`include"headfile.v"
	module alu(
	input [4:0]Op,
	input [15:0]r1,
	input [15:0]r2,
	output reg[15:0]a
	);
	always@(*)
	begin
	    if(Op == `move)//18
			a = r2;
		if(Op == `load)
			a = r1;
		if(Op == `store)
			a = r2;
		if(Op == `add)
			a = r1+r2;
		if(Op == `sub)
			a = r1-r2;
		if(Op == `OR)
			a = r1|r2;
		if(Op == `AND)
			a = r1&r2;
		if(Op == `XOR)
			a = r1^r2;
		if(Op == `NOT)
			a = ~r1;
		if(Op == `ror)
			a = r1>>1;
		if(Op == `rol)
			a = r1<<1;
		if(Op == `sal)
			a = r1>>>1;
		if(Op == `sar)
			a = r1<<<1;
		if(Op == `cmp1)
			a =(r1<r2)?r1:r2;
		if(Op == `cmp2)
			a =(r1<r2)?r1:r2;
		if(Op == `NXOR)
			a = ~(r1^r2);
		if(Op == `subi)
			a = r1-r2;
		if(Op == `addi)
			a = r1+r2;
	end
	
endmodule