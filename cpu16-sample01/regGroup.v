module regGroup(clk,regwr,r_addrA,r_addrB,w_addr,result,rdA,rdB,i_d1,i_d2,rData1,rData2,rData3);
	input clk;
	input regwr;//1-д�����ݼĴ���from ALU
	input[15:0] result;//ALU������

	input[3:0] w_addr;	//д��ַ=A
	
	input[3:0] r_addrA;	//����ַ
	input[3:0] r_addrB;
	
	input[3:0] i_d1;		//������
	input[3:0] i_d2;
	
	output[15:0] rdA;
	output[15:0] rdB;
	output[15:0] rData1;
	output[15:0] rData2;
	output[15:0] rData3;
	
	reg[15:0] regData[15:0];
	reg[15:0] regComA,regComB;
	integer i;
	initial begin
		//��ʼ��16�����ݼĴ���Ϊ0,2��ͨ�üĴ���Ϊ0
		for(i=0;i<16;i=i+1)
			 regData[i]<=16'b0;
		
		regComA <= 16'b0;
		regComB <= 16'b0; 
	end
	
	assign rdA = regComA;
	assign rdB = regComB;
	assign rData1 = regData[1];//������,��ɾ
	assign rData2 = regData[2];
	assign rData3 = regData[3];

	always@(*)//(r_addrA or r_addrB or i_d1 or i_d2)
	//if(enable)
		begin
			if(i_d2 && !i_d1)begin
				regComA <= regData[r_addrA];
				regComB <= 16'b0;
				regComB[3:0] <= i_d2;
			end
			else if(i_d1 && i_d2)begin
				regComA <= 16'b0;
				regComB <= 16'b0;
				regComA[3:0] <= i_d1;
				regComB[3:0] <= i_d2;
			end
			else if(!i_d1 && !i_d2)begin
				regComA <= regData[r_addrA];
				regComB <= regData[r_addrB];
			end		
		end
	
	always@(posedge clk)
	//if(enable)
		begin
			if(regwr)
				regData[w_addr]<=result;
		end
			
endmodule
