const std = @import("std");
const expect = std.testing.expect;
// An error set is like an enum (details on Zig's enums later), where each error in the set is a value.
// There are no exceptions in Zig; errors are values. Let's create an error set.

const FileOpenError = error{
    AccessDenied,
    OutOfMemory,
    FileNotFound,
};

const AllocationError = error{OutOfMemory};

test "coerce error from subset to a suprtset" {
    const err: FileOpenError = AllocationError.OutOfMemory;
    try expect(err == FileOpenError.OutOfMemory);
}

// An error set type and another type can be combined with the ! operator to form an error union type.

test "error union" {
    const maybe_error: AllocationError!u16 = 10;
    const no_error = maybe_error catch 0;

    try expect(@TypeOf(no_error) == u16);
    try expect(no_error == 10);
}

// payload capturing

fn failFunction() error{Oops}!void {
    return error.Oops;
}

test "returning error" {
    failFunction() catch |err| {
        try expect(err == error.Oops);
        return;
    };
}

fn failFn() error{Oops}!i32 {
    try failFunction();
    return 12;
}

// errdefer

var problems: u32 = 98;

fn failFnCounter() error{Oops}!void {
    errdefer problems += 1; // runs after the function has finished.
    try failFunction();
}

test "errdefer" {
    failFnCounter() catch |err| {
        try (expect(err == error.Oops));
        try (expect(problems == 99));
    };
}

// error inferrence

fn createFile() !void {
    return error.AccessDenied;
}

test "inferred error set" {
    const x: error{AccessDenied}!void = createFile();
    _ = x catch {};
}

// error sets can be merged too

const A = error{ NoDir, PathNotFound };
const B = error{ A, Something };
const X = A || B;

test "err merged" {
    const x = X.NoDir;
    try expect(x == X.NoDir);
}
