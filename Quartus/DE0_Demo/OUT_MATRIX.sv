module OUT_MATRIX #(parameter BITS=8, N=8, WIDTH=4, OFFCET=0)
						(input [N-1:0][BITS-1:0] in ,
						input[9:0]addr,
						input rst,clk,wr_en,
						output [N-1:0][N-1:0][BITS-1:0] all,
						output stored);
						



wire [9:0] in_addr;

wire select = (addr >= OFFCET) & (addr < OFFCET + N*N*BITS/8);




assign in_addr = addr-OFFCET;





always @(negedge clk or negedge rst)
begin

	integer i,j;

	if(~rst) begin
		
		for(j=0;j<N;j=j+1) begin
		
			for(i=0;i<N;i=i+1) begin
		
				all[j][i] = 'h0;
			
			end	
		end
		
	end else if(select & wr_en) begin
			
		
				for(j=0;j<N;j=j+1) begin
				
					all[in_addr/N][j] = all[in_addr/N][j] + in[j];
					
				end
					
				stored = 1'b1;
		
	end else begin
		
			stored = 1'b0;
		
	end

end
						
endmodule

