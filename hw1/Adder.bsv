package Adder;

function Bit#(2) ha(Bit#(1) a, Bit#(1) b);
	Bit#(1) s = a ^ b;
	Bit#(1) c = a & b;
	return {c,s};
endfunction

function Bit#(2) fa(Bit#(1) a, Bit#(1) b, Bit#(1) c_in);
	Bit#(2) ab  = ha(a, b);
	Bit#(2) abc = ha(ab[0], c_in);
	Bit#(1) c_out = abc[1] | ab[1];
	return {c_out, abc[0]};
endfunction

endpackage
