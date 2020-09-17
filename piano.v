`timescale 1 ns / 1 ps 

module piano (input wire clk,  input wire hush,  input wire [3:0] note,  output wire speaker ); 
 wire clk;
 wire hush;
 wire [3:0]note;
 wire speaker;
 reg [17:0] counter;
 reg [17:0] tune ;
 reg a;
 reg out;
 
 assign speaker = a;
 
 always @ (posedge clk)
    begin
        counter <= counter+1;
		  if (counter == tune)
		      begin
		      counter <= 0;
		      out <= !out;
		      end
	end

 always@ (*)
	begin
		case (note)
		
			4'b0000: tune = 113635;
			4'b0001: tune = 107257;
			4'b0010: tune = 101237;
			4'b0011: tune = 95555;
			4'b0100: tune = 90192;
			4'b0101: tune = 85130;
			4'b0110: tune = 80352;
			4'b0111: tune = 75842;
			4'b1000: tune = 71585;
			4'b1001: tune = 67568;
			4'b1010: tune = 63775;
			4'b1011: tune = 60196;
			4'b1100: tune = 56817;
			4'b1101: tune = 53628;
			4'b1110: tune = 50618;
			4'b1111: tune = 47777;
		endcase
	end

always@ (*)
	begin
		if (!hush)
			a = out;
		else
			a = 0;
	end
	
 endmodule
