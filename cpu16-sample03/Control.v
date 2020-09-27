`include"headfile.v"
	module Control(
	input [15:0] instruction ,
	output reg[4:0] Op,//5
	output reg[1:0] alusrc,//2
	output reg[4:0] jump_adr,//5
	output reg re,
	output reg de,
	output reg [2:0] rd_adr,//3
	output reg [2:0] rs_adr,//3
	output reg [2:0] adrD,
	output reg [7:0] immediate,
	output reg normal
);
	
 
	
	always@(*)
	begin
		Op <= instruction[15:11];
		rs_adr = 3'b000;
		rd_adr = 3'b001;
		re = 0;
		de = 0;
		adrD = 3'b000;
		immediate = 8'b00000000;
		alusrc = 2'b00;
		normal = 0;
		if(Op == `move)begin		//¼Ä´æÆ÷¼ä¸´ÖÆ   r1=rs,r2=rd
			rs_adr <= instruction[7:5];//reg[0]=0010
			rd_adr <= instruction[10:8];//reg[1]=1000
			re = 1;
			de = 0;
			alusrc = 2'b01;end
			
		if(Op == `store)begin		//¼Ä´æÆ÷Ğ´µ½´æ´¢Æ÷		
			adrD <= instruction[10:8];
			rs_adr <= instruction[7:5];
			re = 0;
			de = 1;
			alusrc = 2'b01;end
			
		if(Op == `load)begin		//´æ´¢Æ÷¶Áµ½¼Ä´æÆ÷
			adrD <= instruction[10:8];
			rd_adr <= instruction[7:5];
			re = 1;
			de = 0;
			alusrc = 2'b10;end
			
///////////////alogrithm////////////////////			
		if(Op == `add)begin
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[10:8];
			re = 1;
			de = 0;
			alusrc = 2'b01;end
			
		if(Op == `sub)begin
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[10:8];
			re = 1;
			de = 0;
			alusrc = 2'b01;end
		if(Op == `OR)begin
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[10:8];
			re = 1;
			de = 0;
			alusrc = 2'b01;end
		if(Op == `AND)begin
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[10:8];
			re = 1;
			de = 0;
			alusrc = 2'b01;end
		if(Op == `XOR)begin
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[10:8];
			re = 1;
			de = 0;
			alusrc = 2'b01;end
		if(Op == `NOT)begin
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[7:5];
			re = 1;
			de = 0;
			alusrc = 2'b01;end
//////////////////logic////////////////////////////			
		if(Op == `ror)begin
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[7:5];
			re = 1;
			de = 0;end
		if(Op == `rol)begin
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[7:5];
			re = 1;
			de = 0;end
		if(Op == `sal)begin
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[7:5];
			re = 1;
			de = 0;end
		if(Op == `sar)begin
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[7:5];
			re = 1;
			de = 0;end

/////////////////////////////////////////////////			
		if(Op == `nop)begin			//nop
			re = 0;
			de = 0;end		
		if(Op == `jump)begin		//ÎŞÌõ¼şÌø×ª
		    jump_adr <= instruction[10:6];
		    normal = 1;end
		if(Op == `cmp1)begin		//½á¹ûĞ´»Ø¼Ä´æÆ÷
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[10:8];
			re = 1;
			de = 0;
			alusrc = 2'b01;end
		if(Op == `cmp2)begin		//½á¹ûĞ´»Ø´æ´¢Æ÷
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[10:8];
			adrD <= instruction[4:2];
			re = 0;
			de = 1;
			alusrc = 2'b01;end
		if(Op == `NXOR)begin
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[10:8];
			re = 1;
			de = 0;
			alusrc = 2'b01;end
		if(Op == `addi)begin		//¼Ó·¨£¬½á¹ûĞ´»Ø´æ´¢Æ÷
			rs_adr <= instruction[7:5];
			rd_adr <= instruction[10:8];
			adrD <= instruction[4:2];
			re = 0;
			de = 1;
			alusrc = 2'b01;end
			
		if(Op == `subi)begin
			immediate <= instruction[7:0];
			rd_adr <= instruction[10:8];
			re = 1;
			de = 0;
			alusrc = 2'b11;end//imm  extend
			
			
	end
	
	endmodule
	