`timescale 1ns/1ps

module ai_accel #(parameter BITS=8, N=8, WIDTH=4, ADDR_WIDTH=10, OFFCET=10'd128)
					(input rst_n,
					 input clk,
					 input [ADDR_WIDTH-1:0] addr,
					 input wr_en,
					 input [WIDTH*BITS-1:0] data_in,
					 output [WIDTH*BITS-1:0] data_out,
					 output a_stored,
					 output b_stored,
					 output c_show);
	 
	 
 localparam [ADDR_WIDTH-1:0]a_offcet = OFFCET;
 localparam [ADDR_WIDTH-1:0]b_offcet = a_offcet + N*N*BITS/8;
 localparam [ADDR_WIDTH-1:0]c_offcet = b_offcet + N*N*BITS/8;
	 
 wire [N*N*BITS-1:0] from_a, from_b, from_c ;
 
	 
 
	IN_MATRIX #(.BITS(BITS), .N(N), .WIDTH(WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .OFFCET(a_offcet)) A_matrix
					(.in(data_in),
					.addr(addr),
					.rst(rst_n),
					.clk(clk),
					.wr_en(wr_en),
					.out_all(from_a),
					.stored(a_stored));

	IN_MATRIX #(.BITS(BITS), .N(N), .WIDTH(WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .OFFCET(b_offcet)) B_matrix
					(.in(data_in),
					.addr(addr),
					.rst(rst_n),
					.clk(clk),
					.wr_en(wr_en),
					.out_all(from_b),
					.stored(b_stored));

	MAT_MULT #(.BITS(BITS), .N(N)) Winograd_module
						(.A(from_a),
						 .B(from_b),
						 .C(from_c));
					
					
	RES_SHOW #(.BITS(BITS), .N(N), .WIDTH(WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .OFFCET(c_offcet)) RES_module
						(.addr(addr),
						.all(from_c),
						.out(data_out),
						.show(c_show));
	 
endmodule

