`ifndef HEADFILE_H_

//State for CPU
`define	idle		1'b0
`define	exec		1'b1

//gr
`define gr0 3'b000
`define gr1 3'b001
`define gr2 3'b010
`define gr3 3'b011

`define  NOP		5'b00000 //无操作
`define  HALT		5'b00001 //终止程序

`define	AND		5'b01101	//与
`define 	OR    	5'b01110	//或
`define 	XOR   	5'b01111	//异或
`define	SLL		5'b00100	//逻辑左移
`define 	SRL   	5'b00110 //逻辑右移
`define	SLA		5'b00101 //算数左移
`define 	SRA   	5'b00111 //算数右移

`define  ADD		5'b01000 //加
`define	ADDC		5'b10001 //带进位的加
`define	SUB   	5'b01010 //减
`define 	SUBC  	5'b10010 //带借位的减

`define	ADD_I		5'b01001 //带一个立即数的加
`define 	SUB_I  	5'b01011 //带一个立即数的减
`define	ADD_II	5'b01001 //带两个立即数的加
`define 	SUB_II 	5'b01011 //带两个立即数的减

`define	CMP		5'b01100 //比较
`define	JUMP		5'b11000 //跳转
`define	MOV		5'b11111 //传送

`endif