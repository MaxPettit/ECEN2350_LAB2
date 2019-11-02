module latch_key(
		 input KEY,
   	 output   R
);
   reg 			     k = 0;
   

    always @(negedge KEY)
	   k = ~k;

   assign  R = k;

endmodule // latch_key

   
