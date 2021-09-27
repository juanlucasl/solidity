contract c {
	bytes10[6] data2;
	function test() public view returns (bytes10 r2) {
		r2 = data2[4][5];
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (0-108): Contract invariants and external call properties for :c:\n!(data2.length <= 5)\n
