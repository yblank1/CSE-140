package Tb;
import Bp::*;

(* synthesize *)
module mkTb();
	Reg#(Bool) started <- mkReg(False);
	Reg#(int) programCount <- mkReg(0);
	//Reg#(Bit#(1)) to_take <- mkReg(0);	
	Reg#(int) correct <- mkReg(0);
	Reg#(int) total <- mkReg(0);
	BranchPredictor bp <- mkBp();
 
	rule start (!started);
		started <= True;
		$display("started");
	endrule

	rule run (started && programCount < 20);
		Bit#(1) taken = 0;
		case (programCount)
			0: taken = 'b0;	
			1: taken = 'b0;
			2: taken = 'b0;
			3: taken = 'b1;
			4: taken = 'b1;
			5: taken = 'b1;
			6: taken = 'b1;
			7: taken = 'b0;
			8: taken = 'b1;
			9: taken = 'b1;
			10: taken = 'b0;	
			11: taken = 'b1;
			12: taken = 'b0;
			13: taken = 'b1;
			14: taken = 'b0;
			15: taken = 'b1;
			16: taken = 'b0;
			17: taken = 'b0;
			18: taken = 'b1;
			19: taken = 'b0;
		endcase
		let to_take = bp.get_prediction;

		if (to_take == 1)
			$display("Prediction: Taken");
		else 
			$display("Prediction: Not Taken");

		bp.set_result(taken);
		if (taken == 1)
			$display("Actual: Taken");
		else
			$display("Actual: Not Taken");

		if (taken == to_take)
			correct <= correct + 1;
		total <= total + 1;

		programCount <= programCount + 1;
	endrule

	rule stop (programCount == 20 );
		$display("Finish");
		$display("correct prediction: %d", correct);
		$display("total instruction: %d", total);
		$finish(0);
	endrule
endmodule

endpackage
