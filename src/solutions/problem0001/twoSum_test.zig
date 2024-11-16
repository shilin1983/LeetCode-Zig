const std = @import("std");
const twoSum = @import("./twoSum.zig").twoSum;

const Case = struct { nums: []const i32, target: i32, expected: []const i32 };

test "1.两数之和" {
    const cases: [3]Case = .{
        .{
            .nums = &.{ 2, 7, 11, 15 },
            .target = 9,
            .expected = &.{ 0, 1 },
        },
        .{
            .nums = &.{ 3, 2, 4 },
            .target = 6,
            .expected = &.{ 1, 2 },
        },
        .{
            .nums = &.{ 3, 3 },
            .target = 6,
            .expected = &.{ 0, 1 },
        },
    };

    for (cases) |c| {
        try std.testing.expectEqualSlices(
            i32,
            c.expected,
            twoSum(c.nums, c.target),
        );
    }
}
