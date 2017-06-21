package Bp;

interface BranchPredictor;
	method Bit#(1) get_prediction;
	method Action set_result(Bit#(1) result);
endinterface

module mkBp(BranchPredictor);
	Reg#(Bit#(2)) state <- mkReg(0);
	Reg#(Bit#(1)) taken <- mkReg(0);
	Reg#(Bit#(1)) transfer <- mkReg(0);

	rule rule1 (transfer == 1 && state == 'b11);
		if ( taken == 1)
			state <= 'b11;
		else
			// fill in code here	
	    state <= 'b10;	
    transfer <= 0;
	endrule

	rule rule2 (transfer == 1 && state == 'b10);
		if ( taken == 1)
			// fill in code here
      state <= 'b11;
		else 
			// fill in code here
      state <= 'b01;
		transfer <= 0;
	endrule

	rule rule3 (transfer == 1 && state == 'b01);
		if (taken ==1)
			// fill in code here
      state <= 'b10;
		else
			// fill in code here
      state <= 'b00;	
		transfer <= 0;
	endrule

	rule rule4 (transfer == 1 && state == 'b00);
		if (taken ==1)
			// fill in code here
      state <= 'b01;
		else
			// fill in code here
      state <= 'b00;
		transfer <= 0;
	endrule

	method Action set_result(Bit#(1) result) if (transfer == 0);
		transfer <= 1;
		taken <= result;
	endmethod

	method Bit#(1) get_prediction;
		// change the return value here
		return state[1];
	endmethod
endmodule

endpackage
