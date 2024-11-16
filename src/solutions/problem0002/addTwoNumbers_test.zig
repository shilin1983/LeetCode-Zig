const std = @import("std");
const int2List = @import("./linkedList.zig").int2List;
const addTwoNumbers = @import("./addTwoNumbers.zig").addTwoNumbers;

const Case = struct {
    nums1: []const i32,
    nums2: []const i32,
    expected: []const i32,
};

test "2.两数相加" {
    const cases: [3]Case = .{
        .{
            .nums1 = &.{ 2, 4, 3 },
            .nums2 = &.{ 5, 6, 4 },
            .expected = &.{ 7, 0, 8 },
        },
        .{
            .nums1 = &.{0},
            .nums2 = &.{0},
            .expected = &.{0},
        },
        .{
            .nums1 = &.{ 9, 9, 9, 9, 9, 9, 9 },
            .nums2 = &.{ 9, 9, 9, 9 },
            .expected = &.{ 8, 9, 9, 9, 0, 0, 0, 1 },
        },
    };

    for (cases) |c| {
        var expected = int2List(c.expected);
        var actual = addTwoNumbers(int2List(c.nums1), int2List(c.nums2));

        while (expected != null and actual != null) {
            try std.testing.expectEqual(
                expected.?.val,
                actual.?.val,
            );
            expected = expected.?.next;
            actual = actual.?.next;
        }
    }
}
