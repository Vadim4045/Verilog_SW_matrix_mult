module MATRIX_MULTIPICATOR #(parameter BITS=8, N=8)
									(input [N*N*BITS-1:0] A,B,
									 output [N*N*BITS-1:0] C);
									 
									 
wire [N-1:0][N-1:0][BITS-1:0] a,b,c;

genvar i,j;

generate

	for(i=0;i<N;i=i+1) begin: i_loop
		for(j=0;j<N;j=j+1) begin: j_loop
			
			assign a[i][j] = A[(N*i+j+1)*BITS-1:(N*i+j)*BITS];
			assign b[i][j] = B[(N*i+j+1)*BITS-1:(N*i+j)*BITS];
			assign C[(N*i+j+1)*BITS-1:(N*i+j)*BITS] = c[i][j];
			
		end
	end

endgenerate								 
									 
									 
					 
									 
endmodule
