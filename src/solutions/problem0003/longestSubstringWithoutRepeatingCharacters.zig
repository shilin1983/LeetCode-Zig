const std = @import("std");

pub fn lengthOfLongestSubstring(s: []const u8) i32 {
    var hash_table = std.AutoHashMap(u8, i32).init(std.heap.page_allocator);
    defer hash_table.deinit();

    var left: i32 = 0;
    var right: i32 = 0;
    var max_length: i32 = 0;

    while (right < s.len) {
        const char = s[@intCast(right)];

        // * 如果哈希表中存在当前元素，则移动滑动窗口左边界到当前元素的下一个位置
        if (hash_table.contains(char)) {
            left = @max(left, hash_table.get(char).? + 1);
        }

        // * 将当前元素及其索引插入哈希表
        hash_table.put(char, right) catch unreachable;
        // * 移动滑动窗口右边界
        right += 1;
        // * 计算当前滑动窗口最大长度
        max_length = @max(max_length, right - left);
    }

    return max_length;
}
