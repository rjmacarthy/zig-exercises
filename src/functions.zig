const std = @import("std");

const expect = std.testing.expect;

// All function arguments are immutable - if a copy is desired the user must explicitly make one.
// Unlike variables, which are snake_case, functions are camelCase. Here's an example of declaring and calling a simple function.

fn addFive(x: u32) u32 {
    return x + 5;
}

test "function" {
    const y = addFive(10);
    try expect(@TypeOf(y) == u32);
    try expect(y == 15);
}

//Recursion is allowed:

fn fibonacci(n: u16) u16 {
    if (n == 0 or n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

test "fibonacci" {
    const x = fibonacci(10);
    try expect(x == 55);
}
