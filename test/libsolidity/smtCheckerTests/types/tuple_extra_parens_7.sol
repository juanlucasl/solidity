contract C {
	function g() internal pure returns (uint, uint) {
		return (2, 3);
	}
	function f() public {
		(address(1).call(""));
		(uint x, uint y) = ((g()));
		assert(x == 2);
		assert(y == 3);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (0-202): Contract invariants and external call properties for :C:\n!(<errorCode> >= 2)\n(<errorCode> <= 0)\n
