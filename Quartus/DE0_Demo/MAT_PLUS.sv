module MAT_PLUS #(parameter BITS=8, N=8)
						(input [N*N*BITS-1:0] A,B,
						output [N*N*BITS-1:0] C);
						
genvar i,j;

generate
	for(i=0;i<N;i=i+1) begin: first_loop
		for(j=0;j<N;j=j+1) begin: seconsd_loop
			assign C[BITS*(N*i+j+1)-1:BITS*(N*i+j)] = A[BITS*(N*i+j+1)-1:BITS*(N*i+j)]+B[BITS*(N*i+j+1)-1:BITS*(N*i+j)];
		end
	end
endgenerate						
endmodule
