package Circuit;

function Bit#(3) bitCountMachine(Bit#(5) in);
	Integer count = 0;
	for ( Integer i = 0; i < 5; i = i + 1) begin
		if (in[i] == 1 ) begin
			count = count+1;
		end
	end
	return fromInteger(count);
endfunction



function Bit#(3) priorityEncoder(Bit#(6) in);
	Integer lowestIndex = 0;
	for ( Integer i = 5; i >= 0; i = i - 1) begin
		if (in[i] == 1 ) begin
			lowestIndex = i;
		end
	end
	Bit#(3) ret = fromInteger(lowestIndex);
	return ret;
endfunction

endpackage
