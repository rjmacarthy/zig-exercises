// For loops are used to iterate over arrays (and other types, to be discussed later).
// For loops follow this syntax. Like while, for loops can use break and continue.
// Here, we've had to assign values to _, as Zig does not allow us to have unused values.

test "for loops" {
    const string = [_]u8{ 'a', 'b', 'c' };

    for (string, 0..) |char, index| {
        _ = char;
        _ = index;
    }

    for (string) |char| {
        _ = char;
    }

    for (string, 0..) |_, index| {
        _ = index;
    }

    for (string) |_| {}
}
