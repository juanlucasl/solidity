contract C {
	uint x;
	function f() public {
		x = 0;
		((inc))();
		assert(x == 1); // should hold
	}

	function inc() internal returns (uint) {
		require(x < 100);
		return ++x;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (0-184): Contract invariants and external call properties for :C:\n((x = 0) || (x = 1))\n
