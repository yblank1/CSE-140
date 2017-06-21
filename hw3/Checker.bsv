package Checker;

function Bit#(1) oplus(Bit#(1) l, Bit#(1) r);

  return (l^r);   
endfunction

function Bit#(1) origin(Bit#(1) a,
			Bit#(1) b,
			Bit#(1) c);
	return oplus(oplus(oplus(oplus((a&b&c),
(a|(~b)|c)),(b|c)&b),(~a)&b),b|(~c));
endfunction

function Bit#(1) jims(Bit#(1) a,
		      Bit#(1) b,
		      Bit#(1) c);
	Bit#(3) t={a,b,c};
	UInt#(3) t_index = unpack(t);
  return pack(t_index == 1 || t_index == 2 || t_index == 5 );
endfunction

endpackage
