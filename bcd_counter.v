module bcd_counter(
		   input 	src_clk,
		   input 	reset_n,
		   output [3:0] msd_out,
		   output [6:0] cnt_out,
		   output [3:0] lsd_out
		   );
   
   reg [3:0] 			msd_tmp;
   reg [3:0] 			lsd_tmp;

   
   always @(posedge src_clk or negedge reset_n)
     begin
	
	if(reset_n == 0)
	  begin
	     lsd_tmp <= 1;
	     msd_tmp <= 0;
	  end
	else if(lsd_tmp != 9)
	  lsd_tmp <= lsd_tmp + 1;
	else
	  begin
	     if(msd_tmp != 9)
	       begin
		  lsd_tmp <= 0;
		  msd_tmp <= msd_tmp + 1;
	       end
	     else
	       begin
	    	  lsd_tmp <= 1;
		     msd_tmp <= 0;
	       end
	  end
	
     end // always @ (posedge clock or negedge reset_n)


   assign lsd_out = lsd_tmp;
   assign msd_out = msd_tmp;
   
   assign cnt_out = (msd_tmp*10) + ({3'b0, lsd_tmp});
   
   
endmodule // lcd_outer_lsd
