package Tb;
import Circuit::*;

(* synthesize *)
module mkTbBCM();
	Reg#(Bit#(6)) cnt <- mkReg(0);
	Reg#(Bool) started <- mkReg(False);

	rule start (!started);
		$display("abcde||s");
		$display("----------");
		started <= True;
	endrule
	
	rule count (started);
		cnt <= cnt + 1;
	endrule

	rule print (cnt < (1<<5) && started);
		let out = bitCountMachine(cnt[4:0]);
		$display("%b||%b", cnt[4:0], out);
		$display("----------");
	endrule

	rule finish (cnt == (1<<5) && started);
		$finish;
	endrule
endmodule

(* synthesize *)
module mkTbPE();
	Reg#(Bit#(7)) cnt <- mkReg(0);
	Reg#(Bool) started <- mkReg(False);

	rule start (!started);
		$display("a     ||d");
		$display("-----------");
		started <= True;
	endrule
	
	rule count (started);
		cnt <= cnt + 1;
	endrule

	rule print (cnt < (1<<6) && started);
		let out = priorityEncoder(cnt[5:0]);
		$display("%b||%b", cnt[5:0], out);
		$display("-----------");
	endrule

	rule finish (cnt == (1<<6) && started);
		$finish;
	endrule
endmodule

endpackage
