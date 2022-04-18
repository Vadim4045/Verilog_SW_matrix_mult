module PART_MULT #(parameter BITS=8, N=8, WIDTH=4, OFFCET=0)
						(input [WIDTH-1:0][BITS-1:0] a_in,
						 input [N-1:0][N-1:0][BITS-1:0] b_in,
						 input clk,
						 input[9:0]addr,
						 output [N-1:0][BITS-1:0] out,
						 output c_wr);
						
						

integer i,j;


wire [9:0] in_addr;	
wire [WIDTH:0][N-1:0][BITS-1:0] tmp;			
						
assign in_addr = addr - OFFCET;
assign out = tmp[WIDTH];

always @(negedge clk)
begin
	
	if((addr >= OFFCET) && (addr < OFFCET + N*N*BITS/8))
	begin
	
		for(j=0;j<WIDTH;j=j+1) begin: j_loop
		
			for(i=0;i<N;i=i+1) begin: i_loop
			
				tmp[j+1][i] = tmp[j][i] + a_in[j]*b_in[WIDTH*(in_addr%N)+j][i];
			
			end
		
		end
		
		c_wr = 1'b1;
		
	end else begin
	
		tmp[WIDTH] = 'h0;
		
		c_wr = 1'b0;
	end	

end
		
						
endmodule
						