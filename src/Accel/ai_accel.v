`timescale 1ns/1ps

// Module Declaration
module ai_accel #(parameter BITS=8, N=8, WIDTH=4, OFFCET=10'd128)
(
        rst_n		,  // Reset Neg
        clk,             // Clk
        addr		,  // Address
		  wr_en,		//Write enable
		  accel_select,
		  data_in,
        data_out,	   // Output Data
		  b_stored,
		  c_stored,
		  b_ready,
		  c_ready,
		  c_show
    );
	 
	 
	 localparam a_offcet = OFFCET;
	 localparam b_offcet = a_offcet + 10'd64;
	 localparam addr_width = log2(N*N/WIDTH);
	 
	 input rst_n;
	 input clk;
	 input [9:0] addr;
	 input wr_en;
	 input accel_select;
	 input [31:0] data_in;
	 output [31:0] data_out;
	 output b_stored;
	 output c_stored;
	 output b_ready;
	 output c_ready;
	 output c_show;

	 
	 wire [WIDTH*BITS-1:0][N/WIDTH-1:0] to_c ;
	 wire [BITS*WIDTH-1:0][N*N/WIDTH-1:0] from_b ;
	 wire [addr_width-1:0] c_addr;
	 
	 
	IN_MATRIX #(.BITS(BITS), .N(N), .WIDTH(WIDTH), .OFFCET(a_offcet))
					( .addr(addr), .in_addr(c_addr));
 
	IN_MATRIX #(.BITS(BITS), .N(N), .WIDTH(WIDTH), .OFFCET(b_offcet))
					(.in(data_in), .addr(addr), .rst(rst_n), .clk(clk), .wr_en(wr_en), .out_all(from_b), .stored(b_stored), .ready(b_ready));
 
	PART_MULT #(.BITS(BITS), .N(N), .WIDTH(WIDTH))
						(.a_in(data_in), .b_in(from_b), .b_ready(b_redy), .in_addr(c_addr), .out(to_c));
	
	
	OUT_MATRIX #(.BITS(BITS), .N(N), .WIDTH(WIDTH), .OFFCET(a_offcet))
					(.in(to_c), .addr(addr), .rst(rst_n), .clk(clk), .wr_en(wr_en), .out(data_out), .stored(c_stored), .ready(c_ready), .show(c_show));
	 
endmodule

