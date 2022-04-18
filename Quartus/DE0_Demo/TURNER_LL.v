module TURNER_LL #(parameter BITS=4)(input [BITS-1:0]IN,input Com,
						output [BITS-1:0]OUT);
					 
wire [BITS-1:0]bus_in, bus_out;

assign bus_in = ~IN;

ADDER_LL_CLA #(.BITS(BITS))(.A(bus_in), .B(1'b1), .S(bus_out));

assign OUT = Com? bus_out:IN;	
assign Min = IN[BITS-1]&bus_out[BITS-1];
assign Zero	= ~IN[BITS-1]&~bus_out[BITS-1];			 
						 
endmodule
