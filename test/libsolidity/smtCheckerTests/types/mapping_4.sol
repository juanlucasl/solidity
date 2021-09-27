contract C
{
	mapping (bool => bool) map;
	function f(bool x) public view {
		require(x);
		assert(x != map[x]);
	}
}
// ====
// SMTEngine: all
// SMTSolvers: z3
// ----
// Info 1180: (0-117): Contract invariants and external call properties for :C:\n!map[true]\n
