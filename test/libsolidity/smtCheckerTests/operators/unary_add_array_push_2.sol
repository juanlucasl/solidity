contract C {
	struct S {
		int[][] d;
	}
	S[] data;
	constructor() {
		data.push();
		data.push();
		data[1].d.push();
		data[1].d.push();
		data[1].d.push();
		data[1].d.push();
	}
	function f() public {
		++data[1].d[3].push();
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (0-234): Contract invariants and external call properties for :C:\n!(data.length <= 1)\n!(data[1].d.length <= 3)\n
