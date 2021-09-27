contract State {
	uint x;
	C c;
	function f() public view returns (uint) {
		return c.g();
	}
}

contract C {
	address owner;
	uint y;
	uint z;
	State s;
	bool insidef;

	constructor() {
		owner = msg.sender;
	}

	function zz() public {
		require(insidef);
		z = 3;
	}

	function f() public {
		require(!insidef);
		address prevOwner = owner;
		insidef = true;
		// s.f() cannot call zz() because it is `view`
		// and zz modifies the state.
		s.f();
		assert(z == y);
		assert(prevOwner == owner);
		insidef = false;
	}

	function g() public view returns (uint) {
		return y;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (97-581): Contract invariants and external call properties for :C:\n((!insidef || !(<errorCode> >= 2)) && (!(y <= 0) || (y' <= 0)) && (insidef' || !insidef))\n((!insidef || !(<errorCode> >= 3)) && (insidef' || !insidef))\n((insidef || (z <= 0)) && (y <= 0))\n
