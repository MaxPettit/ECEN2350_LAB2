module month_day(
		 input [6:0]  count,
		 input 	      leap_year,

		 output [7:0] HEX0,
		 output [7:0] HEX1,
		 output [7:0] HEX2
		 );

   reg [4:0] 		      day_tmp;
   reg [3:0] 		      month_tmp;

   wire [4:0] 		      day;
   wire [3:0] 		      month;
   

   always @(count)
     begin
	
	if(count >= 91 + leap_year)
	  begin
	     month_tmp <= 4;
	     day_tmp <= count - (90 + leap_year);
	  end
	
	else if(count >= (60 + leap_year))
	  begin
	     month_tmp <= 3;
	     day_tmp <= count - (59 + leap_year);
	  end
	
	else if(count >= 32)
	  begin
	     month_tmp <= 2;
	     day_tmp <= count - 31;
	  end
	
	else
	  begin
	     month_tmp <= 1;
	     day_tmp <= count;
	  end
	
     end

   assign month = month_tmp;
   assign day = day_tmp;

    day_drive DD (
		 .day(day),
		 .HEX0(HEX0),
		 .HEX1(HEX1)
		 );


    hex_driver X2 (
		  .NUM(month),
		  .HEX(HEX2)
		  );
   
   
endmodule // month_day


   
