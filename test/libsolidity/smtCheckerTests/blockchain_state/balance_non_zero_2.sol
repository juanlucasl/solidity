contract C {
	constructor() payable {
		require(msg.value > 100);
	}
	function f() public view {
		assert(address(this).balance > 100); // should hold
		assert(address(this).balance > 200); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (153-188): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nC.constructor(){ value: 101 }\nC.f()
// Info 1180: (0-209): Contract invariants and external call properties for :C:\n!((:var 0).balances[address(this)] <= 100)\n
