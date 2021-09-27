contract C {
	bool lock = true;
	function f() public {
		lock = false;
		g();
		lock = true;
	}
	function g() public payable {
		require(lock == false);
		assert(msg.value == 0);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (0-183): Contract invariants and external call properties for :C:\nlock\n
