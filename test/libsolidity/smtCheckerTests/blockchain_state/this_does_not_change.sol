contract C {
	address t;
	constructor() {
		t = address(this);
	}
	function inv() public view {
		assert(address(this) == t);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (0-130): Contract invariants and external call properties for :C:\n(((address(this) + ((- 1) * t)) <= 0) && ((address(this) + ((- 1) * t)) >= 0))\n
