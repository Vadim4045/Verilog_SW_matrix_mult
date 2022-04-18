module MULT #(parameter BITS=8, N=8)
				(input [32:0] from_a,
				 input [N*N*BITS-1:0] from_b,
				 input map,
				 output reg [32:0] to_c);

wire [32:0]b;

genvar i,j;

generate

	for(i=0;i<N/2;i=i+1) begin: i_loop	

		wire [BITS-1:0] tmp [0:N/2];
		
		for(j=0;j<N/2;j=j+1) begin: j_loop
		
			wire [32:0] b;
			assign b = from_b>>(BITS*(j*N+i)+map*N*BITS/2);
	
			assign tmp[j+1] = tmp[j] + from_a[BITS*(j+1)-1:BITS*j]*b;	
		end
		
		assign to_c [BITS*(i+1)-1:BITS*i] = tmp[N/2];
		
	end

endgenerate
				
endmodule
