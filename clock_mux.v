module clock_mux ( 
		   input      a, 
                   input      b, 
                   input      sel,
                   output reg out
		   );         
   always @ (a or b or sel) begin
      casex (sel)
        1'b0 : out <= a;
        1'b1 : out <= b;
      endcase
   end
endmodule
