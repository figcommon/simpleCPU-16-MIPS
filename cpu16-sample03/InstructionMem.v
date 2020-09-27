`include"headfile.v"
module InstructionMem(
	input [4:0] instruction_adr,
	output reg [15:0] instruction
    );
	
	reg [15:0] Mem [31:0];
	always @(*)begin
	 instruction <= Mem[instruction_adr];end
	
	initial begin
		Mem[0] = {`move, `r1, `r2, 5'b00001};//10  r1=rs,r2=rd=1000; zhen move//reg [0]=0010
		Mem[1] = {`store, 3'b010, `r1, 5'b00000};//11 ===store//[3'b010]=0100
		Mem[2] = {`load, 3'b011, `r1, 5'b00000};//100 ===load//[3'b011]=0000
		Mem[3] = {`add, `r1, `r2, 5'b00000};//101////r1=0000	r2=1000		1000
		Mem[4] = {`sub, `r1, `r2, 5'b00000};//111
		Mem[5] = {`OR,  `r1, `r2, 5'b00000};//1101
		Mem[6] = {`AND, `r1, `r2, 5'b00000};//1111
		Mem[7] = {`XOR, `r1, `r2, 5'b00000}; //10000
		Mem[8] = {`NOT, `r1,  8'b00000000};//01110
		Mem[9] = {`ror, `r1,  8'b00000000};//1001
		Mem[10] = {`rol, `r1,  8'b00000000};//1010
		Mem[11] = {`sal, `r1,  8'b00000000};//1100
		Mem[12] = {`sar, `r1,  8'b00000000};//1011
		Mem[13] = {`nop, 11'b00000000000};//00000
		Mem[14] = {`subi, `r1, `immediate1}; //01000		//immediate1=8'b00000001
		Mem[15] = {`cmp1, `r1,`r2, 5'b00000};//10100
		Mem[16] = {`cmp2,`r1,`r2,`dataram,2'b00};//10101
		Mem[17] = {`NXOR, `r1, `r2,5'b00000 };//10001
		Mem[18] = {`addi,`r1,`r2,`dataram,2'b00};//10011		//dataram=3'b000
		Mem[19] = {`jump, `jump_adr,6'b000000};//10010//jump_adr=5'b00010
	end

endmodule

