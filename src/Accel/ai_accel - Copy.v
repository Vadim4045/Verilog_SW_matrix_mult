`timescale 1ns/1ps

// Module Declaration
module ai_accel
(
        rst_n		,  // Reset Neg
        clk,             // Clk
        addr		,  // Address
		  wr_en,		//Write enable
		  accel_select,
		  data_in,
        data_out,	   // Output Data
		  a_mem,
		  b_mem,
		  c_mem,
		  a_show,
		  b_show,
		  c_show
    );
	 
	 localparam N=8;
	 localparam BITS=8;
	 
	 localparam a_offcet = 10'd128;
	 localparam b_offcet = a_offcet + 10'd64;
	 localparam c_offcet = b_offcet + 10'd64;
	 
	 input rst_n;
	 input clk;
	 input [9:0] addr;
	 input wr_en;
	 input accel_select;
	 input [31:0] data_in;
	 output [31:0] data_out;
	 output a_mem;
	 output b_mem;
	 output c_mem;
	 output a_show;
	 output b_show;
	 output c_show;
	 
	 
	 wire [N*N*BITS-1:0] a_all,b_all, c_all;
	 wire [31:0]a_in,b_in, a_out,b_out,c_out;
	 wire [9:0] a_addr,b_addr,c_addr;
	 wire a_wr,b_wr,c_wr,a_redy,b_redy;
	 
	 
	 assign a_wr = accel_select & (addr>=a_offcet) & (addr<b_offcet);
	 assign b_wr = accel_select & (addr>=b_offcet) & (addr<c_offcet);
	 assign c_wr = accel_select & (addr>=c_offcet) & (addr<c_offcet+N*BITS);
	 
	 assign a_addr = addr-a_offcet;
	 assign b_addr = addr-b_offcet;
	 assign c_addr = addr-c_offcet;
	 
	 assign data_out = wr_en? 31'h0 : a_wr? a_out: b_wr? b_out: c_wr? c_out:31'h0;
	 
	 
	one_matrix a_mat (.in(data_in), .addr(a_addr), .select(a_wr), .wr_one(wr_en), .clk(clk), .show(a_show),
							.rst(rst_n), .one_out(a_out), .mem_out(a_all), .one_stored(a_mem), .ready(a_redy));

	one_matrix b_mat (.in(data_in), .addr(a_addr), .select(b_wr), .wr_one(wr_en), .clk(clk), .show(b_show),
							.rst(rst_n), .one_out(b_out), .mem_out(b_all), .one_stored(b_mem), .ready(b_redy));
 
	one_matrix c_mat (.mem_in(c_all), .addr(c_addr), .select(c_wr), .wr_all(a_redy&b_redy), .clk(clk), .rst(rst_n),
							.one_out(c_out), .show(c_show));
 
 
	MAT_MULT #(.BITS(BITS), .N(N))(.A(a_all), .B(b_all), .C(c_all));
	 
endmodule
