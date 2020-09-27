 module Pc(clk,reset,pob,buscin,newadr);//pc=pc+1  or  pc=buscin

input clk;
input reset;
input pob;//0=pc or 1=bus
input [4:0] buscin;
output [4:0] newadr;

//reg [4:0] newadr;
reg [4:0] p;

initial 
    begin
    p = 0; 
    end


always @(posedge clk or posedge reset)
	begin
		if(reset == 1 )//重置
			begin
			p = 0;
			end
		else //no重置
			begin
			if(pob == 0)//pc+1
				p = p + 1;
			else
				//总线写入
				p = buscin;	
			end	
	end
	assign newadr = p;
endmodule


