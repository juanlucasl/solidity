abstract contract D {
	function d() external virtual;
}

contract C {

	int x;
	D d;

	function set(int n) public {
		require(n < 100);
		x = n;
	}

	function f() public {
		x = 0;
		try d.d() {
			assert(x < 100); // should hold
		} catch {
			assert(x == 0); // should hold, all changes to x has been reverted
			assert(x == 1); // should fail
		}
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (315-329): CHC: Assertion violation happens here.\nCounterexample:\nx = 0, d = 0\n\nTransaction trace:\nC.constructor()\nState: x = 0, d = 0\nC.f()
// Info 1180: (57-354): Contract invariants and external call properties for :C:\n!(<errorCode> = 2)\n((!(x' >= 100) || ((x' + ((- 1) * x)) = 0)) && !(<errorCode> = 1))\n
