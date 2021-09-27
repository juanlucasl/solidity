contract C {
	uint256[] x;
	constructor() { x.push(42); }
	function f() public {
		x.push(23);
		assert(x[0] == 42 || x[0] == 23);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (0-135): Contract invariants and external call properties for :C:\n(!((x[x.length] := 23)[0] >= 43) && !((x[x.length] := 23)[0] <= 41))\n
