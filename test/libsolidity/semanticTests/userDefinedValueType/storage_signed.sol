type MyInt is int16;
contract C {
    bytes2 first = "ab";
    MyInt public a = MyInt.wrap(-2);
    bytes2 third = "ef";
    function direct() external returns (MyInt) {
        return a;
    }
    function indirect() external returns (int16) {
        return MyInt.unwrap(a);
    }
    function toMemDirect() external returns (MyInt[1] memory) {
        return [a];
    }
    function toMemIndirect() external returns (int16[1] memory) {
        return [MyInt.unwrap(a)];
    }
    function div() external returns (int16) {
        return MyInt.unwrap(a) / 2;
    }
}
// ====
// compileViaYul: also
// ----
// a() -> -2
// direct() -> -2
// indirect() -> -2
// toMemDirect() -> -2
// toMemIndirect() -> -2
// div() -> -1
