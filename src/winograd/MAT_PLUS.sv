module MAT_PLUS #(parameter BITS=8, N=8)
						(input [N*N*BITS-1:0] A,B,
						output [N*N*BITS-1:0] C);
						
genvar i;

generate
	for(i=0;i<N*N;i=i+1) begin: first_loop

		assign C[BITS*(i+1)-1:BITS*i] = A[BITS*(i+1)-1:BITS*i]+B[BITS*(i+1)-1:BITS*i];

	end
endgenerate						
endmodule
