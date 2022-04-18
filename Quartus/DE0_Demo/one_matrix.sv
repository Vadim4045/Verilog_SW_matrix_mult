module one_matrix (input [32-1:0] in,
						input [n*n*bits:0] mem_in,
						input [9:0] addr,
						input select,wr_one, wr_all, clk, rst,
						output reg [32-1:0] one_out,
						output [n*n*bits:0] mem_out,
						output one_stored,ready,show);
						
localparam n=8;
localparam bits=8;						

reg stored, show_reg;						
reg [n*n/(32/bits)-1:0]map;						
reg [2*n-1:0][32-1:0] mem;

assign ready = &map;
assign mem_out = mem;
assign one_stored = stored;
assign show = show_reg;

always @(posedge clk or negedge rst)
		if(~rst) begin
			stored <= 1'b0;
			mem <= 'h0;
			map <= 'h0;
		end
		else begin
			if(wr_all) begin
				
				mem <= mem_in;
				map <= ~('d0);
				stored <= 1'b1;
			
			end else if(~stored & select) begin
			
				mem[addr>>2] <= in;
			
				case (addr)
					10'd0: begin
					
						if(wr_one) begin
							mem[32-1:0] <= in;
							map[0] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[32-1:0];
							mem[32-1:0] <= mem[32-1:0];
							map[0] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end
							
					end
					10'd4: begin
					
						if(wr_one) begin
							mem[2*32-1:1*32] <= in;
							map[1] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[2*32-1:1*32];
							mem[2*32-1:1*32] <= mem[2*32-1:1*32];
							map[1] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end	
					end
					10'd8: begin
						if(wr_one) begin
							mem[3*32-1:2*32] <= in;
							map[2] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[3*32-1:2*32];
							mem[3*32-1:2*32] <= mem[3*32-1:2*32];
							map[2] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end		
					end
					10'd12: begin
						if(wr_one) begin
							mem[4*32-1:3*32] <= in;
							map[3] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[4*32-1:3*32];
							mem[4*32-1:3*32] <= mem[4*32-1:3*32];
							map[3] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end		
					end
					10'd16: begin
						if(wr_one) begin
							mem[5*32-1:4*32] <= in;
							map[4] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[5*32-1:4*32];
							mem[5*32-1:4*32] <= mem[5*32-1:4*32];
							map[4] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end		
					end
					10'd20: begin
						if(wr_one) begin
							mem[6*32-1:5*32] <= in;
							map[5] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[6*32-1:5*32];
							mem[6*32-1:5*32] <= mem[6*32-1:5*32];
							map[4] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end	
					end
					10'd24: begin
						if(wr_one) begin
							mem[7*32-1:6*32] <= in;
							map[6] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[7*32-1:6*32];
							mem[7*32-1:6*32] <= mem[7*32-1:6*32];
							map[6] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end		
					end
					10'd28: begin
						if(wr_one) begin
							mem[8*32-1:7*32] <= in;
							map[7] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[8*32-1:7*32];
							mem[8*32-1:7*32] <= mem[8*32-1:7*32];
							map[7] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end		
					end
					10'd32: begin
						if(wr_one) begin
							mem[9*32-1:8*32] <= in;
							map[8] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[9*32-1:8*32];
							mem[9*32-1:8*32] <= mem[9*32-1:8*32];
							map[8] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end		
					end
					10'd36: begin
						if(wr_one) begin
							mem[10*32-1:9*32] <= in;
							map[9] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[10*32-1:9*32];
							mem[10*32-1:9*32] <= mem[10*32-1:9*32];
							map[9] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end		
					end
					10'd40: begin
						if(wr_one) begin
							mem[11*32-1:10*32] <= in;
							map[10] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[11*32-1:10*32];
							mem[11*32-1:10*32] <= mem[11*32-1:10*32];
							map[10] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end		
					end
					10'd44: begin
						if(wr_one) begin
							mem[12*32-1:11*32] <= in;
							map[11] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[12*32-1:11*32];
							mem[12*32-1:11*32] <= mem[12*32-1:11*32];
							map[11] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end	
					end
					10'd48: begin
						if(wr_one) begin
							mem[13*32-1:12*32] <= in;
							map[12] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[13*32-1:12*32];
							mem[13*32-1:12*32] <= mem[13*32-1:12*32];
							map[12] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end	
					end
					10'd52: begin
						if(wr_one) begin
							mem[14*32-1:13*32] <= in;
							map[13] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[14*32-1:13*32];
							mem[14*32-1:13*32] <= mem[14*32-1:13*32];
							map[13] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end	
					end
					10'd56: begin
						if(wr_one) begin
							mem[15*32-1:14*32] <= in;
							map[14] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[15*32-1:14*32];
							mem[15*32-1:14*32] <= mem[15*32-1:14*32];
							map[14] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end	
					end
					10'd60: begin
						if(wr_one) begin
							mem[16*32-1:15*32] <= in;
							map[15] <= 1'b1;
							stored <= 1'b1;
							show_reg <= 1'b0;
						end else begin
							one_out = mem[16*32-1:15*32];
							mem[16*32-1:15*32] <= mem[16*32-1:15*32];
							map[15] <= 1'b0;
							stored <= 1'b0;
							show_reg <= 1'b1;
						end	
					end
				endcase	
			end
		end
						
						
endmodule
