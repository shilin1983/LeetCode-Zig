const std = @import("std");
const ListNode = @import("./linkedList.zig").ListNode;

pub fn addTwoNumbers(l1: ?*ListNode, l2: ?*ListNode) ?*ListNode {
    const head = std.heap.page_allocator.create(ListNode) catch unreachable;
    var current = head;
    var carry: i32 = 0;
    var l1_ptr = l1;
    var l2_ptr = l2;

    // * 遍历两个链表，逐位计算当前位置和，并与进位值相加
    // * 遍历结束后，如果还有进位值，则在链表末尾添加一个新的节点
    while (l1_ptr != null or l2_ptr != null or carry != 0) {
        var sum = carry;

        if (l1_ptr != null) {
            sum += l1_ptr.?.val;
            l1_ptr = l1_ptr.?.next;
        }
        if (l2_ptr != null) {
            sum += l2_ptr.?.val;
            l2_ptr = l2_ptr.?.next;
        }

        current.next = std.heap.page_allocator.create(ListNode) catch unreachable;
        current = current.next.?;
        current.* = .{
            .val = @mod(sum, 10),
        };
        carry = @divTrunc(sum, 10);
    }

    return head.next;
}
