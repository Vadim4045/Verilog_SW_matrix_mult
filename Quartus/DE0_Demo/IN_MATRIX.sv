module IN_MATRIX #(parameter BITS=8, N=8, WIDTH=4, ADDR_WIDTH=10, OFFCET=0)
						(input [WIDTH*BITS-1:0] in,
						input [ADDR_WIDTH-1:0]addr,
						input rst,clk,wr_en,
						output reg [N*N*BITS-1:0] out_all ,
						output stored);
						


wire [ADDR_WIDTH-1:0] in_addr;

reg  [N*N/WIDTH-1:0][WIDTH*BITS-1:0] all;

assign in_addr = addr-OFFCET;



always @(negedge clk or negedge rst)
begin

	if(~rst) begin
	
			all = 'h0;
		
	end else begin
		
		if((addr >= OFFCET) & (addr < OFFCET + N*N*BITS/8) & wr_en) begin
			
			all[in_addr>>2] = in;
	
			stored = 1'b1;
		
		end else stored = 1'b0;
		
	end

end


genvar k;

generate

	for(k=0;k<N*N/WIDTH;k=k+1) begin: k_loop
		
		assign out_all[WIDTH*BITS*(k+1)-1:WIDTH*BITS*k] = all[k];
	
	end

endgenerate
						
endmodule
