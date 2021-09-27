abstract contract D {
	function d() external virtual;
}

contract C {
	address t;
	constructor() {
		t = address(this);
	}
	function f(D d) public {
		address a = address(this);
		d.d();
		assert(address(this) == t);
		assert(a == t);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (57-239): Contract invariants and external call properties for :C:\n((!(<errorCode> >= 2) || !((t + ((- 1) * address(this))) = 0)) && (!((t + ((- 1) * address(this))) <= 0) || ((t' + ((- 1) * address(this))) <= 0)) && (!((t + ((- 1) * address(this))) >= 0) || ((address(this) + ((- 1) * t')) <= 0)))\n(((<errorCode> <= 0) || !((t + ((- 1) * address(this))) = 0)) && (!((t + ((- 1) * address(this))) <= 0) || ((t' + ((- 1) * address(this))) <= 0)) && (!((t + ((- 1) * address(this))) >= 0) || ((address(this) + ((- 1) * t')) <= 0)))\n(((address(this) + ((- 1) * t)) <= 0) && ((address(this) + ((- 1) * t)) >= 0))\n
