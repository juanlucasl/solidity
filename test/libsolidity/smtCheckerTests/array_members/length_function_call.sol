contract C {
	uint[] arr;
	function f() public view {
		assert(arr.length == g().length);
	}
	function g() internal pure returns (uint[] memory) {
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (0-151): Contract invariants and external call properties for :C:\n(arr.length <= 0)\n
