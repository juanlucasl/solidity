contract C
{
	enum D { Left, Right }
	D d;
	function f(D _a) public {
		require(_a == D.Left);
		d = D.Right;
		assert(d != _a);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (0-133): Contract invariants and external call properties for :C:\n((d = 0) || (d = 1))\n
