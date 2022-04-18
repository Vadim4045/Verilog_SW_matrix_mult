module RES_SHOW #(parameter BITS=8, N=8, WIDTH=4, ADDR_WIDTH=10, OFFCET=0)
						(input[ADDR_WIDTH-1:0]addr,
						input [N*N*BITS-1:0] all,
						output [WIDTH*BITS-1:0]out,
						output show);
						
						
wire [ADDR_WIDTH-1:0] out_addr;
wire [N*N/WIDTH-1:0][WIDTH*BITS-1:0] to_out;

assign out_addr = addr-OFFCET;


always @(*)
begin

	if((addr >= OFFCET) & (addr < OFFCET + N*N*BITS/8)) begin
		
		out = to_out[out_addr>>2];
		
		show=1'b1;
			
	end else begin
	
		out = 'h0;
		show = 1'b0;
		
	end

end



genvar k;

generate

	for(k=0;k<N*N/WIDTH;k=k+1) begin: k_loop
		
		assign to_out[k] = all[WIDTH*BITS*(k+1)-1:WIDTH*BITS*k];
	
	end

endgenerate
endmodule
						
