const std = @import("std");
const findMedianSortedArrays = @import("./medianOfTwoSortedArrays.zig").findMedianSortedArrays;

const Case = struct {
    nums1: []const i32,
    nums2: []const i32,
    expected: f64,
};

test "4.寻找两个正序数组的中位数" {
    const cases: [2]Case = .{
        .{
            .nums1 = &.{ 1, 3 },
            .nums2 = &.{2},
            .expected = 2.0,
        },
        .{
            .nums1 = &.{ 1, 2 },
            .nums2 = &.{ 3, 4 },
            .expected = 2.5,
        },
    };

    for (cases) |c| {
        try std.testing.expectEqual(
            c.expected,
            findMedianSortedArrays(c.nums1, c.nums2),
        );
    }
}
