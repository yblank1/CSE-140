package Tb;
import Checker::*;

(* synthesize *)
module mkTb();
	Reg#(Bit#(4)) t <- mkReg(0);
	Reg#(Bool) started <- mkReg(False);

	rule start (!started);
		started <= True;
	endrule

	rule check(t < 8 && started && origin( t[2], t[1], t[0])== jims( t[2], t[1], t[0]));
		t <= t + 1;
	endrule

	rule report_error ( t < 8 && started && origin(t[2], t[1], t[0]) != jims(t[2], t[1], t[0]));
		$display("mismatch when a=%d b=%d c=%d",t[2], t[1], t[0]);
		$display("origin =%d",origin(t[2], t[1], t[0]));
		$display("jims =%d",jims(t[2], t[1], t[0]));
		$finish;	
	endrule

	rule finish(t ==8 && started);
		$display("PASSED");
		$finish;
	endrule
endmodule

endpackage
