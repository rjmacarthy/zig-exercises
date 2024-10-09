const std = @import("std");

pub fn main() !void {

    // Value assignment has the following syntax: (const|var) identifier[: type] = value.

    // const indicates that identifier is a constant that stores an immutable value.
    // var indicates that identifier is a variable that stores a mutable value.
    // : type is a type annotation for identifier, and may be omitted if the data type of value can be inferred.

    const constant: i32 = 1;
    var variable: u32 = 5000;
    variable = 10;

    const inffered_constant = @as(i32, 5);
    var inferred_variable = @as(u32, 5000);
    inferred_variable = 10;

    // Constants and variables must have a value.
    // If no known value can be given, the undefined value, which coerces to any type, may be used as long as a type annotation is provided.
    const a: i32 = undefined;
    var b: u32 = undefined;
    b = 10;

    const stdout = std.io.getStdOut().writer();

    try stdout.print("{}\n", .{a});
    try stdout.print("{}\n", .{b});
    try stdout.print("{}\n", .{constant});
    try stdout.print("{}\n", .{variable});
    try stdout.print("{}\n", .{inffered_constant});
    try stdout.print("{}\n", .{inferred_variable});
}
