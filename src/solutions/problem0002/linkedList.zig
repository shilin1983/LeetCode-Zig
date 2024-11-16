const std = @import("std");

pub const ListNode = struct { val: i32, next: ?*ListNode = null };

// * 整数数组转链表
pub fn int2List(nums: []const i32) ?*ListNode {
    const length = nums.len;
    var head: ?*ListNode = null;

    if (length != 0) {
        for (0..length) |i| {
            const node = std.heap.page_allocator.create(ListNode) catch unreachable;
            node.* = .{
                .val = nums[length - i - 1],
            };
            node.next = head;
            head = node;
        }
    }

    return head;
}
