module latch_key(
		 input KEY,
   		 output      R
);
   reg 			     k;
   

    always @(negedge KEY)
     begin
	  
	if(~KEY) begin
	   k = ~k;
	   
	end

     end

   assign  R = k;

endmodule // latch_key

   
