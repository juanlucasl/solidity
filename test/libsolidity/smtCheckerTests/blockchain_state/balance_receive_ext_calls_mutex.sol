interface I {
	function ext() external;
}

contract C {
	bool lock;
	modifier mutex {
		require(!lock);
		lock = true;
		_;
		lock = false;
	}
	function f(I _i) public mutex {
		uint x = address(this).balance;
		_i.ext();
		assert(address(this).balance == x); // should hold
		assert(address(this).balance < x); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (277-310): CHC: Assertion violation happens here.
// Info 1180: (43-331): Contract invariants and external call properties for :C:\n((!lock || (((:var 3).balances[address(this)] + ((- 1) * (:var 1).balances[address(this)])) <= 0)) && !(<errorCode> = 1) && (lock' || !lock) && (!lock || (((:var 3).balances[address(this)] + ((- 1) * (:var 1).balances[address(this)])) >= 0)))\n
