module MAT_MULT #(parameter BITS=8, N=4)
						(input [N*N*BITS-1:0] A,B,
						output [N*N*BITS-1:0] C);


						
	genvar i,j,k,l;					
							
	generate	

		wire [3:0][N*N*BITS/4-1:0] a,b,c;

		for(k=0;k<2;k=k+1) begin: k_loop
		
			for(l=0;l<2;l=l+1) begin: l_loop
			
				for(i=0;i<N/2;i=i+1) begin: i_loop
				
					for(j=0;j<N/2;j=j+1) begin: j_loop
					
						assign a[2*k+l][BITS*(i*N/2+j+1)-1:BITS*(i*N/2+j)] = A[BITS*(N*(N*k+l)/2+i*N+j+1)-1:BITS*(N*(N*k+l)/2+i*N+j)];
						
						assign b[2*k+l][BITS*(i*N/2+j+1)-1:BITS*(i*N/2+j)] = B[BITS*(N*(N*k+l)/2+i*N+j+1)-1:BITS*(N*(N*k+l)/2+i*N+j)];
						
						assign C[BITS*(N*(N*k+l)/2+i*N+j+1)-1:BITS*(N*(N*k+l)/2+i*N+j)] = c[2*k+l][BITS*(i*N/2+j+1)-1:BITS*(i*N/2+j)];
						
					end
					
				end
				
			end
			
		end

		if(N==2) begin
			
			assign c[0] = a[0]*b[0]+a[1]*b[2];
			assign c[1] = a[0]*b[1]+a[1]*b[3];
			assign c[2] = a[2]*b[0]+a[3]*b[2];
			assign c[3] = a[2]*b[1]+a[3]*b[3];

		end else begin
				
			wire [N*N*BITS/4-1:0] s1,s2,s3,s4,s5,s6,s7,s8,p1,p2,p3,p4,p5,p6,p7,t1,t2,t3;
				
			MAT_PLUS #(.BITS(BITS), .N(N/2)) S1 (.A(a[2]), .B(a[3]), .C(s1));
			MAT_MINUS #(.BITS(BITS), .N(N/2)) S2 (.A(s1), .B(a[0]), .C(s2));
			MAT_MINUS #(.BITS(BITS), .N(N/2)) S3 (.A(a[0]), .B(a[2]), .C(s3));
			MAT_MINUS #(.BITS(BITS), .N(N/2)) S4 (.A(a[1]), .B(s2), .C(s4));
			MAT_MINUS #(.BITS(BITS), .N(N/2)) S5 (.A(b[1]), .B(b[0]), .C(s5));
			MAT_MINUS #(.BITS(BITS), .N(N/2)) S6 (.A(b[3]), .B(s5), .C(s6));
			MAT_MINUS #(.BITS(BITS), .N(N/2)) S7 (.A(b[3]), .B(b[1]), .C(s7));
			MAT_MINUS #(.BITS(BITS), .N(N/2)) S8 (.A(s6), .B(b[2]), .C(s8));
			
			MAT_MULT #(.BITS(BITS), .N(N/2)) P1 (.A(s2), .B(s6), .C(p1));
			MAT_MULT #(.BITS(BITS), .N(N/2)) P2 (.A(a[0]), .B(b[0]), .C(p2));
			MAT_MULT #(.BITS(BITS), .N(N/2)) P3 (.A(a[1]), .B(b[2]), .C(p3));
			MAT_MULT #(.BITS(BITS), .N(N/2)) P4 (.A(s3), .B(s7), .C(p4));
			MAT_MULT #(.BITS(BITS), .N(N/2)) P5 (.A(s1), .B(s5), .C(p5));
			MAT_MULT #(.BITS(BITS), .N(N/2)) P6 (.A(s4), .B(b[3]), .C(p6));
			MAT_MULT #(.BITS(BITS), .N(N/2)) P7 (.A(a[3]), .B(s8), .C(p7));
			
			MAT_PLUS #(.BITS(BITS), .N(N/2)) T1 (.A(p1), .B(p2), .C(t1));
			MAT_PLUS #(.BITS(BITS), .N(N/2)) T2 (.A(t1), .B(p4), .C(t2));
			MAT_PLUS #(.BITS(BITS), .N(N/2)) T3 (.A(p5), .B(p6), .C(t3));
			
			MAT_PLUS #(.BITS(BITS), .N(N/2)) C1 (.A(p2), .B(p3), .C(c[0]));
			MAT_PLUS #(.BITS(BITS), .N(N/2)) C2 (.A(t1), .B(t3), .C(c[1]));
			MAT_MINUS #(.BITS(BITS), .N(N/2)) C3 (.A(t2), .B(p7), .C(c[2]));
			MAT_PLUS #(.BITS(BITS), .N(N/2)) C4 (.A(t2), .B(p5), .C(c[3]));
				
		end	
			
	endgenerate	
		
endmodule
