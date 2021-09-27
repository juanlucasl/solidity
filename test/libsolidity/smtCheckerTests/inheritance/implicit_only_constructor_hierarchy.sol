contract A {
	uint x;
	function h() public view {
		assert(x == 0);
	}
}

contract B is A {
	function g() public view {
		assert(x == 0);
	}
}

contract C is B {
	function f() public view {
		assert(x == 0);
	}
}
// ====
// SMTEngine: all
// SMTSolvers: z3
// ----
// Info 1180: (0-72): Contract invariants and external call properties for :A:\n(x <= 0)\n
// Info 1180: (74-142): Contract invariants and external call properties for :B:\n(x <= 0)\n
// Info 1180: (144-212): Contract invariants and external call properties for :C:\n(x <= 0)\n
