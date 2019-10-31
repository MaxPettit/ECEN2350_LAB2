module clock_div_2hz(
		     input  src_clk,
		     input reset_n,
		     output out_clk
);

   parameter divide_by = 2_000_000;
	
   reg [23:0] 		    divide_counter = 0;
   reg 			    tmp_clk = 0;
   
   always @(posedge src_clk or negedge reset_n)
     begin
	if (reset_n == 0)
	  begin
	     tmp_clk <= 0;
	     divide_counter <= 0;
	  end
	
	else if(divide_counter == divide_by - 1)
	  begin
	     divide_counter <= 0;
	     tmp_clk <= ~tmp_clk;
	  end
	else
	  divide_counter <= divide_counter + 1;
     end

   assign out_clk = tmp_clk;
   
   
endmodule // clock_div_1hz

