abstract contract D {
	function d() external virtual;
}

contract C {
	uint x;
	D d;
	function f() public {
		if (x < 10)
			++x;
	}
	function g() public {
		d.d();
		assert(x < 10);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (167-181): CHC: Assertion violation happens here.
// Info 1180: (57-187): Contract invariants and external call properties for :C:\n!(<errorCode> = 1)\n
