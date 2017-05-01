package Tb;
import Adder::*;

(* synthesize *)
module mkTb();
	Reg#(Bit#(4)) cnt <- mkReg(0);
	Reg#(Bool) started <- mkReg(False);

	rule start (!started);
		$display("a|b|c_in||c|s");
		$display("-------------");
		started <= True;
	endrule
	
	rule count (started);
		cnt <= cnt + 1;
	endrule

	rule print (cnt < 8 && started);
		let a = cnt[2];
		let b = cnt[1];
		let c_in = cnt[0];
		let sc = fa(a, b, c_in);
		$display("%b|%b|   %b||%b|%b", a, b, c_in, sc[1], sc[0]);
		$display("-------------");
	endrule

	rule finish (cnt == 8 && started);
		$finish;
	endrule
endmodule

endpackage
