contract C
{
	uint x;

	modifier m {
		require(x > 0);
		_;
	}

	function f() m public {
		assert(x > 0);
		x = x + 1;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (0-123): Contract invariants and external call properties for :C:\n(x <= 0)\n
