contract C {
	bytes data;
	address sender;
	bytes4 sig;
	uint value;
	function f() public payable {
		data = msg.data;
		sender = msg.sender;
		sig = msg.sig;
		value = msg.value;

		g();
	}
	function g() internal view {
		assert(data.length >= 0); // should hold
		assert(uint160(sender) >= 0); // should hold
		assert(uint32(sig) >= 0); // should hold
		assert(value >= 0); // should hold

		assert(data.length == msg.data.length); // should hold with CHC
		assert(sender == msg.sender); // should hold with CHC
		assert(sig == msg.sig); // should hold with CHC
		assert(value == msg.value); // should hold with CHC

		assert(msg.value == 10); // should fail
	}
}
// ====
// SMTEngine: chc
// ----
// Warning 6328: (621-644): CHC: Assertion violation happens here.\nCounterexample:\ndata = [38, 18, 31, 240], sender = 0, sig = 638722032, value = 0\n\nTransaction trace:\nC.constructor()\nState: data = [], sender = 0, sig = 0, value = 0\nC.f(){ msg.data: [38, 18, 31, 240], msg.sender: 0, msg.sig: 638722032, msg.value: 0 }\n    C.g() -- internal call
