const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    // Arrays are denoted by [N]T, where N is the number of elements in the array and T is the type of those elements (i.e., the array's child type).
    // For array literals, N may be replaced by _ to infer the size of the array.

    const a = [5]u8{ 'a', 'b', 'c', 'd', 'e' };
    const b = [_]u8{ 'f', 'g', 'h', 'i', 'j' };

    try stdout.print("a: {s}\nb: {s}\n", .{ a, b });

    // To get the size of an array, simply access the array's len field.
    try stdout.print("length_a: {}\nlength_b: {}\n", .{ a.len, b.len });
}
