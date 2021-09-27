contract C {
	mapping (uint => uint[][][]) public m;

	constructor() {
		m[0].push();
		m[0].push();
		m[0][1].push();
		m[0][1].push();
		m[0][1].push();
		m[0][1][2].push();
		m[0][1][2].push();
		m[0][1][2].push();
		m[0][1][2].push();
		m[0][1][2][3] = 42;
	}

	function f() public view {
		uint y = this.m(0,1,2,3);
		assert(y == m[0][1][2][3]); // should hold
		// Disabled because of Spacer seg fault
		//assert(y == 1); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: (0-447): Contract invariants and external call properties for :C:\n!(m[0].length <= 1)\n!(m[0][1].length <= 2)\n!(m[0][1][2].length <= 3)\n
