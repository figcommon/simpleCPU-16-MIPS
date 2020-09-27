`ifndef HEADFILE_H_


`define  nop		5'b00000//
`define  halt		5'b00001

`define  move		5'b00010//7
`define  load		5'b00011
`define  store		5'b00100
`define  add		5'b00101

`define	 sub		5'b00111
`define	 subi		5'b01000

`define	 ror   		5'b01001//4
`define	 rol		5'b01010
`define	 sar		5'b01011
`define  sal		5'b01100


`define	 OR			5'b01101//5
`define	 NOT		5'b01110
`define	 AND		5'b01111
`define	 XOR		5'b10000
`define  NXOR       5'b10001

`define	 jump		5'b10010//2
`define  addi       5'b10011

`define	 cmp1   	5'b10100//2
`define  cmp2 		5'b10101

`define r1 3'b000
`define r2 3'b001
`define r3 3'b010
`define r4 3'b011

`define jump_adr  5'b00010
`define dataram  3'b000
`define immediate1 8'b00000001

`endif