module bcd_counter(
		       input 	    src_clk,
		       input 	    reset_n,
		       output [3:0] msd_out,
		       output [7:0] cnt_out,
		       output [3:0] lsd_out
		       );
				 
	reg [7:0]				cnt_tmp;

	
	 always @(posedge src_clk or negedge reset_n)
     begin
	  
	if(reset_n == 0)
	cnt_tmp <= 1;
	else if(cnt_tmp != 99)
	  cnt_tmp <= cnt_tmp + 1;
	else
	cnt_tmp <= 1;
   end // always @ (posedge clock or negedge reset_n)


   assign lsd_out = cnt_tmp % 10;
	assign msd_out = cnt_tmp / 10;
	assign cnt_out = cnt_tmp;
   
   
endmodule // lcd_outer_lsd
