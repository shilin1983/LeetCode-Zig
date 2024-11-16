const std = @import("std");

pub fn findMedianSortedArrays(nums1: []const i32, nums2: []const i32) f64 {
    var merged = std.ArrayList(i32).init(std.heap.page_allocator);
    defer merged.deinit();

    const len1 = nums1.len;
    const len2 = nums2.len;
    var i: usize = 0;
    var j: usize = 0;

    // * 合并两个数组，并排序
    while (i < len1 and j < len2) {
        if (nums1[i] < nums2[j]) {
            merged.append(nums1[i]) catch unreachable;
            i += 1;
        } else {
            merged.append(nums2[j]) catch unreachable;
            j += 1;
        }
    }

    // * 将剩余的数组元素添加到合并后的数组中
    while (i < len1) {
        merged.append(nums1[i]) catch unreachable;
        i += 1;
    }
    while (j < len2) {
        merged.append(nums2[j]) catch unreachable;
        j += 1;
    }

    const mid = merged.items.len / 2;
    if (merged.items.len % 2 == 0) {
        // * 如果合并后的数组长度为偶数，则中位数为中间两个数的平均值
        return @as(f64, @floatFromInt(merged.items[mid - 1] + merged.items[mid])) / 2.0;
    } else {
        // * 如果合并后的数组长度为奇数，则中位数为中间的数
        return @as(f64, @floatFromInt(merged.items[mid]));
    }
}
