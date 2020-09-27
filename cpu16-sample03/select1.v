module select1(
input [1:0]alusrc,
input [15:0]rg,
input [15:0]data,
input [15:0]immediate,
output reg[15:0] r2
);
   always@(*)
   begin 
	if(alusrc == 2'b00)
		 r2 = 0;
	else if(alusrc == 2'b01)
		 r2 = rg;
	else if(alusrc == 2'b10)
		 r2 = data;
	else
		 r2 = immediate;
	end
	
endmodule